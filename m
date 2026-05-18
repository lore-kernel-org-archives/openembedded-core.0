Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C78DCD4F55
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:33:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5492.1779100378493551744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=HlqRzr4z;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF57E4617
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D7D33FA21
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779100378; bh=f/zRDAX5F9yTPcam873ZIQ64KPXsJVmC/n7lZ8HQIos=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HlqRzr4zws1P2wGjJvfCp5L9yC12Pc1qpQAOXjXlHuob8iXLa3cnDLGjLnos0Jh/F
	 aEKqpX+8yOnErWesBUzw3yU8om5AT6LkVN8D2kiMv6kmjOHWQa7+Hk2KQlxNf+PRsV
	 pxJNaYqdC+UJoS04OP05O0jKKrIoyGVXSo7XK0BE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] groff: build less in groff-native
Date: Mon, 18 May 2026 11:32:49 +0100
Message-ID: <20260518103249.592747-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518103249.592747-1-ross.burton@arm.com>
References: <20260518103249.592747-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237216

When building groff-native we only really need enough of groff to build
manpages, and don't need documentation or extra tools.

Patch the Makefile to stop building the doc and contrib directories,
which both take time and have incomplete build dependencies that cause
intermittent failures[1][2].

This makes groff-native faster to build:

  groff-native    do_compile   -30.6s   -33.7%     90.9s -> 60.3s

And some tools are removed, which I don't believe are needed by anything
we build:

  /usr/bin/chem was removed
  /usr/bin/eqn2graph was removed
  /usr/bin/gdiffmk was removed
  /usr/bin/gperl was removed
  /usr/bin/gpinyin was removed
  /usr/bin/mmroff was removed
  /usr/bin/pic2graph was removed
  /usr/share/groff/1.24.1/tmac/chem.pic was removed
  /usr/share/groff/1.24.1/tmac/hdmisc.tmac was removed
  /usr/share/groff/1.24.1/tmac/hdtbl.tmac was removed
  /usr/share/groff/1.24.1/tmac/mm was removed
  /usr/share/groff/1.24.1/tmac/mm/0.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/4.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/5.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/ms.cov was removed
  /usr/share/groff/1.24.1/tmac/mm/se_ms.cov was removed
  /usr/share/groff/1.24.1/tmac/mmse.tmac was removed
  /usr/share/groff/1.24.1/tmac/mm.tmac was removed
  /usr/share/groff/1.24.1/tmac/mom.tmac was removed
  /usr/share/groff/1.24.1/tmac/mse.tmac was removed
  /usr/share/groff/1.24.1/tmac/m.tmac was removed
  /usr/share/groff/1.24.1/tmac/om.tmac was removed
  /usr/share/groff/1.24.1/tmac/refer-mm.tmac was removed
  /usr/share/groff/1.24.1/tmac/rfc1345.tmac was removed
  /usr/share/groff/1.24.1/tmac/sboxes.tmac was removed

[1] oe-core d1a02bdd242 ("groff: Fix occasional build race failure")
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16279

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../groff/files/build-less.patch              | 24 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.24.1.bb   |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/build-less.patch

diff --git a/meta/recipes-extended/groff/files/build-less.patch b/meta/re=
cipes-extended/groff/files/build-less.patch
new file mode 100644
index 00000000000..dc560fbb309
--- /dev/null
+++ b/meta/recipes-extended/groff/files/build-less.patch
@@ -0,0 +1,24 @@
+Build less bits of groff to save time and reduce random build
+failures from missing dependencies in this logic.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+--- a/Makefile.am~	2026-05-15 13:23:08.000000000 +0100
++++ b/Makefile.am	2026-05-15 13:29:17.053867035 +0100
+@@ -556,15 +556,0 @@
+-include $(top_srcdir)/contrib/chem/chem.am
+-include $(top_srcdir)/contrib/eqn2graph/eqn2graph.am
+-include $(top_srcdir)/contrib/gdiffmk/gdiffmk.am
+-include $(top_srcdir)/contrib/glilypond/glilypond.am
+-include $(top_srcdir)/contrib/gperl/gperl.am
+-include $(top_srcdir)/contrib/gpinyin/gpinyin.am
+-include $(top_srcdir)/contrib/grap2graph/grap2graph.am
+-include $(top_srcdir)/contrib/hdtbl/hdtbl.am
+-include $(top_srcdir)/contrib/install-font/install-font.am
+-include $(top_srcdir)/contrib/mm/mm.am
+-include $(top_srcdir)/contrib/mom/mom.am
+-include $(top_srcdir)/contrib/pic2graph/pic2graph.am
+-include $(top_srcdir)/contrib/rfc1345/rfc1345.am
+-include $(top_srcdir)/contrib/sboxes/sboxes.am
+-include $(top_srcdir)/doc/doc.am
diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-e=
xtended/groff/groff_1.24.1.bb
index 74e422c6af4..166998c6c66 100644
--- a/meta/recipes-extended/groff/groff_1.24.1.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -15,6 +15,8 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://builddep.patch \
            "
=20
+SRC_URI:append:class-native =3D "file://build-less.patch"
+
 SRC_URI[sha256sum] =3D "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7d=
f8ba4c7b41e7cfd8"
=20
 DEPENDS =3D "bison-native groff-native"
--=20
2.43.0



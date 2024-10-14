Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5552FD16254
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53718.1728908700588300578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCB671007
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:25:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0F6D3F71E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:24:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] groff: fix rare build race in hdtbl
Date: Mon, 14 Oct 2024 13:24:48 +0100
Message-Id: <20241014122448.2290641-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014122448.2290641-1-ross.burton@arm.com>
References: <20241014122448.2290641-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205763

It's possible to build the hdtbl examples before grn has been build:

groff: error: couldn't exec grn: No such file or directory

Backport a dependency fix from upstream.

[ YOCTO #15610 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Sava=
nnah-66316-missing-grn-dep.patch

diff --git a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66=
316-missing-grn-dep.patch b/meta/recipes-extended/groff/files/0001-hdtbl-=
Fix-Savannah-66316-missing-grn-dep.patch
new file mode 100644
index 00000000000..d9455af2ac4
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-mis=
sing-grn-dep.patch
@@ -0,0 +1,38 @@
+From 12169aa269341753d491a69e9adb86c58dca039a Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Thu, 10 Oct 2024 18:17:08 -0500
+Subject: [PATCH] [hdtbl]: Fix Savannah #66316 (missing `grn` dep).
+
+* hdtbl.am (HDTBLPROCESSEDEXAMPLEFILES): Declare dependency on `grn`;
+  because `-I` flags are used, it is dragged in even though not
+  explicitly needed.  Resolves race against `grn`'s availability in the
+  build tree.
+
+Fixes <https://savannah.gnu.org/bugs/?66316>.  Thanks to Ross Burton for
+the report.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ contrib/hdtbl/ChangeLog | 10 ++++++++++
+ contrib/hdtbl/hdtbl.am  |  3 +--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
+index b6c334c18..3c37174f2 100644
+--- a/contrib/hdtbl/hdtbl.am
++++ b/contrib/hdtbl/hdtbl.am
+@@ -119,9 +119,8 @@ SUFFIXES +=3D .roff .in .ps
+ 	&& sed -e "s|[@]fontdir[@]|$(fontdir)|" \
+ 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
+=20
+-
+ $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
+-  grops font/devps/stamp contrib/hdtbl/examples/common.roff
++  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
+=20
+ uninstall_groffdirs: uninstall-hdtbl-hook
+ uninstall-hdtbl-hook:
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-e=
xtended/groff/groff_1.23.0.bb
index 0fc4f831d8f..8a163214795 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
+           file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
            "
=20
 SRC_URI[sha256sum] =3D "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb=
2d30ae3863511c13"
--=20
2.34.1



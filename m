Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FE7C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:33:29 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.26087.1657528404967606460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=Qj29a4pW;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 09EF9E6BB7;
	Mon, 11 Jul 2022 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657528402; bh=tADF9lxpFCyNhEhfAQG70Oa0lJWZxibz1GWCxTYIauc=;
	h=From:To:Cc:Subject:Date;
	b=Qj29a4pWal1UOClKtG/BjV5/7qZnYCTZTXm9v6PDt/U74NqO+LxUUp63BqRTvGn3v
	 lGneTUdyJfyXSNMJKT7+p844YlLN+DXK5kfdssEtm8vkN6KIY8E10NnfW0IB+hayNt
	 6m/ePMY5SBihAz9vciwirzGCimU26JMuqHaQMRZuaqeKvxUY3yF8ndkbs1lHlotvxi
	 Xo0jfEkAdA8TsSDTpiRSZi3kbr3COFUS+jeiar5cbjjQozw6PLj2cGTd2P5uQ4qwGw
	 0rDSpTTPBSS2GaQf//7NMOaY1rOqiO+sNvDv6+F+DyA69ljqupLb9TTaFcLZ8202Ev
	 fKxFdv+4Pkl3w==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [OE-core] [PATCH 1/2] zlib: split src_uri into inc file
Date: Mon, 11 Jul 2022 10:33:08 +0200
Message-Id: <20220711083309.1749253-1-sean@geanix.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167861

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-core/zlib/zlib.inc       |  4 ++++
 meta/recipes-core/zlib/zlib_1.2.12.bb | 18 +++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib.inc

diff --git a/meta/recipes-core/zlib/zlib.inc b/meta/recipes-core/zlib/zli=
b.inc
new file mode 100644
index 0000000000..2bcc32071a
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib.inc
@@ -0,0 +1,4 @@
+SRC_URI =3D "https://zlib.net/${BP}.tar.xz"
+UPSTREAM_CHECK_URI =3D "http://zlib.net/"
+
+SRC_URI[sha256sum] =3D "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0=
090441dac57def18"
diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.12.bb
index e921703137..ba986d8cf2 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -6,16 +6,16 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endline=3D23;md5=3D537=
7232268e952e9ef63bc555f7aa6c0"
=20
-SRC_URI =3D "https://zlib.net/${BP}.tar.xz \
-           file://cc.patch \
-           file://ldflags-tests.patch \
-           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
-           file://run-ptest \
-           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-func=
tio.patch \
-           "
-UPSTREAM_CHECK_URI =3D "http://zlib.net/"
+include zlib.inc
+
+SRC_URI +=3D "file://cc.patch \
+            file://ldflags-tests.patch \
+            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
+            file://run-ptest \
+            file://0001-Correct-incorrect-inputs-provided-to-the-CRC-fun=
ctio.patch \
+"
=20
-SRC_URI[sha256sum] =3D "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0=
090441dac57def18"
+UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
 CFLAGS +=3D "-D_REENTRANT"
=20
--=20
2.36.1



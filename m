Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB6CCA47C
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:55:35 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.5590.1657886126127601830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=NiEPOvSB;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 79F2FE7940;
	Fri, 15 Jul 2022 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657886122; bh=N9VbZ4WlgN8FMYAbnbZTJ+/VnUksMspFa3jI+eQjPSw=;
	h=From:To:Cc:Subject:Date;
	b=NiEPOvSBILCTVdIgDPYHEt9IwRU6wlpGFWTIYiTp6etlg4t41B8SzfPjjRLP10S4q
	 j3Z4a2WAuHQWKbftg2uflcpqpeIwaMs7TeB6fcBS69rQaaOvzOW4+6ChQ5W0DLNLPg
	 FzuEYaB7Y9Y59v8M54Kj5gqtBx+tIZjdKsZhW12432xHX9MjwacKDcduYBJmPZpQRe
	 yfW8t1agO7umIpRzK640rycdRc34E9uah3Snn+ewJSb60yhcxl2vwm9StUuK0R5sFR
	 ju33pIqRhM7jvo5enY2VoY4ZRTQThHPDtimV8GqZBwl3fMQi1Em3DF6z8I2D/8nnhx
	 t/SoMvXTu/qhw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org,
	denis@denix.org,
	richard.purdie@linuxfoundation.org,
	raj.khem@gmail.com
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Date: Fri, 15 Jul 2022 13:55:14 +0200
Message-Id: <20220715115515.4012984-1-sean@geanix.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168059

This is done in preparation for adding packages from the zlib contrib
directory.
Unfortunatly it's not possible to add these via pkgconfig.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
With this we are maintaining the same verison number for both zlib and
minizip in the recipe name. Would it be better to have it in the inc
file?

PV =3D "1.2.12" ?

 meta/recipes-core/zlib/zlib.inc       |  4 ++++
 meta/recipes-core/zlib/zlib_1.2.12.bb | 18 +++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib.inc

diff --git a/meta/recipes-core/zlib/zlib.inc b/meta/recipes-core/zlib/zli=
b.inc
new file mode 100644
index 0000000000..b607a82312
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib.inc
@@ -0,0 +1,4 @@
+SRC_URI =3D "https://zlib.net/zlib-${PV}.tar.xz"
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
2.37.0



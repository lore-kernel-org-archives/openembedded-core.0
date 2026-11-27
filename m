Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13639.1795775161589634999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 02:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fx/hyMu1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7979C6223B
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB4176049C
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1389711E692FC;
	Fri, 27 Nov 2026 11:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795775158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Nx258saaoCpSGyEdXNCIW/O8v8KYUiYVoTFGx57pb7E=;
	b=fx/hyMu1JGKG5ujh2i2T77TzIJY9v11tjCodZSG7an7xVoAfW/OBdh+zI6WPSSaW4MNQAV
	WaW6Ebc87cwH3UI5dPRLurjqvO8g6z0X60gyA5aSOjxbanJshusC3tqqtslGG4VCGyAZSr
	nt9DwYC+UJaZQZzGWd6BieYTlri1hmnx47+TrptMnSCaALCUwZRAiyLCL5f4XAYbiQ9dwu
	3KhZfCGabHpSZLTD52Oq7Gy4GvcvACX4P7otR1FLMoD4FbPZCuw6yNAI++AelWDY+hyXn/
	wV+QB3GxIqAjrPAzivZWwI73ouyXjo0374Ua2404ZNMJGGKPM3BbuoseSoau3Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 27 Nov 2026 11:25:53 +0100
Subject: [PATCH v2] zstd: add bench, compress, dict, trace to PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-zstd-1-6-0-v2-1-37210d2fc042@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NwQrCMBBEf6Xs2UgSmoV68j+kB5Ns7Yo2kqRFL
 f1304rgZeDBzJsZEkWmBIdqhkgTJw5DAb2rwPXn4UKCfWHQUqNSuhbvlL1QAoUUqBUhGi2p9lA
 Gj0gdPzfZqf1yGu2VXF4Na6PnlEN8bW+TWns/sfkXT6pEYzojHdrGEx5tCPnGw96FO7TLsnwAP
 Qzr8bgAAAA=
X-Change-ID: 20261124-zstd-1-6-0-621e66520e4d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WcVldhS8tPBDDz0KtRYZqAkbXdLUKCsBzfowb8tCkts=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrCVqyULDWUnbsj2eysysRg5mvK4ZWQkWlpjxm1
 BGdDBeLeWWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawlasgAKCRDRgEFAKaOo
 NpjUD/4k/5MFrIFCARADMhzn9rwAP6QQGTpZtmi0Ovyig/H+A6SfoYXqsuXNX6WCykXzQxbl8h3
 rPWGXTKlxd6jgxVFVGdp7HINFZ4t1eNiHXxdgQ6p3UCAfnJi6WSqce5Mvn6Qq613bj3B5w+CE1C
 N+rXIih/swhZKcENDLhAr1H6UnppsJgXmUPnME9Zaw5NpHCMfd7vyO+z345qQgE4dL035a6e0QN
 KtBMBbu+Vtm2m5+uSTIPMKbBI41BtUi4YeHcmnSIrPfn7i34dTo8POy9vyWvqujGtsHuWl/4Pjd
 yqWA4N3lYEpFaGCq5uYb33lO9yH9i0JS1TkOB7toBn8tMPr0VkPxHrSQzgMb2uDTR9z1v1xlLQE
 MEkZhbdJI7Zuf+ehRMSwb6UjfbFBjpSUzBB0Azlu5H018VlFGJhHgvXQwaPrGNdxLuvpkthoWcR
 3LHXdftkFv/4mTFexZmoZvLm8SQB5Yujf4aiLpxyesAvqTRSfSvtWgcfaO3Y81Kp+4v8IXJWEWi
 Dw8lLDwrzjl0rWujGvq0lcQH6kE7henyhCyMsJPzB8woEq+UcGBbMfgeVOYVgge4L6Gkhwwj8J1
 M5x+cxAcSnYaOYKAVSjsdrDcZvkvntctGtu79G/p/gjbfp0tyxZxiHagv4F7oWhNgQL4KHkH15y
 fA9GoYDCYsg2wgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251369

Add some PACKAGECONFIG knobs matching zstd's configuration knobs:

- bench toggles the integrated benchmark module (now disabled by default)
- compress toggles zstd compression support (enabled by default)
- dict compiles zstd with support for the integrated dictionary builder
  (now disabled by default)
- trace can display a stack backtrace when execution
  generates a runtime exception (now disabled by default)

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Patch 1/2 was merged.
- Adjust PACKAGECONFIG options names and the ones enabled by default.
- My mistake, but some options have to be passed in MOREFLAGS with Zstd,
  so define it at the recipe-level and set it based on PACKAGECONFIG.
- Link to v1: https://patch.msgid.link/20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com
---
 meta/recipes-extended/zstd/zstd_1.6.0.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.6.0.bb b/meta/recipes-extended/zstd/zstd_1.6.0.bb
index 6e4e07050a..925c3592a9 100644
--- a/meta/recipes-extended/zstd/zstd_1.6.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -22,9 +22,13 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "compress"
+PACKAGECONFIG[bench] = ""
+PACKAGECONFIG[compress] = ""
+PACKAGECONFIG[dict] = ""
 PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
 PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[trace] = ""
 PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
 
 # See programs/README.md for how to use this
@@ -32,8 +36,17 @@ ZSTD_LEGACY_SUPPORT ??= "4"
 
 EXTRA_OEMAKE += "V=1"
 
+# Extra configuration tweaks have to be passed in MOREFLAGS when compiling
+# zstd, which we define using our PACKAGECONFIG definition.
+ZSTD_MOREFLAGS = "\
+    ${@bb.utils.contains("PACKAGECONFIG", "bench", "", "-DZSTD_NOBENCH", d)} \
+    ${@bb.utils.contains("PACKAGECONFIG", "compress", "", "-DZSTD_NOCOMPRESS", d)} \
+    ${@bb.utils.contains("PACKAGECONFIG", "dict", "", "-DZSTD_NODICT", d)} \
+    ${@bb.utils.contains("PACKAGECONFIG", "trace", "", "-DZSTD_NOTRACE", d)} \
+"
+
 do_compile () {
-    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} MOREFLAGS="${ZSTD_MOREFLAGS}"
     oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
 }
 

---
base-commit: 39019629a4ad25557f120ec98305a4a2ad6a8558
change-id: 20261124-zstd-1-6-0-621e66520e4d


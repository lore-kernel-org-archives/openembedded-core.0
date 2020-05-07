Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1802.1588837571024050180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 00:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0477jmux027478
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2020 00:45:59 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May
 2020 00:45:38 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] xorg-font-common: redirect stderr to /dev/null in pkg_postinst
Date: Thu, 7 May 2020 15:45:35 +0800
Message-ID: <20200507074536.10631-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Redirect stderr to /dev/null to avoid the error:

$ opkg install encodings
Installing encodings (1.0.5) on root
Configuring encodings.
find: /usr/lib/X11/fonts: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index f18c8aefc2..85bc0f72a8 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -32,11 +32,11 @@ FILES_${PN} += " ${libdir}/X11/fonts ${datadir}"
 
 PACKAGE_WRITE_DEPS += "mkfontdir-native mkfontscale-native"
 pkg_postinst_${PN} () {
-        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
+        for fontdir in `find $D/usr/lib/X11/fonts -type d 2>/dev/null`; do
                 mkfontdir $fontdir
                 mkfontscale $fontdir
         done
-        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
+        for fontdir in `find $D/usr/share/fonts/X11 -type d 2>/dev/null`; do
                 mkfontdir $fontdir
                 mkfontscale $fontdir
         done
-- 
2.17.1


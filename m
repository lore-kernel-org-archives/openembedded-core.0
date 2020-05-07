Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1780.1588837580331137239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 00:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0477jmv2027478
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2020 00:46:10 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May
 2020 00:46:02 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] encodings: RDEPEND on mkfontdir mkfontscale
Date: Thu, 7 May 2020 15:45:36 +0800
Message-ID: <20200507074536.10631-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507074536.10631-1-yi.zhao@windriver.com>
References: <20200507074536.10631-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Fix pkg_postinst error when install encodings via online repo:

$ opkg install encodings
Installing encodings (1.0.5) on root
Configuring encodings.
/var/lib/opkg/info/encodings.postinst: line 7: mkfontdir: not found
Collected errors:
* pkg_run_script: package "encodings" postinst script returned status 127.
* opkg_configure: encodings.postinst returned 127.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index a39609b5da..b161a46982 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -10,7 +10,7 @@ PE = "1"
 PR = "${INC_PR}.1"
 
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
-RDEPENDS_${PN} = ""
+RDEPENDS_${PN} = "mkfontdir mkfontscale"
 
 SRC_URI += "file://nocompiler.patch"
 SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"
-- 
2.17.1


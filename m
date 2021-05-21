Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5589.1621577697829713961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 23:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14L6EuTA014064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 23:14:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 23:14:55 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 20 May 2021 23:14:55 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gdk-pixbuf: fix nativesdk do_configure failed
Date: Fri, 21 May 2021 14:14:54 +0800
Message-ID: <20210521061454.1946472-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since commit [92fc28498f gdk-pixbuf: rewrite the cross-build support
for tests] applied, it add meson option -Duse_prebuilt_tools=true to
taget.

Add the same option for nativesdk to fix do_configure failure
|../gdk-pixbuf-2.42.6/thumbnailer/meson.build:32:0: ERROR: Arrays do not
have a method called 'full_path'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index f171464f4d..50d58ef807 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -48,6 +48,10 @@ EXTRA_OEMESON_class-target = " \
     -Duse_prebuilt_tools=true \
 "
 
+EXTRA_OEMESON_class-nativesdk = " \
+    -Duse_prebuilt_tools=true \
+"
+
 PACKAGES =+ "${PN}-xlib"
 
 # For GIO image type sniffing
-- 
2.27.0


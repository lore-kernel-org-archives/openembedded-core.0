Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.17608.1628476334220517160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 19:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1792WCri024371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Aug 2021 19:32:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 8 Aug 2021 19:32:11 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 8 Aug 2021 19:32:11 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] multilib.bbclass: fix new override syntax for virtclass-multilib
Date: Sun, 8 Aug 2021 19:32:11 -0700
Message-ID: <20210809023211.61788-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

the 'virtclass-multilib-xxx' is an override, so use ':' instead of
'_' for TARGET_VENDOR and DEFAULTTUNE.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/multilib.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index c3be89767a..3cbda5d806 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -35,7 +35,7 @@ python multilib_virtclass_handler () {
         e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT'))
         override = ":virtclass-multilib-" + variant
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-        target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
+        target_vendor = e.data.getVar("TARGET_VENDOR:" + "virtclass-multilib-" + variant, False)
         if target_vendor:
             e.data.setVar("TARGET_VENDOR", target_vendor)
         return
@@ -82,7 +82,7 @@ python multilib_virtclass_handler () {
     e.data.setVar("WHITELIST_GPL-3.0", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
-    newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
+    newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
     if newtune:
         e.data.setVar("DEFAULTTUNE", newtune)
 }
-- 
2.30.2


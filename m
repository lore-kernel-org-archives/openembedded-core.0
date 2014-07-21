Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id ACDF370199
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 21:40:33 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so4829058wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P+UyK9yqN0+iOXR/pLL3VMXbQmK/MbD2Kqwq+DAVoB4=;
	b=EO6WdJqsd3DqGgSaXysQOGOxZsh45lEH4IDCQtOWLxWpwXv4zpRGYdQ8TeRrDbKiB7
	8UQpqPy9VVfh39BoiRtn2+Gt7GF6O9RqTNqBus+KmIdN2ccDzAIsdgzpY7iCzLAOqV9Q
	Rj99pu/ScEb8JF+C9kF/Jh0C5Dy8ZHpBsMXVg1TyCzyvJ5CHQGU1JlEWuy9NDIGhnrwU
	jYGrE12GbYeeOhz4Pr/JrXTwemT07wkrC77iOMtD4hfjqhRwTJ+cw8a6CoX8aZH3l6Kj
	o7oTbItISI9pUblj6imN0xkU3zH22H7rwbWFe/O2IueSrz+9cz8DZ8uWd4o1LaAU8WBX
	2Gzg==
X-Received: by 10.180.12.239 with SMTP id b15mr4312734wic.75.1405978834213;
	Mon, 21 Jul 2014 14:40:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h13sm40532561wjs.2.2014.07.21.14.40.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 14:40:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 23:40:47 +0200
Message-Id: <1405978847-11719-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [RFC][PATCH] kernel-module-split.bbclass: Allow autoloading multiple modules or modules where basename != module name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 21:40:42 -0000

* new KERNEL_MODULE_AUTOLOAD syntax doesn't support modules where basename and
  module name don't match (usually - and _), e.g.:

  module_autoload_bq27x00_battery = "bq27x00-battery"

* sometimes it's useful to load modules in particular order and
  module_autoload allowed to just list multiple modules, e.g.:

  module_autoload_snd-soc-neo1973-wm8753 = "snd-soc-s3c24xx snd_soc_s3c24xx_i2s snd-soc-dfbmcs320 snd-soc-wm8753 snd-soc-neo1973-wm8753"
  or
  module_autoload_g_ether = "s3c2410_udc g_ether"

  restore this possibility which is useful for incorrect dependencies
  between modules

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 0c045c9..9a95b72 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -132,12 +132,18 @@ python split_kernel_module_packages () {
         # appropriate modprobe commands to the postinst
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or "").split()
         autoload = d.getVar('module_autoload_%s' % basename, True)
-        if autoload:
-            bb.error("KERNEL_MODULE_AUTOLOAD has replaced module_autoload_%s, please replace it!" % basename)
+        if autoload and autoload == basename:
+            bb.warn("module_autoload_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename == module name, please drop it" % basename)
+        if autoload and basename not in autoloadlist:
+            bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
             name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
-            f.write('%s\n' % basename)
+            if autoload:
+                for m in autoload.split():
+                    f.write('%s\n' % m)
+            else:
+                f.write('%s\n' % basename)
             f.close()
             postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
-- 
2.0.2



Return-Path: <Ning.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B90446A4EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:14:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4T8Enfk019255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 01:14:49 -0700 (PDT)
Received: from pek-nzhang0-d3.wrs.com (128.224.162.247) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 01:14:49 -0700
From: Ning Zhang <ning.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 16:14:45 +0800
Message-ID: <9fbec3ccfc2d674d09ec44c2a7bd57a5b751f8a0.1369814765.git.ning.zhan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369814765.git.ning.zhan@windriver.com>
References: <cover.1369814765.git.ning.zhan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] yocto_kernel: check current items before add a new one
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
X-List-Received-Date: Wed, 29 May 2013 08:14:48 -0000
Content-Type: text/plain

From: Zhang Ning <ning.zhan@windriver.com>

When use "yocto-kernel config add" to add the same config many times,
all of these are list when use "yocto-kernel config list" to check.

This fix modify routine yocto_kernel_config_add, if the new added
components already exist in current configuration, just igore them.
Now, one config could only be added one time.

[YOCTO #4562]

Signen-off-by: Zhang Ning <ning.zhan@windriver.com>
---
 scripts/lib/bsp/kernel.py |   32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index fc1e6bd..9ed6e94 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -239,22 +239,32 @@ def yocto_kernel_config_add(scripts_path, machine, config_items):
     user-defined config fragment [${machine}-user-config.cfg].
     """
     new_items = []
+    dup_items = []
+
+    cur_items = read_config_items(scripts_path, machine)
 
     for item in config_items:
         if not item.startswith("CONFIG") or (not "=y" in item and not "=m" in item):
             print "Invalid config item (%s), exiting" % item
             sys.exit(1)
-        new_items.append(item)
-
-    cur_items = read_config_items(scripts_path, machine)
-    cur_items.extend(new_items)
-
-    write_config_items(scripts_path, machine, cur_items)
-
-    print "Added items:"
-    for n in new_items:
-        print "\t%s" % n
-
+        if item not in cur_items and item not in new_items:
+            new_items.append(item)
+        else:
+            dup_items.append(item)
+
+    if len(new_items) > 0:
+        cur_items.extend(new_items)
+        write_config_items(scripts_path, machine, cur_items)
+        print "Added item%s:" % ("" if len(new_items)==1 else "s")
+        for n in new_items:
+            print "\t%s" % n
+
+    if len(dup_items) > 0:
+        output="Below item%s already exist%s in current configuration, ignore %s" % \
+            (("","s", "it") if len(dup_items)==1 else ("s", "", "them" ))
+        print output
+        for n in dup_items:
+            print "\t%s" % n
 
 def find_current_kernel(bsp_layer, machine):
     """
-- 
1.7.9.5



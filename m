Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 712376E79F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:04 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2613179eei.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8TnKUUlQFfIeUyhUIt2HNQ8bC4D8nN+zLOS3wqWwUDU=;
	b=XZNMlW1UZPjXQU0UCA5wOfGGPtId1oPPmkAG8p/trmwNIW2brp4Y/klhPcX8LD1rTd
	BWJSF/VylisEO8r00A8Zb3fVrMaTaqNMS8HlJAHThr23ybz9vKDPvyYxSsaF8/425+/r
	lWEnIUylfNmg6kdKiqFIMdchQ9mmMmGDPYjIOLTnnRuO9x87kubFfgdPBqnG8TCtH/wb
	/5Z/+AAiM5G5Mk7NPxf+M8bMZV6lDE1zTIO8+mTK2wX1/6ocCIz1LwK0hfUsCn1WoqEW
	xwTi1BcsuXtUdIeq05rZ62M++3b2aMfdcnWTYA+h26yBSHSYjZI8X+WnIFE+pHGXfBmo
	kVyQ==
X-Received: by 10.14.198.195 with SMTP id v43mr2847651een.62.1390053725195;
	Sat, 18 Jan 2014 06:02:05 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm22652172eeo.10.2014.01.18.06.02.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:06 +0100
Message-Id: <a1f582d133aed1cf166d7ed40d5b450d5ee40108.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:05 -0000

* prepare for reading shlibs providers only from dependency tree of
  current recipe

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 768047c..7dcec5e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1352,6 +1352,28 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
+    def read_shlib_providers():
+        list_re = re.compile('^(.*)\.list$')
+        # Go from least to most specific since the last one found wins
+        for dir in reversed(shlibs_dirs):
+            if not os.path.exists(dir):
+                continue
+            for file in os.listdir(dir):
+                m = list_re.match(file)
+                if m:
+                    dep_pkg = m.group(1)
+                    fd = open(os.path.join(dir, file))
+                    lines = fd.readlines()
+                    fd.close()
+                    ver_file = os.path.join(dir, dep_pkg + '.ver')
+                    lib_ver = None
+                    if os.path.exists(ver_file):
+                        fd = open(ver_file)
+                        lib_ver = fd.readline().rstrip()
+                        fd.close()
+                    for l in lines:
+                        shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
+
     def linux_so(file):
         needs_ldconfig = False
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
@@ -1496,26 +1518,7 @@ python package_do_shlibs() {
             postinst += d.getVar('ldconfig_postinst_fragment', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-    list_re = re.compile('^(.*)\.list$')
-    # Go from least to most specific since the last one found wins
-    for dir in reversed(shlibs_dirs):
-        if not os.path.exists(dir):
-            continue
-        for file in os.listdir(dir):
-            m = list_re.match(file)
-            if m:
-                dep_pkg = m.group(1)
-                fd = open(os.path.join(dir, file))
-                lines = fd.readlines()
-                fd.close()
-                ver_file = os.path.join(dir, dep_pkg + '.ver')
-                lib_ver = None
-                if os.path.exists(ver_file):
-                    fd = open(ver_file)
-                    lib_ver = fd.readline().rstrip()
-                    fd.close()
-                for l in lines:
-                    shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
+    read_shlib_providers()
 
     bb.utils.unlockfile(lf)
 
-- 
1.8.5.2



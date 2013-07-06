Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id E841E6B090
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:13:01 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so2070310eek.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=g5Ue9MJr04r1hsi9ZdD/Y4IBtu76Ylv8+zfQKWNfN1s=;
	b=Q6FAJZRV/nK6TG57W123V/vl5dB8kU1V6hGw72qKgHFmynWNRXGAo84hqJTzVTM7XK
	0g7gDpgeY8x1b6T2ndsSkFe62clurErN8JYfeybgGgwl859NvlN9me3BpvMvYCrkOoEX
	PFVJKYCDG/icybJT/LRPRXpYVuGOuoJlknGVBMWMwxfVAzJpwZ+z1F2jIbVEwJcSPQ/s
	QoW/grd54CtT6gkfXu8zwHEY3bk6x91pmG/hgpmFSyNeaOXv50w+Qi9hiBCSeIKvusIP
	JTTTWPZFHNogwKK5mzeemwexfyILQZ3iSk9Za9rMFgD/CUFTi12yZWlK4uFphEohwWkU
	v4Fg==
X-Received: by 10.15.101.13 with SMTP id bo13mr18325193eeb.141.1373152382697; 
	Sat, 06 Jul 2013 16:13:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm27719102eeo.14.2013.07.06.16.13.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:13:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:13:04 +0200
Message-Id: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [RFC][PATCH 1/4] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Sat, 06 Jul 2013 23:13:02 -0000

* prepare for reading shlibs providers only from dependency tree of
  current recipe

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5c2d1c6..d80535d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1337,6 +1337,28 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
+    def read_shlib_providers:
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
@@ -1479,26 +1501,7 @@ python package_do_shlibs() {
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
1.8.2.1



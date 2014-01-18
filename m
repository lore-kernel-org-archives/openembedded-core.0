Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id B824D6E722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:05 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so1409539ead.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PxV406f3mIF+NJ1PXcY4TJPromnbUdOo+u38FknNgBA=;
	b=Y1DNh2kQE1Mk52qi5NLr/DhZdXvtVjX99NoWUvqO8zU6jva7MTLVb8ofn82t5FUVul
	+9qupQ/6G/o+luXT45PnuY+FIR7fZ1OBmaaZZb9Q9gLzVWb+eQ896HTEkNs/Udyos2y5
	y9MIpd5IwCJbSfbr2wgO+461dOsOt/XKwmAvpyoQrqWZQ2sHvodfu+rB6qneLRdSwgYC
	bTPzQ7HagWVqwGe7v8j/IzuI9whDdln5bYHdt+ILFnwTeQIeCxZk8dvafJuk7/T9xucr
	kM1ewshEXeOHsZ24tfBWGfqNYlX/vlAn7ofaJjoD6aydmy3GxqvEU0MgQy8QqcSydBtK
	U0Hw==
X-Received: by 10.15.41.140 with SMTP id s12mr8219567eev.50.1390053726367;
	Sat, 18 Jan 2014 06:02:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm11544500eey.0.2014.01.18.06.02.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:07 +0100
Message-Id: <c121197f51f33bbfe6a4322597205d51287bc261.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] package.bbclass: show warning when package is trying to provide already provided shlib
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:06 -0000

* move read_shlib_providers before registering package as provider
  and don't change provider if it already exists, show warning instead

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dcec5e..aa8156d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1356,6 +1356,7 @@ python package_do_shlibs() {
         list_re = re.compile('^(.*)\.list$')
         # Go from least to most specific since the last one found wins
         for dir in reversed(shlibs_dirs):
+            bb.debug(2, "Reading shlib providers in %s" % (dir))
             if not os.path.exists(dir):
                 continue
             for file in os.listdir(dir):
@@ -1471,6 +1472,8 @@ python package_do_shlibs() {
 
     needed = {}
     shlib_provider = {}
+    read_shlib_providers()
+
     for pkg in packages.split():
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
         needs_ldconfig = False
@@ -1504,6 +1507,12 @@ python package_do_shlibs() {
         if len(sonames):
             fd = open(shlibs_file, 'w')
             for s in sonames:
+                if s in shlib_provider:
+                    (old_pkg, old_pkgver) = shlib_provider[s]
+                    if old_pkg != pkg:
+                        bb.warn('%s-%s is already registered as shlib provider for %s, ignoring %s-%s trying to register the same' % (old_pkg, old_pkgver, s, pkg, pkgver))
+                        continue
+                bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s))
                 fd.write(s + '\n')
                 shlib_provider[s] = (pkg, pkgver)
             fd.close()
@@ -1517,8 +1526,7 @@ python package_do_shlibs() {
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('ldconfig_postinst_fragment', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-    read_shlib_providers()
+        bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
 
     bb.utils.unlockfile(lf)
 
-- 
1.8.5.2



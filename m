Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 93F2B6CC2E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 13:28:49 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2582373eak.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=P799wsLXzh1k4Mwn9XZt0y/H1FWF68+pj9V7B6c3N8w=;
	b=DMZp8s/ekR99RoGGoLIVryseAMFs1lfljyDSGqAxM+UD3uCMCztmkfCfOD1yd6RQv8
	pY17ygk2I2cz1z/oGJpyW26x3xHROdnKg2NLp4eXbwfzi1SH8Aw4XsgfKGZJ25uO6lOP
	Hj4OksuiL2EDWHSVLfM0Yhz++SnBGkQwrZCfKdkjEggpI4HtiemFSKar4Uw85y1Z6tF3
	/0yufzyLs047cVlkghbT5K+qgOekWj/opmHaPzh7V+ECay8/hD3NoHnRv94kfGronHv6
	q/5484j6Io2gfXxAqTBrf6f4WSGe3Qt72G/ZCR7M8i5qQ6mtJAAXFCDbAeROegQCAh5X
	DCnA==
X-Received: by 10.15.98.73 with SMTP id bi49mr33384eeb.115.1390138130004;
	Sun, 19 Jan 2014 05:28:50 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm27332085ees.4.2014.01.19.05.28.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 05:28:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2014 14:28:47 +0100
Message-Id: <45a8519a8075d557e8c12db5632ea20e527c1f5f.1390138091.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <c121197f51f33bbfe6a4322597205d51287bc261.1390052636.git.Martin.Jansa@gmail.com>
References: <c121197f51f33bbfe6a4322597205d51287bc261.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390138091.git.Martin.Jansa@gmail.com>
References: <cover.1390138091.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/5] package.bbclass: show warning when package is trying to provide already provided shlib
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
X-List-Received-Date: Sun, 19 Jan 2014 13:28:50 -0000

* move read_shlib_providers before registering package as provider
  and don't change provider if it already exists, show warning instead

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dcec5e..9b511a6 100644
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
@@ -1504,6 +1507,11 @@ python package_do_shlibs() {
         if len(sonames):
             fd = open(shlibs_file, 'w')
             for s in sonames:
+                if s in shlib_provider:
+                    (old_pkg, old_pkgver) = shlib_provider[s]
+                    if old_pkg != pkg:
+                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s, pkg, pkgver))
+                bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s))
                 fd.write(s + '\n')
                 shlib_provider[s] = (pkg, pkgver)
             fd.close()
@@ -1517,8 +1525,7 @@ python package_do_shlibs() {
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('ldconfig_postinst_fragment', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-    read_shlib_providers()
+        bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
 
     bb.utils.unlockfile(lf)
 
-- 
1.8.5.2



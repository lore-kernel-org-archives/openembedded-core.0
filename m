Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD1E6DBF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 15:24:22 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so2609636ead.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=R5bnqcWbCg99TXHVHlfGl58JnhKC1Y6/PkFqsEsphI4=;
	b=Yh+A9wiy9Gt7iPJ5lxkma7vmqaS/c1BiS97MOhvO29/YNxSmrO19PPoQ9LUrWN7M0x
	bZqg57KC582SR0wUiwA9ZW3Nlxnj7I8gR4clamarKPnu8T4zunzXhZqGO83Wdj8tS5Vs
	5/al1lBZsnfhcekjtUOAOMsmeRNTzyzdL4ASOAe0AzKsXddeg7V81U7dqfzSGdnA8MXX
	gqgwTYiU+0kG7NcpM76Nqf4VWDQH44LDuHZiq6udNBSlnj2iowf/o16UghOlTpI4C2VU
	bMvRcjWDFd01n28OLl2Y51Wg5YIDuqfqgrp/EJY7qwRXLUTq+e29OrBn6bOX8/KDHLP6
	E7cw==
X-Received: by 10.14.109.137 with SMTP id s9mr9981823eeg.6.1390145062671;
	Sun, 19 Jan 2014 07:24:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm44458136een.13.2014.01.19.07.24.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 07:24:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2014 16:24:19 +0100
Message-Id: <96a3195024f8abed75ec6dde64e12e3133c992f7.1390144972.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1390142552.2467.48.camel@e130.pbcl.net>
Subject: [PATCHv3 2/5] package.bbclass: show warning when package is providing already provided shlib
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
X-List-Received-Date: Sun, 19 Jan 2014 15:24:22 -0000

* move read_shlib_providers before registering package as provider
  and show warning when different package tries to provide something
  already provided.

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



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id A48006B0EE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:13:03 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so2189818eae.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HhrOVox+A+9aWadFD7K7eAQACmleOjsVo126FmftLMY=;
	b=A5q4bH+PoFMGp9zB4mJd8hxt5dYrEl3NOog/Rts8yUKODtElvnrDiGxBvTvY2GQxH0
	f7Yro4yUkEj6g8le71JVwbptMaAjlSlL1LJxUqcjk+wQ5pRYd2NJK0Ug7XW/NmteRbeb
	El/hHugxEhd+SHvhTGAwSCk6nb3qvA85YcqFqUeOT2PPMwOkk48W3GAUhDLMploMTVK2
	R/5GyShvPJNUh9zv2j1SQ7lvUcnEDVA8G1U2+ZGhHr1PEVEJTP9e07uQsF/ftx0rDPUc
	zkt2aJ7K1rKnxEIr9l47JBdVEtJEpv6iqiphws9T9q7HGR/NkZEkaD7lR+d/F2N3sgf8
	FI0w==
X-Received: by 10.14.101.13 with SMTP id a13mr18420200eeg.86.1373152384211;
	Sat, 06 Jul 2013 16:13:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm27701275eex.17.2013.07.06.16.13.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:13:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:13:05 +0200
Message-Id: <1373152387-19393-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/4] package.bbclass: show warning when package is trying to provide already provided shlib
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
X-List-Received-Date: Sat, 06 Jul 2013 23:13:04 -0000

* move read_shlib_providers before registering package as provider
  and don't change provider if it already exists, show warning instead

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d80535d..6c3ca56 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1341,6 +1341,7 @@ python package_do_shlibs() {
         list_re = re.compile('^(.*)\.list$')
         # Go from least to most specific since the last one found wins
         for dir in reversed(shlibs_dirs):
+            bb.debug(2, "Reading shlib providers in %s" % (dir))
             if not os.path.exists(dir):
                 continue
             for file in os.listdir(dir):
@@ -1456,6 +1457,8 @@ python package_do_shlibs() {
 
     needed = {}
     shlib_provider = {}
+    read_shlib_providers()
+
     for pkg in packages.split():
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
         needs_ldconfig = False
@@ -1487,6 +1490,12 @@ python package_do_shlibs() {
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
@@ -1501,8 +1510,6 @@ python package_do_shlibs() {
             postinst += d.getVar('ldconfig_postinst_fragment', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-    read_shlib_providers()
-
     bb.utils.unlockfile(lf)
 
     assumed_libs = d.getVar('ASSUME_SHLIBS', True)
-- 
1.8.2.1



Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.glindkamp@taskit.de>) id 1THDHp-0006Vx-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 14:33:49 +0200
Received: from mail.taskit.de. (mail.taskit.de [83.236.215.226])
	by mrelayeu.kundenserver.de (node=mreu3) with ESMTP (Nemesis)
	id 0M5V4W-1TfVEe1vCK-00xbaD; Thu, 27 Sep 2012 14:20:56 +0200
Received: from gieselher.localdomain (gieselher.localdomain [10.1.100.24])
	by mail.taskit.de (Postfix) with ESMTP id 5ABBB25C6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 14:18:03 +0200 (CEST)
From: Christian Glindkamp <christian.glindkamp@taskit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 14:20:57 +0200
Message-Id: <1348748457-7215-1-git-send-email-christian.glindkamp@taskit.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:MJu6hbtroWFJYQ+UG8+wJ67AY0H7u+z1++CDcshdim3
	MqGKt78ZJR2BUIeibz4m5LJKXnHvEEbhR96idwMaBunW5CgH48
	3xjcfmLkH82OuMBx6s//IdQXuSsjribkEoLjCvZQAJa6EGk4yN
	KoAV7ZEpuY9kPecI96Hli+mGDKcvGhciB7Qc9My4gEXbFqlPAc
	MgOjH/jMJ2mFif73uYfhpJsdB6VGBvePCXUsgw31rQ7zlovTnq
	ePL6ocrgnYQqWlgnyrFCyKb3xBhf7srO0D0SG5J+wrq+3f497G
	8kTfSoCaJoA6+tgR5eMWs8MxxvQw0wVbmS1D34xAbEgykJZV9m
	Rffg9wljx3r1dqclOs3fLMUoxKx8yHrxk9U4MeeKoXfTwWTTuN
	JjK3ubNrNrC3l3J83picxjfOt8jLh4qIiI=
Subject: [PATCH] perl: Fix nativesdk install path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 12:33:49 -0000

Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
expressions by anchoring the left side of the search regexp to prevent
$prefix$prefix type expression in the perl config. For nativesdk this is
not enough. Adding anchors on both side fixes this.

Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
---

This is currently only build tested, but buildhistory for perl did not change.

 meta/recipes-devtools/perl/perl_5.14.2.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 3c1360f..0009855 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r9"
+PR = "r10"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -150,9 +150,9 @@ do_configure() {
                -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
-               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
+               -e "s%\([ \"^\',=]\+\)/usr/include\([ \"^\',=]\+\)%\1${STAGING_INCDIR}\2%g" \
+	       -e "s%\([ \"^\',=]\+\)/usr/lib/\([ \"^\',=]\+\)%\1${libdir}/\2%g" \
+	       -e "s%\([ \"^\',=]\+\)/usr/\([ \"^\',=]\+\)%\1${exec_prefix}/\2%g" \
 	       -e "s%/perl5%/perl%g" \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
-- 
1.7.2.5




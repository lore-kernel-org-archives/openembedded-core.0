Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAD86DF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:50:25 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so6096925wes.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 00:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MSqcztc4pmJs/W+Hcggn9ndh1Cqqeug8PRN9vQguQnI=;
	b=PA6o/YM3rG4Nw9fM0LKoYAN2LDqVC+cgjLbv567MLnthn0A4PBX23MpDx/oVGOAFB+
	V6IcwCtmg7FVCxR0wXsKpBHBLhPucY5RZOBQrNRL9irwJloDd2oOfn2LmtdOBoQ77qnm
	SNIiqJm++MAWoO+9cg5gQL1pVLabw3PuprKSF+uSnbW+M3k+FEmSwl/SND/cxyAbzYwJ
	RJcbOTz31y0Q1DSCRNxeU7+RFQudAs+8B0tn1Tt7UHNZcN/80EVWkysu/cFtUDVBX6MF
	ppiy+sbTu1d6zgz+uWevbdJEjj1dYulkudl45ma7O3t8TH6zHeZWHEnniAeHDtWMDdOL
	7WVw==
X-Gm-Message-State: ALoCoQmZKdTdaYL6PNIwSHACtT2J+zNlXrn4D4SvITuVUZQCruy8yyrJzQgVY9wSmlb7kj4HDXfp
X-Received: by 10.180.85.71 with SMTP id f7mr17381373wiz.41.1386751824035;
	Wed, 11 Dec 2013 00:50:24 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o9sm12734902wib.10.2013.12.11.00.50.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 00:50:22 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 09:50:08 +0100
Message-Id: <1386751809-8853-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1386751809-8853-1-git-send-email-koen@dominion.thruhere.net>
References: <1386751809-8853-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] perl: remove sysroot path leakage into packaged files
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
X-List-Received-Date: Wed, 11 Dec 2013 08:50:25 -0000

A grep in $D shows a lot of leakage which breaks things like CPAN:

[koen@rrmbp image]$ grep sysroot . -rn | grep -v Binary
./usr/lib/perl/5.14.3/cacheout.pl:50:if (open(PARAM,'/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/sys/param.h')) {
./usr/lib/perl/5.14.3/CORE/pp.h:53:#undef SP /* Solaris 2.7 i386 has this in /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/sys/reg.h */
./usr/lib/perl/5.14.3/Config.pod:8076:used. Typically F</build/v2013.06/build/tmp>-angstrom_v2013_06-F<eglibc/sysroots/beaglebone/usr/include/string.h> or F</build/v2013.06/build/tmp>-angstrom_v2013_06-F<eglibc/sysroots/beaglebone/usr/include/strings.h>.
./usr/lib/perl/5.14.3/FileCache.pm:119:    foreach my $param ( '/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/sys/param.h' ){
./usr/lib/perl/5.14.3/Config.pm:87:    archlibexp => '/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/lib/perl/5.14.3/',
./usr/lib/perl/5.14.3/Config.pm:89:    cc => 'arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone',
./usr/lib/perl/5.14.3/Config.pm:101:    full_ar => '/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/x86_64-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ar',
./usr/lib/perl/5.14.3/Config.pm:114:    ld => 'arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone',
./usr/lib/perl/5.14.3/Config_heavy.pl:169:archlibexp='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/lib/perl/5.14.3/'
./usr/lib/perl/5.14.3/Config_heavy.pl:186:cc="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/5.14.3/Config_heavy.pl:191:ccname="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/5.14.3/Config_heavy.pl:245:cpprun="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -E"
./usr/lib/perl/5.14.3/Config_heavy.pl:246:cppstdin="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -E"
./usr/lib/perl/5.14.3/Config_heavy.pl:745:full_ar='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/x86_64-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ar'
./usr/lib/perl/5.14.3/Config_heavy.pl:927:ld="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/5.14.3/Config_heavy.pl:1167:strings='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/string.h'
./usr/lib/perl/5.14.3/Config_heavy.pl:1177:timeincl='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/sys/time.h /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/time.h '
./usr/lib/perl/5.14.3/Config_heavy.pl:1229:usrinc='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include'
./usr/lib/perl/5.14.3/ExtUtils/Liblist/Kid.pm:58:    push(@libpath, "/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/lib");
./usr/lib/perl/config.sh:56:archlibexp='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/lib/perl/5.14.3/'
./usr/lib/perl/config.sh:73:cc="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/config.sh:78:ccname="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/config.sh:100:cpprun="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -E"
./usr/lib/perl/config.sh:101:cppstdin="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -E"
./usr/lib/perl/config.sh:591:full_ar='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/x86_64-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ar'
./usr/lib/perl/config.sh:769:ld="arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone"
./usr/lib/perl/config.sh:986:strings='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/string.h'
./usr/lib/perl/config.sh:996:timeincl='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/sys/time.h /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/time.h '
./usr/lib/perl/config.sh:1042:usrinc='/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/perl/perl_5.14.3.bb | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 1e14e17..3829d4b 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -210,7 +210,6 @@ do_install() {
         install config.sh ${D}${libdir}/perl
 
         ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
-
 }
 
 do_install_append_class-nativesdk () {
@@ -223,12 +222,14 @@ PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
 perl_package_preprocess () {
         # Fix up installed configuration
         sed -i -e "s,${D},,g" \
+               -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
                -e "s,-isystem${STAGING_INCDIR} ,,g" \
                -e "s,${STAGING_LIBDIR},${libdir},g" \
                -e "s,${STAGING_BINDIR},${bindir},g" \
                -e "s,${STAGING_INCDIR},${includedir},g" \
                -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
+               -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
             ${PKGD}${bindir}/h2xs \
             ${PKGD}${bindir}/h2ph \
             ${PKGD}${bindir}/pod2man \
@@ -236,14 +237,17 @@ perl_package_preprocess () {
             ${PKGD}${bindir}/pod2usage \
             ${PKGD}${bindir}/podchecker \
             ${PKGD}${bindir}/podselect \
-            ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
-            ${PKGD}${libdir}/perl/${PV}/cacheout.pl \
-            ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
-            ${PKGD}${libdir}/perl/config.sh \
+            ${PKGD}${libdir}/perl/${PV}/CORE/config.h \
+            ${PKGD}${libdir}/perl/${PV}/CORE/perl.h \
+            ${PKGD}${libdir}/perl/${PV}/CORE/pp.h \
             ${PKGD}${libdir}/perl/${PV}/Config.pm \
+            ${PKGD}${libdir}/perl/${PV}/Config.pod \
             ${PKGD}${libdir}/perl/${PV}/Config_heavy.pl \
-            ${PKGD}${libdir}/perl/${PV}/CORE/perl.h \
-            ${PKGD}${libdir}/perl/${PV}/CORE/pp.h
+            ${PKGD}${libdir}/perl/${PV}/ExtUtils/Liblist/Kid.pm \
+            ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
+            ${PKGD}${libdir}/perl/${PV}/cacheout.pl \
+            ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
+            ${PKGD}${libdir}/perl/config.sh
 }
 
 PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
-- 
1.8.4.2



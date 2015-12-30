Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC62605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 09:31:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU9VQeV018425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 01:31:26 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Dec 2015 01:31:25 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Dec 2015 17:18:01 +0800
Message-ID: <1451467081-9635-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: install Config_heavy-target.pl correctly
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
X-List-Received-Date: Wed, 30 Dec 2015 09:31:27 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Config_heavy-target.pl is needed by perl-native, not perl; since
perl-configpm-switch.patch, which uses Config_heavy-target.pl, is
applied into native package, and Config_heavy-target.pl is used
when PERLCONFIGTARGET is yes in cpan.bbclass

This fixed a building failure when autoloader is used:

Can't locate Config_heavy-target.pl in @INC (@INC contains: ...) at tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm line 88

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.22.0.bb | 2 ++
 meta/recipes-devtools/perl/perl_5.22.0.bb        | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
index b4dda31..09d399c 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
@@ -94,6 +94,8 @@ do_install () {
 		install $i ${D}${libdir}/perl/${PV}/CORE
 	done
 
+	ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
+
 	# Those wrappers mean that perl installed from sstate (which may change
 	# path location) works and that in the nativesdk case, the SDK can be
 	# installed to a different location from the one it was built for.
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 55ce73f..84cc651 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -241,10 +241,7 @@ do_install() {
 
         # target config, used by cpan.bbclass to extract version information
         install config.sh ${D}${libdir}/perl
-
-        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
 }
-
 do_install_append_class-nativesdk () {
         create_wrapper ${D}${bindir}/perl \
             PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
@@ -298,8 +295,7 @@ FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
                    ${libdir}/perl/config.sh \
-                   ${libdir}/perl/${PV}/Config_heavy.pl \
-                   ${libdir}/perl/${PV}/Config_heavy-target.pl"
+                   ${libdir}/perl/${PV}/Config_heavy.pl"
 FILES_${PN}-pod = "${libdir}/perl/${PV}/pod \
 		   ${libdir}/perl/${PV}/*.pod \
                    ${libdir}/perl/${PV}/*/*.pod \
-- 
1.9.1



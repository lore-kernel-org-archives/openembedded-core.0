Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDFA673D29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 10:24:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t38AO70Q021375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 03:24:08 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 03:24:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 18:24:12 +0800
Message-ID: <ed4cad55a71d818c5a126e07f7b86151473eeb93.1428488582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428488582.git.Qi.Chen@windriver.com>
References: <cover.1428488582.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] sudo: upgrade to 1.8.13
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
X-List-Received-Date: Wed, 08 Apr 2015 10:24:06 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                          | 12 +++---------
 .../sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb}                |  4 ++--
 2 files changed, 5 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb} (87%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 6e9aec8..2d411f3 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,12 +4,12 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=69e337d679950e304953813158595256 \
-                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=346ce81ebf0f7f89fd379b40b6a4233b \
+                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://lib/util/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea \
+                    file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
                     file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
 
@@ -22,12 +22,6 @@ CONFFILES_${PN} = "${sysconfdir}/sudoers"
 
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
-do_configure_prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-	fi
-}
-
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
 	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C lib/util mksigname mksiglist
diff --git a/meta/recipes-extended/sudo/sudo_1.8.11p2.bb b/meta/recipes-extended/sudo/sudo_1.8.13.bb
similarity index 87%
rename from meta/recipes-extended/sudo/sudo_1.8.11p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.13.bb
index c5e2545..4494170 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.11p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.13.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "84012b4871b6c775c957cd310d5bad87"
-SRC_URI[sha256sum] = "8133849418fa18cf6b6bb6893d1855ff7afe21db8923234a00bf045c90fba1ad"
+SRC_URI[md5sum] = "f61577ec330ad1bd504c0e2eec6ea2d8"
+SRC_URI[sha256sum] = "e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1



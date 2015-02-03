Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B56C6E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CSxp022791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:12 -0800
Message-ID: <8bd75bb46e55f1ede74bb3c1f750851606545b31.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/21] coreutils 6.9: disable native
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:27 -0000
Content-Type: text/plain

ERROR: The recipe coreutils-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   tmp/sysroots/x86_64-linux/bin/kill
 Matched in manifest-x86_64-util-linux-native.populate_sysroot

We have 8.23, so disable it rather than fix.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |   12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index faea984..c6b3453 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -9,11 +9,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
 PR = "r5"
-DEPENDS_class-native = "gettext-native"
 
 inherit autotools gettext texinfo
 
-SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://gnulib_m4.patch \
            file://futimens.patch \
            file://coreutils-ls-x.patch \
@@ -25,19 +24,16 @@ SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://coreutils_fix_for_automake-1.12.patch \
            file://coreutils-build-with-acl.patch \
            file://coreutils-fix-texinfo.patch \
+           file://fix_for_manpage_building.patch \
            "
 
-SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
-SRC_URI_class-native = "${SRC_URI_BASE}"
-
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
 SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
 
 
 # acl is not a default feature
 #
-PACKAGECONFIG_class-target ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
-PACKAGECONFIG_class-native ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 
 # with, without, depends, rdepends
 #
@@ -102,5 +98,3 @@ python __anonymous() {
 	for prog in d.getVar('sbindir_progs', True).split():
 		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir', True), prog))
 }
-
-BBCLASSEXTEND = "native"
-- 
1.7.9.5



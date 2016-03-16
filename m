Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9567C70179
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:49:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2G2nGS5004122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 19:49:16 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 15 Mar 2016 19:49:15 -0700
From: Dengke Du <dengke.du@windriver.com>
To: 
CC: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2016 22:49:13 -0400
Message-ID: <7f65eb60b218d156262f426460a2873ecdb32a14.1458096408.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458096408.git.dengke.du@windriver.com>
References: <cover.1458096408.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nativesdk-coreutils: a lot of warnings fixed
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
X-List-Received-Date: Wed, 16 Mar 2016 02:49:15 -0000
Content-Type: text/plain

When we create nativesdk-coreutils, a lot of warnings appear,it
show many files can't find. Because in the coreutils recipe, it
didn't contain the do_install for the nativesdk, so when the
alternative system check the files in the following process, it
can't find the files. So we should add the do_install for the
nativesdk, change the function do_install_append_class-target() to
do_install_append() in the file:
	meta/recipes-core/coreutils/coreutils_8.25.bb
in this way, the alternative system can find the files, the warnings
disappear.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 650008e..ffedecb 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -27,6 +27,7 @@ SRC_URI[manpages.sha256sum] = "2ee31c3a6d2276f49c5515375d4a0c1047580da6ac1053689
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
+EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch"
 
 # acl and xattr are not default features
 #
@@ -67,7 +68,7 @@ do_compile_prepend () {
 	mkdir -p ${B}/src
 }
 
-do_install_append_class-target() {
+do_install_append() {
 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
-- 
1.9.1



Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B84460557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 19:22:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA7JLx6L022754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 11:22:00 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Nov 2014 11:21:59 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 13:21:57 -0600
Message-ID: <1415388117-227154-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] gcc: Fix intermittent failures during configure
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
X-List-Received-Date: Fri, 07 Nov 2014 19:22:02 -0000
Content-Type: text/plain

If configure or any of the components it uses from the shared work directory
change, do_configure may fail.

An existing do_preconfigure was created to handle these conditions, but
a 'sed' operation was missed, and a call to gnu-configize was also missed.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc         | 2 ++
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 -
 meta/recipes-devtools/gcc/gcc-cross.inc          | 4 ----
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0bf26b5..9d41f65 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -86,6 +86,8 @@ python do_preconfigure () {
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
     # See 0044-gengtypes.patch, we need to regenerate this file
     bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
+    cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 }
 addtask do_preconfigure after do_patch before do_configure
 do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 0b1f37b..ba001a9 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -55,7 +55,6 @@ do_configure () {
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	oe_runconf
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index f04a049..ce6860b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -41,10 +41,6 @@ def get_optimization(d):
 
 SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
 
-do_configure_prepend () {
-	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
-}
-
 do_compile () {
 	export CC="${BUILD_CC}"
 	export AR_FOR_TARGET="${TARGET_SYS}-ar"
-- 
1.9.3



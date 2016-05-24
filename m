Return-Path: <brendan.le.foll@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E62760043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:11:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 04:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109478551"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:11:45 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:12:16 +0100
Message-Id: <1464088336-6619-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] npm: add target_arch flag to npm
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
X-List-Received-Date: Tue, 24 May 2016 11:11:45 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

npm takes a target_arch flag which needs to be set to do some gyp compilations
correctly. It also doesn't use the same mapping as OE for target arch so a
small function is required to make the mapping work. Function is taken from
meta-nodejs

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/npm.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 9843e87..d0d3d8f 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -3,6 +3,17 @@ S = "${WORKDIR}/npmpkg"
 
 NPM_INSTALLDIR = "${D}${libdir}/node_modules/${PN}"
 
+# function maps arch names to npm arch names
+def npm_oe_arch_map(target_arch, d):
+    import re
+    if   re.match('p(pc|owerpc)(|64)', target_arch): return 'ppc'
+    elif re.match('i.86$', target_arch): return 'ia32'
+    elif re.match('x86_64$', target_arch): return 'x64'
+    elif re.match('arm64$', target_arch): return 'arm'
+    return target_arch
+
+NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH', True), d)}"
+
 npm_do_compile() {
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
@@ -12,7 +23,7 @@ npm_do_compile() {
 	# clear cache before every build
 	npm cache clear
 	# Install pkg into ${S} without going to the registry
-	npm --arch=${TARGET_ARCH} --production --no-registry install
+	npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry install
 }
 
 npm_do_install() {
-- 
2.8.2



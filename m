Return-Path: <philippe.coval@osg.samsung.com>
Received: from osg.samsung.com (osg.samsung.com [64.30.133.232])
	by mail.openembedded.org (Postfix) with ESMTP id 3802F606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by osg.samsung.com (Postfix) with ESMTP id 0701F193AA;
	Fri,  3 Nov 2017 03:54:12 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kD2wg7bEc9uy; Fri,  3 Nov 2017 03:54:05 -0700 (PDT)
Received: from WSF-1127.8.8.8.8 (unknown [82.236.136.171])
	by osg.samsung.com (Postfix) with ESMTPSA id 63D50193A1;
	Fri,  3 Nov 2017 03:54:04 -0700 (PDT)
From: Philippe Coval <philippe.coval@osg.samsung.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 11:53:52 +0100
Message-Id: <1509706432-21131-1-git-send-email-philippe.coval@osg.samsung.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] classes/npm: Fix install to use offline option
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
X-List-Received-Date: Fri, 03 Nov 2017 10:54:11 -0000

Option --no-registry seems deprecated or even non supported for ages,
while --offline fixed the problem on install task.

Issue can be reproduced using:

  devtool add "npm://registry.npmjs.org;name=epoll;version=latest"
  bitbake epoll

  | DEBUG: Executing shell function do_install
  (...)
  | npm ERR! argv ".../node" ".../npm" "install" (...) "--production" "--no-registry"
  | npm ERR! node v6.11.0
  | npm ERR! npm  v3.10.10
  | npm ERR! registry URL is required

And also from log file ".../epoll/1.0.0-r0/npmpkg/npm-debug.log":

   silly mapToRegistry using default registry
   41 silly mapToRegistry registry null
   42 verbose stack AssertionError: registry URL is required
   42 verbose stack     at Conf.getCredentialsByURI (.../get-credentials-by-uri.js:8:3)

More relevent insights:
https://github.com/npm/npm/issues/2568#

Signed-off-by: Philippe Coval <philippe.coval@osg.samsung.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedb..dfd1ffe 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -45,7 +45,7 @@ npm_do_install() {
 	# be created in this directory
 	export HOME=${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
-	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry
+	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --offline
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
-- 
1.9.1



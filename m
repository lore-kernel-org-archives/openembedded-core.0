Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE74C71AE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:02:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 30 Oct 2016 21:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25518315"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2016 21:02:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 17:02:23 +1300
Message-Id: <a8f4016cce5e83996d59149104d7b8c0ddbec798.1477886520.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886520.git.paul.eggleton@linux.intel.com>
References: <cover.1477886520.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886520.git.paul.eggleton@linux.intel.com>
References: <cover.1477886520.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/npm: use npm install to do installation
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
X-List-Received-Date: Mon, 31 Oct 2016 04:02:29 -0000

Using "npm install" instead of "cp -a" is the more correct thing to be
doing here, and ensures that symlinks for executable scripts are put
into ${prefix}/bin. (I'd prefer ${bindir}, but npm does not allow
specifying paths at that level - only a prefix.)

Fixes [YOCTO #10460].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index fce4c11..43228c5 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -33,7 +33,11 @@ npm_do_compile() {
 
 npm_do_install() {
 	mkdir -p ${NPM_INSTALLDIR}/
-	cp -a ${S}/* ${NPM_INSTALLDIR}/ --no-preserve=ownership
+	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry
+	if [ -d ${D}${prefix}/etc ] ; then
+		# This will be empty
+		rmdir ${D}${prefix}/etc
+	fi
 }
 
 python populate_packages_prepend () {
-- 
2.5.5



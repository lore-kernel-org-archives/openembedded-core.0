Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AFE6C719A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:45:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="817761506"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2017 12:45:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:45:40 +1300
Message-Id: <28d689f8556d3ac51e44764fe4c75a6159766107.1486413875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486413875.git.paul.eggleton@linux.intel.com>
References: <cover.1486413875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/npm: set HOME during do_install
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
X-List-Received-Date: Mon, 06 Feb 2017 20:45:49 -0000

In do_compile we set HOME so that ~/.npm* only get created in the work
directory; we need to do the same in do_install as well or they'll go
into the user's home directory which we do not want.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 1c778a7..c538040 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -32,6 +32,9 @@ npm_do_compile() {
 }
 
 npm_do_install() {
+	# changing the home directory to the working directory, the .npmrc will
+	# be created in this directory
+	export HOME=${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
 	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry
 	if [ -d ${D}${prefix}/etc ] ; then
-- 
2.9.3



Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0726D6A96F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:45:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 14:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,840,1363158000"; d="scan'208";a="347788825"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2013 14:45:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 14:45:13 -0700
Message-Id: <1370900715-29294-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
References: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/5] dpkg: Fix usage of create_wrapper
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
X-List-Received-Date: Mon, 10 Jun 2013 21:45:37 -0000

create_wrapper changed recently and behaves differently now. It does
not directly exec the , but exports them, so the first parameter
needs to be an environemnt variable like a PATH, not a executable.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 28c4f89..02383ed 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -56,7 +56,7 @@ do_install_append () {
 do_install_append_class-native () {
 	tmp=`find ${D}${bindir} -type f -exec grep -m 1 -l '#!/.*/perl-native/perl' {} \;`
 	for i in $tmp; do
-		create_wrapper $i ${STAGING_BINDIR_NATIVE}/perl-native/perl
+		create_wrapper $i PATH=${STAGING_BINDIR_NATIVE}/perl-native:\$PATH
 	done
 }
 
-- 
1.8.1.4



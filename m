Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4969B7846F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843468"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:02 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:52 +0300
Message-Id: <a213d5a18d9dad11e3796bb9d05a411d168a8e36.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 3/8] signing-keys: delete unused tasks
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:01 -0000

In particular, do_unpack needs to be deleted as it was causing missing
subpackages. Do_unpack cleans the builddir and if it was run after
do_get_public_keys it cleaned up all keys causing no packages to be
built.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/meta/signing-keys.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index aaa01d0c34..ebfb08c433 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -71,3 +71,11 @@ do_deploy[cleandirs] = "${DEPLOYDIR}"
 # clear stamp-extra-info since MACHINE is normally put there by deploy.bbclass
 do_deploy[stamp-extra-info] = ""
 addtask deploy after do_get_public_keys
+
+# Delete unnecessary tasks. In particular, "do_unpack" _must_ be deleted because
+# it cleans ${B} and will wipe any keys exported by do_get_public_keys.
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
-- 
2.12.3



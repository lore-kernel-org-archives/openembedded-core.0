Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E32560034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 20:28:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2015 13:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,423,1422950400"; d="scan'208";a="682093825"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2015 13:28:26 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 12:21:33 +0000
Message-Id: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: khem.raj@gmail.com
Subject: [PATCH] glibc: avoid configure stall by feeding prompt
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
X-List-Received-Date: Wed, 18 Mar 2015 20:28:29 -0000

Addresses a stall (by prompt) condition of the run.do_configure at when
executed directly from the workdir, like when using the devshell.

[YOCTO 7369]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/recipes-core/glibc/glibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 767d4b8..835f4ae 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -82,7 +82,7 @@ do_configure_prepend() {
 }
 
 do_configure_append() {
-	oe_runmake config
+	yes '' | oe_runmake config
 
 	# Remove quotation marks from OPTION_EGLIBC_NSSWITCH_FIXED_*. This will
 	# avoid install error.
-- 
1.8.4.5



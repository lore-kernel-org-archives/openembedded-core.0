Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9CC60777
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 09:09:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 30 Sep 2016 02:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,271,1473145200"; d="scan'208";a="1038559131"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.16.121])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2016 02:09:34 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 10:09:27 +0100
Message-Id: <1475226567-7151-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] multilib_header: avoid sstate checksum issues for -nativesdk recipes
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
X-List-Received-Date: Fri, 30 Sep 2016 09:09:36 -0000

Much as with -native recipes, as addressed in commit
b15730caf0d4c40271796887505507f2501958bb, arch specific variables
like MIPSPKGSFX_ABI were affecting -nativesdk sstate checksums for
recipes like nativesdk-glibc-initial.

Disable multilib_header for nativesdk as we don't use multilibs in
this scenario.

[YOCTO #10320]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/multilib_header.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index 5ee0a2d..304c28e 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -52,3 +52,8 @@ oe_multilib_header() {
 oe_multilib_header_class-native () {
 	return
 }
+
+# Nor do we need multilib headers for nativesdk builds.
+oe_multilib_header_class-nativesdk () {
+	return
+}
-- 
2.7.4



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1DB0763A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 05:03:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2016 22:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,439,1455004800"; d="scan'208";a="951008522"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.142.238])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2016 22:03:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 17:02:20 +1200
Message-Id: <2aab502b28e6632a3946cc8145cfc4f8eee19f38.1459746060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/buildhistory: fix filtering of depends-nokernel.dot
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
X-List-Received-Date: Mon, 04 Apr 2016 05:03:17 -0000

For images we produce a number of filtered dependency .dot files for
readability, the first of which is depends-nokernel.dot which filters
out just the kernel itself (not kernel modules). Unfortunately the
filter specifications hadn't been updated for the dash-to-underscore
removal or the 4.x kernel upgrade, thus the filtering wasn't actually
doing anything.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8af36c5..60d19e2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -425,7 +425,7 @@ buildhistory_get_installed() {
 
 	if [ "$2" != "sdk" ] ; then
 		# Produce some cut-down graphs (for readability)
-		grep -v kernel_image $1/depends.dot | grep -v kernel-2 | grep -v kernel-3 > $1/depends-nokernel.dot
+		grep -v kernel-image $1/depends.dot | grep -v kernel-3 | grep -v kernel-4 > $1/depends-nokernel.dot
 		grep -v libc6 $1/depends-nokernel.dot | grep -v libgcc > $1/depends-nokernel-nolibc.dot
 		grep -v update- $1/depends-nokernel-nolibc.dot > $1/depends-nokernel-nolibc-noupdate.dot
 		grep -v kernel-module $1/depends-nokernel-nolibc-noupdate.dot > $1/depends-nokernel-nolibc-noupdate-nomodules.dot
-- 
2.5.5



Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CA15E71AC9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 16:41:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 19 Aug 2017 09:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="1005548518"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga003.jf.intel.com with ESMTP; 19 Aug 2017 09:41:55 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 09:41:35 -0700
Message-Id: <1503160895-23422-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] kernel.bbclass: external toolchain fix
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
X-List-Received-Date: Sat, 19 Aug 2017 16:41:54 -0000

Refactor get_cc_option so it is simpler and also does not fail
when using external toolchain.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2a76554..3cc0432 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -259,12 +259,9 @@ get_cc_option () {
 		# Check if KERNEL_CC supports the option "file-prefix-map".
 		# This option allows us to build images with __FILE__ values that do not
 		# contain the host build path.
-		cc_option_supported=`${KERNEL_CC} -Q --help=joined | grep ffile-prefix-map`
-		cc_extra=""
-		if [ $cc_option_supported = "-ffile-prefix-map=<old=new>" ]; then
-			cc_extra=-ffile-prefix-map=${S}=/kernel-source/
+		if ${KERNEL_CC} -Q --help=joined | grep -q "\-ffile-prefix-map=<old=new>"; then
+			echo "-ffile-prefix-map=${S}=/kernel-source/"
 		fi
-		echo $cc_extra
 }
 
 kernel_do_compile() {
-- 
2.7.4



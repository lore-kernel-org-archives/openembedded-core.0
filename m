Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 850FB7017D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 03:24:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2016 20:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,577,1473145200"; d="scan'208";a="1053317605"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2016 20:24:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 16:24:22 +1300
Message-Id: <ea8c34f8572f12b3fdf6f7bb9512b838a294d986.1477970643.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477970643.git.paul.eggleton@linux.intel.com>
References: <cover.1477970643.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477970643.git.paul.eggleton@linux.intel.com>
References: <cover.1477970643.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_base: fix usage of & character in SDK_TITLE
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
X-List-Received-Date: Tue, 01 Nov 2016 03:24:53 -0000

If you used an & character in SDK_TITLE (possibly indirectly from
DISTRO_NAME) then sed interpreted this as a directive to paste in the
replaced string (@SDK_TITLE@ in this case). Escape any & characters in
SDK_TITLE to avoid that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 4462b52..a762655 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -223,7 +223,7 @@ EOF
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
-		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
+		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE", True).replace('&', '\&')}#g' \
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-- 
2.5.5



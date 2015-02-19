Return-Path: <brendan.le.foll@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E03EF735FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:45:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2015 07:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="687944365"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2015 07:45:21 -0800
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 15:45:10 +0000
Message-Id: <1424360710-29501-2-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1424360710-29501-1-git-send-email-brendan.le.foll@intel.com>
References: <1424360710-29501-1-git-send-email-brendan.le.foll@intel.com>
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [PATCH v2] openssl: disable SSLv3 by default
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
X-List-Received-Date: Thu, 19 Feb 2015 15:45:22 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Because of the SSLv3 POODLE vulnerability, it's preferred to simply disable
SSLv3 even if patched with the TLS_FALLBACK_SCSV

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 6eb1b5e..f42b1ea 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -16,6 +16,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 S = "${WORKDIR}/openssl-${PV}"
 
 PACKAGECONFIG[perl] = ",,,"
+# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
+# vulnerability
+PACKAGECONFIG[ssl3] = "--enable-ssl3, --no-ssl3,,"
 
 AR_append = " r"
 # Avoid binaries being marked as requiring an executable stack since it 
-- 
2.2.1



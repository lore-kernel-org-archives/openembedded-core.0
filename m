Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 792D3605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 21:33:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 16 Dec 2015 13:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,438,1444719600"; d="scan'208";a="842735153"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2015 13:33:05 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 13:24:07 -0800
Message-Id: <1450301047-6325-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH] oe-buildenv-internal: fix return code
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
X-List-Received-Date: Wed, 16 Dec 2015 21:33:06 -0000

The script oe-buildenv-internal is called from oe-init-build-env.
Make sure oe-init-buildenv does not return an error if BB_ENV_EXTRAWHITE is
already set, otherwise this will cause oe-init-build-env to fail.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/oe-buildenv-internal | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 51e449a..457763b 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -110,4 +110,6 @@ SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
 
 echo "$BB_ENV_EXTRAWHITE" | grep -q "${BB_ENV_EXTRAWHITE_OE}"
-[ $? != 0 ] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE_OE} $BB_ENV_EXTRAWHITE"
+if [ $? != 0 ]; then
+     export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE_OE} $BB_ENV_EXTRAWHITE"
+fi
-- 
1.9.1



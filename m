Return-Path: <juro.bystricky@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 538F3747DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 19:57:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 12:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,416,1517904000"; d="scan'208";a="32203432"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 06 Apr 2018 12:57:09 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 12:57:21 -0700
Message-Id: <1523044641-56994-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523044641-56994-1-git-send-email-juro.bystricky@intel.com>
References: <1523044641-56994-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] python-xcbgen_1.12: improve reproducibility
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
X-List-Received-Date: Fri, 06 Apr 2018 19:57:09 -0000

In order to remove timestamps from all .pyc files we need to recompile
them with python3-native, as we cannot rely on the host python being
able to do that. Both python-native and python3-native derive the timestamp
from SOURCE_DATE_EPOCH if present.
However, building python3-native can be computationally expensive, so
we resort to python3-native only when building reproducible packages:
(BUILD_REPRODUCIBLE_BINARIES = '1'), otherwise we use the host python3.

[YOCTO #12543]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 25a8373..02a42af 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -20,6 +20,11 @@ SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c48
 
 inherit autotools pkgconfig
 
+# We prefer using host Python, but for reproducible builds we need to resort to
+# python3-native in order to have timestamps in compiled modules based on SOURCE_DATE_EPOCH.
+# We cannot assume host Python supports SOURCE_DATE_EPOCH.
+inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'python3native', '')}
+
 # Force the use of Python 3 and a specific library path so we don't need to
 # depend on python3-native
 CACHED_CONFIGUREVARS += "PYTHON=python3 am_cv_python_pythondir=${libdir}/xcb-proto"
-- 
2.7.4



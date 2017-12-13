Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7D0786BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:31:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,398,1508828400"; d="scan'208";a="12082174"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Dec 2017 13:31:42 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 13:31:13 -0800
Message-Id: <1513200676-59900-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/4] compiler-options.bbclass: provide and validate options
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
X-List-Received-Date: Wed, 13 Dec 2017 21:31:41 -0000

As we may be using external toolchains, we cannot assume
various compiler options to be valid.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/compiler-options.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes/compiler-options.bbclass

diff --git a/meta/classes/compiler-options.bbclass b/meta/classes/compiler-options.bbclass
new file mode 100644
index 0000000..fdd45e8
--- /dev/null
+++ b/meta/classes/compiler-options.bbclass
@@ -0,0 +1,24 @@
+
+# Some compiler options are not universal and using them when not
+# supported can cause build errors.
+#
+# Check for a compiler option -ffile-prefix-map.
+# This option is present in OE-core GCC, but may not be present when
+# using external toolchains.
+#
+# The option can remap any hard-coded __FILE__ typically containing build
+# host path to a reproducible value, with the absolute build-host path
+# stripped. This is essential in order to achieve reproducible builds.
+#
+# Typical usage:
+#
+#    inherit compiler-options
+#    cc_extra=$(file_prefix_map_option_supported ${CC})
+#    oe_runmake CFLAGS="${CFLAGS} $cc_extra"
+#
+
+file_prefix_map_option_supported () {
+	if $1 -Q --help=joined | grep -q "\-ffile-prefix-map=<old=new>"; then
+		echo "-ffile-prefix-map=${S}=/${BP}/"
+	fi
+}
-- 
2.7.4



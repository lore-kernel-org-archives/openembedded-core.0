Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA3777D52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337362"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:26 -0700
Message-Id: <1502300913-40295-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 04/11] busybox.inc: improve reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:03 -0000

For reproducible builds do not generate build timestamp as part of
the version string.

Remove host tools references from .config file.
With this patch all eight busybox packages are built as
binary reproducible.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b8edd39..735b1f6 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -102,6 +102,9 @@ python () {
 }
 
 do_prepare_config () {
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		export KCONFIG_NOTIMESTAMP=1
+	fi
 	sed -e '/CONFIG_STATIC/d' \
 		< ${WORKDIR}/defconfig > ${S}/.config
 	echo "# CONFIG_STATIC is not set" >> .config
@@ -118,6 +121,7 @@ do_prepare_config () {
 		  ${S}/.config.oe-tmp > ${S}/.config
 	fi
 	sed -i 's/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"/' ${S}/.config
+	sed -i 's|${DEBUG_PREFIX_MAP}||g' ${S}/.config
 }
 
 # returns all the elements from the src uri that are .cfg files
@@ -138,6 +142,9 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		export KCONFIG_NOTIMESTAMP=1
+	fi
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
 	# split the .config into two parts, and make two busybox binaries
 		if [ -e .config.orig ]; then
-- 
2.7.4



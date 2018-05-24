Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF9874840
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:36:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 02:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="42455585"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 24 May 2018 02:36:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 12:36:47 +0300
Message-Id: <20180524093649.6911-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
References: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] qemuwrapper-cross: always fall back to x86_64 and i386 variants of qemu
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
X-List-Received-Date: Thu, 24 May 2018 09:36:54 -0000

This helps in particular when executing nativesdk- postinsts; previously
they were attempted only with target qemu, and this obivously failed.

This could be solved by properly mapping the binary to be run to the
best available qemu variant for the binary architecture, but that
would be a lot more invasive change, and so I think a simple fallback
should be fine.

Also, add 'set -x' so we know exactly what is being executed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../qemu/qemuwrapper-cross_1.0.bb             | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index c983fbae667..d90ce36ba90 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -16,31 +16,24 @@ do_install () {
 	echo "#!/bin/sh" > ${D}${bindir_crossscripts}/qemuwrapper
 	qemu_binary=${@qemu_target_binary(d)}
 	qemu_options='${QEMU_OPTIONS}'
+	echo "set -x" >> ${D}${bindir_crossscripts}/qemuwrapper
 	echo "$qemu_binary $qemu_options \"\$@\"" >> ${D}${bindir_crossscripts}/qemuwrapper
-	fallback_qemu_bin=
-	case $qemu_binary in
-		"qemu-i386")
-			fallback_qemu_bin=qemu-x86_64
-			;;
-		"qemu-x86_64")
-			fallback_qemu_bin=qemu-i386
-			;;
-		*)
-			;;
-	esac
-
-	if [ -n "$fallback_qemu_bin" ]; then
-
-		cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
+
+	cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
 rc=\$?
 if [ \$rc = 255 ]; then
-	$fallback_qemu_bin "\$@"
+	qemu-x86_64 $qemu_options "\$@"
 	rc=\$?
 fi
-exit \$rc
 EOF
 
-	fi
+	cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
+if [ \$rc = 255 ]; then
+	qemu-i386 $qemu_options "\$@"
+	rc=\$?
+fi
+exit \$rc
+EOF
 
 	chmod +x ${D}${bindir_crossscripts}/qemuwrapper
 }
-- 
2.17.0



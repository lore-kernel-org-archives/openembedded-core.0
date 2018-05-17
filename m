Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 61BB77459D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395418"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:37 +0300
Message-Id: <20180517113837.24240-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/10] qemuwrapper-cross: always fall back to x86_64 and i386 variants of qemu
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
X-List-Received-Date: Thu, 17 May 2018 11:46:15 -0000

This helps in particular when executing nativesdk- postinsts; previously
they were attempted only with target qemu, and this obivously failed.

This could be solved by properly mapping the binary to be run to the
best available qemu variant for the binary architecture, but that
would be a lot more invasive change, and so I think a simple fallback
should be fine.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../qemu/qemuwrapper-cross_1.0.bb             | 28 ++++++++-----------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index c983fbae667..091aa52a33e 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -17,30 +17,24 @@ do_install () {
 	qemu_binary=${@qemu_target_binary(d)}
 	qemu_options='${QEMU_OPTIONS}'
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
+	qemu-x86_64 "\$@"
 	rc=\$?
 fi
 exit \$rc
 EOF
 
-	fi
+	cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
+rc=\$?
+if [ \$rc = 255 ]; then
+	qemu-i386 "\$@"
+	rc=\$?
+fi
+exit \$rc
+EOF
 
 	chmod +x ${D}${bindir_crossscripts}/qemuwrapper
 }
-- 
2.17.0



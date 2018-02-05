Return-Path: <juro.bystricky@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 590ED600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:26:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 10:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,465,1511856000"; d="scan'208";a="16021972"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 05 Feb 2018 10:26:26 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 10:26:39 -0800
Message-Id: <1517855199-67449-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] glibc: improve reproducibility with multilib
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
X-List-Received-Date: Mon, 05 Feb 2018 18:26:27 -0000

Multilib builds specify several loaders which will end up embedded in
some binaries or script files. To support reproducible builds, we must
ensure the loaders are always in deterministic order.

[YOCTO #2655]
[YOCTO #12478]
[YOCTO #12480]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glibc/glibc-ld.inc  | 4 ++--
 meta/recipes-core/glibc/glibc_2.26.bb | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index c1d635d..607b27c 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -38,8 +38,8 @@ def glibc_dl_info(d):
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         ld_append_if_tune_exists(localdata, infos, ld_info_all)
-    infos['ldconfig'] = ','.join(infos['ldconfig'])
-    infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
+    infos['ldconfig'] = ','.join(sorted(infos['ldconfig']))
+    infos['lddrewrite'] = ' '.join(sorted(infos['lddrewrite']))
     return infos
 
 EGLIBC_KNOWN_INTERPRETER_NAMES = "${@glibc_dl_info(d)['ldconfig']}"
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 7eb56b3..df520bd 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -133,12 +133,10 @@ do_compile () {
 	if [ -n "${RTLDLIST}" ]
 	then
 		prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST="\?\([^"]*\)"\?$#\1#'`
-		if [ "${prevrtld}" != "${RTLDLIST}" ]
-		then
-			sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
-		fi
+		# remove duplicate entries
+		newrtld=`echo "${prevrtld} ${RTLDLIST}" | xargs -n1 | sort -u | xargs`
+		sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${newrtld}\"#"
 	fi
-
 }
 
 # Use the host locale archive when built for nativesdk so that we don't need to
-- 
2.7.4



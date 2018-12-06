Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF2196C11F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 08:57:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB68uSc1003749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2018 00:56:38 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Dec 2018 00:56:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 6 Dec 2018 16:56:15 +0800
Message-ID: <1544086575-9621-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] glibc: improve reproducibility with multilib
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
X-List-Received-Date: Thu, 06 Dec 2018 08:57:04 -0000
Content-Type: text/plain

Multilib builds specify several loaders which will end up embedded in
some binaries or script files. To support reproducible builds, we must
ensure the loaders are always in deterministic order.

[YOCTO #2655]
[YOCTO #12478]
[YOCTO #12480]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

Improve the fix and rebase it to 2.28

Here is the log of lib32-glibc
[log.do_compile]
|Adjust ldd script
|ldd "/lib64/ld-linux-x86-64.so.2 /lib/ld-linux.so.2 /lib/ld-linux.so.2
/lib64/ld-linux-x86-64.so.2" -> "/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2"
[log.do_compile]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glibc/glibc-ld.inc  | 4 ++--
 meta/recipes-core/glibc/glibc_2.28.bb | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index bb167b3..041ffbb 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -10,8 +10,8 @@ def glibc_dl_info(d):
         infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
         infos['lddrewrite'].add(loader)
 
-    infos['ldconfig'] = ','.join(infos['ldconfig'])
-    infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
+    infos['ldconfig'] = ','.join(sorted(infos['ldconfig']))
+    infos['lddrewrite'] = ' '.join(sorted(infos['lddrewrite']))
     return infos
 
 EGLIBC_KNOWN_INTERPRETER_NAMES = "${@glibc_dl_info(d)['ldconfig']}"
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index d072939..a107c58 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -122,10 +122,10 @@ do_compile () {
 	if [ -n "${RTLDLIST}" ]
 	then
 		prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST="\?\([^"]*\)"\?$#\1#'`
-		if [ "${prevrtld}" != "${RTLDLIST}" ]
-		then
-			sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
-		fi
+		# remove duplicate entries
+		newrtld=`echo $(printf '%s\n' ${prevrtld} ${RTLDLIST} | LC_ALL=C sort -u)`
+		echo "ldd \"${prevrtld} ${RTLDLIST}\" -> \"${newrtld}\""
+		sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${newrtld}\"#"
 	fi
 
 }
-- 
2.7.4



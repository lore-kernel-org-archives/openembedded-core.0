Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UB2M0-0004AK-Df
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 13:12:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Feb 2013 03:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="291766158"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2013 03:56:28 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 13:56:26 +0200
Message-Id: <1362052586-27170-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] eglibc: fix ldd RTLDLIST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 12:12:58 -0000

The sed expression for retrieving the previous RTLDLIST from ldd script
was also retrieving the double-quotes. Hence, we ended up with a
RTLDLIST like below and ldd would fail:

RTLDLIST=""/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.2" /lib/ld-linux-x86-64.so.2"

[YOCTO #3903]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/eglibc/eglibc_2.17.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index fb49ac4..6526978 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -144,7 +144,7 @@ do_compile () {
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
 	then
-		prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST=\(.*\)$#\1#'`
+		prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST="\?\([^"]*\)"\?$#\1#'`
 		if [ "${prevrtld}" != "${RTLDLIST}" ]
 		then
 			sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
-- 
1.7.9.5




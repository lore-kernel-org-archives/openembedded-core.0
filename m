Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1U0agl-0003Ww-47
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 17:39:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2013 08:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,569,1355126400"; d="scan'208";a="280406009"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2013 08:23:23 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 18:26:40 +0200
Message-Id: <1359563200-28139-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] eglibc: don't list the same path twice in RTLDLIST
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
X-List-Received-Date: Wed, 30 Jan 2013 16:39:07 -0000

Before modifying RTLDLIST in ldd, make sure that it doesn't already
contain the right path, thus avoiding duplicate entries in RTLDLIST.

[YOCTO #2655]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-core/eglibc/eglibc_2.17.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index c1cae4f..7bdb267 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
@@ -143,8 +143,11 @@ do_compile () {
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
 	then
-		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
-		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+		prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST=\(.*\)$#\1#'`
+		if [ "${prevrtld}" != "${RTLDLIST}" ]
+		then
+			sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
+		fi
 	fi
 
 }
-- 
1.7.10.4




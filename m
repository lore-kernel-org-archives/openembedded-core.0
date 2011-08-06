Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QpYRF-0001xc-Ix
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:24:41 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p764K9SG002298;
	Fri, 5 Aug 2011 21:20:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Aug 2011 00:19:49 -0400
Message-Id: <3256aec813ceb04aec8921014fff20415697648a.1312604261.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/4] linux-yocto: pass KMACHINE to updateme, not MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Aug 2011 04:24:42 -0000

To support the mapping of any oe/yocto MACHINE to a kernel
branch that may not share that naming structure we have
KMACHINE and KBRANCH. To allow the mapping to work, we
actually have to pass KMACHINE into updateme and not MACHINE.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a374df1..5e7003b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -28,7 +28,7 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
-	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${MACHINE} ${WORKDIR}
+	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
-- 
1.7.4.1




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcU-0000u0-1i
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584257"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:37 -0700
Message-Id: <d4d2c170055d8413d0cc0e597e714895b35f8b87.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 10/14] opkg: Add the condition for the content of arch.conf when enable multilib
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:06 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

After successfully installed some lib32 multilib packages into the
x86-64 image, we just found that the file content of /var/lib/opkg/status in
rootfs changed after the very 1st boot, many lib32 related packages information
are missing in that file.

The missing arch "x86" in arch.conf cause the above problem. Adding the
condition for the content of arch.conf when enable multilib. If build
multilib image, "ALL_MULTILIB_PACKAGE_ARCHS" will be used instead of
"PACKAGE_ARCHS".

[YOCTO #1522]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
index 3a559cb..f37b2db 100644
--- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
@@ -9,7 +9,12 @@ do_compile() {
 	archconf=${S}/${sysconfdir}/opkg/arch.conf
 
 	rm -f $archconf
-	ipkgarchs="${PACKAGE_ARCHS}"
+	multilibs="${@d.getVar('MULTILIBS',True)}"
+	if [ "X${multilibs}"  == "XNone" ]; then
+		ipkgarchs="${PACKAGE_ARCHS}"
+	else
+		ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
+	fi
 	priority=1
 	for arch in $ipkgarchs; do 
 		echo "arch $arch $priority" >> $archconf
-- 
1.7.7.6




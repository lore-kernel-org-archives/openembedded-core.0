Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rasnw-0006GU-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 18:39:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Dec 2011 09:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102185610"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2011 09:32:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:31:38 +0000
Message-Id: <262f9706b59cd14bbbb9d8d00763d648261140bc.1323883800.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323883800.git.paul.eggleton@linux.intel.com>
References: <cover.1323883800.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323883800.git.paul.eggleton@linux.intel.com>
References: <cover.1323883800.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] scripts/runqemu: show an error if /dev/net/tun is unusable
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
X-List-Received-Date: Wed, 14 Dec 2011 17:39:44 -0000

If /dev/net/tun is either not present or is not writable by the
user, then show an appropriate error message. (QEMU needs access to this
device in order to enable networking; it may be missing if it is not
enabled or loaded into the kernel, and some distributions such as CentOS
5.x set restrictive permissions upon it.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4adeace..bed6a29 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -194,6 +194,14 @@ while [ $i -le $# ]; do
     i=$((i + 1))
 done
 
+if [ ! -c /dev/net/tun ] ; then
+	echo "TUN control device /dev/net/tun is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)"
+	exit 1
+elif [ ! -w /dev/net/tun ] ; then
+	echo "TUN control device /dev/net/tun is not writable, please fix (e.g. sudo chmod 666 /dev/net/tun)"
+	exit 1
+fi
+
 YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
 # Detect KVM configuration
 if [[ "x$KVM_ENABLED" == "xyes" ]]; then
-- 
1.7.5.4




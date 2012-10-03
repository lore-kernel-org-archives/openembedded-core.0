Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TJMlU-0005i0-1z
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:05:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Oct 2012 03:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="151885460"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Oct 2012 03:52:17 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 13:51:46 +0300
Message-Id: <1349261506-2829-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu: Fixed running QEMU with virtio error reporting
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
X-List-Received-Date: Wed, 03 Oct 2012 11:05:20 -0000

If vhost_net module is not properly installed,
runqemu script will report the error and
provide the user with a link to the guide.
Also corrected small cosmetic issues in
runqemu script messages.

Fixes [YOCTO #3184]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e6e43f2..5608c72 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -223,13 +223,13 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
     fi
     if [ ! -e /dev/kvm ]; then
         echo "Missing KVM device. Have you inserted kvm modules?"
-        echo "For further help see"
+        echo "For further help see:"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
     if [ ! -e /dev/vhost-net ]; then
         echo "Missing virtio net device. Have you inserted vhost-net module?"
-        echo "For further help see"
+        echo "For further help see:"
         echo "$YOCTO_PARAVIRT_KVM_WIKI";
         exit 1;
     fi
@@ -238,13 +238,13 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         KVM_ACTIVE="yes"
     else
         echo "You have no rights on /dev/kvm."
-        echo "Please change the ownership of this file as described at"
+        echo "Please change the ownership of this file as described at:"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
+    if ! 9<>/dev/vhost-net ; then
         echo "You have no rights on /dev/vhost-net."
-        echo "Please change the ownership of this file as described at"
+        echo "Please change the ownership of this file as described at:"
         echo "$YOCTO_PARAVIRT_KVM_WIKI";
         exit 1;
     fi
-- 
1.7.9.5




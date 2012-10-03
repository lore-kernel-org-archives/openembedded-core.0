Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TJO7v-000813-Dp
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:32:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Oct 2012 05:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="151909976"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Oct 2012 05:19:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:18:58 +0300
Message-Id: <1349266739-30887-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] qemu: Fixed running QEMU with virtio error reporting
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
X-List-Received-Date: Wed, 03 Oct 2012 12:32:35 -0000

If vhost_net module is not properly installed,
runqemu script will report the error and
provide the user with a link to the guide.
Also corrected small cosmetic issues in
runqemu script messages.
Also removed <> (read/write) check.

Fixes [YOCTO #3184]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e6e43f2..fb7ac56 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -223,28 +223,28 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
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
-    if 9<>/dev/kvm ; then
+    if [ -w /dev/kvm -a -r /dev/kvm ]; then
         SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
         KVM_ACTIVE="yes"
     else
         echo "You have no rights on /dev/kvm."
-        echo "Please change the ownership of this file as described at"
+        echo "Please change the ownership of this file as described at:"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
+    if [ ! -w /dev/vhost-net -o ! -r /dev/vhost-net ]; then
         echo "You have no rights on /dev/vhost-net."
-        echo "Please change the ownership of this file as described at"
+        echo "Please change the ownership of this file as described at:"
         echo "$YOCTO_PARAVIRT_KVM_WIKI";
         exit 1;
     fi
-- 
1.7.9.5




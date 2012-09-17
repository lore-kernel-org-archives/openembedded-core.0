Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TDa75-00035R-2c
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:07:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Sep 2012 04:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,435,1344236400"; d="scan'208";a="193591970"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2012 04:55:03 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 17 Sep 2012 12:55:17 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.34]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.51]) with mapi id
	14.01.0355.002; Mon, 17 Sep 2012 12:54:54 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] qemux86: Support for KVM, paravirt and virtio added
Thread-Index: AQHNlMsidcpK/dgmLkeIgVbhtYwI/5eObLbw
Date: Mon, 17 Sep 2012 11:55:16 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16195A05@IRSMSX102.ger.corp.intel.com>
References: <1347882817-3118-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1347882817-3118-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] qemux86: Support for KVM, paravirt and virtio added
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
X-List-Received-Date: Mon, 17 Sep 2012 12:07:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore previous patch, it had a slightly wrong commit message.

Thanks,
Cristian.

-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, September 17, 2012 2:54 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH] qemux86: Support for KVM, paravirt and virtio added

KVM, paravirtualization and virtio drivers are now activated in runqemu usi=
ng the kvm option flag for qemux86.
Host CPU features are also exported to guest OS (Yocto Linux).
Usage example: runqemu qemux86 core-image-x11 kvm

Implements [YOCTO #2550].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 +
 scripts/runqemu                              |   16 +++++++++++++++-
 scripts/runqemu-internal                     |   14 +++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_3.4.bb
index 7c082e7..32ae02b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -27,4 +27,5 @@ KERNEL_REVISION_CHECKING=3D""
 KERNEL_FEATURES_append =3D " features/netfilter"
 KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
+KERNEL_FEATURES_append_qemux86=3D" cfg/paravirt_kvm"
 KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32",=
 " cfg/x32", "" ,d)}"
diff --git a/scripts/runqemu b/scripts/runqemu index e843946..167e157 10075=
5
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -208,6 +208,7 @@ if [ -z "$MACHINE" ]; then  fi
=20
 YOCTO_KVM_WIKI=3D"https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for=
_Poky_qemu"
+YOCTO_PARAVIRT_KVM_WIKI=3D"https://wiki.yoctoproject.org/wiki/Running_an_x=
86_Yocto_Linux_image_under_QEMU_KVM"
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" =3D "xyes" ]; then
     if [ -z "$KVM_CAPABLE" ]; then
@@ -226,14 +227,27 @@ if [ "x$KVM_ENABLED" =3D "xyes" ]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
+    if [ ! -e /dev/vhost-net ]; then
+        echo "Missing virtio net device. Have you inserted vhost-net modul=
e?"
+        echo "For further help see"
+        echo "$YOCTO_PARAVIRT_KVM_WIKI";
+        exit 1;
+    fi
     if 9<>/dev/kvm ; then
-        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm"
+        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
+        KVM_ACTIVE=3D"yes"
     else
         echo "You have no rights on /dev/kvm."
         echo "Please change the ownership of this file as described at"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
+    if [ ! -w /dev/vhost-net -a -r /dev/vhost-net ]; then
+        echo "You have no rights on /dev/vhost-net."
+        echo "Please change the ownership of this file as described at"
+        echo "$YOCTO_PARAVIRT_KVM_WIKI";
+        exit 1;
+    fi
 fi
=20
 machine2=3D`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'` diff --git a/sc=
ripts/runqemu-internal b/scripts/runqemu-internal index a9b1c44..f2c8d83 10=
0755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -221,7 +221,15 @@ n2=3D$(($n1 + 1))
=20
 KERNEL_NETWORK_CMD=3D"ip=3D192.168.7.$n2::192.168.7.$n1:255.255.255.0"
 QEMU_TAP_CMD=3D"-net tap,vlan=3D0,ifname=3D$TAP,script=3Dno,downscript=3Dn=
o"
-QEMU_NETWORK_CMD=3D"-net nic,vlan=3D0 $QEMU_TAP_CMD"
+if [ "$KVM_ACTIVE" =3D "yes" ]; then
+    QEMU_NETWORK_CMD=3D"-net nic,model=3Dvirtio $QEMU_TAP_CMD,vhost=3Don"
+    DROOT=3D"/dev/vda"
+    ROOTFS_OPTIONS=3D"-drive file=3D$ROOTFS,if=3Dvirtio"
+else
+    QEMU_NETWORK_CMD=3D"-net nic,vlan=3D0 $QEMU_TAP_CMD"
+    DROOT=3D"/dev/hda"
+    ROOTFS_OPTIONS=3D"-hda $ROOTFS"
+fi
 KERNCMDLINE=3D"mem=3D$QEMU_MEMORY"
 QEMU_UI_OPTIONS=3D"-show-cursor -usb -usbdevice wacom-tablet"
=20
@@ -321,8 +329,8 @@ if [ "$MACHINE" =3D "qemux86" ]; then
     QEMU=3Dqemu-system-i386
     QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" =3D "ext2" -o "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "bt=
rfs" ]; then
-        KERNCMDLINE=3D"vga=3D0 root=3D/dev/hda rw mem=3D$QEMU_MEMORY $KERN=
EL_NETWORK_CMD"
-        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
+        KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERNEL=
_NETWORK_CMD"
+        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" =3D "nfs" ]; then
         if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
--
1.7.9.5




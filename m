Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TEEdI-00086l-V6
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 09:23:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 00:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="207658021"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2012 00:10:58 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 19 Sep 2012 08:10:45 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.34]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.142]) with mapi id
	14.01.0355.002; Wed, 19 Sep 2012 08:10:44 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added
Thread-Index: AQHNljVuicNadDNSkkaLxR+G6e5ikpeRPxnA
Date: Wed, 19 Sep 2012 07:10:44 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161979C7@IRSMSX102.ger.corp.intel.com>
References: <1348038415-18757-1-git-send-email-cristian.iorga@intel.com>
	<1348038415-18757-2-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1348038415-18757-2-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added
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
X-List-Received-Date: Wed, 19 Sep 2012 07:23:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.
Do not merge it, it was a left-over.

Thanks,
Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Wednesday, September 19, 2012 10:07 AM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added

    KVM, paravirtualization and virtio drivers are now activated
    in runqemu using the kvm option flag for qemux86-64.
    Host CPU features are also exported to guest OS (Yocto Linux).
    Usage example: runqemu qemux86-64 core-image-x11 kvm

    Implements [YOCTO #2550].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
 scripts/runqemu-internal                     |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_3.4.bb
index 32ae02b..06dd677 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.4.g=
it;protocol=3Dgit;nocheckou
=20
 LINUX_VERSION ?=3D "3.4.10"
=20
-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.3"
 PV =3D "${LINUX_VERSION}+git${SRCPV}"
=20
 KMETA =3D "meta"
@@ -28,4 +28,5 @@ KERNEL_FEATURES_append =3D " features/netfilter"
 KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
 KERNEL_FEATURES_append_qemux86=3D" cfg/paravirt_kvm"
+KERNEL_FEATURES_append_qemux86-64=3D" cfg/paravirt_kvm"
 KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32",=
 " cfg/x32", "" ,d)}"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index f2c8=
d83..6e20dd7 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -350,8 +350,8 @@ if [ "$MACHINE" =3D "qemux86-64" ]; then
     QEMU=3Dqemu-system-x86_64
     QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
-        KERNCMDLINE=3D"vga=3D0 root=3D/dev/hda rw mem=3D$QEMU_MEMORY $KERN=
EL_NETWORK_CMD"
-        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
+        KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERNEL=
_NETWORK_CMD"
+        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" =3D "nfs" ]; then
         if [ "x$ROOTFS" =3D "x" ]; then
--
1.7.9.5




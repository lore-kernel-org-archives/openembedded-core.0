Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1URdeG-0006Cg-2O
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 09:16:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2013 23:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,473,1363158000"; d="scan'208";a="322364606"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2013 23:58:48 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.99]) with mapi id
	14.01.0355.002; Mon, 15 Apr 2013 07:58:47 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"tom.zanussi@linux.intel.com" <tom.zanussi@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>, "paul.eggleton@linux.intel.com"
	<paul.eggleton@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] qemu: use default qemu CPU definition
Thread-Index: AQHONTEzzogKG8eaq0Cq/S5+oM4y/JjW4qZA
Date: Mon, 15 Apr 2013 06:58:46 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16224803@IRSMSX102.ger.corp.intel.com>
References: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: use default qemu CPU definition
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
X-List-Received-Date: Mon, 15 Apr 2013 07:16:33 -0000
X-List-Received-Date: Mon, 15 Apr 2013 07:16:33 -0000
X-List-Received-Date: Mon, 15 Apr 2013 07:16:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

See my comments regarding this patch at:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alex DAMIAN
Sent: Tuesday, April 09, 2013 5:47 PM
To: richard.purdie@linuxfoundation.org; tom.zanussi@linux.intel.com; Burton=
, Ross; paul.eggleton@linux.intel.com; openembedded-core@lists.openembedded=
.org
Cc: Damian, Alexandru
Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This fixes guest crashes when trying to use restricted instructions based o=
n CPU description. Using default qemu CPU descriptions restrict faults on u=
sing restricted model-specific registers.

[YOCTO #3908]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/runqemu          |    2 +-
 scripts/runqemu-internal |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600 10075=
5
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -261,7 +261,7 @@ if [ "x$KVM_ENABLED" =3D "xyes" ]; then
         exit 1;
     fi
     if [ -w /dev/kvm -a -r /dev/kvm ]; then
-        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
+        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm "
         KVM_ACTIVE=3D"yes"
     else
         echo "You have no rights on /dev/kvm."
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index e819=
1d1..a7813e5 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -323,10 +323,11 @@ fi
=20
 if [ "$MACHINE" =3D "qemux86" ]; then
     QEMU=3Dqemu-system-i386
+    QEMU_CPU_OPTIONS=3D"-cpu qemu32"
     QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" =3D "ext2" -o "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "bt=
rfs" ]; then
         KERNCMDLINE=3D"vga=3D0 uvesafb.mode_option=3D640x480-32 root=3D$DR=
OOT rw mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS=
 $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" =3D "nfs" ]; then
         if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ]; then @@=
 -347,10 +348,11 @@ fi
=20
 if [ "$MACHINE" =3D "qemux86-64" ]; then
     QEMU=3Dqemu-system-x86_64
+    QEMU_CPU_OPTIONS=3D"-cpu qemu64"
     QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
     if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
         KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERNEL=
_NETWORK_CMD"
-        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
+        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS=
 $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" =3D "nfs" ]; then
         if [ "x$ROOTFS" =3D "x" ]; then
--
1.7.10.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



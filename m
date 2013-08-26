Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E908A6BA77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:35:41 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so3797365pad.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6hiSx0J/xgizCSwrd9cA1B9KkbmlACB0vH3FHYeRexs=;
	b=Qxoae3DkfLcGdDzO9T8XnbyRk0ZaB0adAlFRMZSY2zfdSBNSsgbbNNDwn7lCNoRYoV
	eZR02QIjn+rqc3h+25Ytz3ooBGfpD+uMiltjtHRkgA7EDYHvXzA/aY5dv8kEJ15BWycU
	pS/+XS5OJd+Rjl61d+eGMdIsKhQdKMMrCfDr14tVUg34pWhpMuDkqzTk0NXCUIDrrH4F
	0OwFr7WaKRK4oUMxXqrxtDMtHRFkAzA89xAkFbl78W4/HK/e3G2u/3gG28L+8RNnuaqZ
	ZKSRyupH/JAjxDVA9dNPw3RfQFTwJ9ND+2hoKSue4d1dTjkyJ6TajRpShEVOpTOM1cDI
	JkuQ==
X-Received: by 10.68.160.5 with SMTP id xg5mr4605274pbb.173.1377545742564;
	Mon, 26 Aug 2013 12:35:42 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	xe9sm19709310pbc.21.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 12:35:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521BA7CB.7070206@windriver.com>
Date: Mon, 26 Aug 2013 23:35:35 +0400
Message-Id: <2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Aug 2013 19:35:43 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_027EAECB-7C90-49B8-A9BE-9E4A9BEC1202"

--Apple-Mail=_027EAECB-7C90-49B8-A9BE-9E4A9BEC1202
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi Bruce,

On Aug 26, 2013, at 11:08 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> Are you interested in something from scratch, versus something that
> isn't already partially in the tree (like qemuarma9) ?
>=20
> We've got a few docs and tutorials, but I can also help step you =
through
> the process to assist the existing material.

I'd like to adapt the existing linux-yocto standard/base branch, and =
build up on existing qemuarma9 support. I've included detailed patch =
fragments below, so that you can replicate the current state of my work =
at your end.

I've performed the following steps till date, but unfortunately get a =
qemu ram / rom out of memory address error after doing all this. Must be =
because of an incorrectly mapped KMACHINE. The vexpress device doesn't =
support PCI, IDE or SCSI, only microsd card or ram devices, so the boot =
method should use an initrd file, for the root filesystem, as described =
here.

https://wiki.linaro.org/PeterMaydell/QemuVersatileExpress

Step 01.00: Clone linux-yocto-3.8 locally, create local meta branch, =
create local standard/qemuarma9 branch, tracking the master branch.

Make the following modification to the qemuarma9-standard.scc file.

=46rom 8e9b465f242941b70d7b61045c073e82700fcd91 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Mon, 26 Aug 2013 22:18:24 +0400
Subject: [PATCH] qemuarma9: Update branch to qemuarma9.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc =
b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
index c71fe1c..729125d 100644
--- a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
+++ b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
@@ -3,7 +3,7 @@ define KTYPE standard
 define KARCH arm
=20
 include ktypes/standard/standard.scc
-branch arm-versatile-926ejs
+branch qemuarma9
=20
 include qemuarma9.scc
=20
--=20
1.7.10.4


Step 02.00: Create a new qemuarma9.conf machine definition.

There is a dts file in arch/arm/boot/dts called vexpress-v2p-ca9.dts.=20

Q01: I guess the KMACHINE_qemuarma9 should be set to "vex press" ? =
instead of qemuarma9 below?

#@TYPE: Machine
#@NAME: qemuarma9
#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9.

# Specify the default tune.
DEFAULTTUNE =3D "armv7a-neon"

require conf/machine/include/qemu.inc
require conf/machine/include/tune-cortexa9.inc

# Specify the preferred kernel recipe version.
PREFERRED_VERSION_linux-yocto ?=3D "3.8%"

# Specify the machine name used by the kernel.
KMACHINE_qemuarma9 =3D "qemuarma9"  # Error?!!

# Specify the kernel image type.
KERNEL_IMAGETYPE =3D "uImage"

MACHINE_DEVICETREE :=3D "qemuarma9.dts"=20

# Specify the serial console parameters.
SERIAL_CONSOLE =3D "115200 ttyAMA0"


Step 03.00: Patch the oe-core sources.

Step 03.01: Patch scripts/runqemu

@@ -37,10 +37,11 @@ usage() {
     echo "  qemuparams=3D\"xyz\" - specify custom parameters to QEMU"
     echo "  bootparams=3D\"xyz\" - specify custom kernel parameters =
during boot"
     echo ""
     echo "Examples:"
     echo "  $MYNAME qemuarm"
+    echo "  $MYNAME qemuarma9 ramfs"
     echo "  $MYNAME qemux86-64 core-image-sato ext3"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ =
serial"
     echo "  $MYNAME qemux86 ramfs"
     echo "  $MYNAME qemux86 iso"
     echo "  $MYNAME qemux86 qemuparams=3D\"-m 256\""
@@ -105,11 +106,11 @@ process_filename() {
 # bit more complex, but offers a great user experience.
 KVM_ENABLED=3D"no"
 while true; do
     arg=3D${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | =
"qemumipsel" | \
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarma9" |"qemumips" =
| "qemumipsel" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | =
"qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=3D$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
         "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs")
@@ -222,17 +223,17 @@ if [ "$FSTYPE" =3D "nfs" -a -z "$ROOTFS" ]; then
     error "NFS booting without an explicit ROOTFS path is not yet =
supported"
 fi
=20
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" =3D "xvmdk" ]; then
-        MACHINE=3D`basename $VM | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush=
4\).*/\1/'`
+        MACHINE=3D`basename $VM | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemu=
ppc\|qemush4\).*/\1/'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=3D`basename $KERNEL | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush=
4\).*/\1/'`
+        MACHINE=3D`basename $KERNEL | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemu=
ppc\|qemush4\).*/\1/'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename =
[$KERNEL]"
         fi
         echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
     fi
@@ -292,10 +293,13 @@ QEMUX86_64_DEFAULT_KERNEL=3DbzImage-qemux86-64.bin
 QEMUX86_64_DEFAULT_FSTYPE=3Dext3
=20
 QEMUARM_DEFAULT_KERNEL=3DzImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=3Dext3
=20
+QEMUARMA9_DEFAULT_KERNEL=3DuImage
+QEMUARMA9_DEFAULT_FSTYPE=3Dcpio.gz
+
 QEMUMIPS_DEFAULT_KERNEL=3Dvmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=3Dext3
=20
 QEMUMIPSEL_DEFAULT_KERNEL=3Dvmlinux-qemumipsel.bin
 QEMUMIPSEL_DEFAULT_FSTYPE=3Dext3


Step 03.02: Patch runqemu-internal.

@@ -48,10 +48,13 @@ else
             mem_size=3D128
             ;;
         "qemuarm")
             mem_size=3D128
             ;;
+        "qemuarma9")
+            mem_size=3D128
+            ;;
         "qemumicroblaze")
             mem_size=3D64
             ;;
         "qemumips"|"qemumips64")
             mem_size=3D128
@@ -265,10 +268,11 @@ else
         fi
 fi
=20
 case "$MACHINE" in
     "qemuarm") ;;
+    "qemuarma9") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
     "qemumipsel") ;;
     "qemumips64") ;;
     "qemush4") ;;
@@ -348,10 +352,39 @@ if [ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D =
"qemuarmv6" -o "$MACHINE" =3D "qemuarm
         QEMUOPTIONS=3D"$QEMUOPTIONS -cpu arm1136"
     fi
     if [ "$MACHINE" =3D "qemuarmv7" ]; then
         QEMUOPTIONS=3D"$QEMUOPTIONS -cpu cortex-a8"
     fi
+    if [ "$MACHINE" =3D "qemuarma9" ]; then
+        MACHINE_SUBTYPE=3Dvexpress-a9
+        QEMUOPTIONS=3D"$QEMUOPTIONS -cpu cortex-a9"
+    fi
+fi
+
+if [ "$MACHINE" =3D "qemuarma9" ]; then
+    QEMU=3Dqemu-system-arm
+    MACHINE_SUBTYPE=3Dvexpress-a9
+    QEMUOPTIONS=3D"$QEMUOPTIONS -cpu cortex-a9"
+    export QEMU_AUDIO_DRV=3D"none"
+    QEMU_UI_OPTIONS=3D"-show-cursor -usb"
+    # QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -force-pointer"
+    #QEMU_SYSTEM_OPTIONS=3D"-M $MACHINE_SUBTYPE -serial null -serial =
mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    if [ "${FSTYPE:0:3}" =3D "ext" -o "${FSTYPE:0:4}" =3D "cpio" ]; =
then
+        KERNCMDLINE=3D"earlyprintk root=3D/dev/mmcblk0p2 rw =
console=3DttyAMA0,115200 console=3Dtty $KERNEL_NETWORK_CMD =
mem=3D$QEMU_MEMORY highres=3Doff -dtb $KERNEL-$MACHINE.dtb"
+        QEMUOPTIONS=3D"-M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot =
$QEMU_UI_OPTIONS"
+        #QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda =
$ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+    fi
+
+    if [ "$FSTYPE" =3D "nfs" ]; then
+        if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE=3D"root=3D/dev/nfs =
nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD =
mem=3D$QEMU_MEMORY"
+        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} =
--no-reboot $QEMU_UI_OPTIONS"
+    fi
 fi
=20
 if [ "$MACHINE" =3D "qemux86" ]; then
     QEMU=3Dqemu-system-i386
     QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
@@ -520,11 +553,11 @@ if [ "$MACHINE" =3D "qemuzynq" ]; then
     fi
 fi
=20
 if [ "x$RAMFS" =3D "xtrue" ]; then
     QEMUOPTIONS=3D"-initrd $ROOTFS -nographic"
-    KERNCMDLINE=3D"root=3D/dev/ram0 debugshell"
+    KERNCMDLINE=3D"earlyprintk root=3D/dev/mmcblk0p2 debugshell"
 fi
=20
 if [ "x$ISOFS" =3D "xtrue" ]; then
     QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
 fi

Best regards,

Elvis Dowson



--Apple-Mail=_027EAECB-7C90-49B8-A9BE-9E4A9BEC1202
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Bruce,<div><br><div><div>On Aug 26, 2013, at 11:08 PM, Bruce Ashfield =
&lt;<a =
href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com<=
/a>&gt; wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite">Are you interested in something from scratch, versus =
something that<br>isn't already partially in the tree (like qemuarma9) =
?<br><br>We've got a few docs and tutorials, but I can also help step =
you through<br>the process to assist the existing =
material.<br></blockquote></div><br><div>I'd like to adapt the existing =
linux-yocto standard/base branch, and build up on existing qemuarma9 =
support. I've included detailed patch fragments below, so that you can =
replicate the current state of my work at your =
end.</div></div><div><br></div><div>I've performed the following steps =
till date, but unfortunately get a qemu ram / rom out of memory address =
error after doing all this. Must be because of an incorrectly mapped =
KMACHINE. The vexpress device doesn't support PCI, IDE or SCSI, only =
microsd card or ram devices, so the boot method should use an initrd =
file, for the root filesystem, as described =
here.</div><div><br></div><div><a =
href=3D"https://wiki.linaro.org/PeterMaydell/QemuVersatileExpress">https:/=
/wiki.linaro.org/PeterMaydell/QemuVersatileExpress</a></div><div><br></div=
><div><b><u>Step 01.00: Clone linux-yocto-3.8 locally, create local meta =
branch, create local standard/qemuarma9 branch, tracking the master =
branch.</u></b></div><div><br></div><div>Make the following modification =
to the&nbsp;qemuarma9-standard.scc file.</div><div><br></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">=46rom =
8e9b465f242941b70d7b61045c073e82700fcd91 Mon Sep 17 00:00:00 =
2001<br>From: Elvis Dowson &lt;<a =
href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt;<br>D=
ate: Mon, 26 Aug 2013 22:18:24 +0400<br>Subject: [PATCH] qemuarma9: =
Update branch to qemuarma9.<br><br>Signed-off-by: Elvis Dowson &lt;<a =
href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt;<br>-=
--<br>&nbsp;meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc | =
&nbsp; &nbsp;2 +-<br>&nbsp;1 file changed, 1 insertion(+), 1 =
deletion(-)<br><br>diff --git =
a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc =
b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc<br>index =
c71fe1c..729125d 100644<br>--- =
a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc<br>+++ =
b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc<br>@@ -3,7 =
+3,7 @@ define KTYPE standard<br>&nbsp;define KARCH =
arm<br>&nbsp;<br>&nbsp;include ktypes/standard/standard.scc<br>-branch =
arm-versatile-926ejs<br>+branch qemuarma9<br>&nbsp;<br>&nbsp;include =
qemuarma9.scc<br>&nbsp;<br>--&nbsp;<br>1.7.10.4</span></font><br><br></div=
><div><br></div><div><b><u>Step 02.00: Create a new qemuarma9.conf =
machine definition.</u></b></div><div><br></div><div>There is a dts file =
in arch/arm/boot/dts called =
vexpress-v2p-ca9.dts.&nbsp;</div><div><br></div><div>Q01: I guess the =
KMACHINE_qemuarma9 should be set to "vex press" ? instead of qemuarma9 =
below?</div><div><br></div><div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">#@TYPE: Machine</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">#@NAME: =
qemuarma9</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">#@DESCRIPTION: Machine configuration for QEMU =
ARM Cortex A9.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;"># Specify the default =
tune.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">DEFAULTTUNE =3D =
"armv7a-neon"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">require =
conf/machine/include/qemu.inc</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">require =
conf/machine/include/tune-cortexa9.inc</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;"><br></span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"># Specify the preferred kernel recipe =
version.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">PREFERRED_VERSION_linux-yocto ?=3D =
"3.8%"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;"># Specify the machine =
name used by the kernel.</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">KMACHINE_qemuarma9 =3D =
"<font color=3D"#ff2600">qemuarma9</font>" &nbsp;<font color=3D"#ff2600">#=
 Error?!!</font></span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;"># Specify the kernel =
image type.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">KERNEL_IMAGETYPE =3D =
"uImage"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">MACHINE_DEVICETREE :=3D =
"qemuarma9.dts"&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;"><br></span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;"># Specify the serial =
console parameters.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">SERIAL_CONSOLE =3D "115200 =
ttyAMA0"</span></font></div></div><div><br></div><div><br></div><div><b><u=
>Step 03.00: Patch the oe-core =
sources.</u></b></div><div><br></div><div><b>Step 03.01: </b>Patch =
scripts/runqemu</div><div><br></div><div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">@@ -37,10 +37,11 @@ usage() =
{</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;qemuparams=3D\"xyz\" - specify =
custom parameters to QEMU"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo =
" &nbsp;bootparams=3D\"xyz\" - specify custom kernel parameters during =
boot"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo =
""</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;echo =
"Examples:"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;$MYNAME =
qemuarm"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;echo " &nbsp;$MYNAME qemuarma9 =
ramfs"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;$MYNAME =
qemux86-64 core-image-sato ext3"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo =
" &nbsp;$MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ =
serial"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;$MYNAME =
qemux86 ramfs"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;$MYNAME =
qemux86 iso"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;echo " &nbsp;$MYNAME =
qemux86 qemuparams=3D\"-m 256\""</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">@@ -105,11 +106,11 @@ =
process_filename() {</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;# bit more complex, but offers a great =
user experience.</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">&nbsp;KVM_ENABLED=3D"no"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp;while true; =
do</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;arg=3D${1}</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;case =
"$arg" in</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">- &nbsp; &nbsp; &nbsp; &nbsp;"qemux86" | =
"qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | =
\</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">+ &nbsp; &nbsp; &nbsp; &nbsp;"qemux86" | "qemux86-64" | "qemuarm" =
| "qemuarma9" |"qemumips" | "qemumipsel" | =
\</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"qemumips64" | "qemush4" =
&nbsp;| "qemuppc" | "qemumicroblaze" | =
"qemuzynq")</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;[ -z "$MACHINE" ] &amp;&amp; MACHINE=3D$arg || =
\</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;error "conflicting MACHINE types [$MACHINE] and =
[$arg]"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ext2" | =
"ext3" | "ext4" | "jffs2" | "nfs" | =
"btrfs")</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">@@ -222,17 +223,17 @@ if [ "$FSTYPE" =3D =
"nfs" -a -z "$ROOTFS" ]; then</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;error "NFS booting without an explicit ROOTFS path is not yet =
supported"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;fi</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;if [ -z "$MACHINE" ]; =
then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;if [ "x$FSTYPE" =3D =
"xvmdk" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">- &nbsp; &nbsp; &nbsp; =
&nbsp;MACHINE=3D`basename $VM | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush=
4\).*/\1/'`</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;MACHINE=3D`basename $VM | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemu=
ppc\|qemush4\).*/\1/'`</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ -z =
"$MACHINE" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;error "Unable to set MACHINE from vmdk filename =
[$VM]"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Set =
MACHINE to [$MACHINE] based on vmdk [$VM]"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;else</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">- &nbsp; &nbsp; &nbsp; =
&nbsp;MACHINE=3D`basename $KERNEL | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush=
4\).*/\1/'`</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;MACHINE=3D`basename $KERNEL | sed =
's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarma9\|qemumips64\|qemumips\|qemu=
ppc\|qemush4\).*/\1/'`</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ -z =
"$MACHINE" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;error "Unable to set MACHINE from kernel filename =
[$KERNEL]"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Set =
MACHINE to [$MACHINE] based on kernel =
[$KERNEL]"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">@@ -292,10 +293,13 @@ =
QEMUX86_64_DEFAULT_KERNEL=3DbzImage-qemux86-64.bin</span></font></div><div=
><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;QEMUX86_64_DEFAULT_FSTYPE=3Dext3</span></font></div><div><fon=
t face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">&nbsp;QEMUARM_DEFAULT_KERNEL=3DzImage-qemuarm.bin</span></font></di=
v><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;QEMUARM_DEFAULT_FSTYPE=3Dext3</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">+QEMUARMA9_DEFAULT_KERNEL=3DuImage</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">+QEMUARMA9_DEFAULT_FSTYPE=3Dcpio.gz</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">+</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">&nbsp;QEMUMIPS_DEFAULT_KERNEL=3Dvmlinux-qemumips.bin</span></font><=
/div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;QEMUMIPS_DEFAULT_FSTYPE=3Dext3</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">&nbsp;QEMUMIPSEL_DEFAULT_KERNEL=3Dvmlinux-qemumipsel.bin</span></fo=
nt></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;QEMUMIPSEL_DEFAULT_FSTYPE=3Dext3</span></font></div></div><di=
v><br></div><div><br></div><div><b>Step 03.02: </b>Patch =
runqemu-internal.</div><div><br></div><div><div><font face=3D"Menlo"><span=
 style=3D"font-size: 11px;">@@ -48,10 +48,13 @@ =
else</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mem_size=3D128</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"qemuarm")</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mem_size=3D128</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;"qemuarma9")</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mem_size=3D128</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"qemumicroblaze")</span></font></div><div><font face=3D"Menlo"><span=
 style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mem_size=3D64</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"qemumips"|"qemumips64")</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;mem_size=3D128</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">@@ -265,10 +268,11 @@ =
else</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;fi</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;case "$MACHINE" =
in</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;"qemuarm") ;;</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;"qemuarma9") ;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;"qemumicroblaze") =
;;</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;"qemumips") ;;</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;"qemumipsel") ;;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;"qemumips64") =
;;</span></font></div><div><font face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp; &nbsp; &nbsp;"qemush4") ;;</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">@@ -348,10 +352,39 @@ if =
[ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D "qemuarmv6" -o "$MACHINE" =3D=
 "qemuarm</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMUOPTIONS -cpu =
arm1136"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;if [ "$MACHINE" =3D =
"qemuarmv7" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMUOPTIONS -cpu =
cortex-a8"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;if [ "$MACHINE" =3D =
"qemuarma9" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;MACHINE_SUBTYPE=3Dvexpress-a9</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMUOPTIONS -cpu =
cortex-a9"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+fi</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">+</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+if [ "$MACHINE" =3D "qemuarma9" ]; =
then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;QEMU=3Dqemu-system-arm</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;MACHINE_SUBTYPE=3Dvexpress-a9</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMUOPTIONS -cpu =
cortex-a9"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;export =
QEMU_AUDIO_DRV=3D"none"</span></font></div><div><font face=3D"Menlo"><span=
 style=3D"font-size: 11px;">+ &nbsp; &nbsp;QEMU_UI_OPTIONS=3D"-show-cursor=
 -usb"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;# =
QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS =
-force-pointer"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;#QEMU_SYSTEM_OPTIONS=3D"-M =
$MACHINE_SUBTYPE -serial null -serial mon:stdio -dtb =
$KERNEL-$MACHINE.dtb"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;if [ "${FSTYPE:0:3}" =3D "ext" =
-o "${FSTYPE:0:4}" =3D "cpio" ]; then</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;KERNCMDLINE=3D"earlyprintk root=3D/dev/mmcblk0p2 rw =
console=3DttyAMA0,115200 console=3Dtty $KERNEL_NETWORK_CMD =
mem=3D$QEMU_MEMORY highres=3Doff -dtb =
$KERNEL-$MACHINE.dtb"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp;QEMUOPTIONS=3D"-M =
${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot =
$QEMU_UI_OPTIONS"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;#QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda =
$ROOTFS -no-reboot $QEMU_UI_OPTIONS"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; &nbsp;if [ =
"$FSTYPE" =3D "nfs" ]; then</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ]; =
then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;echo "Error: NFS mount point $ROOTFS doesn't =
exist"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;cleanup</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return 1</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;KERNCMDLINE=3D"root=3D/dev/nfs =
nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD =
mem=3D$QEMU_MEMORY"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp; &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot =
$QEMU_UI_OPTIONS"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;fi</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;if [ "$MACHINE" =3D "qemux86" ]; =
then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;QEMU=3Dqemu-system-i386</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga =
vmware"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">@@ -520,11 +553,11 @@ if [ "$MACHINE" =3D =
"qemuzynq" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;fi</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;if [ "x$RAMFS" =3D "xtrue" ]; =
then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; &nbsp;QEMUOPTIONS=3D"-initrd =
$ROOTFS -nographic"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">- &nbsp; &nbsp;KERNCMDLINE=3D"root=3D/dev/ram0 =
debugshell"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">+ &nbsp; &nbsp;KERNCMDLINE=3D"earlyprintk =
root=3D/dev/mmcblk0p2 debugshell"</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: =
11px;">&nbsp;fi</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp;</span></font></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">&nbsp;if [ "x$ISOFS" =3D =
"xtrue" ]; then</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: 11px;">&nbsp; &nbsp; =
&nbsp;QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cdrom $ROOTFS =
$QEMU_UI_OPTIONS"</span></font></div><div><font face=3D"Menlo"><span =
style=3D"font-size: =
11px;">&nbsp;fi</span></font></div></div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis =
Dowson</div><div><br></div><div><br></div></body></html>=

--Apple-Mail=_027EAECB-7C90-49B8-A9BE-9E4A9BEC1202--

Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnHW7-0003jY-B9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:28:35 +0100
Received: by lami14 with SMTP id i14so2489110lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=+E49uixWksSmqFUEQUswqrX792zXADlTM41el1GoM2w=;
	b=wpN8aKA3uqECBr5NyT3jhlO/kTqa2wiBFHcpmF8Y7uECkcDNzjB1Qm8Lmqp7kUHWLA
	vpo4GeH+9yT67WXGh0yTVJ04MyMwuKpjE0brIQLGstF6EiMfltXC7FO8lt2T7767PtAl
	Al1/586KZpkJqQjACemuHpbZgk9HlOZ0cWcc0=
Received: by 10.152.111.200 with SMTP id ik8mr9093837lab.43.1326838857257;
	Tue, 17 Jan 2012 14:20:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 14:20:26 -0800 (PST)
In-Reply-To: <4fed8429bc31211a979aaa496d2af8c574b1140a.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
	<4fed8429bc31211a979aaa496d2af8c574b1140a.1326786989.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 14:20:26 -0800
Message-ID: <CAMKF1sp_bM8w=q9SO=ezssH9t-rZedZDMD06oByUHX06wVnomQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 18/62] qemuppc: replace emulation of qemuppc from prep to mac99
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
X-List-Received-Date: Tue, 17 Jan 2012 22:28:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 12:32 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Liming Wang <liming.wang@windriver.com>
>
> With this new emulation, existing qemuppc functionality is maintained
> and other functionality such as framebuffer + sato and NFS boot are
> added.
>

We currently tune for 603e when we choose qemuppc machine is that still val=
id
core for G4 cpu ? I think from gcc point of view it should now use -m7400
so may be add another tune-file to oe-core

> Signed-off-by: Liming Wang <liming.wang@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =C2=A0meta/conf/machine/qemuppc.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A0scripts/runqemu =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A07 +------
> =C2=A0scripts/runqemu-internal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 16 ++++++++--------
> =C2=A05 files changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.c=
onf
> index bcc408f..48eecb7 100644
> --- a/meta/conf/machine/qemuppc.conf
> +++ b/meta/conf/machine/qemuppc.conf
> @@ -5,7 +5,7 @@
> =C2=A0require conf/machine/include/qemu.inc
> =C2=A0require conf/machine/include/tune-ppc603e.inc
>
> -KERNEL_IMAGETYPE =3D "zImage"
> +KERNEL_IMAGETYPE =3D "vmlinux"
>
> =C2=A0SERIAL_CONSOLE =3D "115200 ttyS0"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_3.0.bb
> index c8983c4..c6bf446 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE =3D "preempt-rt"
>
> =C2=A0SRCREV_machine ?=3D "bcf4107c7f22d10952618a2ad146e6149d240cd2"
> =C2=A0SRCREV_machine_qemuppc ?=3D "1e5511ea2cb5f150ffce86071035a81c049949=
4b"
> -SRCREV_meta ?=3D "6ae3d992cf546184010e87a0349810198f1d167c"
> +SRCREV_meta ?=3D "73dafd44ea875df654129b32b2877f342d5573e4"
>
> =C2=A0PR =3D "r1"
> =C2=A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-=
kernel/linux/linux-yocto_3.0.bb
> index 921c258..e624b48 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?=3D "10e808d1c304b14cf42903fd63=
7f239766b78476"
> =C2=A0SRCREV_machine_qemux86 ?=3D "e04f9f8e564c60b1ce907d64074c18730f8dab=
4e"
> =C2=A0SRCREV_machine_qemux86-64 ?=3D "53c2fa060d34e9a0b59e19398aeebbe73f2=
4d89b"
> =C2=A0SRCREV_machine ?=3D "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
> -SRCREV_meta ?=3D "6ae3d992cf546184010e87a0349810198f1d167c"
> +SRCREV_meta ?=3D "73dafd44ea875df654129b32b2877f342d5573e4"
>
> =C2=A0PR =3D "r2"
> =C2=A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index bed6a29..ac5facf 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -262,7 +262,7 @@ QEMUARM_DEFAULT_FSTYPE=3Dext3
> =C2=A0QEMUMIPS_DEFAULT_KERNEL=3Dvmlinux-qemumips.bin
> =C2=A0QEMUMIPS_DEFAULT_FSTYPE=3Dext3
>
> -QEMUPPC_DEFAULT_KERNEL=3DzImage-qemuppc.bin
> +QEMUPPC_DEFAULT_KERNEL=3Dvmlinux-qemuppc.bin
> =C2=A0QEMUPPC_DEFAULT_FSTYPE=3Dext3
>
> =C2=A0AKITA_DEFAULT_KERNEL=3DzImage-akita.bin
> @@ -365,11 +365,6 @@ if [ -z "$FSTYPE" ]; then
> =C2=A0 =C2=A0 fi
> =C2=A0fi
>
> -if [ "$FSTYPE" =3D "nfs" -a "$MACHINE" =3D "qemuppc" ]; then
> - =C2=A0 =C2=A0echo "Error: usermode NFS boot is not available for qemupp=
c."
> - =C2=A0 =C2=A0exit 1
> -fi
> -
> =C2=A0# FSTYPE is now set for all cases
>
> =C2=A0# Handle cases where a ROOTFS type is given instead of a filename, =
e.g.
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 2968ed9..c55619b 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -389,13 +389,13 @@ fi
>
> =C2=A0if [ "$MACHINE" =3D "qemuppc" ]; then
> =C2=A0 =C2=A0 QEMU=3Dqemu-system-ppc
> - =C2=A0 =C2=A0MACHINE_SUBTYPE=3Dprep
> - =C2=A0 =C2=A0CPU_SUBTYPE=3D603e
> - =C2=A0 =C2=A0BIOS=3Dpowerpc_rom.bin
> - =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -nographic"
> + =C2=A0 =C2=A0MACHINE_SUBTYPE=3Dmac99
> + =C2=A0 =C2=A0CPU_SUBTYPE=3DG4
> + =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS"
> + =C2=A0 =C2=A0QEMU_NETWORK_CMD=3D"-net nic,model=3Dpcnet $QEMU_TAP_CMD"
> =C2=A0 =C2=A0 if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D"root=3D/dev/hda rw console=3D=
ttyS0 3 $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_S=
UBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPT=
IONS"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D"root=3D/dev/hda rw console=3D=
ttyS0 $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_S=
UBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
> =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 if [ "$FSTYPE" =3D "nfs" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d =
"$NFS_DIR" ]; then
> @@ -403,8 +403,8 @@ if [ "$MACHINE" =3D "qemuppc" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D"root=3D/dev/nfs console=3Dtty=
S0 3 nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=
=3D$QEMU_MEMORY"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_S=
UBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -no-reboot $QEMU_UI_OPTIONS"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D"root=3D/dev/nfs console=3Dtty=
S0 nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$=
QEMU_MEMORY"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_S=
UBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
> =C2=A0 =C2=A0 fi
> =C2=A0fi
>
> --
> 1.7.6.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RnKKa-0000KO-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 02:28:53 +0100
Received: by pbaa11 with SMTP id a11so501403pba.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 17:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Qny8KUtj4yw5CePyqoDCAkO5R+llhqKZJPN+THvPcrY=;
	b=iuU1EAFSs7J+9XfSzHg+qePhlrVS1eRHCGscPSxGdQRtgnc3wipfqeU+Np2GM6N7fj
	Xn8FBlNwDrLBzmVi9V2SRu9wc8DSxmioeqm5GodTHRsGfVUG45aAIiBWYLwC3o+Y5VUE
	BzK4K0hW+MSfPAI4uhg7iqcnLPU9ocH1MxYIo=
MIME-Version: 1.0
Received: by 10.68.120.72 with SMTP id la8mr39403179pbb.56.1326847979511; Tue,
	17 Jan 2012 16:52:59 -0800 (PST)
Received: by 10.143.10.7 with HTTP; Tue, 17 Jan 2012 16:52:59 -0800 (PST)
In-Reply-To: <CAMKF1sp_bM8w=q9SO=ezssH9t-rZedZDMD06oByUHX06wVnomQ@mail.gmail.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
	<4fed8429bc31211a979aaa496d2af8c574b1140a.1326786989.git.sgw@linux.intel.com>
	<CAMKF1sp_bM8w=q9SO=ezssH9t-rZedZDMD06oByUHX06wVnomQ@mail.gmail.com>
Date: Tue, 17 Jan 2012 19:52:59 -0500
Message-ID: <CADkTA4NEH+hMJnB1w+UK8ShZEQ+J1uCJw831F6f==YrZDzC+bA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 18 Jan 2012 01:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 5:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 17, 2012 at 12:32 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> From: Liming Wang <liming.wang@windriver.com>
>>
>> With this new emulation, existing qemuppc functionality is maintained
>> and other functionality such as framebuffer + sato and NFS boot are
>> added.
>>
>
> We currently tune for 603e when we choose qemuppc machine is that still v=
alid
> core for G4 cpu ? I think from gcc point of view it should now use -m7400
> so may be add another tune-file to oe-core

That was the plan, to fix the tuning of this and the other PPC reference bo=
ards
at the same time. Liming and I had discussed this before, and we wanted to =
get
this into the tree, and tweak it there.

Liming: we can open a bug to track the update of the tuning .. just so we d=
on't
forget.

Cheers,

Bruce

>
>> Signed-off-by: Liming Wang <liming.wang@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> =A0meta/conf/machine/qemuppc.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
>> =A0meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | =A0 =A02 +-
>> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =A0 =A0| =A0 =A02 +-
>> =A0scripts/runqemu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A07 +------
>> =A0scripts/runqemu-internal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 16 ++++++++--------
>> =A05 files changed, 12 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.=
conf
>> index bcc408f..48eecb7 100644
>> --- a/meta/conf/machine/qemuppc.conf
>> +++ b/meta/conf/machine/qemuppc.conf
>> @@ -5,7 +5,7 @@
>> =A0require conf/machine/include/qemu.inc
>> =A0require conf/machine/include/tune-ppc603e.inc
>>
>> -KERNEL_IMAGETYPE =3D "zImage"
>> +KERNEL_IMAGETYPE =3D "vmlinux"
>>
>> =A0SERIAL_CONSOLE =3D "115200 ttyS0"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_3.0.bb
>> index c8983c4..c6bf446 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>> @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE =3D "preempt-rt"
>>
>> =A0SRCREV_machine ?=3D "bcf4107c7f22d10952618a2ad146e6149d240cd2"
>> =A0SRCREV_machine_qemuppc ?=3D "1e5511ea2cb5f150ffce86071035a81c0499494b=
"
>> -SRCREV_meta ?=3D "6ae3d992cf546184010e87a0349810198f1d167c"
>> +SRCREV_meta ?=3D "73dafd44ea875df654129b32b2877f342d5573e4"
>>
>> =A0PR =3D "r1"
>> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes=
-kernel/linux/linux-yocto_3.0.bb
>> index 921c258..e624b48 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> @@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?=3D "10e808d1c304b14cf42903fd6=
37f239766b78476"
>> =A0SRCREV_machine_qemux86 ?=3D "e04f9f8e564c60b1ce907d64074c18730f8dab4e=
"
>> =A0SRCREV_machine_qemux86-64 ?=3D "53c2fa060d34e9a0b59e19398aeebbe73f24d=
89b"
>> =A0SRCREV_machine ?=3D "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
>> -SRCREV_meta ?=3D "6ae3d992cf546184010e87a0349810198f1d167c"
>> +SRCREV_meta ?=3D "73dafd44ea875df654129b32b2877f342d5573e4"
>>
>> =A0PR =3D "r2"
>> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index bed6a29..ac5facf 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -262,7 +262,7 @@ QEMUARM_DEFAULT_FSTYPE=3Dext3
>> =A0QEMUMIPS_DEFAULT_KERNEL=3Dvmlinux-qemumips.bin
>> =A0QEMUMIPS_DEFAULT_FSTYPE=3Dext3
>>
>> -QEMUPPC_DEFAULT_KERNEL=3DzImage-qemuppc.bin
>> +QEMUPPC_DEFAULT_KERNEL=3Dvmlinux-qemuppc.bin
>> =A0QEMUPPC_DEFAULT_FSTYPE=3Dext3
>>
>> =A0AKITA_DEFAULT_KERNEL=3DzImage-akita.bin
>> @@ -365,11 +365,6 @@ if [ -z "$FSTYPE" ]; then
>> =A0 =A0 fi
>> =A0fi
>>
>> -if [ "$FSTYPE" =3D "nfs" -a "$MACHINE" =3D "qemuppc" ]; then
>> - =A0 =A0echo "Error: usermode NFS boot is not available for qemuppc."
>> - =A0 =A0exit 1
>> -fi
>> -
>> =A0# FSTYPE is now set for all cases
>>
>> =A0# Handle cases where a ROOTFS type is given instead of a filename, e.=
g.
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index 2968ed9..c55619b 100755
>> --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -389,13 +389,13 @@ fi
>>
>> =A0if [ "$MACHINE" =3D "qemuppc" ]; then
>> =A0 =A0 QEMU=3Dqemu-system-ppc
>> - =A0 =A0MACHINE_SUBTYPE=3Dprep
>> - =A0 =A0CPU_SUBTYPE=3D603e
>> - =A0 =A0BIOS=3Dpowerpc_rom.bin
>> - =A0 =A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -nographic"
>> + =A0 =A0MACHINE_SUBTYPE=3Dmac99
>> + =A0 =A0CPU_SUBTYPE=3DG4
>> + =A0 =A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS"
>> + =A0 =A0QEMU_NETWORK_CMD=3D"-net nic,model=3Dpcnet $QEMU_TAP_CMD"
>> =A0 =A0 if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
>> - =A0 =A0 =A0 =A0KERNCMDLINE=3D"root=3D/dev/hda rw console=3DttyS0 3 $KE=
RNEL_NETWORK_CMD mem=3D$QEMU_MEMORY"
>> - =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $=
MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
>> + =A0 =A0 =A0 =A0KERNCMDLINE=3D"root=3D/dev/hda rw console=3DttyS0 $KERN=
EL_NETWORK_CMD mem=3D$QEMU_MEMORY"
>> + =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $=
MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
>> =A0 =A0 fi
>> =A0 =A0 if [ "$FSTYPE" =3D "nfs" ]; then
>> =A0 =A0 =A0 =A0 if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" =
]; then
>> @@ -403,8 +403,8 @@ if [ "$MACHINE" =3D "qemuppc" ]; then
>> =A0 =A0 =A0 =A0 =A0 =A0 cleanup
>> =A0 =A0 =A0 =A0 =A0 =A0 return
>> =A0 =A0 =A0 =A0 fi
>> - =A0 =A0 =A0 =A0KERNCMDLINE=3D"root=3D/dev/nfs console=3DttyS0 3 nfsroo=
t=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMO=
RY"
>> - =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $=
MACHINE_SUBTYPE -bios $BIOS -no-reboot $QEMU_UI_OPTIONS"
>> + =A0 =A0 =A0 =A0KERNCMDLINE=3D"root=3D/dev/nfs console=3DttyS0 nfsroot=
=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMOR=
Y"
>> + =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $=
MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
>> =A0 =A0 fi
>> =A0fi
>>
>> --
>> 1.7.6.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



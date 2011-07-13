Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QgoPt-0002MB-U8
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:39:10 +0200
Received: by gyd12 with SMTP id 12so2337889gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=RmuBMqf/maMvajV1lsb/tzASH92j0q1nhC5HzM/mzV8=;
	b=vQH/kA+ObTH632wJYsSv5AKgoaW3wRQB1GsLs/aKdaR8j55GPbfurOx5wc03k6ok5N
	lSebgaP+IbBOkmFjDtqNx9wqqJjmm/OWHnv62EStbtYcbAUSeat0CQtMx2KwKMAGeB3w
	cxOIgUZv4TEJeTKk/2YkFb6JEYuYmWiGyF/Nc=
MIME-Version: 1.0
Received: by 10.90.186.8 with SMTP id j8mr741539agf.32.1310520911556; Tue, 12
	Jul 2011 18:35:11 -0700 (PDT)
Received: by 10.90.148.11 with HTTP; Tue, 12 Jul 2011 18:35:11 -0700 (PDT)
In-Reply-To: <177b3514fcb50027a166e78ed88bf94f08fef8a4.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<177b3514fcb50027a166e78ed88bf94f08fef8a4.1310497097.git.nitin.a.kamble@intel.com>
Date: Tue, 12 Jul 2011 21:35:11 -0400
Message-ID: <CADkTA4PZVoT6-UGq94JFEcniHSJEBoQjp4eqxXXGETQXBXipvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] runqemu: support qemux32 machine
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
X-List-Received-Date: Wed, 13 Jul 2011 01:39:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2011 at 3:02 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =A0scripts/qemuimage-testlib | =A0 =A02 +-
> =A0scripts/runqemu =A0 =A0 =A0 =A0 =A0 | =A0 12 ++++++++----
> =A0scripts/runqemu-internal =A0| =A0 25 +++++++++++++++++++++++++
> =A03 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
> index c2dbf60..05df11a 100755
> --- a/scripts/qemuimage-testlib
> +++ b/scripts/qemuimage-testlib
> @@ -424,7 +424,7 @@ Test_Create_Qemu()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1
> =A0 =A0 =A0 =A0fi
>
> - =A0 =A0 =A0 if [ "$QEMUARCH" =3D "qemux86" -o "$QEMUARCH" =3D "qemux86-=
64" ]; then
> + =A0 =A0 =A0 if [ "$QEMUARCH" =3D "qemux86" -o "$QEMUARCH" =3D "qemux32"=
 -o "$QEMUARCH" =3D "qemux86-64" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0KERNEL=3D$(Test_Find_Image -l ${DEPLOY_DIR=
}/images -k bzImage -a ${QEMUARCH})
> =A0 =A0 =A0 =A0elif [ "$QEMUARCH" =3D "qemuarm" -o "$QEMUARCH" =3D "spitz=
" -o "$QEMUARCH" =3D "borzoi" -o "$QEMUARCH" =3D "akita" -o "$QEMUARCH" =3D=
 "nokia800" -o "$QEMUARCH" =3D "qemuppc" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0KERNEL=3D$(Test_Find_Image -l ${DEPLOY_DIR=
}/images -k zImage -a ${QEMUARCH})
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 5aed25a..ef57638 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -93,7 +93,7 @@ i=3D1
> =A0while [ $i -le $# ]; do
> =A0 =A0 arg=3D${!i}
> =A0 =A0 case $arg in
> - =A0 =A0 =A0 =A0"qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qem=
uppc")
> + =A0 =A0 =A0 =A0"qemux86" | "qemux32" | "qemux86-64" | "qemuarm" | "qemu=
mips" | "qemuppc")
> =A0 =A0 =A0 =A0 =A0 =A0 if [ -z "$MACHINE" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MACHINE=3D$arg
> =A0 =A0 =A0 =A0 =A0 =A0 else
> @@ -136,7 +136,7 @@ while [ $i -le $# ]; do
> =A0 =A0 =A0 =A0 =A0 =A0 SCRIPT_KERNEL_OPT=3D"$SCRIPT_KERNEL_OPT console=
=3DttyS0"
> =A0 =A0 =A0 =A0 =A0 =A0 ;;
> =A0 =A0 =A0 =A0 "audio")
> - =A0 =A0 =A0 =A0 =A0 =A0if [[ "x$MACHINE" =3D=3D "xqemux86" || "x$MACHIN=
E" =3D=3D "xqemux86-64" ]]; then
> + =A0 =A0 =A0 =A0 =A0 =A0if [[ "x$MACHINE" =3D=3D "xqemux86" || "x$MACHIN=
E" =3D=3D "xqemux32" || "x$MACHINE" =3D=3D "xqemux86-64" ]]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Enable audio on qemu. Pls. install =
snd_intel8x0 or snd_ens1370 driver in linux guest.";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 QEMU_AUDIO_DRV=3D"alsa"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -soun=
dhw ac97,es1370"
> @@ -192,7 +192,7 @@ if [[ "x$KVM_ENABLED" =3D=3D "xyes" ]]; then
> =A0 =A0 =A0 =A0 echo "$YOCTO_KVM_WIKI";
> =A0 =A0 =A0 =A0 exit 1;
> =A0 =A0 fi
> - =A0 =A0if [[ "x$MACHINE" !=3D "xqemux86" && "x$MACHINE" !=3D "xqemux86-=
64" ]]; then
> + =A0 =A0if [[ "x$MACHINE" !=3D "xqemux86" && "x$MACHINE" !=3D "xqemux32"=
 && "x$MACHINE" !=3D "xqemux86-64" ]]; then
> =A0 =A0 =A0 =A0 echo "KVM only support x86 & x86-64. Remove kvm from the =
command-line";
> =A0 =A0 =A0 =A0 exit 1;
> =A0 =A0 fi
> @@ -221,7 +221,7 @@ if [[ "$FSTYPE" =3D=3D "nfs" && -z "$ROOTFS" ]]; then
> =A0fi
>
> =A0if [ -z "$MACHINE" ]; then
> - =A0 =A0MACHINE=3D`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|q=
emuarm\|qemumips\|qemuppc\).*/\1/'`
> + =A0 =A0MACHINE=3D`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux32\|q=
emux86\|qemuarm\|qemumips\|qemuppc\).*/\1/'`
> =A0 =A0 if [ -z "$MACHINE" ]; then
> =A0 =A0 =A0 =A0 echo "Error: Unable to set MACHINE from kernel filename [=
$KERNEL]"
> =A0 =A0 =A0 =A0 usage
> @@ -236,6 +236,10 @@ QEMUX86_DEFAULT_KERNEL=3DbzImage-qemux86.bin
> =A0QEMUX86_DEFAULT_FSTYPE=3Dext3
> =A0QEMUX86_DEFAULT_ROOTFS=3D"core-image-sato-sdk core-image-sato core-ima=
ge-lsb core-image-basic core-image-minimal"
>
> +QEMUX32_DEFAULT_KERNEL=3DbzImage-qemux32.bin
> +QEMUX32_DEFAULT_FSTYPE=3Dext3
> +QEMUX32_DEFAULT_ROOTFS=3D"core-image-sato-sdk core-image-sato core-image=
-lsb core-image-basic core-image-minimal"
> +
> =A0QEMUX86_64_DEFAULT_KERNEL=3DbzImage-qemux86-64.bin
> =A0QEMUX86_64_DEFAULT_FSTYPE=3Dext3
> =A0QEMUX86_64_DEFAULT_ROOTFS=3D"core-image-sato-sdk core-image-sato core-=
image-lsb core-image-basic core-image-minimal"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index c15632d..9f204e0 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -45,6 +45,9 @@ else
> =A0 =A0 =A0 =A0 "qemux86")
> =A0 =A0 =A0 =A0 =A0 =A0 mem_size=3D128
> =A0 =A0 =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 =A0"qemux32")
> + =A0 =A0 =A0 =A0 =A0 =A0mem_size=3D128
> + =A0 =A0 =A0 =A0 =A0 =A0;;
> =A0 =A0 =A0 =A0 "qemux86-64")
> =A0 =A0 =A0 =A0 =A0 =A0 mem_size=3D128
> =A0 =A0 =A0 =A0 =A0 =A0 ;;
> @@ -218,6 +221,7 @@ case "$MACHINE" in
> =A0 =A0 "qemuarmv6") ;;
> =A0 =A0 "qemuarmv7") ;;
> =A0 =A0 "qemux86") ;;
> + =A0 =A0"qemux32") ;;
> =A0 =A0 "qemux86-64") ;;
> =A0 =A0 "akita") ;;
> =A0 =A0 "spitz") ;;
> @@ -319,6 +323,27 @@ if [ "$MACHINE" =3D "qemux86" ]; then
> =A0 =A0 KERNCMDLINE=3D"$KERNCMDLINE oprofile.timer=3D1"
> =A0fi
>
> +if [ "$MACHINE" =3D "qemux32" ]; then
> + =A0 =A0QEMU=3Dqemu-system-x86_64
> + =A0 =A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware -enable-gl"
> + =A0 =A0if [ "$FSTYPE" =3D "ext3" ]; then
> + =A0 =A0 =A0 =A0KERNCMDLINE=3D"vga=3D0 root=3D/dev/hda rw mem=3D$QEMU_ME=
MORY $KERNEL_NETWORK_CMD"
> + =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_O=
PTIONS"

Nitin,

I've been watching the x32 work, and I'm wondering what kernel/configuratio=
n
you've been using to test this ? If this is to go into core, I'd want
to have the
consistent features of the other qemu* machines applied, but I haven't hear=
d
anything about this in quite a while, so I'm unsure what's being used.

Cheers,

Bruce

> + =A0 =A0fi
> + =A0 =A0if [ "$FSTYPE" =3D "nfs" ]; then
> + =A0 =A0 =A0 =A0if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" =
]; then
> + =A0 =A0 =A0 =A0 =A0 =A0echo "Error: NFS mount point $ROOTFS doesn't exi=
st."
> + =A0 =A0 =A0 =A0 =A0 =A0cleanup
> + =A0 =A0 =A0 =A0 =A0 =A0return
> + =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 =A0KERNCMDLINE=3D"root=3D/dev/nfs nfsroot=3D$NFS_SERVER:$NF=
S_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY"
> + =A0 =A0 =A0 =A0QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
> + =A0 =A0fi
> + =A0 =A0# Currently oprofile's event based interrupt mode doesn't work(B=
ug #828) in
> + =A0 =A0# qemux86 and qemux86-64. We can use timer interrupt mode for no=
w.
> + =A0 =A0KERNCMDLINE=3D"$KERNCMDLINE oprofile.timer=3D1"
> +fi
> +
> =A0if [ "$MACHINE" =3D "qemux86-64" ]; then
> =A0 =A0 QEMU=3Dqemu-system-x86_64
> =A0 =A0 QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware -enable-gl"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



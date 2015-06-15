Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65A3E73CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:56:39 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so66571044ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=c/muwmuDAVyitpGZybpqUz8nnGTaAUDkh1/SWEg3qWE=;
	b=JLoedGjXUKVmd2bmS0HDfs5nFlVeBKfSUWpj5Oai+pV3ohhz8tr0OQ2rHIocBwj0Ht
	o6dMAiNpriNGHPOOuXDuAQ7h4LFGZVYNgJA6lZ/s5uLoL/vasSHZyRx0TfMjRcz6y4Ql
	yO74W2OfVXbujTYKmrX3waBN9AdiqeJq06VNgBw1vLhfttyfy59+evrOB1yWjg0oxppn
	/Ys+H1E4gJzDuM2gMEN0DJ+j05O8MmBWyivZ41MgRiF/hu+09Mx8+r82NnTj8NmHytw7
	ZN/PkZimZfuHeHrM8frt/JoP0WW1vmX5T7uE1URR1XPiubZodbTrhpTIsxtDoCT4rbRJ
	laSQ==
X-Gm-Message-State: ALoCoQmTYnTsJHaRkqZBE4M/SzGuysiW9d3/ATrjD3qqpBLhoOKlE9qhOasWhG8ip9ZyQqP6sARa
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr485013iod.91.1434387400626;
	Mon, 15 Jun 2015 09:56:40 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Mon, 15 Jun 2015 09:56:40 -0700 (PDT)
In-Reply-To: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
Date: Mon, 15 Jun 2015 22:26:40 +0530
Message-ID: <CAD3vsf7_24-urKVJjC-L9zsBrpvnD1i1Ag6DqJ8Kb-ip4c+wtA@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][fido] runqemu: add support to boot arm64 qemu target from NFS
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
X-List-Received-Date: Mon, 15 Jun 2015 16:56:44 -0000
Content-Type: multipart/alternative; boundary=001a113eae0e7c36120518915762

--001a113eae0e7c36120518915762
Content-Type: text/plain; charset=UTF-8

Ping.

Regards,
Jagadeesh

On Tue, Jun 9, 2015 at 10:18 AM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> The other changes include,
> runqemu - fix MACHINE type being detected as qemuarm when qemuarm64 kernel
>           image name is given.
>
> runqemu-internal - Added console=ttyAMA0,115200 as one of the boot
> parameters
>                    for qemuarm, in order to print bootlog messages on the
>                    console.
>
>                  - Use "-nographic" option only if "serial" option is not
>                    specified. Otherwise we get below error when
>                    'runqemu <kernel_image> <rootfs_image> serial' is
> executed,
>
> (snip)
> QEMU 2.2.0 monitor - type 'help' for more information
> (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple
> character devices
> -- CUT --
>
> qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu          |  4 ++--
>  scripts/runqemu-internal | 20 +++++++++++++++-----
>  2 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 84ece4d..09c507d 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -232,13 +232,13 @@ fi
>
>  if [ -z "$MACHINE" ]; then
>      if [ "x$FSTYPE" = "xvmdk" ]; then
> -        MACHINE=`basename $VM | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=`basename $VM | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from vmdk filename [$VM]"
>          fi
>          echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>      else
> -        MACHINE=`basename $KERNEL | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=`basename $KERNEL | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from kernel filename [$KERNEL]"
>          fi
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 2db5566..e346c64 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -275,9 +275,6 @@ else
>
>          KERNCMDLINE="mem=$QEMU_MEMORY"
>          QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
> -        if [ $MACHINE = 'qemuarm64' ]; then
> -            QEMU_UI_OPTIONS="-nographic"
> -        fi
>
>          NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
>          export NFS_INSTANCE
> @@ -368,7 +365,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
> "qemuarmv6" -o "$MACHINE" = "qemuarm
>              cleanup
>              return 1
>          fi
> -        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD
> mem=$QEMU_MEMORY"
> +        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200
> $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>          QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$MACHINE" = "qemuarmv6" ]; then
> @@ -383,12 +380,25 @@ if [ "$MACHINE" = "qemuarm64" ]; then
>      QEMU=qemu-system-aarch64
>
>      export QEMU_AUDIO_DRV="none"
> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
> +    if [ "x$SERIALSTDIO" = "x" ] ; then
> +        QEMU_UI_OPTIONS="-nographic"
> +    else
> +        QEMU_UI_OPTIONS=""
> +    fi
>      if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>          KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400
> mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>          # qemu-system-aarch64 only support '-machine virt -cpu
> cortex-a57' for now
>          QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57
> $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>      fi
> +    if [ "$FSTYPE" = "nfs" ]; then
> +        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
> +            echo "Error: NFS mount point $ROOTFS doesn't exist"
> +            cleanup
> +            return 1
> +        fi
> +        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400
> mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
> +        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57
> $QEMU_UI_OPTIONS"
> +    fi
>  fi
>
>
> --
> 1.8.2.3
>
>

--001a113eae0e7c36120518915762
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div><br></div><div>Regards,</div><div>Jagadeesh<br><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 9, 201=
5 at 10:18 AM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvist=
a.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The other cha=
nges include,<br>
runqemu - fix MACHINE type being detected as qemuarm when qemuarm64 kernel<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image name is given.<br>
<br>
runqemu-internal - Added console=3DttyAMA0,115200 as one of the boot parame=
ters<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for qe=
muarm, in order to print bootlog messages on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consol=
e.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Use &quot;-=
nographic&quot; option only if &quot;serial&quot; option is not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied. Otherwise we get below error when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;r=
unqemu &lt;kernel_image&gt; &lt;rootfs_image&gt; serial&#39; is executed,<b=
r>
<br>
(snip)<br>
QEMU 2.2.0 monitor - type &#39;help&#39; for more information<br>
(qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple cha=
racter devices<br>
-- CUT --<br>
<br>
qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.<br=
>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0scripts/runqemu-internal | 20 +++++++++++++++-----<br>
=C2=A02 files changed, 17 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 84ece4d..09c507d 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -232,13 +232,13 @@ fi<br>
<br>
=C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x$FSTYPE&quot; =3D &quot;xvmdk&quot; ]; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p=
&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemus=
h4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from vmdk filename [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Set MACHINE to [$MACHINE] base=
d on vmdk [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/=
\1/p&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|q=
emush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from kernel filename [$KERNEL]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<br>
index 2db5566..e346c64 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -275,9 +275,6 @@ else<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;mem=3D$QEMU_MEMORY&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D&quot;-show-cursor -usb=
 -usbdevice wacom-tablet&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $MACHINE =3D &#39;qemuarm64&#39; ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;-nograph=
ic&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NFS_INSTANCE=3D`echo $TAP | sed &#39;s/ta=
p//&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export NFS_INSTANCE<br>
@@ -368,7 +365,7 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemuarm&quot; -o &q=
uot;$MACHINE&quot; =3D &quot;qemuarmv6&quot; -o &quot;$MACHINE&quot; =3D &q=
uot;qemuarm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/nfs nfsroot=3D=
$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/nfs nfsroot=3D=
$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=3DttyAMA0,115200 $KERNEL_NETWORK=
_CMD mem=3D$QEMU_MEMORY&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD -M =
${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemuarmv6&quot; ]; =
then<br>
@@ -383,12 +380,25 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemuarm64&quot; ]=
; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU=3Dqemu-system-aarch64<br>
<br>
=C2=A0 =C2=A0 =C2=A0export QEMU_AUDIO_DRV=3D&quot;none&quot;<br>
-=C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS&quot;<br>
+=C2=A0 =C2=A0 if [ &quot;x$SERIALSTDIO&quot; =3D &quot;x&quot; ] ; then<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;-nographic&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;${FSTYPE:0:3}&quot; =3D &quot;ext&quot; -o &=
quot;$FSTYPE&quot; =3D &quot;btrfs&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;root=3D/dev/vda rw co=
nsole=3DttyAMA0,38400 mem=3D$QEMU_MEMORY highres=3Doff $KERNEL_NETWORK_CMD&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# qemu-system-aarch64 only support &#39;-=
machine virt -cpu cortex-a57&#39; for now<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD -ma=
chine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$NFS_SERVER&quot; =3D &quot;192.168=
.7.1&quot; -a ! -d &quot;$NFS_DIR&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Error: NFS mount poin=
t $ROOTFS doesn&#39;t exist&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/nfs nfsroot=3D=
$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=3DttyAMA0,38400 mem=3D$QEMU_MEMO=
RY highres=3Doff $KERNEL_NETWORK_CMD&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD -machine=
 virt -cpu cortex-a57 $QEMU_UI_OPTIONS&quot;<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
1.8.2.3<br>
<br>
</font></span></blockquote></div><br></div></div></div>

--001a113eae0e7c36120518915762--

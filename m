Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7391275B17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 10:57:49 +0000 (UTC)
Received: by igbiq7 with SMTP id iq7so72562620igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 03:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=o+SyYaAJDCjLgBLn7Wpwxql7tfk50aust/Dl1VMH4b4=;
	b=XkD4toJoByJFYlp9XSah0+ZJL8brtdUI4PK/CnMHdKlyszATHqLzi3/SknrBdYt5In
	4inOVuVuXUjTUtr15NxJ/K5gMLAmNHb7PJUIspqpOWO8Af2zs4SewHvlitt7XCK5pgQy
	jLARveNejNAjGTg5OEowtXfsUs7bwY0kbksQXQK3N0G2hqy/SIurJCRAWrgrqtxObCDu
	atlFNJV3ztfgsixGz8QC9APK2x0GtbEOdJnaS2v3rCUJ7L6Qkp9ToXLZsckHDHOrXjic
	8dxUvCy5hBC4UjerI5BNu8Oq0bnh5fGY27xli5qFnrkGhS1ssxKjF9p0wZ9GKTdiq7Vv
	yjOQ==
X-Gm-Message-State: ALoCoQkQhIt2wbIe6Qazg7EX4Gqm+D454zzREqT7s1q0VrOq6cvG28IMkgXm3zor2KETpYDm83s6
MIME-Version: 1.0
X-Received: by 10.107.131.25 with SMTP id f25mr19983382iod.53.1435057070367;
	Tue, 23 Jun 2015 03:57:50 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Tue, 23 Jun 2015 03:57:50 -0700 (PDT)
In-Reply-To: <1434451710-2526-4-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
	<1434451710-2526-4-git-send-email-jkrishnanjanappa@mvista.com>
Date: Tue, 23 Jun 2015 16:27:50 +0530
Message-ID: <CAD3vsf5ccrsjSyppMmvv0z7MUSONqD4ZAXuM6kPN1oJDdEL0=g@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][fido 4/4] runqemu-internal: set mutual exclusiveness for serial and nographic options
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
X-List-Received-Date: Tue, 23 Jun 2015 10:57:49 -0000
Content-Type: multipart/alternative; boundary=001a113ebadae9754b05192d4217

--001a113ebadae9754b05192d4217
Content-Type: text/plain; charset=UTF-8

ping.

Regards,
Jagadeesh

On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Use "-nographic" option only if "serial" option is not
> specified. Otherwise we get below error when
> 'runqemu <kernel_image> <rootfs_image> serial' is executed,
>
> (snip)
> QEMU 2.2.0 monitor - type 'help' for more information
> (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple
> character devices
> -- CUT --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu-internal | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index fb51754..e346c64 100755
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
> @@ -383,7 +380,11 @@ if [ "$MACHINE" = "qemuarm64" ]; then
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
> --
> 1.9.1
>
>

--001a113ebadae9754b05192d4217
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping.</div><div><br></div><div>Regards,</div><div>Jag=
adeesh</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkr=
ishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Use &quot;-nographic&quot; option only if &quot;serial&quot; option i=
s not<br>
specified. Otherwise we get below error when<br>
&#39;runqemu &lt;kernel_image&gt; &lt;rootfs_image&gt; serial&#39; is execu=
ted,<br>
<br>
(snip)<br>
QEMU 2.2.0 monitor - type &#39;help&#39; for more information<br>
(qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple<br>
character devices<br>
-- CUT --<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu-internal | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<br>
index fb51754..e346c64 100755<br>
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
@@ -383,7 +380,11 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemuarm64&quot; ];=
 then<br>
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
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a113ebadae9754b05192d4217--

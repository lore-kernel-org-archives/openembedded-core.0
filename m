Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 45F0A75A1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 10:57:39 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so8806834iec.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 03:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=sNFF7CsO1B7mzCPlm0bnkp/aQRnMGZsIxs1kR/P9fNc=;
	b=Ghi88A37XJgy2E4g6TZANkmH3xXz1Udi6EntqPCMUEj2+roEHxKBe9u9Pe4UABFJcI
	6PCkQDe9o8bqWSAwOdTuRvGQ+Ve4NpTf9/ZEjcnMW8euNz5HpfWrA3vfRn96XMdPIIZw
	qFwd2ViOWufwt7NQwnt8IWV1LSMJdUzFlBv8LF1OuelZui9wgXIGLlZUhix3ee8GU+YK
	zdAU5IrpxfQ3rLS06RFblZ+oJcFeS5SXYigi4ZiFo0ui+e2NPkeNjd+soKmJZIRUFkYV
	s20NABhZrPQhhVSxChI7Kupa1YoIe+2wp4quQeJsskhVovCgbrARs7mHU47/HmjakoN/
	1B4g==
X-Gm-Message-State: ALoCoQmZlm77w+0HlupT1PKPb/1+SN3u4WOS4Eay/JpkDzFsKcCW6TR1dsEQHjFhMTBDe1ID/Jv4
MIME-Version: 1.0
X-Received: by 10.50.141.164 with SMTP id rp4mr1383376igb.2.1435057060951;
	Tue, 23 Jun 2015 03:57:40 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Tue, 23 Jun 2015 03:57:40 -0700 (PDT)
In-Reply-To: <1434451710-2526-3-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
	<1434451710-2526-3-git-send-email-jkrishnanjanappa@mvista.com>
Date: Tue, 23 Jun 2015 16:27:40 +0530
Message-ID: <CAD3vsf63eUw_yMjBQJVagYo9KNnh4c4p8cHEEiLUSO_r7MxGvg@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][fido 3/4] runqemu-internal: add support to boot arm64 qemu target via NFS
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
X-List-Received-Date: Tue, 23 Jun 2015 10:57:40 -0000
Content-Type: multipart/alternative; boundary=089e0129538059f6da05192d425c

--089e0129538059f6da05192d425c
Content-Type: text/plain; charset=UTF-8

ping.

Regards,
Jagadeesh

On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Add required boot parameters inorder to boot arm64 qemu
> target via NFS
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu-internal | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index dc0e053..fb51754 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -389,6 +389,15 @@ if [ "$MACHINE" = "qemuarm64" ]; then
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
> 1.9.1
>
>

--089e0129538059f6da05192d425c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping.</div><div><br></div><div>Regards,</div><div>Jag=
adeesh</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkr=
ishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Add required boot parameters inorder to boot arm64 qemu<br>
target via NFS<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu-internal | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<br>
index dc0e053..fb51754 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -389,6 +389,15 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemuarm64&quot; ];=
 then<br>
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
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--089e0129538059f6da05192d425c--

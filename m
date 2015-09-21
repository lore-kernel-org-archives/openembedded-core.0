Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id F103660053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 17:05:30 +0000 (UTC)
Received: by igxx6 with SMTP id x6so62526697igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J1nSnZcyRbFzQYjT6I8paYepZJ5T0h4Mn/h82Bz9wao=;
	b=L1PV33NB8hVn6ExCKDUv+raG36fLv5/gUvR2AnJeXwG13ypwTxunbWx6sXdkcW39hK
	fb1WosZdRqhZvp0dPPymcb/XISalAir3Tfp1RulYHCrDaNqn/4vpK2dqd58Gt6I+C9oB
	JnGYi9m/YoS1GBJ/y+NGv+vzVUdFZSsMb1W3LHp5m/t6FOZAxe7Ig1p15/PfnnXClY6S
	Ps1oisOLl/CKqpL4XUgAdPhW91V/aCcWgeqxR1Smbxt9dovc4lcupweMUeEyzI7XI1Ov
	VTEibpDJDY+dKdiXapKYfJPmbz2eZvnDovqQduIbOxjsaHUTBLnFwxkHJpaJ9viWyWi3
	lSHQ==
MIME-Version: 1.0
X-Received: by 10.50.110.105 with SMTP id hz9mr1666524igb.77.1442855130864;
	Mon, 21 Sep 2015 10:05:30 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Mon, 21 Sep 2015 10:05:30 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Mon, 21 Sep 2015 10:05:30 -0700 (PDT)
In-Reply-To: <1442834624-25775-1-git-send-email-net147@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
Date: Mon, 21 Sep 2015 10:05:30 -0700
Message-ID: <CAMKF1srzh9OqXn60B3wgxRKExNnTK31rFbSvhrCMwoicF8BR_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 17:05:33 -0000
Content-Type: multipart/alternative; boundary=089e0115fbea89a3b8052044e3ab

--089e0115fbea89a3b8052044e3ab
Content-Type: text/plain; charset=UTF-8

Please make it arm specific
On Sep 21, 2015 4:22 AM, "Jonathan Liu" <net147@gmail.com> wrote:

> This fixes systemd failing to start on Raspberry Pi 2 if it is compiled
> with GCC 5.2.
>
> It would try to start "Journal Service" and "udev Kernel Device Manager"
> but fail repeatedly.
>
> [YOCTO #8291]
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_225.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_225.bb
> b/meta/recipes-core/systemd/systemd_225.bb
> index f7d4c7d..4a19ff4 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -123,6 +123,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>  # uclibc does not have NSS
>  EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
>
> +# disable problematic GCC 5.2 optimizations [YOCTO #8291]
> +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
> +
>  do_configure_prepend() {
>         export NM="${HOST_PREFIX}gcc-nm"
>         export AR="${HOST_PREFIX}gcc-ar"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0115fbea89a3b8052044e3ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Please make it arm specific </p>
<div class=3D"gmail_quote">On Sep 21, 2015 4:22 AM, &quot;Jonathan Liu&quot=
; &lt;<a href=3D"mailto:net147@gmail.com">net147@gmail.com</a>&gt; wrote:<b=
r type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This fixes systemd fa=
iling to start on Raspberry Pi 2 if it is compiled<br>
with GCC 5.2.<br>
<br>
It would try to start &quot;Journal Service&quot; and &quot;udev Kernel Dev=
ice Manager&quot;<br>
but fail repeatedly.<br>
<br>
[YOCTO #8291]<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_225.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_225.bb</a> b/meta/recipes-core/s=
ystemd/<a href=3D"http://systemd_225.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd_225.bb</a><br>
index f7d4c7d..4a19ff4 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_225.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_225.bb</a><br>
@@ -123,6 +123,9 @@ EXTRA_OECONF =3D &quot; --with-rootprefix=3D${rootprefi=
x} \<br>
=C2=A0# uclibc does not have NSS<br>
=C2=A0EXTRA_OECONF_append_libc-uclibc =3D &quot; --disable-myhostname &quot=
;<br>
<br>
+# disable problematic GCC 5.2 optimizations [YOCTO #8291]<br>
+FULL_OPTIMIZATION +=3D &quot;-fno-schedule-insns -fno-schedule-insns2&quot=
;<br>
+<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export NM=3D&quot;${HOST_PREFIX}gcc-nm&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export AR=3D&quot;${HOST_PREFIX}gcc-ar&quot;<br=
>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--089e0115fbea89a3b8052044e3ab--

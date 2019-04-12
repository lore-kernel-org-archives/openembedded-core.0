Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B6BE67DC57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 16:35:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x12so11921223qts.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bAjKuiGJs33oLEEAE+mmacTfLDpVZPFTf/pI9uey7tA=;
	b=jtZQBLhVEG8J1Y/8kezn/SYcUyAndkdYDeLBQ8c4mdNR4WLBnbXRUk5l3n0nuEJtXC
	z1mQw7Q0XGwF86JyAcjooure2mzgNWIu6Wolpz5hRnUUB/7++DMBUX45J0yktl99fKou
	5ULmBYHbMbiCjzIqtT6xfxLEVyKXHZeISRRb2FxWoMBRXbPZltd79Xz8MQ8weRfh0lwC
	UBW4Alu7NhfIRLdef28roTCa7ggcLR6n/Pr3Cv029kicP9E8oGzVhfWxxEhgQiXGZaIk
	hy4kkQnJexED0Cov57fTnYJL2iEfc91Yagnn348BtEq326bhRZ207ZlXZwVopTZOOYD/
	rrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bAjKuiGJs33oLEEAE+mmacTfLDpVZPFTf/pI9uey7tA=;
	b=asahbXDdofGIXy/00+ZOULq384HcWEgKXTX38CIel4an/g3ZjnSVuRP7tufdyfy/CN
	Okrzj7XZ9asjs6SXaAXIjpNWjaFzfX7RaB2kMBZ6aIMgTabx9NpS+M9GC5/HYEUqRYEE
	wPEvykjorr4MbALgNxi4N09GA3wvvD/uf/Rrz7tSfiE+losfMWcpyZXMOeZUqKxnY+b5
	rfU0vMYqaQG5LyU53W9SUO8Uvv8Cyn+/tDS+vXDHq7Jqy0Tv92RQH6cYl0PgwoJq7u45
	36C8lOzApRNiTDstiAF7ejhb5ShIaYnNh32jNLKm52F/nc81ISihw2nTf7gXAriz8mIV
	ncdA==
X-Gm-Message-State: APjAAAXGJ9m5aoEnr0AXuuHItwODSh8bpIbHgUmMfq7nkFedTow7p/oX
	aC+GRRXwbVJFpsGo2XjDGjgVnoZZJggqr765glk=
X-Google-Smtp-Source: APXvYqyLQ2/MEY4G8T3z3OKRz2oWprEoJ4j4uBn39wW62cLU5jVu/ppvuDPtIt577cH8A6zy80mGVlb49DWezsfd/90=
X-Received: by 2002:a0c:c988:: with SMTP id b8mr47033854qvk.33.1555086946225; 
	Fri, 12 Apr 2019 09:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190412054625.9447-1-mike@foundries.io>
In-Reply-To: <20190412054625.9447-1-mike@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Apr 2019 09:35:35 -0700
Message-ID: <CAMKF1sqvdAkHU+htzTcoGgtWrSrp2t76CAYxvDJpxRroKn6+gA@mail.gmail.com>
To: Michael Scott <mike@foundries.io>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Fri, 12 Apr 2019 16:35:46 -0000
Content-Type: multipart/alternative; boundary="00000000000006544e058657e587"

--00000000000006544e058657e587
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io> wrote:

> Support RISC-V kernel image, using the "Image" target.
>
> This change allows RISC-V support for fitImage via the following
> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> with ramdisk and dtb).
>
> This was tested using QEMU RISC-V 64-bit.
>
> Signed-off-by: Michael Scott <mike@foundries.io>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 2517d75746..2820ff9689 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -10,6 +10,8 @@ python __anonymous () {
>          uarch = d.getVar("UBOOT_ARCH")
>          if uarch == "arm64":
>              replacementtype = "Image"
> +        elif uarch == "riscv":
> +            replacementtype = "Image"


Make it or condition along with arm64 check

>
>          elif uarch == "mips":
>              replacementtype = "vmlinuz.bin"
>          elif uarch == "x86":
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000006544e058657e587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 11, 2019 at 10:46 PM Michael Scott &lt;<a href=
=3D"mailto:mike@foundries.io">mike@foundries.io</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Support RISC-V kernel image, using the &quot;Im=
age&quot; target.<br>
<br>
This change allows RISC-V support for fitImage via the following<br>
flow: OpenSBI -&gt; u-boot (as payload) -&gt; Linux kernel (as fitImage<br>
with ramdisk and dtb).<br>
<br>
This was tested using QEMU RISC-V 64-bit.<br>
<br>
Signed-off-by: Michael Scott &lt;<a href=3D"mailto:mike@foundries.io" targe=
t=3D"_blank">mike@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass<br>
index 2517d75746..2820ff9689 100644<br>
--- a/meta/classes/kernel-fitimage.bbclass<br>
+++ b/meta/classes/kernel-fitimage.bbclass<br>
@@ -10,6 +10,8 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if uarch =3D=3D &quot;arm64&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replacementtype =3D &quot;I=
mage&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;riscv&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &quot;Image&=
quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Make it or =
condition along with arm64 check=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif uarch =3D=3D &quot;mips&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replacementtype =3D &quot;v=
mlinuz.bin&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif uarch =3D=3D &quot;x86&quot;:<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000006544e058657e587--

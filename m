Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39450C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:28:20 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.12199.1721298497156146158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mRclE9tf;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-48fe6ddc33bso224923137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721298496; x=1721903296; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+z9LIV4bF2go+PdpqYcDA3tOLRiwP6FwCqBvTK4S77U=;
        b=mRclE9tftSJZTwCxfqCgSjYdSJXWiG57VzGCi+ztxx8bcD77OSOGIfJKvtADegxfwp
         Y0YM9ckn5s3bGndkbDp+lolAwkMC7ArR8iBHeJ/6yULnfhqRyQ2NQEIBPhuCgg4+nftC
         4S9JWAI9KnxGYUMufk5ENVoRTzv+wh6MiR7Hsr7nNd2PWbZfg1R457NkORaOTpldyiag
         UClozjx1I83t35HqkUgcjIFu56zLpK0qaoPl59UxPOqp8eHkyUxpwV9XZ6qC5eZ2jLyo
         CfvRyEJAKCFmYw0UkGNMt/B/w9aTngfDmAn1diDnR8M0jU/bhXq+71gUW9dNmm7FvkeG
         P/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298496; x=1721903296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+z9LIV4bF2go+PdpqYcDA3tOLRiwP6FwCqBvTK4S77U=;
        b=qytcCQLcW/l2LVpPj4mNZxfmAMKN45VKM7kEy+MC42SgYxbkS2TBX4hfsRIq1ZMTjO
         9pemU25yD5TOV9cMgOAXXdt2gSsKsbFv9DOc98OoLX3SRgiDE8/jeLSHkx98P2601tmz
         ygIveQKEFsWInng9JEhd0OZyRnpb2Yy0t4JuKPofENxN7JUNv7r3rJEGsHdw/Tbvjocx
         GW5NrCxhLR/6I07iU4GJNyqsVm6I5cPadu46/MLkoOR1u9mmvoUwgAXAaQ2FUfIplc1b
         v5l3EqoPjtoUKxY261zp4dMVTAb9NncGMPON/pa6f7Iv0jUzrOpm+2J6oIGhGOc+Bhxt
         BRsA==
X-Forwarded-Encrypted: i=1; AJvYcCVBj2Mnw8ifSol92rKDIQEVG4UQivcMGaYcLRY7GXwMfi2b+uEB4GEZUt0Y36HgA0hXVAhwdSZNfQ+mt5n8p8Xd3iUyaEzbK5eAHFAtSnAyW7H0adaZ1pYw
X-Gm-Message-State: AOJu0Yz+H4E7eRZi6jUBlPZlX9Zyfj1kaKY4N31c5NDqj1mQXP+W7afi
	tEbDfQ+Wk439S3nywUndYStL6FmFK2cUHBO0d6BBgAoejMl8JhuGQKBdF0eS10XJNDs/33sMgFr
	VXCwAmA4os8lBrjRJXtTr8IShB6A8EPBs
X-Google-Smtp-Source: AGHT+IEZhG7iOriglsrEsnGfujBfwGoqoveesqeKRRVibSGSjr/7wfT1VdM2UYU/3Muf00ciP8gVoA2gh9WIUemOayw=
X-Received: by 2002:a05:6102:5345:b0:48f:eb67:9239 with SMTP id
 ada2fe7eead31-491599fa673mr4618793137.32.1721298496056; Thu, 18 Jul 2024
 03:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com> <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
In-Reply-To: <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 18 Jul 2024 11:28:05 +0100
Message-ID: <CANPvuRnVz=_xQvZ=8DFvNoOH2SLR9cK0UpTSzF5BAOXE-frKYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when building fitImages
To: adrian.freihofer@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068f276061d8309e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202204

--00000000000068f276061d8309e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adrian Freihofer via lists.openembedded.org <adrian.freihofer=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 18/07/2024 =C3=A0(s) 09=
:00):

> Hi Martin
>
> Thank you for looking at my patches.
>
> On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:
> > Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX
> > changes?
>
> I wonder why this happens in WebOS. I think that this line
> kernel_do_deploy[vardepsexclude] =3D "DATETIME"
> prevents such unnecessary rebuilds.
>
> So far we haven't had any problems with rebuilding kernels. The trouble
> started when we started using fitImages with initramfs for some
> devices. It is also worth noting that we build from sstate, but with an
> empty TMPDIR.
>
> In such a scenario bitbake does:
>
>  * The initramfs gets assembled. This is expected because images are
>    not sstate cached. This runs quickly because all the packages which
>    are required to build the initramfs come from sstate-cache.
>  * Since the initramfs changes, the fitImage which includes it must be
>    re-assembled as well.
>

I have faced this problem and sent a patch [1] to support storing the full
images on the sstate.
As it was not a tested and widely used case, it was rejected.
We continue using this in our distro but without the patch we need to
change more parts on our side.

[1] https://lists.openembedded.org/g/openembedded-core/message/184243


>  * Now the hassle starts: The do_assemble_fitimage_initramfs needs the
>    kernel binaries (linux.bin, DTBs...) which are not available from
>    sttate. Bitbake has to start with kernel do_fetch in case of an
>    empty TMPDIR just to get the fitImage assembled.
>
> With my patches the kernel binaries used for the fitImage come from
> sstate (if the initramfs is not bundled).
>

Anyway your overwall patch set is still a good improvement to not
rebuilding the kernel.
That was my concern also and the main reason for my patch.

Jose


>
> I tested this like that:
>
> cat build/conf/local.conf
>
> KERNEL_IMAGETYPE =3D "Image"
> KERNEL_IMAGETYPES +=3D " fitImage "
> KERNEL_CLASSES =3D " kernel-fitimage "and RAM disk
> IMAGE_FSTYPES +=3D "cpio.gz"
> INITRAMFS_IMAGE =3D "core-image-minimal"
> IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
> UBOOT_RD_LOADADDRESS =3D "0x88000000"
> UBOOT_RD_ENTRYPOINT =3D "0x88000000"
> UBOOT_LOADADDRESS =3D "0x80080000"
> UBOOT_ENTRYPOINT =3D "0x80080000"
> FIT_DESC =3D "A model description"
>
> # Allow to change the initramfs
> FOO_VAR =3D "1"
> INHERIT +=3D "image-buildinfo"
> IMAGE_BUILDINFO_VARS:append =3D " FOO_VAR"
>
>
> bitbake virtual/kernel
>
> mv build/tmp build/tmp-old-1
>
> bitbake virtual/kernel
> -> bitbake does:
> - setscene tasks
> - core-image-minimal do_rootfs ...
> - kernel do_deploy (from sstate)
> - kernel do_deploy_fitimage_unbundled
>
>
> bitbake virtual/kernel
> -> bitbake does: nothing
>
>
> # Enforce a re-build of the initramfs
> mv build/tmp build/tmp-old-2
> echo 'FOO_VAR =3D "1"' >> build/conf/local.conf
>
> bitbake virtual/kernel
> -> bitbake does:
> - setscene tasks
> - core-image-minimal do_rootfs ...
> - kernel do_deploy (from sstate)
> - kernel do_deploy_fitimage_unbundled
>
>
> bitbake virtual/kernel
> -> bitbake does: nothing
>
>
> diff \
> <(ls build/tmp-old-2/deploy/images/qemux86-64 -1) \
> <(ls build/tmp/deploy/images/qemux86-64/ -1)
> 4,10c4,10
> < core-image-minimal-qemux86-64-20240718065105.cpio.gz
> < core-image-minimal-qemux86-64-20240718065105.ext4
> < core-image-minimal-qemux86-64-20240718065105.manifest
> < core-image-minimal-qemux86-64-20240718065105.qemuboot.conf
> < core-image-minimal-qemux86-64-20240718065105.spdx.tar.zst
> < core-image-minimal-qemux86-64-20240718065105.tar.bz2
> < core-image-minimal-qemux86-64-20240718065105.testdata.json
> ---
> > core-image-minimal-qemux86-64-20240718073341.cpio.gz
> > core-image-minimal-qemux86-64-20240718073341.ext4
> > core-image-minimal-qemux86-64-20240718073341.manifest
> > core-image-minimal-qemux86-64-20240718073341.qemuboot.conf
> > core-image-minimal-qemux86-64-20240718073341.spdx.tar.zst
> > core-image-minimal-qemux86-64-20240718073341.tar.bz2
> > core-image-minimal-qemux86-64-20240718073341.testdata.json
> 20c20
> < fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718065105.bin
> ---
> > fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718073341.bin
> 22c22
> < fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718065105.its
> ---
> > fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
> 20240718073341.its
>
>
>
> The answer is then: No it does not re-build. At least not in the
> scenario which I would like to fix it, it does not rebuild from
> scratch.
>
> Does that make sense?
>
> Regards,
> Adrian
>
> > >
> > >
> > >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202191):
> https://lists.openembedded.org/g/openembedded-core/message/202191
> Mute This Topic: https://lists.openembedded.org/mt/107231736/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000068f276061d8309e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Adrian Freihofer via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;adrian.freihofer=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; escreveu (quinta, 18/07/2024 =C3=A0(s) 09:00):<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin<br>
<br>
Thank you for looking at my patches.<br>
<br>
On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:<br>
&gt; Doesn&#39;t it still rebuild from scratch when IMAGE_VERSION_SUFFIX<br=
>
&gt; changes?<br>
<br>
I wonder why this happens in WebOS. I think that this line<br>
kernel_do_deploy[vardepsexclude] =3D &quot;DATETIME&quot;<br>
prevents such unnecessary rebuilds.<br>
<br>
So far we haven&#39;t had any problems with rebuilding kernels. The trouble=
<br>
started when we started using fitImages with initramfs for some<br>
devices.=C2=A0It is also worth noting that we build from sstate, but with a=
n<br>
empty TMPDIR.<br>
<br>
In such a scenario bitbake does:<br>
<br>
=C2=A0* The initramfs gets assembled. This is expected because images are<b=
r>
=C2=A0 =C2=A0not sstate cached. This runs quickly because all the packages =
which<br>
=C2=A0 =C2=A0are required to build the initramfs come from sstate-cache.<br=
>
=C2=A0* Since the initramfs changes, the fitImage which includes it must be=
<br>
=C2=A0 =C2=A0re-assembled as well.<br></blockquote><div><br>I have faced th=
is problem and sent a patch [1] to support storing the full images on the s=
state.</div><div>As it was not a tested and widely used case, it was reject=
ed.<br>We continue using this in our distro but without the patch we need t=
o change more parts on our side.<br></div><div><br></div><div>[1] <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/184243">http=
s://lists.openembedded.org/g/openembedded-core/message/184243</a><br></div>=
<div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0* Now the hassle starts: The do_assemble_fitimage_initramfs needs the=
<br>
=C2=A0 =C2=A0kernel binaries (linux.bin, DTBs...) which are not available f=
rom<br>
=C2=A0 =C2=A0sttate. Bitbake has to start with kernel do_fetch in case of a=
n<br>
=C2=A0 =C2=A0empty TMPDIR just to get the fitImage assembled.<br>
<br>
With my patches the kernel binaries used for the fitImage come from<br>
sstate (if the initramfs is not bundled).<br></blockquote><div><br></div><d=
iv><div>Anyway=C2=A0your overwall patch set is still=C2=A0a good improvemen=
t to not rebuilding the kernel.</div><div>That=C2=A0was my concern=C2=A0als=
o and the main reason for my patch.</div><div>=C2=A0</div><div>Jose</div></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I tested this like that:<br>
<br>
cat build/conf/local.conf<br>
<br>
KERNEL_IMAGETYPE =3D &quot;Image&quot;<br>
KERNEL_IMAGETYPES +=3D &quot; fitImage &quot;<br>
KERNEL_CLASSES =3D &quot; kernel-fitimage &quot;and RAM disk<br>
IMAGE_FSTYPES +=3D &quot;cpio.gz&quot;<br>
INITRAMFS_IMAGE =3D &quot;core-image-minimal&quot;<br>
IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D &quot;&quot;<br>
UBOOT_RD_LOADADDRESS =3D &quot;0x88000000&quot;<br>
UBOOT_RD_ENTRYPOINT =3D &quot;0x88000000&quot;<br>
UBOOT_LOADADDRESS =3D &quot;0x80080000&quot;<br>
UBOOT_ENTRYPOINT =3D &quot;0x80080000&quot;<br>
FIT_DESC =3D &quot;A model description&quot;<br>
<br>
# Allow to change the initramfs<br>
FOO_VAR =3D &quot;1&quot;<br>
INHERIT +=3D &quot;image-buildinfo&quot;<br>
IMAGE_BUILDINFO_VARS:append =3D &quot; FOO_VAR&quot;<br>
<br>
<br>
bitbake virtual/kernel<br>
<br>
mv build/tmp build/tmp-old-1<br>
<br>
bitbake virtual/kernel<br>
-&gt; bitbake does:<br>
- setscene tasks<br>
- core-image-minimal do_rootfs ...<br>
- kernel do_deploy (from sstate)<br>
- kernel do_deploy_fitimage_unbundled<br>
<br>
<br>
bitbake virtual/kernel<br>
-&gt; bitbake does: nothing<br>
<br>
<br>
# Enforce a re-build of the initramfs<br>
mv build/tmp build/tmp-old-2<br>
echo &#39;FOO_VAR =3D &quot;1&quot;&#39; &gt;&gt; build/conf/local.conf<br>
<br>
bitbake virtual/kernel<br>
-&gt; bitbake does:<br>
- setscene tasks<br>
- core-image-minimal do_rootfs ...<br>
- kernel do_deploy (from sstate)<br>
- kernel do_deploy_fitimage_unbundled<br>
<br>
<br>
bitbake virtual/kernel<br>
-&gt; bitbake does: nothing<br>
<br>
<br>
diff \<br>
&lt;(ls build/tmp-old-2/deploy/images/qemux86-64 -1) \<br>
&lt;(ls build/tmp/deploy/images/qemux86-64/ -1)<br>
4,10c4,10<br>
&lt; core-image-minimal-qemux86-64-20240718065105.cpio.gz<br>
&lt; core-image-minimal-qemux86-64-20240718065105.ext4<br>
&lt; core-image-minimal-qemux86-64-20240718065105.manifest<br>
&lt; core-image-minimal-qemux86-64-20240718065105.qemuboot.conf<br>
&lt; core-image-minimal-qemux86-64-20240718065105.spdx.tar.zst<br>
&lt; core-image-minimal-qemux86-64-20240718065105.tar.bz2<br>
&lt; core-image-minimal-qemux86-64-20240718065105.testdata.json<br>
---<br>
&gt; core-image-minimal-qemux86-64-20240718073341.cpio.gz<br>
&gt; core-image-minimal-qemux86-64-20240718073341.ext4<br>
&gt; core-image-minimal-qemux86-64-20240718073341.manifest<br>
&gt; core-image-minimal-qemux86-64-20240718073341.qemuboot.conf<br>
&gt; core-image-minimal-qemux86-64-20240718073341.spdx.tar.zst<br>
&gt; core-image-minimal-qemux86-64-20240718073341.tar.bz2<br>
&gt; core-image-minimal-qemux86-64-20240718073341.testdata.json<br>
20c20<br>
&lt; fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-<br>
20240718065105.bin<br>
---<br>
&gt; fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-<br>
20240718073341.bin<br>
22c22<br>
&lt; fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-<=
br>
20240718065105.its<br>
---<br>
&gt; fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-<=
br>
20240718073341.its<br>
<br>
<br>
<br>
The answer is then: No it does not re-build. At least not in the<br>
scenario which I would like to fix it, it does not rebuild from<br>
scratch.<br>
<br>
Does that make sense?<br>
<br>
Regards,<br>
Adrian<br>
<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202191): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202191" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202191</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107231736/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107231736/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000068f276061d8309e0--


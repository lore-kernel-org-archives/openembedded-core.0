Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.1668.1619032521121593461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 12:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFMCdi1x;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id 18so18639610qtz.6
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=VjsLwyGSgJhZ3HeYeXmGauL/mtOnD6EwXA3I87PLYMs=;
        b=BFMCdi1x1q4AE6Hiz5RDrmq2RmI5Am0C0vDNC9uizVsafig12gCYxqaAA8BCODx0M/
         MXPuWeFvmm1L7LrqnT6FLHjg3dZB2cCxqI+25sF5AprgwrjY4s86UZDyVzaoNNkefwF1
         0L6LW1A0dscaTbIpsFzxzFrS5HIWiIDRMtEVltZnkH6fR6ztfssY/w5NK5t7TeduLtpQ
         8YeTRb0apIcWe+MWUN2USlc1po21UNmPoOlJ1SZDWMRZ6q/C/ucCiVz1+RK+1wpSFa0+
         krNLhUNSySefxnmOGXjOl6/910EJIQ9kFK3M7YNmzf3b+5E8I246T07iTS27CwKMEjgq
         w98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=VjsLwyGSgJhZ3HeYeXmGauL/mtOnD6EwXA3I87PLYMs=;
        b=cFfTELFCQrWXfket24q/NI4QczS56nQJXuru8ZG2cnXaQjIPYZzzYXfFpGCrvnSylO
         ZWSukZJPT4AnZMyxJDWyEx5xXsO88987s9zt+gQVmBmFg12/F+fLl9L6+zbZLjZIQ23N
         94l7f55i3KsjaQZwP5HI3cdY1r/twvcebMkxdz8wVUWjEto5Oy3JkwHBEAbivzdkS82+
         o2KkMAv+Eif2u3D2cXVT946hnjeBEm/Ubf+YW7i2wdtPV6bUxcXPjtetGqrK94RjaW62
         FdP/azzAbs7+gOyZeKwiLBNAqSu7jBAYNwFutg+M8YarFhM3UfffafyKWRlmAv1LOVZr
         7Vpw==
X-Gm-Message-State: AOAM533sRZNp6pTZDGePtJQg1Won68N7WDbXlmU61CUab+COe4cElVdO
	Gwwd+/m2MLBhFpDNlYTxvqrJuaQcYn5Udw==
X-Google-Smtp-Source: ABdhPJwBF6i4lWj7nHGHQDMqpQf50AFbSsddFevFEVIpxng3wySTdaVDiM7qU3GnUc7knZk+fqYpTw==
X-Received: by 2002:ac8:59c1:: with SMTP id f1mr23188221qtf.302.1619032520082;
        Wed, 21 Apr 2021 12:15:20 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:88a4:d0a6:b1d8:99c0? ([2804:14d:5487:a7d6:88a4:d0a6:b1d8:99c0])
        by smtp.gmail.com with ESMTPSA id f2sm233129qkh.76.2021.04.21.12.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 12:15:19 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Wed, 21 Apr 2021 16:15:16 -0300
Message-Id: <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: iPhone Mail (18D70)
Content-Type: multipart/alternative; boundary=Apple-Mail-39204D2C-8402-48B5-96A9-CC0FF209E376
Content-Transfer-Encoding: 7bit

--Apple-Mail-39204D2C-8402-48B5-96A9-CC0FF209E376
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

That's a neat idea - if the exception handler catches OSError with error num=
ber 18 (Invalid cross-device link) in os.rename, it should attempt shutil.mo=
ve, otherwise it should re-throw the exception with raise. A wrapper functio=
n will make it easier to handle other situations as they arise. I'll update t=
he patch.

Thanks,
Devendra

> Em 21 de abr. de 2021, =C3=A0(s) 15:10, Richard Purdie <richard.purdie@lin=
uxfoundation.org> escreveu:
>=20
> =EF=BB=BFOn Wed, 2021-04-21 at 11:43 -0300, Devendra Tewari wrote:
>> I created an image for Raspberry Pi Zero W from code at =20
>> https://github.com/tewarid/docker-meta-raspberrypi/tree/sstate, using Doc=
ker for macOS, and on Ubuntu 20.04-
>> LTS, and wrote it out to an SDCard using bmaptool. Booted and checked tha=
t busybox symlinks in rootfs look
>> all right.
>>=20
>>> Em 21 de abr. de 2021, =C3=A0(s) 02:22, Khem Raj <raj.khem@gmail.com> es=
creveu:
>>>=20
>>> =EF=BB=BFNone of my images are bootable when this patch is applied, beca=
use
>>> symlinks that busybox should provide arent created in the image. This
>>> patch should be looked into a bit further,  how was it tested ?
>=20
> I think there is some element to this we're not understanding. I'm also
> worried that the exception is quite generic, OSError covers a lot of thing=
s
> and we probably need to make it more specific.
>=20
> I'd suggest we add a patch changing all the call sites to use a new
> wrapper function in bb.utils and then we can adjust that single site to
> handle issues as they arise and as we understand them.
>=20
> Cheers,
>=20
> Richard
>=20

--Apple-Mail-39204D2C-8402-48B5-96A9-CC0FF209E376
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">That's a neat idea - if th=
e exception handler catches OSError with error number 18 (<span style=3D"fon=
t-size: medium; -webkit-text-size-adjust: auto;">Invalid cross-device link</=
span>) in os.rename, it should attempt shutil.move, otherwise it should re-t=
hrow the exception with raise. A wrapper function will make it easier to han=
dle other situations as they arise. I'll update the patch.</div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr">Thanks,</div><div dir=3D"ltr">Devendra</div>=
<div dir=3D"ltr"><br><blockquote type=3D"cite">Em 21 de abr. de 2021, =C3=A0=
(s) 15:10, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; escreve=
u:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=
=BF<span>On Wed, 2021-04-21 at 11:43 -0300, Devendra Tewari wrote:</span><br=
><blockquote type=3D"cite"><span>I created an image for Raspberry Pi Zero W f=
rom code at&nbsp; </span><br></blockquote><blockquote type=3D"cite"><span>ht=
tps://github.com/tewarid/docker-meta-raspberrypi/tree/sstate, using Docker f=
or macOS, and on Ubuntu 20.04-</span><br></blockquote><blockquote type=3D"ci=
te"><span>LTS, and wrote it out to an SDCard using bmaptool. Booted and chec=
ked that busybox symlinks in rootfs look</span><br></blockquote><blockquote t=
ype=3D"cite"><span>all right.</span><br></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Em 21 de abr. de 2021, =C3=A0(s) 02:22, Khem Raj &lt;raj.khem@g=
mail.com&gt; escreveu:</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>=EF=BB=BFNone of m=
y images are bootable when this patch is applied, because</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
symlinks that busybox should provide arent created in the image. This</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>patch should be looked into a bit further, &nbsp;how was it test=
ed ?</span><br></blockquote></blockquote><span></span><br><span>I think ther=
e is some element to this we're not understanding. I'm also</span><br><span>=
worried that the exception is quite generic, OSError covers a lot of things<=
/span><br><span>and we probably need to make it more specific.</span><br><sp=
an></span><br><span>I'd suggest we add a patch changing all the call sites t=
o use a new</span><br><span>wrapper function in bb.utils and then we can adj=
ust that single site to</span><br><span>handle issues as they arise and as w=
e understand them.</span><br><span></span><br><span>Cheers,</span><br><span>=
</span><br><span>Richard</span><br><span></span><br></div></blockquote></bod=
y></html>=

--Apple-Mail-39204D2C-8402-48B5-96A9-CC0FF209E376--

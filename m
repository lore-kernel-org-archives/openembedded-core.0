Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.25505.1595751753767102947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 01:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U3dQ8IEL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so11820064wml.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rUtx4fm4A4ESAyNvHH3xzOuVxRhzwZ3rg2ZSmMZV67Q=;
        b=U3dQ8IELRFmqN6+e1IM3s3W9FbOfEq2ghStyavR4fBhwBcWG/i2mKeoKFiL18I/H6H
         eSYDjT4lo7eeuD8MXx6/iKjyVXdnRlSth8QORjojzREgBDHWNwTbQwpkeU6RsaUESsyL
         VgNO7Ee4RAEpo33q2QLhgIIo/d6rmW1kdWS0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rUtx4fm4A4ESAyNvHH3xzOuVxRhzwZ3rg2ZSmMZV67Q=;
        b=gOepsCGGK1GllqRNEfNZxho5Ehxo1Vlq12hJaRKgF5iRHIhejJSFWWJh0PA0Jjy0fJ
         Y85O71ngbUmgaYPi8CJ3PDsp9O28xPRLMoMdN40ejOB1JuA00ZnXKfRPW9QgW//skFNI
         M8iQBhuoVQOndjTpktYX81WdPSljR2geOZLrh2ZX/YjBV1YyY2gYV7POqv2eDSe2Vpk1
         VaYU7oYxOTfLovstucAoBO0GMCtITPFxFDS2nV1Qk3BY0ypcSRG1tXVIydL3tQ+AwpNQ
         oVxheezjkR1YkSmMM4Sigcoxwbm16W09AMpOaAplOjNEX4rLkr0hMwjlnLtpC8BsNDoa
         2LTg==
X-Gm-Message-State: AOAM532bakrwQrGKG9ao6hPF2bg5/dFsDfWwm0pA/34XZoYo2xakQr4u
	jyWycPxRYqs9U+zA9Genqxgw8w==
X-Google-Smtp-Source: ABdhPJzD8l+hE1rvcwphC9Q2dWwa3FSlvaj2/kYA2Uq5Kvg5ZZLJnZyuXr1feeixG0kNi2FyrNppsA==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr2670676wme.158.1595751752301;
        Sun, 26 Jul 2020 01:22:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id o4sm12906482wmc.13.2020.07.26.01.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 01:22:29 -0700 (PDT)
Message-ID: <21b69e046379ce7d55e0dfacd42d6e77d175d23b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH] glibc: Upgrade to upcoming 2.32
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 26 Jul 2020 09:22:26 +0100
In-Reply-To: <20200725153705.127723-1-raj.khem@gmail.com>
References: <20200725153705.127723-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-07-25 at 08:37 -0700, Khem Raj wrote:
> Drop 0001-localedef-Add-hardlink-resolver-to-build.patch as its
> applied
> to localedef upstream
>=20
> Drop CVE patches which are already part of 2.32 release
>=20
> Drop unused attribute patch as its fixed differently in 2.32
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Doesn't look too bad however both qemuppc and qemuppc-alt builds are
hanging building gobject-introspection while running:

qemu-ppc -r 3.2.0 -cpu 7400 -L /home/pokybuild/yocto-worker/qemuppc/build/b=
uild/tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/recipe-sys=
root -E LD_LIBRARY_PATH=3D/home/pokybuild/yocto-worker/qemuppc/build/build/=
tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/build/.libs:.li=
bs:/home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-l=
inux/gobject-introspection/1.64.1-r0/recipe-sysroot//usr/lib:/home/pokybuil=
d/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-intr=
ospection/1.64.1-r0/recipe-sysroot//lib /home/pokybuild/yocto-worker/qemupp=
c/build/build/tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/b=
uild/tmp-introspectng7y7pc4/GLib-2.0 --introspect-dump=3D/home/pokybuild/yo=
cto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-introspe=
ction/1.64.1-r0/build/tmp-introspectng7y7pc4/functions.txt,/home/pokybuild/=
yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-intros=
pection/1.64.1-r0/build/tmp-introspectng7y7pc4/dump.xml

(https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/743
 and=20
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/2199)

Also, qemumips failed with a date issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/754

not sure if that is related to this patch or not. Its rerunning to get
a second opinion:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/754

There were also two perl failures but I don't think those are from this
patch.

Cheers,

Richard


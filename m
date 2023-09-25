Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F9BCE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 14:59:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.63076.1695653959754265498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 07:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RQp/3+N8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32329d935d4so1753231f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695653958; x=1696258758; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bcQA1baQeQjWq1SumocAyRNtnXMZz1TIp1MBoD/TM/M=;
        b=RQp/3+N8KzZnbwqovVMlaxuNTIUq+k2bzjP0nvQazpA7SRQ9lcyycTLK7jPJqzCJ64
         bHtxHK4114EF9Q3fRhS4p5imkJnJG8/9nfwNr1TL9JdjwD1iMoL4htpzMWyMw9Bd9qYF
         KS7mLzJyfg7hUs4Or4GPzngQtgAGHDJqALSQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653958; x=1696258758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcQA1baQeQjWq1SumocAyRNtnXMZz1TIp1MBoD/TM/M=;
        b=lHZ7gu/dcKoR9NcxVyxRBd9V5CaXSwPBQP/KOuvfdFxHgFU7MUBICQvPDHEjJRICHL
         hgJoPoOr7znvACvCLptOHf18AmtJtL6RGzXW/zyRACCQz/yyj8R09EOR2j+XJSWRBBOo
         t/1efTNZX8ilxdY3swZL9e4s65tUeEGvNYSsN17GBg786ddMWriO3tRKVuoZO1iLqkNE
         MiSnqwDoddAzUDBkKOX/jkIR0gVee6CD7klml5eoCdVapl62C4wCJATgCgHBlXJzTMsn
         CRj/5Z+UbUyyuvOt3HLK0eJ4J6dEZeZ2SGIcmPuY20kSm0SYsIE+nCtcH4oYht2AlqjQ
         KFsA==
X-Gm-Message-State: AOJu0Yzm4JW4yaxIfgWGhTKedWfQ6K80zuRBpuui/5lheYtN42A3tfvu
	3VUNoJg3RSdJhvqfZYyirvm3dg==
X-Google-Smtp-Source: AGHT+IEuKYRT6dj+ZzBdAkIRYPPnsvSjKXGGE//eP+dNELxF9vq3HIPB1shIQy8294uZSelyXSdQiw==
X-Received: by 2002:a05:6000:146:b0:31f:e5b8:4693 with SMTP id r6-20020a056000014600b0031fe5b84693mr5600774wrx.25.1695653958119;
        Mon, 25 Sep 2023 07:59:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dc0c:9197:530a:4339? ([2001:8b0:aba:5f3c:dc0c:9197:530a:4339])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d5051000000b003197c7d08ddsm12015719wrt.71.2023.09.25.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:59:17 -0700 (PDT)
Message-ID: <4050f808f3123fd5decc61b90926f57608a35eb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] sstate: Stop allowing overlapping
 symlinks from sstate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2023 15:59:16 +0100
In-Reply-To: <CA+chaQdisk-vWfuRvOuK4dGag2coDqJX89OSf_T2YrZEqPSxcg@mail.gmail.com>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
	 <20230920105802.1008778-3-richard.purdie@linuxfoundation.org>
	 <CA+chaQdisk-vWfuRvOuK4dGag2coDqJX89OSf_T2YrZEqPSxcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 14:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188192

On Sun, 2023-09-24 at 11:14 +0200, Martin Jansa wrote:
> Just FYI I think this change is now causing few more recipes to be mutual=
ly exclusive, when they build the same library (even when it's packaged in =
differently named package), in world builds I'm seeing e.g. libslirp and li=
bslirp-virt (from meta-virtualization) causing packagedata failure for one =
of them (depending which one was built second):
>=20
> DEBUG: Staging files from TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/libs=
lirp-virt/4.6.1+git/pkgdata-pdata-input to TOPDIR/BUILD/pkgdata/raspberrypi=
4-64
> ERROR: Recipe libslirp-virt is trying to install files into a shared area=
 when those files already exist. The files and the manifests listing them a=
re:
> =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dev
> =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp0
> =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dbg
> =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-src
> =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> Please adjust the recipes so only one recipe provides a given file.=20
> DEBUG: Python function sstate_task_postfunc finished
>=20
> Bruce is 4.6.1 version in meta-virtualization still needed or can you upd=
ate to libslirp 4.7.0 from oe-core?
> From the git log=C2=A0https://git.yoctoproject.org/meta-virtualization/lo=
g/recipes-networking/slirp it looks like it was originally imported from me=
ta-retro and later renamed from libslirp to libslirt-virt until the oe-core=
 version is validated in runtime.
>=20
> And I'm seeing the same with some internal recipes (e.g. we have faultman=
ager recipe which provides libfm - completely different from libfm from oe-=
core, just library name coincidence).

I did look into this and it *is* a real issue/bug. The output will be
non-deterministic depending upon which is built first.=C2=A0The issue would
"corrupt" anything which is reading data from pkgdata related to the
recipes in question.

The error is therefore correct and we need to do something about this.

Cheers,

Richard



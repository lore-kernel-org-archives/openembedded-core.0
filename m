Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F31BCE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 10:10:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.37325.1695550205838743935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 03:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CYI1fiCY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405524e6769so12882895e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695550204; x=1696155004; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6UB52rFEgtm0FSRLj0MODErA0ShR2z8SCH0jcq00xxA=;
        b=CYI1fiCYDX/Ywb8EZod8e4T06jmGJCYp0qh3ZP8671a6weX5TOhNPDJYQL3rR9c0u5
         q3v1BnbHaASFN03rPpWOluxbpr6rkxnfz8G9YEu96HPVDEWS4f/3+OfzhhbCD8JGd1QG
         Yc8wPUt4OqikkQx/BNbji4jvoZyis4VcISY0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695550204; x=1696155004;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UB52rFEgtm0FSRLj0MODErA0ShR2z8SCH0jcq00xxA=;
        b=ezb3i5rylZXsQiw2pZ3c7A+U2Hg+EtxF6mQBe3ZayyrmX8Hj1AAtlaN96OxLw8gsbc
         xaVavrEltNrBm3QkAT0FqgWgJkm6ltdDiQ8Uw12tTI2MIxaQv5RqaFkSZH5TyX6afTHz
         EfCgwIZ6bdsxqJ2NoihmyyV84jHFVuTCrZ7fCEHydhHVuvyphWBOxxzUsuo5k0wnf/P1
         4a1FMho03SbQztzj3LEreOZi8uvYmiR7qyxIA9D3zOfYm6ewN/SPaJV+yeK6gqVLUt6n
         ZEcfDllFBxWOzY8QdMZ81P2ZHSBrdwBkS6gOhQGvd+dI8HNJqm1BvBKeRJa+5r5a4Nri
         CvyA==
X-Gm-Message-State: AOJu0Yyz985Wr89mZD3BnwVtWqddoTnXkIXJJEDOjdWowCsYwHlCtcJX
	aRPQj+Y38PYFYa4L3QMXfg8+Cw==
X-Google-Smtp-Source: AGHT+IEvqK2gQgpIMXLuNvTy04x9jF0FBsu+kv7YdGtXB8QFnlGM+Ym4Vv8rwMtgWBXLqNLF8Cc4Ow==
X-Received: by 2002:a05:600c:4c16:b0:405:89a1:7642 with SMTP id d22-20020a05600c4c1600b0040589a17642mr635320wmp.1.1695550204167;
        Sun, 24 Sep 2023 03:10:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbea:3fcb:d46:a36a? ([2001:8b0:aba:5f3c:bbea:3fcb:d46:a36a])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bce0e000000b003feff926fc5sm9175071wmc.17.2023.09.24.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 03:10:03 -0700 (PDT)
Message-ID: <9075d6ceefb0b9a5b7d6119c8f885b8e87e2a391.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] sstate: Stop allowing overlapping
 symlinks from sstate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 24 Sep 2023 11:10:02 +0100
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
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 10:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188158

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

This might be safe to exclude due to the way pkgdata works, it is
handled per workdir now. I'd need to check a few things but offhand I
think it will be ok to allow specifically.

Cheers,

Richard


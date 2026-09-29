Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DDFCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:45:03 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.863.1790700299519033237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JV4qU8RO;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.99, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2635749f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790700298; x=1791305098; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3wgnXstcntpa87HytaX7HAozeN5DxMMFB8lEpWU+ko=;
        b=JV4qU8RONJdmWH4MQITw29xPS9rHyEYYXmQnMhs4uAc5dlGdT5KZ1frz8/Xf/Sngiq
         LeE0qlcTTfzK1KexXprpDO0vvHT7ssS80waIr+hxXGgre5e+hy6wDV3S815cW+aTXZeF
         TluSgo2itiUGTAHuyMEQkLnUKr2lq2FPrkWZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700298; x=1791305098;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3wgnXstcntpa87HytaX7HAozeN5DxMMFB8lEpWU+ko=;
        b=ccWEmW5VOBCcV9C2U/ghosb2Dz5O8uZTnWt/g+G3i7NPZITTYVPSz8gRJ/H7QDEfUg
         1gjVN5mO4exNBMUEYbR2ybyx2pU4tys92ITyhppzFauCXwORod0N9eWNg/sEkrjqeg1M
         3CLtEx/A+5tpVKzaUvXigEBsNJ4/MxNourL3yU2hg+qEsY783Rw3dREP68/Id3FOrzKq
         O4Op/GbC06DPxIaQYrmwHxqS1O0C5JWIx0DLIrjDbMseKmjAwa6GngvX6rVzU1vd4nyP
         cRMYHhbd0PJjJz+iDXTHE9iIWYiC1O+RVqR39wUNl04KLfc1lUXOmE5TWO8PEuwvf1V6
         tqWw==
X-Forwarded-Encrypted: i=1; AKwUvBwfsc48zeC0VhmJrn5ObRacde8IjlRg01hh7zAP9UAIAUqSG2ij/q7ILpvppzaIdZ7gka9dxgLnaqVOcIkpaiVsrw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJU5p5jeKf6vJjMsxR7I3SMBvfWRyEzlAhtylc64k/GvuFtWzsX
	tqaipMj61HRrQedGLCfhcqGTih8vzuy3aasu/qU9OsaGmJOKXGjYSJIFJHNjfUiDq2M=
X-Gm-Gg: AYBFou3EAMbShG3wLEshfQqTOkJ4SpUIGW45Pd7bvoQT/vdbvNi2lJJiy7VHeoSs75P
	8/tin700PpJ1+ztA9jQKSspqqtwh647zJc9inijWnTFRaLrfJ/vg6Z8s6TzMraDz4ZabXkgdDjg
	KGQ1nDgmhU/bm+nL+UXJ2uB6EF+XH2xfmtkuEVJucsZhXHAIgqvCRk531xWnJ7+/9q0zOEHXSx6
	HocUz/4ZkBOMVZwdn9Sgp3lSgg6vVDWmcl+zVcJyx0flucfHzMcIz8BIDGVfG+St87hhjFjch/J
	HNenKK6OqzWMRnngozq5RDE35oroij2dROT762bShHsBMkp+b1vN7fJHAbeNwHb015RuuEPUyu2
	3oRy0WSfOdxFSlbDfMEDGa7bSdcKDnR8wzgkYrQIDHiNBPSRwXkuBhR+y6nIZUYoz7luj6/avt0
	t7UMIxCFRoDWfPaGKRQ/nWPKaev/eYf1n/1H1veoiay/dsGGf0U6RsdDiN2T0/MX+dgafAXN9r8
	QhjXOuZ9fFlNXeIHMME/oFv8pHsAcGPIOiOBW1mjQP116DA7VNuy0P2fEl0
X-Received: by 2002:a05:6000:26d0:b0:48a:fbd2:c2b6 with SMTP id ffacd0b85a97d-48afbd2c415mr1858344f8f.55.1790700297652;
        Tue, 29 Sep 2026 09:44:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c2fb:8115:9b9:553a? ([2001:8b0:aba:5f3c:c2fb:8115:9b9:553a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50a3c49sm5380348f8f.34.2026.09.29.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:44:57 -0700 (PDT)
Message-ID: <d20ad5bc060f49a1174c62b8f7cd92bcbe5366c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 17.2 -> 18.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2026 17:44:56 +0100
In-Reply-To: <fd2d10b8-5d64-42ab-aeb2-64e320e33851@est.tech>
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
	 <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
	 <fd2d10b8-5d64-42ab-aeb2-64e320e33851@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246882

On Tue, 2026-09-29 at 17:56 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
>=20
> On 2026-09-29 14:08, Richard Purdie wrote:
> > On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via
> > lists.openembedded.org wrote:
> > > NEWS:
> > > https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_p=
lain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release
> > >=20
> > > - Refresh existing patches
> > >=20
> > > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > I think this triggered:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4785
> >=20
> Hi Richard,
>=20
> I tried different combinations(with musl and without) locally on my=20
> machine (ubuntu 24) and no issues found.
>=20
> Could this is be host contamination or sstate issue ?
>=20
> Can you retrigger autobuilder again ?

No, I'm not doing that. A better question is could we look at
config.log from the failing build. We can and it says:

configure:29766: gcc  -o conftest -isystem/srv/pokybuild/yocto-worker/musl-=
qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-s=
ysroot-native/usr/include -O2 -pipe     -isystem/srv/pokybuil
d/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-=
x86_64/18.1/recipe-sysroot-native/usr/include -I/srv/pokybuild/yocto-worker=
/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-
x86_64/18.1/recipe-sysroot-native/usr/include  -L/srv/pokybuild/yocto-worke=
r/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/r=
ecipe-sysroot-native/usr/lib                         -L/srv/p
okybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb=
-cross-x86_64/18.1/recipe-sysroot-native/lib                         -Wl,--=
enable-new-dtags                         -Wl,-rpath-link,/srv
/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/g=
db-cross-x86_64/18.1/recipe-sysroot-native/usr/lib                         =
-Wl,-rpath-link,/srv/pokybuild/yocto-worker/musl-qemux86-64/b
uild/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-nativ=
e/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/musl-q=
emux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/
18.1/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/=
pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gd=
b-cross-x86_64/18.1/recipe-sysroot-native/lib               =20
         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/po=
kybuild/yocto-worker/musl-qemux86-64/build/build/tmp/sysroots-uninative/x86=
_64-linux/lib/ld-linux-x86-64.so.2 -pthread conftest.c -lncurse
sw -latomic -lm  >&5
configure:29766: $? =3D 0
configure:29766: ./conftest
./conftest: error while loading shared libraries: libatomic.so.1: cannot op=
en shared object file: No such file or directory
configure:29766: $? =3D 127

which gives at least some hint as to what the issue may be...

Cheers,

Richard


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F05AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:21:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.53020.1684336901057015700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 08:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=48sIB8oU;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-96aa0cab88dso140794366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684336899; x=1686928899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+b9saLVQSzoGBSqx7jouiWgwRLWSt72PHRf7v/EdAY=;
        b=48sIB8oUKccUiozyA0B5A/bR3nRWKQKc91+2qo60y+sYtwdPiunW4YF8xnVT+x6Qd8
         JJ7ukCfkOR6IwUE9oJnfimHKmRsWoNvIJg+nAc2KiMjiVzbfnxjzTcCddH3QS5t+YZco
         nILJ7SDsoVumqcI76yanREHq3D7xi9oUlM37y3hKG8ykg7PCPjvKV4wk9pesAFxMBnxz
         sV4pjYA1dcP7tDCj7Dl0JqK1V7Lx/KN+1ugIifVHOdUyJWBDaEfA8VmZ7fhHjubrWpRc
         7+IiT4CGpOlk8YnwGqE6HsVNXDu4pRrJZFxkPYA+bqqunm0vMwMCh2y8wlK4djO3RuMK
         g4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684336899; x=1686928899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+b9saLVQSzoGBSqx7jouiWgwRLWSt72PHRf7v/EdAY=;
        b=CR3xp0M3d/ehhoNT8Gjl02jVrPqTvPcd0Head1VEY94NSCDaQmAqbciYVp3k/LmfBm
         pKTpBqlh3mmnNCmKey6gk8uQYiN3UhNCMvliiriBHwmHgDPPuyWQT+Z/eYJ1xzH77IWu
         IGqdq9h5CdSyA7xU0W6Go3BT4pci9c8F2wqSov6ze7rkIX+ke0NtEhxVjCIfg5g2FE0I
         icmGKxGFeGIKZMz8vmG9pbPQsezPoWANqwar8HOZCZBjQdeJPDcFSTK2oYUmTrZ555RX
         7YJoctuerMAJdN53tJUFR5Ml448pbDWf+ZI4fab12dImKfZSFrSsH1vAUaM/Emq73ySj
         m3ng==
X-Gm-Message-State: AC+VfDxilqCArXNVmjiexc0mK51RNeiLcsjnY2YphUCTkZKdAQZxrDLy
	Sww8p/J/+R71k/YHho38154zmhYoldN4KvB56BfxAg==
X-Google-Smtp-Source: ACHHUZ5cTKm76dSNywJQ2VHrzkHYwMR0cH/VFLe5y/zVcI/U003H3Ncxyg9AU1/hmBd91iBOIh8KY1MkNZEmfqZShsA=
X-Received: by 2002:a17:907:2d12:b0:969:98eb:3fdd with SMTP id
 gs18-20020a1709072d1200b0096998eb3fddmr32859222ejc.3.1684336899240; Wed, 17
 May 2023 08:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230517100548.1431325-1-niko.mauno@vaisala.com>
In-Reply-To: <20230517100548.1431325-1-niko.mauno@vaisala.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 May 2023 05:21:27 -1000
Message-ID: <CAOSpxdYYTopMKiqESto5VsrS6yfYxU1dxRz9XvH3zXEAt-+mwA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc-runtime: Use static dummy libstdc++
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 15:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181493

This patch does not apply to current kirkstone HEAD:

Applying: gcc-runtime: Use static dummy libstdc++
Using index info to reconstruct a base tree...
M meta/recipes-devtools/gcc/gcc-runtime.inc
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-devtools/gcc/gcc-runtime.inc
CONFLICT (content): Merge conflict in meta/recipes-devtools/gcc/gcc-runtime=
.inc
error: Failed to merge in the changes.
Patch failed at 0001 gcc-runtime: Use static dummy libstdc++

Steve

On Wed, May 17, 2023 at 12:06=E2=80=AFAM Niko Mauno via lists.openembedded.=
org
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> some standalone targets e.g. riscv64-elf disable shared linking for
> baremetal ELF ABI in ld, therefore lets make it a static library
>
> (From OE-Core rev: 3c6219dfcbcbde314648ba8cc54a90b32ea1c952)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index 8074bf1025..d019b0790b 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -68,7 +68,8 @@ do_configure () {
>         # libstdc++ isn't built yet so CXX would error not able to find i=
t which breaks stdc++'s configure
>         # tests. Create a dummy empty lib for the purposes of configure.
>         mkdir -p ${WORKDIR}/dummylib
> -       ${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib=
/libstdc++.so
> +       ${CC} -x c /dev/null -c -o ${WORKDIR}/dummylib/dummylib.o
> +       ${AR} rcs ${WORKDIR}/dummylib/libstdc++.a ${WORKDIR}/dummylib/dum=
mylib.o
>         for d in libgcc ${RUNTIMETARGET}; do
>                 echo "Configuring $d"
>                 rm -rf ${B}/${TARGET_SYS}/$d/
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181484): https://lists.openembedded.org/g/openembedde=
d-core/message/181484
> Mute This Topic: https://lists.openembedded.org/mt/98944818/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


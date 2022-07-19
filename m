Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D45C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 15:42:20 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.42205.1658245330193325495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 08:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1yLvsSOa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f170.google.com with SMTP id x10so17387750ljj.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1G8Vz9XkA+ahqYR/rXh/+3qyYnmeriW7CwRHXzWeWo=;
        b=1yLvsSOaies/Uds3b5n8miiTebYRV7/6W/sYwB2tUG85x7ubrvJ7//Eh6xdXjX2hgT
         r/ZIusts8oSBWpqvWw31fXoySFSm6u9u2XSJB+3HDCkZdTxOMUQML/SQunfEWIB2tcC/
         Z6/37BSSCxaYjp0PFqpHHqj70nwQ/jtEMgxOHA4YnrT7xficvlVasvlQANyAexvK8Uv0
         /w1c2y8pp2zbXXYnW3NxL2VIXO5oW2YO7AY+xUZPoGnQDkPlcrOrOZJMgxH5xQM+626q
         14qef4HCHDMehBUl2m3aMRfUU3RMAHCv6YGJd3OsEcCzJuFXUnIzdEhD/e2svVnFrLik
         A1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1G8Vz9XkA+ahqYR/rXh/+3qyYnmeriW7CwRHXzWeWo=;
        b=bmdifeEwxkEzZIVH6OwjtPTIRQ1o9YlhTdCljYVIJTol6RPjPJiqZeVmKmfDwZhJ+H
         YbzTtEJxNNs3oKvi5dDuytVscAujsqiJ8r+IzYxCMQeQvnw2QXM6ouBKqg8X8nTiGW5/
         YF85TRFOPffFP9GRvTUTxs9fZ5D4I2VASq8ag1pi7P3BDqPmKcsl+bbUE7b5lKE+2Rd0
         VfbGzKBYsEc4yUCkwX+UUWNSO2NAK+q10wJA/Z2HRAE3oVT7SqeIN9qhdm/zufp4Gdnz
         x4OSb5gOVp5jAMEO2dMtobkltVkO4ylqaWMxRDLbeRAa0MAW8cx1ClXUy4Tj5whbzELa
         MLLw==
X-Gm-Message-State: AJIora89MsU9qaJxjrLKOFfMaXr1mWKAUu9v90kw5RcblT5otzD3Zigt
	KW0Z15vVdEmMU8GhgORJmQF43ryt96JYg5wUoXleWw==
X-Google-Smtp-Source: 
 AGRyM1vEi3Mrw4DJ5c/B6rmFReDD/AAEU35EjRL9oaNfrhvbGH+eSinN1jOwvQusofwHL9W/3xjOmniPwMKfbNfDl90=
X-Received: by 2002:a2e:a595:0:b0:25d:973b:ca54 with SMTP id
 m21-20020a2ea595000000b0025d973bca54mr12815854ljp.316.1658245327916; Tue, 19
 Jul 2022 08:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220719030023.2456608-1-raj.khem@gmail.com>
In-Reply-To: <20220719030023.2456608-1-raj.khem@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 19 Jul 2022 11:41:55 -0400
Message-ID: 
 <CAPoiz9xnyH7JZ+N08FTWMHkcKhfK=Z+tk-cmOnBsSSB5kM=ZJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-runtime: Pass -nostartfiles when building
 dummy libstdc++.so
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 15:42:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168284

On Mon, Jul 18, 2022 at 11:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is a dummy shared object therefore reduce dependencies further by
> not requiring the C startup files, we wont use this shared library for
> anything useful anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

This resolved the build break I was seeing in zephyr of
 /builder/meta-arm/build/tmp/work/cortexm0-poky-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-poky-eabi/../../libexec/arm-poky-eabi/gcc/arm-poky-eabi/12.1.0/ld:
cannot find crt0.o: No such file or directory

Thanks for getting this out so quickly Khem!


>  meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 5d74e4494d1..3e1c799ba13 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -68,8 +68,7 @@ do_configure () {
>         # libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
>         # tests. Create a dummy empty lib for the purposes of configure.
>         mkdir -p ${WORKDIR}/dummylib
> -       touch ${WORKDIR}/dummylib/dummylib.c
> -       ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
> +       ${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
>         for d in libgcc ${RUNTIMETARGET}; do
>                 echo "Configuring $d"
>                 rm -rf ${B}/${TARGET_SYS}/$d/
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168267): https://lists.openembedded.org/g/openembedded-core/message/168267
> Mute This Topic: https://lists.openembedded.org/mt/92475659/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>


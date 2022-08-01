Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A71C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:31:49 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.25327.1659364301159631098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lROtCVC1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f176.google.com with SMTP id bx38so2647884ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HVZA4vO8K1iDCwH9o9EkDKiozl/9W/No/tL2e87/0xc=;
        b=lROtCVC1UDhTZKG6v4ixT3sCQOTXoWJZNGmjCVXrQHztX0iVpIFr/xrv8jukIORyJc
         42dTKWRRmPSmPhAqHg09hepBAJALfh9DLspyNAtg/htAvb8EasAfvAY6E9oZn7XzYmQ9
         XqfbO60gJmSmSUC32/7vC8pzxXU8lVEpv+ForvUjyG8P3dtjIoPfS/jXAm102k36fgc7
         vmg5hRnTXK9oZI0M9c9HpFfd+TCFkcSQtNtdj10eIix3+XkSF1a8QixUpd3k+rIB/ee6
         pHA4205Ngm2XrCGL4/QQj7+2rUWZKD1bRxUq/C71gJY5P5a+tcRF4KbLvRiGpHsLI+58
         mw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HVZA4vO8K1iDCwH9o9EkDKiozl/9W/No/tL2e87/0xc=;
        b=A/oAkbDBYFTo+Ix6sj1her4a2i+2hMWNnNmwpH//euMlMm3YC32ae729x8vhcCZNCp
         TSnYQcoPWHbhe9yj5aP45KVEPQy6T/i7GSS5a8agjsBw9GP834IRBZspWzt4Gi6X0aqu
         Qhw/Pwaw55PoOTCiiS7P0ol4cd4+77gfBXX+1fUjNnahsRptQqb97HanRPentayLW7Kl
         +2fq+r99xCWNbmlq+hodYCA8/4qP0OA62o8hzIayvDt4JSbck+sfr0Tl6roAxRrdY0q7
         +yya+f6I5Hw/K40QlmK5Jm1xm6bxP09H3Q6QWwJJRTpR+l/HIJt2GClFPapvi8Baxei/
         WHaw==
X-Gm-Message-State: AJIora9z7bVvhRCbxGCxtWy7Pwl3r4HhyMrysZg3GITI0XGKq+myv5Wm
	mCzdnBYVZY/uptyHuK7IE36UPoYeT4tqjreQ8cm9Y3Jt+DA=
X-Google-Smtp-Source: 
 AGRyM1s6T+xCzsVxyV7dY3wEqdrOgws3wgvX73qGhqqd0hGbuX4WYtdPs8EWBW6fjCWdukLwYsWCOMr2lhLFKjruxgA=
X-Received: by 2002:a2e:83c6:0:b0:25a:d2c4:76c8 with SMTP id
 s6-20020a2e83c6000000b0025ad2c476c8mr4924816ljh.336.1659364299513; Mon, 01
 Aug 2022 07:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658882276.git.steve@sakoman.com>
 <2bc86c029fb82ae572f6a89407ccfe332972568c.1658882276.git.steve@sakoman.com>
In-Reply-To: 
 <2bc86c029fb82ae572f6a89407ccfe332972568c.1658882276.git.steve@sakoman.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 1 Aug 2022 10:31:27 -0400
Message-ID: 
 <CAPoiz9wzqLOoeYBmKzeoM_4DORJCR_VPFRj110yq3U60jbqdow@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 15/15] gcc-runtime: Pass -nostartfiles when
 building dummy libstdc++.so
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 14:31:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168750

Can we get this patch in ASAP?  meta-zephyr (and layers that use it)
have been broken for weeks now in kirkstone, and I can confirm that
this patch fixes the issue.

Thanks,
Jon

On Tue, Jul 26, 2022 at 8:41 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> This is a dummy shared object therefore reduce dependencies further by
> not requiring the C startup files, we wont use this shared library for
> anything useful anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index c85b5888d4..8074bf1025 100644
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
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168538): https://lists.openembedded.org/g/openembedded-core/message/168538
> Mute This Topic: https://lists.openembedded.org/mt/92640672/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>


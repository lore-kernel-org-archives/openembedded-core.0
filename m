Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B493C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:38:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.25568.1659364725032215743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LAKhtWD0;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id z22so14010484edd.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9BfDcVzLYRoxBjozIMUNe4jWSS22cEmYjdwQgPS3V1Q=;
        b=LAKhtWD0Kxvgtz2U82Fe6rgWqVmLOaJjG9fg9BYLvO1oCMZKpNcoMIz44AIFfxs2FB
         T3DTULwA1BuoDLuWPvddrvf6q0TOYXVz6s4qtaZ5IW4wLvfjnaL9bDD5XtmRDco8iupy
         MehPT7oRi8QNJcCLQZFX8o9y04KHRv63vDXST85ThkpJEzbHhzAFRYNQ7nQgTZUfxV0T
         WVii3ciILIwKGdzWjXYS18fEKXS2N8VLNO6ELl6MxpnmqUh3Luui4lxqX5kH2SZEQiBD
         phj0hOGPwK0/6b+qNkgsYmRb2mIDlgCPzFFukxqRPUhI1BAUSgl2ngm6RsVWMbyIgVZo
         FPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9BfDcVzLYRoxBjozIMUNe4jWSS22cEmYjdwQgPS3V1Q=;
        b=V2U1OcKxHLXJ2SZZ9kdg1cSCIe7mi2qOLUQ57mw9Q7xrfEzgaGCbeeE/WVh351H3T7
         p64xBM1SVT6VKojYbYdyj6KlY3tV8+TFePeTaz3hQuE0X12gv3vvURFS8hMeyrHGSj2N
         5D7Vrs7JIt2FNNe6z77V8tdNNI0xPlgLSfwPZPgMyXZ1qZgZAxFz9isTBtkjYVE6Yud8
         NIPvjyBzpUXeMTOxBqv6mBz/97Ntf9VHhV7tkTrFPvdHmYn0Y8NrVasOaoC/k9nqDY5q
         6KR64NHm82VWZ+oEM0KPmwjykBbhlM7ZTYbwjmPa+/uCqpHpcTPioq8QWtgmbQH2wsHk
         4JEw==
X-Gm-Message-State: AJIora9SZTerCXjz63MeBGKcGodyfi56lYfZSlUcS0Bj0Psiw34e9mLw
	5DKzvxsvzjwx8Q9xxYzGGYiuJlOnPjKq4vVZwWib0w==
X-Google-Smtp-Source: 
 AGRyM1saGOEzTLSlOvZbs8OSzNHypKW2Tn/RaO/u0OUgZXzrSNYbQV+IOaiD0kRVKDaz5eiHxARDSh+F+HwWNtNcSkg=
X-Received: by 2002:aa7:cd84:0:b0:43c:532b:65e9 with SMTP id
 x4-20020aa7cd84000000b0043c532b65e9mr16874968edv.330.1659364723449; Mon, 01
 Aug 2022 07:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658882276.git.steve@sakoman.com>
 <2bc86c029fb82ae572f6a89407ccfe332972568c.1658882276.git.steve@sakoman.com>
 <CAPoiz9wzqLOoeYBmKzeoM_4DORJCR_VPFRj110yq3U60jbqdow@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9wzqLOoeYBmKzeoM_4DORJCR_VPFRj110yq3U60jbqdow@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 1 Aug 2022 04:38:32 -1000
Message-ID: 
 <CAOSpxdbGF=9Y8D4U516y4QS1ubuX9c+gJ_p=MsUsoAR-xdYv6A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 15/15] gcc-runtime: Pass -nostartfiles when
 building dummy libstdc++.so
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 14:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168751

On Mon, Aug 1, 2022 at 4:31 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Can we get this patch in ASAP?  meta-zephyr (and layers that use it)
> have been broken for weeks now in kirkstone, and I can confirm that
> this patch fixes the issue.

Pull request for this series was sent last Thursday.  IIRC Richard was
out of the office over the extended weekend, so perhaps he will get to
it today.

Steve

> On Tue, Jul 26, 2022 at 8:41 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > This is a dummy shared object therefore reduce dependencies further by
> > not requiring the C startup files, we wont use this shared library for
> > anything useful anyway
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index c85b5888d4..8074bf1025 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -68,8 +68,7 @@ do_configure () {
> >         # libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
> >         # tests. Create a dummy empty lib for the purposes of configure.
> >         mkdir -p ${WORKDIR}/dummylib
> > -       touch ${WORKDIR}/dummylib/dummylib.c
> > -       ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
> > +       ${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
> >         for d in libgcc ${RUNTIMETARGET}; do
> >                 echo "Configuring $d"
> >                 rm -rf ${B}/${TARGET_SYS}/$d/
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#168538): https://lists.openembedded.org/g/openembedded-core/message/168538
> > Mute This Topic: https://lists.openembedded.org/mt/92640672/3616920
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >


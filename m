Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE59AC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 09:31:42 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.24718.1646645492437302250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A1k6f3HC;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id 127so4410274vsd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lnsreGRibupy8Q4pv1RX0y8F04GvFX+IJBkENunbvqg=;
        b=A1k6f3HC/Ka4TXdQtlyz4JzggMVt2O7cBMTh0n4iH/ZM+FmLZTYGiF1FDKGFnVC5SS
         V5B3pB1XTjF1+X4XzrzF60Hl7ycWj/Q5OM9UHMFzCKtVCEzrkLDk+QQA+ZGomogjP3rk
         reEvJ1DdZu9SNyp6UMjY0pHAgw/dcFZyV6qI1eAYJfYgYr2EXXwUBonQGmshUXBvKjL2
         +DyQtp+JLEUIYEG3jXoC9f7gcZQG0/iNboury2NJ/ePgAuXGq6j2JOHji81aWXsVLwm3
         dyxjvs3tc7WP4YbR0IC+pbN5V+zBM8QLerc3hvh+qsx1797aiBkIaoVBEdI8oNcERcb7
         jp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lnsreGRibupy8Q4pv1RX0y8F04GvFX+IJBkENunbvqg=;
        b=0BOrm9+w7EMjFYyu2F8s9XTlo0sH+KF+sBZGdj+3wUUV1Lu76fYLeLvNV7eZbXFApu
         CFyTQ1+Yhky4Fsb20dv3rsh4jSr9vlAb+xl89bwNDlqy0+L677qzTpb8Ps0SnmEtPzMZ
         hf9+Kha83oPrdbMHaI8NvM7yKJAKVfUnE1jRw2hn9NOpmcy4VLkEb5f5Fo8UQTTj/llM
         Duk0liL06Yo2et2ImUpmhfOGaJdwBk8uVuwlYeFpctkOsUuhHarbIZQXotQt1jsgYUYg
         UI/6opp9nYWa0JWKT9okbGA0zN26TbwB1Xqi3P+sZ9ehxWnWnc3GbiGPiZrhZkA+me+v
         B9CQ==
X-Gm-Message-State: AOAM530GNZRkWimvJBIXC5FVLt2ie4ws8vWhYKAOWfCtLS0RrTiqdCii
	Y3nRZWTJg0EfW1tNTWsBgLwVuSL0AE+6jfyudBA=
X-Google-Smtp-Source: 
 ABdhPJyjAqqQ8lsCdJ2CNNRUoXn1NV06sSqiEraSNNqy75AauClYSJWUxRFCp5GBW0sQTGIA7LJbsx731tMioMbm8gM=
X-Received: by 2002:a05:6102:827:b0:31e:bdcf:733e with SMTP id
 k7-20020a056102082700b0031ebdcf733emr3492659vsb.73.1646645491554; Mon, 07 Mar
 2022 01:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20220307080750.489418-1-crg7475@mailbox.org>
 <16DA0F4A680FB7A0.15718@lists.openembedded.org>
In-Reply-To: <16DA0F4A680FB7A0.15718@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Mar 2022 10:31:19 +0100
Message-ID: 
 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional for
 native builds
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Carlos Rafael Giani <crg7475@mailbox.org>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 09:31:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162802

Also, is this going to cause non-deterministic builds?

Alex

On Mon, 7 Mar 2022 at 10:30, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> This needs to be better explained, particularly why the patch is
> inappropriate for upstream submission.
>
> Alex
>
> On Mon, 7 Mar 2022 at 09:08, Carlos Rafael Giani via
> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
> wrote:
> >
> > Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> > ---
> >  ...ependency-optional-for-native-libsdl.patch | 37 +++++++++++++++++++
> >  .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> >
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> > new file mode 100644
> > index 0000000000..00f3486194
> > --- /dev/null
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> > @@ -0,0 +1,37 @@
> > +From 78078bcf00f0ad13d93b1dc525ee0a666c30f246 Mon Sep 17 00:00:00 2001
> > +From: Carlos Rafael Giani <crg7475@mailbox.org>
> > +Date: Mon, 7 Mar 2022 05:09:08 +0100
> > +Subject: [PATCH] Make libunwind dependency optional for native libsdl2 OE
> > + build
> > +
> > +This is a workaround for this build error:
> > +
> > +| -- Checking for one of the modules 'libunwind'
> > +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> > +|   None of the required 'libunwind' found
> > +| Call Stack (most recent call first):
> > +|   CMakeLists.txt:1367 (pkg_search_module)
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 64f9fbf..eda3112 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1364,7 +1364,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROID AND NOT RISCOS AND NOT HAIKU)
> > +
> > +       if(HAVE_LIBUNWIND_H)
> > +         # We've already found the header, so REQUIRE the lib to be present
> > +-        pkg_search_module(UNWIND REQUIRED libunwind)
> > ++        pkg_search_module(UNWIND libunwind)
> > +         pkg_search_module(UNWIND_GENERIC libunwind-generic)
> > +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
> > +       endif()
> > +--
> > +2.32.0
> > +
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> > index 90724ab8b7..d8211165d4 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> > @@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> >             file://optional-libunwind-generic.patch \
> >             file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
> >             "
> > +SRC_URI:append:class-native = " file://0001-Make-libunwind-dependency-optional-for-native-libsdl.patch "
> >
> >  S = "${WORKDIR}/SDL2-${PV}"
> >
> > --
> > 2.32.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162801): https://lists.openembedded.org/g/openembedded-core/message/162801
> Mute This Topic: https://lists.openembedded.org/mt/89607589/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


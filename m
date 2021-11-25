Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEF2C4332F
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 16:07:45 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web09.13742.1637856464314524404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 08:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ab7zANPX;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 131so13032273ybc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xC+mduuXOzV6E0vpq+OyVL6PzARUDv33g/09EfACJ2U=;
        b=Ab7zANPXKB14ZgsH7fVBoS3sfbxsfKpX9omnmgouw9ggfZSCCWXl+t2uwFQQm3YYgS
         EwoOO1R2QXGsToeqhYoB7nB7Zrd8nVQtWeTyYXVqhYc5CuyX3w4AojQaURajuqm1EFmq
         aeVbdIaXpjFPojAazAhspiE9h1lgA5flO+2gegzyPmxn3AiJeSfLjNMHrOQW+LFJaLg+
         J4kXeRfBfCs4TiEeWGJ8J6Y+MUKinVfXZoUMxZPtHHVrxTBkDunChtf2TwH2FI7s1C8J
         Wo/lGDY3Y/SoKuDptbwgcvg/RHwkDYRdOrQe0v2DloOJoRitWXY3PMsF98Rf92b84rgI
         +LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xC+mduuXOzV6E0vpq+OyVL6PzARUDv33g/09EfACJ2U=;
        b=O5IkuuBOFA2u4N5YtjLtQApC3Fjn2Wap/FSmgG+yqhdjaYSBtThYE15llEdAmGgyuf
         2VffquUjfmJFPKGtr5yLiyK4u/sUSDtdKlpEqWoFFW6ejs01WpuHtOWG7qD/F4Vkjtqz
         UZny7/83jhM1ZV0Vaw8+UsiDVIz5EMPyGR5QzDoO2+BHUD2qJ7d16MW7Ry3nJWwjnVCW
         MBEDUOfWdJoIgD51RhqRUNSFU1e/4NY+IHLu9iaIxBC5JlIc1Uz2OVF9R22mBnxMaLED
         FSnl52J8L4r+6aBmYQ9r39ubHL/mmI/kHUE1myH7K0mXwRI3W4BeY5GL7pyheRqoNZeq
         EdHA==
X-Gm-Message-State: AOAM530BDEEsDhfmGai29rS11zElF3MCAWPwHC1+FOfDdYJpjkDKmASa
	LhsolA/VVNpEb1IdwRFnwHkAMmYg04MX1QVDvDE=
X-Google-Smtp-Source: 
 ABdhPJzvWHX0pysB3Hz0rMV/07f1NrC26gPgsOOKNr/qKPtx5SbYzaWlvFZoWsBtVzbbKbGMqROv+FwSPT+c47SIgV4=
X-Received: by 2002:a25:903:: with SMTP id 3mr7608869ybj.378.1637856463488;
 Thu, 25 Nov 2021 08:07:43 -0800 (PST)
MIME-Version: 1.0
References: <1617235191-37594-1-git-send-email-denis@denix.org>
 <CAP71WjwizBME7VsK+Mpy=mysN_=ViykHhpJ0owgAb_2wH=cnXA@mail.gmail.com>
 <CADkTA4Op48T7RcVG2Hyqt21=mrY7AVWmLgQJocgEvpK=1kqZnQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Op48T7RcVG2Hyqt21=mrY7AVWmLgQJocgEvpK=1kqZnQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Thu, 25 Nov 2021 06:07:32 -1000
Message-ID: 
 <CAGDS+nknqMx5hSA6CXJ2pydnxrqt9Az8C-mS9=tOEvr_9xdg3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: pass CROSS_COMPILE to
 configure and build
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Denys Dmytriyenko <denis@denix.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Nishanth Menon <nm@ti.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 16:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158786

On Thu, Nov 25, 2021 at 5:42 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Nov 25, 2021 at 10:22 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > Bruce, Steve,
> >
>
> The backport is also fine with me!

OK, will do!

Steve

>
> Bruce
>
> >
> > On Thu, Apr 1, 2021 at 2:00 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> Fixes:
> >> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
> >> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
> >> |   LDS     arch/arm64/kernel/vdso/vdso.lds
> >> |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> >> |   AS      arch/arm64/kernel/vdso/note.o
> >> |   AS      arch/arm64/kernel/vdso/sigreturn.o
> >> |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> >> |   VDSOSYM include/generated/vdso-offsets.h
> >> |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> >> | objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
> >> | /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
> >
> >
> > One of our meta-qcom users hit this issue with dunfell
> > https://github.com/ndechesne/meta-qcom/issues/394
> >
> > Backporting this patch to dunfell seems the right thing to do. The patch applies cleanly and it fixes the problem for me.
> >
> > e.g.
> > ddad8183490c (make-mod-scripts: pass CROSS_COMPILE to configure and build)
> >
> > Feel free to add
> > Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >
> >>
> >> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> Cc: Nishanth Menon <nm@ti.com>
> >> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> >> ---
> >>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> index 92ffa47..b2b50b9 100644
> >> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
> >>  DEPENDS += "gmp-native"
> >>
> >>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> >> -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
> >> +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
> >>
> >>  # Build some host tools under work-shared.  CC, LD, and AR are probably
> >>  # not used, but this is the historical way of invoking "make scripts".
> >> --
> >> 2.7.4
> >>
> >>
> >>
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158785): https://lists.openembedded.org/g/openembedded-core/message/158785
> Mute This Topic: https://lists.openembedded.org/mt/81764668/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


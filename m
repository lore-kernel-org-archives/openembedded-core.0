Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F045C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:39:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.27441.1702571957604310359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVbH4cCY;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so89181825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571956; x=1703176756; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXt6/jJ0Ap8Jo+558k67HYtmjTavj9E84C0NupF4yt8=;
        b=aVbH4cCYiGj8pwHEYtskwLqasqCzdieIBD/TygCV1fZK6vr0kKx7uubahcqBYjdkg3
         z7CDBXWsrbqxuYmeuSHZ5lrGsWMTMWzhufFn/OXpZ1xrsddTbrza2/2Iu2n1EQF14bxO
         Hshi95sVXcT1xM3MMArGLgHADz4awJqkOyJzXWRwrebUfpRcB7YJA0LJOF8c8DpbggWE
         qdgnfClKKsDNQ0Zfe5bBIFUk+OKc8gZFKi2RAPoPPWza3WiDNoSxDCbJNcbqdA50+0Uh
         dnT8b028cUkU6ECYK+vCIokhngIcy/Tc/n7pIjVnrxtRyAKZuRrIux66E9OS66pL/asd
         kjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571956; x=1703176756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXt6/jJ0Ap8Jo+558k67HYtmjTavj9E84C0NupF4yt8=;
        b=Ijgy6BPa7IFvfMYaYAf/g57WumOq2V7c7YRTVQTAxYJTEqipyILrQmLeIJek0Tcc28
         zCSpl+Ys99v2a2Gx57wsyA37500WhDoS2Zv7ZZRbWFcupAF50cA4EK3hKODshSjIbFhN
         sS3kCX79B2jxhGUWVgkySZiZJ2RQRbXZuKTYLoKKWm6CcPHsybmMUv4YPlLF64tcI79/
         3iSD+TysVH4I0BjazPrMzPlh1LONZp19IieTWOp2P+T7g5xZ600QTlkCqY5kaQLLYhbb
         gMyutH6K0nGhDV+sE0e/wN34ma7LGzjjs/Ky2i/wZg2/1+/Pt+I/il4l2fBn18ip3O9f
         /SSw==
X-Gm-Message-State: AOJu0Yyibxm1u2DsWW7IWr6gZHFM6u7ALu+9hFp0ycHJvDVlcZWyD84c
	IhzB5fxKynFZd89S6OuUrQI=
X-Google-Smtp-Source: AGHT+IG0yVBDD36j1m14PcCIwSIPIcsLx1frRUccWBH5sA4PgVGttNY0uupOm+HYCyNsQBU4lm9Tug==
X-Received: by 2002:a05:600c:54d1:b0:40c:263c:636d with SMTP id iw17-20020a05600c54d100b0040c263c636dmr5840209wmb.124.1702571955658;
        Thu, 14 Dec 2023 08:39:15 -0800 (PST)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id x15-20020adfec0f000000b00336468b986esm2352839wrn.96.2023.12.14.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:39:15 -0800 (PST)
Date: Thu, 14 Dec 2023 17:39:14 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][kirkstone 7/8] kernel-fitImage: Strip path component
 from dtb
Message-ID: <ZXsvsjLMoEnCJy0q@toolbox>
References: <cover.1701299008.git.steve@sakoman.com>
 <9a42349a176ca4d7a1bfab3425a0821dbcbd9368.1701299008.git.steve@sakoman.com>
 <CAEHkU3V=tK-rqKEWkTrk441uDkRM5quNLO2ck824ExY-di5UUQ@mail.gmail.com>
 <CAOSpxda_MYNSBs3D1n=Ddz601uC3d_q2Sj12NUsXJ6Q4HXCecQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOSpxda_MYNSBs3D1n=Ddz601uC3d_q2Sj12NUsXJ6Q4HXCecQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192392

On Thu, Dec 14, 2023 at 03:56:13AM -1000, Steve Sakoman wrote:
> On Thu, Dec 14, 2023 at 12:42 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > On Thu, Nov 30, 2023 at 12:05 AM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > From: Ninad Palsule <ninad@linux.ibm.com>
> > >
> > > Machines that have added subdirectires to the KERNEL_DEVICETREE
> > > recently, such as arm32 boards that were moved under subdirectories in
> > > Linux 6.5, will have that subdirectory in the node name of the FIT. This
> > > breaks existing systems that select a configuration in u-boot by it's
> > > name.
> > >
> > > Strip off the directory component from the device tree to preserve
> > > compatibility.
> >
> > This now breaks each arm64 machine (and likely mips & riscv) as they did
> > have the vendor subdirectories since (nearly) ever and expect those in the
> > fitimage.
> >
> > Breaking those existing machines / kernel combination in order to have a
> > smooth transition for arm32 machines which bring a 6.5 kernel to kirkstone
> > seems wrong to me.
> >
> > I think we should revert the backport to kirkstone. If someone builds a 6.5
> > or later kernel in kirkstone for an arm32 based machine one could cope
> > with the change e.g. in the kernel recipe which provides that 6.5 kernel.
> >
> > Any comments? Thanks.
> >
> > Sorry that I didn't notice the change on the mailing list before it got applied.
> 
> Since this is causing breakage I will revert it prior to the upcoming
> kirkstone release build.
> 
> Steve

Thanks Steve. Much appreciated.
Max

> 
> > > (From OE-Core rev: 941ba1a132bafa9c9be855fb91fec96d8b06299f)
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de> # backport to kirkstone
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/classes/kernel-fitimage.bbclass | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> > > index 27e17db951..194d825b0e 100644
> > > --- a/meta/classes/kernel-fitimage.bbclass
> > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > @@ -542,6 +542,11 @@ fitimage_assemble() {
> > >                                 DTB_PATH="arch/${ARCH}/boot/$DTB"
> > >                         fi
> > >
> > > +                       # Strip off the path component from the filename
> > > +                       if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
> > > +                               DTB=`basename $DTB`
> > > +                       fi
> > > +
> > >                         DTB=$(echo "$DTB" | tr '/' '_')
> > >
> > >                         # Skip DTB if we've picked it up previously
> > > --
> > > 2.34.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#191471): https://lists.openembedded.org/g/openembedded-core/message/191471
> > > Mute This Topic: https://lists.openembedded.org/mt/102883133/3617484
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [max.oss.09@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> 


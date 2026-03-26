Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9529510AB828
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:50:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53462.1774546500840780768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kfd1qqSC;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fb112c09so12752805e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546499; x=1775151299; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPj5PNVdmoGWumvvniPiY1Hy0FB4jcOiWFINw08Gcks=;
        b=Kfd1qqSCpVjJybv9/vEZbAVWUJnH86QEjl4vI9ACVJTcPhJBs6nuQqTR+y6ogy7Bmw
         q6Jkqw+yaHF/b4nElf8XkgnHX/PSPblhlJdGlg8hki2lPi/jybf7epbIMUFGxvc1n1Hk
         o9MlhCt1gAnnWan0NWm+qaFZxzyJbqLDvvP4RikpY6LZ9DkHett73SsVwGDBqc9hyywR
         C7IeotABk5i8wr6wYNHOOJKTDkqpP7OKirSnKc46WRKpXE+sYEtRYAWHLWYmtnZqn0p6
         B8HFGbgJ+1UyU63vCS3bQPE12h72JzqHOC8jl56vQat6hu1xkll493rLMYzl3vqGv1Bl
         zUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546499; x=1775151299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPj5PNVdmoGWumvvniPiY1Hy0FB4jcOiWFINw08Gcks=;
        b=bEmToj61eolwKrI3ToCJi2C1jQdgYygCufjMS+xBTWa92yXtjsoTehmLbfzQVIyISR
         /Kpar814JAkKKhbODkoMQLPssoqXwH+kdf1RIbsJmt2RPE+H7I4rFrunCnBK5fPS4ILK
         HW4AD6hoB5+WMqDyDkaCIGfs8jW98z540wKRsdxWFhZk9GKe7y4UH3v8op5ukRqt44FZ
         nO4QFdBUO00517sb0G4w98w82uC7a/Lp6FVJHSJkZEsF0gPVFtgnGszBiVIkxY7ye9UJ
         L7xgVeF2awqaX4tAS7dwoXpAzEwLNFQkk8jKYWS8KVzmbi6X03TmxHmugackXfd3MJ2V
         f4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUbx+owTa0BrbKYJ6sA9C7bzWhNFlDk2PvAryBZwUUuVM4vyQXdK6ZsqwjZs7aiUxADeprb9ca+9gvG4++89pDnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDzjamoZDjpFBMjBosoPfHckVaVGLxK6JixTiKRsTP7xCW5Sqy
	jTImlwG6yP4BCxgN92W3u62/183iWc3gY/JuueVSZvRxmBHVWq4gkxpz
X-Gm-Gg: ATEYQzydcnLCzXorbEKy/fTEuW/TqWkri7CvxlmgpwBN3J3nM8DqNoHkLOVHo2BReKd
	QGqsgsKfjhagALt+SaeXAfIMKWZ/1ScQyIy/XhRoyUEZoZqkcNKuUpovaqUjRl0kyP3FMZwYZIl
	GmfT1pOJKAPZ58IebPA74O1yN6A37R0mJGf/RvMl+fpYIOJpf1aYUmh7Gr9nVFjZoq75BJRFbjd
	p2uUI54lA29iMtEOpQAn1f/m+fd9/CWLpHkiJGTgmDpUzT1Z+gHurtgKTav8dVM0MrrS/w1R2E4
	fpsNm5U+ikREcgu/ELfaTsQulunReEqaiBUNhgzutr3nPJPLXlfm1+/wNg0tOp4huQhiuEJQ2x5
	/CQRJZpLf8Zjoj/d2ISuJsHff73sZVMg1aQzf6Kw4XzaI/0uXeMahm+sYaAplyw8G2xNf8ZASBH
	oG7Bs+7UK25/cDX5+gAfWBlm1h4EAYvTcA4Xg041qa/czYQxbbvGkj3mptrR6pNHo13rp/vQcR2
	uyjN+2k+3IvU1+RWJe6pcPk4BVNlOAG88Fyow==
X-Received: by 2002:a05:600c:45d4:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-48715fd63a9mr123120635e9.12.1774546498903;
        Thu, 26 Mar 2026 10:34:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm10011945f8f.13.2026.03.26.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:34:57 -0700 (PDT)
Date: Thu, 26 Mar 2026 18:34:55 +0100
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 7/7] mesa: depend on mesa-tools-native for less expensive libclc dependency
Message-ID: <xhdr7cyzvd3p7yza76rho3louljeajm2ffo34ev5vfbzcqxixx@ybyvxpylke7a>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
 <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
 <yj4junqgkdaddl3upgyn7pzeqvlbr2q4a7zl6llrv2kzlbznlr@62bryfzytptx>
 <1a009ba8-4538-4dd5-a61e-5656852f56b0@cherry.de>
 <5594e882-42af-48fd-81f5-39df6b800eac@cherry.de>
MIME-Version: 1.0
In-Reply-To: <5594e882-42af-48fd-81f5-39df6b800eac@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234053

Hi Quentin,

On Thu, Mar 26, 2026 at 12:10:07PM +0100, Quentin Schulz wrote:
> Hi Ernest,
> 
> On 3/20/26 4:57 PM, Quentin Schulz via lists.openembedded.org wrote:
> > Hi Ernest,
> > 
> > On 3/20/26 4:26 PM, Ernest Van Hoecke wrote:
> > > Hi Quentin,
> > > 
> > > Recently our do_configure task of mesa started failing with the
> > > following error:
> > > 
> > > | Program pco_clc found: NO
> > > |
> > > |
> > > ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17:
> > > ERROR: Program 'pco_clc' not found or not executable
> > > |
> > > | A full log can be found at
> > > /var/home/vhe/build/tdxref/master-extint/
> > > build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/build/meson-logs/meson-
> > > log.txt
> > > |
> > > | Last 10 lines of meson-log.txt:
> > > | int i;
> > > |
> > > | Cached compiler stdout:
> > > |
> > > | Cached compiler stderr:
> > > |
> > > | Compiler for C supports arguments -Werror=pointer-arith: YES (cached)
> > > | Program pco_clc found: NO
> > > |
> > > |
> > > ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17:
> > > ERROR: Program 'pco_clc' not found or not executable
> > > |
> > > | ERROR: meson setup failed
> > > | WARNING: /var/home/vhe/build/tdxref/master-extint/build/tmp/work/
> > > aarch64-tdx-linux/mesa/26.0.1/temp/run.do_configure.144042:173 exit
> > > 1 from 'exit 1'
> > > 
> > > Reverting this patch fixes the issue, but it does not seem to be the
> > > commit that introduced the problem. It only started later, presumably
> > > something changed in pulling in libclc or a similar issue.
> > > 
> > > I can bisect it more later but already wanted to ask if you or someone
> > > else had any ideas. Thanks!
> > > 
> > 
> > I suspect you need
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/
> > recipes-graphics/mesa/mesa-tools-native.bb
> > index 50d2f5cbb0..0fff6ef1dd 100644
> > --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> > @@ -3,7 +3,7 @@ inherit_defer native
> > 
> >   SUMMARY += " (tools only)"
> > 
> > -PACKAGECONFIG = "tools asahi panfrost"
> > +PACKAGECONFIG = "tools asahi imagination panfrost"
> >   # llvm required for libclc
> >   PACKAGECONFIG += "gallium-llvm"
> >   # Doesn't compile without wayland-scanner if PLATFORMS has wayland in,
> > and,
> > 
> > and possibly
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index 14dc7b6c51..44d3d17a52 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -137,7 +137,7 @@ VULKAN_DRIVERS .=
> > "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom',
> > ',broadcom', '', d)}"
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',
> > ',freedreno', '', d)}"
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio',
> > ',gfxstream', '', d)}"
> > -VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination',
> > ',imagination', '', d)}"
> > +VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination
> > libclc', ',imagination', '', d)}"
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc
> > gallium-llvm', ',intel', '', d)}"
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel
> > libclc', ',intel_hasvk', '', d)}"
> >   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost
> > libclc', ',panfrost', '', d)}"
> > 
> > 
> > It would help if you could provide the PACKAGECONFIG you're using and
> > ideally a minimal reproducer so we can look this up more in depth on our
> > side.
> > 
> 
> I've been able to reproduce and provide a patch for it, see https://lore.kernel.org/openembedded-core/20260326-mesa-libdrm-imagination-v1-2-fe018f03be6a@cherry.de/
> can you please confirm this works as expected? I only build tested it. A
> Tested-by (provided you have tested it :) ) as an answer to the patch would
> be most welcome, thanks!
> 
> Thanks for the report!
> Quentin
> 

Thanks a lot for your work here! Apologies for my late reply, I was
traveling for a few days and kept getting distracted by long build times
before figuring out the extra information you needed.

I checked out openembedded-core commit cf91b8b5d405
("meson: upgrade 1.10.1 -> 1.10.2") and applied your patch series on
top, and I can confirm that this fixes the build for me.

Sadly I'm hitting another unrelated build issue for more recent commits,
but I'll do my best to get a decent build running on the AM69 tomorrow
to provide the Tested-by tag on the new thread.

Thanks again and kind regards,
Ernest


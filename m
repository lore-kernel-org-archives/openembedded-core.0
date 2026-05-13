Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B4CCD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 11:46:00 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5525.1778672754304535144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 04:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NxRNRUNH;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95d04f205beso4205211241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 04:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778672753; cv=none;
        d=google.com; s=arc-20240605;
        b=EUIGbMrs/8WRcnw9FHSuv6Z4Md0cZv1Tmt3Blj+mDhw5k5+9CIpn+sCFD5iW4PBgA1
         qvxNGDgCg9AMi/yjcCfTXNJ4IK2ke9kGHBL2ludkMr24DnYic5G10hkcBoTe5WSL2ZL1
         F705M/z4Tp92V2BElgFqLKisatTJGRYaSLLZ7s7u09kBGUfTgSaTVpEQQfovlQp+vlGJ
         XF5PxrLX0HGRmGerTJKwHe3xMHdByaHQOKWPzQm911QKwqgx3rKpdhKfuLDBgDLdh3pz
         vcrYtfUrSI7uMskeWqBQjD+pPg5i3eCPZSUGt1ErUcWuIKLbtPW15t0eVepGFKYX3M3d
         2XwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bX4DJ31oFOg0LWXyes+OafDmczDzKL0DNET23TDWAs8=;
        fh=wjgXNgHsUnaYCF1Cfs/5GVyaN6Rzwz3g7GQrzs8sx2Y=;
        b=P9jQn6Z9rfStigF3GgUHDg7BCwqJMBdIp6HkSt5ToEiuk/P29/2qzXLWU+6NWZH9OC
         82aaVqqANkDzmjj9jJgHINnNOhwZS4UObnTn4do3FeQRpwbS/iPkuTnxVZR8BOD7hUK7
         uQC6G2UQqSeCUO7pVTK+vACWh/9CUCYOU27frj5TpQIAbufVCr27u7bAIjN+2mmUuCEA
         ahdvl/2oLvMpfibUrwwPL1SfUSQmox8pvOorGVz8y/ElI5nSbqahhUHbw0z1tiP6Djpr
         S80yDmBCz16xljbg3vn2Zdq33SI5I71kG3QJfsS8nx517TzUH7CHsTFCdHLeumL/VL8p
         AHWA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778672753; x=1779277553; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bX4DJ31oFOg0LWXyes+OafDmczDzKL0DNET23TDWAs8=;
        b=NxRNRUNHTEnblE7pKdBu+jydar/rpTKKe47obFQMvMETildIcUKwR1K3x+wtNjcr94
         gEbAbqoKc21Ds32xcy+u6XedEaQberTnJWLNmyL8HbSM/qaTbU7QeSGTHdOxHIQSp7fE
         6C/0ZAITqySp3TMSeIAG/jvZ2bSro9pMhyLB79OhOd19tssykW9pk7/BoEN6a+4WaEdJ
         CGRwPHYqxBcep/w0k1P3rxazeEuhxX5T0H0kh2hP/SiUC9WUJGcbejn39cyW9ZXOf1Fm
         b+JDOZ9Ck+roXqimG3TTBiFbLURZ+Y7Iex5xcZsmNUtVP9peeTihIFnr0DrnGikKojwr
         hnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672753; x=1779277553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX4DJ31oFOg0LWXyes+OafDmczDzKL0DNET23TDWAs8=;
        b=A0JkzQtCQzUiP/x7/JSnRmE8uJu/nBTT1l9FATyB/vGPq5uwlqtqMhZUyVwmatCbKW
         41OUOoXBn5ZEJ1T6tnkTpMyEfIT4rxF5II0edWAUHUsdmD7Ovrui7REFzeQUulb09yQ4
         7sHdqIwyWoFGf1tD89dyL4niXwJ8LTh2HdKAnfOTSf/OPpVWoyMQay6e6yzwUrkaFTmE
         OJa7TARGHZLdWYURqNMn7FRDQ2V4WllR12IYwv7qA4zT8MpK4bxleQWUOYL+anWU9Dyy
         kZchq1q5j8HibmqKDyQC0aCKd49U3OWse9qVCVPEKVIzNdSZBAjRrI1vVjS0sAIHBBtG
         WoLA==
X-Forwarded-Encrypted: i=1; AFNElJ8emQqZGgROXdkY4T8wdqpXF1gbFx1+FFBH/bR91cLTTdCFD0eT2jlOcwg6fSXfhmLHvCVNGYTVVpMqvXbmoakJsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjX8ZBvjEbRC2falOeXWuVkGKM5M7uIsu5R0B3q/Suk0SXdLGJ
	iJHuZLuhQ7clnocin3csYS1u2x1C6VrvHHG72P5/0vigsYeX6u6t25elU1XWuotHwk+X//YKHAO
	jmlBnkDuXgmiwP2t4aluzMx8cTIhiCYmb+pgR
X-Gm-Gg: Acq92OH44KfUBthG1Cj9OVxwaxR6ymJtbcF5tf8/71mQOj8mxFq2d6mkuUUiaRgoxfU
	0r+6LijseZoOCaleTTSLMy/+I7YC8iHQCBwuL9Xu8vAsu61Itx4U9u3PBiSo9rVAXqHe2wQQ+zg
	sZp7Jh62RqdhBvTo65pNmnmOfpP5ziCSEYNjRCWp6M++KvEfPj0mhPtx2CKj/ojQG4CIvnnjbLy
	R9vlvPdVfT816siLguGryZjz31rNN32zjJgyIAArFY3jcfHKaIWCnHIFk18qTDcKy10SiCXb+8S
	VJ+6qKXf5n+2ffnUvwm/0xdIrZpKovTl9uugjq465g==
X-Received: by 2002:a05:6102:6049:b0:5ff:f4ae:a154 with SMTP id
 ada2fe7eead31-637a7fb3953mr751279137.1.1778672753300; Wed, 13 May 2026
 04:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260511133450.50595-1-tarun@centricular.com> <20260513071155.1215141-1-tarun@centricular.com>
 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com> <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
In-Reply-To: <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 13:45:41 +0200
X-Gm-Features: AVHnY4J7EGdCVpfID6_PLCUzd75TKZizCaZugilq2n3vdBi7OEUoYO5yw_WjwAM
Message-ID: <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
To: Nirbheek Chauhan <nirbheek@centricular.com>
Cc: tarun@centricular.com, openembedded-core@lists.openembedded.org, 
	sebastian@centricular.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 11:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236964

On Wed, 13 May 2026 at 13:24, Nirbheek Chauhan <nirbheek@centricular.com> wrote:

> This is also why at least _these_ plugins should be in oe-core. They
> are at-par with core functionality in gst-plugins-{base,good,bad}, and
> provide functionality that is not available elsewhere, e.g. RTP AV1
> support or AC-4 audio parsing.

Hello Nirbheek,

thank you for the detailed explanation, I am now fully convinced and
no further justification is needed :) The remaining issues are
technical ones, e.g. how the recipe is written and what it is doing.

> > These all need to be split into their own recipes, or there should be
> > an explanation of why that isn't possible.
>
> It should be possible to split this recipe into N recipes one for each
> plugin, since these plugins are published individually to crates.io[4].
> Then we could make a call for which ones should be in oe-core and which
> should be in meta-oe. That affects the maintenance burden, though.

I meant something else: the items in this list:

SRC_URI = " \
+    git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=https;branch=0.15;name=default
\
+    git://github.com/gtk-rs/gtk4-rs;protocol=https;branch=0.11;name=gtk4-rs;destsuffix=gtk4-rs
\
+    git://github.com/gtk-rs/gtk-rs-core;protocol=https;branch=0.22;name=gtk-rs-core;destsuffix=gtk-rs-core
\
+    git://github.com/rust-av/ffv1.git;protocol=https;nobranch=1;name=ffv1;destsuffix=ffv1
\
+    git://github.com/rust-av/flavors;protocol=https;nobranch=1;name=flavors;destsuffix=flavors
\
+    git://gitlab.freedesktop.org/gstreamer/gstreamer-rs;protocol=https;branch=0.25;name=gstreamer-rs;destsuffix=gstreamer-rs
\
+"

all should be built with separate recipes. The plugins themselves
don't need separate recipes, but the resulting plugin binaries should
be put into separate target packages, same as the classic
base/good/bad/ugly plugins are. The recipe isn't doing that yet.

Alex


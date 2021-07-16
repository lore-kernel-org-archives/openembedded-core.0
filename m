Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.991.1626461150667307811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 11:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Q0XIqC5K;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id f17so13169575wrt.6
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROonaRFSNDCHlzG4qBFhoPqNuHJpPchoFLy6UgIjHcQ=;
        b=Q0XIqC5KVyygrFFCGUBiVxr0YBy2pIkfq2sl7npVHnr726RtIr6bkM/95UnB4pX4Yt
         6XHpNkTnUGe/s5cvXfKcZH7Y+Yq/obNePAlcLb4I/8YF9YEoYF9XXx8DICBkBWV8SJer
         27MmLtOJah3uawWqP57fTdozVI/AGRiQjaVnYkh4BdyO9wkVrosslLqsSm0FM8zo/Rdn
         F3roJb1Y3h+Tpwm8XVprM73qVG+RlI+Siw0QqbbLpbZducSP+xRMVu//cNRq6l46IeWn
         11LNFJFQNDXfyLH7Tulmx35JUnzJ1w0onkhmD3gJCranCVyn/arUKZB1QQSpLHs2lttv
         wT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROonaRFSNDCHlzG4qBFhoPqNuHJpPchoFLy6UgIjHcQ=;
        b=ZR4YIJA2Gq4npn/G8yN5dXoWEXBkpzj25mUczfD6x6FCVZyEHPYFI8P4aBBKUVJWiF
         wlUmk8GhYObQgpPmsBKFfVGaDmYkHnWQXhBYM3S8TGuqrf4Vg1wnOkH1oNmbPwyxsVDL
         QigZ2xpGm6ei9OXIADSmuRNaV8ZZ9CYpfbpxiKRPc/F6o0gE8WaQCdqLV9+w0ljcg0i2
         BEOQJCtiAw+xdkCnaqK5o8Lya2x30ghGZs9QF9QR9WlggriOdr+NRO6NSQjp02giBZsw
         1c98Z1Mv0HWMr4I9H8VDtndO7NS0leaf98f0ZVMpDxD/aJQeMs6YQt/oVdQycAXwJD03
         8npw==
X-Gm-Message-State: AOAM532SyI8pui5X6MMRYjrUfStrwvP+gTP7qEfBuhklNoahPUM02w9S
	RCpmpMv3VdhBdOtx2Fosr4lZMr+bev66WV+wGd/5pw==
X-Google-Smtp-Source: ABdhPJxtdE7w2zG33/qtoItWQGsvhuAnSKZbygouaFPw/PX9VOXYAIcJ47FbHnULjDWJeZrn/vcjbYmmHzeQtQZVDDM=
X-Received: by 2002:a05:6000:1141:: with SMTP id d1mr14721976wrx.396.1626461149111;
 Fri, 16 Jul 2021 11:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210716122407.19416-1-ross.burton@arm.com> <YPGXApLL4WTfJHbp@piout.net>
In-Reply-To: <YPGXApLL4WTfJHbp@piout.net>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 16 Jul 2021 19:45:38 +0100
Message-ID: <CAAnfSTuLb-+NrU-M56F3pF=gxbps+EV9F7Co1sYXBU6-2L2XMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: ext4 should always have large inodes
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Drop this, a second iteration is now on the list.

Ross

On Fri, 16 Jul 2021 at 15:26, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Ross,
>
> This broke at least non-gpl3:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3691/steps/11/logs/stdio
>
> On 16/07/2021 13:24:07+0100, Ross Burton wrote:
> > mkfs.ext4 has logic where "small" file systems use "good old" 128-byte
> > inodes instead of the default 256-byte inodes.  This means that small
> > filesystems are not 2038-safe as they only support 32-bit timestamps.
> >
> > However, "small" is defined as "less than 500MB", which is a fair number
> > of filesystems in OpenEmbedded, especially when filesystems may be
> > created small and expanded later.
> >
> > To avoid a discussion over how small a file system should be before
> > it shouldn't be 2038-safe, simply build all filesystems with the default
> > type so they all have 256-byte inodes and thus 64-bit timestamps.
> >
> > [ YOCTO #14478 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/image_types.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index 954d6739ec..3dad86caa7 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -90,7 +90,7 @@ oe_mkext234fs () {
> >
> >  IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
> >  IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
> > -IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
> > +IMAGE_CMD_ext4 = "oe_mkext234fs ext4 -T default ${EXTRA_IMAGECMD}"
> >
> >  MIN_BTRFS_SIZE ?= "16384"
> >  IMAGE_CMD_btrfs () {
> > --
> > 2.25.1
> >
>
> >
> > 
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

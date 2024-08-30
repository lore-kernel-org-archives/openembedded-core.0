Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A397CA0FF3
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 13:39:29 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.15167.1725025162819461822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 06:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=C9dpLnFr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1654a42cb8so1737816276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725025162; x=1725629962; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NA1JBZlBp9Op0B4PxJsNy21Kj57yDHEJYfYFO6HA+zw=;
        b=C9dpLnFrasUZYd/bsiB0ly8907yuC0q/oprPFwIKQX6H1MMbYTk+ddju68mN9IDp1u
         Dii6kdrR0QJP4TSozVRhmPVnJnq8hRbmvkZnrEME+AdwvL848KY5M5FVqZ5vkCEwV9ic
         AERKFEtfaCuEYWIuskA33vjOVRLPSpkAO6jHUdvJqaVAI82grpQGBEGlboPB3o7djvo9
         YOvTb3q2rOyLZWfIxKwckRLiZcAp7LXxZszGxieR77/jNfqWlF5pOlbX6rcG3VT3RYmO
         vHTYdzdYbZZ37+Jv6x1xSGQRm//O09yV07YEJAVUmyzdrh2mULfDrFcgZRtUub/1g0MF
         ZOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725025162; x=1725629962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA1JBZlBp9Op0B4PxJsNy21Kj57yDHEJYfYFO6HA+zw=;
        b=YD9eKd6/Y27c1Z4KXNqWYVejjuatY4jQU4UsSdTRPtcndcZ9+wNjIi8vcWxEdvJtTC
         M9TnhdqJz2w7gmR2lF59XQ0T3xNvvn6CAq035M0FcrSrL/9tbUVCeW9bq4tgQcpDiv1z
         tSnkDJwvtDRbs9LKUEUcD+LGPtjv5OO4IJxFTfUlSUXKDv6sKAMMX8VD0BK55jZfILTM
         SZxHSLQlPHuA7bEJzTE7ciYjopQeEMHjIE0cZVGvDgPJ/aYDL11skNeDuX55Dk7NCN1S
         cDpeuvHQtnncgccAvGtKRDyfl2U4SmzDzq02UUMI4hOE9w7o2lhC7S9k8Pmwlo4lFKNc
         lvkA==
X-Gm-Message-State: AOJu0Yzfqt4aDtXtCDU51qsAd7SmtFiBbUkox/NjE6NYeRxa6dxd3Qxj
	aZ69bCzPLjtc2iWqzE5RwqHjkru08LKunydrhK8v9uYTzvG7kUp76t/G+LhIWg==
X-Google-Smtp-Source: AGHT+IF9qedqc2JDneJN/ygTl3C6Ip8jqRG3knADG417uPI2rjbtxQwwTwH2tvI31rM4p94zGRWhNA==
X-Received: by 2002:a05:6902:2083:b0:e0b:f2ca:e4df with SMTP id 3f1490d57ef6-e1a7a01e6c5mr2155607276.34.1725025161633;
        Fri, 30 Aug 2024 06:39:21 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bfa760sm14462306d6.24.2024.08.30.06.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:39:21 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:39:19 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Message-ID: <ZtHLhyp28XsDjZ4q@kudzu.us>
References: <20240829214144.2947418-1-jdmason@kudzu.us>
 <ZtGd3Wb7E4ocBXb_@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtGd3Wb7E4ocBXb_@nuoska>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 13:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203968

On Fri, Aug 30, 2024 at 01:24:29PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, Aug 29, 2024 at 05:41:44PM -0400, Jon Mason via lists.openembedded.org wrote:
> > Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> > machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> > (or something else).  These are usually defined by the machine config
> > file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> > one of those instead of ttyS0, but default back to ttyS0 if nothing is
> > set.
> > 
> > Also, use this variable in the efi wic file instead of "ttyS0".
> 
> What kind of issues prompted this patch?
> 
> I ran into possibly similar issues recently where a machine config
> and image is meant for multiple arm64 machines and serial console
> login stopped working on some of them. The kernel console messages
> were on the correct serial port on all machines but systemd-serialgetty recipe
> setup was not. I switched from the yocto specific systemd-serialgetty
> to upstream systemd which fixed all issues and serial getty is
> now on all needed serial ports (based on our test setup):
> 
> systemd_%.bbappend:
> 
> PACKAGECONFIG:append = " serial-getty-generator"
> 
> In our setup we also can't set the default console via kernel command line
> since that changes between machines.

The origin of this is getting poky-altcfg working on fvp-base.
systemd wasn't printing to term because console wasn't specified in
the meta-arm efi-disk.wks.in file, which is based on 
scripts/lib/wic/canned-wks/mkefidisk.wks

For portability, this needed to be a variable, and KERNEL_CONSOLE
seems like the right choice.  There are a lot of arm based machines
out there with ttyAMA0 and a few that are ttyS0.  So it cannot be a
arch based choice, and the machine conf file probably already has
SERIAL_CONSOLES set.  So, we can be dynamic here and get the proper
value for most things.

Now, we could be super smart and add all of the consoles in
SERIAL_CONSOLES, but I think that might be a bit too much.

Anyway, probably a few more wks changes coming to allow me to remove
them from meta-arm.

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
> 
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 3 ++-
> >  scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index 7554081e8b1a..976ff4adc526 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -1,7 +1,8 @@
> >  QA_LOGFILE = "${TMPDIR}/qa.log"
> >  
> >  OEINCLUDELOGS ?= "yes"
> > -KERNEL_CONSOLE ?= "ttyS0"
> > +# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
> > +KERNEL_CONSOLE ?= "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[1]},${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[0] or 'ttyS0'}"
> >  KEEPUIMAGE ??= "yes"
> >  
> >  DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
> > diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
> > index 9f534fe18471..5fa6682a9e10 100644
> > --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> > +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> > @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
> >  
> >  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> >  
> > -bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
> > +bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
> > -- 
> > 2.39.2
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203948): https://lists.openembedded.org/g/openembedded-core/message/203948
> > Mute This Topic: https://lists.openembedded.org/mt/108169885/7159507
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 


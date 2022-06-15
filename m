Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9CDC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 10:22:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.2920.1655288544107730671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 03:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PlErxG+Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4639C000B;
	Wed, 15 Jun 2022 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655288541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=87aqOn/xCHwvmk+9duHyr78tsus4yZRO27lLUpDUt9A=;
	b=PlErxG+YRNFucwxIxgCr9WofwaEdJLJSFfsjsEjjlI0VnhsEi8dJHAC0setbj3bT3RuSe9
	dblAwQhCih8HMoUBvofdcZ4j27WvabKUnrjfz5eap64svw33lTOvbQruFY/lfEVHfIv7YA
	G9ZAGdjgkLKvd8m0+BR0Rbg6Xn/DJrJt31OWr54tlHKmsl8K51psTahOG3HQg7oz3PFWhX
	B2nCxWYc+vDFyaVimqH4pF51kdEpXoyuiOXFiACvCixAlsLCvB0iGTRwKd4TLzWKTSS6cW
	PyjRJJCCNnEFBEWRKvHcPv80KrligwQQ3M2Fc8AkfHac9jCowmanPTIxI4KV3g==
Date: Wed, 15 Jun 2022 12:22:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] wic: Use ROOTFS_DIR to locate pseudo_dir
Message-ID: <Yqmy3PJcNWW/A+kP@mail.local>
References: <cover.1655274860.git.liezhi.yang@windriver.com>
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
 <YqmJk1TfiiQwvKWl@mail.local>
 <eed5a04c-b817-b35f-aff9-0580a21733c6@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eed5a04c-b817-b35f-aff9-0580a21733c6@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 10:22:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166928

On 15/06/2022 17:52:18+0800, Robert Yang wrote:
> 
> 
> On 6/15/22 3:26 PM, Alexandre Belloni wrote:
> > Hello,
> > 
> > On 14/06/2022 23:35:29-0700, Robert Yang wrote:
> > > Fixed when wks is:
> > > part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4096 --fixed-size 256M
> > > part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 --label root --align 4096
> > > part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M --fsoptions=ro,relatime,sync
> > > 
> > > $ bitbake <image>
> > > $ wic create <wks> -e <image>
> > > WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and permissions will be invalid
> > > 
> > > The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
> > > ROOTFS_DIR to fix the problem.
> > > 
> > > The patch is from "Rath Anil Kumar <AnilKumar.Rath@windriver.com>"
> > 
> > We need a proper Signed-off-by and From: to reflect that.
> 
> I got the raw patch from a website and added the commit messages, so I didn't
> add a formal 'From:', and yes, add it would be better, but I can't add the SOB
> for others. I've added the 'From:' in the PULL:
> 

Well, according to the DCO, you must add the SoB from the original
author, else, there is no guarantee anyone is allowed to shared the
code.

>   git://git.openembedded.org/openembedded-core-contrib rbt/wic
> 
>     wic: Use ROOTFS_DIR to locate pseudo_dir
> 
>     Fixed when wks is:
>     part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat
> --label boot --active --align 4096 --fixed-size 256M
>     part / --source rootfs --exclude-path=var/ --ondisk mmcblk0
> --fstype=ext4 --label root --align 4096
>     part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive
> mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M -
> -fsoptions=ro,relatime,sync
> 
>     $ bitbake <image>
>     $ wic create <wks> -e <image>
>     WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames
> and permissions will be invalid
> 
>     The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
>     ROOTFS_DIR to fix the problem.
> 
>     From: Rath Anil Kumar <AnilKumar.Rath@windriver.com>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> 
> // Robert
> 
> 
> > 
> > > 
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >   scripts/lib/wic/plugins/source/rootfs.py | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > index 25bb41dd702..11b09c1e80e 100644
> > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > @@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
> > >           part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
> > >           part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
> > > -        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
> > > +        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
> > >           if not os.path.lexists(pseudo_dir):
> > >               pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
> > > -- 
> > > 2.33.1
> > > 
> > 
> > > 
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#166909): https://lists.openembedded.org/g/openembedded-core/message/166909
> > > Mute This Topic: https://lists.openembedded.org/mt/91771589/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > 
> > 
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


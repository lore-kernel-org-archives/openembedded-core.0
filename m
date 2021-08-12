Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.19986.1628761432072010876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 02:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1BDE2C0002;
	Thu, 12 Aug 2021 09:43:49 +0000 (UTC)
Date: Thu, 12 Aug 2021 11:43:49 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] issues with wic creating "multi-partition" images?
Message-ID: <YRTtVche3UXNG7xB@piout.net>
References: <9dafcfda-fa85-8a7d-cd7e-6a584ac87c4d@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <9dafcfda-fa85-8a7d-cd7e-6a584ac87c4d@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 12/08/2021 05:26:47-0400, Robert P. J. Day wrote:
> 
>   asking from a position of massive ignorance since i just started
> digging into wic, but i've been reliably assured that i am going to
> encounter issues with trying to get wic to create what i choose to
> call "multi-partition" images, and i just want to know if this is an
> actual issue.
> 
>   current wic setup is to create an image which supports what i'll
> call the "preserve" partition -- distinct partition to hold
> non-upgradeable content; factory default firmware, non-volatile S/W
> config settings, that sort of thing, that is meant to be preserved
> across software upgrades. nothing unusual about this, strikes me as
> pretty standard.
> 
>   now, any recipe in the current build is allowed to contribute its
> own preserve data by adding it to a top-level "/preserve" directory.
> that directory is added to the content of the base package:
> 
>   FILES_${PN} += "/preserve"
> 
> and in the end, the wic image is responsible for taking everything
> under /preserve in the final rootfs and installing it in the preserve
> partition, wholly separate from however it installs the remainder of
> the rootfs.
> 
>   does wic have a problem with doing this? it seems so straightforward
> that i'm having trouble believing wic can't do it. thoughts? or
> perhaps a link to some reference board or vendor that has a .wks file
> that does exactly that?

In your wks.in, you can simply do something like that:

part / --source rootfs --fstype=ext4 --label root --exclude-path=preserve/
part /preserve --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/preserve --fstype=ext4 --label preserve


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

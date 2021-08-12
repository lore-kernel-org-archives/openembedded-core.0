Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.19979.1628761858251003495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 02:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58946 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mE7MX-00039A-EJ; Thu, 12 Aug 2021 05:50:57 -0400
Date: Thu, 12 Aug 2021 05:50:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] issues with wic creating "multi-partition" images?
In-Reply-To: <YRTtVche3UXNG7xB@piout.net>
Message-ID: <ab3934b7-ab59-eef2-e30-e1f45d20cbce@crashcourse.ca>
References: <9dafcfda-fa85-8a7d-cd7e-6a584ac87c4d@crashcourse.ca> <YRTtVche3UXNG7xB@piout.net>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Aug 2021, Alexandre Belloni wrote:

> Hello,
>
> On 12/08/2021 05:26:47-0400, Robert P. J. Day wrote:
> >
> >   asking from a position of massive ignorance since i just started
> > digging into wic, but i've been reliably assured that i am going to
> > encounter issues with trying to get wic to create what i choose to
> > call "multi-partition" images, and i just want to know if this is an
> > actual issue.
> >
> >   current wic setup is to create an image which supports what i'll
> > call the "preserve" partition -- distinct partition to hold
> > non-upgradeable content; factory default firmware, non-volatile S/W
> > config settings, that sort of thing, that is meant to be preserved
> > across software upgrades. nothing unusual about this, strikes me as
> > pretty standard.
> >
> >   now, any recipe in the current build is allowed to contribute its
> > own preserve data by adding it to a top-level "/preserve" directory.
> > that directory is added to the content of the base package:
> >
> >   FILES_${PN} += "/preserve"
> >
> > and in the end, the wic image is responsible for taking everything
> > under /preserve in the final rootfs and installing it in the preserve
> > partition, wholly separate from however it installs the remainder of
> > the rootfs.
> >
> >   does wic have a problem with doing this? it seems so straightforward
> > that i'm having trouble believing wic can't do it. thoughts? or
> > perhaps a link to some reference board or vendor that has a .wks file
> > that does exactly that?
>
> In your wks.in, you can simply do something like that:
>
> part / --source rootfs --fstype=ext4 --label root --exclude-path=preserve/
> part /preserve --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/preserve --fstype=ext4 --label preserve

  that's what i thought, so i'm going back to the current setup to try
to figure out what the originators thought the problem was.

rday

p.s. as i read it, the only distinction between a "wks" and a "wks.in"
file is the need to pre-process variable substitution in the latter,
correct?

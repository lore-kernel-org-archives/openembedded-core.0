Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938B6C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 13:09:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.486.1670591368981807933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 05:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fnAVFfTD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 04019C0002;
	Fri,  9 Dec 2022 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670591366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZPChf1tWFgxC5PqnnpMUYSu1ypqkRlXYX4Qe8hbSAU=;
	b=fnAVFfTDl7qh8J6C8mx/YUWygp6a5ZqUeXqIWOwagXvSMhpUsMMCYSXdoDiNZAkTMikR7u
	hwLWHKlptsW6S7UNsiNeptzzcMgMH0rFlNI9UJfDV41u4V0IYcDAUtrNUx4gAizeQUcSCL
	oXjYNszs5lw0DgsYHTOZjiwVw9JT4tyFjLHRbeR6sm7mhCC/0TwjzdKPW9IDuMmV4IQEAQ
	ttJWprmC8ZSXb8ih6/2nNYkgqZFMwwCCJWkn4hcXX/NrF3mav46aXjx/VGfGLOFQ8jnm1u
	CeHtQe0m87TVW8ofEKn4wDw4SWBKJmA1UzkewmExJ+ZUOvIE/zWlFTwyhjiDLA==
Date: Fri, 9 Dec 2022 14:09:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
Message-ID: <Y5Mzg1VAbMREQ55k@mail.local>
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com>
 <jwq5yekdg24.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jwq5yekdg24.fsf@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 13:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174450

On 09/12/2022 10:55:16+0100, Ola x Nilsson wrote:
> 
> On Fri, Dec 09 2022, Khem Raj wrote:
> 
> > Thanks for the patches
> >
> > On 12/7/22 23:11, Ola x Nilsson wrote:
> >> Signed-off-by: Ola x Nilsson <olani@axis.com>
> >> ---
> >>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>   create mode 100644 meta/conf/distro/time64.conf
> >> 
> >> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
> >> new file mode 100644
> >> index 0000000000..99eb06dc0f
> >> --- /dev/null
> >> +++ b/meta/conf/distro/time64.conf
> >> @@ -0,0 +1,23 @@
> >> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> >> +
> >> +# TODO: Only for 32-bit architectures?
> >> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> >> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> >> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
> >
> > We should enable it across all 32bit systems
> > something like
> >
> > TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if 
> > d.getVar('SITEINFO_BITS') == '32' else ''}"
> >
> > would do it.
> 
> I was looking for a way to identify 32-bit platforms but did not find
> SITEINFO_BITS.  I'll look into using that instead.
> 

I don't think it is correct to assume all the 32bit platforms are
affected. riscv32 is not affected for example nor would be any newer
32bit architecture.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


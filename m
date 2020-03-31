Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3015.1585680436108244272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 11:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7429640A35;
	Tue, 31 Mar 2020 18:47:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_vUn_Ty5KBl; Tue, 31 Mar 2020 18:47:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E81F409F0;
	Tue, 31 Mar 2020 18:47:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02BFA1718F1; Tue, 31 Mar 2020 14:47:10 -0400 (EDT)
Date: Tue, 31 Mar 2020 14:47:10 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Tom Rini <trini@konsulko.com>, Stefano Babic <sbabic@denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH] u-boot: Add UBOOT_LOCALVERSION_AUTO support
Message-ID: <20200331184710.GO1578@denix.org>
References: <20200331174641.1094071-1-otavio@ossystems.com.br>
 <20200331180709.GM1578@denix.org>
 <CAP9ODKpgo=WJuR5CupXuGmMLSiYxvDrHBbur1Q93+OVc1OMvcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpgo=WJuR5CupXuGmMLSiYxvDrHBbur1Q93+OVc1OMvcQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 03:18:41PM -0300, Otavio Salvador wrote:
> Hello Denys,
> 
> On Tue, Mar 31, 2020 at 3:07 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Mar 31, 2020 at 02:46:41PM -0300, Otavio Salvador wrote:
> > > Add the Git revision used for the build. It is very useful especially when
> > > using custom or vendor U-Boot forks so we can map a binary to a specific
> > > source revision. Valid values are "0" or "1".
> >
> > Well, UBOOT_LOCALVERSION was originally added specifically for this purpose -
> > to be able to append git hash.
> 
> Not really; it kinda of maps to what Linux kernel provides and it is a
> "suffix" for the version. For example "-ti" to imply it came from a
> Texas Instruments fork.

There are multiple uses and you can append anything you want. Here's the 
original patch that specifically mentions adding git hash, as an example:
https://lists.openembedded.org/g/openembedded-core/topic/72204283


> > > This is based on a class which has been in use in `meta-freescale` BSP
> > > for years and has been very useful especially for custom U-Boot releases
> > > as it allow we to know the exact Git revision used for the binary.
> >
> > And in meta-ti BSP we've used for many years:
> > UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}')}"
> >
> > And get_git_revision() just calls "git rev-parse HEAD"
> >
> > So, it seems a bit redundant to add another variable for this...
> 
> How I use this is:
> 
> UBOOT_LOCALVERSION = "-updatehub"
> UBOOT_LOCALVERSION_AUTO = "1"
> 
> I think it is way easier for users to do that. Using inline Python
> code is possible but it is not something I qualify as user friendly.

UBOOT_LOCALVERSION = "-updatehub-g${SRCPV}"

-- 
Denys

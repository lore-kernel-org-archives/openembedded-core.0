Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Dec 2017 12:29:30 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 0388765CC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 12:29:30 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id NHfAeOyjd2du7NHfBeu5cE; Fri, 08 Dec 2017 12:21:59 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=a6FAzQaF c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=ocR9PWop10UA:10 a=pGLkceISAAAA:8 a=-An2I_7KAAAA:8
	a=NsNTHTGXO8lMUIX1tHwA:9 a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eNHfA-0003Ld-7x; Fri, 08 Dec 2017 12:21:56 +0000
Date: Fri, 8 Dec 2017 12:21:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20171208122156.j74feaneh7ywmoew@mcrowe.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
	<CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfE7slKOsW+A3c5+0ZzjU59z8vekpYO7myNeL2dPOWV5VP0jv2iQmb+Mz7s+MmjYB5wDlt6lG0Uje7UJPDY24Qi1ZDiEHo57PCe0/1qcJinhe5wY7+t/U
	nKuOAYFJCvABid5o3FCY36NT0fgbOAWx10LyUgojM3fa7paynP4H5Kba
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 12:29:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 07 December 2017 at 11:44:12 -0800, Andre McCurdy wrote:
> On Thu, Dec 7, 2017 at 11:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Dec 7, 2017 at 8:15 AM, Mike Crowe <mac@mcrowe.com> wrote:
> >>                             I also noticed that
> >> 849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the consequences
> >> of exceeding the size from being fatal to merely a warning.
> >>
> >> This second change in behaviour wasn't described in the commit message, so
> >> I'm not sure whether it was intentional. I can believe that when generating
> >> multiple kernel image types it may not be essential that they all fit, but
> >> I don't really know what the use case for the feature is.
> >>
> >> I could fix this by adding to kernel.bbclass something like:
> >>
> >>  KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?= "warn"
> >>
> >> and then using it when delivering the bad news so that recipes can override
> >> it if they wish.
> >>
> >> Alternatively, I could treat the error as being fatal if none of the kernel
> >> images fit within the required size. This would degenerate to the old
> >> behaviour automatically if KERNEL_IMAGETYPES contains only one entry.
> 
> That sounds like a good solution.

Thanks. I've implemented that and it seems to work. I shall provide a patch
shortly.

However, despite appearances it seems that
849b67b2e4820564b5e5c9bd4bb293c44351c5f3 did accidentally make exceeding
KERNEL_IMAGE_MAXSIZE fatal because there's no such function as "warn". I
think that it should have been "bbwarn":

 run.do_sizecheck.12393: line 119: warn: command not found

Mike.


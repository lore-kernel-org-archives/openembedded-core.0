Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOvOb-0005dB-L3
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 19:27:53 +0200
Received: by pxi6 with SMTP id 6so5112766pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MVFs+PQvjGFaVAA359T2uizRqnyQrsTQIxpTlhe71mg=;
	b=Oq03nw0yrMujbs6jKfBFNhreyEqtmdoCB4bNZA9/8Kopxyi0Qr12w4V1DB0W/O1Ulq
	x0wXwaN6+DTKhykfG6TlsJrYs91cSds+zyz22vhzRzo5RVCjQSHshH0/pErHdYrLGjAt
	Eq/+QQtIUKCB6Z6rS6s00aiKgI9vAPuCQss74=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Iv9ZJyAp5K+nx5XDugxuxPxyWS3ANn+mk860mUAvkM7aKn/CJnjKTXtLh1eFBeD6Z7
	Sf84Gqmgehh+g8tngMjpOAwo85cnPWlx53LkGx+L0qM6t/jmIZGr59UsmXompOkC6cmX
	Uk0E2Ts368Hy+tjzKI6jRi3Jg4+6er0C37Zu8=
Received: by 10.68.29.228 with SMTP id n4mr2781240pbh.500.1306257889638;
	Tue, 24 May 2011 10:24:49 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p1sm5118826pbi.26.2011.05.24.10.24.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 10:24:48 -0700 (PDT)
Date: Tue, 24 May 2011 10:23:30 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110524172330.GC18086@sakrah.homelinux.org>
References: <4DDBDE9D.5000709@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DDBDE9D.5000709@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 17:27:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/11 09:36), Darren Hart wrote:
> I've started pulling in the 15 or so patches to u-boot from meta-ti. In

why ? its a BSP recipe and bsp layer is best place for it IMO unless you
want to have some of those machines in a different layer.

> doing so I've come across some questions I'd like you thoughts on.
> Specifically, where to put these changes. Some points of context:
> 
> 1) oe-core is intended to support emulated machines only
> 2) oe-core has a "virgin" u-boot recipe (no patches)
> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
> 4) meta-ti has it's own u-boot recipe with per-machine patches
> 
> A stated goal was to bring the Yocto Project's u-boot support for the
> Beagleboard in line with that in meta-ti. There are several ways I can
> go about this.
> 
> a) create a bbappend in meta-yocto and duplicate the meta-ti
>    modifications in bbappend form.
> b) Modify the oe-core recipe directly
> 
> While a) is the most direct approach to accomplish our goal, it requires
> continual maintenance and duplicates effort. I don't care for this
> approach. b) has the potential to consolidate all beagleboard u-boot
> recipe work into a single place. It could simplify the meta-ti and
> eliminate the need for a bbappend in the meta-yocto layer.
> 
> The question of whether bootloaders have a place in oe-core should
> probably be addressed. While they aren't needed for the emulated
> machines, they are a highly reusable component for real systems, and
> that seems justify keeping them in oe-core. Does anyone disagree with
> this assessment?
> 
> I propose pulling the necessary changes to u-boot from meta-ti into
> oe-core. My initial scan suggested the beagleboard patches are mostly
> contained to beagle specific source files. I would prefer to pull in all
> the patches for all machines into the SRC_URI, rather than divide them
> up by machine. This reduces complexity considerably. For the couple of
> patches that collide, we would keep those as machine specific.
> 
> As a final part of the work, I would include my beagleboard patch status
> audit in the included patches and continue to work on reducing the
> patches in the recipe for the beagleboard.
> 
> Thoughts?

Well I am in similar boat where I wanted to build atom-pc for angstrom
but I was thinking using meta-intel layer instead of pulling stuff out
and stuffing it elsewhere and certainly not oe-core

> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem



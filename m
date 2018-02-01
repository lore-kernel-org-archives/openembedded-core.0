Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEF8780BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:44:13 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 40D452657;
	Thu,  1 Feb 2018 08:44:13 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 40D452657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 40D452657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517492654;
	bh=MeleylekoiFTu8LGUGjRiiCyjrd5moqXq7b6it1zih8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=TIg1XU5Eb+QOIxEwctteVlNPllxkzjP0On8hkEBkMJ/1/T2nlvwxg24S3hOy3CLaw
	knvLHHVyUgSpFEl0/p3IyGY0f8ennu684T5cK7pgbRFo9aBOU7YdE7OSA64kJTzzup
	OcoETJdqwy4e2LvfD+r55iE6TngfwvAC6jubB6ik=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
To: "Burton, Ross" <ross.burton@intel.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
Date: Thu, 1 Feb 2018 08:44:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 13:44:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 01/02/18 08:38 AM, Burton, Ross wrote:
> On 1 February 2018 at 12:55, Daniel F. Dickinson <cshored@thecshore.com 
> <mailto:cshored@thecshore.com>> wrote:
> 
>     I'm wondering if is doable and would be accepted to add a "tiny"
>     DISTRO_FEATURE that automatically does PACKAGECONFIG += "tiny", and
>     packages which honour this make choices that build smaller editions
>     and/or create smaller binary sub-packages than default (i.e. things
>     that can be split out of build packages are, so that a -core or
>     -base package has only the minimum, and a one uses metapackages to
>     install expected packaging (so ${PN} would by default RDEPEND on
>     ${PN}-base and other sub-packages (or other recipes
>     packages/sub-packages) that give the 'usual' use case for the
>     package, but can be managed in parts for systems that are quite small.
> 
>     Or is the splitting into sub-parts preferred anyway and patches to
>     make smaller splits would accepted relatively easily, but usually
>     just don't get done because it's more work to have more sub-packages
>     and so it just doesn't get done to the level a project like OpenWrt
>     pieces things up, and OpenEmbedded usually has more space available
>     than a typical OpenWrt device?
> 
>     I think PACKAGECONFIG[tiny] would really translate into different
>     things in different packages (hence the idea of having a top-level
>     flag that
>     makes it easier to do across the board rather than having to specify
>     specific flags for each recipe, except in exceptional
>     circumstances), although something like nossl should perhaps be a
>     separate top-level flag since even if you want small you probably
>     want some kind of ssl, but there may be relevant use cases where
>     nossl would be wanted but isn't just about size.  With -tiny one
>     could perhaps emphasize the choice of smaller SSL libraries like
>     mbedtls and wolfssl (cyassl) when they are an option and warn (or
>     refuse to build) if a big library like openssl can't be avoided.
> 
> 
> I feel that DISTRO_FEATURES=tiny is too coarse: you may want a tiny 
> busybox but a fully-featured wget, or whatever.
> 
> Also PACKAGECONFIG[tiny] doesn't really explain *what* it's doing, and 
> may end up doing many things at once.  Does a tiny systemd disable 
> networkd? What if you want as tiny as possible, but with networkd?
> 
> Fine grained PACKAGECONFIGs and/or subpackages as appropriate are 
> definitely the way forwards in my opinion.
> 
I guess the question is would it be useful to have a flag that chooses
a 'typical' tinyness but can be overridden (I'm think here of avoiding 
having to specify huge numbers of PACKAGECONFIGs for a typical tiny 
case, when really you want most of the 'normal' tinyness with some
tweaks.  What I'm think is that "tiny" really should just change the 
defaults for PACKAGECONFIG etc, but like the defaults can be easily 
overridden.



Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AA3857516D;
	Fri,  6 Apr 2018 18:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 635C220AF8;
	Fri,  6 Apr 2018 18:58:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id g1f-JpVlE_73; Fri,  6 Apr 2018 18:58:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 283022017D;
	Fri,  6 Apr 2018 18:58:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AF74F1633BF; Fri,  6 Apr 2018 14:58:44 -0400 (EDT)
Date: Fri, 6 Apr 2018 14:58:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180406185844.GB3228@denix.org>
References: <1523011021.2942.6.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1523011021.2942.6.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 18:58:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

I understand the need to reduce the support burden. But there are some valid 
cases when you want to use components/layers from a different set of releases. 

It can sometimes be an older component in otherwise newer setup (i.e. one 
layer hasn't been updated yet from rocko, but it still works fine with 
everything else from sumo).

Alternatively, sometimes you need to bring a newer version of the component to 
your older release - as long as it works for me, I don't want this to be 
artificially restricted.

In other words, the intention is good, but it needs to be either more flexible 
or allow overriding this from distro config or local.conf...

-- 
Denys


On Fri, Apr 06, 2018 at 11:37:01AM +0100, Richard Purdie wrote:
> I finally found 5 mins to sit and look at where I'd gotten to with the
> LAYERSERIES variable handling. I sent out discussion about this a while
> ago but as a reminder:
> 
> We have a problem where people expect master branch of meta-X to work
> with OE-Core master. If meta-X hasn't been maintained for a long time,
> this may give all kinds of weird errors. This creates a large support
> burden and means we struggle to spot unmaintained/un-updated layers.
> We'd like to fix this.
> 
> In answer to this I added LAYERSERIES_CORENAMES to OE-Core and strongly
> suggest layers then set:
> 
> LAYERSERIES_COMPAT_xxx = "sumo"
> 
> in their layer.conf where xxx is the collection name (used elsewhere in
> layer.conf) to indicate which versions of OE-Core they're expected to
> work against.
> 
> The code already exists to validate this with a fatal error for
> mismatches. What was missing was:
> 
> a) to print a warning if LAYERSERIES_COMPAT_xxx is unset. I've a patch 
>    queued for bitbake to add this.
> b) add a check to yocto-check-layer and require this to be set for YP 
>    Compatible v2. I've added
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=12661
>    to track this.
> 
> Yes, its late in the release and the warnings will be annoying but I
> think its worth fixing this now so I'm pushing ahead to resolve this.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture


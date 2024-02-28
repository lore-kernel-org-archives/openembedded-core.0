Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B48AC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 15:41:25 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.16672.1709134882988536402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 07:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=S4H0+nDB;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=781c072f5=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709134883; x=1740670883;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=J2vj3AQGiLW0Vp5QCcVjvZcM6MXpG9CwmK80UI477jY=;
  b=S4H0+nDBv5IuyczbrfTL8QBwFh0QiOcyNjQdh8UIZYe65SwXOMlMXzR+
   wGfCalS5SpwnOkqfifjSZJGAYjq5cikTQA5gLxEy2LqNnzxDdGC+R62Lp
   cWEfa0FLzouWR9oe4aMT21TcS3NvfYtfVu8/bxOVXwfIUXH76UF7asJYz
   E=;
X-CSE-ConnectionGUID: GbDBL/RTQ72IumqXGMqADQ==
X-CSE-MsgGUID: VBwtNPKNSReoia1KqswbNw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Feb 2024 16:41:17 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 28 Feb 2024 16:41:16 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 28 Feb 2024 16:41:16 +0100
Received: from [10.242.8.62] (10.30.85.212) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Wed, 28 Feb 2024 16:41:16 +0100
Message-ID: <c95a7daa-8f9a-4767-ac6d-5158647781ed@bmw.de>
Date: Wed, 28 Feb 2024 16:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
 <e5139011c4d44fab2f927332a01947a7eb2c42ab.camel@linuxfoundation.org>
From: Philip Lorenz <philip.lorenz@bmw.de>
CC: <openembedded-core@lists.openembedded.org>
In-Reply-To: <e5139011c4d44fab2f927332a01947a7eb2c42ab.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: smucmp09d.europe.bmw.corp (2a03:1e80:a15:58f::2040) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 15:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196392

Hi Richard,

On 28.02.24 10:14, Richard Purdie wrote:
> On Wed, 2024-02-28 at 07:21 +0100, Philip Lorenz wrote:
>> With the introduction of debuginfod ([1]), providing debug symbols to
>> developers has been greatly simplified. Initial support for spawning a
>> debuginfod server is already available as part of poky.
>>
>> However, this relies on debuginfod scraping the debug packages for their
>> build IDs. This is not only inefficient (as all packages need to be
>> extracted again), but it also does not scale well when covering a large
>> number of builds.
>>
>> To mitigate this, we are currently working on an approach to extract the
>> metadata needed to provide debug symbols as part of the bitbake build.
>> This metadata includes the mapping of the GNU build ID to the package
>> holding the debug symbol. The metadata will be treated as another build
>> artifact and can be consumed by a daemon implementing the debuginfod
>> HTTP API to serve debug symbol file requests from the package feed
>> produced by the bitbake build.
>>
>> Initially, we considered implementing the generation of debug metadata
>> directly as part of emit_pkgdata() in package.bbclass (disabled by
>> default). However, we discarded this idea as introducing a configuration
>> option would increase maintenance effort for a feature that would
>> potentially only be enabled in very few builds.  Instead, we opted to
>> extend package.bbclass to expose the minimal information needed to
>> reliably identify debug symbol files, which can then be consumed by a
>> packaging hook.
>>
>> Is this extension something that is viable to be merged? We are
>> considering open-sourcing the other parts needed to implement the setup
>> described above, but as those parts are still in the prototyping phase,
>> it will require some more time.
>>
>> [1] https://sourceware.org/elfutils/Debuginfod.html
> I think this is the kind of direction we've wanted to go in. I'm not
> sure the patch as it stands is that useful as it just lists files which
> you could just as easily obtain with a os.walk on the filesystem but in
> principle I'd be fine with writing some extra data during do_package or
> do_packagedata which saves the buildid mappings.
In one of my first iterations I placed the build ID to file mapping into 
the "extended" section of "pkgdata". We'd then consume this data after 
the build has finished to produce the debug info metadata database which 
contains the mapping from build ID to debug symbol file and the package 
containing the file. If this sounds sane to you I can clean up that 
version and share it here.
> So yes, in principle the idea sounds good but obviously the final
> decision would depend upon the patches.
>
> I'm assuming this data wouldn't be that large or that expensive to
> compute so I'd prefer not to hide it behind extra configuration options
> if we can help it. That does depend on the overheads/costs though.
>
I just executed build ID extraction on the debug packages of our medium 
sized kirkstone based distro (see my reply to Alex for more details). 
Sequentially extracting build IDs from around 8000 files took around 
1:30 minutes on my machine. While I wouldn't call this excessive, I am 
also not sure whether this is too much overhead given that I only expect 
this data to be used in some deployments.

Br,

Philip


-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Chris Brandt and Michael Böttrich
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------



Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88A9C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 08:21:01 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.19807.1709194856744489927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 00:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=eSPzvY1W;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=7827fc2fe=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709194856; x=1740730856;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=82t6L0KqGNAu/QQgJ/eTX6ExvMFh6i0J/1r7I5N3LbM=;
  b=eSPzvY1WplHuHek/14eoo61BRFT0AEOUSTsLYTqE42qiKfqNW1Sy4Swj
   /fyhwLT8TwHKoETXhwB9oDSZLinSxIXuLrdI/uGxVbTJyJvlX+lmq+tc2
   IL3/uP1f8GgkS2l+U8T1FUptRY/QdKeWpBnjUkvpCNwBY92tYu/bzCoal
   g=;
X-CSE-ConnectionGUID: v0AL45jWSwucEg4/AAOOHA==
X-CSE-MsgGUID: bxzFzrPsTbWphmU81j9VsA==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 29 Feb 2024 09:20:54 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 29 Feb 2024 09:20:54 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb5.muc with ESMTP/TLS; 29 Feb 2024 09:20:54 +0100
Received: from [10.242.8.36] (10.30.85.203) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 29 Feb 2024 09:20:53 +0100
Message-ID: <f2b0d86b-5824-42d3-b293-c0a6a979216d@bmw.de>
Date: Thu, 29 Feb 2024 09:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
 <e5139011c4d44fab2f927332a01947a7eb2c42ab.camel@linuxfoundation.org>
 <c95a7daa-8f9a-4767-ac6d-5158647781ed@bmw.de>
 <CANNYZj9rcqN44L==NwV=o-GWKCqzU1rOK_U03VK2XQufWos6Dw@mail.gmail.com>
From: Philip Lorenz <philip.lorenz@bmw.de>
In-Reply-To: <CANNYZj9rcqN44L==NwV=o-GWKCqzU1rOK_U03VK2XQufWos6Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP07E.europe.bmw.corp (2a03:1e80:a15:58f::2167) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196419

Hi Alex,

On 28.02.24 18:40, Alexander Kanavin wrote:
> On Wed, 28 Feb 2024 at 16:41, Philip Lorenz <philip.lorenz@bmw.de> wrote:
>>> I'm assuming this data wouldn't be that large or that expensive to
>>> compute so I'd prefer not to hide it behind extra configuration options
>>> if we can help it. That does depend on the overheads/costs though.
>>>
>> I just executed build ID extraction on the debug packages of our medium
>> sized kirkstone based distro (see my reply to Alex for more details).
>> Sequentially extracting build IDs from around 8000 files took around
>> 1:30 minutes on my machine. While I wouldn't call this excessive, I am
>> also not sure whether this is too much overhead given that I only expect
>> this data to be used in some deployments.
> I have to object to the numbers because they were done with a
> sequential shell loop. Debuginfod does it in threads and is able to
> complete the scans much faster. So you need to check how quickly it
> completes its job when started with oe-debuginfod rather. There might
> be an improvement coming from what you are proposing, but it's most
> likely not going to be as drastic.

I think there's some misunderstanding that I'd like to sort out first: 
This is in no way about deprecating or not using debuginfod. It however 
is an optimization on how build IDs are extracted which can be used by a 
variety of tools (such as debuginfod). As such a sequential scan should 
give a rough idea on how much time it takes to extract the build IDs 
during do_package (wall clock time is bound to differ). Based on this we 
can see that its not free but also not extremely expensive although I'd 
like to leave the judgement call on whether this something that should 
be enabled on all builds to someone else.

> There's also something else I noticed just now: there seems to be an
> alternative implementation of debuginfod you want to introduce? Why?
> If the original from elfutils isn't working well enough, shouldn't we
> make it better?

Let try to give you some sort of insight of how we are planning to use 
it and I hope this clarifies things:

In our case we are dealing with hundreds of bitbake builds whose 
artifacts (including package feeds) are published to some storage 
accessible via a HTTP. We would now like to offer a service that gives 
developers access to the debug files in a seamless way (i.e. we want to 
eliminate the process of manually having to download the debug packages 
matching a particular build). To accomplish this, our setup is based 
around a lightweight "gateway" daemon that translates a debuginfo HTTP 
request into a fetch of the corresponding package from the matching 
repository, extracting the debug symbol file and then serving that to 
the requesting client.

This is quite different to the way debuginfod works (which seems to be 
built around the idea of having the debug symbol files readily available 
via the file system) and I also see advantages in that approach when one 
has a fairly static set of debug symbol files one wants to serve. 
There's also some other non-functional requirements that would make 
deployment of debuginfod in our case quite difficult.

This is no way meant to be a fully fledged debuginfod reimplementation 
but a simple gateway between the debuginfod protocol and a backing 
package repository. I am not sure whether such an extension is in scope 
of the elfutils package.
> One possibility is teaching it to mass-import pre-computed entries
> into its index, so that sweeping file tree scans with archive
> extractions can be avoided altogether. Or doing incremental index
> imports directly from do_package.
Producing this data is exactly what this RFC is about. Using the 
extracted build ID information to optimize the import into debuginfod is 
one of the possible use cases but I'd also suggest to keep the extracted 
data agnostic of any concrete tooling (e.g. pkgdata).

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



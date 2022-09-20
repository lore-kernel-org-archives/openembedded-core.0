Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C17C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:25:07 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web09.11175.1663676704689819090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pianon.eu
 header.s=mail20151219 header.b=XoxJotXG;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id EF3245C0096;
	Tue, 20 Sep 2022 14:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:user-agent:references:in-reply-to:subject:subject
	:from:from:date:date:content-transfer-encoding:content-type
	:content-type:mime-version; s=mail20151219; t=1663676701; x=
	1665491102; bh=Osh4Pu406lOeIrjQdY0UA1ZXyPx65ySc42ycdctgtkA=; b=X
	oxJotXGjKAgT2HXEz6b2hhdNxCoFFiTpt75S9eWoMiLvOmLkcq2kqit0Am+QxWeY
	bfZt3kYRVPy82bTReScv266YN+n+TU6d7RzM+ETnKf6fI7Y3EtitS+64E076ViNe
	KDa66owiVqWv0JYo99i3iEvZfjBEWyopga5S8vtM1U=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r_nPUVd1yJ6U; Tue, 20 Sep 2022 14:25:01 +0200 (CEST)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id 3FE8E5C0095;
	Tue, 20 Sep 2022 14:25:01 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 20 Sep 2022 14:25:01 +0200
From: Alberto Pianon <alberto@pianon.eu>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Marta Rybczynska
 <rybczynska@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture@lists.openembedded.org, Joshua Watt
 <JPEWhacker@gmail.com>, 'Carlo Piana' <carlo@piana.eu>,
 davide.ricci@huawei.com
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
In-Reply-To: <4c2cee7b-2e17-adc6-f603-86c78468cc55@kernel.crashing.org>
References: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
 <10e816efb661938db17c512199720580@pianon.eu>
 <4c2cee7b-2e17-adc6-f603-86c78468cc55@kernel.crashing.org>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <c5d121065f8918810daac3d535ef34b8@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 12:25:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170897


Il 2022-09-16 17:49 Mark Hatle wrote:
> On 9/16/22 10:18 AM, Alberto Pianon wrote:
> 
> ... trimmed ...
> 
>>> I also can see the issue with multiple sources in SRC_URI, although 
>>> you
>>> should be able to map those back if you assume subtrees are "owned" 
>>> by
>>> given SRC_URI entries. I suspect there may be a SPDX format limit in
>>> documenting that piece?
>> 
>> I'm replying in reverse order:
>> 
>> - there is a SPDX format limit, but it is by design: a SPDX package
>>     entity is a single sw distribution unit, so it may have only one
>>     downloadLocation; if you have more than one downloadLocation, you 
>> must
>>     have more than one SPDX package, according to SPDX specs;
> 
> I think my interpretation of this is different.  I've got a view of
> 'sourcing materials', and then verifying the are what we think they
> are and can be used the way we want.  The "upstream sources" (and
> patches) are really just 'raw materials' that we use the Yocto Project
> to combined to create "the source".
> 
> So for the purpose of the SPDX, each upstream source _may_ have a
> corresponding SPDX, but for the binaries their source is the combined
> unit.. not multiple SPDXes.  Think of it something like:
> 
> upstream source1 - SPDX
> upstream source2 - SPDX
> upstream patch
> recipe patch1
> recipe patch2
> 
> In the above, each of those items would be combined by the recipe
> system to construct the source used to build an individual recipe (and
> collection of packages).  Automation _IS_ used to combine the
> components [unpack/fetch] and _MAY_ be used to generated a combined
> SPDX.
> 
> So your "upstream" location for this recipe is the local machine's
> source archive.  The SPDX for the local recipe files can merge the
> SPDX information they know (and if it's at a file level) can use
> checksums to identify the items not captured/modified by the patches
> for further review (either manual or automation like fossology).  In
> the case where an upstream has SPDX data, you should be able to
> inherit MOST files this way... but the output is specific to your
> configuration and patches.
> 
> 1 - SPDX |
> 2 - SPDX |
> patch    |---> recipe specific SPDX
> patch    |
> patch    |
> 
> In some cases someone may want to generate SPDX data for the 3
> patches, but that may or may not be useful in this context.

IMHO it's a matter of different ways of framing Yocto recipes into SPDX
format.

Upstream sources are all SPDX packages. Yocto layers are SPDX packages,
too, containing some PATCH_FOR upstream packages.

Upstream sources and yocto layers are the "final" upstream sources, and
each of them has its downloadLocation.

"The source" created by a recipe is another SPDX package, GENERATED_FROM
upstream source packages + recipe and patches from Yocto layer
package(s). "The source" may need to be distributed by downstream users
(eg. to comply with *GPL-* obligations or when providing SDKs), so
downstream users may made it available from their own infrastructure,
"giving" it a downloadLocation.

(in SPDX, GENERATED_FROM and PATCH_FOR relationships may be between
files, so one may map files found in "the source" package to individual
files found in upstream source packages)

Binary packages GENERATED_FROM "the source" are local SPDX packages,
too. And firmware images are SPDX packages, too, GENERATED_FROM all the
above. Firmware images are distributed by downstream users, who will
provide their own downloadLocation.

> 
>> - I understand that my solution is a bit hacky; but IMHO any other
>>     *post-mortem* solution would be far more hacky; the real solution
>>     would be collecting required information directly in do_fetch and
>>     do_unpack
> 
> I've not looked at the current SPDX spec, but past versions has a
> notes section.  Assuming this is still present you can use it to
> reference back to how this component was constructed and the upstream
> source URIs (and SPDX files) you used for processing.
> 
> This way nothing really changes in do_fetch or do_unpack.  (You may
> want to find a way to capture file checksums and what the source was
> for a particular file.. but it may not really be necessary!)
> 

If you want to automatically map all files to their corresponding
upstram sources, it actually is... see my next point


>> - I also understand that we should reduce pain, otherwise nobody would
>>     use our solution; the simplest and cleanest way I can think about 
>> is
>>     collecting just package (in the SPDX sense) files' relative paths 
>> and
>>     checksums at every stage (fetch, unpack, patch, package), and 
>> leave
>>     data processing (i.e. mapping upstream source packages -> recipe's
>>     WORKDIR package -> debug source package -> binary packages -> 
>> binary
>>     image) to a separate tool, that may use (just a thought) a graph
>>     database to process things more efficiently.
> 
> Even it do_patch nothing really changes, other then again you may want
> to capture checksums to identify thingsthat need further processing.
> 
> 
> This approach greatly simplifies things, and gives people doing code
> reviews the insight into what is the source used when shipping the
> binaries (which is really an important aspect of this), as well as
> which recipe and "build" (really fetch/unpack/patch) were used to
> construct the sources.  If they want to investigate the sources
> further back to their provider, then the notes would have the
> information for that, and you could transition back to the "raw
> materials" providers.

The point is precisely that we would like to help people avoid doing
this job, because if you scale up to n different yocto projects it would
be a time-consuming, error-prone and hardly maintainable process. Since
SPDX allows to represent relationships between any kind of entities
(files, packages), we would like to use that feature to map local source
files to upstream source files, so machines may do the job instead of
people -- and people (auditors) may concentrate on reviewing upstream
sources -- i.e. the atomic ingredients used across different projects or
across different versions of the same project.


> 
>>> 
>>> Where I became puzzled is where you say "Information about debug
>>> sources for each actual binary file is then taken from
>>> tmp/pkgdata/<machine>/extended/*.json.zstd". This is the data we 
>>> added
>>> and use for the spdx class so you shouldn't need to reinvent that
>>> piece. It should be the exact same data the spdx class uses.
>>> 
>> 
>> you're right, but in the context of a POC it was easier to extract 
>> them
>> directly from json files than from SPDX data :) It's just a POC to 
>> show
>> that required information may be retrieved in some way, implementation
>> details do not matter
>> 
>>> I was also puzzled about the difference between rpm and the other
>>> package backends. The exact same files are packaged by all the 
>>> package
>>> backends so the checksums from do_package should be fine.
>>> 
>> 
>> Here I may miss some piece of information. I looked at files in
>> tmp/pkgdata but I couldn't find package file checksums anywhere: that 
>> is
>> why I parsed rpm packages. But if such checksums were already 
>> available
>> somewhere in tmp/pkgdata, it wouldn't be necessary to parse rpm 
>> packages
>> at all... Could you point me to what I'm (maybe) missing here? Thanks!
> 
> file checksumming is expensive.  There are checksums available to
> individual packaging engines, as well as aggregate checksums for "hash
> equivalency".. but I'm not aware of any per-file checksum that is
> stored.
> 
> You definitely shouldn't be parsing packages of any type (rpm or
> otherwise), as packages are truly optional.  It's the binaries that
> matter here.

You are definitely right. I guess that it should be done (optionally) in
do_package



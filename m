Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9189DC6FA82
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 01:18:08 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.4973.1663204670864055357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 18:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28F1Gii0015440;
	Wed, 14 Sep 2022 20:16:45 -0500
Message-ID: <85baa0f3-937d-fce5-9fc2-0d9315d030ac@kernel.crashing.org>
Date: Wed, 14 Sep 2022 20:16:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>,
        Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        openembedded-architecture@lists.openembedded.org
References: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
 <CAJdd5GaVFL-GyPrCHKTGn1rBU1-khVN0TnbeYv_Yr0QHUDLwig@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <CAJdd5GaVFL-GyPrCHKTGn1rBU1-khVN0TnbeYv_Yr0QHUDLwig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 01:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170678



On 9/14/22 9:56 AM, Joshua Watt wrote:
> On Wed, Sep 14, 2022 at 9:16 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>>
>> Dear all,
>> (cross-posting to oe-core and *-architecture)
>> In the last months, we have worked in Oniro on using the create-spdx
>> class for both IP compliance and security.
>>
>> During this work, Alberto Pianon has found that some information is
>> missing from the SBOM and it does not contain enough for Software
>> Composition Analysis. The main missing point is the relation between
>> the actual upstream sources and the final binaries (create-spdx uses
>> composite sources).
> 
> I believe we map the binaries to the source code from the -dbg
> packages; is the premise that this is insufficient? Can you elaborate
> more on why that is, I don't quite understand. The debug sources are
> (basically) what we actually compiled (e.g. post-do_patch) to produce
> the binary, and you can in turn follow these back to the upstream
> sources with the downloadLocation property.

When I last looked at this, it was critical that the analysis be:

binary -> patched & configured source (dbg package) -> how the sources were 
constructed.

As Joshua said above.  I believe all of the information is present for this as 
you can tie the binary (through debug symbols) back to the debug package.. and 
the source of the debug package back to the sources that constructed it via 
heuristics.  (If you enable the git patch mechanism.  It should even be possible 
to use git blame to find exactly what upstreams constructed the patched sources.

For generated content, it's more difficult -- but for those items usually there 
is a header which indicates what generated the content so other heuristics can 
be used.

>>
>> Alberto has worked on how to obtain the missing data and now has a
>> POC. This POC provides full source-to-binary tracking of Yocto builds
>> through a couple of scripts (intended to be transformed into a new
>> bbclass at a later stage). The goal is to add the missing pieces of
>> information in order to get a "real" SBOM from Yocto, which should, at
>> a minimum:
> 
> Please be a little careful with the wording; SBoMs have a lot of uses,
> and many of them we can satisfy with what we currently generate; it
> may not do the exact use case you are looking for, but that doesn't
> mean it's not a "real" SBoM :)
> 
>>
>> - carefully describe what is found in a final image (i.e. binary files
>> and their dependencies), since that is what is actually distributed
>> and goes into the final product;
>> - describe how such binary files have been generated and where they
>> come from (i.e. upstream sources, including patches and other stuff
>> added from meta-layers); provenance is important for a number of
>> reasons related to IP Compliance and security.

Full compliance will require binaries mapped to patched source to upstream 
sources _AND_ the instructions (layer/recipe/configuration) used to build them. 
  But it's up to the local legal determination to figure out 'how far you really 
need to go', vs just "here are the layers I used to build my project".)

>> The aim is to become able to:
>>
>> - map binaries to their corresponding upstream source packages (and
>> not to the "internal" source packages created by recipes by combining
>> multiple upstream sources and patches)
>> - map binaries to the source files that have been actually used to
>> build them - which usually are a small subset of the whole source
>> package
>>
>> With respect to IP compliance, this would allow to, among other things:
>>
>> - get the real license text for each binary file, by getting the
>> license of the specific source files it has been generated from
>> (provided by Fossology, for instance), - and not the main license
>> stated in the corresponding recipe (which may be as confusing as
>> GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause, or
>> even worse)
> 
> IIUC this is the difference between the "Declared" license and the
> "Concluded" license. You can report both, and I think
> create-spdx.bbclass can currently do this with its rudimentary source
> license scanning. You really do want both and it's a great way to make
> sure that the "Declared" license (that is the license in the recipe)
> reflects the reality of the source code.

And the thing to keep in mind is that in a given package the "Declared" is 
usually what a LICENSE file or header says.  But the "Concluded" has levels of 
quality behind them.  The first level of quality is "Declared".  The next level 
is automation (something like fossology), the next level is human reviewed, and 
the highest level is "lawyer reviewed".

So being able to inject SPDX information with Concluded values for evaluation 
and track the 'quality level' has always been something I wanted to do, but 
never had time.

At the time, my idea was a database (and/or bbappend) for each component that 
would included pre-processed SPDX data for each recipe.  This data would run 
through a validation step to show it actually matches the patched sources.  (If 
any file checksums do NOT match, then they would be flagged for follow up.)

>> - automatically check license incompatibilities at the binary file level.
>>
>> Other possible interesting things could be done also on the security side.
>>
>> This work intends to add a way to provide additional data that can be
>> used by create-spdx, not to replace create-spdx in any way.
>>
>> The sources with a long README are available at
>> https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/tinfoilhat/-/tree/srctracker/srctracker
>>
>> What do you think of this work? Would it be of interest to integrate
>> into YP at some point? Shall we discuss this?
> 
> This seems promising as something that could potentially move into
> core. I have a few points:
>   - The extraction of the sources to a dedicated directory is something
> that Richard has been toying around with for quite a while, and I
> think it would greatly simplify that part of your process. I would
> very much encourage you to look at the work he's done, and work on
> that to get it pushed across the finish line as it's a really good
> improvement that would benefit not just your source scanning.
>   - I would encourage you to not wait to turn this into a bbclass
> and/or library functions. You should be able to do this in a new
> layer, and that would make it much clearer as to what the path to
> being included in OE-core would look like. It also would (IMHO) be
> nicer to the users :)

Agreed, this looks useful.  The key is start turning it into one or more 
bbclasses now.  Things that work with the Yocto Project process.  Don't try to 
"post-process" and reconstruct sources.  Instead inject steps that will run your 
file checksums, build up your database as the source are constructed.  (i.e. 
do_unpack, do_patch..)

etc.

The key is, all of the information IS available.  It just may not be in the 
format you want.

--Mark

>>
>> Marta and Alberto
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1635): https://lists.openembedded.org/g/openembedded-architecture/message/1635
>> Mute This Topic: https://lists.openembedded.org/mt/93678489/3616948
>> Group Owner: openembedded-architecture+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [mark.hatle@kernel.crashing.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


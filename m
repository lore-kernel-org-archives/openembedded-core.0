Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.online.nl (smtp04.online.nl [194.134.41.34])
	by mail.openembedded.org (Postfix) with ESMTP id D77B472453
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:03:23 +0000 (UTC)
Received: from smtp04.online.nl (localhost [127.0.0.1])
	by smtp04.online.nl (Postfix) with ESMTP id 9D93AE01B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 17:03:21 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 17:03:21 +0100 (CET)
Message-ID: <54AAB5C9.9080803@topic.nl>
Date: Mon, 05 Jan 2015 17:03:21 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54A2C3B2.9010006@topic.nl>					<20141230175915.GB18678@crash.betafive.co.uk>		<54A44ADC.3010000@topic.nl>			
	<54A65B5E.4030504@topic.nl>				<1420190187.25779.15.camel@linuxfoundation.org>	<54A95A5A.70809@topic.nl>			<1420450079.25779.21.camel@linuxfoundation.org>	<54AA5C4C.60201@topic.nl>		<1420452462.25779.23.camel@linuxfoundation.org>	<54AA6945.7020501@topic.nl>	<1420457862.25779.25.camel@linuxfoundation.org>
	<54AA7EE5.2000304@topic.nl>
In-Reply-To: <54AA7EE5.2000304@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp04.online.nl)
Subject: Re: Bug: PR server changes the PKGV variable too
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
X-List-Received-Date: Mon, 05 Jan 2015 16:03:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/05/2015 01:09 PM, Mike Looijmans wrote:
> On 01/05/2015 12:37 PM, Richard Purdie wrote:
>> On Mon, 2015-01-05 at 11:36 +0100, Mike Looijmans wrote:
>>> ﻿On 01/05/2015 11:07 AM, Richard Purdie wrote:
>>>> On Mon, 2015-01-05 at 10:41 +0100, Mike Looijmans wrote:
>>>>> ﻿On 01/05/2015 10:27 AM, Richard Purdie wrote:
>>>>>> On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
>>>>>> Imagine you're not using gitpkgv. You set:
>>>>>>
>>>>>> PV = "x.y+${SRCPV}"
>>>>>>
>>>>>> Since SRCPV contains a revision hash, you can end up in a situation
>>>>>> where the version changes and you cannot upgrade the package since
>>>>>> the
>>>>>> hash didn't 'increase'.
>>>>>>
>>>>>> The PR server therefore combines with the git fetcher to add an
>>>>>> incremental number at the start of the SRCPV string and yes, in that
>>>>>> scenario, it acts as a PV server. This is actually working as
>>>>>> designed.
>>>>>
>>>>> Then the design is wrong. If a package chose to override PKGV
>>>>> manually, then
>>>>> the rest of the system should leave that value as is, and not touch
>>>>> it.
>>>>> Apparently the recipe author knows better, so please let him use
>>>>> that wisdom.
>>>>>
>>>>> Also, if you change the architecture of the package, the PR server
>>>>> will reset
>>>>> the version counter to 0 and break the upgrade path too. That was
>>>>> the problem
>>>>> that caused me to discover this problem, the PR server is making it
>>>>> hard to
>>>>> fix arch errors in recipes.
>>>>
>>>> You realise why it does that though? Imagine multiple MACHINE values
>>>> being built against a PR server. Each MACHINE will have different
>>>> package architecture values and different hashes. The 'PR' values
>>>> should
>>>> therefore be seen as different. If the system didn't do this, it would
>>>> increment PR for every MACHINE change.
>>>>
>>>> Ok, so you say, lets make it work against MACHINE. That fails in the
>>>> case where multiple MACHINES share a package architecture :/. Its not a
>>>> simple problem to try and deal with :(
>>>>
>>>> I make no claim the system is perfect or free from bugs but these
>>>> behaviours you're referring to are like this for various reasons. I'm
>>>> open to changing them but we need to address the underlying problems
>>>> like changing MACHINE above.
>>>>
>>>> There are several other issues with changing package architecture such
>>>> as the sstate files in the sysroot. There is an open bug for this and
>>>> right now, I simply don't know how to solve it properly :(.
>>>
>>> Yeah, I stand corrected, this is not something easily fixed.
>>>
>>> I'd still like to have a way to override the PR server. Is there a
>>> way to make
>>> the PR server ignore a package, or at least, have it NOT modify the PKGV
>>> variable for a package?
>>> And if not, would you accept a patch to add that functionality to the
>>> prserver
>>> system?
>>
>> I've not tested it but would something like:
>>
>> PRSERV_HOST_pn-XXX = ""
>>
>> work?
>>
>> There looks to be code to allow:
>>
>> PRSERV_HOST_XXX = ""
>>
>> to work too, looking at package.bbclass. Why, I have no idea :/. We
>> should probably remove that in favour of the standard override.
>
> That means I could also set PRSERV_HOST inside the recipe, I guess. That
> might be easier to manage. Anyway, good suggestions, I'll try them. That
> might be useful in reducing the strain on network and flash now that
> 300+ packages get upgraded if someone happens to patch libc.
>
>> Since I've just been looking at this, I'll write down an overview of
>> what goes on:
>>
>> PKGR contains ${PRAUTO}. The PKG{E,V,R} variables are only meant to be
>> accessed at packaging time. The code in package.bbclass,
>> package_get_auto_pr() runs at packaging time and sets PRAUTO with a
>> value from the PR server.
>>
>> The only exception to this is if the magic string "AUTOINC" is in PV. If
>> it is, AUTOINC is replaced with the value from the PR server. You could
>> ask why it sets PKGV with the value of PV and I honestly don't remember,
>> that could be an oversight.
>>
>> What this did mean is that we could jettison the autoincrement code from
>> the fetcher and just have one thing doing it.
>>
>> The PKGV being overwritten by PV does look like a bug and is worth
>> looking into. Its not the PR server at fault though, its what
>> package.bbclass is doing with the data. I would like to look at why it
>> was added that way as I worry there was some underlying reason :/.
>
> I see what you mean, in package.bbclass in  the "package_get_auto_pr"
> function:
>
>              if "AUTOINC" in pv:
>                  srcpv = bb.fetch2.get_srcrev(d)
>                  base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
>                  value = conn.getPR(base_ver, pkgarch, srcpv)
>                  d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
>
> I think this is the line that does it. It's surprising that it looks at
> PV in this part of the method, while it looks at PKGV for the "PR Server
> not active" case.
>
> And from looking at this code, the simple way to prevent this from
> happening is making sure that PV does NOT contain the AUTOINC string,
> which SRCPV will have by default when using git, and PV usually includes
> SRCPV.
>
> That would mean that if I set SRCPV to something that doesn't contain
> AUTOINC, this part of the packager would not fire and leave the PKGV as
> is. Now that would fix the issue for my particular case.

Indeed, if I set:
   SRCPV = "${@bb.fetch2.get_srcrev(d).replace('AUTOINC','X')}"
then the resulting PKGV is as i'd have expected because PV no longer 
triggers the substitution.

-- 
Mike Looijmans


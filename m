Return-Path: <mike.looijmans@topic.nl>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 337EA65CA8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 17:48:35 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id EF37698031
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 19:48:34 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 19:48:34 +0200 (CEST)
Message-ID: <53DE75F2.5070107@topic.nl>
Date: Sun, 03 Aug 2014 19:48:34 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53DE3841.2000305@topic.nl> <1407082041.6981.42.camel@ted>
	<53DE72CF.5080303@topic.nl>
In-Reply-To: <53DE72CF.5080303@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 17:48:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2014 07:35 PM, Mike Looijmans wrote:
> On 08/03/2014 06:07 PM, Richard Purdie wrote:
>> On Sun, 2014-08-03 at 15:25 +0200, Mike Looijmans wrote:
>>> I'm getting lots of warnings like this:
>>>
>>> """
>>> WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends on
>>> wireless-tools but its not a build dependency? [build-deps]
>>> """
>>>
>>> What does it actually mean? What does it want me to provide here?
>>>
>>> The message in itself is correct. The package only has a runtime
>>> dependency. It does not require the wireless-tools package to be built
>>> or otherwise present on the build system. But what is the QA issue here
>>> and how do I get rid of the message?
>>
>> The issue is that if you built an image that just depends on whichever
>> recipe builds enigma2-plugin-systemplugins-wirelesslan and you try and
>> install that into an image without something else depending on
>> wireless-tools, the build will fail.
>>
>> Sometimes (like this case) these are genuine runtime dependencies and
>> you therefore just need to make the dependency visible to bitbake.
>> Sometimes these can be floating autodetected dependencies which should
>> wither have been in DEPENDS or turned off with PACKAGECONFIG.
>>
>> In this case I'm going to guess that the plugin is part of a
>> PACKAGES_DYNAMIC and hence bitbake can't see the dependency until its
>> too late (once the package is built).
>>
>> Adding the package name to PACKAGES would probably allow bitbake to
>> "see" it and avoid the problem.
>>
>> Yes, bitbake could in theory go though all the RDEPENDS/RRECOMMENDS_*
>> variables and try and guess which ones to look at however it would kill
>> parsing time :/.
>
> And in this particular case, even that would not help - the dependencies
> are being calculated after the "install" task has completed. There's
> code in the recipe that parses the output of the plugins and then sets a
> bunch of RDEPENDS and similar values for the package.
>
> I think the easy workaround here would be to just add it to the DEPENDS
> list - this particular recipe has been ported along from ancient OE, and
> it already has to wait for tons of other things, because it builds about
> a hundres useless plugins. The newer plugin recipes tend to have a
> recipe each, so they don't cause this kind of problems.

Hmm, that did NOT work. I added everything it warned about to the 
DEPENDS list, but it did not make a difference. I still got the warnings.


-- 
Mike Looijmans


Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0C46E77A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:50:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s31Ho5Gq026366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 10:50:06 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Apr 2014 10:50:05 -0700
Message-ID: <533AFC4C.20902@windriver.com>
Date: Tue, 1 Apr 2014 12:50:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20140330013103.GD2428@jama> <533AF39A.6020400@windriver.com>
	<20140401174047.GR2425@jama>
In-Reply-To: <20140401174047.GR2425@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Quality of meta-oe metadata
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
X-List-Received-Date: Tue, 01 Apr 2014 17:50:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/14, 12:40 PM, Martin Jansa wrote:
> On Tue, Apr 01, 2014 at 12:12:58PM -0500, Mark Hatle wrote:
>> On 3/29/14, 8:31 PM, Martin Jansa wrote:
>>> Hi, sorry for longer e-mail, this is one of topic I would like to discuss
>>> on OEDAM (http://openembedded.org/wiki/OEDAM), but having some feedback and
>>> thoughts in advance will be very useful.
>>>
>>> As people can notice from my "State of bitbake world" e-mails or
>>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>> we never had "green" builds. There are always 20+ failed tasks in those
>>> big builds and just reading the numbers isn't good indicator of quality,
>>> because sooner you break something in dependency tree, fewer recipes will
>>> be actually tested, so fewer failed tasks often means that something
>>> important is broken.
>>
>> ...
>>
>>> 3) OE releases work great and don't invalidate sstate signatures so often, so my
>>>      feeling is that most developers and projects are just using releases and
>>>      less and less people do CI. People will start complaining that something
>>>      is broken in meta-oe only when they are upgrading their project from 1.5 to
>>>      1.6 when 1.6 is released and that could be too late for fixing meta-oe
>>>      issues.
>>
>> I agree, the success of what we're doing is certainly causing us 'different'
>> problems.  :)
>>
>>> What I'm trying to do with it:
>>>
>>> a) sending those e-mails and updating wiki, so that people can easily find
>>>      if some build failure is common or something which happens only for them
>>>      (something like oestats-client.bbclass page was providing in oe-classic)
>>>      It also includes log of QA issues which are usually easy to fix and great
>>>      way for new people to learn something about OE.
>>> b) trying to refuse all patches which cause new world issue (or new QA
>>>      warn/err) - sometimes missed in logs, because it's often "hidden" by some
>>>      other issue and hard to compare 40 issues from previous build with 38
>>>      from current.
>>>      Also the issues are often triggered later by changes somewhere else...
>>> c) fixing build/qa issues in recipes I've never used or don't even have
>>>      hardware to test - just based on assumption that something which builds
>>>      is better than broken build, even when it can have some issues in runtime.
>>> d) contacting people who added the recipe which is now failing, often
>>>      without reply for months even when I try it multiple times :/
>>
>> I agree with all of the above.  In fact I suspect you are going above and beyond
>> what you really need to.  Kudos for that BTW.
>>
>>> e) moving to "nonworking" directory to mark it as "known-to-be-broken",
>>>      last resort for recipes where the fix is complicated and it's not known
>>>      if someone is actually using it (because it was broken for months and
>>>      nobody replied).
>>>      + easy to find them, because they are still in repository (instead of
>>>        git rm + revert when someone fixes it)
>>>      - layer index probably doesn't find them, because "nonworking" directory
>>>        level isn't in BBFILES, so maybe meta-broken or meta-nonworking would be
>>>        better
>>>      ? some recipes are "broken" just because their dependency is broken, what
>>>        to do with such recipe, I usually just say that in commit message when
>>>        I'm moving them to "nonworking" with their broken dep.
>>
>> Have you considered using the blacklist system for this?
>>
>> You could do something like:
>>
>> conf/layer.conf:
>> include ${LAYERDIR}/conf/broken.inc
>>
>> conf/broken.inc:
>>
>> <can we ensure the blacklist system is in the system>
>>
>> BROKENMSG_layername = "The recipe is disabled due to a build failure.  If you
>> need this recipe, or have gotten it to work.  Please submit patches to <path>.
>> Otherwise this recipe will be removed in the future."
>>
>> # Recipe FOO is broken as of 2014-03-14, see ...
>> PNBLACKLIST[FOO] = "${BROKENMSG_layername}"
>>
>> # Recipe BAR is broken as of 2013-06-13, see ...
>> PNBLACKLIST[BAR] = "${BROKENMSG_layername}"
>>
>>
>> Then after a given amount of time, say one year? on the broken list -- we can
>> then remove the items.
>>
>> If the format of the comments is such that it can be easily parsed, then we can
>> even automate tracking of these things.
>>
>> (In cases where dependencies are causing the breakage, the message cause be
>> augmented with that information as well...)
>>
>> The advantage of the blacklist system is that if a user tries to use the recipe
>> they will hopefully see the blacklist message, it prevents having to git mv
>> recipes, and should be easier for people to find/fix the bad code via a simple
>> patch.  (And hopefully easier to remove old cruft!)
>
> Yes, that's another way of doing that and I was using it on world builds
> as well (but without including it in layer and layer.conf to make it
> "public")
>
> e.g.
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20140329_001343.log/world_mask.inc
>
> It definitely has the advantage that you can "document" it in the
> message and few more details in the file itself.
>
> Disadvantage from my POV was that I never included and enabled it in
> repo, so new people didn't know about it and will still see the issues
> when they try to build something broken.
>
> Another disadvantage was that I always felt, OK I'll mark this as broken
> with PNBLACKLIST and lets forget that it ever existed (sometimes I've
> uncommented include lines for this just to confirm that everything still
> fails - but not so often as "regular" builds).

Ya, it definitely prevents retry without a conscious change to a file.

> And last one: if I recall correctly, when I was using this it was hard
> to unblacklist something in your config, so if you wanted to test newer
> version or something you had to modify world_mask.inc first, which won't
> be very good for people if we include it by default.

To unblacklist, you would set PNBLACKIST[FOO] = ""

But of course, someone has to know then setting it to blank has the effect of 
removing the blacklist for their work.

--Mark

> Regards,
>
>> --Mark
>>
>>> What can we do better? How to motivate more people to do CI and send fixes?
>>> When we get to "green" state it will be easier to quickly spot new issues and
>>> easier to fix them, because it will be clear what's causing them.
>>>
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



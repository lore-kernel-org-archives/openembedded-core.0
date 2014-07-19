Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.online.nl (smtp04.online.nl [194.134.41.34])
	by mail.openembedded.org (Postfix) with ESMTP id 120F970589
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 18:38:25 +0000 (UTC)
Received: from smtp04.online.nl (localhost [127.0.0.1])
	by smtp04.online.nl (Postfix) with ESMTP id 0C838E4FF;
	Sat, 19 Jul 2014 20:38:25 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.online.nl (Postfix) with ESMTP;
	Sat, 19 Jul 2014 20:38:24 +0200 (CEST)
Message-ID: <53CABB20.7070004@topic.nl>
Date: Sat, 19 Jul 2014 20:38:24 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <53CA603D.4050900@topic.nl> <1405786878.22985.9.camel@ted>
In-Reply-To: <1405786878.22985.9.camel@ted>
X-Online-Scanned: by Cloudmark authority (on smtp04.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PRSERVER is killing settop boxes
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
X-List-Received-Date: Sat, 19 Jul 2014 18:38:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-7-2014 18:21, Richard Purdie wrote:
> On Sat, 2014-07-19 at 14:10 +0200, Mike Looijmans wrote:
>> For a hobby project (openpli.org) there are about a million boxes
>> running software built with OE.
>>
>> I recently upgraded its core to the current master. What now happens is
>> that if a package like gcc has been changed, it will not only rebuild
>> everything, but it will also give all packages a new PR number. When a
>> box in the field now runs "opkg upgrade", it will get 286 "new" packages
>> and will try to squeeze them into its flash filesystem (even though only
>> about 5 of these packages actually have different content). This is
>> likely to kill the box, as the packages installed later on will take up
>> more room in the flash system than when they were initially installed
>> from scratch, and many models are using over 90% of the NAND flash space
>> available already.
>>
>> Before the PRSERVER was made mandatory, we never had this problem.
>>
>> Is there a way we can get the old behaviour of having to explicitly set
>> the PR of each package?
>> Or at least, distinguish between "the package itself was modified" and
>> "some library it depended upon was altered and we built a new one just
>> to make sure, but it'll likely work just fine with the previously built
>> one, so don't update the PR of the dependent packages".
>
> The key question is how do you tell that?

Up until now, just by running it and see if it worked. In all those 
years, I cannot recall a situation that a minor library upgrade ever was 
incompatible with existing clients. Usually the build fails, if the 
library had been changed in some incompatible way.
(the closed source software CAM still running on these systems has been 
compiled years ago by an ancient compiler in some unknown garage in 
Eastern Europe somewhere, and even that binary still runs on today's 
images flawlessly)

> Its always been assumed that we should be able to add some kind of
> binary diff tooling onto the end result and then only upgrade the
> package, if it really did change (for whatever value of 'change' you
> configure).

That'd be a tough tool to write. Things like "build date" tend to end up 
in packages and even binaries, so I'd expect there's little change of 
building the same library twice and ending up with binary equal results. 
Other than running a test suite on target, I really don't have a clue 
how to detect whether a dependent package would need to be rebuilt.

 From that point, I totally agree that the obvious choice is to just 
rebuild the dependent one.

It's like discovering that an X-ray machine in the hospital is faulty. 
Calling back patients for a rerun of the exam will expose them to 
radiation, and thus will certainly harm them. Not calling them back may 
expose them to wrong diagnoses.

In this case, rebuilding libraries will harm because it will needlessly 
consume flash space. Not rebuilding them may lead to application failure.

Until the PR server was mandatorized, we defaulted to "rebuild the 
libraries, but only install them on new machines and let existing setups 
keep what they have". It's also going to be hurting our servers - we're 
pushing the montly multi-terabyte bandwidth limits already, most of that 
traffic is "opkg upgrade", and now the upgrade size threatens to become 
over ten times larger, we'll need to be looking for bandwidth sponsors soon.

> To be honest, I get depressed when I read things like this.

It's not a complaint against you personally or anyone else on the OE 
team. I just want you to know what's happening in your user community, 
and call for suggestions and ideas on how to better handle this. The 
compare tool you're talking about is a step into that direction. I think 
in essence the PR server is a good thing. There's just more to it than 
what meets the eye.

Honestly, would you have been happier had I never written about this and 
just went looking for an alternative on my own without ever talking to 
the OE-core people?

> There are
> key pieces of functionality we're missing and we simply do not have the
> developer manpower to be able to go and fix them all. I want to help but
> I'm drowning just trying to keep the day to day project and patches
> flowing and generally I never hear about the successes, just when
> people's builds break (which is always *my* fault and must be fixed
> *now*).

Oh boy, that sounds like a daytime job :)

I'm facing the opposite problem - I spend so much time keeping up with 
the OE updates, that I don't get around to do much about other things in 
our hobby team. You're moving so damn fast, the rest of the world just 
can't keep up!

> I'd love to see more organisations donating some man power to address
> issues like this. People see the project basically keeping moving and
> therefore decide to put manpower on things closer to home though. I wish
> I knew how to try and improve things, I don't even get the time to step
> back and think about that these days though :(.

If you happen to be in the neighbourhood, drop by and we'll grill 
someting on the BBQ and drink some alcoholic beverages if that'd help 
you relax :)

Be careful what you wish for though. More manpower will also mean that 
more patches will pile up on your doorstep...


-- 
Mike Looijmans


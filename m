Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U08Yc-0001Gs-Aj
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 11:37:01 +0100
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0TALBD5007590 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 05:21:12 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0TALADt004184 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 05:21:10 -0500
Received: (qmail 6769 invoked by uid 0); 29 Jan 2013 10:21:10 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 29 Jan 2013 10:21:10 -0000
Message-ID: <5107A295.2060307@topic.nl>
Date: Tue, 29 Jan 2013 11:21:09 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
In-Reply-To: <20130129094059.GI16904@jama.palm1.palmone.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 10:37:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2013 10:40 AM, Martin Jansa wrote:
> On Tue, Jan 29, 2013 at 10:29:07AM +0100, Mike Looijmans wrote:
>> I often have several hardware boards sharing 99% of periferals and
>> configuration. Usually they all have the exact same CPU, and the
>> difference is in the minor details like the screen resolution.
>>
>> In "classic" OE I was used to sharing the work, by just changing the
>> MACHINE variable I could create an image for a slightly changed board in
>> a matter of minutes.
>>
>> In OE-core this seems to be horribly broken, unless there's some other
>> procedure to follow.
>>
>> If I change the MACHINE, it insists on rebuilding all kinds of packages
>> that don't need rebuilding at all. Instead of minutes, it takes an hour
>> to switch machines. And if I change back, the same thing happens all
>> over again.
>>
>> In addition to needlessly rebuilding dozens of packages for the same
>> architecture, it often "starts" halfway through, so it tries to run the
>> "deploy" phase for a package while the workspace has already been
>> removed in the rm_work phase of the previous build. Which fails, so I
>> have to manually reset stamps for that package and let it start over
>> again (while usually the package shouldn't be rebuilt in the first place).
>>
>> Is building for several machines no longer supported in OE-core? Or is
>> there some secret way of setting up directories and variables that will
>> make it work as it used to?
>
> It's more strict and every machine now has own sysroot (so it's doing a
> bit more after MACHINE change then it did with OE-Classic), but it still
> works. I'm using it like this.

How are you using it? Because for me it doesn't work at all, it results 
in build errors and needless rebuilds on every switch. I've tried in 
three different environments, and it never works.

(Needless rebuild: Built package X for machine A. Switch to B, and it 
will build X again, which isn't needed because they're for the same 
architecture and the package isn't dependent on the machine. Switch back 
to A, and it will AGAIN build package X, which is beyond just needless, 
it's a bug in my opinion.)

> Use openembedded-core/scripts/sstate-diff-machines.sh to compare your
> machines and make sure that different checksums are only for
> MACHINE_ARCH recipes.

How? The tool only explains its commandline, but doesn't explain what 
it's supposed to do...

Mike.




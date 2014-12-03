Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0DA60E24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 13:14:44 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w7so12198617lbi.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 05:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ATZRntbC+3NZqMvPpSfSDnGdzW2+148aGWf5kn2WlQo=;
	b=FR4Tt19hRKHym35fuY4wPnumr+8G7fuHFd7VF2Mrj3Cawx29B+ae+5fZK+xux+Zxo0
	H5oluMAUVDX+Rm6nA6xH4e05xtE00eoW6PjcS1Ac7cjwoT7ijXNmJYTBVzrRU8ZeSfBc
	x7Paw4Z/S+WjMvNdHn6d5e7OjQ2P66yyDGls6pas9UF/iHK1sm2c28cKmxPCJ5mcjF/+
	p9AjD93GvqAKPih7V9pH0Xwqy687G4GslAFcLI+G7PvrHyylYjsnGae4736xiyJC9CWu
	H11wgpt4YeAJetGTjVH4tjnTPFTHll+bBhLfzGi4cOQj0YTE9IxIdmbLds0wHl8NUKIv
	rvPg==
MIME-Version: 1.0
X-Received: by 10.152.203.199 with SMTP id ks7mr4209200lac.31.1417612484951;
	Wed, 03 Dec 2014 05:14:44 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 3 Dec 2014 05:14:44 -0800 (PST)
In-Reply-To: <20141203122307.GB15731@lpalcu-linux>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
	<542056AF.8080009@windriver.com>
	<2558455.kgL2mNBB1h@peggleto-mobl5.ger.corp.intel.com>
	<20141203122307.GB15731@lpalcu-linux>
Date: Wed, 3 Dec 2014 08:14:44 -0500
Message-ID: <CADkTA4Ogy=K9sh80UqpH=AL9Bqas9W3S80-TF=T4TtiaTGcqMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Wed, 03 Dec 2014 13:14:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 7:23 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> Hi Paul,
>
> On Wed, Dec 03, 2014 at 12:00:31PM +0000, Paul Eggleton wrote:
>> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
>> > On 14-09-22 01:03 PM, Khem Raj wrote:
>> > > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
>> > >
>> > > <bruce.ashfield@windriver.com> wrote:
>> > >> But the reports we've been getting have been that externalsrc
>> > >> builds are working for kernels, and linux-yocto without the change
>> > >> in place, so I'm looking to reduce the patch footprint and re-submit.
>> > >
>> > > no, it cant work if folks were trying the usecase I have mentioned.
>> > > The fix is infact for
>> > > non linux-yocto kernels.
>> >
>> > I'll send out my updated patch shortly, it should fix both cases.
>>
>> Bruce, did you get around to doing this?
>>
>> At the moment I am trying to make my workflow tool ("devtool modify") work with
>> linux-yocto. I've at least got to the point where I can extract the
>> appropriate source from the recipe, but when I use externalsrc to point to it
>> and then try to build it, it doesn't even get past do_configure, so something
>> must be missing (make complains about missing targets, presumably because it's
>> running in ${B} and there's nothing in that directory).
>>
>> Do you expect linux-yocto + externalsrc to work at the moment in master? If
>> so, are there any special steps I need to do with respect to preparing the
>> external source tree that my tool might not be performing?
> FWIW, I'm using externalsrc to build non linux-yocto kernels but, to make it
> work, I had to overwrite the KERNEL_CONFIG_COMMAND:
>
> KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
>

For an externalsrc kernel, we've always skipped configure* completely.
If the user is
providing the kernel, it should also be configured. We don't want the
build system
changing anything at all,  including the config that is in place.

Bruce

> This might be the reason of your do_configure failure...
>
> I hope it helps,
> laurentiu
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


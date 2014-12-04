Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB2F601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:28:24 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pn19so12981535lab.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 21:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RKbuSyMI0uOBj1eLeiShwgGBdHsHdz81fjFocHxaP94=;
	b=vU4KjcH3TrIqLaI9zZbxa+CPY43LExQTnpYjhVmc+KfuGzAspTZQXplRZCwxdVmsph
	5hju7kwQlmi6YlcfERepCH60p8vAe44uwpqVPWvSUAYedDmqk3lo6HnH+YvPxjtrxKVh
	jZ4yFl0CYhaaWUQYsTJrNTmLyxQAo5VLwpQDSbdcm/pCl1emtO6b7JnAIRfZYEKjuCIE
	EWnNKEw80oJP/4gu1HiMQIkh1+YlL2k4tCWizFc4w1loY60It9J11j0r6BqhFwd+60JV
	Z+/ep2Kzk9BzdaZ5NLBsCqsfrujSPpRF4PnvDlmPGygtqLguPiljEgzEiIdlsBGMa85A
	10fg==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr7531295lac.83.1417670904398;
	Wed, 03 Dec 2014 21:28:24 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 3 Dec 2014 21:28:24 -0800 (PST)
In-Reply-To: <CADkTA4NobmfAEbYR+2bbSWsKBcJ=Cw3Qf0=+w9V5C26ATT=p+Q@mail.gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<20141203122307.GB15731@lpalcu-linux>
	<CADkTA4Ogy=K9sh80UqpH=AL9Bqas9W3S80-TF=T4TtiaTGcqMA@mail.gmail.com>
	<3308676.S190v0nn32@peggleto-mobl5.ger.corp.intel.com>
	<CADkTA4NobmfAEbYR+2bbSWsKBcJ=Cw3Qf0=+w9V5C26ATT=p+Q@mail.gmail.com>
Date: Thu, 4 Dec 2014 00:28:24 -0500
Message-ID: <CADkTA4OdPvV4+6wENW1G-9HMnnNgH_oH_Mz-WrMga0W7o_SWOw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 04 Dec 2014 05:28:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 11:50 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 9:36 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday 03 December 2014 08:14:44 Bruce Ashfield wrote:
>>> On Wed, Dec 3, 2014 at 7:23 AM, Laurentiu Palcu
>>>
>>> <laurentiu.palcu@intel.com> wrote:
>>> > Hi Paul,
>>> >
>>> > On Wed, Dec 03, 2014 at 12:00:31PM +0000, Paul Eggleton wrote:
>>> >> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
>>> >> > On 14-09-22 01:03 PM, Khem Raj wrote:
>>> >> > > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
>>> >> > >
>>> >> > > <bruce.ashfield@windriver.com> wrote:
>>> >> > >> But the reports we've been getting have been that externalsrc
>>> >> > >> builds are working for kernels, and linux-yocto without the change
>>> >> > >> in place, so I'm looking to reduce the patch footprint and
>>> >> > >> re-submit.
>>> >> > >
>>> >> > > no, it cant work if folks were trying the usecase I have mentioned.
>>> >> > > The fix is infact for
>>> >> > > non linux-yocto kernels.
>>> >> >
>>> >> > I'll send out my updated patch shortly, it should fix both cases.
>>> >>
>>> >> Bruce, did you get around to doing this?
>>> >>
>>> >> At the moment I am trying to make my workflow tool ("devtool modify")
>>> >> work with linux-yocto. I've at least got to the point where I can
>>> >> extract the appropriate source from the recipe, but when I use
>>> >> externalsrc to point to it and then try to build it, it doesn't even get
>>> >> past do_configure, so something must be missing (make complains about
>>> >> missing targets, presumably because it's running in ${B} and there's
>>> >> nothing in that directory).
>>> >>
>>> >> Do you expect linux-yocto + externalsrc to work at the moment in master?
>>> >> If
>>> >> so, are there any special steps I need to do with respect to preparing
>>> >> the
>>> >> external source tree that my tool might not be performing?
>>> >
>>> > FWIW, I'm using externalsrc to build non linux-yocto kernels but, to make
>>> > it work, I had to overwrite the KERNEL_CONFIG_COMMAND:
>>> >
>>> > KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes
>>> > '' | oe_runmake -C ${S} O=${B} oldconfig"
>>>
>>> For an externalsrc kernel, we've always skipped configure* completely.
>>> If the user is providing the kernel, it should also be configured. We don't
>>> want the build system changing anything at all,  including the config that is
>>> in place.
>>
>> OK, that makes sense - but all I'm doing is enabling externalsrc for the
>> kernel, and do_configure is still being executed. Perhaps that's something that
>> shouldn't be happening (needs to be added to SRCTREECOVEREDTASKS? We don't
>> normally cover do_configure for other recipes.)
>
> IMHO it should be, I have it inhibited here.
>
> Still trying to get my 1.8 work cleaned up for a RFC, and I'll send
> you what I have for
> this shortly as well.

I did manage to launch and build a 3.14 kernel externalsrc against master using
the WIP progress patches.

.. and it worked :)

I've just finished my other developer experience patches (initial
version), so this is
the next thing on my list to finish on for 1.8.

The patch that I currently have is broken as part of a rebase to
account for other
changes, but I did have the original patch, that has too large a
footprint (i.e. lots
of extra ${S} and ${B} manipulations that aren't all required. So I
tested using it.

That being said,  I pushed the working patch to poky-contrib
zedd/kernel-externalsrc,
so you can see what the baseline is.

I'm interested to hear if this hobbles along for you, and if not, what
breaks. I'm
building an externalsrc recipe that I put together some time ago .. so
if yours isn't
working, that could be the difference.

Bruce

>
> Bruce
>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


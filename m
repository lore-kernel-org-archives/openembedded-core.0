Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SoEXx-000439-MQ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 16:02:41 +0200
Received: by qcad10 with SMTP id d10so5140241qca.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LgiKbMVuBDSNkyW/ENsOhomfxorCiMie/NeIlb1oFwE=;
	b=Zd2ZeRZlFNHlo+mViTWTyFbkV/ceWUsvJy1nWCjZM5PP+Qa06RcBFI6iIC6N75xzT9
	qyF/uolbFJ1cD2T1cEWxvQD1TgFm74W63D93snWkgMBRxnzbgOpcgHC3bN2fSgm1CEwv
	WI8Qdta1H9/l+f1bT+U01/nDKdufXGw/u66NjWfiD3jXVHVzZD6YsfSD7FAmPlxH3M79
	lD4zhfxb0TvWeA2Z4qJ0VczTjYTn2fxBl/Wu82wYW0Xc7Rdjp5ZwRKuu6IeS3eYPhBdI
	gxjg2ROafPG7tSYZ59j4bEvVee0kT8G5p+qIi0rXaPodgzVP+G0m4JypYcyi9plu61yZ
	iY4Q==
MIME-Version: 1.0
Received: by 10.229.136.139 with SMTP id r11mr6642548qct.42.1341841891830;
	Mon, 09 Jul 2012 06:51:31 -0700 (PDT)
Received: by 10.229.41.5 with HTTP; Mon, 9 Jul 2012 06:51:31 -0700 (PDT)
In-Reply-To: <1341841632.6761.216.camel@trz-ThinkPad-T420>
References: <cover.1341606068.git.tom.zanussi@intel.com>
	<1341724701.6761.177.camel@trz-ThinkPad-T420>
	<4FFA8E6C.90504@linux.intel.com>
	<1341841632.6761.216.camel@trz-ThinkPad-T420>
Date: Mon, 9 Jul 2012 09:51:31 -0400
Message-ID: <CADkTA4NPXNV7JMDM_akEoTU2A13bq4cr3pQaDkV0A_pNjsfiPQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] perf-scripting/perf-tui features, v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 14:02:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 9, 2012 at 9:47 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Mon, 2012-07-09 at 00:55 -0700, Saul Wold wrote:
>> On 07/07/2012 10:18 PM, Tom Zanussi wrote:
>> > On Fri, 2012-07-06 at 15:29 -0500, tom.zanussi@intel.com wrote:
>> >> From: Tom Zanussi <tom.zanussi@intel.com>
>> >>
>> >> This patchset adds perf-scriping and perf-tui features as
>> >> a per-arch thing rather than per-machine, as suggested by
>> >> Richard Purdie.
>> >>
>> >> I just started testing this, it works so far, but thought
>> >> I'd put it out there now in case there were comments before
>> >> putting too much effort into that, and possibly giving other
>> >> people a chance to try it out.
>> >>
>> >
>> > Looks fine after more build-testing: qemux86, qemux86-64, crownbay,
>> > sugarbay, qemuarm and qemuppc both with and without perf-scripting and
>> > perf-tui, and builds without perf as well all build fine here.
>> >
>> Tom, I am sorry, I am not sure how else to say this, I have tested
>> master with the only the following change and I am still getting the
>> the setup.py failure mentioned.
>>
>> I am not sure what else to suspect at this point, this is Master plus 3
>> commits, please help me understand where I have gone wrong.
>>
>> This is the branch I have tested, which is 3 commits pasted Master:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgw/fail
>>
>
> Saul,
>
> It's because your kernel hasn't advanced the SRCREVs to include the new
> commits - the above patches won't work without the associated kernel
> changes.  So if you're build-testing qemux86-64 for instance, you'd want
> to change the following line in linux_yocto_3.4.bb from:
>
> SRCREV_machine_qemux86-64 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
>
> to include the last commit of the associated kernel patch series i.e.the
> top of the common-pc-64 branch:
>
> SRCREV_machine_qemux86-64 ?= "49f1599b2ce0288599805b5364b895f5a9febb3e"

.. and I'm about to send a new set of SRCREVs that have this and
some more. I was just waiting to see how these conversations played out.

Cheers,

Bruce

>
> That should get the kernel changes associated with the patchset into
> your kernel and everything should build nicely...
>
> Tom
>
>> Thanks
>>       Sau!
>>
>> > Tom
>> >
>> >> The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
>> >>    Robert P. J. Day (1):
>> >>          bitbake: usermanual: Fix missing markup
>> >>
>> >> are available in the git repository at:
>> >>
>> >>    git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v2
>> >>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v2
>> >>
>> >> Tom Zanussi (3):
>> >>    perf: add perf.inc
>> >>    perf: add arch-specific perf-scripting feature
>> >>    perf: add arch-specific perf-tui feature
>> >>
>> >>   meta/recipes-kernel/perf/perf.inc    |   30 ++++++++++++++++++++++++++++++
>> >>   meta/recipes-kernel/perf/perf_3.4.bb |   18 +++++++++++++++---
>> >>   2 files changed, 45 insertions(+), 3 deletions(-)
>> >>   create mode 100644 meta/recipes-kernel/perf/perf.inc
>> >>
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> >
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



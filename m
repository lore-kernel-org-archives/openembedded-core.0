Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R8zIf-0003Z4-K4
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 20:56:10 +0200
Received: by vcbfl17 with SMTP id fl17so5432471vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tj01l3uMSbYF93BIZxguD/Nqm0Zwg6HjM08T2pkM7bU=;
	b=G2St0CkNnSudRa/RPlNwOTU457WYqVbxotiCZoQvNf6klIH8gabFU4NdN6PV7zEnUK
	95s8Vpw/ZwAc8/1rkz5oYMsLgvqB14+iL8y2gDzw9ZAx7tJdihgDH77E1sS2thc1uz9x
	sbie+ri4z8ZZkZcA9PO4hMkvLGbpEnVQwsBsU=
MIME-Version: 1.0
Received: by 10.52.69.18 with SMTP id a18mr8649747vdu.430.1317235840086; Wed,
	28 Sep 2011 11:50:40 -0700 (PDT)
Received: by 10.52.181.226 with HTTP; Wed, 28 Sep 2011 11:50:39 -0700 (PDT)
In-Reply-To: <89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
Date: Wed, 28 Sep 2011 22:50:39 +0400
Message-ID: <CALT56yPVhyu_z8caXCWeJKqo4FbRKri=KzfxMb-9OQnF+x6SSg@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 28 Sep 2011 18:56:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9/28/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>
> Op 28 sep. 2011 om 09:54 heeft Richard Purdie
> <richard.purdie@linuxfoundation.org> het volgende geschreven:
>
>> On Tue, 2011-09-27 at 18:40 -0500, Koen Kooi wrote:
>>>
>>> Op 27 sep. 2011 om 08:52 heeft Bruce Ashfield <bruce.ashfield@gmail.com>
>>> het volgende geschreven:
>>>
>>>> On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
>>>> <dbaryshkov@gmail.com> wrote:
>>>>> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present
>>>>> in
>>>>> meta-oe kernel.bbclass. Several machines depend on this functionality.
>>>>
>>>> I don' t have a big problem with this, since the change is obviously
>>>> harmless if it
>>>> doesn't need to be used. But similar to my comment on patch 3/5, is
>>>> there any
>>>> history/technical reasons we can capture here ?
>>>>
>>>> I did a quick search to dig up a bit on this myself, but a summary
>>>> would definitely
>>>> help, since I see that this has a long and sometimes twisting history.
>>>> Is it as
>>>> simple as ?
>>>>
>>>> "A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>>>> rebuilds for kernel and external modules"
>>>
>>> It is that simple :)
>>
>> I have reservations about this patch given we soon plan to stop needing
>> to bump PR values. This patch is actually a perfect example of how brain
>> dead the current manual PR bumping is and why we need something better.
>> I don't want half the code in the repo to be a mass of PR values which
>> need to be incremented manually under weird and wonderful circumstances
>> which is where the direction things are currently going...
>>
>> I'd like to hold off on this one.
>
> This patch improves the current situation and I don't foresee the autoPR
> code working soon

As another point for this patch: I'd like to ask Koen to drop
kernel.bbclass from
meta-oe. After do_uboot_mkimage this is the only significant difference. And
unfortunately this feature is already used on several machines. Quick
grep return the following results. Koen, could you comment on this?

$ grep MACHINE_KERNEL_PR */{,*/}c* -r
meta-openpandora/conf/machine/include/omap3.inc:MACHINE_KERNEL_PR = "r101"
meta-openpandora/conf/machine/omap3-pandora.conf:MACHINE_KERNEL_PR = "r3"
meta-texasinstruments/conf/machine/include/davinci.inc:MACHINE_KERNEL_PR = "r51"
meta-texasinstruments/conf/machine/include/omap3.inc:MACHINE_KERNEL_PR = "r105"
meta-texasinstruments/conf/machine/include/ti814x.inc:MACHINE_KERNEL_PR = "r1"
meta-texasinstruments/conf/machine/include/ti816x.inc:MACHINE_KERNEL_PR = "r2"
meta-smartphone/meta-nokia/conf/machine/nokia900.conf:MACHINE_KERNEL_PR = "r68"
meta-smartphone/meta-palm/conf/machine/include/palmpre.inc:MACHINE_KERNEL_PR
= "r0"
meta-texasinstruments/recipes-ti/c6accel/ti-c6accel.inc:PR =
"${MACHINE_KERNEL_PR}"
meta-texasinstruments/recipes-ti/codec-engine/ti-codec-engine.inc:PR =
"${MACHINE_KERNEL_PR}"
meta-texasinstruments/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb:PR="${MACHINE_KERNEL_PR}"
openembedded-core/meta/classes/kernel.bbclass:    machine_kernel_pr =
bb.data.getVar('MACHINE_KERNEL_PR', d, True)



-- 
With best wishes
Dmitry



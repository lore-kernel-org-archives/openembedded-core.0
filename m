Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9CF60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:09:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4J79XJN021106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 00:09:34 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 00:09:33 -0700
Message-ID: <555AE1AB.8070907@windriver.com>
Date: Tue, 19 May 2015 15:09:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Christopher Larson
	<clarson@kergoth.com>
References: <55555B65.80600@windriver.com>
	<1616768.92EeT3bkJG@peggleto-mobl.ger.corp.intel.com>
	<CABcZAN=iM=U1F01=Gpt_vCdksSht8LPU5mAYHBvq_qn4pdt8mQ@mail.gmail.com>
	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Tue, 19 May 2015 07:09:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05/18/2015 11:32 PM, Paul Eggleton wrote:
> On Monday 18 May 2015 08:15:05 Christopher Larson wrote:
>> On Mon, May 18, 2015 at 5:04 AM, Paul Eggleton <
>> paul.eggleton@linux.intel.com> wrote:
>>> On Monday 18 May 2015 08:52:04 Otavio Salvador wrote:
>>>> On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>>
>>>>> On Monday 18 May 2015 09:52:50 Robert Yang wrote:
>>>>>> On 05/17/2015 05:34 AM, Richard Purdie wrote:
>>>>>>> On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
>>>>>>>> Is is useful/possible if we add something like bitbake <recipe>
>>>>>>>> -cmenuconfig, just like kernel's make menuconfig ?
>>>>>>>>
>>>>>>>> We can use the menuconfig to config the vars such as MACHINE,
>>>>>>>> DL_DIR, DISTRO_FEATURES, MACHINE_FEATURES and all the variables
>>>>>>>> which are configurable, I think that this would help the newbie a
>>>>>>>> lot.
>>>>>>>>
>>>>>>>> I think that we can add a menuconfig.bbclass (or other names) to
>>>>>>>> do this, and I'd like to work on it.
>>>>>>>
>>>>>>> Why would you want to specify a <recipe> when configuring MACHINE?
>>>>>>> I understand why you're thinking this but it isn't well thought out
>>>>>>> and in this form would confuse users more than help them.
>>>>>>>
>>>>>>> I don't think the system will even parse without a valid MACHINE,
>>>>>>> let alone execute tasks.
>>>>>>
>>>>>> I meant that we need something to help configure the build easier, it
>>>>>> can generate something like local.conf.append, not configure the
>>>>>> recipe.
>>>>>>
>>>>>> The example "bitbake <recipe> -cmenuconfig" wasn't right enough, it's
>>>>>> just a rough thought, we can use the current default local.conf
>>>>>> (MACHINE = qemux86) to make system parse.
>>>>>>
>>>>>> The problem is that we have many bbclasses in oe-core, a lot of them
>>>>>> has specify configurations, and also a lot of vars in the conf file
>>>>>> such as bitbake.conf, it's not easy to know how and what to config,
>>>>>> especially, for newbies. The "bitbake -cmenuconfig" maybe not a good
>>>>>> idea, I think that we need something to help config the build
>>>>>> (generate local.conf) easier, do you have any suggestions, please ?
>>>>>
>>>>> This is likely the direction we will be going in with the Toaster web
>>>>> UI - with a web-based tool we can present a much friendlier interface
>>>>> and have the chance to link to other information, for example we can
>>>>> link to the appropriate manual section for individual variables (and
>>>>> in future error messages, classes, etc.), analyse the output of the
>>>>> build, manage multiple sets of configuration, etc. These are things
>>>>> that would be difficult to do practically from the command line.
>>>>
>>>> Toaster is nice but we shouldn't stop improving cmdline use as the
>>>> first won't work for some use-cases.
>>>
>>> Sure, I'm pointing out that this kind of thing is being worked on in a
>>> slightly different context, it's not that nothing is being done in this
>>> area.
>>
>> A good first step for both may be to add more typing information to the
>> metadata, so the UI can present something more intelligent than a bunch of
>> text boxes for text input. I expect that would be useful for any
>> configuration UI, whether toaster or console.
>
> Indeed, this is something I'd like to see as well. There are already
> situations where we need to know the type of various variables (e.g. in
> buildhistory, where we have some of the variable typing hardcoded in the
> absence of proper definition within the metadata).
>
>> I’d certainly find a curses / menuconfig style interface to be interesting,
>> I’m sure there are folks who would find it useful, as long as it’s done
>> well.
>
> Sure, I wouldn't object to it either, but the important thing is someone not
> only needs to create it, but also maintain it in the future. Ideally it would
> also make use of some underlying definitions / code that would be re-usable
> elsewhere (as you're suggesting).
>
>> My question would be, how does the UI determine what variables to present?
>> Do we hardcode the list of variables they might want to edit, or provide
>> that information in the metadata in some fashion?
>
> I'd certainly prefer to define as much as possible in the metadata. Truth be

Has a uniform backend for configuration sounds like a good idea, here are
some rough thoughts that we can do in metadata, please feel free to give
your comments:

1) Add a conf file, bbclass or bb which contains the configable var list
    for the build, for example, DISTRO, MACHINES, DISTRO_FEATURES,
    PACKAGE_CLASSES and so on, we need maintain this file manually, we can
    discuss what is configurable in the mailing list, it may cost us a few
    time, but it is really good for OOBE, and would make the new user's
    life more easier.

2) Other layer can extend the configable var list easily.

3) Suppose we call the file config-build (.conf, .bbclass or .bb).

4) The UIs (toaster UI, web HOB, or menuconfig) can invoke the contents in
    config-build and display them.

5) The format of config-build can be:
    CONFIG_MACHINE[keys] = "machine1, machine2, ..."
    # The machines should be got automatically from a function.
    CONFIG_MACHINE[doc] = "xxx"
    # Re-use the MACHINE[doc] in meta/conf/documentation.conf
    [snip]

    CONFIG_IMAGE_FSTYPES[keys] = "typ1, type2, ..."
    CONFIG_IMAGE_FSTYPES[doc] = "xxx"
    CONFIG_IMAGE_FSTYPES[bbclass] = "image"
    # The required bbclass.
    [snip]

6) The result will be saved to a file such as local.conf.extend, and
    local.conf will include/require it.


Any comments is appreciated.

// Robert

> told we have defined a bit more than I'd like in the way of OE-specific
> knowledge in Toaster itself; my intent was that we'd come back and clean up a
> lot of it later where practical, but of course that does mean improving what
> we expose on the metadata side, and sometimes that's really quite difficult.
>
> Cheers,
> Paul
>


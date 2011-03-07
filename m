Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PwdNs-0007Ln-FB
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 17:34:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2011 08:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,277,1297065600"; d="scan'208";a="664684496"
Received: from unknown (HELO [10.255.12.179]) ([10.255.12.179])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2011 08:30:45 -0800
Message-ID: <4D750834.2060803@linux.intel.com>
Date: Mon, 07 Mar 2011 08:30:44 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1299267630.git.sgw@linux.intel.com>	<e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>	<A53A0FEC-74B3-483C-916C-EB87748A1AC8@dominion.thruhere.net>	<4D715D30.3030608@linux.intel.com>	<EEFD338A-726B-4502-B995-442E9AB37B9D@dominion.thruhere.net>	<8BD56976-D3F5-41F0-8CD6-9CF4B3CBB6C1@dominion.thruhere.net>
	<4D7173CE.2090104@linux.intel.com>
In-Reply-To: <4D7173CE.2090104@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, poky <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 04/13] module: build hostprogs for each module
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
X-List-Received-Date: Mon, 07 Mar 2011 16:34:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2011 03:20 PM, Darren Hart wrote:
> On 03/04/2011 02:30 PM, Koen Kooi wrote:
>>
>> Op 4 mrt 2011, om 23:28 heeft Koen Kooi het volgende geschreven:
>>
>>>
>>> Op 4 mrt 2011, om 22:44 heeft Darren Hart het volgende geschreven:
>>>
>>>> On 03/04/2011 12:04 PM, Koen Kooi wrote:
>>>>>
>>>>> Op 4 mrt 2011, om 20:42 heeft Saul Wold het volgende geschreven:
>>>>>
>>>>>> From: Darren Hart<dvhart@linux.intel.com>
>>>>>>
>>>>>> This fixes [BUGID #241]
>>>>>>
>>>>>> The kernel hostprogs are built for the host architecture. They
>>>>>> should not be
>>>>>> deployed to the target, and they should not be included in an
>>>>>> sstate package
>>>>>> which might get reused on a host of a different architecture.
>>>>>>
>>>>>> As we don't build many out-of-tree modules, this patch takes the
>>>>>> approach of
>>>>>> building the hostprogs as part of the module compile process with a
>>>>>> do_compile_prepend() routine in module.bbclass.
>>>>>>
>>>>>> We don't have to clean the hostprogs as modules depend on the
>>>>>> kernel being
>>>>>> populate_staging, so its done with the staging directory by the
>>>>>> time we run.
>>>>>>
>>>>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>>>>> CC: Gary Thomas<gary@mlbassoc.com>
>>>>>> ---
>>>>>> meta/classes/module.bbclass | 12 +++++++++++-
>>>>>> 1 files changed, 11 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/module.bbclass
>>>>>> b/meta/classes/module.bbclass
>>>>>> index d16d462..bbceaf7 100644
>>>>>> --- a/meta/classes/module.bbclass
>>>>>> +++ b/meta/classes/module.bbclass
>>>>>> @@ -3,6 +3,13 @@ DEPENDS += "virtual/kernel"
>>>>>>
>>>>>> inherit module-base
>>>>>>
>>>>>> +# Ensure the hostprogs are available for module compilation
>>>>>> +module_do_compile_prepend() {
>>>>>> + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>>>>> + oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>>>>>> + -C ${STAGING_KERNEL_DIR} scripts
>>>>>> +}
>>>>>> +
>>>>>> module_do_compile() {
>>>>>> unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>>>>> oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR} \
>>>>>> @@ -15,7 +22,10 @@ module_do_compile() {
>>>>>
>>>>> Why not put it in do_compile itself?
>>>>
>>>> My rationale was that a module recipe may override do_compile for
>>>> one reason or another, but they will still need the hostprogs which
>>>> we stripped in kernel.bbclass. This way, even if they override
>>>> do_compile, the _prepend will still get run and prepare the
>>>> hostprogs.
>>>
>>> Are you sure that actually works? AIUI bitbake will fold the compile
>>> and prepend into one when you try to override it.
>>
>> What I actually meant to say is: If you need to prepend it to
>> do_compile, even when someone will override it, use addtask to insert
>> it between configure and compile. That makes the intention a lot
>> clearer and isn't depending on faulty bitbake behaviour.
>
> You could be right, I'm not terribly familiar with how the "inheritance"
> model works. It seems to me the "addtask" method would work regardless
> as you suggest, and I have no objection to taking that route.
>
> Richard, do you have a preference? Can you clear up the inheritance
> question?
>

Had a chat with Richard. His suggestion was to use a new function, ie 
do_hostprogs, which do_compile() calls. If a recipe overrides 
do_compile() it can call do_hostprogs() or manage it on its own. I'll do 
some testing and send out a follow-on patch.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



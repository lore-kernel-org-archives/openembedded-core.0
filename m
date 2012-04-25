Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMqy3-0007gG-59
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 03:24:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2012 18:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="134943570"
Received: from unknown (HELO envy.home) ([10.255.12.165])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2012 18:14:48 -0700
Message-ID: <4F974FE9.5030402@linux.intel.com>
Date: Tue, 24 Apr 2012 18:14:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <1335217712-10154-1-git-send-email-obi@opendreambox.org>
	<4F974557.1000006@linux.intel.com>
	<4F974863.8000808@opendreambox.org>
In-Reply-To: <4F974863.8000808@opendreambox.org>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Wed, 25 Apr 2012 01:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/24/2012 05:42 PM, Andreas Oberritter wrote:
> On 25.04.2012 02:29, Darren Hart wrote:
>>
>>
>> On 04/23/2012 02:48 PM, Andreas Oberritter wrote:
>>> * depmod already gets executed by pkg_postinst_kernel-image.
>>>
>>> * If you build a module using module.bbclass,
>>>   pkg_postinst returns 1 in do_rootfs, causing
>>>   pkg_postinst to run again on first boot. To
>>>   improve this situation, I copied pkg_postinst
>>>   from kernel.bbclass to module.bbclass. This was
>>>   rejected by Koen, because he doesn't like the
>>>   code from kernel.bblcass, which uses
>>>   ${STAGING_DIR_KERNEL}. Richard then suggested
>>>   that calling depmod during do_rootfs wasn't
>>>   necessary at all, because it already gets done by
>>>   kernel-image.
>>>
>>
>> Thanks for adding that in. I'm fine not addressing the reliance on the
>> existence of $D for now (no worse than it was).
> 
> Can you explain what could be improved?'

I did in the previous thread:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/021419.html

But, I do not think this should hold up your patch.

> 
>> Some whitespace issues
>> persist in this version though.
> 
> No. See below.
> 
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>>  meta/classes/kernel.bbclass |    4 +---
>>>  meta/classes/module.bbclass |    7 +++----
>>>  2 files changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 3519e7c..c21ab96 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -276,9 +276,7 @@ fi
>>>  }
>>>  
>>>  pkg_postinst_modules () {
>>> -if [ -n "$D" ]; then
>>> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>>> -else
>>> +if [ -z "$D" ]; then
>>>  	depmod -a
>>>  	update-modules || true
>>>  fi
>>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>>> index 53c16b7..91628e4 100644
>>> --- a/meta/classes/module.bbclass
>>> +++ b/meta/classes/module.bbclass
>>> @@ -37,15 +37,14 @@ module_do_install() {
>>>  }
>>>  
>>>  pkg_postinst_append () {
>>> -	if [ -n "$D" ]; then
>>> -		exit 1
>>> -	fi
>>> +if [ -z "$D" ]; then
>>>  	depmod -a
>>>  	update-modules || true
>>> +fi
>>>  }
>>>  
>>>  pkg_postrm_append () {
>>> -	update-modules || true
>>> +update-modules || true
>>
>> This appears to be purely a whitespace change - and for the worse.
>> Please drop this from the patch.
> 
> This just makes it equal to pkg_postrm from kernel.bbclass.
> 
> Code in pkg_postrm etc. gets copied to the postinst scripts verbatim.
> Therefore any indentation results in strangely indented scripts inside
> the package.

I see, I suppose that makes sense. Not sure if there is a precedent
here. Personally I'd prefer the code we write and maintain look right
rather than the generated bits. But that's not my call. In any case, if
it needs explanation here, it should also be in the changelog. I
wouldn't hold up this patch for it at this point.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



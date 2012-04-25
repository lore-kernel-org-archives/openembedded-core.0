Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMtgp-0001qA-35
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 06:18:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2012 21:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92800597"
Received: from unknown (HELO envy.home) ([10.255.12.165])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2012 21:09:13 -0700
Message-ID: <4F9778CB.5050204@linux.intel.com>
Date: Tue, 24 Apr 2012 21:08:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <1335217712-10154-1-git-send-email-obi@opendreambox.org>
	<4F974557.1000006@linux.intel.com>
	<4F974863.8000808@opendreambox.org>
	<4F974FE9.5030402@linux.intel.com>
	<4F975780.8080207@opendreambox.org>
In-Reply-To: <4F975780.8080207@opendreambox.org>
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
X-List-Received-Date: Wed, 25 Apr 2012 04:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/24/2012 06:46 PM, Andreas Oberritter wrote:
> On 25.04.2012 03:14, Darren Hart wrote:
>>
>>
>> On 04/24/2012 05:42 PM, Andreas Oberritter wrote:
>>> On 25.04.2012 02:29, Darren Hart wrote:
>>>>
>>>>
>>>> On 04/23/2012 02:48 PM, Andreas Oberritter wrote:
>>>>> * depmod already gets executed by pkg_postinst_kernel-image.
>>>>>
>>>>> * If you build a module using module.bbclass,
>>>>>   pkg_postinst returns 1 in do_rootfs, causing
>>>>>   pkg_postinst to run again on first boot. To
>>>>>   improve this situation, I copied pkg_postinst
>>>>>   from kernel.bbclass to module.bbclass. This was
>>>>>   rejected by Koen, because he doesn't like the
>>>>>   code from kernel.bblcass, which uses
>>>>>   ${STAGING_DIR_KERNEL}. Richard then suggested
>>>>>   that calling depmod during do_rootfs wasn't
>>>>>   necessary at all, because it already gets done by
>>>>>   kernel-image.
>>>>>
>>>>
>>>> Thanks for adding that in. I'm fine not addressing the reliance on the
>>>> existence of $D for now (no worse than it was).
>>>
>>> Can you explain what could be improved?'
>>
>> I did in the previous thread:
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/021419.html
> 
> Sorry, I must have missed the inline comments when I replied to that mail.
> 
> From the manpage of test(1):
> 
>        -d FILE
>               FILE exists and is a directory
> 
>        -z STRING
>               the length of STRING is zero
> 
> I'm not sure what using -d should accomplish. (Virtually?) all postinst
> scripts in OE test for $D's emptiness to decide whether they are called
> offline (during do_rootfs) or online (on the target), so if a package
> manager sets $D, it should rather stop doing that, instead of relying on
> $D not being a directory by chance.

If it's standard throughout OE then it's really not worth discussing for
this patch. It seems like a fragile method to me, but in the event of a
problem we'd have a much larger issue on our hands.

So, looks good to me. Thanks for patiently addressing the feedback.

Acked-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



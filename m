Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TsGbO-0002us-5n
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 18:35:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2013 09:19:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="268751529"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.53])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 09:19:52 -0800
Message-ID: <50EB03B8.9050106@linux.intel.com>
Date: Mon, 07 Jan 2013 09:19:52 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: koansoftware@gmail.com
References: <1357565963-21367-1-git-send-email-m.cavallini@koansoftware.com>
	<50EAF39C.20202@linux.intel.com> <50EB0172.7010806@gmail.com>
In-Reply-To: <50EB0172.7010806@gmail.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH] kernel.bbclass: kernel_do_install fails with 2.6 kernel recipes
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
X-List-Received-Date: Mon, 07 Jan 2013 17:35:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/07/2013 09:10 AM, Marco wrote:
> Il 07/01/2013 17:11, Darren Hart ha scritto:
>> Hi Marco,
>>
>> On 01/07/2013 05:39 AM, Marco Cavallini wrote:
>>>   * old 2.6.x kernels don't have $kerneldir/tools directory
>>>   * so we got this error:
>>>   * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
>>>   * ERROR: Function failed: do_install
>>>
>>> Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
>>> ---
>>>   meta/classes/kernel.bbclass | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index aee8a77..06b23e0 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -204,8 +204,10 @@ kernel_do_install() {
>>>   		rm -f $kerneldir/$entry
>>>   	done
>>>
>>> -	# Fix SLANG_INC for slang.h
>>> -	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>>
>> Please include a comment here describing why this was needed. Something
>> like:
>>
>> 	# Linux 2.6.x kernels don't have a tools directory
>>
>> (Replace .x with the appropriate version of course)
>>
>> Otherwise, looks good to me. Thanks!
>>
>>> +	if [ -f $kerneldir/tools/perf/Makefile ]; then
>>> +		# Fix SLANG_INC for slang.h
>>> +		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>>> +	fi
>>>   }
>>>
>>>   sysroot_stage_all_append() {
>>>
>>
> 
> 
> Hi Darren,
> the comment describing why this was needed was in the patch header, is 
> in these four lines:
> 
>   * old 2.6.x kernels don't have $kerneldir/tools directory
>   * so we got this error:
>   * sed: can't read 
> ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No 
> such file or directory
>   * ERROR: Function failed: do_install
> 

Yes :-) The point being that it should be in the code itself so someone
reading the code can understand why the test is there without having to
use git blame and git log to discover it.

--
Darren

> I haven't specified the 2.6 version because I thought that all 2.6 
> version don't have a 'tools' directory.
> BTW I patched it because with 2.6.28 and 2.6.30 it failed.
> 
> 
> Cordiali Saluti / Kindest Regards / Mit freundlichen Grüßen
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel



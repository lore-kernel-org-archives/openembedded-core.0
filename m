Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1T2NsT-0007gz-Ok
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 16:50:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2012 07:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="203562620"
Received: from unknown (HELO envy.home) ([10.255.13.26])
	by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2012 07:37:15 -0700
Message-ID: <502E56A8.3080109@intel.com>
Date: Fri, 17 Aug 2012 07:35:20 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Liang Li <liang.li@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
	<1345200782.26132.18.camel@ted> <20120817130151.GA1416@localhost>
In-Reply-To: <20120817130151.GA1416@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
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
X-List-Received-Date: Fri, 17 Aug 2012 14:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/17/2012 06:01 AM, Liang Li wrote:
> On 2012-08-17 18:53, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2012-08-17 at 18:00 +0800, Liang Li wrote:
>>> I am totally confused, you mentioned 'general kernel do_install', I
>>> assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
>>> the fix upstream in the mainline kernel', how could that happen?
>>>
>>> We are discussing about the solution to 'fix the compile warning to
>>> error' stuff that triggered by the '-I/usr/include/slang', right?
>>
>> Yes.
>>
>>>  We do not necessarily have to change recipe to fix it since the issue
>>> is not introduced by the recipe, the hard coded '-I/usr/include/slang'
>>> in the Makefile cause the issue, we can fix the root cause by kernel
>>> patch(other than just comment the line out). I see your previous patch
>>> to kernel, by comment out the '-I/usr/include/slang' line in the
>>> Makefile, is the same behavior, but we won't have the change(comment
>>> out -I.. in Makefile) upstream to mainline, right?
>>
>> I am suggesting that firstly, someone send a patch to the mainline
>> kernel which changes -I/usr/include/slang to -I=/usr/include/slang in
>> that Makefile.
>>
>> Secondly, I'm suggesting that we add a line to kernel_do_install() in
>> kernel.bbclass which does a sed on the Makefile as installed into
>> $kerneldir which changes -I/usr/include/slang to -I=/usr/include/slang.
>>
>> We can then drop the patch I added to the linux-yocto kernels.
>>
>> This is all that should be needed, it should fix all the issues people
>> have reported in a way that is acceptable to everyone.
>>
> 
> Ah, I see what you mean now. But we have push acceptable kernel patch
> to linux-yocto kernel first, and propose it to mainline kernel in the
> meantime. With proper kernel patch in linux-yocto kernel(s), we does
> not have to do the second above, right? :)

No, the kernel.bbclass supports more than the linux-yocto kernels. It
needs to be generally useful with 2.6+kernels. The sed patch for the
kernel.bbclass is still necessary.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



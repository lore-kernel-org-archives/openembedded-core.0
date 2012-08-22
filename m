Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1T43t0-000331-KY
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 07:53:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7M5fgfk001773
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2012 22:41:42 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 21 Aug 2012 22:41:42 -0700
Message-ID: <50347114.1060501@windriver.com>
Date: Wed, 22 Aug 2012 01:41:40 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Liang Li <liang.li@windriver.com>
References: <1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
	<1345200782.26132.18.camel@ted> <20120817130151.GA1416@localhost>
	<20120817130517.GB1416@localhost> <50324E29.5060005@windriver.com>
	<20120821050825.GB27917@localhost> <50338809.8050209@windriver.com>
	<20120822030118.GA384@localhost>
In-Reply-To: <20120822030118.GA384@localhost>
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
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
X-List-Received-Date: Wed, 22 Aug 2012 05:53:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-21 11:01 PM, Liang Li wrote:
> On 2012-08-21 21:07, Bruce Ashfield<bruce.ashfield@windriver.com>  wrote:
>> On 12-08-21 01:08 AM, Liang Li wrote:
>>> On 2012-08-20 22:48, Bruce Ashfield<bruce.ashfield@windriver.com>   wrote:
>>>> On 12-08-17 09:05 AM, Liang Li wrote:
>>>>> On 2012-08-17 21:01, Liang Li<liang.li@windriver.com>    wrote:
>>>>>> On 2012-08-17 18:53, Richard Purdie<richard.purdie@linuxfoundation.org>    wrote:
>>>>>>> On Fri, 2012-08-17 at 18:00 +0800, Liang Li wrote:
>>>>>>>> I am totally confused, you mentioned 'general kernel do_install', I
>>>>>>>> assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
>>>>>>>> the fix upstream in the mainline kernel', how could that happen?
>>>>>>>>
>>>>>>>> We are discussing about the solution to 'fix the compile warning to
>>>>>>>> error' stuff that triggered by the '-I/usr/include/slang', right?
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>>     We do not necessarily have to change recipe to fix it since the issue
>>>>>>>> is not introduced by the recipe, the hard coded '-I/usr/include/slang'
>>>>>>>> in the Makefile cause the issue, we can fix the root cause by kernel
>>>>>>>> patch(other than just comment the line out). I see your previous patch
>>>>>>>> to kernel, by comment out the '-I/usr/include/slang' line in the
>>>>>>>> Makefile, is the same behavior, but we won't have the change(comment
>>>>>>>> out -I.. in Makefile) upstream to mainline, right?
>>>>>>>
>>>>>>> I am suggesting that firstly, someone send a patch to the mainline
>>>>>>> kernel which changes -I/usr/include/slang to -I=/usr/include/slang in
>>>>>>> that Makefile.
>>>>>>>
>>>>>>> Secondly, I'm suggesting that we add a line to kernel_do_install() in
>>>>>>> kernel.bbclass which does a sed on the Makefile as installed into
>>>>>>> $kerneldir which changes -I/usr/include/slang to -I=/usr/include/slang.
>>>>>>>
>>>>>>> We can then drop the patch I added to the linux-yocto kernels.
>>>>>>>
>>>>>>> This is all that should be needed, it should fix all the issues people
>>>>>>> have reported in a way that is acceptable to everyone.
>>>>>>>
>>>>>>
>>>>>> Ah, I see what you mean now. But we have push acceptable kernel patch
>>>>>
>>>>
>>>> One final (I hope) follow up on this.
>>>>
>>>> Liang: were you going to put together (and test) the 'sed fix' for
>>>> kernel.bbclass ?
>>>>
>>>
>>> No problem, the patch for kernel.bbclass:
>>>
>>> commit 60a0b06
>>> Author: Liang Li<liang.li@windriver.com>
>>> Date:   Tue Aug 21 11:06:01 2012 +0800
>>>
>>>       kernel.bbclass: fix INC directory for SLANG
>>>
>>>       The change is intend to fix the hardcoded '-I/usr/include/slang' in
>>>       the Makefile to be able to aware of SYSROOT if its specified.
>>>
>>>       A planned kernel patch almost did the same change, but the change here
>>>       won't conflict with it so this change could work for all kernels.
>>>
>>>       Signed-off-by: Liang Li<liang.li@windriver.com>
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 1afb9ab..282194d 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -190,6 +190,9 @@ kernel_do_install() {
>>>    	for entry in $bin_files; do
>>>    	        rm -f $kerneldir/$entry
>>>    	done
>>> +
>>> +	# Fix SLNAG_INC for slang.h
>>
>> s/SLNAG_INC/SLANG_INC/
>>
>>> +	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>>
>> It looks like your baseline for this patch is the denzil branch. We'd
>> want a version for master, which we could backport as required.
>>
>
> Yes, the change for the master branch is almost the same, except line
> number context:
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index f34e632..fdef1be 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -204,6 +204,9 @@ kernel_do_install() {
>   	for entry in $bin_files; do
>   		rm -f $kerneldir/$entry
>   	done
> +
> +	# Fix SLANG_INC for slang.h
> +	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>   }
>
>   sysroot_stage_all_append() {
>
> ---
>
>>>    }
>>>
>>>    PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
>>>
>>> ---
>>>
>>> The patch for kernel tree:
>>>
>>> commit 6b72896
>>> Author: Liang Li<liang.li@windriver.com>
>>> Date:   Wed Aug 1 14:31:24 2012 +0800
>>>
>>>       perf: add SLANG_INC for slang.h
>>>
>>>       Previously we hard code '-I/usr/include/slang' to CFLAGS to works with
>>>       some hosts that has /usr/include/slang/slang.h other than
>>>       /usr/include/slang.h like Fedora. This will cause compiling warnings
>>>       in some cases.
>>
>> I'd rephrase this slightly as:
>>
>> CFLAGS was previously hard coded to contain "-I/usr/include/slang" to
>> work with hosts that have "/usr/include/slang/slang.h" as well as hosts
>> that have "/usr/include/slang.h". This path can cause compile warnings
>> in some cases:
>>
>>    <put the warnings here>
>>
>> .. and indicate that these warnings can actually cause build errors if
>> WERROR is enabled.
>>
>>>
>>>       We could downgrade the priority of the default hard coded path, and
>>>       provide user a chance to specify correct location of slang.h then user
>>>       could specify SLANG_INC to avoid compile warnings like the
>>>       '/usr/include/slang' is not exists etc.
>>
>> Another minor rephrase:
>>
>> To fix this issue, we can use -idirafter to downgrade the priority of the
>> default hard coded path. We can also make the slang include directory
>> a variable, to allow the user to specify SLANG_INC and set their own
>> include location.
>>
>
> No problem, rephrased commit message:
>
> Subject: [PATCH] perf: add SLANG_INC for slang.h
>
> CFLAGS was previously hard coded to contain "-I/usr/include/slang" to
> work with hosts that have "/usr/include/slang/slang.h" as well as hosts
> that have "/usr/include/slang.h". This path can cause compile warnings
> like:
>
> cc1: warning: '/usr/include/slang' doesn't exists.
>
> or
>
> cc1: warning: include location "/usr/include/slang" is unsafe for
> cross-compilation [-Wpoison-system-directories]
>
> Then in some cases warnings become errors if WERROR is enabled hence
> build errors.
>
> To fix this issue, we can use -idirafter to downgrade the priority of the
> default hard coded path. We can also make the slang include directory
> a variable, to allow the user to specify SLANG_INC and set their own
> include location. And add a '=' prefix to indicate better
> compatibility with sysroot/cross compile cases.
>
> Signed-off-by: Liang Li<liang.li@windriver.com>
>
>>>
>>>       Signed-off-by: Liang Li<liang.li@windriver.com>
>>>
>>> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
>>> index b7a7a87..e403c36 100644
>>> --- a/tools/perf/Makefile
>>> +++ b/tools/perf/Makefile
>>> @@ -496,8 +496,10 @@ else
>>>    		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
>>>    		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
>>>    	else
>>> -		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
>>> -		BASIC_CFLAGS += -I/usr/include/slang
>>> +		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
>>> +		SLANG_INC ?= -idirafter =/usr/include/slang
>>
>> One more question, have you confirmed that gcc is fine with this being
>> in sysroot notation ? (I assume it is .. but I need to ask.
>>
>
> Confirmed.

Both look fine to me, if you send me a pull request for the kernel.bbclass
part, and a separate one for the kernel patch, I'll take care
of dropping the old slang patch, and getting all the changes
to Richard in a single pull request.

We can then take the kernel patch upstream to the perf
maintainers for their comments.

Cheers,

Bruce

>
> Thanks,
> 		Liang Li
>
>> Cheers,
>>
>> Bruce
>>
>>> +		BASIC_CFLAGS += $(SLANG_INC)
>>> +
>>>    		EXTLIBS += -lnewt -lslang
>>>    		LIB_OBJS += $(OUTPUT)ui/setup.o
>>>    		LIB_OBJS += $(OUTPUT)ui/browser.o
>>>
>>> ---
>>>
>>> Comments? :)
>>>
>>> Thanks,
>>> 		Liang Li
>>>
>>>> I have my own set of issues that are consuming my time now, and I want
>>>> to ensure that this doesn't fall through the cracks, since we need a
>>>> full/real fix for this as soon as possible.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>
>>>>> Sorry, I mean 'we can ...' instead of 'we have ...', just typo.




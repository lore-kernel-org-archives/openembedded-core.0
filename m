Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5807A7708E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 14:41:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA6EfaUs001323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Nov 2015 06:41:36 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 6 Nov 2015 06:41:35 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1446711613.git.liezhi.yang@windriver.com>
	<88477fa50093b85e65b17c746a637c7259b87018.1446711613.git.liezhi.yang@windriver.com>
	<563B5D05.9060609@windriver.com>
	<4A9C77E9-8365-46DD-99A4-AE711940E3A3@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <563CBC1E.3080402@windriver.com>
Date: Fri, 6 Nov 2015 08:41:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <4A9C77E9-8365-46DD-99A4-AE711940E3A3@gmail.com>
Cc: Richard Purdie <richard.purdie@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gcc-multilib-config: make aarch64 support multilib
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
X-List-Received-Date: Fri, 06 Nov 2015 14:41:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/5/15 11:35 PM, Khem Raj wrote:
> 
>> On Nov 5, 2015, at 5:43 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> On 11/5/15 2:20 AM, Robert Yang wrote:
>>> Fixed:
>>> MACHINE = qemuarm64
>>> require conf/multilib.conf
>>> MULTILIBS = "multilib:lib32"
>>> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>>>
>>> $ bitbake core-image-minimal -cpopulate_sdk
>>>
>>> WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
>>> WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
>>>
>>> [YOCTO #8638]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> meta/recipes-devtools/gcc/gcc-multilib-config.inc |    7 +++++++
>>> 1 file changed, 7 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>>> index 1c0a45a..a0a2ac0 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>>> @@ -29,6 +29,9 @@ python gcc_multilib_setup() {
>>>     bb.utils.remove(build_conf_dir, True)
>>>     ml_globs = ('%s/*/t-linux64' % src_conf_dir,
>>>                 '%s/*/linux64.h' % src_conf_dir,
>>> +                '%s/aarch64/t-aarch64' % src_conf_dir,
>>> +                '%s/aarch64/aarch64.h' % src_conf_dir,
>>> +                '%s/aarch64/aarch64-cores.def' % src_conf_dir,
>>>                 '%s/*/linux.h' % src_conf_dir,
>>>                 '%s/linux.h' % src_conf_dir)
>>>
>>> @@ -130,6 +133,8 @@ python gcc_multilib_setup() {
>>>         'mips64'    : ['gcc/config/mips/t-linux64'],
>>>         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
>>>         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
>>> +        'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
>>> +        'arm'       : ['gcc/config/aarch64/t-aarch64'],
>>>     }
>>>
>>>     gcc_header_config_files = {
>>> @@ -140,6 +145,8 @@ python gcc_multilib_setup() {
>>>         'mips64'    : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
>>>         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
>>>         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
>>> +        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
>>> +        'arm'       : ['gcc/config/aarch64/aarch64.h'],
>>>     }
>>
>> I'm not sure the above is correct in this case.  As I believe GCC treats aarch64
>> and arm as different architectures unlike MIPS, Power and IA32.
>>
>> In this case, I would expect two specific cross compilers to be generated, one
>> for armv7 and one for aarch64, instead of a combination single compiler that
>> understand both.
>>
> 
> Well not entirely so, gcc can support ilp32 as a mutlilib variant for aarch64
> so this patch is fine although if we should support ilp32 as a variant is another
> question, which folks can chime in and provide feedback if they have use of it.
> but nevertheless this patch should be ok

I've seen no real world need for ilp32 at this point.. but I have seen many
requests to run armv7 code on an aarch64 system.  (Compatibility multilib.)

--Mark

>> So in this case, it might be better to have an exception to the warning
>> message...  (unless I'm wrong, in which case this IS likely a correct fix....)
>>
>> Hopefully Khem and/or Richard will be able to comment as they are more familiar
>> with this code path.
>>
>>>
>>>     libdir32 = 'SYSTEMLIBS_DIR'
>>>
>>
> 



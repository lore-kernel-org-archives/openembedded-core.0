Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14E4878A2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 05:24:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5E5NUL5026496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jun 2018 22:23:55 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 13 Jun 2018 22:23:26 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180613061252.18271-1-kai.kang@windriver.com>
	<CAMKF1spMCuxOxztWfEGGepupH-K2DOTKwViDf==XoOipocqgHA@mail.gmail.com>
	<1ef2ee09-4f69-2a91-80f0-e700bc139e1c@windriver.com>
	<37dc38fa-f80a-7cff-0409-b9cb72bc10e3@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <6123589d-5ba7-27a1-4c81-09e06d284435@windriver.com>
Date: Thu, 14 Jun 2018 13:21:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <37dc38fa-f80a-7cff-0409-b9cb72bc10e3@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: set SECURITY_CFLAGS for mips64
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
X-List-Received-Date: Thu, 14 Jun 2018 05:24:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月14日 11:33, Khem Raj wrote:
>
>
> On 6/13/18 8:15 PM, Kang Kai wrote:
>> On 2018年06月13日 22:01, Khem Raj wrote:
>>> On Wed, Jun 13, 2018 at 12:16 AM <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> When include conf/distro/include/security_flags.inc, NOPIE flags are
>>>> still required for MIPS64 target builds. Otherwise it fails to build
>>>> packages such as glide which inherit go.bbclass:
>>>>
>>>> | 
>>>> .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/recipe-sysroot-native/usr/bin/mips64-wrs-linux/../../libexec/mips64-wrs-linux/ 
>>>>
>>>> | gcc/mips64-wrs-linux/7.3.0/ld: 
>>>> .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/go-tmp/go-link-518447869/go.o: 
>>>>
>>>> | relocation R_MIPS_26 against `a local symbol' can not be used 
>>>> when making a shared object; recompile with -fPIC`
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>   meta/classes/goarch.bbclass | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>>>> index f54c5169e3e..5fd9f294a8a 100644
>>>> --- a/meta/classes/goarch.bbclass
>>>> +++ b/meta/classes/goarch.bbclass
>>>> @@ -36,6 +36,7 @@ COMPATIBLE_HOST_mipsarchn32 = "null"
>>>>   ARM_INSTRUCTION_SET = "arm"
>>>>   TUNE_CCARGS_remove = "-march=mips32r2"
>>>>   SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
>>>> +SECURITY_CFLAGS_mips64 = "${SECURITY_NOPIE_CFLAGS}"
>>> perhaps we should use _mipsall once
>> Hi Khem,
>>
>> I don't quite follow you. It seems no such override '_mipsall' 
>> exists. Do you mean 'mipsarch' or something else? Thanks.
>>
>
> yes mipsarch indeed.

Thanks. V2 will be sent.

--Kai
>
>> Regards,
>> Kai
>>>
>>>>   SECURITY_NOPIE_CFLAGS ??= ""
>>>>
>>>>   def go_map_arch(a, d):
>>>> -- 
>>>> 2.17.1
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

-- 
Regards,
Neil | Kai Kang



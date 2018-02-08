Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D49AF77BC5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 16:02:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w18G22eW030564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Feb 2018 08:02:03 -0800
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 8 Feb 2018 08:02:02 -0800
To: He Zhe <zhe.he@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1517813643-16075-1-git-send-email-zhe.he@windriver.com>
	<6bad679b-fb8f-5c89-39b1-0e0519e272aa@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d617672e-855c-28f8-d22f-b950f23a9b68@windriver.com>
Date: Thu, 8 Feb 2018 11:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6bad679b-fb8f-5c89-39b1-0e0519e272aa@windriver.com>
Subject: Re: [PATCH] kernel: Fix QA buildpaths warning for kernel modules
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
X-List-Received-Date: Thu, 08 Feb 2018 16:02:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/07/2018 09:35 PM, He Zhe wrote:
> Hi Bruce,
> 
> I should have cc this to you.
> 

Thanks, I had missed the original patch. See below for comments.

> Thanks,
> Zhe
> 
> On 2018年02月05日 14:54, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> CFLAGS is unset during kernel_do_compile and thus the default build
>> path substitutions in DEBUG_PREFIX_MAP are missing.
>>
>> To enhance reproducible build for kernel modules, such as lttng-modules
>> and cryptodev-module, this patch appends them, plus substitution of
>> STAGING_KERNEL_DIR, to KERNEL_CC.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>   meta/classes/kernel-arch.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
>> index cf0edb6..e0fe22b 100644
>> --- a/meta/classes/kernel-arch.bbclass
>> +++ b/meta/classes/kernel-arch.bbclass
>> @@ -57,7 +57,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>>   TARGET_AR_KERNEL_ARCH ?= ""
>>   HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>>   
>> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd"
>> +KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"

Generally speaking we do not want to leak build system flags/options
into the kernel build, but in this case the flags are related to the
symbols/compiler versus flags influencing the code in the executables
.. and they are similar to the other flags we do pass into the build.

So no concerns from me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>>   KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>>   KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>>   TOOLCHAIN = "gcc"
> 



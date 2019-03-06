Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 455CD6D7BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:56:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x265uH7R027454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 21:56:17 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 5 Mar 2019 21:56:16 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sp6DERNjdQnGWYKqJddH67Rm=PUThyy=qkpeU_rKp1itw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C7F6292.3020908@windriver.com>
Date: Wed, 6 Mar 2019 14:02:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp6DERNjdQnGWYKqJddH67Rm=PUThyy=qkpeU_rKp1itw@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: fix the build with -fno-omit-frame-pointer
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
X-List-Received-Date: Wed, 06 Mar 2019 05:56:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年03月06日 13:34, Khem Raj wrote:
> On Tue, Mar 5, 2019 at 8:24 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> Fix the below build issue for gcc-sanitizers when
>> both -mthumb and -fno-omit-frame-pointer configured
>> for arm.
>> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc: In function 'sanitizer::uptr sanitizer::internal_clone(int (*)(void*), void*, int, void*, int*, void*, int*)':
>> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc:1540:1: error: r7 cannot be used in asm here
>> }
>>
>> Reference: https://reviews.llvm.org/D50180
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>> index f3c7058..2f89c86 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>> @@ -5,3 +5,4 @@ require gcc-sanitizers.inc
>>   # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>>   ARM_INSTRUCTION_SET_armv4 = "arm"
>>   ARM_INSTRUCTION_SET_armv5 = "arm"
>> +TARGET_CFLAGS_remove_arm = "${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fno-omit-frame-pointer', '', d)}"
>
> what target does it happen with ? since we set arm ISA for armv5 and
> v4 it must be something else

It is armv7vethf.

>


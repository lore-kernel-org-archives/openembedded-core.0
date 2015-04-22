Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E15F0605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 02:21:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3M2Lbme010211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Apr 2015 19:21:37 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 19:21:37 -0700
Message-ID: <553705AF.4010503@windriver.com>
Date: Wed, 22 Apr 2015 10:21:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1429517108.git.liezhi.yang@windriver.com>
	<2014020bb14ab84e8d6d50a83c1de4e0d559dac9.1429517108.git.liezhi.yang@windriver.com>
	<21CFB078-5E3A-420E-8058-1901F23F5482@gmail.com>
In-Reply-To: <21CFB078-5E3A-420E-8058-1901F23F5482@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: use gold for all archs
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
X-List-Received-Date: Wed, 22 Apr 2015 02:21:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/22/2015 09:32 AM, Khem Raj wrote:
>
>> On Apr 20, 2015, at 1:05 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> At least the following boards have build errors without using gold:
>> qemux86, qemux86-64, qemuarm, qemuaarch64, qemuppc.
>>
>> The error is:
>> ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
>> ld: failed to set dynamic section sizes: Bad value
>> ld: copy reloc against protected `_Uaarch64_local_addr_space' is invalid
>> ld: failed to set dynamic section sizes: Bad value
>> | collect2: error: ld returned 1 exit status
>>
>> So use gold for all archs to fix the problem.
>
> Please test it with gold on mips, before we apply this patch

Sorry, gold doesn't work for mips or mips64, I will send a patch for that.

// Robert

>
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/recipes-support/libunwind/libunwind.inc |    5 +----
>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
>> index 56905c2..c4a7b5e 100644
>> --- a/meta/recipes-support/libunwind/libunwind.inc
>> +++ b/meta/recipes-support/libunwind/libunwind.inc
>> @@ -23,10 +23,7 @@ LIBATOMICS_armv5 = "-latomic_ops"
>> LIBATOMICS_armv4 = "-latomic_ops"
>> LIBATOMICS ?= ""
>>
>> -LDFLAGS_append_x86 = " -fuse-ld=gold"
>> -LDFLAGS_append_x86-64 = " -fuse-ld=gold"
>> -
>> -LDFLAGS_append_aarch64 = " -fuse-ld=gold"
>> +LDFLAGS_append = " -fuse-ld=gold"
>>
>> DEPENDS += "${DEPLIBATOMICS}"
>> DEPLIBATOMICS_armv5 = "libatomics-ops"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>


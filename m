Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97AFA7142A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:37:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I9bldd009237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 02:37:47 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 02:37:38 -0700
Message-ID: <541AA7E1.8040206@windriver.com>
Date: Thu, 18 Sep 2014 17:37:37 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1410879378.git.kai.kang@windriver.com>	<f1a77eb073405fd9bcccc0dac37be98848ddf08b.1410879378.git.kai.kang@windriver.com>
	<541A8765.1060800@gmail.com>
In-Reply-To: <541A8765.1060800@gmail.com>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH 3/9] gcc-4.9: redefine dynamic linker for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 09:37:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月18日 15:19, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> On 9/16/14 8:06 AM, Kai Kang wrote:
>> Redefine dynamic linker for aarch64 from /lib to /lib64.
>>
>> BASELIB of aarch64 has to be defined with 'lib64', then linker file
>> ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
>> update it here too.
> hmmm since the ldso name is different it can still live in /lib
> and there will be ilp32 version ldso multilib as well later. can we keep
> ldso in /lib ?

Should not we use '/lib64' and '/lib' for mutlilib? I remember 
intel-x86-64 uses that way rather than '/lib' and '/lib32'.

--Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>>   .../0056-redefine-dynamic-linker-for-aarch64.patch | 34 ++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> index 25778bd..c434a45 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> @@ -70,6 +70,7 @@ SRC_URI = "\
>>       file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
>>       file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>>       file://0055-PR-rtl-optimization-61801.patch \
>> +    file://0056-redefine-dynamic-linker-for-aarch64.patch \
>>   "
>>   SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>>   SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
>> new file mode 100644
>> index 0000000..6933e2f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
>> @@ -0,0 +1,34 @@
>> +From 8fbb60d89e569b68b13e4fd419e20640eb49cabc Mon Sep 17 00:00:00 2001
>> +From: Kai Kang <kai.kang@windriver.com>
>> +Date: Tue, 16 Sep 2014 16:01:31 +0800
>> +Subject: [PATCH] Redefine dynamic linker for aarch64
>> +
>> +Redefine dynamic linker for aarch64 from /lib to /lib64.
>> +
>> +BASELIB of aarch64 has to be defined with 'lib64', then linker file
>> +ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
>> +update it here too.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + gcc/config/aarch64/aarch64-linux.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
>> +index a8f0771..2a6f06d 100644
>> +--- a/gcc/config/aarch64/aarch64-linux.h
>> ++++ b/gcc/config/aarch64/aarch64-linux.h
>> +@@ -21,7 +21,7 @@
>> + #ifndef GCC_AARCH64_LINUX_H
>> + #define GCC_AARCH64_LINUX_H
>> +
>> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
>> ++#define GLIBC_DYNAMIC_LINKER "/lib64/ld-linux-aarch64%{mbig-endian:_be}.so.1"
>> +
>> + #define CPP_SPEC "%{pthread:-D_REENTRANT}"
>> +
>> +--
>> +1.9.1
>> +
>>
> - -- 
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
> Comment: GPGTools - https://gpgtools.org
>
> iEYEARECAAYFAlQah2UACgkQuwUzVZGdMxT98wCghPbcAP/2xFgFn9Lv3Wisexa6
> kHkAni6hykOqPq44VheOimbMbcimHaZD
> =jpy6
> -----END PGP SIGNATURE-----


-- 
Regards,
Neil | Kai Kang



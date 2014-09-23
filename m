Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D37560167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:13:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8N9DIiM019345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 02:13:18 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 23 Sep 2014 02:13:17 -0700
Message-ID: <542139AC.9050201@windriver.com>
Date: Tue, 23 Sep 2014 17:13:16 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Fathi Boudra <fathi.boudra@linaro.org>
References: <cover.1411117403.git.kai.kang@windriver.com>	<65b2b92067da54c7ae1c4dcfee22e317798e6371.1411117403.git.kai.kang@windriver.com>	<CAGNsrLCEAtiAW5GpN7K-6jTuK0EgOyduVAREUyVhVt1gb4A-xg@mail.gmail.com>	<54210F1F.10907@windriver.com>
	<CAGNsrLDiRpTjOxhpppTxe8H8UJUrLxxnxxKaZq4MXuAV+HMJDQ@mail.gmail.com>
In-Reply-To: <CAGNsrLDiRpTjOxhpppTxe8H8UJUrLxxnxxKaZq4MXuAV+HMJDQ@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] perf: disable libunwind support for aarch64
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
X-List-Received-Date: Tue, 23 Sep 2014 09:13:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月23日 16:23, Fathi Boudra wrote:
> On 23 September 2014 09:11, Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2014年09月23日 00:01, Fathi Boudra wrote:
>>> On 19 September 2014 12:21, Kai Kang <kai.kang@windriver.com> wrote:
>>>> Disable libunwind support of perl for aarch aarch64 that libunwind
>>>> doesn't support aarch64.
>>> typo:
>>> perl -> perf
>>> aarch -> arch
>>>
>>> Otherwise, the patch doesn't seems correct. libunwind supports aarch64
>>> since libunwind 1.1 (you need to build with --enable-debug-frame).
>>
>> When do configure, it fails with:
>>
>> | checking for ELF helper width... configure: error: Unknown ELF target:
>> aarch64
>>
>> It could be fixed by patching configure.ac:
>>
>> --- configure.ac.orig   2014-09-23 13:30:23.415975656 +0800
>> +++ configure.ac        2014-09-23 13:30:47.991976326 +0800
>> @@ -137,7 +137,7 @@
>>   AC_MSG_CHECKING([for ELF helper width])
>>   case "${target_arch}" in
>>   (arm|hppa|ppc32|x86|sh) use_elf32=yes; AC_MSG_RESULT([32]);;
>> -(ia64|ppc64|x86_64)    use_elf64=yes; AC_MSG_RESULT([64]);;
>> +(aarch64|ia64|ppc64|x86_64)    use_elf64=yes; AC_MSG_RESULT([64]);;
>>   (mips)                 use_elfxx=yes; AC_MSG_RESULT([xx]);;
>>   *)                     AC_MSG_ERROR([Unknown ELF target: ${target_arch}])
>>   esac
>>
>> And then it fails with do compile either:
>>
>> | ../include/libunwind.h:25:3: error: #error "Unsupported arch"
>>
>> In include/libunwind.h.in, it checks arch and include header accordingly.
>> For aarch64, it lacks arch check and header file libunwind-arm64.h or
>> libunwind-aarch64.h.
>
> right, we've upstreamed aarch64 support but it hasn't been released in 1.1.
> we need the following patches:
> http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=commitdiff;h=ac6c0a6535975f1dc2da6e4e2766614baac2a14a
> http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=commitdiff;h=2cb00c1eaca437e41556ad5512149508fcc7cb82

Thanks , I'll try them.

--Kai

>
>> Thanks,
>> Kai
>>
>>
>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/perf/perf-features.inc | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf-features.inc
>>>> b/meta/recipes-kernel/perf/perf-features.inc
>>>> index 2dbbb47..7de35f3 100644
>>>> --- a/meta/recipes-kernel/perf/perf-features.inc
>>>> +++ b/meta/recipes-kernel/perf/perf-features.inc
>>>> @@ -1,4 +1,5 @@
>>>>    PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
>>>> +PERF_FEATURES_ENABLE_remove_aarch64 = "perf-libunwind"
>>>>
>>>>    def perf_feature_enabled(feature, trueval, falseval, d):
>>>>        """
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>


-- 
Regards,
Neil | Kai Kang



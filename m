Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44BCD7D848
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:23:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F9MbYn003110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 02:22:57 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 02:22:46 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB44E82.5020907@windriver.com>
Date: Mon, 15 Apr 2019 17:27:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 15 Apr 2019 09:23:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月09日 11:53, Khem Raj wrote:
> On Mon, Apr 8, 2019 at 7:32 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> When DEBUG_BUILD = "1" added in local.conf, there
>> comes below build error when "bitbake gcc-sanitizers":
>> | ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
>> | ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> |   return S_ISLNK (st.st_mode);
>>
>> Per https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html,
>> the gcc upstream thinks the warning is a false
>> positive and suggests to use -O2 rather than -Og
>> or -O1 when compiling that file, so pass -Wno-error
>> to compiler when -Og is used to silence the error.
>>
>
> Not particular to this change but in general if a package says that it
> does not support -Og
> then we are just going to get into more and more untested grounds
> especially during runtime
> so I wonder how useful it will be to use -Og for such packages or any
> other non supported
> combination for that matter.

Hi Khem,

Any other suggestion to silence the gcc-sanitizers build error when 
DEBUG_BUILD is enabled?

Or just keep the logic DEBUG_OPTIMIZATION_append = " -Wno-error" as my 
patch stated?

Thanks,

>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> index e5e8452..8b1d1c9 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -45,6 +45,9 @@ INHIBIT_DEFAULT_DEPS = "1"
>>   ALLOW_EMPTY_${PN} = "1"
>>   DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
>>
>> +# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> +DEBUG_OPTIMIZATION_append = " -Wno-error"
>> +
>>   BBCLASSEXTEND = "nativesdk"
>>
>>   PACKAGES = "${PN} ${PN}-dbg"
>> --
>> 2.7.4
>>
>


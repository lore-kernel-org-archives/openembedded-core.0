Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A39707391D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 02:11:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D2B9tH021284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Jul 2015 19:11:10 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 12 Jul 2015 19:11:09 -0700
Message-ID: <55A31E3C.5080608@windriver.com>
Date: Mon, 13 Jul 2015 10:11:08 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Jens Rehsack <rehsack@gmail.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
	<8B7C6968-8868-4888-9E67-E6B131014CB3@gmail.com>
	<559F9040.90106@windriver.com>
	<84FED104-7E9E-4E10-8398-D358985B28A1@gmail.com>
In-Reply-To: <84FED104-7E9E-4E10-8398-D358985B28A1@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Mon, 13 Jul 2015 02:11:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月10日 18:08, Jens Rehsack wrote:
>
>> Am 10.07.2015 um 11:28 schrieb Rongqing Li <rongqing.li@windriver.com>:
>>
>>
>>
>> On 2015年07月10日 17:09, Jens Rehsack wrote:
>>> Hi,
>>>
>>> When build dir includes contain blib, there is an error which should be solved first.
>>>
>>> Can you please give an example where this condition is true?
>>> And maybe refer where you reported it upstream?
>>>
>>
>> the below commands can trigger this bug; under Poky repo:
>>
>> #source oe-init-build-env blib;
>> #bitbake perl
>
> Simply add a comment that blib as build-env name is not supported as long as no
> comment from PathTools maintainers agree on the patch. I rate your patch as dangerous
> for common perl module building...
>
> I agree that PathTools should handle @INC parts containing blib somewhere, but
> your patch results in any build environment of any MakeMaker base module might be
> broken.
>
> If you tell me the RT ticket number where you reported the issue upstream and
> send your patch for review, I will join and argue for fixing the issue (even when
> I think the patch needs review).


open a defect for perl

https://rt.perl.org/Ticket/Display.html?id=125603

thanks

-Roy

>
>> or work on source code:
>>
>> #mkdir blib
>> #cd blib
>> #unxz perl-5.22.0.tar.xz
>> #tar -xvf perl-5.22.0.tar
>> #cd perl-5.22.0
>> #./Configure -des -Dprefix=./
>> #make
>
> Don't do that - neither for PathTools nor for any other perl module.
>
> Cheers,
> Jens
>
>> -Roy
>>
>>
>>> Best regards,
>>> Jens
>>>
>>>> Am 10.07.2015 um 10:54 schrieb rongqing.li@windriver.com:
>>>>
>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>
>>>> If build dir includes the string "blib", filter it out from @INC may empty
>>>> the @INC and cause build errors like:
>>>>
>>>>   Can't locate ExtUtils/MakeMaker.pm in @INC \
>>>>   (you may need to install the ExtUtils::MakeMaker module) \
>>>>   (@INC contains: .) at Makefile.PL
>>>>
>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>>> ---
>>>> meta/recipes-devtools/perl/perl-native_5.22.0.bb   |  1 +
>>>> ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 ++++++++++++++++++++++
>>>> meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
>>>> 3 files changed, 35 insertions(+)
>>>> create mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>>> index dbcf2a6..a9a1cab 100644
>>>> --- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>>> +++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
>>>> @@ -8,6 +8,7 @@ SRC_URI += "\
>>>>             file://MM_Unix.pm.patch \
>>>>             file://debian/errno_ver.diff \
>>>>             file://dynaloaderhack.patch \
>>>> +           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>>>>            "
>>>>
>>>> SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
>>>> diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
>>>> new file mode 100644
>>>> index 0000000..7dd9041
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
>>>> @@ -0,0 +1,33 @@
>>>> +From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
>>>> +From: Wenzong Fan <wenzong.fan@windriver.com>
>>>> +Date: Wed, 11 Feb 2015 15:14:40 +0800
>>>> +Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
>>>> +
>>>> +If $TOPDIR includes the string "blib", filter it out from @INC may empty
>>>> +the @INC and cause build errors like:
>>>> +
>>>> +  Can't locate ExtUtils/MakeMaker.pm in @INC \
>>>> +  (you may need to install the ExtUtils::MakeMaker module) \
>>>> +  (@INC contains: .) at Makefile.PL
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>>> +---
>>>> + dist/PathTools/Makefile.PL | 3 ---
>>>> + 1 file changed, 3 deletions(-)
>>>> +
>>>> +diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
>>>> +index 1b21de4..f562cb2 100644
>>>> +--- a/dist/PathTools/Makefile.PL
>>>> ++++ b/dist/PathTools/Makefile.PL
>>>> +@@ -1,6 +1,3 @@
>>>> +-
>>>> +-BEGIN { @INC = grep {!/blib/} @INC }
>>>> +-
>>>> + require 5.005;
>>>> + use ExtUtils::MakeMaker;
>>>> + WriteMakefile
>>>> +--
>>>> +1.9.1
>>>> +
>>>> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
>>>> index 050a98c..7f78998 100644
>>>> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
>>>> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
>>>> @@ -61,6 +61,7 @@ SRC_URI += " \
>>>>          file://t-run-switches.t-perl5-perl.patch \
>>>>          file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
>>>>          file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
>>>> +        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>>>> "
>>>>
>>>> # Fix test case issues
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
>> Best Reagrds,
>> Roy | RongQing Li
>

-- 
Best Reagrds,
Roy | RongQing Li


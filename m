Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6C906FC43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 01:15:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T1FDNf022744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 18:15:13 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 18:15:13 -0700
Message-ID: <53D6F58A.5000408@windriver.com>
Date: Tue, 29 Jul 2014 09:14:50 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1406275654.git.hongxu.jia@windriver.com>
	<9744f54022b591228ed2566f8d5fa3b3c97f6ca9.1406275654.git.hongxu.jia@windriver.com>
	<53D27C56.9020600@linux.intel.com>
In-Reply-To: <53D27C56.9020600@linux.intel.com>
Subject: Re: [PATCH 1/1] gcc-4.9.inc: fix parallel building failure
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
X-List-Received-Date: Tue, 29 Jul 2014 01:15:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2014 11:48 PM, Saul Wold wrote:
>
>
> Can you please rebase this against master as we have already merged 
> the first version.
>

No problem, I am working on it

//Hongxu

> Thanks
>     Sau!
>
>
> On 07/25/2014 03:13 AM, Hongxu Jia wrote:
>> The gcc-ar.o, gcc-nm.o, gcc-ranlib.o and errors.o included
>> config.h which was a generated file. But no explicity rule
>> to clarify the dependency. There was potential building
>> failure while parallel make.
>>
>> For gcc-ar.o, gcc-nm.o and gcc-ranlib.o, they were compiled from one C
>> source file gcc-ar.c, we add them to ALL_HOST_BACKEND_OBJS, so the
>> '$(ALL_HOST_OBJS) : | $(generated_files)' rule could work for these
>> objects.
>>
>> For errors.o, it is part of gengtype, and the gengtype generator program
>> is special: Two versions are built. One is for the build machine, and 
>> one
>> is for the host. We refered what gengtype-parse.o did (which also is 
>> part
>> of gengtype).
>>
>> [YOCTO #6568]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>>   ...Makefile.in-fix-parallel-building-failure.patch | 64 
>> ++++++++++++++++++++++
>>   2 files changed, 65 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc 
>> b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> index cbf1355..10bd5d5 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> @@ -67,6 +67,7 @@ SRC_URI = 
>> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>              file://0051-eabispe.patch \
>> file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch 
>> \
>> file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
>> + file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>>         "
>>   SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
>>   SRC_URI[sha256sum] = 
>> "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
>> diff --git 
>> a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch 
>> b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch 
>>
>> new file mode 100644
>> index 0000000..6277bec
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch
>> @@ -0,0 +1,64 @@
>> +From 5a50cebd00930930e609e978331ede690f34512b Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Fri, 25 Jul 2014 14:35:17 +0800
>> +Subject: [PATCH] gcc/Makefile.in: fix parallel building failure
>> +
>> +The gcc-ar.o, gcc-nm.o, gcc-ranlib.o and errors.o included
>> +config.h which was a generated file. But no explicity rule
>> +to clarify the dependency. There was potential building
>> +failure while parallel make.
>> +
>> +For gcc-ar.o, gcc-nm.o and gcc-ranlib.o, they were compiled from one C
>> +source file gcc-ar.c, we add them to ALL_HOST_BACKEND_OBJS, so the
>> +'$(ALL_HOST_OBJS) : | $(generated_files)' rule could work for these
>> +objects.
>> +
>> +For errors.o, it is part of gengtype, and the gengtype generator 
>> program
>> +is special: Two versions are built. One is for the build machine, 
>> and one
>> +is for the host. We refered what gengtype-parse.o did (which also is 
>> part
>> +of gengtype).
>> +
>> +[GCC #61899]
>> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61899
>> +
>> +Upstream-Status: Send to gcc-patches@gcc.gnu.org mailing list
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + gcc/Makefile.in | 7 ++++++-
>> + 1 file changed, 6 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
>> +index 6475cba..56e50bb 100644
>> +--- a/gcc/Makefile.in
>> ++++ b/gcc/Makefile.in
>> +@@ -1481,13 +1481,16 @@ OBJS-libcommon-target = 
>> $(common_out_object_file) prefix.o params.o \
>> +     opts.o opts-common.o options.o vec.o hooks.o 
>> common/common-targhooks.o \
>> +     hash-table.o file-find.o
>> +
>> ++# Objects compiled from one C source file gcc-ar.c
>> ++OBJS-gcc-ar = gcc-ar.o gcc-nm.o gcc-ranlib.o
>> ++
>> + # This lists all host objects for the front ends.
>> + ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
>> +
>> + ALL_HOST_BACKEND_OBJS = $(GCC_OBJS) $(OBJS) $(OBJS-libcommon) \
>> +   $(OBJS-libcommon-target) @TREEBROWSER@ main.o c-family/cppspec.o \
>> +   $(COLLECT2_OBJS) $(EXTRA_GCC_OBJS) $(GCOV_OBJS) $(GCOV_DUMP_OBJS) \
>> +-  lto-wrapper.o
>> ++  lto-wrapper.o $(OBJS-gcc-ar)
>> +
>> + # This lists all host object files, whether they are included in this
>> + # compilation or not.
>> +@@ -2437,6 +2440,8 @@ gengtype-parse.o: $(CONFIG_H)
>> + CFLAGS-build/gengtype-parse.o += -DGENERATOR_FILE
>> + build/gengtype-parse.o: $(BCONFIG_H)
>> +
>> ++errors.o : $(CONFIG_H)
>> ++
>> + gengtype-state.o build/gengtype-state.o: gengtype-state.c 
>> $(SYSTEM_H) \
>> +   gengtype.h errors.h double-int.h version.h $(HASHTAB_H) 
>> $(OBSTACK_H) \
>> +   $(XREGEX_H)
>> +--
>> +1.8.1.2
>> +
>>
>



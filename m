Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C38E2724DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 03:12:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t323CTrf003090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Apr 2015 20:12:29 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Apr 2015 20:12:28 -0700
Message-ID: <551CB39B.1000500@windriver.com>
Date: Thu, 2 Apr 2015 11:12:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
	<20150401175949.GL14928@jama>
In-Reply-To: <20150401175949.GL14928@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glibc: fix a tpo
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
X-List-Received-Date: Thu, 02 Apr 2015 03:12:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2015 01:59 AM, Martin Jansa wrote:
> On Wed, Apr 01, 2015 at 12:53:02AM -0700, Robert Yang wrote:
>> Fixed a typo:
>> name-target-directory -> make-target-directory
>
> You have another typo in commit message.

Sorry, I checked again, which typo, please ?

// Robert

>
>> There is no name-target-directory, it should be make-target-directory,
>> this fixed the error:
>> /bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
>> Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 ++++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.21.bb              |    1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
>> new file mode 100644
>> index 0000000..ec48006
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
>> @@ -0,0 +1,36 @@
>> +From 6207fb45553ee98f2f326883b7c21b76c8267343 Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Tue, 31 Mar 2015 02:31:25 -0700
>> +Subject: [PATCH] elf/Makefile: fix a typo
>> +
>> +Fixed a typo:
>> +name-target-directory -> make-target-directory
>> +
>> +There is no name-target-directory, it should be make-target-directory,
>> +this fixed the error:
>> +/bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
>> +Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + elf/Makefile |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/elf/Makefile b/elf/Makefile
>> +index e5b142c..62fe245 100644
>> +--- a/elf/Makefile
>> ++++ b/elf/Makefile
>> +@@ -358,7 +358,7 @@ $(objpfx)interp.os: $(elf-objpfx)runtime-linker.h
>> +
>> + $(elf-objpfx)runtime-linker.h: $(elf-objpfx)runtime-linker.st; @:
>> + $(elf-objpfx)runtime-linker.st: $(common-objpfx)config.make
>> +-	$(name-target-directory)
>> ++	$(make-target-directory)
>> + 	echo '#define RUNTIME_LINKER "$(rtlddir)/$(rtld-installed-name)"' \
>> + 		> ${@:st=T}
>> + 	$(move-if-change) ${@:st=T} ${@:st=h}
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
>> index 91feff5..fcef4ff 100644
>> --- a/meta/recipes-core/glibc/glibc_2.21.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
>> @@ -25,6 +25,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
>>              file://0001-Add-unused-attribute.patch \
>>              file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
>>              file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
>> +           file://elf-Makefile-fix-a-typo.patch \
>>              ${EGLIBCPATCHES} \
>>             "
>>   EGLIBCPATCHES = "\
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


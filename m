Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBDA6B91F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:50:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M6oF4R024929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2013 23:50:16 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 21 Aug 2013 23:50:15 -0700
Message-ID: <5215B4A7.8070604@windriver.com>
Date: Thu, 22 Aug 2013 14:50:15 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1376965065.git.kai.kang@windriver.com>
	<5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
	<760CDDA0-416D-4E16-8FC2-6205ED265506@gmail.com>
In-Reply-To: <760CDDA0-416D-4E16-8FC2-6205ED265506@gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 1/1] bc: fix segmentation fault
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
X-List-Received-Date: Thu, 22 Aug 2013 06:50:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年08月22日 14:38, Khem Raj wrote:
> On Aug 19, 2013, at 7:20 PM, Kai Kang <kai.kang@windriver.com> wrote:
>
>> When run 'bc -l', it segmentation faults. Apply patch from BLFS to fix it.
>>
>> Ref:
>> http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04601.html
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-extended/bc/bc_1.06.bb                |  3 ++-
>> .../bc/files/fix-segment-fault.patch               | 28 ++++++++++++++++++++++
>> 2 files changed, 30 insertions(+), 1 deletion(-)
>> create mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch
>>
>> diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
>> index fe9c3f4..4b28fad 100644
>> --- a/meta/recipes-extended/bc/bc_1.06.bb
>> +++ b/meta/recipes-extended/bc/bc_1.06.bb
>> @@ -13,7 +13,8 @@ SECTION = "base"
>> DEPENDS = "flex"
>> PR = "r2"
>>
>> -SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
>> +SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
>> +           file://fix-segment-fault.patch "
>>
>> SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
>> SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
>> diff --git a/meta/recipes-extended/bc/files/fix-segment-fault.patch b/meta/recipes-extended/bc/files/fix-segment-fault.patch
>> new file mode 100644
>> index 0000000..20c0da2
>> --- /dev/null
>> +++ b/meta/recipes-extended/bc/files/fix-segment-fault.patch
>> @@ -0,0 +1,28 @@
>> +Upstream-Status: Pending
>> +
>> +when run command such as 'echo "a = 13" | bc -l', it segmentation faults.
>> +This patch is from http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04602.html.
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +--- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
>> ++++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
>> +@@ -34,6 +34,7 @@
>> + #include <number.h>
>> + #include <assert.h>
>> + #include <stdlib.h>
>> ++#include <string.h>
> what does adding this include file fix ?

To be honest, I am not sure why add this include. After build it is 
harmless, so I didn't want to modify it because I think LFS is trustable.

Regards,
Kai

>
>> + #include <ctype.h>/* Prototypes needed for external utility routines. */
>> +
>> + #define bc_rt_warn rt_warn
>> +--- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
>> ++++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
>> +@@ -156,7 +156,7 @@
>> +   long  label_no;
>> +   long  vaf_name;	/* variable, array or function number. */
>> +   long  func;
>> +-  program_counter save_adr;
>> ++  static program_counter save_adr;
>> +
>> +   /* Initialize. */
>> +   str = code;
>> -- 
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Regards,
Neil | Kai Kang



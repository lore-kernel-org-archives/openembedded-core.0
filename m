Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D32F719E8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 18:18:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA4IIW07021112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Nov 2016 11:18:32 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 4 Nov 2016 11:18:32 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, Li Zhou
	<li.zhou@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<2dd71023-841c-f106-0b3e-8defa6bf2156@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <fbc539a3-f625-ae17-799e-73240f2e4c6d@windriver.com>
Date: Fri, 4 Nov 2016 13:18:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <2dd71023-841c-f106-0b3e-8defa6bf2156@linux.intel.com>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 18:18:32 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/4/16 11:12 AM, Leonardo Sandoval wrote:
> This patch cannot be applied because the modified file is not track by 
> oe-core.
> 

The original submitted should have mentioned this patch is against Jethro.
However the patch is directly applicable to master, morty and korgoth as well.

Li, please rebase this against master and then ask for it to be backported to
the others.

--Mark

> On 11/04/2016 03:07 AM, Li Zhou wrote:
>> The swpb in macro MUTEX_SET will cause "undefined instruction" error
>> on the new arm arches which don't support this assembly instruction
>> any more. If use ldrex/strex to replace swpb, the old arm arches don't
>> support them. So to avoid this issue, just disable the ARM assembler
>> mutex code, and use the default pthreads mutex.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-support/db/db_6.0.30.bb | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
>> index 50a469b..2d08b5e 100644
>> --- a/meta/recipes-support/db/db_6.0.30.bb
>> +++ b/meta/recipes-support/db/db_6.0.30.bb
>> @@ -74,15 +74,6 @@ DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
>>   
>>   EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
>>   
>> -# Override the MUTEX setting here, the POSIX library is
>> -# the default - "POSIX/pthreads/library".
>> -# Don't ignore the nice SWP instruction on the ARM:
>> -# These enable the ARM assembler mutex code
>> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
>> -MUTEX = ""
>> -MUTEX_arm = "${ARM_MUTEX}"
>> -MUTEX_armeb = "${ARM_MUTEX}"
>> -EXTRA_OECONF += "${MUTEX}"
>>   EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
>>   
>>   # Cancel the site stuff - it's set for db3 and destroys the
> 



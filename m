Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13A9B61576
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 02:58:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01I2w5fF018474
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:58:26 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 17 Feb 2020 18:58:06 -0800
From: Kang Kai <Kai.Kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20200211150741.2729-1-kai.kang@windriver.com>
	<2580ac74-38f2-4fdc-9030-7591d9cc26cb@windriver.com>
Message-ID: <a3ed156f-e851-545f-c33a-3ae6a7ffb82a@windriver.com>
Date: Tue, 18 Feb 2020 10:58:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2580ac74-38f2-4fdc-9030-7591d9cc26cb@windriver.com>
Subject: Re: [PATCH] glibc-package.inc: fix multilib headers conflict
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
X-List-Received-Date: Tue, 18 Feb 2020 02:58:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2020/2/18 上午10:55, Kang Kai wrote:
> On 2020/2/11 下午11:07, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Pass bits/endianness.h and bits/struct_rwlock.h to oe_multilib_header in
>> glibc-package.inc to fix files conflict:
>>
>> | Error: Transaction check error:
>> |   file /usr/include/bits/endianness.h conflicts between attempted 
>> installs of lib32-libc6-dev-2.31-r0.armv7vet2hf_vfp and 
>> libc6-dev-2.31-r0.aarch64
>> |   file /usr/include/bits/struct_rwlock.h conflicts between 
>> attempted installs of lib32-libc6-dev-2.31-r0.armv7vet2hf_vfp and 
>> libc6-dev-2.31-r0.aarch64
>
> Ping.
>
> Could reproduce with config
>
> require conf/multilib.conf
> MACHINE = "qemuarm64"
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"

And

IMAGE_INSTALL_append = " lib32-libc6-dev libc6-dev"

of course.


>
> Regards,
> Kai
>
>
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-package.inc 
>> b/meta/recipes-core/glibc/glibc-package.inc
>> index 3aed7be4f8..285a9aa2f5 100644
>> --- a/meta/recipes-core/glibc/glibc-package.inc
>> +++ b/meta/recipes-core/glibc/glibc-package.inc
>> @@ -87,7 +87,7 @@ do_install() {
>>           rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
>>       fi
>>   -    oe_multilib_header bits/syscall.h bits/long-double.h 
>> bits/floatn.h
>> +    oe_multilib_header bits/syscall.h bits/long-double.h 
>> bits/floatn.h bits/endianness.h bits/struct_rwlock.h
>>         if [ -f ${D}${bindir}/mtrace ]; then
>>           sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e 
>> '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
>
>

-- 
Kai Kang



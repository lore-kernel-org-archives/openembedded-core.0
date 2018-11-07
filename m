Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 3396265D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 07:41:08 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id F2E231C155B;
	Wed,  7 Nov 2018 08:41:08 +0100 (CET)
To: akuster808 <akuster808@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20181106100416.41548-1-martin@geanix.com>
	<58cd5d08-9d24-0e30-7f9c-3bec2c93ba84@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <45149dda-efa1-2b2f-e598-8b454ab66fa8@geanix.com>
Date: Wed, 7 Nov 2018 08:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <58cd5d08-9d24-0e30-7f9c-3bec2c93ba84@gmail.com>
Subject: Re: [PATCHv2] glibc: make ld-2.28.so reproducible on arm
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
X-List-Received-Date: Wed, 07 Nov 2018 07:41:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Armin,

On 06/11/2018 20.41, akuster808 wrote:
> Martin,
> 
> 
> On 11/6/18 2:04 AM, Martin Hundebøll wrote:
>> Play the whack-a-mole game and add the .file directive to another
>> assembly file that otherwise shows itself in ld-2.28.so debug file,
>> which in turns alters the build-id of ld-2.28.so on target.
>>
>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>> ---
>>
>> Changes since v1:
>>
>>   - Added signed-of-by tag
>>
>>   .../0034-inject-file-assembly-directives.patch      | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
>> index 3f9f8cf189..55eba2d43e 100644
>> --- a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
>> +++ b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
>> @@ -257,3 +257,16 @@ index 244d87fb6d..14d3e2ce14 100644
>>    /* Initial entry point code for the dynamic linker.
>>       The C function `_dl_start' is the real entry point;
>>       its return value is the user program's entry point.	*/
> 
> Please add Upsteam-Status: and Signed-off-by: in the patch itself.

It was Richard's patch, so I chose the less intrusive approach. I can do 
a refresh of the entire patch?

> You may want to review
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> This seems like a backport candidate for Thud too?

Yes, I was planning on bugging you was it hits master :)

Thanks,
Martin

> regards,
> 
> Armin
> 
>> +diff --git a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
>> +index d26ad1f8d3..a0de10bf81 100644
>> +--- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
>> ++++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
>> +@@ -27,6 +27,8 @@
>> +    ARM unwind tables for register to register moves, the actual opcodes
>> +    are not defined.  */
>> +
>> ++      .file "libc-do-syscall.S"
>> ++
>> + #if defined(__thumb__)
>> + 	.thumb
>> + 	.syntax unified

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706


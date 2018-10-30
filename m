Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 753D175264
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:11:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U3ACFC030643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Oct 2018 20:11:14 -0700
Received: from server.local (128.224.22.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 29 Oct 2018 20:10:57 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1540836778-6573-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=WCuu-Ls-Ch+dMiVnGKRSWvUM9sZd=NfvDw2Z6LLXAO2A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <52398487-0079-d88b-f349-0c760fe732fd@windriver.com>
Date: Mon, 29 Oct 2018 23:10:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WCuu-Ls-Ch+dMiVnGKRSWvUM9sZd=NfvDw2Z6LLXAO2A@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] kernel: change default kconfig mode to olddefconfig
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
X-List-Received-Date: Tue, 30 Oct 2018 03:11:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-10-29 9:02 PM, Andre McCurdy wrote:
> On Mon, Oct 29, 2018 at 11:13 AM Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>>
>> As was warned by commit 312ee68752fa ("kconfig: announce removal
>> of oldnoconfig if used"), it has been removed from the 4.20 kernel.
>>
>> So we switch our default mode to the proper olddefconfig
> 
> Mentioning which kernel version first introduced olddefconfig would be
> useful information here as kernels prior to that version will now fail
> to build. It looks like the patch was first proposed sometime around
> 2012:
> 
>    https://patchwork.kernel.org/patch/1394011/
> 
> We may also need to either add a fallback to use oldnoconfig or bump
> OLDEST_KERNEL (it's currently 3.2.0, which was released in early 2012
> and so probably predates olddefconfig).

We've covered this a few times in the past, and yah, we could
put a fallback into the command.

I'll spin out a v2 that adds a fallback like we used to have,
except now with the oldnoconfig as the 2nd option.

Bruce

> 
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> Not for the release, just wanted to get this in the queue for
>> when master reopens so we'll be ready for 4.20+ kernel versions
>>
>> Bruce
>>
>>   meta/classes/kernel.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index e04d2fe00434..d50f4a9ee822 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>>          :
>>   }
>>
>> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
>> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig"
>>
>>   python check_oldest_kernel() {
>>       oldest_kernel = d.getVar('OLDEST_KERNEL')
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



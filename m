Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C261D79CB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 20:07:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9UK7KSx007303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 13:07:21 -0700 (PDT)
Received: from server.local (128.224.22.151) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 30 Oct 2018 13:07:20 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1540926266-21324-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=XNsuVsh0SWvx-BB4H9r_Y+UsfJzqq4vFG=cs8_tpps2A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0a2e2424-f3f6-ac8e-93eb-794c17efe661@windriver.com>
Date: Tue, 30 Oct 2018 16:07:19 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XNsuVsh0SWvx-BB4H9r_Y+UsfJzqq4vFG=cs8_tpps2A@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 20:07:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-10-30 3:46 PM, Andre McCurdy wrote:
> On Tue, Oct 30, 2018 at 12:05 PM Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>>
>> As was warned by commit 312ee68752fa [kconfig: announce removal of
>> oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.
>>
>> So we switch our default mode to olddefconfig.
>>
>> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
>> and keep the old name as an alias] introduced olddefconfig in the 3.10
>> kernel, we shuffle oldnoconfig to the fallback target.
>>
>> The fallback mode allows kernels between 3.10 and the currently listed
>> oldest kernel of 3.2 to continue to configure.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> v3: dropped 'yes' from the pipeline
>>
>> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
>>
>> Not for the release, just wanted to get this in the queue for
>> when master reopens so we'll be ready for 4.20+ kernel versions
>>
>> Tested by configuring linux-yocto*
>>
>> Bruce
>>
>>
>>   meta/classes/kernel.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index e04d2fe00434..880c5ef17283 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>>          :
>>   }
>>
>> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
>> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
> 
> Apart from inexplicably swapping the positions of the O= and CC=
> options on the fallback command line (?!?), this version looks good.

never noticed :) I just cut and pasted it differently. I'll spare
everyone a v4 for that!

Bruce

> 
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



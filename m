Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B86978E4C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 17:17:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9UHHdrk013231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 10:17:39 -0700 (PDT)
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 30 Oct 2018 10:17:39 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
Date: Tue, 30 Oct 2018 13:17:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 17:17:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/30/18 1:02 PM, Andre McCurdy wrote:
> On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
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
>> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
>>
>> Not for the release, just wanted to get this in the queue for
>> when master reopens so we'll be ready for 4.20+ kernel versions
>>
>> Bruce
>>
>>
>>   meta/classes/kernel.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index e04d2fe00434..8fe207165ae8 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>>          :
>>   }
>>
>> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
>> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
> 
> There's no "yes" needed with oldnoconfig. The new fallback should just
> be the existing default command.

*shrug*

I'll leave this as is, since it works as tested. Feel free to
send followups.

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



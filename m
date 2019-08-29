Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10C7F7F296
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 03:04:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T33xLi015335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2019 20:04:27 -0700
Received: from [192.168.10.15] (172.25.59.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 20:03:58 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
	<0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
	<1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
	<fa27a4877d9dd0668e23873e02f8bd90bdf93ac0.camel@linuxfoundation.org>
	<f4465a3a-87fc-3233-9add-8655a2c10ed1@windriver.com>
	<e125a759ceaca090562af688aad68eaec89f7da2.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <1747485c-6e3b-4acf-81bb-89d4d6e80009@windriver.com>
Date: Wed, 28 Aug 2019 22:03:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e125a759ceaca090562af688aad68eaec89f7da2.camel@linuxfoundation.org>
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Thu, 29 Aug 2019 03:04:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 8/28/19 5:41 PM, Richard Purdie wrote:
> On Wed, 2019-08-28 at 15:24 -0500, Jason Wessel wrote:
>> On 8/27/19 7:15 PM, richard.purdie@linuxfoundation.org wrote:
>>> On Tue, 2019-08-27 at 19:03 -0500, Jason Wessel wrote:
>>>> On 8/27/19 5:58 PM, Richard Purdie wrote:
>>>>> Hi Jason,
>>>>> Somehow this change is responsible for this build failure:
>>>>>
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976
>>>>>
>>>>> (steps 5c and 7c so failure during testimage).
>>>>>
>>>>> I have bisected it to this change, I haven't looked into why.
>>>> Thanks for tracking it down.   I am sure how to try an duplicate
>>>> this.  I clicked around to try and find out a bit about what it
>>>> is
>>>> running for these phases of the build but it is not very obvious.
>>>>
>>>> Is there a local.conf I can try along with what ever commands it
>>>> ran?
>>> The configuration its using is shown in
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/978/steps/8/logs/stdio
>>> for each step.
>>>
>> I tried the configuration on my system but it seems to work fine, see
>> below.   Is there a way to get complete log file of the boot on the
>> broken host?  I am also curious if it fails every time or not.
>>
>> /home/pokybuild/yocto-worker/qa-
>> extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-
>> sato/1.0-r0/testimage/qemu_boot_log.20190827200002
>>
>> I am not sure it will tell us anything further or not, but it
>> certainly looks like the system didn't boot correctly in the first
>> place.
> I've rerun it as
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/983
>
>

I'll take a further look at it tomorrow.   I have no idea why systemd emitted this message:

[    4.750194] systemd[1]: Unnecessary job for /dev/ttyS1 was removed.
[    4.751666] systemd[1]: Unnecessary job for /dev/ttyS0 was removed.

[  OK  ] Started Serial Getty on ttyS0.
          Stopping Serial Getty on ttyS0...

I have an image now with the problem so, I'll make a copy of it in case the problem "goes away" again.  It will be interesting to see what the deal is with this corner case.

Cheers,

Jason.






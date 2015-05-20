Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5F160168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 17:02:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 May 2015 10:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,465,1427785200"; d="scan'208";a="713195889"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.36])
	([10.219.4.36])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2015 10:02:18 -0700
Message-ID: <555CBE65.5040500@linux.intel.com>
Date: Wed, 20 May 2015 12:03:33 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
	Dan McGregor <dan.mcgregor@usask.ca>,
	Darren Hart <dvhart@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1431357799-30306-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAPybu_3jHGff83nO-87zRA=rB2mu_EvnB=Uhn6EkSJzhxHW2Sw@mail.gmail.com>
In-Reply-To: <CAPybu_3jHGff83nO-87zRA=rB2mu_EvnB=Uhn6EkSJzhxHW2Sw@mail.gmail.com>
Subject: Re: [PATCH] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Wed, 20 May 2015 17:02:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ricardo,

I tested your patch and it's ok another improvement to it will be add a 
sleep 1 before chvt
because killproc xinit don't take a defined time to shutdown and chvt 
didn't work because
X it's running.

I'll modify a little your patch and send v2 with your signature.

Regards,
     alimon

On 20/05/15 03:34, Ricardo Ribalda Delgado wrote:
> ping?
>
> On Mon, May 11, 2015 at 5:23 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> If reboot was called from inside the Xserver there could happen a race
>> condition where chvt would never end, and therefore the whole system was
>> stalled.
>>
>> The user could not recover the system by ssh the machine or using the
>> keyboard.
>>
>> Running chvt in background fixes the issue.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>   meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> index 2e3e09077792..31f545f79199 100755
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
>> @@ -48,7 +48,7 @@ case "$1" in
>>     stop)
>>           echo "Stopping XServer"
>>           killproc xinit
>> -        chvt 1
>> +        chvt 1 &
>>     ;;
>>
>>     restart)
>> --
>> 2.1.4
>>
>
>



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC2B6057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:15:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3DHFOcq001789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 13 Apr 2016 10:15:25 -0700
Received: from server.local (147.11.119.99) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Apr 2016 10:15:24 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
	<570D631F.5020503@windriver.com>
	<CAMKF1srjaNz1dnZCHFkWn6=PyQ+w6Vb1FoF1rbDVCGaTCe3FrA@mail.gmail.com>
	<CAMKF1srQ5ayOr3ha=YTTGBS-ovX8Ht41ODoNaSEHBGW9EfjFGA@mail.gmail.com>
	<CAMKF1sqBwbkHWQBBzX8jbK0SoZtcMr6MO2ZSZ9dcMJJns6x+eQ@mail.gmail.com>
	<CAMKF1sq1kqM7iair34+2ZoxZh24=wszYniJ4cyoBc2M9_XzEQw@mail.gmail.com>
	<CAMKF1sou4V8jvOLKponmoR5gYsa8nEgXOa=ALF14Yyz23nrbEQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <570E7EAB.4030308@windriver.com>
Date: Wed, 13 Apr 2016 13:15:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sou4V8jvOLKponmoR5gYsa8nEgXOa=ALF14Yyz23nrbEQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Wed, 13 Apr 2016 17:15:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-13 11:57 AM, Khem Raj wrote:
> On Tue, Apr 12, 2016 at 3:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> I think I see the problem now. The constant should be converted to use Bnn
>> values. When calling the baudrate apis. I will send a patch for you to test
>> once I am close to computer
>
> I have sent a potential patch.
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120229.html
>
>   It worked on musl env that I had ready here. Can you test it
> with your env and make sure it works for you ?

confirmed. I reverted my local change, applied this and socat is
working without the assert.

Bruce

>
>
>
>
>>
>> On Apr 12, 2016 6:20 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>
>> Since you have it reproduced. Can you check which of the api call is
>> failing?
>>
>> On Apr 12, 2016 5:05 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
>> wrote:
>>>
>>> On 2016-04-12 1:53 PM, Khem Raj wrote:
>>>>
>>>> FYI
>>>
>>>
>>> Thanks. I can also confirm that when I dropped the patch, I'm
>>> back up and running assertion free.
>>>
>>> Bruce
>>>
>>>>
>>>> ---------- Forwarded message ----------
>>>> From: Gerhard Rieger <gerhard@dest-unreach.org>
>>>> Date: Wed, Mar 16, 2016 at 4:43 AM
>>>> Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
>>>> To: Khem Raj <raj.khem@gmail.com>
>>>>
>>>>
>>>> Thank you, I will check this patch!
>>>> - Gerhard
>>>>
>>>>
>>>> Am 15.03.2016 um 22:39 schrieb Khem Raj:
>>>>>
>>>>> Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
>>>>> instead of operating on c_ispeed and c_ospeed termios structure
>>>>> members directly because they are not guaranteed to exist on all
>>>>> libc implementations
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>>    xioinitialize.c | 8 ++++----
>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/xioinitialize.c b/xioinitialize.c
>>>>> index 9f50155..632ca4c 100644
>>>>> --- a/xioinitialize.c
>>>>> +++ b/xioinitialize.c
>>>>> @@ -65,10 +65,10 @@ int xioinitialize(void) {
>>>>>    #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET !=
>>>>> -1)
>>>>>    #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>>>>>    #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
>>>>> -      tdata.termarg.c_ispeed = 0x56789abc;
>>>>> -      tdata.termarg.c_ospeed = 0x6789abcd;
>>>>> -      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
>>>>> -      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
>>>>> +      cfsetispeed(&tdata.termarg, 0x56789abc);
>>>>> +      cfsetospeed(&tdata.termarg, 0x6789abcd);
>>>>> +      assert(cfgetispeed(&tdata.termarg) ==
>>>>> tdata.speeds[ISPEED_OFFSET]);
>>>>> +      assert(cfgetospeed(&tdata.termarg) ==
>>>>> tdata.speeds[OSPEED_OFFSET]);
>>>>>    #endif
>>>>>    #endif
>>>>>    #endif
>>>>>
>>>
>>



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C845965CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 21:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3CL5aZe030114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Apr 2016 14:05:36 -0700
Received: from server.local (128.224.22.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Apr 2016 14:05:35 -0700
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <570D631F.5020503@windriver.com>
Date: Tue, 12 Apr 2016 17:05:35 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Apr 2016 21:05:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-12 1:53 PM, Khem Raj wrote:
> FYI

Thanks. I can also confirm that when I dropped the patch, I'm
back up and running assertion free.

Bruce

>
> ---------- Forwarded message ----------
> From: Gerhard Rieger <gerhard@dest-unreach.org>
> Date: Wed, Mar 16, 2016 at 4:43 AM
> Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
> To: Khem Raj <raj.khem@gmail.com>
>
>
> Thank you, I will check this patch!
> - Gerhard
>
>
> Am 15.03.2016 um 22:39 schrieb Khem Raj:
>> Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
>> instead of operating on c_ispeed and c_ospeed termios structure
>> members directly because they are not guaranteed to exist on all
>> libc implementations
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   xioinitialize.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xioinitialize.c b/xioinitialize.c
>> index 9f50155..632ca4c 100644
>> --- a/xioinitialize.c
>> +++ b/xioinitialize.c
>> @@ -65,10 +65,10 @@ int xioinitialize(void) {
>>   #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
>>   #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>>   #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
>> -      tdata.termarg.c_ispeed = 0x56789abc;
>> -      tdata.termarg.c_ospeed = 0x6789abcd;
>> -      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
>> -      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
>> +      cfsetispeed(&tdata.termarg, 0x56789abc);
>> +      cfsetospeed(&tdata.termarg, 0x6789abcd);
>> +      assert(cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]);
>> +      assert(cfgetospeed(&tdata.termarg) == tdata.speeds[OSPEED_OFFSET]);
>>   #endif
>>   #endif
>>   #endif
>>



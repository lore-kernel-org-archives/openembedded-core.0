Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E82646BDE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 06:20:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBO6Jo0h015690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Dec 2018 22:19:50 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 23 Dec 2018 22:19:49 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1545293075.git.liezhi.yang@windriver.com>
	<3d6fbb3825ef92b93f0e99d4ff06af2156ecac71.1545293075.git.liezhi.yang@windriver.com>
	<CAJTo0LZE6v5A5ioR1B0iYiuaHiosK=BYpW4-0KqqGW-FT1MS=g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <11feb1dc-ce85-5e39-8f89-7d35405169a9@windriver.com>
Date: Mon, 24 Dec 2018 14:24:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZE6v5A5ioR1B0iYiuaHiosK=BYpW4-0KqqGW-FT1MS=g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] create-pull-request: fix sed command for SUBJECT
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
X-List-Received-Date: Mon, 24 Dec 2018 06:20:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/20/18 7:48 PM, Burton, Ross wrote:
> So if I sent a patch with the subject "Fix #1234" it fails?
> 
> Sounds like a good reason to rewrite create-pull-request in Python to
> avoid this nonsense.

Yes, that's a good idea, and we can improve it a little, such as:
* Check SOB, Upstream-Status and so on.
* Make it can check the patches on patchwork/patchtest if possible.

Our team can work on it if no objections.

// Robert

> 
> Ross
> On Thu, 20 Dec 2018 at 08:05, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Fixed when SUBJECT contains slash(/):
>> sed: -e expression #1, char 35: unknown option to `s'
>>
>> Use '#' as separator to fix the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/create-pull-request | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
>> index 280880b..ff0f7e6 100755
>> --- a/scripts/create-pull-request
>> +++ b/scripts/create-pull-request
>> @@ -278,7 +278,7 @@ fi
>>
>>   # Replace the SUBJECT token with it.
>>   if [ -n "$SUBJECT" ]; then
>> -       sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
>> +       sed -i -e "s#\*\*\* SUBJECT HERE \*\*\*#$SUBJECT#" "$CL"
>>   fi
>>
>>
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


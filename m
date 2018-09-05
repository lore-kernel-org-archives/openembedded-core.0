Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C004F762B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 06:09:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8569Dp3027292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 23:09:13 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Sep 2018 23:09:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1536042978.git.liezhi.yang@windriver.com>
	<ea8e96b3f2b09db17ecf9a28765b709433febe9b.1536042978.git.liezhi.yang@windriver.com>
	<8db3e1637d3c4714aa90df95492b2f84@XBOX02.axis.com>
	<57b7ac2a8b41e1c54460989cd27231330bb6cc33.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e8d15baa-ee1f-430f-d58c-9a79ff3ea145@windriver.com>
Date: Wed, 5 Sep 2018 14:12:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <57b7ac2a8b41e1c54460989cd27231330bb6cc33.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD
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
X-List-Received-Date: Wed, 05 Sep 2018 06:09:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09/04/2018 07:19 PM, Richard Purdie wrote:
> On Tue, 2018-09-04 at 08:15 +0000, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> <openembedded-
>>> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
>>> Sent: den 4 september 2018 08:37
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [PATCH 1/1] bitbake.conf: Make
>>> BUILD_OPTIMIZATION
>>> respect to DEBUG_BUILD
>>>
>>> We may also need debug native tools, so make BUILD_OPTIMIZATION
>>> respect to
>>> DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which
>>> isn't
>>> convenient.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/conf/bitbake.conf | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 1941633..df62445 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -612,7 +612,7 @@ FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>>>   DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}
>>> -pipe"
>>>   SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION',
>>> 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
>>>   SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION
>>> DEBUG_OPTIMIZATION"
>>> -BUILD_OPTIMIZATION = "-O2 -pipe"
>>> +BUILD_OPTIMIZATION = "${@['-O2', '-O -g -feliminate-unused-debug-
>>> types -fno-omit-frame-pointer'][d.getVar('DEBUG_BUILD') == '1']}
>>> -pipe"
>>
>> Can we make that more readable:
>>
>> BUILD_OPTIMIZATION = "${@'-O -g -feliminate-unused-debug-types -fno-
>> omit-frame-pointer' if d.getVar('DEBUG_BUILD') == '1' else '-O2'}
>> -pipe"
>>
>> Should probably do the same for SELECTED_OPTIMIZATION while at it:
>>
>> SELECTED_OPTIMIZATION = "${@d.getVar('DEBUG_OPTIMIZATION' if
>> d.getVar('DEBUG_BUILD') == '1' else 'FULL_OPTIMIZATION')}"
> 
> If we're going to deal with readability and usability we could add
> something like:
> 
> def vartrue(var, iftrue, iffalse, d):
>      if oe.types.boolean(d.getVar(var)):
>          return iftrue
>      else:
>          return iffalse

Thanks, looks good, I will send a V2.

// Robert

> 
> to lib/oe/utils and then:
> 
> BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)}"
> 
> Cheers,
> 
> Richard
> 
> 


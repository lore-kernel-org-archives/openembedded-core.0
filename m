Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.10906.1589540286369661282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04FAw339011837
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 15 May 2020 03:58:03 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 03:57:51 -0700
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
References: <cover.1589536566.git.liezhi.yang@windriver.com>
 <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
 <CAM9ZRVuv+aL55apdEvFeqrHx_Nq=CKA1EAk=QkfhC92+9UrSMw@mail.gmail.com>
 <cb24e3cb-d771-7100-dc4a-7c59ee002b7d@windriver.com>
 <CAM9ZRVsZ0z1PVWTd4cFoL1b+=wgAjcN2J98Koe7PrQux9U0BTg@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <08d07fc9-5a96-3825-880b-f5b5c1d8ae8a@windriver.com>
Date: Fri, 15 May 2020 18:56:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsZ0z1PVWTd4cFoL1b+=wgAjcN2J98Koe7PrQux9U0BTg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/15/20 6:32 PM, Paul Barker wrote:
> On Fri, 15 May 2020 at 11:22, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> On 5/15/20 6:16 PM, Paul Barker wrote:
>>> On Fri, 15 May 2020 at 10:57, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>
>>>> Set it to 0 can make it archive all the used sources during the build, nothing
>>>> will be filtered out, this is useful when we want to archive all the sources.
>>>>
>>>> This equals to:
>>>> COPYLEFT_LICENSE_INCLUDE = "*"
>>>> COPYLEFT_LICENSE_EXCLUDE = ""
>>>>
>>>> But there are a lot of settings in copyleft_filter.bbclass, so it may not work
>>>> when its default settings are changed, add the var ENABLE_COPYLEFT_FILTER will
>>>> make it more reliable.
>>>
>>> Why would copyleft_filter.bbclass not work when the settings are
>>> changed? They're intended to be configurable.
>>>
>>> I've been using `COPYLEFT_LICENSE_INCLUDE = "*"` in several projects
>>> for years now. I'm not sure that we need another overlapping variable
>>> which could confuse users further.
>>
>> As you know, there other settings in copyleft_filter.bbclass may affect
>> the result, such as:
>>
>> COPYLEFT_RECIPE_TYPES
>> COPYLEFT_PN_INCLUDE
>> COPYLEFT_PN_EXCLUDE
>>
>> These settings maybe changed, and it's not easy to detect the changes,
>> the ENABLE_COPYLEFT_FILTER can make it more reliable.
> 
> I still don't think I understand sorry. Why can't changes be detected?
> What's unreliable in the existing code? Are there specific failure
> cases we can give examples of?

If one of the above variables' value is changed in a conf file, the archiver
will still work, but the results will be changed, it's not hard for advanced
users to detect that, but not easy for newbies.

> 
> I think there's a good argument for renaming copyleft_filter.bbclass
> and all the variables since the names are confusing when you want the
> archiver to include non-copyleft packages. But that would cause churn
> and break lots of people's configs so I've never proposed it. Not sure
> we need a master variable to enable/disable the whole class though.

I think that the problem is archiver's results depend on copyleft_filter
a lot, but they should be two separated functions, so I proposed a
new var to control it. But keep the current status is also OK since it
works.

// Robert

> 
> Thanks,
> Paul
> 

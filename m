Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E47565CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:41:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K5fVh7016593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 21:41:32 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 19 Jan 2016 21:41:31 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
	<1452881834.27999.0.camel@rpsys.net> <569DA992.4030806@windriver.com>
	<20160119113742.GB2611@jama>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <569F1E41.2090509@windriver.com>
Date: Wed, 20 Jan 2016 13:42:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160119113742.GB2611@jama>
X-Originating-IP: [128.224.162.169]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-libc-headers: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 20 Jan 2016 05:41:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月19日 19:37, Martin Jansa wrote:
> On Tue, Jan 19, 2016 at 11:12:18AM +0800, Jian Liu wrote:
>>
>> On 2016年01月16日 02:17, Richard Purdie wrote:
>>> On Thu, 2016-01-14 at 14:46 +0800, Jian Liu wrote:
>>>> If setting IMAGE_INSTALL += "linux-libc-headers", do_rootfs will
>>>> cause
>>>> error.
>>>>     ERROR: linux-libc-headers not found in the base feeds
>>>>
>>>> This is because that there is no linux-libc-headers.rpm generated.
>>> There is no point in generating an empty package just for the sake of
>>> it. Surely you just shouldn't put that in IMAGE_INSTALL?
>>>
>>> Cheers,
>>>
>>> Richard
>> Yes, I submit this patch just considering that someone who is not
>> familiar with yocto may be confused
>> by this behavior. There is linux-libc-headers bb file so IMAGE_INSTALL
>> += "linux-libc-headers" is taken for
>> granted.
>>
>> This is really not a bug and it is just a usage problem.
> And you're making it worse, by allowing such person to install
> completely useless empty package assuming that (s)he installed
> linux-libc-headers to the image.
>
> Error message is _much_ better than empty useless package.
I understand. Thanks a lot.

>
>>>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
>>>> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
>>>> -headers.inc
>>>> index 2ba6ed5..403360b 100644
>>>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>>>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>>>> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
>>>> ${EXTENDPKGV})"
>>>>    
>>>>    INHIBIT_DEFAULT_DEPS = "1"
>>>>    DEPENDS += "unifdef-native"
>>>> +
>>>> +ALLOW_EMPTY_${PN} = "1"
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



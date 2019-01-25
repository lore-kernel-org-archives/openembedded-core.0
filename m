Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32A0160053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:03:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0P33Arw005476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2019 19:03:11 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 19:03:08 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1548313558.git.liezhi.yang@windriver.com>
	<10d326febf6744315b0cb324b98b9f3bd9ea4056.1548313558.git.liezhi.yang@windriver.com>
	<03cc0bf2cf2d942dcd7c05b89e039499dbe617b3.camel@linuxfoundation.org>
	<58737031-db96-d385-0188-b8a8b6966bd1@windriver.com>
	<60a143d2-8486-81a4-22b7-7c77f5090182@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1c18c112-3d58-f7f6-6b42-93da456b61d5@windriver.com>
Date: Fri, 25 Jan 2019 11:07:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <60a143d2-8486-81a4-22b7-7c77f5090182@windriver.com>
Subject: Re: [PATCH 1/1] native.bbclass: remove invalid CONFIG_SITE
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
X-List-Received-Date: Fri, 25 Jan 2019 03:03:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/25/19 10:59 AM, Robert Yang wrote:
> 
> 
> On 1/25/19 10:40 AM, Robert Yang wrote:
>>
>>
>> On 1/24/19 8:51 PM, Richard Purdie wrote:
>>> On Thu, 2019-01-24 at 15:06 +0800, Robert Yang wrote:
>>>> This CONFIG_SITE has no effect since autotools.bbclass handles it.
>>>> And the
>>>> comment line is out of date, it was for "CONFIG_SITE = ''", so remove
>>>> them.
>>>
>>> Going from memory, we had a problem where the path to sed was being
>>> encoded into scripts (e.g. libtool/autotools and others). It may be
>>> /usr/bin/sed on some systems and /bin/sed on others.

And for the sed issue, it has been set in meta/site/common:

ac_cv_path_SED=${ac_cv_path_SED=sed}

// Robert

>>>
>>> Are you sure this is no longer a problem?
>>
>> Yes, that might be a problem, please ignore the patch, and I will update the
>> comment:
> 
> After more investigations, I'm sure that site/native can be removed safely,
> I was mis-leaded by the following command just now:
> 
> $ bitbake m4-native -cconfigure -e > m4-native.py
> 
> It shows that CONFIG_SITE="/buildarea1/lyang1/poky/meta/site/native"
> 
> But if I run:
> $ bitbake m4-native -cconfigure
> 
> And check temp/run.do_configure:
> CONFIG_SITE="/buildarea1/lyang1/poky/meta/site/endian-little 
> /buildarea1/lyang1/poky/meta/site/common-linux 
> /buildarea1/lyang1/poky/meta/site/common-glibc 
> /buildarea1/lyang1/poky/meta/site/x86_64-linux 
> /buildarea1/lyang1/poky/meta/site/common "
> 
> So the site/native was never used, and I think that it can be removed safely.
> 
> The "$ bitbake m4-native -cconfigure -e" showed incorrect CONFIG_SITE, is this
> a bug, please ?
> 
> // Robert
> 
>>
>> "# Don't use site files for native builds"
>>
>> To:
>>
>> # Only use site/native for native builds
>>
>> // Robert
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   meta/classes/native.bbclass | 3 ---
>>>>   meta/site/native            | 1 -
>>>>   2 files changed, 4 deletions(-)
>>>>   delete mode 100644 meta/site/native
>>>>
>>>> diff --git a/meta/classes/native.bbclass
>>>> b/meta/classes/native.bbclass
>>>> index ddccfe2..c20c6dc 100644
>>>> --- a/meta/classes/native.bbclass
>>>> +++ b/meta/classes/native.bbclass
>>>> @@ -54,9 +54,6 @@ TOOLCHAIN_OPTIONS = ""
>>>>   # Don't build ptest natively
>>>>   PTEST_ENABLED = "0"
>>>> -# Don't use site files for native builds
>>>> -export CONFIG_SITE = "${COREBASE}/meta/site/native"
>>>> -
>>>>   # set the compiler as well. It could have been set to something else
>>>>   export CC = "${BUILD_CC}"
>>>>   export CXX = "${BUILD_CXX}"
>>>> diff --git a/meta/site/native b/meta/site/native
>>>> deleted file mode 100644
>>>> index 7dfb1cb..0000000
>>>> --- a/meta/site/native
>>>> +++ /dev/null
>>>> @@ -1 +0,0 @@
>>>> -ac_cv_path_SED=sed
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>>


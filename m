Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 424386E706
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:04:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0LF4Qig019142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 07:04:26 -0800 (PST)
Received: from [147.11.117.157] (147.11.117.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 21 Jan 2014 07:04:26 -0800
Message-ID: <52DE8C76.8020701@windriver.com>
Date: Tue, 21 Jan 2014 09:04:22 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>	<1390312633.874.84.camel@ted>
	<52DE7E17.2090301@linaro.org>
In-Reply-To: <52DE7E17.2090301@linaro.org>
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 21 Jan 2014 15:04:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/14, 8:03 AM, Koen Kooi wrote:
> On 01/21/2014 02:57 PM, Richard Purdie wrote:
>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>>> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
>>>
>>> Original behaviour:
>>>
>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
>>>
>>> Behaviour after this patch:
>>>
>>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>>> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split

My memory of the original theory was that there would be three different uses:

1 - I want no debug (stripped) software on the target and debug binaries (split)

2 - I want debug (not-stripped/not-split) software on the target

3 - I want no debug (stripped) software on the target, and I don't want debug 
binaries

So based on that, it looks like your change fixes things.  As the original 
implementation didn't allow for #3.

--Mark

>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> ---
>>>    meta/classes/package.bbclass | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> FWIW this resulted in a failure on minnow:
>>
>> http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio
>>
>> So we may have some fixing up to do before this change can be merged...
>
> I have that QA issue as warning not as error. I guess that's why my
> builds kept working :)
>
> Aside from that, what are your thoughts on this patch?
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



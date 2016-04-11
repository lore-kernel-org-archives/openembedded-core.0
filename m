Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6CD60111
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 01:17:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B1HPfc024272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Apr 2016 18:17:26 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 18:17:24 -0700
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570AFB23.9070507@windriver.com>
Date: Mon, 11 Apr 2016 09:17:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160410190630.GI16135@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 01:17:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:
> On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
>> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
>> example:
>> COMPATIBLE_MACHINE = "(qemux86)"
>
> That will match qemux86 and qemux86-64 and is by design! It's a regular

I'm afraid no, please see my last reply, for others such as
MACHINE_OVERRIDES, they never design to work in such a way, so I don't
think that COMPATIBLE_MACHINE should work in this way. If you really
want to match more, I think that you can set it as "(qemux86.*)" or
something familiar.

> expression, not an exact string match! There are plenty of recipes
> (especially outside of oe-core) that depend on this behavior, so please don't
> break it!

I checked oe-core, there isn't any wrong when set MACHINE to:
  "qemuarm"
  "qemuarm64"
  "qemumips"
  "qemumips64"
  "qemuppc"
  "qemux86"
  "qemux86-64"

and run bitbake world -g.

Would you please tell me which recipes outside of oe-core relay on this?
I think that we should fix the recipe.

// Robert

>
>
>> But it treated MACHINE = "qemux86-64" as matched. The similar to others.
>>
>> This patch fixes the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index f9697a9..f376478 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -469,7 +469,7 @@ python () {
>>           import re
>>           compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
>>           for m in compat_machines:
>> -            if re.match(need_machine, m):
>> +            if re.match('^' + need_machine + '$', m):
>>                   break
>>           else:
>>               raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


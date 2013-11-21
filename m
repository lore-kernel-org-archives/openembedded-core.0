Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAE66DA23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:48:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALEm9c7013291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 06:48:09 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 06:48:10 -0800
Message-ID: <528E1D2A.6000302@windriver.com>
Date: Thu, 21 Nov 2013 08:48:10 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Phil Blundell
	<pb@pbcl.net>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>	
	<1385019198-24458-2-git-send-email-mark.hatle@windriver.com>	
	<1385043945.23724.158.camel@phil-desktop.brightsign>
	<1385044552.16887.135.camel@ted>
In-Reply-To: <1385044552.16887.135.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 14:48:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/13, 8:35 AM, Richard Purdie wrote:
> On Thu, 2013-11-21 at 14:25 +0000, Phil Blundell wrote:
>> On Thu, 2013-11-21 at 01:33 -0600, Mark Hatle wrote:
>>> +def get_optimization(d):
>>> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
>>> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
>>> +        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
>>
>> Although the text of that warning is correct, users might find the
>> reference to eglibc slightly confusing if it's perf that they're trying
>> to build.
>>
>> Also, as I mentioned in a different thread not all that long ago when
>> someone submitted a similar patch for gcc-runtime, the proliferation of
>> parse-time python functions to bash SELECTED_OPTIMIZATION around doesn't
>> seem like all that good a thing: this will cause extra overhead for
>> everyone, even those who are not using -O0 and have no interest in perf.
>>
>> And, finally, it remains slightly unclear to me that this is really a
>> problem that the metadata needs to be solving.  I haven't seen any
>> particularly convincing explanation of why this can't or shouldn't just
>> be fixed in the distro configuration.
>
> I have to admit at this point, this may look better as an include file
> along the lines of:
>
> SELECTED_OPTIMIZATION = "-O0"
> SELECTED_OPTIMIZATION_pn-eglibc = "-O2"
> SELECTED_OPTIMIZATION_pn-perf = "-O2"
>
> since clutter the recipes with anonymous python fragments isn't
> particular desirable.

Thats part of the problem.  We only need to set -O2, when someone sets -O0.  But 
if they set -O1 or -Os (or any other -O...) it appears to work properly...

So the python fragment is used to establish a known functional set for that item.

--Mark

> Cheers,
>
> Richard
>



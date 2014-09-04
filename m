Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25CC971461
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 08:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s848Hura016209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Sep 2014 01:17:57 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 4 Sep 2014 01:17:55 -0700
Message-ID: <54082030.2090009@windriver.com>
Date: Thu, 4 Sep 2014 16:17:52 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409735063.git.Chong.Lu@windriver.com>			<ff575b1b7622194f6e15d1b38c191df729a80f47.1409735063.git.Chong.Lu@windriver.com>		<1409740959.12482.4.camel@ted>
	<5408146B.4060903@windriver.com>	 <54081D87.1030807@windriver.com>
	<1409818215.12482.20.camel@ted>
In-Reply-To: <1409818215.12482.20.camel@ted>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] perf: fix issue about package splitting
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
X-List-Received-Date: Thu, 04 Sep 2014 08:18:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/04/2014 04:10 PM, Richard Purdie wrote:
> On Thu, 2014-09-04 at 16:06 +0800, Chong Lu wrote:
>> On 09/04/2014 03:27 PM, Chong Lu wrote:
>>> On 09/03/2014 06:42 PM, Richard Purdie wrote:
>>>> On Wed, 2014-09-03 at 17:05 +0800, Chong Lu wrote:
>>>>> Currently, perf can't split to perf-archive, perf-tests, perf-python
>>>>> and
>>>>> perf-perl. All files are included in perf package. Change the files
>>>>> paths to
>>>>> make split successfully and add PACKAGECONFIG to make main pkg
>>>>> depends on sub
>>>>> pkgs as default.
>>>>>
>>>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>>>> ---
>>>>>    meta/recipes-kernel/perf/perf.bb | 17 ++++++++++++-----
>>>>>    1 file changed, 12 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/perf/perf.bb
>>>>> b/meta/recipes-kernel/perf/perf.bb
>>>>> index bfd210c..baf0077 100644
>>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>>> @@ -149,20 +149,27 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>      PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>>>>>    +PACKAGECONFIG ??= "archive perl python tests"
>>>>> +PACKAGECONFIG[archive] = ",,, ${PN}-archive"
>>>>> +PACKAGECONFIG[perl] = ",,, ${PN}-perl"
>>>>> +PACKAGECONFIG[python] = ",,, ${PN}-python"
>>>>> +PACKAGECONFIG[tests] = ",,, ${PN}-tests"
>>>>> +
>>>>>    RDEPENDS_${PN} += "elfutils"
>>>>>    RDEPENDS_${PN}-archive =+ "bash"
>>>>>    RDEPENDS_${PN}-python =+ "bash python"
>>>>>    RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
>>>>> +RDEPENDS_${PN}-tests =+ "python"
>>>> I now realise the trick you're playing with PACKAGECONFIG here. Instead
>>>> can we just define a package (say ${PN}-all but I'll accept a better
>>>> name) which has dependencies on archive perl python tests so then the
>>>> user can choose ${PN}, ${PN}-all or some other combination depending on
>>>> their needs?
>>> OK, I will put archive perl python and tests in ${PN}-full.
>> Sorry, I don't think we should use a pkg include four sub pkgs.
>> We have perf_feature_enabled to control whether enable perl and python,
>> so it is hard to use feature if we put four sub pkgs in one pkg.
> This isn't what I meant. I meant add a ${PN}-full package which
> RDEPENDS_${PN}-full = "${PN}-archive  ${PN}-python ${PN}-perl
> ${PN}-tests"

Do you mean I should use:

PACKAGECONFIG ??= "full"
PACKAGECONFIG[full] = ",,, ${PN}-full"
RDEPENDS_${PN}-full = "${PN}-archive  ${PN}-python ${PN}-perl ${PN}-tests"

Best Regards
Chong

> Cheers,
>
> Richard
>
>
>
>
>



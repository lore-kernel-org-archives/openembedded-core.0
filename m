Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7548705FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 06:58:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H6woMC004349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 23:58:50 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 16 Jul 2014 23:58:50 -0700
Message-ID: <53C77426.3080209@windriver.com>
Date: Thu, 17 Jul 2014 14:58:46 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1405497586.git.Chong.Lu@windriver.com>	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>	<CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>	<53C72A3A.50101@windriver.com>
	<CADkTA4MSh39enfLcF5VNtkTBpdBtkhZ8ZhkYXPfypKGTxDFe-w@mail.gmail.com>
In-Reply-To: <CADkTA4MSh39enfLcF5VNtkTBpdBtkhZ8ZhkYXPfypKGTxDFe-w@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Thu, 17 Jul 2014 06:59:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/17/2014 10:13 AM, Bruce Ashfield wrote:
> On Wed, Jul 16, 2014 at 9:43 PM, Chong Lu <Chong.Lu@windriver.com> wrote:
>> On 07/16/2014 09:04 PM, Bruce Ashfield wrote:
>>> On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>> Fix incorrect paths to split perf package.
>>> Can you elaborate here ? This commit message doesn't really tell us much.
>>> Why is the current split incorrect ? What is the symptom and result of the
>>> incorrect split ? Are the package contents the same after this change ?
>>>
>>> Bruce
>> Hi Bruce,
>>
>> Currently, perf can't split to perf-archive, perf-tests, perf-python and
>> perf-perl.
>> All files are included in perf package. For example, like perf-tests
>> package:
>> It generates files in '${exec_prefix}/libexec/perf-core/tests', not in
>> '${libdir}/perf/perf-core/tests'.
>> So I change the files paths to make split successfully.
> But that means, whether or not we like it, anything using perf has been using
> those "non splits" and getting everything when perf is installed.
>
> It's also might be in order to make the main perf package RDEPEND on
> the other three, to keep it consistent. Make it a ?= so it can be overridden,
> and then we can age it out over time.
>
> Bruce
Do you mean we should set RDEPENDS like:
     RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"

In perf.bb file, we have RDEPENDS_${PN} += "elfutils", so I think we 
should use
     RDEPENDS_${PN} += "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
to keep it consistent. Do you agree?

Or, we can also revert following commit to make all files in perf package.
     commit 36c3e923df85e685b707fe6bd84b053a5e366fe4
     Author: Henning Heinold <henning@itconsulting-heinold.de>
     Date:   Mon Jun 9 23:21:29 2014 +0200

         perf: split packging

Best Regards
Chong

>> I will improve commit message and resend a V2.
>>
>> Best Regards
>> Chong
>>
>>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/perf/perf.bb | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf.bb
>>>> b/meta/recipes-kernel/perf/perf.bb
>>>> index 20968f9..781a738 100644
>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>> @@ -166,10 +166,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests
>>>> ${RSUGGESTS_SCRIPTING}"
>>>>
>>>>    FILES_${PN} += "${libexecdir}/perf-core
>>>> ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
>>>>    FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
>>>> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>>>> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
>>>> -FILES_${PN}-python = "${libdir}/python*/site-packages
>>>> ${libdir}/perf/perf-core/scripts/python"
>>>> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
>>>> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
>>>> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
>>>> +FILES_${PN}-python = "${libdir}/python*/site-packages
>>>> ${exec_prefix}/libexec/perf-core/scripts/python"
>>>> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
>>>>
>>>>
>>>>    INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>
>



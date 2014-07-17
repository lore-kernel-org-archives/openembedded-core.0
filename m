Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id B6E0B6AC85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:22:58 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id u10so1473422lbd.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jciilE/k7VYZeksapG3NPvsIT+GlrB7jRecFp9doUV0=;
	b=Ky00VSh6M0v7PUIR7LZlhWE0Qxk2JdpqSwIMSIv2a18Ch+HLFwTbpdKxf/jvOG0rQu
	CK9zZgyhhGCP/Y9QT6uUWV5sgk3N+0ulQbfS0fUfxlp+qYaQ4/yqR3htHYenEbz+WECM
	xnSVFzN1U7i7eXL00NZty/BuiuFPO5z2CKVzQ7dvXLwotJioioCB5R5z8V32HUdw927F
	eJVqHQKxfag6XajkMTedFFecjQPq6kgyq+kxekscAlnFZP/g/aWtwoCsA0aODjGv7HnF
	zy1TcsoV59Yy1KIhXBclis+qqJ70CE2OLhqmpaA3QGctC7G5Vm5Okl2EiwoQTQ/XAzKO
	bk+Q==
MIME-Version: 1.0
X-Received: by 10.152.205.11 with SMTP id lc11mr32897099lac.46.1405603378978; 
	Thu, 17 Jul 2014 06:22:58 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Thu, 17 Jul 2014 06:22:58 -0700 (PDT)
In-Reply-To: <53C77426.3080209@windriver.com>
References: <cover.1405497586.git.Chong.Lu@windriver.com>
	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
	<CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>
	<53C72A3A.50101@windriver.com>
	<CADkTA4MSh39enfLcF5VNtkTBpdBtkhZ8ZhkYXPfypKGTxDFe-w@mail.gmail.com>
	<53C77426.3080209@windriver.com>
Date: Thu, 17 Jul 2014 09:22:58 -0400
Message-ID: <CADkTA4Og4QLo3Pkkys9pZqXqQQR6XoZ2SCmF1xrX89DN+LUYLA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 13:23:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 17, 2014 at 2:58 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>
> On 07/17/2014 10:13 AM, Bruce Ashfield wrote:
>>
>> On Wed, Jul 16, 2014 at 9:43 PM, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>
>>> On 07/16/2014 09:04 PM, Bruce Ashfield wrote:
>>>>
>>>> On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com>
>>>> wrote:
>>>>>
>>>>> Fix incorrect paths to split perf package.
>>>>
>>>> Can you elaborate here ? This commit message doesn't really tell us
>>>> much.
>>>> Why is the current split incorrect ? What is the symptom and result of
>>>> the
>>>> incorrect split ? Are the package contents the same after this change ?
>>>>
>>>> Bruce
>>>
>>> Hi Bruce,
>>>
>>> Currently, perf can't split to perf-archive, perf-tests, perf-python and
>>> perf-perl.
>>> All files are included in perf package. For example, like perf-tests
>>> package:
>>> It generates files in '${exec_prefix}/libexec/perf-core/tests', not in
>>> '${libdir}/perf/perf-core/tests'.
>>> So I change the files paths to make split successfully.
>>
>> But that means, whether or not we like it, anything using perf has been
>> using
>> those "non splits" and getting everything when perf is installed.
>>
>> It's also might be in order to make the main perf package RDEPEND on
>> the other three, to keep it consistent. Make it a ?= so it can be
>> overridden,
>> and then we can age it out over time.
>>
>> Bruce
>
> Do you mean we should set RDEPENDS like:
>     RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
>
> In perf.bb file, we have RDEPENDS_${PN} += "elfutils", so I think we should
> use
>     RDEPENDS_${PN} += "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
> to keep it consistent. Do you agree?

Consistency is one thing, but it won't allow the split package to be
easily dropped,
so I'd still suggest that the ?= would make it easier to override.

Bruce

>
> Or, we can also revert following commit to make all files in perf package.
>     commit 36c3e923df85e685b707fe6bd84b053a5e366fe4
>     Author: Henning Heinold <henning@itconsulting-heinold.de>
>     Date:   Mon Jun 9 23:21:29 2014 +0200
>
>         perf: split packging
>
> Best Regards
> Chong
>
>
>>> I will improve commit message and resend a V2.
>>>
>>> Best Regards
>>> Chong
>>>
>>>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>>>> ---
>>>>>    meta/recipes-kernel/perf/perf.bb | 8 ++++----
>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/perf/perf.bb
>>>>> b/meta/recipes-kernel/perf/perf.bb
>>>>> index 20968f9..781a738 100644
>>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>>> @@ -166,10 +166,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests
>>>>> ${RSUGGESTS_SCRIPTING}"
>>>>>
>>>>>    FILES_${PN} += "${libexecdir}/perf-core
>>>>> ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
>>>>>    FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
>>>>> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>>>>> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
>>>>> -FILES_${PN}-python = "${libdir}/python*/site-packages
>>>>> ${libdir}/perf/perf-core/scripts/python"
>>>>> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
>>>>> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
>>>>> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
>>>>> +FILES_${PN}-python = "${libdir}/python*/site-packages
>>>>> ${exec_prefix}/libexec/perf-core/scripts/python"
>>>>> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
>>>>>
>>>>>
>>>>>    INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>>>>> --
>>>>> 1.9.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


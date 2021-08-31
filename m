Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.1251.1630384147443968257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 21:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=I8L7H04q;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mKvOI-0007JM-LQ; Tue, 31 Aug 2021 06:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vR4wZnXoRMLlHYyU5xjvBCU6xO1INj5cmPZvD4mCYWc=; b=I8L7H04qKKjcSOlpGxjTcG0oGI
	m8YeP7qVkFiAjis51SMl2ZKQWXa8Yb8knB/YMG/mlo083ojq7cCrlZ1AZptXS1Jy1WOmhmsFQDPbc
	1fFjTlpkK3iKxDGAeM1OorrnN3uqAzQCdifThF5I+sG7xJoYC6wbsa2p8YZ2n1RWd6P7SeCjCebvH
	XHXdHnY0dMhdj51GhYPMusQBjQTSWLMyevjV7U61DcDwaqWbizMOqAslbaVv8qqgjnFuqmWqJ7/4F
	yHP6JnxDckDUGd3lurYXzoKqL1HRP/Ix9i7wpUIo+7GkXL33i+UAMA3bmrn8zb4FvBgoUq3mssCs0
	i0eanCEQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mKvOE-0001DY-99; Tue, 31 Aug 2021 06:28:52 +0200
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: Jon Mason <jdmason@kudzu.us>, Andrey Zhizhikin <andrey.z@gmail.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20210823145450.103319-1-zboszor@pr.hu>
 <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu>
 <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
 <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com>
 <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
 <CAPoiz9xDN1Mx6B_TWFn0FYArM1+Y1PoXmY5TBqMBo4CHk3KfiA@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <f52a6dae-426c-34f3-448d-e4ba50b23438@pr.hu>
Date: Tue, 31 Aug 2021 06:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPoiz9xDN1Mx6B_TWFn0FYArM1+Y1PoXmY5TBqMBo4CHk3KfiA@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: 6e8e55c9b1de86adf00aae073b3499a9
X-Spam-Tracer: backend.mail.pr.hu -1.3 20210831042852Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 30. 21:51 keltezéssel, Jon Mason írta:
> On Mon, Aug 30, 2021 at 6:26 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>
>> On Mon, Aug 30, 2021 at 12:06 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>
>>> 2021. 08. 30. 11:30 keltezéssel, Andrey Zhizhikin írta:
>>>> Hello Zoltan,
>>>>
>>>> On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
>>>> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>
>>>>> If the kernel configuration enables module signing but no key
>>>>> is provided, then the kernel generates one during the kernel build.
>>>>>
>>>>> The current runtime-dependency references (with only package names
>>>>> without full versions) allow mixed package installations from different
>>>>> rebuilds of the same kernel version.
>>>>>
>>>>> This creates an issue because then the modules either don't work
>>>>> or taint the kernel.
>>>>>
>>>>> Tighten RDEPENDS with the full package version, i.e. use (= ${EXTENDPKGV})
>>>>> markers for inter-package dependencies.
>>>>>
>>>>> The kernel will pull in the kernel-modules subpackage of the same
>>>>> exact version automatically if KERNEL_SPLIT_MODULES="0" is set.
>>>>> Otherwise the situation is the same as with the old default with
>>>>> one subpackage per kernel module where they have to be upgraded
>>>>> manually.
>>>>>
>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> ---
>>>>>    meta/classes/kernel.bbclass | 13 +++++++------
>>>>>    1 file changed, 7 insertions(+), 6 deletions(-)
>>>>>
>>>> I'm seeing errors during the do_rootfs() with this patch applied,
>>>> there are few messages like this:
>>>>
>>>>    * Solver encountered 1 problem(s):
>>>>    * Problem 1/1:
>>>>    *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
>>>> requires kernel-5.13.13+g91381833a4e2, but none of the providers can
>>>> be installed
>>>>    *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
>>>> requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
>>>> the providers can be installed
>>>>    *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
>>>> requires kernel-image-5.13.13+g91381833a4e2 =
>>>> 5.13.13+git0+91381833a4-r0, but none of the providers can be installed
>>>>    *   - conflicting requests
>>>>    *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =
>>>> 5.13.13+gitAUTOINC+91381833a4-r0 needed by
>>>
>>> This seems to be the problem.
>>> Is there a "kernel-image-image-5.13.13" built from your kernel recipe?
>>
>> Yes, it is produced. But for some reasons opkg cannot resolve it
>> during the do_rootfs(), which is quite odd.
> 
> I'm seeing the same issue.  All of the BSPs that I set the kernel to
> not be 5.13 (i.e., 5.10, 5.4, etc) fail.  For example,
> https://gitlab.com/jonmason00/meta-arm/-/jobs/1544819828
> If I set the PACKAGE_CLASS to be rpm instead of ipk, everything works
> as expected.  So, there must be some difference in the dep calculation
> in ipk.

Interesting.

Can you both please try setting KERNEL_SPLIT_MODULES="0" in your kernel recipe?
In my testing, it works for both ipk and rpm properly.

I am thinking that probably the full version dependency should
only be used in the KERNEL_SPLIT_MODULES="0" case.
This can be easily tested, unlike the packaging method.


> 
> 
> Thanks,
> Jon
> 
>>> For me, a kernel-image-bzimage-x.y.z is built.
>>>
>>>> kernel-image-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
>>>>    *
>>>>    * Solution 1:
>>>>    *   - do not ask to install a package providing kernel-modules
>>>>
>>>> Reverting this commit does solve it, but I would like to understand
>>>> more on what should be done in order to use this new mechanism you've
>>>> introduced. Do you have any suggestion on what should be adapted in
>>>> the BSP layer to have those RDEPENDS properly resolved?
>>>>
>>>> Package manager is set for me to IPK.
>>>>
>>>> Setting KERNEL_SPLIT_MODULES="1" does not solve the issue.
>>>
>>> This is the default.
>>> But setting it to "0" won't change whether the
>>> kernel-image-image-x.y.z subpackage gets built or not.
>>>
>>
>>
>> --
>> Regards,
>> Andrey.
>>
>>
>>
>>
>>
>> 
>>


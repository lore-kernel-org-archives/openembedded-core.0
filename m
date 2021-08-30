Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.15092.1630318027046342405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 03:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=APtC2fbt;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mKeC0-0007f7-8n; Mon, 30 Aug 2021 12:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ljuboYHPXF1UA9SGBrqUIK4HHDA3pJPiAelGl5JjbZM=; b=APtC2fbtTW5WaLUU6Bj7GD2KOC
	cH3xxeCEP5/bw2L7uS+x381Pxie9moCp1zFdxMgW/551ec/3PmGBQVXarUE9q1Lb5DXXMmQV9TeEF
	DxRlZc7zl+PczYbp754GN37oT6rmYU1Md82LjFSZbu0bgfGVsC5vp5Bsld8qvZHIls+IT5TtO7Swi
	ya/RWd1pzAsH7jtQuP7rLpACnUsalxIA6ZODXTgVPwFHcmmkMkhVXbwIsVBuxFHxynZHoKrCnxBP4
	pswTEX2mbdJH/y+kMv8ZcqSNJ7c07oKZ1r90QkWZ6rFHbUv2sqZ7uWSYql0xNA1ay3E9IbdDQM/FR
	XCMe2owQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mKeBw-0003N0-77; Mon, 30 Aug 2021 12:07:02 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: Andrey Zhizhikin <andrey.z@gmail.com>, zboszor@pr.hu
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20210823145450.103319-1-zboszor@pr.hu>
 <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu>
 <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
Message-ID: <548432de-7bb8-eee6-a4d6-bda1b9476dbe@pr.hu>
Date: Mon, 30 Aug 2021 12:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: 2da2f9fc373ce6b0f4ec2747a0f9b020
X-Spam-Tracer: backend.mail.pr.hu -1.3 20210830100702Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

2021. 08. 30. 11:30 keltezéssel, Andrey Zhizhikin írta:
> Hello Zoltan,
>
> On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> If the kernel configuration enables module signing but no key
>> is provided, then the kernel generates one during the kernel build.
>>
>> The current runtime-dependency references (with only package names
>> without full versions) allow mixed package installations from different
>> rebuilds of the same kernel version.
>>
>> This creates an issue because then the modules either don't work
>> or taint the kernel.
>>
>> Tighten RDEPENDS with the full package version, i.e. use (= ${EXTENDPKGV})
>> markers for inter-package dependencies.
>>
>> The kernel will pull in the kernel-modules subpackage of the same
>> exact version automatically if KERNEL_SPLIT_MODULES="0" is set.
>> Otherwise the situation is the same as with the old default with
>> one subpackage per kernel module where they have to be upgraded
>> manually.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>    meta/classes/kernel.bbclass | 13 +++++++------
>>    1 file changed, 7 insertions(+), 6 deletions(-)
>>
> I'm seeing errors during the do_rootfs() with this patch applied,
> there are few messages like this:
>
>    * Solver encountered 1 problem(s):
>    * Problem 1/1:
>    *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> requires kernel-5.13.13+g91381833a4e2, but none of the providers can
> be installed
>    *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
> the providers can be installed
>    *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> requires kernel-image-5.13.13+g91381833a4e2 =
> 5.13.13+git0+91381833a4-r0, but none of the providers can be installed
>    *   - conflicting requests
>    *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =
> 5.13.13+gitAUTOINC+91381833a4-r0 needed by

This seems to be the problem.
Is there a "kernel-image-image-5.13.13" built from your kernel recipe?
For me, a kernel-image-bzimage-x.y.z is built.

> kernel-image-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
>    *
>    * Solution 1:
>    *   - do not ask to install a package providing kernel-modules
>
> Reverting this commit does solve it, but I would like to understand
> more on what should be done in order to use this new mechanism you've
> introduced. Do you have any suggestion on what should be adapted in
> the BSP layer to have those RDEPENDS properly resolved?
>
> Package manager is set for me to IPK.
>
> Setting KERNEL_SPLIT_MODULES="1" does not solve the issue.

This is the default.
But setting it to "0" won't change whether the
kernel-image-image-x.y.z subpackage gets built or not.



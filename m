Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28050CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 22:09:15 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2273.1755727748470739071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 15:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JqZe9jvf;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KM97li3291469;
	Wed, 20 Aug 2025 17:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755727747;
	bh=hqK7vtPYnxjCOP2w39v1Om4pdDVsH4h+DV/9ZW1pHL4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JqZe9jvf2BIV4ntEWIqDelnDxV04UlBVKySQJCJUIgqmalBZMF/qE/zgBbgCguSSb
	 IT89P9MM7q3KW+bMNG6oVj5y4M9PitB0x8/prbb2jD9ocUFP+9KYyU+zHmUOm3bbix
	 P5akTzPfB6UdpXZmE0l1SecpI3tX7qBh1n8LrYZc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KM97Nj2353324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 17:09:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 17:09:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 17:09:06 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KM96vK1169225;
	Wed, 20 Aug 2025 17:09:06 -0500
Message-ID: <4bad79a6-56d8-42ee-b5ba-441a13cdb535@ti.com>
Date: Wed, 20 Aug 2025 17:09:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add PACKAGECONFIG option for
 tests
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <rs@ti.com>
References: <20250819221357.997067-1-a-christidis@ti.com>
 <CANNYZj91HOj3joAHdT0Z_JSxxgMmCeXaLb7NOJXsHqAqVZ+eVg@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CANNYZj91HOj3joAHdT0Z_JSxxgMmCeXaLb7NOJXsHqAqVZ+eVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 22:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222198

Dear Alex,

Thank you for the feedback. This is my first time working with ptest so 
I have some implementation questions:

Texas Instrument does all of its testing without ptest, so what if the 
recipe creates a PN-tests package ?

In the above scenario, the recipe checks if PACKAGECONFIG includes tests 
and DISTRO_FEATURES doesn't include ptest, if so create a package called 
PN-tests.
Use the do_install:append task I have included in the 1st version of 
patch. Use FILES variable to package the right binaries.


Now, I still want to introduce support for ptest, if that is the case 
there should be a path to not create a PN-tests package and instead 
create a PN-ptest package.

I'll do that by introducing a do_install_ptest task, where files are 
installed under PTEST_PATH variable as expected, and then packaged 
automatically under PN-ptest package.
I'll also add a conditional within PACKAGECONFIG ??= , to add "tests" 
automatically if DISTRO_FEATURES includes ptest.

Let me know what you think, and/or if I have see any flaws in 
logic/assumptions.

Kind Regards,
Antonios

On 8/20/25 2:14 AM, Alexander Kanavin wrote:
> On Wed, 20 Aug 2025 at 00:14, Antonios Christidis via
> lists.openembedded.org <a-christidis=ti.com@lists.openembedded.org>
> wrote:
>> +do_install:append() {
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
>> +               install -d ${D}${bindir}/sdl2_tests
>> +               cp -r ${B}/test/* ${D}${bindir}/sdl2_tests
>> +
>> +               # Delete any leftover cmake files within the sdl2_tests dir
>> +               find ${D}${bindir}/sdl2_tests -type f -name "*.cmake" -delete
>> +       fi
>> +}
> The PACKAGECONFIG is okay, but this isn't. If you want to install the
> tests, you should also add run-ptest script, ptest package, and ensure
> they pass. Ideally, you should also make a patch to sdl that does the
> installation and offer that to upstream, rather than do it in a custom
> do_install snippet.
>
> Alex


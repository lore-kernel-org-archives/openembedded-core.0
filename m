Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0FCCD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 17:25:02 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.web10.20610.1725211497192458115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 10:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector1 header.b=v9u6mj+z;
 spf=pass (domain: runbox.com, ip: 185.226.149.38, mailfrom: realint@runbox.com)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <realint@runbox.com>)
	id 1skoJr-00BDrY-0u; Sun, 01 Sep 2024 19:24:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Reply-To:MIME-Version:Date:Message-ID;
	bh=hLPZGUCC63UP/h0rfAQMzLp+5P5RhyQ1WJ94VHhrzjc=; b=v9u6mj+zCUZ3wXKbSnDjmne/ev
	IC28/M1LUXm9rVOKxpXiH9nC2KgTDTUGU+W3nOb+ncCvFFoJfqfQsaPR6PGNQB0zqtaXp8mVud1tN
	sUt/KEAmx4HkPaZrltvVu3EsozSuVoA4H4BTT6p48jDR6Nq1f1qLPwn9fIqDzHIQmWy5rydbJprVL
	xMYl3EJLGMX3Wov8e4SrexsMMXI7J4bPAAbdLoJBLGpwBw6mSs7KUGci9LdIPNBKjkuC1beD6WWPu
	2tesE6rNHbzwQt+h65RA6vuq3x9AyZuhMi3uW0fNWdqapCjRhOA5RHf+N3sLK+KVkQ63xTjBciBQV
	Qk+hxUaA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <realint@runbox.com>)
	id 1skoJn-0004w3-Mo; Sun, 01 Sep 2024 19:24:54 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1skoJX-00DG67-I9; Sun, 01 Sep 2024 19:24:35 +0200
Message-ID: <c6ee0d69-bc30-404c-9883-47faab5255f5@runbox.com>
Date: Sun, 1 Sep 2024 20:24:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: niko.mauno@iki.fi
Subject: Re: [OE-core] [PATCH] icu: Fix 'buildpaths' QA error
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240831130113.34867-1-niko.mauno@vaisala.com>
 <b7b2d9e74f400fb604c2f5976538b1f788dd50f0.camel@linuxfoundation.org>
From: Niko Mauno <realint@runbox.com>
Content-Language: en-US
In-Reply-To: <b7b2d9e74f400fb604c2f5976538b1f788dd50f0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 17:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204051

On 9/1/24 13:55, Richard Purdie wrote:
> On Sat, 2024-08-31 at 16:01 +0300, Niko Mauno via
> lists.openembedded.org wrote:
>> Add stripping of STAGING_DIR_NATIVE during target/nativesdk specific
>> do_install, which mitigates following BitBake failure:
>>
>>    ERROR: icu-75-1-r0 do_package_qa: QA Issue: File
>> /usr/lib/icu/75.1/pkgdata.inc in package icu-dev contains reference
>> to TMPDIR [buildpaths]
>>    ERROR: icu-75-1-r0 do_package_qa: Fatal QA errors were found,
>> failing task.
>>
>> While doing so, we also drop HOSTTOOLS_DIR stripping, as it's value
>> does not appear in the content of either file that are manipulated
>> here.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/recipes-support/icu/icu_75-1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Why aren't we seeing this issue in automated test?

I should have known better, in a new workspace I was unable to reproduce 
to issue. Apologies for the noise.
-Niko


Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB7E7F154
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 02:56:04 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.9624.1695783353771219357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 19:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=fANuTQFA;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id E2EA724D2;
	Wed, 27 Sep 2023 04:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695783351;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=866; bh=CgoaGzXOIJM4sUdoSxlkzNXRof3NkpSvF6voaut+Kdc=;
	b=fANuTQFAi35I18baSshrtVTZahbBfZ2chUfnTWxC/w0/lLDd9RnplCNtOkod9RF+
	ziNL+agnM9sRiARgIp4WntRltS6YyVGyN6O7hAg1y3vjYykuSkRhjKLxH7NfnbcCJkT
	qii/ksBVICmarIsxoJsPcxjyJ7jfMxCbxlda29qx3qTj1ESMHnjkwjlUtvYULpQzvVR
	AdsySOX3p7cstIdr3Z+66cJJp8CcM9QfycQThCchKJMtiDo770tz+1Qf09mtzLt2ES1
	iHCJKKl1lHhD2Eent7Wo3a5a2bZnB9qRJ1hoe8cfZJRHWYMATBGcuiPdxElfjD2CO1u
	ViaHJR7dgQ==
Received: by smtp.mailfence.com with ESMTPSA ; Wed, 27 Sep 2023 04:55:49 +0200 (CEST)
Message-ID: <2f1c0aa0-872b-485b-9497-34114b93bb8a@redrectangle.org>
Date: Tue, 26 Sep 2023 19:55:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] curl: Update from 8.2.1 to 8.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230923172500.3425735-1-robert.joslyn@redrectangle.org>
 <CAMKF1so02nmDcYJHYodzU9Q7OzxU9VTjkJ6xp7gXhjWJOvdP3A@mail.gmail.com>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <CAMKF1so02nmDcYJHYodzU9Q7OzxU9VTjkJ6xp7gXhjWJOvdP3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:454140407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 02:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188287

On 9/26/23 7:55 AM, Khem Raj wrote:
> I am seeing a ptest failure on qemx86-64/glibc
>
>    Failed ptests:
>    {'curl': ['test_1474', 'curl']}

In looking at the test, it is marked as flaky with the comment:

# Because of the timing sensitivity (scheduling delays of 500 msec can cause
# the test to fail), this test is marked flaky to avoid it being run in 
the CI
# builds which are often run on overloaded servers.

https://github.com/curl/curl/blob/curl-8_3_0/tests/data/test1474#L21

My server is pretty lightly loaded while running the tests, so that 
could explain why I haven't seen it fail normally. I was able to induce 
a failure by running a very heavy load while running that test on my 
desktop (which is older and slower than my build server). If you'd like, 
I can send a follow up patch to skip tests marked as flaky.

Thanks,

Robert



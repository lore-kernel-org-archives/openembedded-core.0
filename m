Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F251BE80AA8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 13:54:02 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.17738.1695822833922578776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 06:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=MqDjbayF;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 93B216B2;
	Wed, 27 Sep 2023 15:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695822831;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=1681; bh=qOThGRaSGXt4UQsJWO6DVJlZOA2eKj8mLsqujhuBVHA=;
	b=MqDjbayF2CosiSilUu4o5A9Ssp6JkUx3X/yDj83ecUUvezhwqDLT/7OM5jjsR22I
	WsCC+Rzd7/CqbTFNZrRwoG1DNh86Vr30ravRuDP1M7/W+73dTwsPQ1d0Y4A94/I0oU9
	ErNdKifgE76kZzYcfkE5UCm2m1jJfdHsRMjWLkK6nMBfhoEtmEFCwQmmEhOdfG7Z95m
	FxqquqKBIMCpHsky81mXxTWSvBN5wuZ7vjwlybFbAuAntYeo8jVeWm7lu9zw7RVEiWR
	XJ3ZTQtMwCfl0Zgg5Ig72voGnkEL+YXjZEfi8hV6w4LEeB7mnqcf7rKV9dOUM4yJOmJ
	QC918kkPAA==
Received: by smtp.mailfence.com with ESMTPSA ; Wed, 27 Sep 2023 15:53:47 +0200 (CEST)
Message-ID: <4f30870b-b0c3-4ad8-91f5-7ad9ba18a264@redrectangle.org>
Date: Wed, 27 Sep 2023 06:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] curl: Update from 8.2.1 to 8.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230923172500.3425735-1-robert.joslyn@redrectangle.org>
 <CAMKF1so02nmDcYJHYodzU9Q7OzxU9VTjkJ6xp7gXhjWJOvdP3A@mail.gmail.com>
 <2f1c0aa0-872b-485b-9497-34114b93bb8a@redrectangle.org>
 <CAMKF1sq5X88ida1avvUp8ndC2BQoEr5sUvbkdm0LPDRB8KNiMg@mail.gmail.com>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <CAMKF1sq5X88ida1avvUp8ndC2BQoEr5sUvbkdm0LPDRB8KNiMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188321

On 9/26/23 8:51 PM, Khem Raj wrote:
> On Tue, Sep 26, 2023 at 7:55=E2=80=AFPM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
>> On 9/26/23 7:55 AM, Khem Raj wrote:
>>> I am seeing a ptest failure on qemx86-64/glibc
>>>
>>>     Failed ptests:
>>>     {'curl': ['test_1474', 'curl']}
>> In looking at the test, it is marked as flaky with the comment:
>>
>> # Because of the timing sensitivity (scheduling delays of 500 msec can=
 cause
>> # the test to fail), this test is marked flaky to avoid it being run i=
n
>> the CI
>> # builds which are often run on overloaded servers.
>>
>> https://github.com/curl/curl/blob/curl-8_3_0/tests/data/test1474#L21
>>
>> My server is pretty lightly loaded while running the tests, so that
>> could explain why I haven't seen it fail normally. I was able to induc=
e
>> a failure by running a very heavy load while running that test on my
>> desktop (which is older and slower than my build server). If you'd lik=
e,
>> I can send a follow up patch to skip tests marked as flaky.
>>
> another run resulted in yet another failure
>
>    test 0587...
>     FAIL: 587: protoc!
>     There was no content at all in the file log/2/server.input.
>     Server glitch? Total curl failure? Returned: 42
>
> prior to this upgrade my test setup never saw curl failures and it has
> same amount of load etc.

Test 587 is also marked flaky by upstream. There are 12 tests marked as=20
flaky total, and since you've just hit two of them, I'm much more=20
inclined to just skip them. Right before this version bump there was=20
also an update to run the curl ptests in parallel, which could be=20
contributing to the change in test behavior.

Thanks,

Robert



Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45833C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 17:58:06 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.18801.1707847081607052411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 09:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kD5z4tE2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42c6b6ec76eso29385701cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707847080; x=1708451880; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhUnicXSns42joU50CjQVInnNyyTKkuVTdbvxk2jiY4=;
        b=kD5z4tE2yTMeG6pFek0jamKd7WMeJCRlf4xnNiXaa57Ezl8asKeCvtLDTRuZvqwQvO
         HwwLTHx19btvkok4qkHRuyDVVW3/MamYkB99lKG8VKRpufvNYcZD0E317EVAwS60jNaw
         SNTwBUubvtVkwIERPgUySMHtBTQf+1/wq2B7Uc5Ub7IkC+jrIiaYlciGPtnRqq2H7QrA
         7ULOcL1qskNago67696tvwt/jGREcroNOmGrzaqFlr7oKR5FWSgIXpvElYO+BziLbLqU
         L4RNPjz42Eb7nDGyrQu8PG4lWCtNzsNBzZ1bjm7xwGq9mEiTbQyVRyyLdBzdqQazbc1O
         gckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847080; x=1708451880;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhUnicXSns42joU50CjQVInnNyyTKkuVTdbvxk2jiY4=;
        b=Pufx0coJTsFFLwrchJTjwpICQD0U6eKGSrEUmmI/CqU5N1XuGEUVuK9fZuFAvFlH3s
         DE7sWdSqP9rTIazuhnGPw9lqRpIPjqMmqgQzaxzOzqSJeNFq9Evh1VumZ/LN6lTITpPW
         vRg8tbt4+ZKpBQBwHjFJ4+21vR09oWaCNEYB3Jm2ixl16UR4vkb+Afem+LNEVb/4K+IC
         2g7+Nx5r+Hn0SRalPKFqxHjYhav9pj1qqd+BtdOOSyNx+4HKb/lUfOwX+BIzraRRC44P
         86EOe8VxKiUVDLCXbmoDNXF3noJPirgZA9JOSHMYjehRRMaoI+NgWD/5OP3Kv3qascBA
         CxFA==
X-Forwarded-Encrypted: i=1; AJvYcCWtYiL0FgYdVnsYkcnKcHy7P1eAeflNEfSmSWcVlxkSmvf3bmCRZxqM6DXcmoTgAhd/C1BoUkXOQJ4D/wFb25gYm303uvLhRA88qZZnySp2ZFmVXCXfwWmz
X-Gm-Message-State: AOJu0YyDdz5wQBdMtea8CUn3enVwdLSIjwC7Bl6aZmSv2Hy1AtZEKf7B
	b/CaKb379kMSKLwFSOE0UTeMCbpv5SOuXhdulSERGW6aTh2DfwduwOI/10fZvaA=
X-Google-Smtp-Source: AGHT+IEJC0OQ/oiBhPoU9tVDi5dI6wV4vSKDyOAVWxSaYZo9GAf3RSE0C9n4J07NSyjDlgquWRN8nw==
X-Received: by 2002:a05:622a:a:b0:42c:65cb:7bb4 with SMTP id x10-20020a05622a000a00b0042c65cb7bb4mr100752qtw.29.1707847080676;
        Tue, 13 Feb 2024 09:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEsq7pSA1eSDzvpghPgbJ8fBfoDSWkJ535dtO0AEXtBNQLmtMYhT4MU4uyZx+wfXb4u1AjLfaHEdTyd6gNhb4CTeCQjZegPeQbOceooiR533QncVVJujTuTLPN91+VRnIBMyC2+YPPRVuyqpwr0IXsW0QT
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id w2-20020ac84d02000000b0042a0a0d4225sm1306097qtv.38.2024.02.13.09.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:58:00 -0800 (PST)
Message-ID: <2b64a511-de35-4a79-af91-643975c9b764@baylibre.com>
Date: Tue, 13 Feb 2024 12:57:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: Add selftest for test
 cve_check_ignore
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.weiss@posteo.net>,
 =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240210135259.563083-1-simone.p.weiss@posteo.com>
 <cf013188-f838-4d44-ae15-21f2d6fc4e5b@baylibre.com>
 <c5c04be0fd22c12cb14aa3cc9c44341a775e4ff9.camel@posteo.net>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <c5c04be0fd22c12cb14aa3cc9c44341a775e4ff9.camel@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 17:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195423


On 2024-02-13 11:49, Simone Weiß wrote:
> On Tue, 2024-02-13 at 09:55 -0500, Trevor Gamblin wrote:
>> On 2024-02-10 08:52, Simone Weiß wrote:
>>> From: Simone Weiß <simone.p.weiss@posteo.com>
>>>
>>> Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.
>> Hi, sorry for the late reply. Were you able to test this successfully
>> using the patchtest selftest run (or by manually running patchtest on
>> the test patches)? I am seeing both cases skip on my end.
> Hi Trevor,
>
> Yes both were fine e.g.
>
> FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be
> replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore).
>
> As data for checking for modified files is constructed based on the
> included layers, a quick suspicion did you nor add meta-selftest before
> you tried?

Aha, thanks for the reminder :)

The patch looks good to me.

>
> Cheers,
> Simone
>>> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> ---
>>>    .../TestMetadata.test_cve_check_ignore.fail   | 30
>>> ++++++++++++++++++
>>>    .../TestMetadata.test_cve_check_ignore.pass   | 31
>>> +++++++++++++++++++
>>>    2 files changed, 61 insertions(+)
>>>    create mode 100644
>>> meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.f
>>> ail
>>>    create mode 100644
>>> meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.p
>>> ass
>>>
>>> diff --git
>>> a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> new file mode 100644
>>> index 0000000000..3574463ade
>>> --- /dev/null
>>> +++
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .fail
>>> @@ -0,0 +1,30 @@
>>> +From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00
>>> 2001
>>> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
>>> +Date: Sat, 10 Feb 2024 13:18:44 +0100
>>> +Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +This should fail the test_cve_tag_format selftest.
>>> +
>>> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> +---
>>> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3
>>> ++-
>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb
>>> +index 547587bef4..3ef9b87c34 100644
>>> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> +@@ -16,4 +16,5 @@ do_install() {
>>> +       install -m 0755 helloworld ${D}${bindir}
>>> + }
>>> +
>>> +-BBCLASSEXTEND = "native nativesdk"
>>> +\ No newline at end of file
>>> ++CVE_CHECK_IGNORE = "CVE-2024-12345"
>>> ++BBCLASSEXTEND = "native nativesdk"
>>> +--
>>> +2.39.2
>>> +
>>> diff --git
>>> a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> new file mode 100644
>>> index 0000000000..10f942a6eb
>>> --- /dev/null
>>> +++
>>> b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore
>>> .pass
>>> @@ -0,0 +1,31 @@
>>> +From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00
>>> 2001
>>> +From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
>>> +Date: Sat, 10 Feb 2024 13:23:56 +0100
>>> +Subject: [PATCH] selftest-hello: add CVE_STATUS
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +This should pass the test_cve_tag_format selftest.
>>> +
>>> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>>> +---
>>> + .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4
>>> +++-
>>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-
>>> hello_1.0.bb
>>> +index 547587bef4..9908b3b417 100644
>>> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
>>> +@@ -16,4 +16,6 @@ do_install() {
>>> +       install -m 0755 helloworld ${D}${bindir}
>>> + }
>>> +
>>> +-BBCLASSEXTEND = "native nativesdk"
>>> +\ No newline at end of file
>>> ++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only
>>> applies on Windows"
>>> ++
>>> ++BBCLASSEXTEND = "native nativesdk"
>>> +--
>>> +2.39.2
>>> +
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#195273):
>>> https://lists.openembedded.org/g/openembedded-core/message/195273
>>> Mute This Topic: https://lists.openembedded.org/mt/104277396/7611679
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:
>>> https://lists.openembedded.org/g/openembedded-core/unsub [
>>> tgamblin@baylibre.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


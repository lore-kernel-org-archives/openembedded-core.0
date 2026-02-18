Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03CBE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 08:01:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7584.1771401716573036447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 00:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q+7WsLQa;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359a16a400so4796699f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 00:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771401714; x=1772006514; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI8plNWbzAW2JK3y5SSoeiCwoZ1aQdCeoblLK3zLAZU=;
        b=Q+7WsLQaajZ2iIUorb29T0YhYA+jJozSnvXw3MEV+7vBW8njCYaMU6i0bCd4+eEQ/b
         o1UwuKv/p50xxaLV1/AQWTfSQfpE9OAPSoxGJy/M43xVAOi3OwdQsT35zIT17wYqI+Un
         RYZOOWnaG9T3mCybvA6NgZHgeqTcw9cl77pIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771401714; x=1772006514;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kI8plNWbzAW2JK3y5SSoeiCwoZ1aQdCeoblLK3zLAZU=;
        b=ML5Ga29oXx6CacUX6aBxVEPiwhGod1IC4FCiRMSSsWSJEDnad93u0KUc82B2mx2g1f
         mXAuHIzatvQddebcq3qPtPwbYThvdSmIzcfuCVslhVXQu/35xl0Yz3FVRmBBT1Wuqseo
         g3c9c6lZeQTUlJAeA6RYqt+HavP2Vmx0WEtaBXWcAIsGm+tk8aPYkTFTYTaQZKxphGN6
         AwBgjrzCuK8+xbLVKqJDVYVySykMg9Wccih3r1mKIyf7zSjfXkgCSc0uf9FJuG1mO1WD
         BYaH1EO1L/6xxhchzsBgvxUBEMlhFC/LYTtmrcU1LzEen5PWfrc/J8QHVaa98eT4CAhl
         Mv3g==
X-Forwarded-Encrypted: i=1; AJvYcCVUCnYkHeTkmehDLuqG9gVrGPXgCgfcdO7BsNsxQ68zRUiQ/iOWQKAW059JFYTjE4levSBBg/Vcre135P0AVnQVew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIeYU9jdEqQmFImeoKeDS5l+/dzEJcXlJP4hEDHSB+GFzh5vp9
	SfnHhTizGHqUUcxCqeY1EKaO/uGY1laGbGVkYd64Hn3J8RqPdqLiTwGY2pETBWkMdKc=
X-Gm-Gg: AZuq6aL9Aie4TNeQ0C+AygqLDrF68fDjoSYyPD5N+VCdb654ozlnBNTnSPI5MvaGP/a
	45RF4a2ZAFMH/3tFNuqGyJeIV6920N+77x0FM/SMA9HhuxyHZv015lg7oW1oF8CMqKVB06ciDG4
	qq3OTd1ohfpIZVuwmziu6De4UAUo2sPYrNyI2mROp2k2ihGS/MZ4+fPVVDRbyko9HtSNd8hao9e
	fsQYhVVJTLgM1XlH1CDu3zj/urwlQBUj/q1xHxdRJyedIEoiVQpgBwKpOz7GgWYH5V6tkkQ5wAn
	pyHX00/KOJkH+Ltu9lL1CFo51j8oH7k591F0xeQMfM0EcrqjhAgSpfFEJyOh9xt+APLJaWCVzCY
	ElX8vvL+RnDdomZyZYvmzCJphwUWJnUMSgln2U+gqnPmIjiD6yaBRIMmbJbtKVbo61tzh1QV9vz
	8miqmKcbdg4dDTh9kLTBcwlbZx+EFde9O0lxwqLFjeR3NWSrfRx7HB5Rs1RJJOerCrRlqaVe0gk
	BXzTsOePlIVLw==
X-Received: by 2002:a05:6000:2882:b0:430:feb3:f5ae with SMTP id ffacd0b85a97d-43958e57504mr1528127f8f.55.1771401714206;
        Wed, 18 Feb 2026 00:01:54 -0800 (PST)
Received: from localhost (2a02-8440-2500-131b-10ec-a025-4fae-24c1.rev.sfr.net. [2a02:8440:2500:131b:10ec:a025:4fae:24c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm5542708f8f.36.2026.02.18.00.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:01:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 09:01:53 +0100
Message-Id: <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211072322.79206-1-moins@kpit.com>
 <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
 <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
In-Reply-To: <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 08:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231285

On Wed Feb 18, 2026 at 6:30 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> Hi team,
>
> I updated master branch patch. Please check.

Hello,

Sorry, but this patch is not acceptable on stable branches under the
policy[0] regarless to its master merging status.

[0]: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_P=
atch_Acceptance_Policies

Regards,
>
> Thanks!
>
> On Wed, 11 Feb 2026, 2:23 pm Yoann Congal, <yoann.congal@smile.fr> wrote:
>
>> On Wed Feb 11, 2026 at 8:23 AM CET, Shaik Moin via lists.openembedded.or=
g
>> wrote:
>> > Install libpcre2 test suite and run it as ptest.
>> >
>> > Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine
>> (RunTest), and grep utility (RunGrepTest).
>> >
>> > pcre2posix_test: Verifies the POSIX wrapper API
>> > RunTest: Executes the core PCRE2 test suite through pcre2test
>> > RunGrepTest: Checks pcre2grep to ensure its grepping style matching
>> works as expected with various patterns and input files.
>> >
>> > Signed-off-by: Shaik Moin <moins@kpit.com>
>> > ---
>> >  .../libpcre/libpcre2/run-ptest                | 39 +++++++-----------=
-
>> >  .../recipes-support/libpcre/libpcre2_10.43.bb | 22 +++++------
>> >  2 files changed, 22 insertions(+), 39 deletions(-)
>>
>> Thanks for the patches but, as I already wrote, adding ptest is not
>> usually acceptable under the stable policy[0]. That also applies to your
>> kirkstone patch.
>>
>> [0]:
>> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Pat=
ch_Acceptance_Policies
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS



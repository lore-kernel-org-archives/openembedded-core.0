Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29355EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 09:58:06 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.7879.1692784684076145603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 02:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r1GkaeTE;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso8187085e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692784682; x=1693389482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oNRIpR9tPbmYSzRMP8UkP9NG3KZimYFU0YCX6YDvHHE=;
        b=r1GkaeTEeeA8xVP5p/tngmKWfPGX1kGnQtGAX5tBO5w/svmg8F4rToB1JM6QnrxDdB
         eyz0lhx4QmM5RWqdblD1pw0kqcqauxNmVLCHgLEmsNCsKXVM4TsGveLFPnPfY/KmS2qk
         nrVOrQx5Gdis/3jNtQUrWi8M7XOGP8ZLmI4BCsiE83gJ/6/oQPrlevhQapYxdA+f8j44
         tN9/Zt0liu7FAOsRg1U7Gk22LxAs2jAD6uWShoW8Gd0bFBzEEu2TuRapCI7d91uIQXHp
         YghDNIcr6eABbSiLMat6pkVQbIqNNN1Ppg5nEkuMaQ2MGle/A0M6c0aknnDM4SJIsYS0
         lTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692784682; x=1693389482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNRIpR9tPbmYSzRMP8UkP9NG3KZimYFU0YCX6YDvHHE=;
        b=Y4CzAofRjZEWlIPplWxEf+5QiOEYRebRTc1XJ4g8xJ35EUsEU1fYPrwDiL4zrk2WA3
         QRyIqDhalQlv8jdmzSO0wtEHeLl75XH6W5fHGbB9aUYCMtyb23lbtts6VmZDuJpdYl5/
         mjJjq72NVg+G4RHQ1hTBgpiYhn5ldeAzBK8GgwbFrBV8uuyGFetNFL+ZQbaAWISLxb4i
         BZJJH7BLiOMvKuH4SgwHGVXoZPjii038tGUWt/52ue9VXLwKHTd+iTSiBt96V1ft4yRf
         gDuOZENWngj9Wzysa8yKsWnW31Hv6WysDIm2HuHE0Vo73RQXWvvMcdS9TgW8TQxEVQ6M
         ereg==
X-Gm-Message-State: AOJu0Yyc0kDV4gqPgZmY3AZACNkarTX0q5h/YqAPL9QFxDsSuCDdRZ3D
	RDtJYQgmzXt/jdyE83b3pyFCpQelz9iDfcp6NVUNDOmt
X-Google-Smtp-Source: AGHT+IHl9qTsyVaGZ5PB7xuXhkXFITXQYfbHLkmx1ZfJCLXfN2DaFuZcToIa6uD+0bAs4OtAhCSlJDpwCZUr4sqZ2Sk=
X-Received: by 2002:ac2:5605:0:b0:500:9214:b308 with SMTP id
 v5-20020ac25605000000b005009214b308mr1978469lfd.65.1692784682033; Wed, 23 Aug
 2023 02:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org> <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska> <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska>
In-Reply-To: <ZOXVyxiqDDnjCp61@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 11:57:50 +0200
Message-ID: <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186565

On Wed, 23 Aug 2023 at 11:48, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> Cannot run ptests without @expectedFailure as ptests are expected to fail
> QMP released QEMU at 08/23/23 10:26:03 and took 0.13 seconds from connect
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> QMP connected to QEMU at 08/23/23 10:26:04 and took 0.60 seconds
> QMP released QEMU at 08/23/23 10:26:04 and took 0.13 seconds from connect
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> RESULTS:
> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.30s)
> RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (1.55s)
> RESULTS - ssh.SSHTest.test_ssh: PASSED (1.01s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> SUMMARY:
> core-image-ptest-libtry-tiny-perl () - Ran 5 tests in 7.208s
> core-image-ptest-libtry-tiny-perl - OK - All required tests passed (successes=3, skipped=1, failures=0, errors=0)
>
> The ptest execution seems to be skipped for all images.

This is actually correct and ptest did run. We have a soft and hard
fail options for ptests, and it defaults to soft fail
(PTEST_EXPECT_FAILURE = "1" in core-image-ptest), i.e. warnings on the
autobuilder.

Alex


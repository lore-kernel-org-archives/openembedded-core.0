Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46940EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:49:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.8488.1692787785005283496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k9uVxAO+;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50078e52537so5543788e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692787783; x=1693392583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWFVRzen68jLfzX6Jn25CryNCQfU9dMI1G+ZZGbsRg0=;
        b=k9uVxAO+XCP3OHbyz+s9QfzFf1RDl/jE2mPlS7PcJLiKWpbcXjhvZC2PIJUAQmqOn3
         CBTIMrSulcNHFpZRoGhEpVmslJzseMrk53nhy/L9kHuUOpnsmAwGrUKZGFM5+hlchGAK
         f5ydZm1UIrVZ8rMa8bKE+1ATbGHOl6tYoYAgK309IJuJ+SpEi1a0Xv01PuA7Ng/eszEN
         0tzIJxb/uJ2yEDo+blJ+DZi7avCWjGn1tmdUgo0eDhER45KLU5uLtztD+4WCi/v4DBPv
         ePYu5sBZJJF7cQvIevaeHg+3yHTvvYuNVpj1VZt46S+lNfjjDbb1GjM7UbXjVrXzpjOF
         hVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692787783; x=1693392583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWFVRzen68jLfzX6Jn25CryNCQfU9dMI1G+ZZGbsRg0=;
        b=QWkLCh8Q+DuPkpzr33vfzd9eQIao++VkXnlgdI+ubjtPgs8QXhsE3gC5aXbOPFIBbw
         NFPu3T1cOQtsLLU1uTahwjffJBDHKMwHqAHF/CyWDRoc+6zG0i+aaUHsLT7HpYAj70kl
         +xnEvbdBhDHvt/4z3NJwlLQF8zuujjNpdz/l3MFzKyUVU/SJkwhOSvQ2M6c9XZFHKmyR
         8TAZrK/ylgZx0YB/h4Mo6riWbRyGRdQ+WCihHD7g+cL56tCJJAyX5X2XbIGdxeITrrGp
         Tu7GH3yge5rU4K0LIRiRGw3DEzUiRekkGuVK/EqezbjzL59kZ62K916Me3YQZ371Jcki
         5ZUA==
X-Gm-Message-State: AOJu0YxfrD2mWUk1E1A5mi5P+wwNeB1t4fEbyxJuYCjl76+G24PAj4i6
	PoQpPueufk2Q5SWy/ubZMH2oUQ==
X-Google-Smtp-Source: AGHT+IHQbxff7sEH5La8HXOFA84lRb5V+UydJWbyvmmh6bZjdHavVOftTxHjvg0gM8Jeg8e8AcXb9A==
X-Received: by 2002:a19:6705:0:b0:4fd:d002:ddad with SMTP id b5-20020a196705000000b004fdd002ddadmr8337047lfc.12.1692787783176;
        Wed, 23 Aug 2023 03:49:43 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id u30-20020a056512041e00b004fe0ab60530sm2598828lfk.49.2023.08.23.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 03:49:42 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
X-Google-Original-From: Mikko Rapeli <builder@linaro.org>
Date: Wed, 23 Aug 2023 13:49:39 +0300
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOXkQwhkYRi8rW8O@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska>
 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska>
 <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186571

Hi,

On Wed, Aug 23, 2023 at 11:57:50AM +0200, Alexander Kanavin wrote:
> On Wed, 23 Aug 2023 at 11:48, Mikko Rapeli <builder@linaro.org> wrote:
> 
> > Cannot run ptests without @expectedFailure as ptests are expected to fail
> > QMP released QEMU at 08/23/23 10:26:03 and took 0.13 seconds from connect
> > Cannot run ptests without @expectedFailure as ptests are expected to fail
> > QMP connected to QEMU at 08/23/23 10:26:04 and took 0.60 seconds
> > QMP released QEMU at 08/23/23 10:26:04 and took 0.13 seconds from connect
> > Cannot run ptests without @expectedFailure as ptests are expected to fail
> > RESULTS:
> > RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.30s)
> > RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (1.55s)
> > RESULTS - ssh.SSHTest.test_ssh: PASSED (1.01s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> > SUMMARY:
> > core-image-ptest-libtry-tiny-perl () - Ran 5 tests in 7.208s
> > core-image-ptest-libtry-tiny-perl - OK - All required tests passed (successes=3, skipped=1, failures=0, errors=0)
> >
> > The ptest execution seems to be skipped for all images.
> 
> This is actually correct and ptest did run. We have a soft and hard
> fail options for ptests, and it defaults to soft fail
> (PTEST_EXPECT_FAILURE = "1" in core-image-ptest), i.e. warnings on the
> autobuilder.

OK, that is good to know. In this case with local.conf additions for "slirp":

IMAGE_CLASSES += "testimage"
#IMAGE_FEATURES += "ssh-server-dropbear"
TEST_RUNQEMUPARAMS += "slirp"
# update kernel to latest available in poky
PREFERRED_VERSION_linux-yocto = ""
SANITY_TESTED_DISTROS = ""

The tests passed with one warning, which I'll try to check:

WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: There were failing ptests.
Traceback (most recent call last):
  File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
AssertionError: 
Failed ptests:
{'openssh': ['banner']}
...
SUMMARY:
core-image-ptest-lttng-tools () - Ran 5 tests in 2289.072s
core-image-ptest-lttng-tools - OK - All required tests passed (successes=3, skipped=1, failures=0, errors=0)
NOTE: recipe core-image-ptest-lttng-tools-1.0-r0: task do_testimage: Succeeded
NOTE: Running noexec task 1405 of 1405 (/home/builder/src/poky/meta/recipes-core/images/core-image-ptest-all.bb:do_testimage)
NOTE: Tasks Summary: Attempted 1405 tasks of which 1304 didn't need to be rerun and all succeeded.

Summary: There was 1 WARNING message.

Cheers,

-Mikko


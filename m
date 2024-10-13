Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9339ECF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 15:26:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.33612.1728833192716110810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 08:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I7BIeBu5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43116f8a3c9so38269945e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728833191; x=1729437991; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWpB1yvdSIlE0daEO3Ugl1TB1FCSmnw7rV3pBG0gUM=;
        b=I7BIeBu56TW3X/SumtTHX6wLAZPzbvEl4KgnbnJIzq62OjuPCbJ/10vcSLOcc1QLAr
         mS8vs+K87C5Tq9HXcBHyXe149yRnoIUuBcu/JPkUNaaLCFIKdzeZxROb8Ck8ITi7cs/M
         hspymBpW2/CwAEDwddWVXqcyuj3soaIKfcfXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728833191; x=1729437991;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZWpB1yvdSIlE0daEO3Ugl1TB1FCSmnw7rV3pBG0gUM=;
        b=Q/ZU642Sgh/5Y70pRYBP7B8IRJR+3El0RPppwBaVe32UKNyYbllwbQfI+O8O+qNu2W
         v1RIrVq+oO/zSA+Vm95pQUoc5j2iwKZwZ1MnROeTHd4YqFCWUCkh4CwreZ9qq7TdG1Zl
         tDAEJjoNvXM4Zv1vDkxFP8ph7vEbPHesQijNUmeUrKbJMXve3xg1pEPwC2OESFk/5M4s
         TBjdGZCdP19zhqFEWkpjy5U1hawemQ5Z7NM1QZWuyMRgURUUY1V8BFELTZ5cl8MvmsxJ
         vFcNxqXcJhi5Q/UHLjKz+X5gEy84HP5u2z3vICuLsdTM4jtYiDQAL54g9ZsS27aIFFtw
         gxuQ==
X-Gm-Message-State: AOJu0Yzw5C0H6JmTqzOxYQggbebyJzdDrVPBfE7dAa15whTfJAIeNkZC
	IcovWwJda9QJbt/PjdkK99jNuYLK8Qypfgb4pEuATueRuavQuLI0syyn0baK+UVmlZoCOy19kqf
	Q
X-Google-Smtp-Source: AGHT+IHlQTW91vf1ASROwe1OUMl3a4LCEERXk3lTlKzJZOYUBciDoBvgcpWcZ5Kfhmdfnhm08LjQ+g==
X-Received: by 2002:a05:600c:3556:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-43125616389mr62596255e9.29.1728833190766;
        Sun, 13 Oct 2024 08:26:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5df1:acd1:2d22:dd4d? ([2001:8b0:aba:5f3c:5df1:acd1:2d22:dd4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d790fsm95846755e9.6.2024.10.13.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 08:26:30 -0700 (PDT)
Message-ID: <d9897c3db83d6433adc5d53f5ff1f7add3002dc4.camel@linuxfoundation.org>
Subject: Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 13 Oct 2024 16:26:29 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 15:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205723

I've spent quite a bit of time trying to reproduce/debug this:

https://valkyrie.yoctoproject.org//#/builders/35/builds/216/steps/14/logs/s=
tdio

2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_apt: FAILED (218.02s)
2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_dnf: FAILED (155.47s)

on debian11-vk-1.

I've a successful test and a failed test testimage output for comparison:

https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/lo=
g.do_testimage.1487387
https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/lo=
g.do_testimage.3323465

along with qemu serial output:

https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/qe=
mu_boot_log-fail
https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/qe=
mu_boot_log.20241013104106

I've tried rerunning that exact series of tests on that worker with no
success reproducing the issue. The image was overwritten by a later
test so we can't retest the exact image. I've checked the journal on
that system and there isn't anything related around the time this
happened. The two failures were on different network interfaces and
both interfaces work on later tests.

I'm open to ideas...

Cheers,

Richard



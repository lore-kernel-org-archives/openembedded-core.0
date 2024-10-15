Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62816CFC276
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 08:18:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.8327.1728980322528022628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 01:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jg38jDgz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so3231126f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728980321; x=1729585121; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sB5/zTqaA9Qz8C+wWxN36G1sEVu0VT36lF14FY4Fv0=;
        b=Jg38jDgzm/oN+BegfPphumr23X/ProFMeuhKx9dB1t6jVBsN0Rk2mrNZYSMswbHkzC
         g+patGX2yKxgbzIqnVcYvwvRmQrWS0dMGctUbSnyLBm46A7iiEyl90LenwOuqkdVhd+R
         6TULI+/Wky5iacUOuLRJywngSqa0Y39LkmaYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980321; x=1729585121;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sB5/zTqaA9Qz8C+wWxN36G1sEVu0VT36lF14FY4Fv0=;
        b=ior6RTcALuG4djVsH9CR+AV2B+N5uuT1egA6yp3gSifwz9eYDjnHi1c+BkkKdFHXbb
         2SvYVYrfax4XvJhzEDKK0vxbtG4i1JQ+tUJGfnoHBhkEepcwL5tanjV79MIcRbKqTFvv
         3QpqBSEaC/EnLLIrRTzjhmDrDUcNuY9NGjLHzyjkfmPubVC9JvcDoJ0U61EK8n+5sXHf
         4tZOQBkmhiDi4ESUhlTuoDw69EtE810KyFtaaTIwLZ0r7PKjUZTW96JPceIANSsQkO/N
         Hyf85gPWVz+pbfARunbTP4+lFQFMITiYlQkbmfVQnLFZhTsgfKG3YI2l9tkGPpT6FUx7
         eRUw==
X-Gm-Message-State: AOJu0Yw5o1nVgXXkJcQbpWLF5Ku8SArdp4HNEwQ73aZTSfE/3KlwulBz
	+jP+LhPQS9BFtrKVJSFWNnQlFn9EixObuDsKYiQNyDiLsTTz1JsN9KW0YP8k2AxveqfCa9wQvh0
	h
X-Google-Smtp-Source: AGHT+IEH3+vPTBAlGugQYS43GEWa3jNaLgSFPNHM4yMd8JpKPs23AqK7iClLvtLtqgWGwZjehun0RQ==
X-Received: by 2002:adf:f050:0:b0:37d:454f:b49a with SMTP id ffacd0b85a97d-37d55262f0cmr10389616f8f.43.1728980320603;
        Tue, 15 Oct 2024 01:18:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf857fsm926522f8f.74.2024.10.15.01.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:18:40 -0700 (PDT)
Message-ID: <8d74548b102be5f88d1450e3f8734f1b52f1c2f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 15 Oct 2024 09:18:39 +0100
In-Reply-To: <17FE0CA1425F2338.24631@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 08:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205799

On Sun, 2024-10-13 at 16:26 +0100, Richard Purdie via
lists.openembedded.org wrote:
> I've spent quite a bit of time trying to reproduce/debug this:
>=20
> https://valkyrie.yoctoproject.org//#/builders/35/builds/216/steps/14/logs=
/stdio
>=20
> 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_apt: FAILED (218.02s)
> 2024-10-13 04:12:32,010 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_dnf: FAILED (155.47s)
>=20
> on debian11-vk-1.
>=20
> I've a successful test and a failed test testimage output for
> comparison:
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
log.do_testimage.1487387
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
log.do_testimage.3323465
>=20
> along with qemu serial output:
>=20
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
qemu_boot_log-fail
> https://valkyrie.yocto.io/pub/shared-failure-data/debian11-vk-1-selftest/=
qemu_boot_log.20241013104106
>=20
> I've tried rerunning that exact series of tests on that worker with
> no
> success reproducing the issue. The image was overwritten by a later
> test so we can't retest the exact image. I've checked the journal on
> that system and there isn't anything related around the time this
> happened. The two failures were on different network interfaces and
> both interfaces work on later tests.
>=20
> I'm open to ideas...

https://valkyrie.yoctoproject.org//#/builders/35/builds/229/steps/14/logs/s=
tdio

debian11-vk-2 this time. A different runtime test, same kind of network
ing glitch.

Does debian11 have some kind of network management that is interfering?

Cheers,

Richard


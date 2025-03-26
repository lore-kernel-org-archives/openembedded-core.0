Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AE6C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 08:48:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.17597.1742978902496068132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 01:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/KJjocr;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso56007546d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742978901; x=1743583701; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl9MMAPtRh4WZDbt0pGWc/kH7Zn0fr9spUDksirG9bI=;
        b=i/KJjocrhqUe2c85E00dLDE08r5aJl4QV/PzwUoB5SWtmIJmitHM2fbrfDmU9yK7iL
         E/VnqRnpZaG8pP52OrPLZ2GQtTspsdKElhXPb3u3dYKdZGLxmsJyQ3vW8TuLj3tDydaW
         hwYd5c1X7vF/CJG8qckvtA7L73cbaFR6X6DcnOrrZImfgxtiyEshGqlQCH18BHFQJqFO
         LeEIA+EhlbL74/zXtmc0EwtgWf21LbLTPTmmSMcHc0lSiI2c/S6lV0gs8a0j1rTbT3Rz
         zudVOKahN7QB2jBKcxBMUT1TyUkBgzv9mDMR+rlyll4ATc6tXPeu0UgIfveA8sdqnqJG
         UhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978901; x=1743583701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl9MMAPtRh4WZDbt0pGWc/kH7Zn0fr9spUDksirG9bI=;
        b=QY31PSaHqHcmzgI6/k/1jh8e6RRy8HGmcfz7fUI51a8jhKWPIcx5qcX/lw9TpCMVgh
         tsm7r4rp801CZmIvYGli1XX2eojNTi6yUmhKpc/NQklHsmqEX13yqBn1dbfmK5Lmeljr
         luWSepbY2KiWmt7x+sIwnzEIfGgWRl/1pj1q5pgPNx/blLNra36ioZytGSmRC8xQubXb
         h/8tbwfKhxgF7s21UmSUfcRt4wJFksxrnEkJkQqMlwkwdrYV4NGfU1nOnlpDvvEaUJCz
         ziIztRXRyubp2JiHVt5qMGWfR40cX7G6y80uFIS7KvA2yx79E8KoICGqwm0lnjSn5rr8
         s5ug==
X-Forwarded-Encrypted: i=1; AJvYcCW21Iit/u7GFem0rXHVrX7Zpbuco///W7uJB1yiOHhw4hqlmIRps/ib3lvpverHB8PBwrYHflhr+37pFWMJsrlHaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxL52OQB0e/3t+gpcJkbaguH3Ps5Grvsw6f3wnJd8XpFNlRa2Pw
	QjLhN+mV7bEXYfjLDv9kkeMtKTQloggwDi02hXO3b82Vu7wsWV9Lz/ECh/+Op6IMYeoHOiHVbdO
	I47wCq1xTHySH2FiojlQbiGQJ7xw=
X-Gm-Gg: ASbGncvyatMmgPUztBgQwi1AkA9Iw9e7OmuzFAewpDq59xEhK7kQOwDRmr4UrGBu+qm
	HDEwQV///4s45u3ZSeHHHrfkKLspFBeQ2DAV118mEt74qiEZeuEDt9qVQ2l2z2CSgMnGOQ9fP6x
	odRvjKHWK2UHlR3XcWoceewJV+KJqQo8FC3s1N+/ORNdyt0au5GAQKbQgVuIAG
X-Google-Smtp-Source: AGHT+IFkVBwfAM8rR9hcRWd/s4b/JrSS5+jKkmNDWH8xFKZw/bgo53oxaHFZCj1ja2t0ZbU2Ee4/0vxRYo1SsKmC4Nc=
X-Received: by 2002:ad4:5cad:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6eb3f339977mr310062716d6.34.1742978901239; Wed, 26 Mar 2025
 01:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org>
In-Reply-To: <18300D8D696CD25C.32743@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Mar 2025 09:48:10 +0100
X-Gm-Features: AQ5f1JrgQMOP-pd4gDeTPwy5Hv3yIOpY7CrwuMHUkSlLPlTPt0zG_02O1OBl7Qg
Message-ID: <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 08:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213639

On Tue, 25 Mar 2025 at 14:05, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> It appears that somehow dependent packages (e.g. gnupg) aren't rebuilt
> to use 'libgpg-error0', and at the same time apt isn't able to see the
> newly added RPROVIDES that would satisfy the old dependency?
>
> I don't have a local reproducer yet, trying to get to one. Plain
> selftest passes for me too.

I have reproduced this. You need to build the image twice to see it.

1. Set up a plain yocto build, put this in local.conf (which
replicates the selftest, particularly in putting gnupg into the
image):

IMAGE_CLASSES += "testimage"
TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"
PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"
EXTRA_IMAGE_FEATURES += "package-management"
PACKAGE_CLASSES = "package_deb"
IMAGE_INSTALL:append:pn-core-image-full-cmdline = " gnupg"

2. bitbake core-image-full-cmdline

3. Apply the patch.

4. bitbake core-image-full-cmdline ---> kaboom.

Alex


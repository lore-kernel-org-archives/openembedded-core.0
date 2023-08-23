Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDF5C27C40
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:46:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.1017.1692816362558699965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VmOLx2tE;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so93167461fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692816361; x=1693421161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14fuK/5nO3VB3+Rc/OD644sv7A1SlT0kaSI3DsauvjA=;
        b=VmOLx2tEynS7Q69/KzqOIiy1bvYDW7jVVIKob1WB7dWNjFL2s4l5UxoWXnRaRu796B
         /qTnE8i21HEWAvZnubk0+RwcVuiNllWmFMOEqSb+1/tLF37mHwbhqU134+cLkJrwVCSV
         C9kejb8kLCr3rcIuJha+YpZnpX6NRE+HErkALv5Amge0h42Fr5F+j+XY1Q+NG/BtBFsN
         vzgsMVshg/4lOnXla/2qYcXSBK17zk2aKVfMr51p6miV9h4WJKAWHc+YcX7osoCaaWKI
         SUoKrwvh4J9qdIiBw5zFTk8C4QH7+8o5MLJGsKKWPD6iXd8x3hyoqtlRg4wCtex/RBdu
         RZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692816361; x=1693421161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14fuK/5nO3VB3+Rc/OD644sv7A1SlT0kaSI3DsauvjA=;
        b=A0soJHZQOjNdj7IyignTLiFDudWW00r+Ek0gsljrlf2TYOpXDyAnF2JNxQUs+Qg0dW
         VMDczV/t82OInWkwEKsQ1u9jZx1ZHhT/OuvTNpAM3pLuZv/MppCL75xIng+ji8we7txG
         f6fTqegNqKtTvkY1HC3bH2ZZqhBuMjBtpd4F9KJz2Unbtzxd437ZcbqXTWpAWKH4dmE1
         1dldTYk72voent8fALPqAaxUU50fjlcZnJvLVxPzVBktzz9WpLTjwNuo52UH/s6ewfzl
         6GazdLFjTc1/WmRECtV9/KUPUR3VSxwnbfx0CWTsqjUvLNG2Y1MV53xXhI9BNlx/m5WZ
         kFiA==
X-Gm-Message-State: AOJu0YwrUANp+ghzTtDbqEgHXEbLX9hDVXssvxkxVcvq+Z/RXUq/KYh1
	yc90EN3HaiioLMqXBxjXblN7uM8xVzST2gPh+HoAiSWN
X-Google-Smtp-Source: AGHT+IEgvI1GFNV8O+jmXm1a4QiH9BvaknEj3Kk3s8mm17PhGZPUbhggxu8T9l33jtMQ5nNQyQGGlCUENoTajwPRogk=
X-Received: by 2002:a05:6512:3987:b0:4f3:d682:7b1c with SMTP id
 j7-20020a056512398700b004f3d6827b1cmr11716223lfu.45.1692816360594; Wed, 23
 Aug 2023 11:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org> <20230823061025.3952909-3-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-3-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:45:49 +0200
Message-ID: <CANNYZj9+Gs9mkJFKS3qpnjD0XudiqB3Z+2rVsPEgn4ioFyQ6DQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/9] selftest runtime_test.py: add
 testimage.bbclass slirp test
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186632

I guess the extra space stuff should be going here instead?

Alex

On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Builds core-image-minimal with testimage.bbclass and an ssh server
> and then runs tests with slirp networking. Default test suite must
> pass.
>
> With full caches on x86_64 with x86_64 target the test passes in 416 seconds:
>
> 2023-08-21 09:01:12,295 - oe-selftest - INFO - Ran 1 test in 464.955s
> 2023-08-21 09:01:12,295 - oe-selftest - INFO - OK
> 2023-08-21 09:01:19,648 - oe-selftest - INFO - RESULTS:
> 2023-08-21 09:01:19,648 - oe-selftest - INFO - RESULTS - runtime_test.TestImage.test_testimage_slirp: PASSED (416.62s)
> 2023-08-21 09:01:19,711 - oe-selftest - INFO - SUMMARY:
> 2023-08-21 09:01:19,711 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 464.956s
> 2023-08-21 09:01:19,711 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> v2: use :append instead of overwriting variables
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/186427
>
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 463679dd32..19c8f0e9ec 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -129,6 +129,21 @@ class TestImage(OESelftestTestCase):
>          bitbake('core-image-full-cmdline socat')
>          bitbake('-c testimage core-image-full-cmdline')
>
> +    def test_testimage_slirp(self):
> +        """
> +        Summary: Check basic testimage functionality with qemu and slirp networking.
> +        """
> +
> +        features = '''
> +IMAGE_CLASSES:append = " testimage"
> +IMAGE_FEATURES:append = " ssh-server-dropbear"
> +TEST_RUNQEMUPARAMS:append = " slirp"
> +'''
> +        self.write_config(features)
> +
> +        bitbake('core-image-minimal')
> +        bitbake('-c testimage core-image-minimal')
> +
>      def test_testimage_dnf(self):
>          """
>          Summary: Check package feeds functionality for dnf
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186550): https://lists.openembedded.org/g/openembedded-core/message/186550
> Mute This Topic: https://lists.openembedded.org/mt/100910039/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


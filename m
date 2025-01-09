Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF9AE77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:39:27 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.44373.1736415558331346537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GuoM0kjg;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d888fc8300so3718316d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736415557; x=1737020357; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruEukUOsqTTJv+BHTr8KBW4OXofS5HgtgE+6AcjlMyQ=;
        b=GuoM0kjgeuONhmKz3y0ocElmwRGQTBOvZT1qI9lII/7It2aRcadxxVY7J1lMUcZWoI
         0XlGrxagVZ6PGv5dMBlMbif1ROmIBu/3fDJt7MLD+6rEt4OzAWIJzi0J8+GDohHvJq3b
         zeLl5CkZwLoaf74MHlIvfTL5MShtEQLjeyOK4xvGx9iJps6OIppKu0iB2OkqTAZQ/FYE
         PYQwxQbn0S56kgNZEXyaJgrtQX5jPnZb0OFqXwELtzrSeSuHgxajHA1jbCbPJoX68K6v
         IKt24i1WrnHjkfrTPgdzZZ74bEw8PgKXxQYnhdX8lDkGsnUnZwVaWTjQutOXcn0sMFbs
         f8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736415557; x=1737020357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruEukUOsqTTJv+BHTr8KBW4OXofS5HgtgE+6AcjlMyQ=;
        b=HXffcj+8BzXH1GIs2n4S2to6h9zhhM/fWJ1sKj8v3B1l14kVngILlMPiufBPVUVCYu
         6UNeInSyJrgB+85ibRxKlcfDpxJFQkG0k8Bv0TVpl0OXiiOR7R1OmKRPHuOMMyhsmEyQ
         9sAlzRI0fOEsx+eZmzZI/ofbl2iDBXSMhUo0nec6wBPJz8vdhHMSiFY/eWCSy0KYhxdV
         cAvsXNKr70pFzUh7a3oQIdaz+DKbhOeSsRBzCjlSAwRKtlTmu7w4p1sdWt8fJbrkb1Rc
         c+sJemnNxGI6WrqrhcF/uMMLmnc0712ozIrJHRwBQBZFsQ4EsUGGdP/T+VdUp5WsG8xz
         5Gvw==
X-Gm-Message-State: AOJu0YwVVbQON3FGhLVvY4yh4Ps787XbYoctQWq6eYw+JHU0iT+D41mK
	kAei43/fQuz0IjR1VLcjKvY/usbx6g79lUGpmUJ3obqR7eT0VvdAj0UgXcc0Y2H/8I97OYniiPV
	iof6aO4OI93N7ZmXN3pckbeJ5uP9Bhg==
X-Gm-Gg: ASbGncvxsFW6X4yMK/GbzLK13oi93hxwcvsAn0CJM6mpFlAGQbFYDpPMusJXqWp5ykv
	fjpI2GTHKR+idpgLzmpO34puTtle3bs3YkDIpFuImwnXRk/LoHrEphGnQYXQU5zS4jcoYtTj1
X-Google-Smtp-Source: AGHT+IG63MSHDtN7pwE4L7Zx7a1wkh2WSipxyBJRaIIB/OhAzGWwZ8chKEubx8/Ol+RxoyNenmkTNJDCQ3BH0KIbD0c=
X-Received: by 2002:a05:6214:4b01:b0:6cb:ef8d:b10 with SMTP id
 6a1803df08f44-6df9b2d3775mr109072326d6.39.1736415557316; Thu, 09 Jan 2025
 01:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com> <8177.1736415085999013174@lists.openembedded.org>
In-Reply-To: <8177.1736415085999013174@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2025 10:39:06 +0100
X-Gm-Features: AbW1kva2bIGpPtr3bxzzjMIe0lBp7BcEiWMn-AyDESbPQqMLAPRDCSAzwUeWATs
Message-ID: <CANNYZj_8fHbcgoSsF18Ax5cvZmYsctEgc_2EkFAv1aJq=AF9ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 3/3] rust: Upgrade 1.80.1->1.81.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209622

The patchset looks good, thank you. Will you continue with updating
towards 1.82 and 1.83?

Alex


On Thu, 9 Jan 2025 at 10:31, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> Tested for rust_1.81 update:
>
> bitbake rust
> bitbake cargo
> bitbake nativesdk-rust
> bitbake core-image-minimal
> bitbake core-image-sato -c do_populate_sdk
> bitbake core-image-sato -c testsdk
> bitbake world
> oe-selftest -r rust
> oe-sefltest -r reproducible
>
> oe-selftest results for all archs as below:
> Target         pass       skipped
> x86_64       18646         418
> x86            18468         596
> ARM64      18496         568
> ARM          18451         613
> ppc            18418         646
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209619): https://lists.openembedded.org/g/openembedded-core/message/209619
> Mute This Topic: https://lists.openembedded.org/mt/110513059/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


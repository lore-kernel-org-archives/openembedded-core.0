Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD79EC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:18:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.18319.1724242674500218342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3kzUWuh;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f3e2f5163dso31808341fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724242672; x=1724847472; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xAc8HGJL3rflMMkTTXXgjG3sHc9/0Ip5kZoz442/avA=;
        b=k3kzUWuhpwj0lsDxMYrAgULHRhs4eg63nP9z8hAGyNlsDdtxbwmbC0TYx2qtgY3z1c
         G6LlRmJsKTgGUlfRI5d+2eTTVShjTxtHpHFvE9FNfpTWUvRZ4NDC7udkwMWjyOpK0U4n
         oCj3bVXLbhWT7+bWSSGi0/0vfq5+0Ej+U9sMuzlwZCUL6QI/WMiJYDlMBBg+F2WQGgYE
         DFaMlRJtuP+QctODrVDyCLTpFsFKIkCsAq2Xg3zWE3PuEwYL/pWVGNuTBMok2eG0mnWy
         Fdlz+oRp/aZ9RcL6mO0gUTtCv0nhoS4fZJV20kd1Zd/IcMs2ccqRO7EkGa00KaDZ8YW1
         8sPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242672; x=1724847472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAc8HGJL3rflMMkTTXXgjG3sHc9/0Ip5kZoz442/avA=;
        b=mMEblFUK6b1nWYKV0miJghJ7mC23aFZFo/MNhsXGrVNZtpEhYvwx7Rw6OTwJ9sHfMC
         /zD48EAWNVwhAIcRTPhro5ltM/y4bMxhtBbPTf588n2dH484mQcnT4yXoDJrfIQm9yL7
         /jV8R853altX2189M431aWf4j8uz8f6/k2rsnP+8ytij8L+yIXXr2dVa8ft4Qgm1mpdf
         AVoQ2zSuwDYVyz+iXUEZi47TcOJDhbHS4TCPbcADuR9a9LfV1t8hsvzZ9UEvQqHfSP3i
         DpQ63qfl2uLyiLRrChuzs9+LT+oSXL2kqmoZmhl2R/BhzBoeap2+Evbhx6aVMmTO3xoi
         NxdA==
X-Forwarded-Encrypted: i=1; AJvYcCUpEHowcFEDt72DAXptdzsPJ6n5jFbZ7cL0nqk54sku0A0Sa9n5JQschTsBUkocJSgi/3MQxzt09kMakzCewBcZWg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWg4QRDZScSDb9zJYvyYRrSrCQOzDbAp4MaZnwqW4xJWf8OahB
	5FROqdVoW2MSua71Z7QvKtohM09Pncb8F93bDRcJHCGIQt+Fa9d/j6sEYJCefs4jCH2EiOVycEZ
	Xhlpg9JUm4UmuroIiKfbGZWyx2XM=
X-Google-Smtp-Source: AGHT+IEKvoNAgrweFJuyABwSyIPe7TOppYWXQIfrrOZg0QNzwAdMCqzxJbUjrk/R0AMWKAOMyhMgSvIGR7mJxXzzAXA=
X-Received: by 2002:a05:651c:2c1:b0:2ef:27ab:40e6 with SMTP id
 38308e7fff4ca-2f3f8b53bccmr12316641fa.49.1724242671670; Wed, 21 Aug 2024
 05:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240819182649.128659-1-niko.mauno@vaisala.com>
 <20240820191943c7d1348a@mail.local> <f236db96-06ce-438f-843d-25530ac1d16d@vaisala.com>
In-Reply-To: <f236db96-06ce-438f-843d-25530ac1d16d@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Aug 2024 14:17:40 +0200
Message-ID: <CANNYZj_X-TYO8vLoJBTqwmwrwD0Q2bEPi3TJL3N9hMzV-1JUhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: niko.mauno@vaisala.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203587

I guess this new API should not be enabled for -native variants?

Alex

On Wed, 21 Aug 2024 at 14:01, Niko Mauno via lists.openembedded.org
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>
> On 20.8.2024 22.19, Alexandre Belloni wrote:
> > Hello,
> >
> > arm64 fails to build with this patch:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9356/steps/13/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4727/steps/13/logs/stdio
>
>
> Thanks, indeed it seems that on the older Debian build host, the
> mountfd_api requirement fails for util-linux-native recipe:
>    | configure: error: libmount_mountfd_support selected, but required
> mount FDs based API not available
>
> Ref.
> https://github.com/util-linux/util-linux/blob/v2.40.1/configure.ac#L1315
>
> I.e. failure stems from the added explicit
> --enable-libmount-mountfd-support option that extends also to -native scope
>
> I wonder if there are any proposals?
>
> -Niko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203585): https://lists.openembedded.org/g/openembedded-core/message/203585
> Mute This Topic: https://lists.openembedded.org/mt/107986659/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


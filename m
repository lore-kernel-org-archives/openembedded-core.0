Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7347D49234
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 14:45:25 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14083.1765550716746159612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 06:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VwPaXv0B;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2dec4d115so131213485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765550716; x=1766155516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJFU7zLuc4YjPQiJWVKeQXSFFkdMx/olrKlY593erDU=;
        b=VwPaXv0BU/t9NTmK/tCTrifBoA2gOVdjpwvyuMS5mdItayaL4C8H+Z3oplAzENGE4W
         +5h33tdugX0G/rx3mXEe91x/gSu10Yjj9FFjL1RjtI0MkeuZ0IyhAvvbmU5gEImDXP/w
         KZcCsCgRw5/8BLsQcWNK1ldB6UKzsM29rWoIvfLX7Oc82icdeDvpxTRCCGcbhMvrl3KR
         stNJ0UaxPWjbjJAabX/dBYwnJ+8bF7inlWC9QWxHwxGOXgJF4pDXGKwH45BqOheGz5AU
         s3IWR+hFqjEvmkKgesE31MgZl+PTDp2lZRaBibPSHA6TSoz4yPI9lmaZEB3268Np+KfP
         P+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765550716; x=1766155516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJFU7zLuc4YjPQiJWVKeQXSFFkdMx/olrKlY593erDU=;
        b=PfKkl1a+sAaiV999VGtrsIEKeEVqk4yy3ich63Xr/OT4Ae+r3j6gH79AoCWhD487VC
         9LNg0uWPzpNA0/NpTGDozyKmWmkVEcHwoQjQRQ3lzSKDYoQybbUgZWt/NORW/9aSrYD6
         /92n32tKJfOvNFt7PBHwcx4T8mPvtR5b7QOSHR7OLaiG/chuPhRxm0Z3f2dyMpU84duK
         jRvK8/aDebOiw4K0hhhn/QrJWqk9u/FY3uDQuV+GjblWmaAhz9ofsFgG6NNIWSQQHxV+
         mcIjOgABAaHdg6wdUmqrE+kKHL5yR7SX6Ur78PBc4yMfWlGCRCg3cS8hp8l8l/A5gis6
         ycxA==
X-Gm-Message-State: AOJu0YxUMEU+VGeH80p02j4SLzYrWjgYxTXUX8NOLdZO4PZCxKy+8ChP
	h3Tag46eIUSfjagJKNrZmSH5T2S+1M5Tg+IWy/HOwY+I3xgQUgPW/ocoqylEvXw7/bgGDXYphrr
	sR5GbxcR4wEG/BiRkTpYBjpjQT1DQW5815g==
X-Gm-Gg: AY/fxX6crwGT2UFbRzXUZN9k9SIcKaLWzmqlg47Rnma5wtqTlIfi8IXM14Etz5Jf109
	iS/XWqGZWaBLvzlRiMqTiedpZ5Bu5w4gpI33t8ncWoHl5eIvu5ezyZ7q37ObXwxHUdNoIQdcBv9
	gIuCaSB9KCD0EI7/BAro5wrGGegSUSj3k1X9ZTAldMUbBioPV9LPWao+J1BXidacFezZmXbkTB2
	OxKtuTr135/FSTY4q+rD0sL78YRH/L3HRJjGaxQvR5zSC+Vebsdoi+gNUQnrZ4udK7Nxw==
X-Google-Smtp-Source: AGHT+IHVJaVt7cTbEipXTG9w/FzcVmhSZTWA5XH+FgZ/I1V/lQRTjj9zf1oF13FQnaooyX75zDdssun3Bc8Dg05P+jU=
X-Received: by 2002:a05:620a:4590:b0:88f:c5d4:504e with SMTP id
 af79cd13be357-8bb3a39ef4fmr292753585a.81.1765550715608; Fri, 12 Dec 2025
 06:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20251211191831.1596868-1-alex.kanavin@gmail.com> <20d7536c-732f-4b22-9a54-b54ee9e26860@cherry.de>
In-Reply-To: <20d7536c-732f-4b22-9a54-b54ee9e26860@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Dec 2025 15:45:03 +0100
X-Gm-Features: AQt7F2qXf5B9SpujIBxzKq8L3JdDoilmp_1BPylFUXDUUHOqz55ydaSBHNZF9Ok
Message-ID: <CANNYZj_O6qMnhZi0ujzcV5r7KeDhSmH+RSND9z3P44vKiXBYeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: fix a build race, hopefully for real
 this time
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 14:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227593

On Fri, 12 Dec 2025 at 11:18, Quentin Schulz <quentin.schulz@cherry.de> wrote:

> > +Upstream-Status: Submitted [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gmail.com]
>
> https://patchwork.ffmpeg.org/project/ffmpeg/patch/20251211191454.1595823-1-alex@linutronix.de/
> or
> https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/thread/6QKXQGZKGDNDQXH2XO5IO4LAQKVHHWZG/
>
> maybe?

Thanks, yes. I sent the patch without subscribing to the list, and so
it was hidden in pre-moderation for a while.

Alex


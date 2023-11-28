Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7308C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 11:06:15 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.30302.1701169568104662045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 03:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRdavaX+;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9b1839e90so4869681fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701169566; x=1701774366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3c+re9x4cGqXvhyWbWOeOiIR/FP+bcnC/gzKg1apdqw=;
        b=NRdavaX+FzfVc3UISMX9D2QrY0ubtVRLnyY1XkEsnlsbymqIPpnezhhcLv07xulFPN
         XH8nMDs/Gq5jY9SagrYiEDGhrgh2j18xAayug0cHcbcLZnfIiTCFVWpXOXJP1adP0QRw
         xHCZMSv105jc48BUu72X2Bi1sg35E5cNmNOSp1JCu9N///bKqpLFpK8o6OBEtHN6MbgP
         5mEM9ebVBByK6w1j1CXl/AfYcv9UqJ/xBNv9mHhzICHtR3DFObJkADnyvAynFuVQR8Ix
         DH0VRTwNhM+RSXPaZiIyJ+8N4Oppbe9rn2thbk4iM3XpjIyv70JJJL0vR4KONML9T4sb
         M0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169566; x=1701774366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c+re9x4cGqXvhyWbWOeOiIR/FP+bcnC/gzKg1apdqw=;
        b=jYk2/jXXJm2OxK+uTOMrR54xD9c2d17kOFaiSCpbyeWdV+0fzDoOLnYTQkUtpSnmYC
         vFWiymUddat203InTH1dy8TQOX5YtYcSfqkJk1hLrUIhkNzlq9ieFp5mKxw8QiyD4SK3
         +njKt1O/PsnPEEpmx4a5unWhxlfqzSof9XxXZz/skZpVnDe54JIIaumlomiZ88lI1gSw
         8F4jbBOAuG34DWWkSrs9bejDSby7RdC5KgB5ew50+qBdGq5gqZZvqZRyNgE8kkWZOjTQ
         zT+ieBRm6rboqYf9IdvsoKqMzD5+F4Arz9IgNVZU325V5IxeyA9EO0Kq0FgmLJhMb+z9
         Zgiw==
X-Gm-Message-State: AOJu0YwRa5jQkRuyJvWXPh5vDKwiC4LPYDXw1kWBh33qBobxr8x72+mi
	pBmKObHzKEoXARse5ucm4xY7J9I4w8yPTDNDXDI=
X-Google-Smtp-Source: AGHT+IFlBSclBqLXuUZu3UHoKCFAqZ22NNqrlWlZJubgiedU3KbqHnpfKOZ9PICqseJ0RV4ap28yjkAq1qrKFFBmrtk=
X-Received: by 2002:a2e:97ca:0:b0:2c0:13d5:e463 with SMTP id
 m10-20020a2e97ca000000b002c013d5e463mr5041327ljj.7.1701169565991; Tue, 28 Nov
 2023 03:06:05 -0800 (PST)
MIME-Version: 1.0
References: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
 <CALT56yOkiWRvEh1nJOXrZ+JRLc+L2CO5rqxUe6o7q2yanU41=A@mail.gmail.com> <41999db7-47e3-4ba7-b184-dadad299c368@quicinc.com>
In-Reply-To: <41999db7-47e3-4ba7-b184-dadad299c368@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 12:05:54 +0100
Message-ID: <CANNYZj_u8CC-Mj64dfHKFn6NCsNmXSwbfYJ2XtM1XxBaxG1xPg@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH v2] systemd-boot: fix
 build issues on armv7a-linux
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, Trevor Gamblin <tgamblin@baylibre.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 11:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191359

But what was the excessive line that caused patchtest to not say
anything useful? Can patchtest trim it or otherwise do better?

Alex

On Tue, 28 Nov 2023 at 11:48, Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> I figured it by running patchtest. S-o-B trailer missing in .patch. I am
> updating it.
>
> On 11/28/2023 4:15 PM, Dmitry Baryshkov wrote:
> > not know, which tests have failed, there
> > is no way to fix the issue.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191358): https://lists.openembedded.org/g/openembedded-core/message/191358
> Mute This Topic: https://lists.openembedded.org/mt/102828551/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


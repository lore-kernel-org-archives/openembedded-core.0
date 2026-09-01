Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5961C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:37:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9917.1788273457245975101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 07:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SzNyKNY1;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1044249f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788273455; x=1788878255; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cQaTXH/yIPTniA0BZ/vTPHIF/UPbFZussuUDLTYuvk=;
        b=SzNyKNY1q4/zVF7Xpy4Iz2QTnfGJwTk8Y0O271OE8/fT080bDsLwtKa+tZKqXsumC9
         dnZ7RyydTn6kWfHPG+SojHZ7KkzVgdTj/oUaiVf8G88AyBoOFqBWmgDW5co0zVnLgZAJ
         9emk70AY8iyp9mYYP6/BzAFXD81tsOO4SilIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273455; x=1788878255;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cQaTXH/yIPTniA0BZ/vTPHIF/UPbFZussuUDLTYuvk=;
        b=n2UsGZhibY4tbdVOwH3dmdZ9NATirCHZDvB0bx4rDh1H0QzNIBLAXdTSHffFIvODd/
         ObN3m8SXsxwkpXWCTZZ6J8gL4FSbelHOEWluB53tFcRGKBtl7GDgJJe1A4NTTEOqcTZ+
         4go5xsIRzHmIGZfVjLS7CkHlxhAvVzBlFplqMPN84PHTkR5fMPkBrO9Y34j5s2A0URBp
         oGTZYPuEoQf5OCLnBCTomI+mvIy9d4JWNDxyGeBhHvq0tY4HQocPPZuzjsGucpwDc40Z
         Vx9lLFiK0w24ULTpv/GUBJEH8iibReNexZ0/tFQp7CnZrLx6nEwpOhKkzidCWDOxSmYS
         nzTw==
X-Gm-Message-State: AFuF++nzlz/RwY35Ys7bNSFIRlGyxY+FBZXPsCdG+IHe2q8+7uJ1YMdJ
	icMdRKjEiBmc9jCAMAUHFi8bPZMvSC0aOVHDcdMkiYTg9bFHWzqTPpfhvpBF1MZz4pY=
X-Gm-Gg: AYBFou0J3JF0fu17ryZTzIcOXIp3N1xo04/xE4i340qD9gXuBvhQN/2aqznCdPYnlVE
	B9UqnTZVcDA6GC1wXav/tmn3RiIIhq4xBq/WjbEWU5u5++qKQZWfscFJLDW2bVQSUp9Owew14KQ
	rZzzxs81HF7aQlVusUrkpNEj5kisyaHzk6tKyyHPlZNySGejm9lrevY6CIaR95TqtOXI9JMGy0D
	8zGXV79rqhaBaofoDLUs2lRFdjAyU+J3BLUXX3Je7UpfCdiZOrnz71oK5nIlvhH78vjJhPoC+FI
	oOavgRLdczl5UQW/iW20kPWsO7xEfu/x6LzzA+FNnpZyuPsOdgoG+RgFuVVvSGAh75JI0bc5oEP
	x16uFJ3/WAbTPGWsOoEFfbgmzknBOFMr0fzciUD5RE8dINjFr+MIMnDtP8T/MURTsX5U6MA2s/W
	1WFoEQr0Eh+uoNHQh85q53fcwe9l3Wt+kVucI0acHcnbufiQPwANYIsOYm6H6vn2HL3P3788pVz
	N15XqdCYKKkaN4/dP8Jq/vWVUDB9DUBUKW7lmjVP60uXNrB
X-Received: by 2002:a05:6000:4b1c:b0:484:40b0:ef30 with SMTP id ffacd0b85a97d-48440b0f09emr17224264f8f.6.1788273455340;
        Tue, 01 Sep 2026 07:37:35 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d791a7sm5411160f8f.31.2026.09.01.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:37:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 16:37:34 +0200
Message-Id: <DL4217VNUAZD.1C6QLAX20OP6R@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] libsoup-2.4: fix CVE-2026-1467
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Colin Pinnell McAllister"
 <colinmca242@gmail.com>
To: "Jason" <jason.stasiak@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260831211324.635049-1-jason.stasiak@garmin.com>
 <DL3U9NAEHMUS.1CB70WHCB86EJ@smile.fr>
 <CAAxqs6n1o90G==0XTG=P1ymz5+HS4x0sJjZOpLnFdRYiiKWBYw@mail.gmail.com>
In-Reply-To: <CAAxqs6n1o90G==0XTG=P1ymz5+HS4x0sJjZOpLnFdRYiiKWBYw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244831

On Tue Sep 1, 2026 at 4:35 PM CEST, Jason wrote:
> On Tue, Sep 1, 2026 at 1:32=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>>
>> On Mon Aug 31, 2026 at 11:13 PM CEST, Jason Stasiak via lists.openembedd=
ed.org wrote:
>> > From: Jason Stasiak <jason.stasiak@gmail.com>
>> >
>> > Backport fix for CVE-2026-1467 from meta-oe to OE-core.
>> > Update CVE patch to address a use case where a uri validation
>> > failure was not handled.
>> >
>> > (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>> >
>> > Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
>> > ---
>> >  .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 276 +++++++++++++++++=
+
>> >  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>> >  2 files changed, 277 insertions(+)
>> >  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-=
1467.patch
>>
>> Hello,
>>
>> Isn't that the patch Colin McAllister "colin-pm" (CC'd) asked about on
>> IRC #yocto?
>> https://libera.catirclogs.org/yocto/2026-08-28#1787933879-1787935062;
>>
> Yes, I believe that this is the patch he was asking about.
>
>> Is the trouble he mentioned fixed in this version of the patch?
> Yes, the issue has been addressed in the patch and the associated test ca=
se in
> the connection tests has been updated to verify the change.

Awesome. I'll put the patch in the review queue.

Thanks!
--=20
Yoann Congal
Smile ECS



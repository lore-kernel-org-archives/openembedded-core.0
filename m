Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D03E69160
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:00:34 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87508.1766433626846385221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcIxXJIe;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8885b3c06caso66267756d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766433626; x=1767038426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ij3M+rg+Ot0vSMUTheMzJOQUOKZXoiG5IduTwAj4T4=;
        b=mcIxXJIeAbl4RoCvtXbGca2hR7cwNczbIT7NskxY36y5YAgUKyP913Rqj1gHRocXK1
         +XF5OIIpL+SOpgHeSWXb1FNg8Sgy5gN2iedlJ6NP7wqHllGM4+Yx0E5uHuYlmf7KQRT8
         1TE+FiV9hB2+/DIEMviQHke25wwH9A5TeKR0RKyXrz9ClUGotulbXEqedbwM2UPaC/yT
         LUo4RKBk/fj+07GySld/HNufNMIGc5LUOnPwe7POokCSotMPpid7VncCpxXMX3uoBnT5
         fb27BlxD0o3uGelpHQqhMvyEnkCpAsqzi9zsBJtPUJnPT8F+O3KrJOupe8+/g3RNp2k2
         IfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433626; x=1767038426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ij3M+rg+Ot0vSMUTheMzJOQUOKZXoiG5IduTwAj4T4=;
        b=a4uZxvMIW/nm4xOSp3MUtiiXrTSBFPMZd6fjzK46gNvh1N4u4jbf7YP+dPpmYCEd1g
         +YBvK2NsrbvD98BdAtXXVXtKxUcl15HTrUi8dj5thZB2uHdXRysmPFOtdUCDfUMa9e9K
         fnN1phQNNuX3+XVi0bBhQ/3MXberzeKii3Yqnne+BcbkQA6wHfomvYkmIVk/fl3qFzh2
         trvOJ9jsPxwcmpSQuLt+RJxBS4BabgjUg4IYNT5qv2HIEHBLfhK/yxfrvtx2vtB9auNJ
         JZDeuo/s3UV+bFOlifIcWaK9hH3h2rVvrJAQqKlx8ByA3HQPS5cSqRbpTXEMYVvqrGyI
         8Vpw==
X-Forwarded-Encrypted: i=1; AJvYcCX84kX8lHxvj979bYZzyQJXEqeQVM6pbnaTeri00mt16UQ0QEzUENs4NiqotATHgo+DBS7BsH0wN5jR8c5v0biSxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUGQj1fim0GdlSrNkFOycyD/y/Je4ysy9f1Lab3eYWKR9tTrNS
	zSKQwN4JTRB7McE0aAAC7JJbfvax5dJXuDivZ7YYhkArxXseZtGrfAGAsCdeNo/5TKmeVv//fBR
	0YLYw6lgDeh0Bg7uO7RnDS/YchatGpY8=
X-Gm-Gg: AY/fxX7Wvjdc6EfDXPxa+UwCodzTwufHQfqRIc8aQA63Tmf6j7BYTipmPLbrKE2/s7S
	SsQZr+jIV+J2y3aa6jSwajz+6WYID2KOLWaISXXJ8TzWNj91tHTTKmymtDoChXrc6xaUEj1vOnP
	o4RlcYl8+KH8Xy3vb2BjGs79vpvPwzInqaAKQ+2LSjPwF0Ftw78eeUr0xnOdFl90BXKGLMr8ZIk
	yEpLx6aOFZ08z7swab8bM/LbemXZN9qDmO1pjugnQtnyRVJ6W36mpX2jsQRzRU9AfozUpJNR/xr
	416x
X-Google-Smtp-Source: AGHT+IGAGNY52zNmqvPhFfwo69IB5yD1Bj4LWOAgbdAFybjer3NViHGOHsB7eNjtveepokCcN68i7rlj5ZZ5CJEXDn8=
X-Received: by 2002:a0c:e783:0:b0:880:5bff:74b6 with SMTP id
 6a1803df08f44-88d851fcedbmr153312446d6.7.1766433625597; Mon, 22 Dec 2025
 12:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com> <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
 <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com> <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com>
In-Reply-To: <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 21:00:14 +0100
X-Gm-Features: AQt7F2pDkHqp3vIzuquVmk8FMnWUQ8xyUwwDR_l9hAkMwptzOwqBuE5Z4JQyffw
Message-ID: <CANNYZj9zAxJpGZ=bZHOZh3FBwU_Mgw=89sR8rS53OC99tCvPvQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228325

On Mon, 22 Dec 2025 at 20:52, Trevor Gamblin <tgamblin@baylibre.com> wrote:

> Maybe. I tried all of this locally (on a F43 system, which includes
> 3.14.2 as of writing), and after I sourced the pokysdk script, the
> interpreter on my path changed to version 3.13.4. Seems that the
> install-buildtools script is (at least for me) resulting in a 3.13.4
> version is getting pulled in. I'd think maybe something got contaminated
> somehow from my cache, but there'd be newer 3.13.x versions for it to
> grab if that were the case.

install-buildtools brings in python 3.13 into PATH, as that's what is
inside the buildtools tarball. That is expected and won't change until
after 3.14 lands in core, and new buildtools is produced with it.

The mystery is why the test first gets 3.14 from running python3 (that
comes from the sdk installation), then right after that 3.13 from
running maturin (that comes from buildtools).

Alex


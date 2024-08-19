Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279E7C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:54:16 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.206353.1724057654597724738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUH6/5yi;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5320d8155b4so5355372e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724057653; x=1724662453; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbsuy77JlEQQ7w1y5+JJ9UaL8A6lbrcHbzcFaHsZBTg=;
        b=eUH6/5yimPIJ9aFVwAufszxlU9ImHVT+jzviT3oCcsHJ+knv58ek2szzYV08Uiuim7
         zJ7/a9XQKrRLBQcURH/Z4UX8tA29zm/1OnK2wrjWyjc4+PeFwj9qW35rb/okV1li3Khe
         0NsOwuzbY06192DneyxqBSIJJ66TAZwXHHNHv7I7cMviDoHZXfAJeKxSGQ2W37KxFYvR
         99S5eLDFY163Vnquwu26oLzYKiUH1QsX1IU034+fvQ2MKqE+Mt6Ag97rlF6VlP0PdI+b
         PJqWSJyzsmzTYzjcOvT2QUtD9Gxai/33tK85py0wFzFRNzRbYDmpHCTB/Xdfj5MnNpcZ
         fPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057653; x=1724662453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbsuy77JlEQQ7w1y5+JJ9UaL8A6lbrcHbzcFaHsZBTg=;
        b=c2x0FyVXvKOO4YakpJ05RPo80y6kyQLiV4A3OCT2PEwVlQr4j9kiUL6C/KlmQPu2vh
         YacJPfFXcYRnU9bsPqxQ2GH1WONGhR5P/YwHty+SVCtDXJWYhAeOLIV9tigwEqTAex8b
         x3FNfk5msGkehJjVFqv3uqt5suJ0HNcmYk+5KMJ4RfnQLNVukTlcCwu9417zYCsAB/99
         70nKdkdqh+sLVGi1u2IiQMlKRjodiNYhycR0GHjd6dpQurWVafVip7Y3H7mArZA0ZTt1
         Fc/TbHHVuIoz9Nubv4UPX3wYG0Ga2qXL8JnbGtJ8Y+U3HZrmdkqOqakmUm/wQAYLoZ6w
         2xyg==
X-Forwarded-Encrypted: i=1; AJvYcCWXdAu+dzzXn1KfgDa6TGdqfN9NEs4L4iYwrYN1+yobH2hsQBm6V81vU983D6FwgShb9Ij8tKumNpwWjYrm7J7dbZnTcOri9vmlrP1cGwQvGNNu+a7vV3CX
X-Gm-Message-State: AOJu0YyiQAFuY4/pBUltvOdo61RldLLFf9xX3OUISxwVEYvMvhoE2ZNr
	jR25cAAmP1cQKmur+DQE5basXZT2q19mFFUfxYq+ZURahI2oIGf+2eWdxuLECIw7yxzgntDvYll
	Svm4X4+HwIlwlRUKe73lOu6/E3kI=
X-Google-Smtp-Source: AGHT+IG7ibO37GzmoOAm0maBWF03Oj9xpCM+L7Q4mI0R+4z1Hhzme4c6J6E8obF8H1/EuNvRqZ8SDEmvjbI8DsS5b8g=
X-Received: by 2002:a05:6512:e92:b0:52c:e0fb:92c0 with SMTP id
 2adb3069b0e04-5331c6b936fmr5809971e87.34.1724057652086; Mon, 19 Aug 2024
 01:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240819082215.1322013-1-niko.mauno@vaisala.com> <5af6be94-323e-4c38-bf58-054fe085b650@windriver.com>
In-Reply-To: <5af6be94-323e-4c38-bf58-054fe085b650@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 10:54:00 +0200
Message-ID: <CANNYZj9MXnooyEhKYfNF9-1dVED2UrO_gwFQC8cd+TeZhXYJCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Qi.Chen@windriver.com
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203492

On Mon, 19 Aug 2024 at 10:42, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> Please see my comments in your v1 patch.
> I don't think we should add this PACKAGECONFIG, instead the util-linux's
> check codes need to be improved.

If upstream provides an option to configure things in a release that
we currently provide, then we should absolutely have a PACKAGECONFIG
for it. And I think it should preserve existing default behaviour,
e.g. enable the new API.

Whether an upstream check can be improved is a separate question.
First, it would be good to establish what it's actually doing, and why
is it arriving at an incorrect decision for older kernels. Then we can
see if there's something upstream could reasonably improve (I suspect
not, as it's likely checking kernel headers from linux-libc-headers).

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3C1C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 16:02:30 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.27466.1747929746110593947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mra4pPAb;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso85432976d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747929745; x=1748534545; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/O6gMc+u3fqIb85RKfKCUWWDutuVYHVJDFfNdE+np9k=;
        b=mra4pPAbwNBSmZ9zBehWoXtMKRSUU5Z3ugyGCF9shTxVV3REy59UaMqKqeT/Ruaqeb
         bgi2QCVOchZO9jxrwz1LOYL8l1Y5pc5EKO3ehwOXLaLnRwH6BAHvYK2mbYZrZiiWfPaC
         vP38v2Nt5o5xfHoPvbFLQMXdzDEw0aviszJibpON2KxbZEi5dhmyek9ZvyrKTAfpDJHl
         xAMiRqzl4oxXNrT9nRfL99LT/zz84QGJeeriiRnRjoMcMoJUfaQ8foMKz82hMSNUZdcY
         vrQmgiZXXdi9yX6wHPVFLIDf9lWZ8xkiHA5thnnfTTb0rQilb++HIS+OymJ2nTrV2J6v
         yQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929745; x=1748534545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/O6gMc+u3fqIb85RKfKCUWWDutuVYHVJDFfNdE+np9k=;
        b=XWUQX01ClMfar/btG3cMEr7pEq5SOHNfQ5qlRCrfefB6zOQBCMwMQ6Hb1Mq1hjsj7J
         wvXIUeFk24RBnpIXvjdX75sPhD2eIJ7hOzaVuMHYn+cXN8rFnCk7J7djw5TcU7xw2JB2
         vYOcyM0i4AI9JZ7dr6GgQ4Qcga/oyCShlO2Iootvd+qAJtT+YOY2sSIDMnbWxXrS8LxW
         jOg/0AWX4DUMvg3rB5LYtTBwVPM14lYbsU3XewOmOHIca5nzpcI8q+RK8wlzFNSMh6ym
         /hqIBGgfjDfr1Ig8qxPXbjheuESFerk8a+rVVAF2ni8tTmjdTds+sOpAJebU0xPl68aD
         xe4Q==
X-Gm-Message-State: AOJu0Yxos3qyNKeAMrLoioPYN19XwfkfvjB1YHjnDf4v2QRckiCmwGFF
	GZmj260fUU7usqd2bpProxU1arHj9OwDniLeBT2shQnO+lufD7SkD3XC0S2jnIcOikrZQuDAKNb
	/lYQP087/+G0VGdqFXvsn7o/y2sZjhiI=
X-Gm-Gg: ASbGncsEYaTPBTVBB5ewbkfeOsKsn7PluU3Srr0/uKl2Bwcaa1FGC0nths+6UcB7s/b
	4LzbLUkRCmMafZw3diUWNFUL5dx3HsZKpzzk/ttvMb1aj5NGpHCqjOqO7AAQEFsB2MhSFx1vihw
	bmL6I7q0g+0woG9Q/2c4dJtsXPl9ZTo7MCxg==
X-Google-Smtp-Source: AGHT+IGfmlBTp0FSGQLyOeCuiJzMMNqQ0jyn1SGfgZCPS1jotlerH4xcMcT7OPQXambjoobFpEwgn5qLNLWccH7th0k=
X-Received: by 2002:a05:6214:212b:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-6f8b0841f3fmr420648186d6.13.1747929745109; Thu, 22 May 2025
 09:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 18:02:14 +0200
X-Gm-Features: AX0GCFvv-f58iKm4E9CI1fjzE5_E32UXy3KL-nxMS-oVR6098R2W4801NcyuYdE
Message-ID: <CANNYZj9q-Gy4pyu6MYm0vsVH2oeZBzzw5uUp=gbdvtpVxfmr3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/12] mesa: remove OSMesa support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217130

On Thu, 22 May 2025 at 16:46, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> Mesa 25.1 has dropped OSMesa support. Remove corresponding bits from the
> recipe.
> -PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"

I was going to ask how passing -Dosmesa=false is not causing a meson
error, but the option is still there:

option(
  'osmesa',
  type : 'boolean',
  value : false,
  deprecated : true,
  description : 'Does nothing, left here for a while to avoid build breakages.',
)

Alex


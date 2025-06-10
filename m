Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A23C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:42:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.90030.1749570153540960283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFXghPo5;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fabb948e5aso59377316d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749570152; x=1750174952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i39k5KZQG3H0gI8EwZR6ZwhQ5cQOGVVC+VdvOHf1FRM=;
        b=fFXghPo5L8WPt6OhtBzg3x2lXICEpD6nIxLfkWhEHuLUvNDlfQN0q5b/CH+/YYoP8N
         OLy/zSQUOrWrPCX6GaXdGXctXVKQpAPBRH+NOoUea4ZPzvhNEYhxrfVtAI3tJv/+szfr
         d5pHjL3gVq/YlXeckzA7v/CuU+MKi4gZICDgDR7mJ+X4jIymrhF+zmbo2O+u5uui52DI
         LmD88rYI5V9GDKHDCQUXs44Z9JFI4BqUjL08c+TAlcO2CcPrMjH9kY219/hC9pQewHdh
         +IPnkk5thzKviQHLypK0yWUJQb8QZg7oKYUj2rwVDxLT6fzZQBDb+Zcl/bG6XUYhv0nj
         LpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570152; x=1750174952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i39k5KZQG3H0gI8EwZR6ZwhQ5cQOGVVC+VdvOHf1FRM=;
        b=DPQJCqynK68D+wfA4+Q2T8r1iKNq+7z5Jhy9x88eNTGhFf01QKEcWB0ZcvKfPLXwTo
         ptBI++f2A8YUYuHG2x+27wJmyU9LZn1O0Dmhj8j8fMXZssuIB6HV8if7qyl38l8TftMo
         f9Am219c8xc3ARWc5YwzEhOINd5TQK/8cwRGlOpxLZRQ17Kcd6DsEu2QsNKQfZQbslIF
         JAyX4MMmch+1qopuw1UL7805+ZudonMEYd/usgcuo9JMCkuVtVgoKBmZTMGSoCBNk5af
         qiMZ+2Ovue1c9BepCMYZgxfTeAL7k45m+4xsKnDSS9bsQqp0PyNzyrc+SMoK6crnC+jA
         MPSQ==
X-Gm-Message-State: AOJu0YwXDjm8qcQmuMH6s4ugQbNKYJ84KJR7TyS18EsC/CxdMegrEiOx
	rAgsgOjGop+FFLRjyHwa2YTEtVflXJyyCPaBJHiU8vwfoJscnyS1t6fQhDeKJ+Y3vPM9P7FHeQP
	2S3Hf4ZLHRV9WvC0CERNh+Bs9SZfVhLY=
X-Gm-Gg: ASbGncv6B/PzNEF/eiBroTjoN2T4Nm9grGRQvPZGn9gilgEyfIKj+taiKd7pPn5jO1G
	N7hbX6kRH8IRLHfA2QYo6XLFa557ZxqwWQIXJdqmQeA6woNHmxLiyCKETh82UMgcTbzzUSnXKVZ
	dB7rnWABBjxgkX4ejlPvA3DqrIzlNFOknnqR4QEQurW3QtrpM+FFz7rzuT7IovIODHzQ5Nt31v6
	5GPNPM524UM1xOG
X-Google-Smtp-Source: AGHT+IHtml1lCH+pjNfh7BUsOeZZB9ff2ebt6bZao4rpp/xlC1I594cgUQMZpvOcUnH9zCSEjUeLLoe0skUyaLOHyOw=
X-Received: by 2002:a05:6214:8090:b0:6fb:f00:48ad with SMTP id
 6a1803df08f44-6fb0f004c4emr207838426d6.18.1749570152491; Tue, 10 Jun 2025
 08:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
 <20250610094400.1653931-2-alex.kanavin@gmail.com> <68172307754c290abb2f0ea59aea4e161d55ccb2.camel@linuxfoundation.org>
In-Reply-To: <68172307754c290abb2f0ea59aea4e161d55ccb2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jun 2025 17:42:21 +0200
X-Gm-Features: AX0GCFtFh98e2uOQV4R8CfNYmuns5_T0cn7pIYg5lJApdov5arq0w0X7FdlDOf0
Message-ID: <CANNYZj9UrWqhxx-KS7S=J=YT+iSYgOy=1MDptFK-yrcX1dYq1Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/9] bitbake.conf: set UNPACKDIR to just
 'sources' and not 'sources-unpack'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218366

On Tue, 10 Jun 2025 at 14:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> FWIW this was previously rejected due to confusion with the default for
> DL_DIR often being "sources".

I'd like to look at that discussion, particularly to see what evidence
was presented for 'often'.

I'd still argue DL_DIR should have 'downloads' in it somewhere, as
suggested in oe-core default (and variable name). There's already a
number of recipes that set S to WORKDIR/sources and UNPACKDIR to S
(and that pattern made it into the docs too), so from that perspective
standardizing on 'sources' across oe-core is going to be less
confusion.

Alex


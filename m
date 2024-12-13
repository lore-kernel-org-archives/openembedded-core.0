Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9498E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 08:28:51 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.11249.1734078522054228412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 00:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScYxdbVz;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d88282980bso15256836d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734078521; x=1734683321; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58NJJ56kjhdmq/umYXUKJu+KY9pnwh5NlQ3M13KnrSI=;
        b=ScYxdbVzO4ctrJJgnadm+6drkRhOFSmKE0NU8zhQugyAdf0Ld9bOFM2l4qvLJ0n86l
         2OQ+X0OmEeA2wGMKK3I4A2IomaVCUMtf9yuAc4sv9rKZq6zv/aWVN6V3go9s/I8t+MDu
         0p7Al2qCBBV3GSk8h5cAwgn9wZbh11ID0CB41zHjD7HOtS776yjDnywD9v6K6RqBwwuh
         0skB27OjCxjXck1mzSD7c65Q3le9eH6TGcjjNKWP+IJfeFrInIrblH36sSkoZM+tKAC9
         xjtEuFyCZIu48UUcNRJ2isgqAmxJqfcRdsUqs2RHwCjDVzCa3Uh7k9Z1XufDYUCo2Dd9
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734078521; x=1734683321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58NJJ56kjhdmq/umYXUKJu+KY9pnwh5NlQ3M13KnrSI=;
        b=EGpf+GYmIfsmKfqCHOTgt951EcktdKEvCE3hjWZSHOLQUCBqk7PefZI4qIst9gWhGS
         hQWJ4dvMUYPEkbD5Azz5dENYliYJRyrkKig/g29O+4fsf78vugj6zFJITcDafI4pkK7r
         Xhl5/XcAIq7NPDS4S3HUoMafL0MEZYnrHjF0DLBj9K4VKAgvJf8MSuczc+Oxhky0neTp
         1+TVx2pAAlSbtKvrbAm3oF4z0WLEWOcJ0dyBygufjmLI5EE9LI+o7ZYImOc1kYhDt9U3
         Q2/ZldxlO6ex6/Efpbw82/ZWB0UGD6pHFf0m3USbSPuhXtY74Of0gDTYTgk3OQ03x5BE
         Hr+A==
X-Gm-Message-State: AOJu0YxDYiRNEEtDen78hp5EDfWBHw1yVTpk5M1Ypw3CM4EQntsN7TwC
	FqfTschiM9I75VfAOrlNZm6WGFA6GmDEOtpVGVCw5N/JaZq7orJz4U039BOKI+D7zWzFUTau1Z+
	PeSKor7lL98W/zaWeFT/gVcrej24=
X-Gm-Gg: ASbGncuChfQdvoMtxrNVg3uxGKriFhyHSAV083vSXKCT0ah0oXb8tVrNt4ZEwNuHPRn
	oKnVG9MtrtBQ82la0fEyn0/7zDHn/g2JJOb1L2jWYC4Iv/ZJg9VU6qoLbOXQeRn72zBK2YlKr
X-Google-Smtp-Source: AGHT+IFJlxefR0TAnO0BAzcQWEd92pAHf4d+H9yydrGLDTJOZ0R/xjV2gSSmhy2n7Xk4T79akCLERJORIRKYCzgyAVA=
X-Received: by 2002:a05:6214:5008:b0:6cb:99db:bdd5 with SMTP id
 6a1803df08f44-6dc8ef18a79mr33780336d6.39.1734078520940; Fri, 13 Dec 2024
 00:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io>
In-Reply-To: <20241212185619.1599668-1-derek@asterius.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2024 09:28:30 +0100
Message-ID: <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: derek@asterius.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 08:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208670

On Thu, 12 Dec 2024 at 19:56, Derek Straka via lists.openembedded.org
<derek=asterius.io@lists.openembedded.org> wrote:

> Update the UPSTREAM_CHECK_URI to leverage the simple repo API.  The
> project URLs require javascript which breaks the version checking fetch
> and subsequent logic.  The simple repo API provides similar
> functionality with a well defined spec which is used by tools such as
> pip.  Also update the UPSTREAM_CHECK_REGEX to be compatible with the
> information retrieved via the API

Unfortunately even with this patch, there's a large amount of
UNKNOWN_BROKEN in the output of 'devtool check-upgrade-status'. Can
you please check those, hopefully it's a simple tweak?

Alex


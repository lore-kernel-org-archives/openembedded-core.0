Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8C6C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 11:22:55 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.7911.1720092173198828533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 04:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvbPOXHq;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e9f863c46so507653e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 04:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720092171; x=1720696971; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMSdhffF7hKX2+yTjbWhcz4qHfYLIWXQCJhku+UxoS0=;
        b=hvbPOXHqM95czCZdWiQ0dz3HykFmcTrIXIguf6+Y4d+wlHix/7k/rC5MRMogthKHqm
         bFfPk5Vl09ceZJ6wX2JPM+e+m6iSd68xutU4r0b84chpmB6dz7bYnidAf8LcZeEFmxCQ
         ZXRquSPczYNu8W/8fbPcOM6OYVVBMdqVaOnyKsiif0lsVeUznWINNSTZN+mZhFAHQKQs
         R//5r9p9lRN4vrRqbKXuOJEX5fwHN720R2w/wCGOl/kYos/pUv36hFHrst7XGXEvImeh
         kF8tgPQ8Cu5hwI4lOVBfO64e4qPu1NvT+3DElnSO+TQpxa2dsc2T6uVoXJ218QcYeChE
         jGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720092171; x=1720696971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMSdhffF7hKX2+yTjbWhcz4qHfYLIWXQCJhku+UxoS0=;
        b=XJ26EIYFtxrd6lZ9uvbF3NX/dtXrbRs0L9hP+Vp5O+HfgMa6u3FK8d4nvwn1sPuL96
         qsPpMcOmGWbbqXcbAgm8NtSo6946AifmOL+NO2IjW/gRcdSea9MvTlgyZAfR/qgZaVrr
         ElEfe/H259KuLah2XMnPfLcH04JwRg3eUK1RS1SnEZiOckNNiw24zvms0+kLyz5FCKKD
         3vSAA8DgPQoEmpYQCGN4Z1f1gaEQ2OTEDwcUPBpiD5Ywhp66e8KJfmAZRso1mh8anRF3
         FHjTfmci5LlOxdl6XFtVWFZHvVlRW1g5Pd2KSrWo77fRtKG16zDEe38VgQX80UR7NwNq
         a+1w==
X-Forwarded-Encrypted: i=1; AJvYcCXgoWvPj4OJ3I/uKPTJlmGIWZYL3+4KNJd5py7KXUCPk0Lyz08wcBnBU1s+9I8NH0ZblkI65t2khgHZ1JpyOvFQZ1qfPQkUjevL2P/KkqeCNL/ITgwn5jr7
X-Gm-Message-State: AOJu0YxEjmzgcKwlL/rUSRwYqKg0qFsVoKq1Ym2lR1d1B8InkLKZyYVt
	GYlx473hYPIxXS8hC07NdTabaVEzck3Q/V3gtOay3yXdw935Kszua6jWwSgVS1t/dvXcne8YAZI
	7jW89csbB9S2iRQlaWKxhNap46IL1qg==
X-Google-Smtp-Source: AGHT+IHc3s9ax+tmE5jQPtgomrRGi6+XEcug6vw38B77iAgz+bVuddNbNP2dwxh+QsB6W0x2rhnXMnDzJOZkFiS1xcM=
X-Received: by 2002:ac2:530e:0:b0:52c:dea0:dd55 with SMTP id
 2adb3069b0e04-52ea0629e54mr956292e87.24.1720092171030; Thu, 04 Jul 2024
 04:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <31491.1720072149300569224@lists.openembedded.org>
 <Groupsio.2.31491.1720072149300569224@lists.openembedded.org> <17DEFC31DA378080.5810@lists.openembedded.org>
In-Reply-To: <17DEFC31DA378080.5810@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 13:22:39 +0200
Message-ID: <CANNYZj9PzQg+FfTdULjsGty3J2w3eyVu5kktQA0HdJS-h=E1KQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
To: alex.kanavin@gmail.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201537

On Thu, 4 Jul 2024 at 12:36, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> It's arm/arm64/x86/x86-64/mips/mips64/ppc.
>
> Given that rust upstream has all mips support in tier 3 (no promises),
> and ppc support in tier 2 without host tools (only building standard
> libraries for the target is tested), I don't think we should be
> fighting against that:
> https://doc.rust-lang.org/rustc/platform-support.html
>
> Those targets already have reduced testing via arch-qemu-lite here:
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>
> and I think we need toolchain-lite as well where rust would be skipped.

I see that mips32 is already skipped by the test itself. So maybe
mips64 and ppc should simply be added there.

Alex


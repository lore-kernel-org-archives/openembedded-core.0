Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE5CC3600B
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 22:29:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.52642.1742855353557053131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 15:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UTuNu28b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso31782525e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742855352; x=1743460152; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zQjfOY6LdDq8hnPlrMnKfjrMA24VQxZpP6u7/Gu46us=;
        b=UTuNu28bwOI0ajF4Do5r7RF5zPiH7T7ccV+HeQwhnJHuCWgkF63STkTHbx6fTJjYFI
         bJVXZ5YdmaDwnWEVpo5UpMsXkTp2J394u6pW1CpDlxrZ7O2f2Rx86t64p6VWOk9vAgPl
         /+S4Rp6lULy+QO8VscYPHX9V9cnifW5qpeK4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742855352; x=1743460152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQjfOY6LdDq8hnPlrMnKfjrMA24VQxZpP6u7/Gu46us=;
        b=USq/Rhmq+qPwyFNcjXv10oCjt1wXJ/588/DL6eCB5qHDw5+qvQT4e3Ule4AfZM+X/2
         TT0OGvm1gmZ59slwHYzsSJULtbg8SfyxCDPAc+QQDDNuctTuEpZ2/NXXJaEuDArD4HbB
         ny365zG9jeVZdsxySzOjaJI1mkyf1kTWvj2pBA8Uk/WLeeIlF5VSnBv4yx5VgY1WI236
         +wohr/t0Wkblq0egGSJNEVKmqmrIwPTmstKcZwRhg5yV7Z/thHrynTYWwibOaQWSdaHX
         vItN3L5X4WUIfeJp7vQ62sYB9IsdB+6h+Wt1g5wAIFBe9uTpi0vZ/0FL4VQEpPJUpF88
         X2zg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0PPdzU6iXXnqrqghg3tWDLZZH7Z7IBb4HuEiGsCGvKGWdIoEK/ZPb/QE9LeIBfr+ctwaBb8AT1Vj9/744k6jAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZnionWAxPOQrf3TaGHNs4kan4xGnOUTc9PIGtM2klzRVxbCpM
	J0/+OxwfFXGMwYhL+PdhaFVOKj23ewWPaLZGD0A5V4F3yC3FvUSHqvqAnPCYhp2z/RtOHIUdBzL
	L
X-Gm-Gg: ASbGncsuTuKLgtIYweBaakgNSDeIMRzDpjkkZvHute5ITO8LgLkdoDzcWMPd3yvC43D
	FC6DGVaiK5jUNTSXghwmdJxEYDv5+K1VtVDqS4StVEw7aWe8DiNVDsL5SrkUWEvNQ5JlJVAWxho
	2AyYWT+PTArY3JutB+sxnTEFt8W24MFOnDzrzWEWH0XT+qp/3XsRPufPXkgeSuQMd42GqmQfvUP
	ghYoUh4OkOZmOjVbGEH7uzDRzJoMR3CSvpGH5cjDuhKBSHwN7zruKIj38QxrTaLl8KuZ6PuKCFu
	nrFKzbnzF0UL+s9uijJfXKngnhflbfaZU/q0XqjqZ+DwfHibI/VobLZxpAlburZjL98Q9Eh4K1X
	NMXwi0nHVA+pTkD0e0e7Woq+0UtlztOvE4g==
X-Google-Smtp-Source: AGHT+IFob7Fh/7R76hIdfnZ3hUmixcnaNXEWxXsWGfDbcNseKhACmrXk+n9Z/0qNdZw2zATZAMn+/g==
X-Received: by 2002:a05:600c:468a:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43d509f4d2fmr152900155e9.18.1742855351854;
        Mon, 24 Mar 2025 15:29:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a60f:7d04:efa2:677a? ([2001:8b0:aba:5f3c:a60f:7d04:efa2:677a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm12237297f8f.64.2025.03.24.15.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 15:29:11 -0700 (PDT)
Message-ID: <132f8c53bfcd2fdde768f4644acbbb1cbc96786b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending
 PACKAGECONFIG_CONFARGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: jarsoper@gmail.com, openembedded-core@lists.openembedded.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, DongJoo Kim	 <dongjoo.kim@lge.com>
Date: Mon, 24 Mar 2025 22:29:10 +0000
In-Reply-To: <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com>
References: <20250320165517.129442-1-martin.jansa@gmail.com>
	 <182E912DEB60EF95.20788@lists.openembedded.org>
	 <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
	 <182E91CCE4A2B275.19116@lists.openembedded.org>
	 <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
	 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
	 <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
	 <CANNYZj80f3_vmVSP0sBRVWKix+ZAAYSkT4v-prJHbpO6q8XrpA@mail.gmail.com>
	 <CA+chaQfsMaBR7NgCKbrw56VSHFNj09r3irFNiCuBeMmZivv37w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 22:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213585

On Mon, 2025-03-24 at 20:30 +0100, Martin Jansa wrote:
> I had to patch Cargo.toml in gst-plugins-webos to define all possible
> options in [features] to avoid "error: the package
> 'gst-plugin-unifiedbin' does not contain these features:
> unifieddecodebin, .." and then I was able to change our PACKAGECONFIG
> to pass them with --features instead of --cfg feature and use them
> with cargo as the previous patch did. I didn't verify it in runtime
> yet, but it passed the build.
>=20
> If that's the recommended option, then I'm fine with that and only
> 1/2
> should be merged and not this 2/2 nor the revert RP sent earlier
> today.

If we all agree then I can drop the revert and add 1/2 back and merge
that...

Cheers,

Richard


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2382ECA5FB7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:18:18 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11626.1768929497374657782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKo2tifI;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-502b0aa36feso320541cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768929496; cv=none;
        d=google.com; s=arc-20240605;
        b=VjZxWMLzOEa2NbxeV6GB+tnOJvbdrB6yELLm77e20hKMBd2dklLUHI6xPITEIi55Zl
         8SjpgdT9+NxmZZ7+QCD0HSHrdVvV7HG6LAz4hRGkZwGJAh9fUOjGO1s68wf/5ELR2r7k
         Bpeul36hurR2Ayaz88ZqTkSVc/EQtRUe0GfVj2fwZIsIt15PMH7aPJco1HXQzJ2XUfLA
         auziZ3pZr7rGm4/dvPJCSQURuYfgJKjnMGA82fZ9jh+OuKJ/zRc50gxsgw8tPniNA1pH
         rg0BgBc8S1Ej2iyTdowo1AfPtb1+oSm1dWERpGGGfPOexqXIfXqLsJsfW2Fb47RrQohg
         oujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sy/JSgHzOShj+wwFum2QvM1zBgDGWCF7JwbRsHKiK6c=;
        fh=KclkrtLVSu+LV938TMebq0qrqAb+d8VdXkMSfxqDJAc=;
        b=jLnlYhP6N3gwkI7xYhEOsr8nchxQHKKFMtmNDQvdbi2ZM7Wy45YSdQesEEIzOVy78y
         iZG/4FgRHJyI7A3OoAljRPU4K+UCG/jtdIn7Nwv8YHauoOEUnuyuwId7/MqqSWq4brcm
         Fxdo+DKM/rUhFkuqryLAxFhinhCGbhwcBWOGNi3YV/1VJvOT+V6trqTP9exbrBeeQcUB
         kWWMBEmvaX201SOT9NaJKKwBy8chE7FF1/Q5d4LBKrnCYf53UzIY3qHhUgn9B6r25r1m
         K7rOsaU7btOCzhOIO/ZEfhshaENZizB3IoGIjfy1T7nr9zFtbkRG/jCgy9QiYsgoUIZk
         eqIA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768929496; x=1769534296; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sy/JSgHzOShj+wwFum2QvM1zBgDGWCF7JwbRsHKiK6c=;
        b=eKo2tifIJtqnJvBhHeYWbAiT6OC/4wvBvr4ARFhBlw5uCHv1ZWNIMKLFdsMRuIl0EX
         STcaI726WnFqN9fJ5C8n7UbZvq2UNZuun5F7j7bamnTO0hXKHF2gLo10WQ4kFkgbwEnp
         qFJq8ChfOmueh6CVsy4esw+ZlFj8EzUGvtT4CQvFaY5FDDLM0WVTVwibqzNYXxWZ5rP9
         tAKOX2KWk73T8+C+Vp1flqYAUg/AlOCrSHwMvQYW84va2gjxe0oYt/t/dV715Sk/SLtW
         7Xe18yYkZDrceN+8sob9192togXJfplkBEzowFm44xccGIjCC+a+RyA7bLELwVtrTLtj
         rhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929496; x=1769534296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy/JSgHzOShj+wwFum2QvM1zBgDGWCF7JwbRsHKiK6c=;
        b=aa8ifoZzjK7orY++SGNZedRvcJ2/P/OnekfpRgF7aw2HXQMqKxS2a07NKartBSRGlC
         4BR4mLMHKy6BfjxR3YFkao/kS6w916/64lmtP26e5mQqrtLv8FG8XhoqMsxCwNF4YKHC
         6WWC79J739tQj3yT3/2VoQTl05ylLLDpAMz19KtT0RuqCsOrxLfP45yT7ute6ncwKD3A
         7Oqt74M0SkbqDC7t7OALafC1d1/oV6zklPywy64OgxbcBDSL/sbzdAAN+egrDy7//aBD
         0xkUQnhwroaZz5VorSqsZO0Xji6TWmwfjBaVLlnFe4CUNI5n9lDyGAo+pKz3c7QuJwej
         dr+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLWOD87W25DmVaYVko0NU6zzPsg6t7cH8HQoHnF/lX3NMn9jB/JKuFRn3pWo0ZQ63wLXInYhwRIyziNrDdPzqBig==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yycged/nHge5xbERP3K8IJVzk4civTuDhtxeveQ2yrQjlxo8eg3
	VGUtH3XYdCR9pZI6/1HFrj9ZSVoZb2BjlF1+ZIZ/6vKk2+ZIdcr3hqmRuWiMoOZbjJGf1a2oPvQ
	qaAUgvGt75Gzx4fNjfmuCESQ8IPnxnp4=
X-Gm-Gg: AY/fxX5bC5yj1FIP5Ml9KWGWpvv9AcamkFjQAuHOEHfbGK71gNtalloIGt2mWNGZq3Y
	0+8RI492F11fdj486mglPlVPwDR8gVQGmAhqPyJzM2/xn1szjZA6bOGGhGvZeGmebhb+ra5xvRi
	Fl2TCj9Ik4IChje6XeXhf0KsNG/qYdy1aHJw/caGm+pK23T328AgO4Mw9iJZjmOfi50jg6U1Mdz
	aBw6B+alGR6kMvD9TPtXgPrPfAejPR6ctqmnsCo5zAszjb3nvAYWE+OMgbyiH+DLcOInuGv8R3r
	9v2GBb9DxiPS7cTApS5BbxHSNeacuw==
X-Received: by 2002:a05:622a:283:b0:501:3aed:fa5f with SMTP id
 d75a77b69052e-5019f84ac6amr246100501cf.12.1768929496165; Tue, 20 Jan 2026
 09:18:16 -0800 (PST)
MIME-Version: 1.0
References: <1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
 <CANNYZj-fAJ4xS2GuHazHeExo7FQduObgdvjXYcq_wShv+sp4mQ@mail.gmail.com>
 <3d99b9245edf44f560cb198e7bb0cb2ed3ce8159.camel@linuxfoundation.org> <a1c69479-0aa9-4d75-89a7-05580263cfbf@kernel.crashing.org>
In-Reply-To: <a1c69479-0aa9-4d75-89a7-05580263cfbf@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Jan 2026 18:18:04 +0100
X-Gm-Features: AZwV_QgGkieWcOhhWhDQH7EOJMUfNDij3jNJGt7HZOYlpxRYo_Qrax8srptcW3U
Message-ID: <CANNYZj-p4HkASNVWtkQ3BUAkQ+bkyhMBdNwXLUEJuRvd53p0Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dpkg: Fix ADMINDIR
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229745

On Mon, 19 Jan 2026 at 22:53, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> This has been sent to the upstream dpkg mailing list, and should eventually
> appear in the index at "https://lists.debian.org/debian-dpkg/2026/01/maillist.html"

Thanks! It has now appeared, and the patch to oe-core hasn't yet
merged. Can you send a v2, replacing Pending with Submitted
[https://lists.debian.org/debian-dpkg/2026/01/maillist.html] ?

Alex


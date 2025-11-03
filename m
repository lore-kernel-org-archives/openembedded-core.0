Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8968CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:19:39 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18360.1762168779131379740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I8zOeMWe;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-880438a762cso14280936d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168778; x=1762773578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vANQAT8lulJ0jUJPfslKYspsaIro35/fYmfK5w3bzYA=;
        b=I8zOeMWenFzv0hesqiNqT0YXdUZ4+n9eAOVD30tOJQqC2D6h9Ww5FDNMOcW9SJqdMn
         Ya4ZwbfiQOrmI09X0u87LYtlOkgZu3B3Hw3/KMW9Qpx30J8UDKbLLJrRfRHH2sMhv1mf
         C8WAwm1i3age0AzVMrNLsGtsLaf8cfG/h58YR2ccJz4LPaTpHjbJtqlS8NvxjSL4ioHX
         85nZxX9yeba+bXgu8iIKx9KaeS9iHPvWomhJZ+lp0cmDVzxrJHhfsCM3oGP5FuQ+isAF
         pga7nGmRY4GOhjsp6LyZc65nw2nh1CqnUR2t/h2yLMBdaqcmz7dRvLGmWL7pyUb457ao
         zRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168778; x=1762773578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vANQAT8lulJ0jUJPfslKYspsaIro35/fYmfK5w3bzYA=;
        b=WrI/7C59EkqJQgGKdEbVbeuOQqBFX64JB6WiUNl7IbgYYQuzrTns7GbM7ufOb4YAC8
         WULkuAN2oTscoBpUYfN2JMuQ9RDMtSYkaJ9TG466e5tOQ5YtY6j0X94ScbIaNM2vTnHX
         H0Zlrw+Cr8i4KtzJwtIdrTAb2nLIL4gDSegPOvgvVNyArV/Qd+9T4NcETWNmWA29mQ9/
         xOaUzGxnVdH36WvK7Blx57WaQT1u/G2HTFrOhCruPZs7XGeHUBgkiQ4PH9tDO0nWd0v/
         fvA59/wXbIOWbueRzmZZ7jP0p0suKLhdIm1JNRZ5RbFCRegOGIaHYkbBbeg9paSVv795
         rbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkatUXlp+oKCi8+QTVyQEwjnnvHmjuynsO8MXqKdRgVnsr0UGZbqK1mZplzXxQoJ0Y157ySmbfs8zvVI2nXvPTdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLot5mroG2vdmyo8fINsOq8v36pxoJQQWTwPXYSvIoW4xhkcD6
	kpiMVXEqRPEmy+wv5hsFMqIyJLZXsnMNdI0MgHQO6KQcw8KjQ933pmVKgllrhivbeRuUQkNWCRX
	HkuMR58LfSrk/C0DRZ+bhbnxz8L458JrRXQ==
X-Gm-Gg: ASbGncvnfDYJcJxV6yxajpYG4RxPw5KTQtBsjiYXu2WhwgWKHI8++c9zQrko96o0BzQ
	17EONyzhAn3EO3TCDsSIUctJ9UzwFDbO0xjwrDYhaltcv5DsDTjwPti6CRPssY2GSK4zE9RWQ+5
	k7BKZELQDyOT6y9FOSEXKH37dGMrKjsM1T4mx3sl3I4iGelFrVEF3oSGSjLtPGfNjn0EusOGN8r
	bBXydizz9BXyXymHuMvyHxcm9p3Y/MY2OYYMYtCAb+2Z2+jeyZeD5r8jUikkzBtx9672UE6q9z4
	SsTmxK+pxnNdtnULuhMhS60SV8UyXfgX2mRUx1nQ
X-Google-Smtp-Source: AGHT+IFpUbZGkzPQSgQydzMiqgONA4pTnMfv0Z8d3kfOjgQkIBRi1wC6Bl+mFoFpvAYffQ/3TVOHovX2MzH4HyZIX80=
X-Received: by 2002:a05:6214:da2:b0:87b:cc00:5de7 with SMTP id
 6a1803df08f44-8802f2cf718mr155128046d6.18.1762168778151; Mon, 03 Nov 2025
 03:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20251103074354.4086836-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251103074354.4086836-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 12:19:26 +0100
X-Gm-Features: AWmQ_bl2gFLfzR0_F7ywZ0y-uun7jAj4jXWG-YCOaPkKIKg4vJROTdFAHX-12io
Message-ID: <CANNYZj9bjE5jau7wbFdcZpDwrg0iphyDbDw61mQOZPY8mHwMpQ@mail.gmail.com>
Subject: Re: [PATCH v3] icu: use automake ptest output format
To: jiaying.song.cn@windriver.com
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225646

On Mon, 3 Nov 2025 at 08:44, <jiaying.song.cn@windriver.com> wrote:
> +Subject: [PATCH] Make ICU ptest output compatible with Automake format
> +
> +Change test result format to PASS/FAIL for Automake compatibility
> +
> +Upstream-Status: Inappropriate [oe-specific]

Thanks, I think this patch is good.

Despite what Ross said, can you nevertheless still send it upstream?
There is a (small) chance they still take it, and if not, there is a
(sligtly bigger) chance they find some other way to support
automake-style outputs, as this will make the issue known to them. If
they reject it altogether, that's fine too, we'll have a link to that
in the patch.

Alex


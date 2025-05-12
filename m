Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1595AC3ABCD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 12:19:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.48921.1747052366745399879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 05:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CpsxXbGt;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f54036c4b9so45126606d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747052366; x=1747657166; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZIKDysp9qhXQnJXUcWmUFRbD3aGstsEg7rTTi9zt4=;
        b=CpsxXbGtioFD8npauvWvxdxxCeQekSyBwmkY7jec5n3IWeTr3EGCDmxXZX/5Le1/eB
         T+6Gp42wT4/1ldA+PZ3oN8l/P8XhtW4AsxKSvq7ynJiLAw6jS/FqzeBQEpW6fZlDAuA1
         jw5rdgMH3aVwl2uGQSg6LpvqR6FUArmcF48hQIaq7Ll8aY4JxEXRUgBfE1KcYTtu46cB
         yxhS2rhIMlGXf8+D1zguaex7anHZRrUOY4qPaGb+wPIwuVlzBR/zH6M8TCxJ9MIB6L0/
         XLocJ9eHbA7Yt10jdxbiiOLY/b0nojbS8u4Gb0a0c6S1dri5teXtVS+mbbfL0ir9azbY
         i+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052366; x=1747657166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvZIKDysp9qhXQnJXUcWmUFRbD3aGstsEg7rTTi9zt4=;
        b=lkYEsycQ8Q+e3ojJUO6Ty3J+TtaJipfFc6cVwrALpXeQHCMCr7cWM4ZXmMc8DoqO4z
         8jhMw79Ct8NOq/nbzhk64K1hku2Ro6gzCc33aB2Zh1F8eQhWPy5o250aj14gPJyu/1iK
         q0kQ47MDY2cgl1wsWvQcD5nxxvc66PsqGAci/j55szCgakcIVrMYUphcOJsR7A9lNEil
         9zk0XGpfHU8Yh8m2JvYNeKnhcCQNlxj6OuvGDriPCuv/6WJfp+vm0Iu64Pj82KCtGF/3
         yBvZ8LooKExeoC6HTrp722FqYgCKEfBMu2jytdp2z4NOQFjn0UUjh3fh6Xf3A/kxl0UK
         WOoA==
X-Gm-Message-State: AOJu0Yyfcmnv/kOspiMYIRRGqUnbtiZfsTj88Ci4MZcNXmSSmpeJNkNU
	MMVkzQXYL/2mqNFPXuh3HNIi9s/vDNKQ6eckq1RShvvUeVK8vD++fVFi5gO2I1bWVPEgNdr2Dt8
	U48LrGH/zkvFXQh373L9+lGogBJw=
X-Gm-Gg: ASbGnctJ8letE8VjozSHdB1ratygUYIpJXb0aD0+iTtlqiDIHqAx4XIRpo3VlsARj7T
	PEjp/ConNdMfLWn5Dq74CuI/D4KgTNg6OtJBSvPwZsygxXwVQU0klmoi5wTdWbGt00jJ1QUm98a
	LPsZq/0uK1BAWFATn9z61SIJrf2KZQBAewjw==
X-Google-Smtp-Source: AGHT+IFgJgkUVethSVv29bWAiNDsHH86yUI38Tu+AdyKt0umFwc4c35XPPY2rCAxRCjYwi0KUQBw9Y21v1u8eXe50EE=
X-Received: by 2002:a05:6214:2607:b0:6d4:19a0:202 with SMTP id
 6a1803df08f44-6f6e47ff9b2mr246701436d6.33.1747052365751; Mon, 12 May 2025
 05:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <Z2ch.1747051947055246176.oktf@lists.openembedded.org>
In-Reply-To: <Z2ch.1747051947055246176.oktf@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 May 2025 14:19:14 +0200
X-Gm-Features: AX0GCFsn_SWT-FBwB7ph2R-uFCdBl7QAE781H4MN8JXItDoH0Bx3OZk7BnpCDXA
Message-ID: <CANNYZj_Fs1-_RHJgojgKPkobKe1eOCK4iwWGSXf+b1kuYr8O=Q@mail.gmail.com>
Subject: Re: [OE-core] Issues enabling systemd template service using WantedBy
 construct (Styhead -> Walnascar)
To: mns@gomspace.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 12:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216365

On Mon, 12 May 2025 at 14:12, Martin Siegumfeldt via
lists.openembedded.org <mns=gomspace.com@lists.openembedded.org>
wrote:

> As mentioned, it appears to be a regression during the styhead -> walnascar development. I notice that the systemctl-native is now built from the systemd sources - is this correct? Should I consequently report this through systemd?

Yes, we've transitioned to using systemd's implementation rather than our own.

It's better if you reproduce and demonstrate this on a classic binary
distro, ideally the same on that upstream is using, and report using
that. Maybe in the process you'll instead find out something is
misconfigured in yocto or your build.

Alex


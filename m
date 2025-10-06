Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74833CCA472
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:59:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.29667.1759741149113638479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 01:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHj3Y/FX;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so58315956d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759741148; x=1760345948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYqVqDMN2cforiB6w941m/0HfToX6F9ajlqXkmgJBC4=;
        b=KHj3Y/FXaAgE8zCzI8/zFMCWGm/3FDl9Wz44iWWCW9Tq4pAJF1TI1Qs2mgCKwqXFhL
         V4v/4o6go0G6cbFm1dEklpXkDVEXbHDSyDXw2djrYtXf/Tt7ikIfcuSawy8B6vy82v0A
         NcmFRtW2InxTqx3UweOQyTplDZ2dL5Y4vU+Uoxct1RzfW7yzm25YK2DhzhK4jk85hZ+o
         AeU2ccV1dgjUY7sZ86w/BZgR7fxIDkbP2ZljLFjow+bgH0j/PsNt17XG7aQMsKguvdeI
         SViVoU+CpZvw4iIN6QSgYuxIUAyUxxKcJ7Z90RmOkCuL6WU7MhCObx2AGyoVwNkmaEkD
         3Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759741148; x=1760345948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYqVqDMN2cforiB6w941m/0HfToX6F9ajlqXkmgJBC4=;
        b=tD9Wa624ffjzalZ1wWHwm1RzvAJcvDdNmlPX5GZhdPVzhoqHT848S40vdhHS+TeRg7
         aHTddfy+BysMYDmwA4TyovxfQ5v5ikFRlP1J5tmjbI1CBQ3I8IXvClGGzneI9k5+PQdB
         kPil78CJAze20ZdCKrgpcaFKf/3mnTKOYHFnRSVksPTgwxMU3O7CVYaJaG0IKgsa9m2Q
         rZ4AnZ6iWgITIQt5vk80g7LBywC0bKQRbO5Kb63UkEvkIR3zaYKFd33UIPb7rvRFvMJk
         gEZzKgVzoZP7LB9gEKw8aasjD8B7/Rtt2zN9gZW3aneEaOJwHOX3d4WJ5I/9JRsKPRlY
         oZ9Q==
X-Gm-Message-State: AOJu0YzXKBS5kqzy8NFyuSdtoZrXEhVyyhD0i1w1VPwo1QxqDNa1jZu/
	xkpFiutKJAcjj52jYvRFtTQhlvMH+/BRhr+t0V725zwWZJlavHu9/Bq7vpxxSe9OtCCQ0soKnnV
	8vtWrnDcvbTzJHBWZwPh5EUgBzLstJ2+FqQ==
X-Gm-Gg: ASbGncu6Mv/zK66AtS1/xAlNRDryQIgpB+G/gFxe1dc/WURYqGitMpwdjuUh1pFgQRi
	Of39GuqMG22GGMCH/rbfgv6nzgCTcpaGFueCj3K931uxSpPqfCNfT5YUVxvMmFIe/gNC37sGarj
	Ujq5gLxl/m37JqytflTOb8amAqCnsjfuTGpI8dRbKl8R+iFll+HrZReSIctRRtCReyb3mOBTHZF
	XzlxcM4DTHkqRePRlwvsI/Vb1xdWdUNAZh/xnpN613P/6ooPbRzMXAq3VhHXpKSerOJ0vIiVH2F
	aMB2gflu83Qy++qIUzTQUHYo3qv3PaPsuTGR37pCegVHnbAFvmBUlv9kpHAnVOxm
X-Google-Smtp-Source: AGHT+IEu/dndzIShrFhpeSMMegaVpQBnTtfz0h8CuIY4Y0FyMAJ53eCR0fjPqS27deU0sXQ8FHgVcBMVAb4+YDMPXcs=
X-Received: by 2002:a05:6214:e66:b0:76f:6972:bb89 with SMTP id
 6a1803df08f44-879dc793f40mr135023906d6.9.1759741148178; Mon, 06 Oct 2025
 01:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150837.39814-1-jon.mason@arm.com>
In-Reply-To: <20251003150837.39814-1-jon.mason@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Oct 2025 10:58:56 +0200
X-Gm-Features: AS18NWDVggoSTiuvOpvs3vE6qCVsU5o5B5NzxB745tSDPbNPGcnYdaMc5B511vY
Message-ID: <CANNYZj9L9T0t_V80WQTjh8oj79defHEEsj0DDM7_Z2dM266fdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] runqemu: remove setting of mem on kernel
 command line for certain systems
To: jon.mason@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224468

On Fri, 3 Oct 2025 at 17:08, Jon Mason via lists.openembedded.org
<jon.mason=arm.com@lists.openembedded.org> wrote:
>
> Some emulated hardware will not boot if mem is set on the kernel command

Please replace 'some' and 'certain' with actual examples, or rewrite
the commit message to remove these vague-on-purpose words altogether.

Alex


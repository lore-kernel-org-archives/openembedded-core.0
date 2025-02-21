Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5337BC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 15:36:35 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.25779.1740152188460710217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 07:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQfk8lBn;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e6864ab228so20492876d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740152187; x=1740756987; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRbOzblf249KRJnmC/wgEy88FRTjxPYCWqoHL6wYvL8=;
        b=nQfk8lBn68CwfHpQfr+vDwHI+8hjj34s0e7Ab4BG9bh4eONK6zD3DHc2Ap4IDGfNlD
         1roSgWfLZ0ft6L6rlfdlsomN4rfbPcdgnLcn03jfnhX/LdgdWeOYKFC2I4zKrBrNJSQN
         rNh4527W7jSYUhu4mSvoUJd3QlUNEy3l7ZtcUDSSbzSiivUKMdkA0vK1ocqib7C1EC8C
         QLkuf/yESX+Yq0af9k6fqwMswM5xm+/t0Z3OCAZ3lPxuwwuW1Bo95stn11lvoeqZLWJr
         odz3n9bHwDc2t1Ipp60tmBaMqkisJfMyMKE6IH/skKDUjFKwC48sIS3Z0GAPAiQB16YG
         PJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740152187; x=1740756987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRbOzblf249KRJnmC/wgEy88FRTjxPYCWqoHL6wYvL8=;
        b=pNceR9opVYv22xJwIUz3it9ijEzuj0noAc21ngdc8bDguj5hRM2R2atBLjpYLJMR72
         CYsJJ6vhy4yeAWD8NsW+ONEDhh3ORVH3GznZ6yqSb4zyJuPTx/6Ivhnkv/FUB+0Y0b54
         Emr/bvIGkMVC7eOSv6s0MH5vLbJTdwfLUJjOTs8SJV67nsu6ODuueF3/u1fpcytdaXIO
         e7IqDLBxT80DCZXqspGShcfYxDZCwwaXPJ1uUxGDMeipgRbgLZcPtXLswZ5fmVZ+9aWc
         VpDHTcQDFxWv5aY6Bv6mSY5c7DdeHt/JnwhXtmPyWpL5trPyWikZwo/wVPGbSBjLcE1f
         3F9Q==
X-Gm-Message-State: AOJu0YwtGyGb5ch238/lEYfuVjplznJ3W8FzcyqLht0gGU3gtVFDmhHI
	FXD7evFQhOPlmyCXeTXZN7L1bOcJzCuliROgMAw8qIr16WsjmTI8g+1vGnWmAopIKnH7+RjdcgD
	zMnUSly6T8Dm+dH8tDP+ebmNIA4s=
X-Gm-Gg: ASbGncuN/piQB6uJVJROH+sBQ+S+cbhw1/77fThj7YDbXbulq28mwHvEGAHNyDxUPu9
	ZucjMeRg4w16YejaMZNi+CcnNKvoM+rqCACKoegeE26Ciwmx8Id0V5tSMFVHVVIwO8/oFHiMT4n
	4MfZGWbkLY5QnHdkQXYuFmp4uOf7Zpd1fz9ekiGdi3pA==
X-Google-Smtp-Source: AGHT+IFHXKvHgBNbx/VRu2K5WK0JGNu89JLfC+a1tDYREbDu9QOY5u9Oiq6We33lOKFCOx90J87KQvmG1ns+FgKXdxE=
X-Received: by 2002:a05:6214:230e:b0:6e6:6caf:e6f5 with SMTP id
 6a1803df08f44-6e6ae7f686cmr45480656d6.13.1740152187450; Fri, 21 Feb 2025
 07:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20250221143811.2072024-1-rob.woolley@windriver.com>
In-Reply-To: <20250221143811.2072024-1-rob.woolley@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Feb 2025 16:36:16 +0100
X-Gm-Features: AWEUYZk215yvURhoCLB_YWlDGDUtG_ghKgYYnlh4YLmIb50XOKmhiCTlFsWzwV0
Message-ID: <CANNYZj-c3Uv51tALMvSy_WPPxHQWikPrW0OOAKsYx7FYhHbEWA@mail.gmail.com>
Subject: Re: [oe] [OE-Core][PATCH 0/2] Backport glvnd support to Kirkstone
To: rob.woolley@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 15:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211808

I don't think this patchset is eligible for a LTS backport. It is not a bugfix.

Alex


On Fri, 21 Feb 2025 at 15:38, Rob Woolley via lists.openembedded.org
<rob.woolley=windriver.com@lists.openembedded.org> wrote:
>
> Applications built with CMake use FindOpenGL.cmake to find suitable OpenGL
> libraries. GLVND is reputed to be "the only way to get OpenGL 3+ functionality
> via EGL in a manner portable across vendors"
>
> The mesa release in Kirkstone already supports glvnd, however it was not
> exposed through the recipe until later Yocto releases.
>
> This backport allows glvnd to be enabled as a PACKAGECONFIG for mesa.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211802): https://lists.openembedded.org/g/openembedded-core/message/211802
> Mute This Topic: https://lists.openembedded.org/mt/111309001/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


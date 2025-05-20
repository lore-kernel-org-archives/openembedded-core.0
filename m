Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC9C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 12:36:02 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.19672.1747744559941458268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 05:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3oj2on0;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so57077966d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747744559; x=1748349359; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+HZ6qqjitVnBDvY5TYH3cdiU3kKTl9iDI4WJV/ODyyY=;
        b=k3oj2on0KVt6CuK+DaC+RzYfW7TtDWJBTUK0z9hVTncS+mkPhLJCdM2EXEKOlUkzYD
         e2qAZWmT1koQ8XdlS9fN/Kq9WVLDdjg05EUeIIyM3yq44xQW1dxkh80RCo9ZRtlkb3GN
         WdR2rcQdPdAjTVEqwBvtC6XtKz9Hwv5aA1qIMhFHIUszY2Cya5eAJAlgT1IeWAIGODql
         9HpgAai2DFjnfWIK/Ym4BNMu3PvJvKV6+DXrNS43zVPbgGxtSWuP/RNcPWPBmrFQTNgL
         wkOvnBYdnQAA86xcA87DwyCGvSzpNHb+1v7rjMJEiOVvodOmcJ4HWNQbZ+zNS7xw9PLF
         BZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744559; x=1748349359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HZ6qqjitVnBDvY5TYH3cdiU3kKTl9iDI4WJV/ODyyY=;
        b=A1fraMSrrekK059hZMRIdNtBm3zMOUnW+InbZ/eD+FguR2zF7UOa4RQpmdHATKnS0R
         T3A4cGtQFsz7V6fzvNGPrOyuhgokAr98XSvxIdiDrVFPRapGtiZ0z7p5lFa/2NrT0vLn
         z1OrbELMbb9w6XDM4ihmfNWifnoZUD0D7T9rSogtvk3Ihg6aQl18sxldZg0UT/IRx6Nb
         u9tiLie1Ow0g00/DaPo7BLTDg2yMWrjLxgm22hVEdfflw+r8oU36l4Fj0ZlseU+irOOy
         GLA/GngLl2mSJIyGBPQN35WrNUsdFgEKzvGzMAit0y5l0dLLQ1CLF5yBsFiVwzOWdbD0
         2dKg==
X-Gm-Message-State: AOJu0YyxUZjYOo+K24n5r/bKPAXwokjq65uhfJqZDop6Z2REzgcsxOwJ
	9zWW4L1h0cGR8EaJ9OzXU4oJX/Pzc1t/fkK/tmHienM0zNYq8VqXKb8hT1BQx3qDMCYr++RT8xH
	HNNXTBrdwN6s6GlhoFGUeLCEDCEEj9Lw=
X-Gm-Gg: ASbGncuc9mh6fTLJ90scnAqTdMBs5KxnWyxlHVKY2vWJh5Qc2PwVprztEdnCwLDA9P3
	qGuGc++TMWISQo4+twbr9/XK7PCjqoMuQzzBud0o2/BSeeikn5hTD20SXJREGE5hs7xvGTod/fN
	wjBypRLAjLTft+n4kpgtdB6jIKj7e4BfIjVQ==
X-Google-Smtp-Source: AGHT+IHJGWgGHPivWRBe5+1rolbc67Zd0JGMfJoGP982Dw+0AXGwVt5d7iYbMm2E0zuLudIMRm76PslipsRHQk6v3Ok=
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id
 6a1803df08f44-6f8d9206bd4mr96782456d6.14.1747744558906; Tue, 20 May 2025
 05:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com> <20250518-clang-toolchain-v1-6-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-6-5be46f8c4af5@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 14:35:48 +0200
X-Gm-Features: AX0GCFu1n87xG4UGrwK1EF6b-sUv8BPHBaK82MU4gJiCA6pSwGUFMTE2vKQhZ7E
Message-ID: <CANNYZj_O-kFBRaEok1WnRQGj4rmXA158jbYzwbVujinNjmavxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/21] rpm: Add openmp dependency when using clang
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216905

On Sun, 18 May 2025 at 23:30, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +DEPENDS:append:toolchain-clang = " openmp"

One of the other patches sets
TOOLCHAIN:pn-rpm = "gcc"
so this has no effect?

Alex


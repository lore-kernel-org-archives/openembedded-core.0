Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4139AC35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:01:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.36541.1741784464964531382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E7uR+GHT;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso180004666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784463; x=1742389263; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9BBQ65L63mTR8AU5Pj40Qr9qFNVQDwnsdWaMN02AO8=;
        b=E7uR+GHTIUkIuOKON7ni0IIwP7opY+m9+Uis+PkUlewchiUUSNfY07SHZQWlGfukVZ
         XOJL7bYmGbjy89RKvpB+ZNddG8lNrfwEstaIIMqtfhA2NuzjU46sAkHkDhg3BxDbl9h9
         JP4H2FbRAodg8MsE8nFr3pziT3kxjcseh5QhWuAK32rZ1PD2va9gWxr8x9I4AxbNdKEu
         F34mQtEcbMyx6dkHNF4nmj6xKWCl02wthxlHavhsbBk6M0FDCbLtW2XoQpndkZ6wSoJJ
         OYLZytIfuz5KdhWVQblC7EvtMCg90frbppsLb/1oPYYjfbfEmc/0xXzVkC4fN3l7KZse
         MA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784463; x=1742389263;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9BBQ65L63mTR8AU5Pj40Qr9qFNVQDwnsdWaMN02AO8=;
        b=Wy8gqNoGHb4xISkB7fgBtgWDsoHZjRv+FztmcmUfD79pxrZpcySezsEulqht0pO1Ay
         tM0RHTFFEhVGj/8icVQ/eZWWj2cPvhOqNZ53fTBAZooWHwMF6GCRxtepveSlsoIrwQuN
         Kph64ps8KwEJnkzYGKN9qY2rbeDZINP9d4nb1xu91YNVtbOknxCLHEFHr38aslKJdZ/g
         LfutQmNrFo+98CAUaOM/MpsKVqgySFOBGx+qMqNUNrl91Fs85WZt+y225AHXPFtTLAHJ
         xMcRhyQdizleZ+0lPrnZeSZyE9BLiOfoeinYJt3VAEs+4XS1uWQsoXdXhbbqRwbjMLuc
         2iUQ==
X-Gm-Message-State: AOJu0YwDYiYRD8qfs6r+MiupY8h/uWhLb3Uxn2x/Xm9h+p7Bv5PkTetc
	AYJ0oEJYnEjWcMvYnRQzOOhSOJuc9kqQ9vgOPJv5/Od+HCjf/1m8uxjC1qed
X-Gm-Gg: ASbGncuBIGibzQDkmxiIy5vyDJUlQjtvQmWIQe+vyUYQgx1z89+sQVFjxq2oCa9cGgv
	I7pEdgLApormktehuy9fbKUgpmTtVDPTudfaC8GQZ+e2FExa5ux+QC5H27HfofJfFEEtAInFzkE
	m09zEvGeiptCYSQY/ws7EPZuXeeEoje3c3duGpbFren3/BE6j1MOw6eO7F2E3+1TiERzljzcN+K
	8hLFj0yDkMZCZDjo5qbCw1KN8MWmReVT76E/vxwJWrfSWmWjMQbWhAZxw68PbiOgu5z8kRYb37I
	/CG+DZCmbO8GzXhJdmACr8TGlm8S1KVJ1Eayxnf8RKbWPjy63ph13y422XFH6EBvhdzdFAKqzAg
	h0gFkK2pRx5Q=
X-Google-Smtp-Source: AGHT+IHTf2O2rREkgBRLfOL7lqp43zFkUQVc5jXIB24hSRUwK1TPyAYgYyFgaCfvEhvjB8pu3+M5og==
X-Received: by 2002:a17:907:398a:b0:ac2:d1bd:3296 with SMTP id a640c23a62f3a-ac2d1bd39b9mr671089966b.10.1741784462391;
        Wed, 12 Mar 2025 06:01:02 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm1068306266b.155.2025.03.12.06.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:01:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core 0/4] Upgrade kmod 33 -> 34.1
Date: Wed, 12 Mar 2025 13:00:43 +0000
Message-Id: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHyF0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3dKC9KLElFTd7Nz8FF0LI0ujRFMDA+PERCMloJaCotS0zAqwcdG
 xtbUAMSmldF4AAAA=
X-Change-ID: 20250312-upgrade-kmod-8292a5003aa2
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212650

Bring scdoc in from meta-wayland to support generation of the manpages. Convert
to meson from autotools. Clean up usage of kmod in eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (4):
      scdoc: Import from meta-wayland
      scdoc: Upgrade 1.11.2 -> 1.11.3
      kmod: Upgrade 33 -> 34.1
      eudev: Drop --output=... from kmod call in init script

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/recipes-core/udev/eudev/init                  |  3 +-
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb        | 22 +++++++++
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 ------------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch      | 30 ------------
 meta/recipes-kernel/kmod/kmod/run-ptest            |  5 --
 .../kmod/{kmod_33.bb => kmod_34.1.bb}              | 57 +++++++++-------------
 7 files changed, 46 insertions(+), 102 deletions(-)
---
base-commit: 3c808ebd910ae68491109c73e644354f90eb5a13
change-id: 20250312-upgrade-kmod-8292a5003aa2

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>



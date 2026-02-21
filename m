Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07903C61DBC
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:16:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14991.1771650981742855643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPW6NWfa;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48375f10628so16533495e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650980; x=1772255780; darn=lists.openembedded.org;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=CPW6NWfahvi06ZnlmkQhOCR5xX6rZUACoc2zJBm1CavnOgXPdR0wLNs2Xt+cuRbaXs
         ID5ezGPUoDj00Ur9/xDJL9qKQdwurQH+LVrNHiEJ7l4qMantZU879JDQxlibXpedwgr+
         Qr8Z5CBqXuiZ3rMID6k8mndblaFeG5qnpvHcBmfVyTcfwurbr9SLbmQef5UtyCC1ETFp
         8i85klKdT+8Om3kTYQsCqybdaVUGhrOWuVQEjyIkgH2exUIHoZlLg4RxOqnVLEA+X+gU
         sX5yKNmDq20h8BNgffGKKuTfyO/0r49lNczIYjuH0L4WzrW4ebSvtJp+Wnauoi07FKtZ
         cdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650980; x=1772255780;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=BD3lCQa2I7wJlFL/cgL6Wv4EY3BRaIQq3DudQWlB75Ss3ndqO45ob6QnUtlBQWHQLv
         MeBhXD4Xm3YMfIN8fbjF8g6vXkObyS3osBRJbdW0Qgt+g7Azdjer42JdQWKm7M8Andl+
         wgPPeg/GjEmE1MT886LFe06X5hM6q/JqAabvEWyFgpbRYy/ksSd4WVFKbcURQRquCPvp
         2FY6Qzi9eu94QjguIzKPbR5ZA91A40oiZD3eT/TuN5P2xLB6E5AeehVRa3CqYfyg1FPt
         BNkmAIydc7h2xGDnjVFlN2aZeJwRzPFJ2KmB1jXIheSOrXACrZxKXeBREO/DNYx+YUzB
         8vHg==
X-Gm-Message-State: AOJu0YxwjT/gHh6vE6ggW1CFUIGZE/IPcoORyPIlxVxzHl/rL03Kbm6z
	ZoRguiyXZfdujxhvA5uWlWbCKDEqbcceksFTaIa02LfJMMvt/1IoeXxkdHfaRQ==
X-Gm-Gg: AZuq6aJxhUNMCsRf9LM13f/I/cGE2wHYX+aWiuU67uqXdItfOVWWZjURsU5EW2P91Sa
	4Q1UI1LGcgj4iIFKOskt8F754BZIHA8kN1keYoeuaHScKCs+N1j1ZVZdr2V1C1fM1jzZJ+awmao
	URqz3YiPbVJiLK0fqVF7KiqaN0nUFwJOcHKkUjBLxvilQTTzemwnGP7k9NTm8F6JxvRJUW4OmKQ
	MEz1FKaz24XXKTsZ5EqPn64sml20Gysll7745/ldNOty2lsQoWMEMd4OO6guJ9ZwEORmf277wmz
	FamU9oMYzemvxvW+Q8JVExylY9ogRbEYhsa2l86tPdjnC0f+hgj0IhqwurM4MnM9NoeBQFuAfqU
	luTZjYmIcB1zlNRYFTpDILfv/sB0rN5DxwwanTc+K3tu3EpjzB0EIBKriArg21zNqxf6Q6H0WQB
	kaWZBgMLXv4rizJP6p78mcYUgEvym3kAsmJEL4aosZ12eogCQ=
X-Received: by 2002:a05:600c:8206:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483a95f8a84mr33171155e9.31.1771650979811;
        Fri, 20 Feb 2026 21:16:19 -0800 (PST)
Received: from [192.168.1.188] ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4308863sm31834515e9.29.2026.02.20.21.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:16:19 -0800 (PST)
Message-ID: <69993fa3.050a0220.a349a.bc33@mx.google.com>
Date: Fri, 20 Feb 2026 21:16:19 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, jpewhacker@gmail.com, Ross.Burton@arm.com
Subject: Re: [PATCH 00/14] spdx30: SBOM enrichment for PURL, metadata, and compliance
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231599

This series is superseded by the unified v2 submission:

  [PATCH v2 00/18] spdx30: SBOM enrichment, lifecycle scope, and documentation

which consolidates all three separate series into a single series
for easier review. No functional changes from v1.

Please disregard this series.

Stefano


Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A65D3943C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:55:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17636.1775141706806210790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yp7yq9Fo;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso10523165e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141705; x=1775746505; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAMumG2kyHGXTAIwRtNPUoRwobeP/5ISt0+N1txBbAA=;
        b=Yp7yq9Fo9NyV0FN25DV4v2N/kdetd/aj4opzn58TabdatmCGgtiVDJf96z+CyIpHod
         i52PqCaU6k4VRgkzRzPEhCtsg2HxX7uIRV78CPiIVguwhy9v4O1GvFcEV13Itgc7dbST
         65dT4gto4Vk2Qp0amHZ26u5KarsabRJoo/45FACrTJOIX0+nRdbkcTsv8+wiHty4Jk+k
         1t6qygccwLp2xzUrl0AWWMgW0mCKCjwgDlY6rxy5JafFhAWjbCc8EOeBt8D9vWPyqhaf
         3dASHeHZ+QUVGR2BW/tFnUdZhOrKHDD0cos72hREqpDn8uU89j3ub8s3dEEYdevgHmM7
         QB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141705; x=1775746505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAMumG2kyHGXTAIwRtNPUoRwobeP/5ISt0+N1txBbAA=;
        b=iMx/tvVytD/y52eXvnoxP5ghX9fd0Gj/JLWK52xDQ7CpUOasgC8pD58v1tVpGyRnpj
         eQRxhMBoQhe17eTQGEF06Kku8Ymn3vlAKC2QFO8xVgFwS2XmKVz9VPVAlIFchWy+XJ7B
         +CAsNqn9qr5vQQVW0It3KwTJZTJ5105uW+qrzABCMpEHPf3C5zRnA/jDmdlPcUAX/0gc
         2gFEzZzF4Ez682TiYUi0PxZgvV4jK1+dH8RszvXCMlinWZh2x3vAFgqUYMzMNLR3+fJF
         JGtyd1qIz4Em6IWLMN5ji02hzmlmaJ6V/agRhi7Igk0nEICXX5DwaPps/+XJHGT3Um53
         J7vw==
X-Gm-Message-State: AOJu0Ywum6en9wTPHmdpbUvlNVRo/AvHSizWAnz+6KquNOQ3J35UMoaR
	YPDWZ+g4x9xbpMQcFZrmVG3nEVO9GJtXwC3WmQERYxhmg0EzYD3NcY2U
X-Gm-Gg: ATEYQzxvVZ6NTjcPoXiJmJ5HFu4/DC8DtgIDsYXTkfp/8CQezxaFsmwHxN2vGCuq5dF
	R70lT0hRuPuA8YxPr9ZrH3JBAFs894truUZV/vNc4coOfvgV/OexkLRiGFwAianCiAo2LY0iBi1
	gLHVt+z4xb05uCGbUKmsNxjBOpb4cKVFaMJ8ntjI32npPakHkPknSLBOuPjvNxseJDGQla/ZAc4
	j+UhC1h0tPC/6+SL4ur39GvaFeHs3SmVqvguIl+ZuY1/oO6pTjq+pnPejn9J9OfeoC3x9SMbGh9
	4RTJWyzTq6Oru3NvPrrXZ5L96PIbFpWrQfRJvD91gPk77Jtkn71FLcjy26DFrzhpNuUFPLEwnRw
	1lNjJ6QN8jGVDqDV15eL6zZMstY3IJ5a8eAumG5ZbLBzi9cgo4oEEg0GkAv/Ptf08P2SgTPzg9o
	HE7z5aRBX5bBpz9Bn6qPJ5UvgpEElIHg==
X-Received: by 2002:a05:600c:1f11:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4888356dac4mr138677585e9.11.1775141704943;
        Thu, 02 Apr 2026 07:55:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5efb:8aef:32b2:ddfa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7162cesm98841235e9.13.2026.04.02.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:04 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 0/4] Slight code cleanup - remove dead code, fix typos,
 unify patterns
Date: Thu, 02 Apr 2026 16:54:57 +0200
Message-Id: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGDzmkC/x3MTQqAIBBA4avErBPUfqiuEiHmTDUbC60IwrsnL
 d/iey9ECkwRhuKFQDdH3n0OVRbgNutXEoy5QUvdylpqgWTRuB3JWI/m8ryws2dWAvVcKez7rlE
 NZH8EWvj53+OU0gcnZ8E2awAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141702; l=785;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=CIQ9SsqfEmh+4ln+KQMfTFrZpEBovMkr3vDcAJhZvMQ=;
 b=YVS/mxMB8iP5nCoQSKigKeHG6U7cm9fG2xZY8Q4Ce8fENAYINE/m7VkBfKpHZ0nYOZ0NHRgkm
 RRL0UURjrFeC2upS1z7OwLkGCrFIjETsgWjzOTqWp3pn9aUuVlhl6Kr
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234532

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Adam Blank (4):
      lib/packagedata.py: slight improvement to code readability
      package_pkgdata: fix typo to stop calling undefined function
      sstate: remove dead code and unify path operations
      package: update the comment block explaining 'emit_pkgdata'

 meta/classes-global/package.bbclass         | 3 +--
 meta/classes-global/package_pkgdata.bbclass | 4 +---
 meta/classes-global/sstate.bbclass          | 5 ++---
 meta/lib/oe/packagedata.py                  | 3 +--
 4 files changed, 5 insertions(+), 10 deletions(-)
---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260402-dead_code_and_unification-d2b31d998515

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>



Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACB9C35FF9
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 10:24:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7206.1742034286340065974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 03:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbQ4hdwt;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so5551875e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742034285; x=1742639085; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=PbQ4hdwtAVHF25G+0BT9lEEftVEnLc9Y+g158sphCIKhlS12j8q1Mm/90Y3E9aO007
         iqvvsfBHkdbYudJeJV3q2nDGDyqYbYzyPVxjDJQr1psbglgAO8aFjUJ+Ul/fA1+5y5tV
         pO+6TsU7vCsNiW1XxH1B3ibFaywofKkcc5kewP8EBj5ATUBc4fNW5XmH1Qh6/eKYIRSb
         magi8aHRg5xMuhXMbuCGOEvdZJWu83mAUpflt3foH9QwQU+2kA5CSzyR/G/yY0GQ03Pk
         0SzHfgsHuE7iX7t4QrUAHqgXrMHw6X6tHz/LIb3hpUbSIHt0jAagRjK8GSK+ouYt1WFm
         td4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742034285; x=1742639085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=FjEBaXzXWikWHuja2+kchncU+8rF1+MVGyth4G/e5FC4wSI9D/hqq9WZgD0FlhpR69
         Z1R4CQZfsjEeIzZFq6py/81bDvpkKVGwMGm4iJkvAjewPuQ8rs70zHoPtZFsTNw6qGHY
         z6v+jkZevK+ILJfUNAMUtanh0z0DIHmZ2Z9Q6iO3GgqKjDCsrwyumaRkwo/cR+PrGUC0
         pd38ArnKDrc88QEjOcjqJ9TCW1PLaUgWV5qqGaTkzYheq9m9Jm+qKt49oQfIigmlirlp
         ZPE+gsvJ4x7U5xFzpyA8+FFw92wjbZ+g/K/qJHDLXr1mqKVFKUBA6lDBIrPilElisBKC
         w9Gg==
X-Gm-Message-State: AOJu0Yww0fg4ses8mqDTaJKMtqbSQIsqv01TllM6i8jVdzz8jtJ9bgWh
	r07xkz67kBl6uAtT7YKmSwgeMpN7MJW/hKciBTNTe6WveKuq9pQ7+UUZQ5CK
X-Gm-Gg: ASbGnctGLT8CmRm2gN3kEosMRzCSwLpwGum20f5g2e/LMIgLQYh/T/9keTV6E91bYKc
	f5JLUwbDWnUN/9ionxcBqwO+KVZgfcZvNnn/kB3wqax7H0c9KBJcbPb0qwdhtAUwApYKherg0PM
	S/+4p8vbVIiCQLr5C7QQuvCo0wSOJEm9oDAUJTXs5XUYlEg3UDhNxh1ZzSotSwx/b77/MHfDfOQ
	Yvtf6FRTszJRHTsw3pguV0s7wogVblw3isuIo7l+BRuiLphaWe34zLJOhCblUvugubNP1U9tzlw
	zEfEX24c3KBRbBGrSOhLOikI+vnBE9ILziqKLeX1+ypnxlNUa+eFr1vE4sUtK/TB+7KOmQUYZkZ
	0AuCeddr2wN3JYidk9PzYNw==
X-Google-Smtp-Source: AGHT+IHbYLW8kemtYz9anDwg7fxM2K3QEyVCA+K6IRTHyipJOktXBgUDOCNNXi+kK1OJr42bdiA6Ig==
X-Received: by 2002:a05:600c:548e:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43d1ec74ec4mr75440885e9.3.1742034284569;
        Sat, 15 Mar 2025 03:24:44 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm45186145e9.9.2025.03.15.03.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:24:43 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Mar 2025 10:24:42 +0000
Subject: [PATCH OE-Core v4 5/5] eudev: Drop --output=... from kmod call in
 init script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-kmod-v4-5-946682cc4090@gmail.com>
References: <20250315-kmod-v4-0-946682cc4090@gmail.com>
In-Reply-To: <20250315-kmod-v4-0-946682cc4090@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212874

This awkward invocation is no longer required as kmod just uses the stdout file
descriptor, rather than explicitly opening /dev/stdout.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev/init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 477a525b21212ad72d2661e27e1218fca9fee5db..790cd3b9339b6334dbab1feaa65f8948d72c76ea 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -27,8 +27,7 @@ make_static_nodes () {
     [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
     [ -x @KMOD@ ] || return 0
 
-    #output to /proc/self/fd/1 since /dev/stdout not created by udevd yet
-    @KMOD@ static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
+    @KMOD@ static-nodes --format=tmpfiles |
     while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
     case "${TTYPE}" in
     'd')

-- 
2.25.1



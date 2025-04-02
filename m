Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC254C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:02:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.12821.1743609744636455686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGlDTwNs;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so48791235e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609742; x=1744214542; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTBlA0rujo2d1/JWX4r2nEps4Tqww4Tb5Fu8TlJGrKE=;
        b=DGlDTwNsIJ6h/KO9BKybOk1Jq5jGQq5cX9dEk0SEGsgsftDXWtRi5gqQorrFTrc4aZ
         owbz2VySvwiqgGRVVh869DcqyJ7xsijtNSW8opDVoS7jcPg0/t8EBjzPg13Z5OOu2m5h
         rc45VnV/2ABOeQDY+318oLqg21QzZpoTun1cZlq4EMvAlvPw9FALajz/oV07/DyTUIg9
         CPYgmRC9qd1aJabepWigZDxioxMey9RMyKi/md+9yDqfLow4aaZymx1gyL/ru+W404Vy
         Gui+Cy7x9p3CDx0XDU8Fdw74UKd4WU9yLN7Y7ANwtcm+YhDDyYVvFa4e5UxTJjJjjpVz
         8rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609742; x=1744214542;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTBlA0rujo2d1/JWX4r2nEps4Tqww4Tb5Fu8TlJGrKE=;
        b=XVkvMAmi+Unns9MYEFHKW1PuBVVuFVaaKLUFDpOy6wdYz9PdV/2E5Ope9wyLaN6UZz
         fkZ+U8s9QPpVNhuLrld1ZrdJ/iRGyF+qrBdtwWhcepvYvWbBoiQHR/lM3MJLaAoaM9pb
         CxOdZZceh/G5Efcyp2chxk6EhBJEY47FTZMKu4myhYR7mnAg5l+8yBlTZ58nYqsQMJ0b
         Ovb1lMYjgXMpKuH11BLSgl7sfCFcxZNJIvCcZJBBsBL6E8/JZOoVrI0ENele1Rowy+Of
         +Nokffenh8uM+DgxCX9MAnmNNFeyEIVpTwKIhZ7dogNmQg1vaFOhIExW+l9TDyN71tTO
         rVwA==
X-Gm-Message-State: AOJu0Yy5oSTrc79UNZW2rll8ZnpYtkcvC7M9Q4hcY+fIHyNIcsTGlyhz
	wKtOOvL+4fiTq0M/GlQ7kKh2iey/mz5uxAojoJirQugrOEQ1tCK4b2AZNA==
X-Gm-Gg: ASbGncuDA0cF4BSQ7dFZKV8FA5CM+jWZO6ExxIIM1YQOroz8qnVCx9y3Rfx5eNkR1gi
	JPz2dBk38nQUh8WZyC2NzL3EZzJ/pvcVgaQkpnvh9iKNQdJH4WS4aJ5TNA+o8GwE77y3AVHRZSN
	tvtEJYY6q0LMjwqhiUJAOYgrasGWowNxl3KjVU1b/DJhanWjFyEyRd4hk8XRfRV2feI4IQsjT/8
	9LtQGZyq2WfxBOYhmFTAb72hsirCnDo20FAP+LOXi5PKFKolBvPYnjXxUQrGXb+Fyf+V+Q0B55A
	emQ606XhW7hTna/RvKZp7mvwxPJfsV0QrxFOLf0YnKX60SY0azqdosrBLJ9mEMdwWhKzMPpqdov
	QVG+pZjD8Rps=
X-Google-Smtp-Source: AGHT+IFpi3XVNgsIINKhDOv1pJeLMbRfXIpGyaY3qE//TpXdGQkziIfgDsArIkCUa8Pownp9rcnAMw==
X-Received: by 2002:a05:6000:4008:b0:39c:dcc:6451 with SMTP id ffacd0b85a97d-39c297e41dbmr2560376f8f.43.1743609741708;
        Wed, 02 Apr 2025 09:02:21 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm17543565f8f.71.2025.04.02.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:02:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core 0/5] connman: Update for all PACKAGECONFIG options,
 clean up legacy
Date: Wed, 02 Apr 2025 16:02:12 +0000
Message-Id: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVf7WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3eT8vLzcxDxdS/MUE2NjM1NLEyMTJaDqgqLUtMwKsEnRsbW1AIP
 vfzpZAAAA
X-Change-ID: 20250331-connman-97d433659424
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 16:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214280

connman has a legacy style, this patch set adds in all the PACKAGECONFIG
options which the upstream pacakge supports, removes patches which are no
longer required, explicitly supports operation alongside systemd-resolved and
reworks the packaging so that PACKAGECONFIG and explicit package selection for
every VPN is no longer required.

Everything up to the final patch should be backward compatible cleanup of the
existing recipe, with only the final patch reworking the packaging.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (5):
      connman: Merge .inc into .bb
      connman: Delete patches for gold and MIPS binutils fix
      connman: Move ppp from DEPENDS to PACKAGECONFIG
      connman: Add all build options as PACKAGECONFIG
      connman: Rework to avoid splitting into many single binary packages

 meta/recipes-connectivity/connman/connman.inc      | 221 ---------------------
 ...vice-stop-systemd-resolved-when-we-use-co.patch |  26 ---
 ...ange-visibility-to-default-for-debug-symb.patch |  31 ---
 .../connman/connman/no-version-scripts.patch       |  47 -----
 meta/recipes-connectivity/connman/connman_1.44.bb  | 154 +++++++++++++-
 5 files changed, 147 insertions(+), 332 deletions(-)
---
base-commit: 17a75e55017cbf213cf1b63568b4e757240192ff
change-id: 20250331-connman-97d433659424

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>



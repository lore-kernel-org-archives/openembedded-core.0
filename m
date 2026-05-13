Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21511CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:56:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8243.1778680575639285767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZOD10kmK;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso37804925e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778680574; x=1779285374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPCi/ox85HiDIPYah6jDEzOxQLFy4xY6qzztp921x+c=;
        b=ZOD10kmK9dwO/ITrbv2kYavfaiVlCzyMns9e5amyfM2zbVPzTdb9mNP3SJtEu01JFU
         OBauhkVwQjbeO5xKfA//c6U1rVM44QsyQe6LZ1rzn2E/tPfQXNhWbXZVTh8INB8T2zN6
         3lz+nqwDevKrXEfDC8G+Qqe16KdYae/H/q+VqAYEoLyp9EP3fq734739WSue3GPCFnR1
         ikcGD0KAfUmcbqS/A7aA/LZNbUSV5uc0x5jCl36Ic/DkeqPQAIs1pXxOZfJUbAQTvvik
         PAZr8kU9kvNrzCPJs47q2/dWjvUADwuUhnlCMw8x7brgqSbXoYDJbLPMDJ3iN10ZZQQN
         /k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680574; x=1779285374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPCi/ox85HiDIPYah6jDEzOxQLFy4xY6qzztp921x+c=;
        b=GCtqCofByTa/3aS0/i2RGF4/LfNDVngj/wWDRU1K181hLMzV3cqXwAJydv/xHTbEpl
         C2MP279dq08Xf+iJCOZG7xdSygROVT5/72q3ZbG2krPLrGi5IuexohU5iIvJNVs6ipCn
         WuxW+BQVtwTPIYRaz1nSyiImVFqlthTEsn7zDKxYyoSH7xkYvBXIezm8cSra70pa+B7I
         UbVUPb+So+pcIdHj0peyiwQ1wqK9c+vWzV2M7VoAc6DKIjQ7e4sXsAmfLl0+Ih5JFAQg
         3Kg3xj58MJSprZTuW6+rAA6tmP3XVVrXaBaRIPo+pn4ZcREvdyKMdQp9tunFK2dbZjzb
         fzyA==
X-Gm-Message-State: AOJu0YyX533F866HQsKiyXgGtzqb2LhIL0dW9Kaaw8OGNcHU6lSARok8
	BYpoRMzOfPOrRSHfABKM3JTZFOEybXBDOe9WGoSCVEoqUncwH6EUNXJCdje1DQ==
X-Gm-Gg: Acq92OGZpDlF+Um1oVrtOamhddynkDcZRfySsmYWwWPle5+kS3sScpRkfCgNbhoE9N4
	My+4L+pUh0rUssnDq9vRBFAWAjH9gvmkfDXo/SePqJGwNij6UMx9XONprQLEM1LA9EaOKrgQ4vm
	llH+6hj1B5kRkKGQCLnZReEr6Hjj5nTLk4/JGvakrYqluyqRjJB6b7IrV/PKY0jvtgn+yzhSShq
	BF7XoOdB8zFYmT/6K3R3QGDLWHsZ3EppNyx5cPhc1u0bPA81uov+bgXM/9HTEvaA6mQM+S2H9pI
	eFd35OWLTSka2hQNjYorE9TtkrLtc6K0NRlWOrSUKMTakO8ldKES+MFMazVF9HVEuhqJu8YcXKF
	zyPPZf8QzuvsE8opsVdBJe2oGNYJHPFbSrEX/ucT9KKHp1mw471PRWGY5V+ksT25awGMNNBijzv
	poq8uU6g6YNltpK2atKeIOCypbI5G/5yPQWXiXlpYL9xk8DPT/1WReVyNbInsVHqNU/Z1cNSwe1
	wliP7oAUw==
X-Received: by 2002:a05:600c:64c5:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48fce9b5ad2mr46380165e9.4.1778680573824;
        Wed, 13 May 2026 06:56:13 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b308sm89673425e9.10.2026.05.13.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:56:12 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] systemd: update musl specific patch to apply
Date: Wed, 13 May 2026 15:56:06 +0200
Message-ID: <20260513135606.2956544-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236985

From: Martin Jansa <martin.jansa@gmail.com>

It doesn't apply after udev-builtin-path_id.c was also updated by
CVE-2026-40225-01.patch in
https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=fc2d33dbb2d5180b77c10865156db342f9d582da

causing do_patch failure for scarthgap builds with musl:

Hunk #1 FAILED at 39.
1 out of 1 hunk FAILED -- rejects in file src/udev/udev-builtin-net_id.c
patching file src/udev/udev-builtin-path_id.c
patching file src/udev/udev-event.c
patching file src/udev/udev-rules.c
Patch 0003-src-basic-missing.h-check-for-missing-strndupa.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-musl/work/core2-64-oe-linux-musl/systemd/255.21/temp/log.do_patch.215528
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/systemd/systemd_255.21.bb:do_patch) failed with exit code '1'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0003-src-basic-missing.h-check-for-missing-strndupa.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index 715a0c7ec8..41db643258 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -655,10 +655,10 @@ diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
 index 91b40088f4..f528a46b8e 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
-@@ -39,6 +39,7 @@
- #include "strv.h"
+@@ -40,6 +40,7 @@
  #include "strxcpyx.h"
  #include "udev-builtin.h"
+ #include "utf8.h"
 +#include "missing_stdlib.h"
  
  #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)


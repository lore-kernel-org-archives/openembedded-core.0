Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F343D37E33
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:41:05 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10274.1768398064292667755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m94Ny8F+;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so48138435e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768398063; x=1769002863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ3uww3AYk1sp7YdXb9B9dmL9tce9cavE3lsNrPPem0=;
        b=m94Ny8F+XOE70dHdPmFH6aiHGpoJBoGvS37CHcDgLantz8VJnMid3cz9pE+qZZhbkk
         ZvJa3GG06Q6iBJ/1EBYu0IUkSGViwY2/u9/f1vo+q6ZY6EGIJMqcIfL9z7ZykdOZqmuY
         MOEQHF55RZHQ/y2tnAvNUMXsYMkumSKAVV/ykK3ASU2o0lmQ3qT47h44j5BRTGqGw4A1
         zKBJJEb7K/fYvXtUFJE4F1c6mdkALtF4eSgzVksCW72IZ/fesrYbnHvnzIYBEUtRMBdN
         cXSaRZb3PKUgiPFWLLZRZ5f3/VDBu/YBGY62BSgwr3UDmZZ/JU2dnu2fpHqtOCBTsyCQ
         wnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398063; x=1769002863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ3uww3AYk1sp7YdXb9B9dmL9tce9cavE3lsNrPPem0=;
        b=S39xVXivvdrWn/TREpxUn+Fv+Yj6A8UPQcO94nZggQeHV+koXdCQmbkgSHK1ukd1bF
         2WY0pmIXWQe76U1UXTNNRHqDbASRrjSD2CN+IYADxaVotBHH1ZJmwju/dPUKsBvs+B9l
         mpsSbWQIF8CEj8dhoxWsIYsw4Ce+DL//Z7dKEwe9hG60sQSrL1hBh9zqxNltNemAoa88
         0Vczx15KYCBG2YmB38Vjy7hzjRL0QGv9Nxl9iM+ZNwgrMb8U3QNjvpjmH44N0pDntLT/
         7ZH7vOfZxvUJ62Tfy9G/FwClcG9c6S0Wu6pCxE4RnZRUhbZFOPBnsAkKxLGl4kN2jgKx
         FthA==
X-Gm-Message-State: AOJu0Yx/seRIhHOe8gVzLFK1Ya4YS7crrGThd5K8XzUkal+5jprrtK6u
	haNji3RJH3OT9ZoLn9gqXl5ODH2zPcqcWQFbZi0kxkc/dLSGwYnYIoq0pAu1oTqFRTk=
X-Gm-Gg: AY/fxX6A2uQ6T5IlhHzsieMD4C5ohquuNrQEeSRcd5NuEacYzg9lNVgrwWm07OR8JAx
	gah1N2LjuG/O2Mo+aaoSIHixi5AE03VWvnvRyCQGmEN/3l90PRmPCGW+Zn+KBedXp/PWfmVskr+
	SpbXqzklkZWwWbydNLP8z5If2jB+4KUp0g0eDis2KCEOWlP9zFxYejMxahQs/xQX+vCnunGDun0
	aHyTrIeXvEUuaC4yGGfTiIOxSxm4YGyuV9LEHXJUyN9FLtgD1EdgES5trKkFW92w3FsfEmysAhc
	3MWYqpfHsf40/64G7Oi46nxk19x1t0BIjMME/M8kpZDElEe4J8WY30QSa4intWDlDSmOcAWFI/6
	yIGX2XihBIwxrXmYcum3skpzGm7L/Wax7bkevztTG1YflbhTX1LeBmfFpIM3+CjcqFDO88D5YWh
	r0nipoAvKEBp9ST2n5vjsyMphCSZqX/5BmKm7pJ9B9fyZQBNsRwRfTh2VeKg==
X-Received: by 2002:a05:600c:528e:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47ee3318458mr28991235e9.8.1768398062487;
        Wed, 14 Jan 2026 05:41:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm28101855e9.6.2026.01.14.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:41:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] rust-target-config.bbclass: add RUST_TARGET_ABI to sstate signature exclusions
Date: Wed, 14 Jan 2026 14:40:58 +0100
Message-ID: <20260114134059.3114851-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229332

From: Alexander Kanavin <alex@linutronix.de>

This was overlooked in
https://lists.openembedded.org/g/openembedded-core/message/218953

and caused non-reusable sstate for rust-native when
the target is one of risc-v machines.

[YOCTO #16132]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 2a06c4ae8b..8e737c1451 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -433,7 +433,7 @@ def rust_gen_target(d, thing, wd, arch):
         json.dump(tspec, f, indent=4)
 
 # These are accounted for in tmpdir path names so don't need to be in the task sig
-rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu"
+rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI"
 
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
-- 
2.47.3



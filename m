Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC70C3ABA7
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:32 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.60792.1745875585252373139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TDDlNHmI;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-308702998fbso4505925a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875585; x=1746480385; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=TDDlNHmIgZ8iTajks8Yy8QYlqjJfrbonWbSjtxUvZN6RS5DrQo+HJQ49C07KWD/Dkn
         SQm8kjPqXIhclrRSuMVTFspa0ElpOJn7vwws6uC/vLyoFoonBy7oRo55bWNdHXT76foE
         WWFJ9rkkTRQCzMmK/GkH3RaEWFsRnbBvBE/yq0fXyNS1e1yVlqPPGXOJGODvaE+nq8aD
         lt+1fLO5SkR7fI5ezFwc7nrE15cDdrbzZvLgVDzBGJCbbLM72IwX3hwSmHTMuH0yT/Ps
         GUOicKv1SIND1oPZJh9HtHNPxvWuUrpnPPv1STNfRmCCDVcRZ/RzGsB4pzWGCDMcySMo
         hJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875585; x=1746480385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=YRn1FiqNUWcicm2NUcBGHkaqLDMXXjkaJjP7ep8G4Ty6f59fuCmAKhpJQS8pEfxxg2
         j8cj3aqyQeNbmAz+lrxivqfakug1q85cB1vElyzyW2fhAXWfeFBSq5agF9taj9YiyacS
         dCMFaPq0q2stGEwFLYuip84rupI36JeOXhcNLiVabgUq/+6U9stGjazOVb4oVzuAC3rb
         +wquy4Bc57SZjMrXAwz0Q+NTcfrLeAkKmBv/tM/DD9U20a1hBn8ClThWhnAANjf1G/VF
         WAZpFRz6a5aY6d2zhFV06b77EFY8+qnm34uDaXQNuAZ8TiYAd+K9H+XQk7jkJvVExa7t
         UqRg==
X-Gm-Message-State: AOJu0YzRfOIYv/v8thXaCOpY/QiPFDpdqmg5qWPOse8oACmhp9PHOhJo
	/XyZBccjBfD8Shp2gy8/xAhL30AU0LDC/vfX8Z2+frMcfveje4vZ
X-Gm-Gg: ASbGncsMjFOSiHTsO4cW1iW87sHf4AcwYLFF3/0tjAtXT4lATi1xRun5h6dn9xPKVxq
	iDXYww3gPWBgprr+C6XB+7INk/OW4buhECuvYKxIIH9Z7j4sVhUMGpaHDg6F3BZJoiQjoWk7+KH
	VrxoHUJc3QifqSrf5QQdmC4ll5Bq1rnG2foed+PJ+qrkKVB1rxGrdvgAiOv66JwjPtJqUOEdhrM
	AQNaTEfEmBaqYXC4+uxfZwTJCImNZRhRstgV33JohCrx81guCwFJjnbufnG2zx8PQI8kTa8q3F2
	AKYVpwc4dEmRL4pXHtUwyEaU9PzWEtZBP/v49xBiT3k=
X-Google-Smtp-Source: AGHT+IHhgQxobdJUJ8FQRnev70dJG/g9hQt+gFi074rtlZx3YlCLI8SJD6oURYXU53LFse0bPAH9/w==
X-Received: by 2002:a17:90b:2f10:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-30a0102977fmr17246683a91.0.1745875584692;
        Mon, 28 Apr 2025 14:26:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:20 -0700
Subject: [PATCH v5 05/10] kernel-arch.bbclass: Do not use weak assignment
 for TOOLCHAIN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-5-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215639

If a distro sets TOOLCHAIN with ?= or = then it overrides this
too, however, we demand GCC to be in there due to KERNEL_CC etal
Make it hard assignment, it can still be overturned via a bbappend
in that case it is intentional to use non-gcc compiler for kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 749a266ea36c04fea34fd60d4b93d340db998936..7aea9cd3e8e3329412ddee07e2f3d43a7722ad5e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -81,4 +81,4 @@ KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP = "${HOST_PREFIX}strip"
-TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "gcc"

-- 
2.49.0



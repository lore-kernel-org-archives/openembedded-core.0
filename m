Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8781C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:37:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.537.1747262241195093755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 15:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CbvLUQqW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso293752e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747262239; x=1747867039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5x1EhQDhJad0++jJ44aC5dFDbX3BCoUnJh8fuIk9zpI=;
        b=CbvLUQqWQvwE1dl83dNAlPjY3qnT6WPuwtbEALG9bFEnfBJnJC1kpPX6IexCUDYm9z
         V0bI9nIH9WavGdjC7iDh4cDvo9DEXUlbPg8qTBStcq+ZOXsuVw6ja+Aen7LcIpiMJMAb
         9U08jTG8nYLOEw5E+feHYuV92Txm+/m6TrrcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747262239; x=1747867039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5x1EhQDhJad0++jJ44aC5dFDbX3BCoUnJh8fuIk9zpI=;
        b=Jp30ZWULwrA8NlxcBMWQTmUWj7bFSQoKIdp80k/ltGBhjqpWwDIdanHRZVwCHHEH5K
         ohYZvOMx/9F7dfRf0PizojewjAicDQZnGT912jkZGzM9L/DmK2HiEuoICYH13oavtE/L
         fFyrQJHFX9jo70cdxfvjzxsE2KrxgRT/0b45G/2B8K3Kee2t7uuyS7mNZ4ngrr3qn2YZ
         9gOQGO2VCTBZlXxoq3XHOyqRU0XgdtB5488Jmakdo4c+tvYgf/CwEP/vQBAcp95MOFob
         l9DOwBT5UKgq7EwdrwAbJUqWadiJHUOIZNVOtOE77ykgylypXu6H9UGiCyb11ndry4RC
         ouBA==
X-Gm-Message-State: AOJu0YyVMre5RSy2cIUdkIhqlCqCYcCoGmLaccjR934u64z/MsM1HCYO
	z+KNh+fSyf3OPY4aSy+jIptkEczmGs3RQXABgTMYaUHH+xDipP1E3WTI15WOUEj/hoSJcXoUg65
	c
X-Gm-Gg: ASbGncutNdozoKuZZagGZXPhXFbGLV8xOgu1/BpgSnFzMuPwVKQUbAc54AXZjPRqRcJ
	I3LA4qIeNq2fOb5xYSgDYJYXs1ofAL/RpC5mS7OzW3jNwtZeq9QO2ThITUUfFsl1ppmdJpkzMwL
	zX7xhp+xMi5xvVgZjuuDHfCPn9ZNXlaPJNqGWtkF74y+AjS8JNIG7l4AxqjIYaazWH9CTLVih1z
	FqvU3iPXEOM+dJx2lfTIg4EMaTiAEesxT96C85RbMWxMOz+Hkh44RvakQEme/BZwnj6dwLyFB9z
	KirU1/8TGj4ut2h0yukQ4T0qhvCMv3oS9c2grWP8Sqe0nfVRHys1LiYxCG7ZHQw+dHNBFwT0BGU
	SYJXb
X-Google-Smtp-Source: AGHT+IF+kJWzDmXs8xHwBvUIC3zkC/0ye4QmLfxtsQvPfxb6+gqIyzEQ34jK3WzWv0vuwXdyOrZMVg==
X-Received: by 2002:a05:600c:1c14:b0:442:dc6e:b9a6 with SMTP id 5b1f17b1804b1-442f210f6b6mr49624095e9.17.1747260475733;
        Wed, 14 May 2025 15:07:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef87asm43815885e9.36.2025.05.14.15.07.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:07:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ptest-packagelists: Add riscv64 exclusions so we can add testing
Date: Wed, 14 May 2025 23:07:52 +0100
Message-ID: <20250514220752.1571017-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250514220752.1571017-1-richard.purdie@linuxfoundation.org>
References: <20250514220752.1571017-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 22:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216555

Add failing tests to the list of broken tests for riscv64 so we can
then start running the working tests and spot regressions.

We can them aim to remove these over time as they start working.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3658dd2adb0..7a0eb8266dc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -135,6 +135,10 @@ PTESTS_SLOW:remove:riscv32 = "lttng-tools strace "
 PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
+# These tests don't yet pass for riscv64
+PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
+PTESTS_PROBLEMS:append:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
+
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design


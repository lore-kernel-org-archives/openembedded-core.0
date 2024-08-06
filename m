Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F26BC52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.15308.1722970565973902111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IP5adVXj;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1e1f6a924so56112985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970565; x=1723575365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtSHZwsKKa4DHqo0GqwsFkCGXBFbZKiiZe+75X6z9Bo=;
        b=IP5adVXjBNpnX48YHMipYfWIIAsb3CnviHEowxWPbSQP7sT7H+SvIs3ghSLr6OgOuv
         FTheejSWn1OQtCIvgU+xAcOBdBKkYgVzz2qSbKhSW2t2CCL+YhLLxpizyrBuHzVQoTLS
         XZZqnRTXeq1YX/1gc4seruXmGAITbBim656tIQk3OO+EhYeBDefbxdbNTEJ3adBbVL3B
         oEhx9MQLOTiFzacc7a7tCAWSkb3GRDhGCbLMj+WZPAnRPYxH5izi1qRTZl6AiBEfAesB
         n7VZnpA1drjr4rNt+zKK14BK2rFX5d55CcFtqVN0SbVtwl/Wj1fpgjglvWpSVm1Q6Qsg
         w8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970565; x=1723575365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtSHZwsKKa4DHqo0GqwsFkCGXBFbZKiiZe+75X6z9Bo=;
        b=JncBeiAUO1xAXoCm82GcWdzsNUb8mn/N2W3ZyWdqVDWypUH9Okm6I02JdnQFBhyKM0
         rRhaoRTuOiGLQLgV1M3SgX54v8/ZhxDJYEzHEmC8tBEfDmCdw1ENVrQx69g+1JKj4/08
         TPkSgZUwvRDnGm7tKhm1Y0PeVVhbITIjjhLVo4OoC6aZm09ITt4qj98L+nbaL7/e8Yjm
         ZywYd6m249snSGwIWK6YxEOA39RMkwqW+Od326yw48UdnWuJXPmie+po9q07AlUuCzKm
         PGKw6KsnIh8VqO0/M55sd3uZF65Wes83zIqEpQzbd6sQSpXR5gRKNZ/FacNv2ioYW3MX
         3bIQ==
X-Gm-Message-State: AOJu0YzHs3RARBf37dWpQ7YKcPY4zSmLCnMot9DfXuOFxXl49Wg0VN2w
	5RPyfkrFgs9Sc4eOO7fVuVXplkbnCcIkaxjiICZ+wZfRxaSjD22fFhvECFmK
X-Google-Smtp-Source: AGHT+IHDc/1vyfAI0uGZWVF6zjuaQRSxKE/+haIPBuG257UouKQcteLLM3Rsi2aM1EyfTmJ41ffgQw==
X-Received: by 2002:a05:620a:4409:b0:79e:fcb5:55e2 with SMTP id af79cd13be357-7a34eeb9603mr1946342285a.5.1722970564749;
        Tue, 06 Aug 2024 11:56:04 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] oeqa/runtime/parselogs: mips: skip sysctl warning
Date: Tue,  6 Aug 2024 14:55:52 -0400
Message-Id: <671bd985812d894532fb4f5d8fa0b24683c7405f.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203045

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream has shuffled the sysctl registration via the commit:

   commit d4ae80ffa64f87b9c355692b680b603add084e96
   Author: Zhen Ni <nizhen@uniontech.com>
   Date:   Tue Feb 15 19:46:03 2022 +0800

       sched: Move cfs_bandwidth_slice sysctls to fair.c

       move cfs_bandwidth_slice sysctls to fair.c and use the
       new register_sysctl_init() to register the sysctl interface.

       Signed-off-by: Zhen Ni <nizhen@uniontech.com>
       Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

The way that we have to configure our mips qemu platforms
results in an empty sysctl table registration and the following
harmless warnings:

  "failed when register_sysctl_sz sched_fair_sysctls to kernel"
  "failed when register_sysctl_sz sched_core_sysctls to kernel"

Adding them to our list of acceptable dmesg warnings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
index 2c0bd9a247..9c2677c4cf 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
@@ -1,2 +1,8 @@
 # These should be reviewed to see if they are still needed
 cacheinfo: Failed to find cpu0 device node
+
+# 6.10 restructures sysctl registration such that mips
+# registers an empty table and generates harmless warnings:
+#   failed when register_sysctl_sz sched_fair_sysctls to kernel
+#   failed when register_sysctl_sz sched_core_sysctls to kernel
+failed when register_sysctl_sz sched
-- 
2.39.2



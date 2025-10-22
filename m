Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86106CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:08:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1798.1761109696271218506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELpdrRlV;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so5939694b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761109695; x=1761714495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIbn9NAlzLq15g8BQBMDC9GecdI1haRw+USMfuJvPtQ=;
        b=ELpdrRlVx5BXdLEGqXNiGDzqwaokK6gOjV7KWmrAm5pfgc6e+aOWhZ6eFSOcPxN3/5
         Z9aldJu1SYtxeg627zco8AIdXl1u6ilhAs4RqAQZ0Xan4qzc807FTO/VA8Y/yQ7BZced
         Ku4g7pmEQX5FSkeDmWpbV9xC70j2Mc4Cb8LLGVeVi511VkdxLSDYoEGjcx8u+5KfhjOv
         E83VQQzXp2dYPFZqcFXHpJKiHeke+YNEi/AMcKiRzJ7F276Smw/6Z7QzKabtAcc86m+u
         FSa/ym2NFkteqjnf4rR/1KkmdQKxfjL/1lezYI2uNdhQw8kBBmK5+FYAaJOffUN7WRie
         qJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109695; x=1761714495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIbn9NAlzLq15g8BQBMDC9GecdI1haRw+USMfuJvPtQ=;
        b=nOpxIJkenyGnsZ1K9GNw24w+O16u61hsSsEko6jy/iGuzdCQkeEP10JDQGWCQeNan6
         m3Yic0vtjlVs/TuKH+ht07zIZdIyBSuTGv4LZ8NRpWXkxZ/MwqFR6Tx4/ACM7x+RyzK+
         9jAM0zbEAEcfiuwB9mKncN3jn+bSFHZOj+BfcGHNNERXSzzJQ7GOpTzLkk1pq+GcPXhm
         gpbQQJUoBRThsl+UJI6UfVyvCefy+1iX73SBrluerW84IgzE0AcCtPT/e6gxqUBqM5K3
         0entZ7z+CEjh8XDZcXFT3MGqdgvYpK5tKfwUaSIz7z7LC/BLhx9cOSegARA26wRtkrbw
         HTfg==
X-Gm-Message-State: AOJu0YxXuUmiR4FKQC2FBaCNSseQMrLm32MeU3ttl4ALWrfXJ1loRV9P
	c+nALkNHp22quX8wHQDJRg33qJ8xj6CqKaBYe4xeu03jK09pDiqbqMIfqifM23Y6
X-Gm-Gg: ASbGncunvji8kVaIn1X99ZthKS8DTXiTdMeVwpq3tJBmB85IPmKbccMHX3ggHFsjVjy
	OZS+4zjN4h3BVjtRnvuxoHna1Q3vU7oIDLACPuaToMq81LtB/bKhF2aU0CPLJ/JfkyKpZ4xceoN
	GsEVUcTNxE0Y7EwWjo45Zke67uIDVkBD0ID/0fI7cRQHzF6JPy7F+aj7T4NDAR4tBoJKrqEBT+6
	dAkkoU6RddGyRJ7ZATZO0OOwJPIVkHPo6N8kKoFB5IPnWxsfQA7x7kKcDE3rqBadpxk0OzIgadR
	pcYWv0WUPScv4qc2AI+lDN/x07VC1JulvoVIXAQn4UbrRlSLkVe/MX7SCntk4qwuvIY0mj3fvvU
	nOkmY3jpYHoOpDlT3sYfXrFkiL4DzLQiaEiinT1NXmAuHmLHZmsUItbqnqJeQgYe7vmttKgCYE0
	jOkkXQd7U9yn+EhaK9VtyU70j6/3sgKs4ZmR6/Vme8HA86BqWf0Q23D/xXrqTV0eJkkmvigACP
X-Google-Smtp-Source: AGHT+IGvNm21Q3Nt6hyIDzeYg4r/eKRneFtksUxviasO2HK2cTfuXq2jnzTXZ8SXmPg2kPIGjhRn+A==
X-Received: by 2002:a05:6a20:7344:b0:2b4:41d9:b068 with SMTP id adf61e73a8af0-334a85ef540mr24212959637.37.1761109695334;
        Tue, 21 Oct 2025 22:08:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13328563b3a.6.2025.10.21.22.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:08:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] pseudo: Pin native compiler to gcc as well
Date: Tue, 21 Oct 2025 22:08:08 -0700
Message-ID: <20251022050810.1572184-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251022050810.1572184-1-raj.khem@gmail.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225173

pseudo does not build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e10abd126bf..c18318bd538 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -31,3 +31,4 @@ COMPATIBLE_HOST:libc-musl = 'null'
 #| ./ports/linux/pseudo_wrappers.c:80:57: error: use of unknown builtin '__builtin_apply_args' [-Wimplicit-function-declaration]
 #|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
 TOOLCHAIN = "gcc"
+TOOLCHAIN_NATIVE = "gcc"


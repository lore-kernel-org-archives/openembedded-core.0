Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA32C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.882.1783881802942755292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=AikGS5aT;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664c535f1a0so4219970d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881802; x=1784486602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=AikGS5aTRlJpcWMZxiB0v7Xz+4PD+FBObktFdwyf6EBiA9IENF+QgLAKJhJAVODEVc
         AmrswnSyPzsRZ18i89arMB9G6oUaH3u6zZXQ5zMR86vnsQXrdJjLg8T7NFfHJ1xpdy+s
         vi/OlvYGVrtXkEhGRNpaI7SPzJFR1chlu40VzYUHBsU/z9VaLCFDiDSHgEGzj3/lw8JL
         odm6UviH3U/T5FNJmqLzItk/bJrgXhQo18zvGJbXcwbqj8AwjmrYP/LiojXdxCy17ogN
         rPpXI6lqbPKxShe17Cjpql/zxxUle+MPSnBNdqTKb/eyDF60xRNTn6LI6Sw3AxPDVPos
         qEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881802; x=1784486602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=TKzur3/XX3QCEkFCvQxY2CtGtVwF0tUhyN6oaDqDLCujtv1zlWx1tInfJO4ww4FKk5
         W6iNgobiSMGch2Y860CinX9atW0yhssubV9NjJRTQQZ3gukrQsV4afsmuLan83TmWoIG
         F9h9QF8k3UEe3yv/BaLv53TydwSvEHzdtMpvHoAKSsBAN0ybbdo13dW2MXdL8fZhZr+J
         I3QaEz1fbBJgRSdkcJM90j/fjNXEDskoA9TZMURZ6yWhg1t8N14AUlWs4rp3T1Pwpq+v
         +aspx73dnIUQ2vMSs7TgVrBZJJ/cn0MPopKNcTu1rVn+XgyzzrT4q8yHC/V06zRYnNjj
         H5UA==
X-Gm-Message-State: AOJu0YyufX9Eb65n4LB+X67yBIwJbfaQr0GgD+aXeXKWaUHsZ+LLWsAD
	QTrhH0xG7VLckJVFyiyx4h+6QyVmf4SWf7ZVoHMIzLyL4oPkHOfbDi6gVG/eimUyMHo3vJ0It0q
	gP1/YMOc=
X-Gm-Gg: AfdE7cl5KWB9hdgj1UnHVoyvzJgn299LX5QKM2PCku0xwUlya3tNYtyRAxDVLDxj4xb
	cJl/kXaxgzupu7GWfvigayu/edIyTR7vJlu8+P9KZdyCNzJ0WURprgvmMSqg8FP80G1FTRoRgPY
	YMtbQncpgrcg5g8HS5+lhX0qOdPE6nxoyZosYX+SR2E6g1bJcDVgZ/Vu5qf2oS80K2Eax4pklPl
	xH6ot8JRWmHAQXzHHjDmqTGX3kYDtZ7wQIpX8aIwuNlJuZfICJS82QdfZ/5nNIGHONekmPGCPbE
	H9jMLWty0hUfaJJp82scpjvAT+RI1uJVA73qPKG6Bd7/CmJGdbBKzHElGzkaoOjBy5rIQCiCx52
	KAUjDXutr8snyYqcr6CeMErIi0/7v8gjdOEwmPkGyt4L+2WfByePq6p2mi3dvSmzi0ZWK574Rth
	Wo+oElwavYD5o2Y7asC9kA0Uox
X-Received: by 2002:a53:c24e:0:b0:667:ca07:85ae with SMTP id 956f58d0204a3-667d7c426e6mr3722396d50.52.1783881802057;
        Sun, 12 Jul 2026 11:43:22 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:21 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 05/27] core-image-kernel-dev: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:45 -0400
Message-ID: <20260712184307.3259642-5-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240795

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 4018af7a3a..708bd6bc1f 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -6,7 +6,7 @@ require recipes-core/images/core-image-minimal.bb
 
 KERNEL_DEV_UTILS ?= "dropbear connman"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
-KERNEL_DEV_MODULE ?= "kernel-modules"
+KERNEL_DEV_MODULE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
                              ${KERNEL_DEV_UTILS} \
-- 
2.43.0



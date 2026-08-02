Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B9FC55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21186.1785666555660452555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d11isjZ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so10840645e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666554; x=1786271354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SHxMP1IylgVK87GfnxRqqY2fqlHeYJRHio0Tb+Egzis=;
        b=d11isjZ/JHt9CIUGCKXcnN28pga7sCwDqRj9Q7Tfiuh3lgB6tASCksakJllKfkPFGt
         +BMZ/mzn/2LT/iezXJ2GzwxVUr3FVYmvNX1+eNPJoGXidwpVFk1u8kvnjjfBShEV723/
         f8D1gfivDeciwT7KX9Qi7tlwMfkBvb94jIAQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666554; x=1786271354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SHxMP1IylgVK87GfnxRqqY2fqlHeYJRHio0Tb+Egzis=;
        b=FQjfOgWC4E9Y+myRuYNXbgKQ7ZnraYr2Wet/c5w4OaaDX4I0KGyq6VtTQLlS7f50rv
         Y26ktiaL6C4jp5b+58LTIOYzrVvigoe2/8gPF06bnUh3Yml/TZASlQLRKbiUAv8oOCCl
         lg7ZOiy4LTK4wsLo2tPJHUU0u6uFJvkpHrBXjTK+Fk6bPAURd/zMC2ANPfjAoRQNbBbX
         kZwAwiNE4zKMwWGyChjSl2MjJG5HHson4KQycCciVczPKLpnzqMn7/TK/vZCLqcj0Lub
         pX+KzTfcv3m9Vs9idf0lHWkO59MZYMPUgP6jxMAZPFg0oMqQi2k3b7EdKEH9HiWlimgu
         q9bA==
X-Gm-Message-State: AOJu0Yx2B/2Euz7dnWaGpZw3bcI1l/PIRBqat4yvaknjbFpwPwg9yeMw
	/LovmWguLF7YH0y8t4kGije/JFs7SUnZ+X+OpTI2xRlAObBLEsr5gAxK7WKNW9Qkyr6TGmHbGyG
	PKwI5gjw=
X-Gm-Gg: AR+sD10No5evUNcKI/HTpGHmBq6EpkFUTtRu1oqiyxxNdlluTJ9Y0ZTY6aQIzH268jx
	FokKaHousAD95Cd2Te+kpLjIVSDgoqZh+Fvxx+uuP+ISeDPQfxeGZv9iGOlB1OziypwuZSIH6lC
	59GPi3u5M/ZUrR/YZOwFcmZTP0Cwu9OG9NNv0eZ57C/xlycbaDQQqx2SshH8820ZfdppW+fwIwu
	ChhqyEPRahIsVHVeiW0at37bvc9IiJyWp657TwCjwshFaNdvZay8GqSGH665X4AJvhtsHUYk8vD
	REqL0MQ7em+iP6y0C5izXK9shnyTgZOOrbfXmMiIHDgjj6tEpExjTlZMLtiXw1OKajEuG+FhMhy
	m9vew6bPAdaucGSXdIKniijFyxbxTSjp3+TEFkPBEFK1I2t6Aup/2UsVPG3nAGo7vxE5LH8u1JC
	o9agShzAsAW1AOQjf4ecmIO9h3gqtBJwyluUjSTOtUfGCG5uO71UFg0v6PfOJ0BKXxTxunhpklU
	CwJfpkuOCkL8BwsWw==
X-Received: by 2002:a05:600c:1553:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4980ee7e62amr100343555e9.16.1785666553930;
        Sun, 02 Aug 2026 03:29:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/25] kernel-arch: Drop UBOOT_ARCH
Date: Sun,  2 Aug 2026 11:28:43 +0100
Message-ID: <20260802102854.3952760-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242539

All OE-Core usages are now independent of kernel-arch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index bc90e2e840b..db708c35104 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -8,7 +8,6 @@
 # modules). return value must match one of the architecture directories
 # in the kernel source "arch" directory
 export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
-UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.


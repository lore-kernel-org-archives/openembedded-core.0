Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68E8C46CA3
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.91954.1701080290359636435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rv1XzYXr;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a03a9009572so545038166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080289; x=1701685089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdeIVsqls22jpPteDcz1zC8rhg3/M+O85ZuGsGJaGgQ=;
        b=Rv1XzYXrdc0uX78KbDbCSJVJ90PzwrmIAHL5G7X8J2KMpNZXGBWpRxKYE9MfXbXI2y
         vBGSco0DRQ9QYfrzA2HnC5Elbv9EYFR2+Or2nmTJlzc84cyg2MVFr9M9JrME9SgBNSRR
         VYzWoroLocAGLaMm5jqNw1WUFSZ0jVgnNxha7AzWfIATeHg4Z9Nb/89y7LU7eBpi+SAF
         YARw1ISKXgZvHOW3yCB90lLUHGibHgIUgDt2ISSGugqHxWBaLlc7W9ivQqM1xTlKGhj7
         AZ/cPjCkOn3Y7DVxiGn2o3vOW+gviRK2YHA3XvhNV6Yaqj/I/U6nTLv5oIAxT03aKMmT
         RT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080289; x=1701685089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdeIVsqls22jpPteDcz1zC8rhg3/M+O85ZuGsGJaGgQ=;
        b=cHla35SyZD4+joskM78wyUW73Q6NNuucSo/3+l0X+FPf2z+qDluoSd5Mm6WEWMkpAz
         8nuaGutfeKNiobTQu0Mz+1WP8sEBrlPQOQl8UZVyOFlLDQN1ZG20gggpM4ZwfgQqvEuN
         D/VRwegkKbwVPs5yLfStnFgfMpsxCV+tQ7QUsNOFWnRy6zy6iVHmcAQvm3P0IU9md7Nz
         JSVP8yHbdyAxVMac2FOQ7jxga9+vFjKguTY/8HGd+mnkemMrYswWaAj4MVwTqdNVm5X3
         50Civc2wRTbWV8iBKoW33+Q8MZqN0/c/777V6qac3MOCe9K4o/cXs35g01fe/vB1wxTS
         l11w==
X-Gm-Message-State: AOJu0YwRiQ3NddZI7APYzR4KFKieo7FLBMJY4uMTqLczYPcYuOIaR7nk
	6+h1zp1NjdNIfwuThi5a5851FMlopmg=
X-Google-Smtp-Source: AGHT+IFqVnEyAvnCREPsFUJJz6ipm7/9aD1oN7jYtHZ32jSknKKPpc+TR2XjDcQU9uwTADm/dl6l+g==
X-Received: by 2002:a17:906:9e04:b0:9cf:797b:6adc with SMTP id fp4-20020a1709069e0400b009cf797b6adcmr6690794ejc.33.1701080288751;
        Mon, 27 Nov 2023 02:18:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/19] meson: update 1.2.2 -> 1.3.0
Date: Mon, 27 Nov 2023 11:17:49 +0100
Message-Id: <20231127101751.3187950-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191284

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/{meson_1.2.2.bb => meson_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.2.2.bb => meson_1.3.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.2.2.bb b/meta/recipes-devtools/meson/meson_1.3.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.2.2.bb
rename to meta/recipes-devtools/meson/meson_1.3.0.bb
index c38d88fe61f..e794bb28a52 100644
--- a/meta/recipes-devtools/meson/meson_1.2.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "4a0f04de331fbc7af3b802a844fc8838f4ccd1ded1e792ba4f8f2faf8c5fe4d6"
+SRC_URI[sha256sum] = "4ba253ef60e454e23234696119cbafa082a0aead0bd3bbf6991295054795f5dc"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.39.2



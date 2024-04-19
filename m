Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB7C071DB
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.19250.1713529200464260977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQJvGDln;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d895138ce6so28917171fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529198; x=1714133998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq6qJCK2mhE7an0gjexyU2knH/FO+n623HJuQqvSFGE=;
        b=AQJvGDlnEPJnZrlmulHp5RUQ2NXtbHFnpi4po9mnBWMuQnPPkJ8Q/cWLxt7SkIK8uY
         TsxIJ/dSbohGEI/Y9qmEhwM3omSK31mHUFxHg+gjNjLlMGWbG728bsWDWV65DGT800g0
         11hPO+tAwKslDDhilvdqyw3U9KyRhEm2GKXUuF3va5PShtonjocbrP7czXL93LFifaB0
         yQ3ShS6vILsRIw11iC7rJDXASBKKketiA2S1bPbKBOdNDlyon+nkPO/QzZa9k3nJfaGH
         a5SIfsU9O5uJy2kklqz6usEm3PC/BhiNHL7L9cPJpqNWKCjJMfJfQMTI/OLKC+hIoOXf
         k3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529198; x=1714133998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq6qJCK2mhE7an0gjexyU2knH/FO+n623HJuQqvSFGE=;
        b=fTv6z39X/HuY6NOpaSDxnDStLBzxiIgsgjmNCRL3OxqaN3J6smJcWhGp0aaJr8l+rq
         ViHwvNA04dpRxs8j4H8SWLvpVI4QB3o0yNVPorBUXfqW0kRaP+6IgH8CmBb/FXovziNa
         0sNzxcZbhiwSDpXt7qi3j1gn/VQWRgYqoMMifEU9HeD9+Qn3Ccxsvv2oTzyfyv0g8v5/
         PuIR7PozHVlkg9VknNafV67ucVf1Azf3BEzB5Q5mNz2oJWqCa9fOux/z/Hvp3YI0aM8F
         RS5GaYp4Znh5p7bQsykfkEcuBN5cNsYWuEA3I0P8nD4RwU8hvb7d7jiRmqRzvalwOrEl
         b2kg==
X-Gm-Message-State: AOJu0YzL4C1RyzIv3adVcAl2CLuJ9U0R3j9ttYFlDnwED0SwykpZMGVu
	McvF/FIwn1/ruUykYNi1jm99+BtOyGEeo3dTgXz8gKXmVrF87yR4RUXKCw==
X-Google-Smtp-Source: AGHT+IGIoHIDToQmPuvN+4DK/HGS+Yug6bJ0GYTvfPV+h+lNMZNZEttwgfW+JxfHpjXtZjjls5jMeQ==
X-Received: by 2002:a2e:8206:0:b0:2da:c3a:2546 with SMTP id w6-20020a2e8206000000b002da0c3a2546mr1134596ljg.21.1713529198459;
        Fri, 19 Apr 2024 05:19:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/19] libtraceevent: submit meson.patch upstream
Date: Fri, 19 Apr 2024 14:19:40 +0200
Message-Id: <20240419121945.1920944-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198542

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
index 0c21b2347a1..fb831719cb6 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fixes for the Meson build of libtraceevent:
 - Make the plugin directory the same as the Makefiles
 - Install the plugins as modules not static and versioned shared libraries
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [via email to linux-trace-devel@vger.kernel.org,rostedt@goodmis.org]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  meson.build         | 2 +-
-- 
2.39.2



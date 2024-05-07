Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B7FC25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.4737.1715060011312037859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0m9yyqz;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso1703774a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060010; x=1715664810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTQKkOegOTR7PIVdadtj5g0adjERETMZBj7AlNwqVdU=;
        b=h0m9yyqzzNFLYR+Ihkb25Hoyw/M80d7PVH1glsbOFPeNTW6OwBzT8eKzit/4uWdSiT
         TimXd092lOaTsIMALheYwxDQrcquNdBeromUp8Tpf96Jy3/ECciork9fJtnlNednTDh+
         HNGTHB5GnHWzOnC39HEqPbkzrK0rBL+fXduWBWWmC5yLeIAWjxub9vnshkk7/h4ICPfM
         HYGcsa7iE7HmGCLlFINCidsGIAnaX/QXLwUB2/BZjbw+Wkl6S2ZZ3hzHgm+MzaJTNX6t
         7t/CnsL97FbzN+iFcw/1LD1k8r0F+y0XZiR8CauXLI8imb7YvoR9MEGz0ImRxAQi+2Dp
         erYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060010; x=1715664810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTQKkOegOTR7PIVdadtj5g0adjERETMZBj7AlNwqVdU=;
        b=ZWEfjb302gPj5GqtWVKx89ckfwSLjKU4QYbvdLoUBCK3SWXEr8c9rz0sWvx0dWJ4JZ
         lm1o5fxRshoPsBYUBCamAmHt2ai+EI73RCkthm/t5pZy3VYQXs3UheFY8kD0cngMug3a
         JWoIxpyxWB2J5HQrYRYZFKS4ztOZzfiG51uw5ErLy8kRh1BSBzNlZ1HuICsGpQhw79SH
         iDGe+Ni3lixYAevkpclqkix9heSA3oprSYLV4h7wn097QVy2P6wG/0B3qfJ+A7SeU1KV
         kHy4cMHLTmK1WHYHjgg58RuA935PkP2YkWkMGbezHIeFLjQvFIdR6aiRe6pQiBQCwx6K
         Na6g==
X-Gm-Message-State: AOJu0Yy44fPlalxYKO2MbhePiaNioo5hZ/YNXfd+NvCfLDvLll6rPKCi
	MVFtdICmrQC2j1qnQPvdK1jjnXkZa76pX8X+7Sr7NAYmy/DcRtKeUnCuPTxm
X-Google-Smtp-Source: AGHT+IGNrbpEM5hBvfJ25Fufya7kOiJUz3gShe5VSR7u24NgduFEJIWy7Ch2qlEmmXl9ZanDdiRwYg==
X-Received: by 2002:a05:6a20:734b:b0:1af:5d8e:c6c with SMTP id v11-20020a056a20734b00b001af5d8e0c6cmr13350404pzc.18.1715060010511;
        Mon, 06 May 2024 22:33:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 08/11] consolekit: Disable incompatible-pointer-types warning as error
Date: Mon,  6 May 2024 22:33:19 -0700
Message-ID: <20240507053320.1566814-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199077

Fixes build with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 346bd60e4d7..0f2153d493d 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -31,6 +31,9 @@ PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/s
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="
 
+# Fails to build with GCC14 with incompatible pointer error warning being treated as error
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
-- 
2.45.0



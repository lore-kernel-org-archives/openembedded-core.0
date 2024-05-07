Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D367C25B75
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1092.1715044507800404257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hK6lfNn3;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2321840a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044507; x=1715649307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lyluQrCJia6PaFv7aRiurtL5lDshBuGuIgjc1ynWKw=;
        b=hK6lfNn3k8C7ya0rj3pZybEy0nTB65ABFTCW4EH4uHkumAbNCW7F9V9ORuxWfnz/XP
         en+Ubfkv2pLoeiStX1N0bPeiAcuFDbrraYjCTGzRcS4YCZuackDqmPmcGtlGx4+pX95S
         0o9qpoEOH8GVZcCO5AuAnUKdcDpZld0T0HiNV61yq4DdLhf39lW9tmVGxtFc3XJeJlaG
         IR0WmI4pJ5dC+eFFcwOkmbRQSwk5yY7PK5M0ykKe2k85r3EGaY9sqjV3pVzZEfqpW/Ex
         GBVDneO40uK8SXSlEbelQx3DStrj7bZEGIUilhNKykUMzTNwUL36ycaNsnGls8CS5E3N
         Q15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044507; x=1715649307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lyluQrCJia6PaFv7aRiurtL5lDshBuGuIgjc1ynWKw=;
        b=TOGf28cEE2CCnq2n62TuApQRU/XUa+AscchxyAkf7e/2zAzKYc8al6eUJSOTuLf7AW
         Ntd1FnS9Re0BFWp8A6ssMNZAIYxWnshzOAvnHM8QP+ZAIIfp3GGN/nrXYGYpPRkOlgi2
         IBmWtKL6tGnqVwPY/iTrxcqqNTVOY1wvHSTKpm4ccHszSIweXoJs2upnnhezdAT2i+5F
         +n6aDkDrLtVabOj1YBByuMzawYJDW/4h8W7qkTr7RUF3sStqXIuW+mDCSkA6IYrxbMgO
         Nd7l5Mcd6S63Y4XZ6kV4YfGy/MKpNYuzJVixlu9e4KJgOKqcWjXGZUqbj4PhdoYAIwRc
         mR0w==
X-Gm-Message-State: AOJu0YxLQKTMwiAB1/kZwmahryMz0jz9YqK7IPerAND9nZQpSzBCIuRr
	5CKwPruisHHuqoj8D2sN6TSyF4OSLiklrqkNvfaJDIhfGz26O3ET6JhWxgye
X-Google-Smtp-Source: AGHT+IEWn+0HCSlU+Q3sJ7JCy3aGi87+XAI3IoiBdq8Bqin0j91RWpCAEzXLLJOCHMIfvM5+6J2pOA==
X-Received: by 2002:a05:6a20:ce4c:b0:1ae:100f:8a93 with SMTP id id12-20020a056a20ce4c00b001ae100f8a93mr14764219pzb.12.1715044506600;
        Mon, 06 May 2024 18:15:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/10] gtk4: Disable int-conversion warning as error
Date: Mon,  6 May 2024 18:14:54 -0700
Message-ID: <20240507011455.313230-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199056

This helps builds on 32bit machines when using GCC-14
there is a bug filed for fixing this in code [1]

[1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk4_4.14.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
index 282e81f0482..39483357b4a 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
@@ -76,6 +76,10 @@ PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled
 PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker,tracker-miners"
 PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled, vulkan-loader vulkan-headers shaderc-native"
 
+# Disable int-conversion warning as error until [1] is fixed
+# [1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
+CFLAGS:append = " -Wno-error=int-conversion"
+
 LIBV = "4.0.0"
 
 FILES:${PN}:append = " \
-- 
2.45.0



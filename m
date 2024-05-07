Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD91C41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:32 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4771.1715060012492791949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlbfPI7t;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eab16dcfd8so18679105ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060012; x=1715664812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lyluQrCJia6PaFv7aRiurtL5lDshBuGuIgjc1ynWKw=;
        b=HlbfPI7tRmWyKkH+OG+9IvAjW/nQnFvArovykXvF/fImWPSvLOrZDDx9JEdnu4poQv
         p0zPnE/OG5FPgwzp5t17buUHJOrvFb7EJmHvNZ4pUtErKt1bJb0u2o1ScvwNk6hajQa4
         ozAEfEPpVcpUjPRhmNSrPYvKyOVvI7mz4dMWxYi2VuTe9/4prmU6FEKR/UfXlyleRda3
         1BHVKI+//i8h+l6J9OSf7mmNWobJICO9blcIxxbOHdfHahMog3YwvpMUkGQJpP+Goc2S
         yaYMfkuJLBgcstAQg7BBNeZkykn9R/I4+sWjKQ3tglFN/VYP5wllaZM2844SKUnyY04k
         L69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060012; x=1715664812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lyluQrCJia6PaFv7aRiurtL5lDshBuGuIgjc1ynWKw=;
        b=SDCgmX0U/hWxL/smxoHI+ZJ1QHBbsPm+D3lO/lCT3SOr5ZQd/IxNQNshOhYFkPmWY4
         S84zbPxWqQyMjcEka8BTL6aYFaZ3ipwyT/Pti56cpc6KMqxVdIqB9orDknDl/uk53N8a
         SOdVATSb/VJG+EY72n1SRqW8wOwc8OHjLoMW22ry/DBYeDRPvMxjE21fXs5YaVCEErOM
         KfuR+efsnfEsP+GAuaeFWee/SDGjnwwJSTOG0y1wk8bd0Un17DkFJUecJANoKAfo7F2c
         o/sXk8cSuDQ6yn3tqh7GynL9BcXP4Wh6z2oH+AwGKLU0RDwb+ZzMCKjoKDPFsZINBKPa
         D2kw==
X-Gm-Message-State: AOJu0YzyU+Gn+YDBOtAQDJknzthi/ds65o3/WMwHtHaJmSVgF8KJk7WD
	6Zd+Ocz7JXtkoR0MNJjQ3di6KzE3pIIvMnZxnlvAA1CxwhNWyM1pqxjyFPsX
X-Google-Smtp-Source: AGHT+IHmrMSGmjnNaaofh70zimAo2Dsf8IXo5EoBO6PctmTsvUcqqWkww7FzBjSi1i7/lfBih28Wvg==
X-Received: by 2002:a17:902:cf06:b0:1ed:6cfa:86ff with SMTP id i6-20020a170902cf0600b001ed6cfa86ffmr11154887plg.63.1715060011780;
        Mon, 06 May 2024 22:33:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 09/11] gtk4: Disable int-conversion warning as error
Date: Mon,  6 May 2024 22:33:20 -0700
Message-ID: <20240507053320.1566814-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199078

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



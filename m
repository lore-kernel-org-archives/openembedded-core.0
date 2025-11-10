Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59759CCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:24:13 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45276.1762770248465899581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6HtLT/h;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-782e93932ffso2296651b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770248; x=1763375048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgtnqA47BJR29e/XiiH39A0PjIXhU1r6MLH/H2bipLs=;
        b=A6HtLT/hdRIpPV67jQtKr3XU5TTUU6LAGLNBo9W3gSumrmZfJlSh6RZINimRXxGgZd
         VzJxzkg+NK+3Koz75HTSGneGBzaV0YqxndQ6yJEvSLJIgmOe9fs5Aq++J82swX3dmhdR
         VOgWOVNFob7la9p8IHfHJbktWeoN82V3vEwJ12YQrm4DHmOGUEzP0x0rZRVDoTPIw1a+
         IAWUBT95V0AnCWjypSCV4BA/hfuFLBhrVQuEn1xNY7GSbf6kzirNrCNaW2FMQvSsfxB2
         cQ4zExCejRnPjnaPF7bT9XvU5VQTPO5sN9nJFQxHaXneKmzyY9YrWHMc83lr5d4/Qfo5
         i2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770248; x=1763375048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgtnqA47BJR29e/XiiH39A0PjIXhU1r6MLH/H2bipLs=;
        b=vB8hTG/9hLBTppvdetBpW/BeScgI3hD94kQ1Q2osLoGz4/m57fszjjf2y5teqWGUWV
         tKeY8HvEhmlVFeNK5Hyj7ZQUlupbdO4AiQ9JXKEx65a3VptP4JHQ9HTlSc00MiQcXw2C
         7iAyg6QU36IcxfmZKLclbnccp2cMiuqZbbLMWLw1ovqXl7J+Gi1ITSUCodGcVFv45q3M
         0276dPAylj3MyYyoMCot8KOPQLDBPa4WwKLl92XEjDi/HiHhOj1CkbotLJFmhHYAUY06
         dbgWzevA2Nug/TowFdkqQu6nn22v+dSUbigm/p63RS/4F8rpsa+AI5bb85U6QFsnT8M1
         Oerw==
X-Gm-Message-State: AOJu0Yx3Tx6hbKNaRmFPeO0vVJCc8XV9F+kc/eVsXJPwLzks8NpGYl0Q
	nxxqiQjaHBd0H7D/sknd9l6MItzjDhwGEEK3zzgofMgREv051YktAqy5e8332w==
X-Gm-Gg: ASbGncvQR88ajuew/U9PyMBR24yLfuGik8wsSjcmHbdYnqQmwONiD3pLiOb+HnDRnJw
	AbvfaLzdQtlkfVOTh7O5cnj55L4eNfrRBTFb1OQHoZdWROPiVvxXBVI/BOZibV1O5UB3Lqi14sy
	mjbVO+QbjRobJ0dy+3JHGx1xSz70VUS8ks/VplX8T1uUJ99SbT9WL4SvC2x+Nz6jT6x8x0kgRk9
	9Fpxhw8juOp/NERNQJJcnOgz0IF+MQNNx922O5PwIorQahkU+uiMm3uOLneoh0YNHBGK5+4VqOJ
	GQgZ3RJv4UAmCBVn91Q/YRjIo+1cEgw0J+dC7xGp6USPpdW/Oa9lP6Bfo2i0OYQHbqLol2yWvxL
	JcGq32WilG1gHpMEfDupolA5EyEuS9N5P7MSNcFwX8uPs3cLDKM/4WU0ElAiC6s4ojcpj8Izn8s
	penoRJZ3NGUjW4Hg==
X-Google-Smtp-Source: AGHT+IH5poS2ja+Cd9EJCQSbIPoluyReyP3XqoQs2Ljy85c38F/2UZqsHWGzJllYvaQjTBfcqxdktA==
X-Received: by 2002:a05:6a20:12c3:b0:352:eede:89cd with SMTP id adf61e73a8af0-353a18b84e4mr10458236637.17.1762770247733;
        Mon, 10 Nov 2025 02:24:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21desm12753677a12.11.2025.11.10.02.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:24:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 2/5] wireless-regdb: upgrade 2025.02.10 -> 2025.10.07
Date: Mon, 10 Nov 2025 23:23:48 +1300
Message-ID: <20251110102359.2917153-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
References: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226114

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2025.02.20.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.02.20.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index 09fff768c4..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EF6C25B75
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.4766.1715060005482433464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xx8FGEVi;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ed835f3c3cso25597355ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060004; x=1715664804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rve0p/dv1eWGMVSE2ePGJ4SUsfDOksStX6udeTx1rYU=;
        b=Xx8FGEVib8o/7NJ6md+BNDgHpT4l0GQaAP0BmbgO6sIFnpFGohIBktQd9V88c42SGt
         /rlbCpDRcub/sNYa02t4zRU9kTm9vDIJo+kRzfHpgRHGoZEn+CYj+ZVSeKeH8O52emwy
         bAHG/HsDySC4UxG+XdhX5j97nyBFqUjLqFYPhh8S6hsp+o9UHdzK4t4L08PUY31L9p51
         j+0RSWs7mXYitYL4JeaOIr37gao8zx0Q8FeBwOZpKXZZPRC9DLzHGDe+DeAubRxwszxJ
         tTteSTN8pKGqxIZER5r6WgqDJWh01ewTBv6ylaF02DjeBt18jNDdkNUWoSC9vJgXHPiu
         C6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060004; x=1715664804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rve0p/dv1eWGMVSE2ePGJ4SUsfDOksStX6udeTx1rYU=;
        b=vHHPSdS1MhS1DKJ9ufWTSMALtjS+0m754TYmwYS30/doq/RMekA87YMNkYH4x9guur
         bvgDU0rS5eFrGzEjlfP2Gyhw44nC3Cv/6XwMr+SWSCwbx4XWkQkcpfWVsg5k5vT8sa4o
         CIrxZSNEbtTdEkWp3UKxO2kpmlBXap5Yq4iXfGzrssgF8lVDfVryMvZz4B5KGXfYOXoT
         nIRoJ3+Fn748zC3f8vp3NoP5cwskMIIBKf499vgC4WkPX15YOywYqlvX1wdbU6IWOxGk
         37EuLATsAaTAbn1Bc1aRVsYk21VurYOJs5dSAtgM/KvOp3+YxO8AWteSAIchZ1RAgD9g
         MZzQ==
X-Gm-Message-State: AOJu0Yy0jaqlwY+IVk9uSkaTUT4rbd7Lc24MrjhZMaYq6GUZfIA2DsRO
	Zb2w8ANVuP700C6V7YUp97a5xYEbOk1rvhv8bTHY86YkeN5jaiLKgD2a4ycv
X-Google-Smtp-Source: AGHT+IHeRur+ivQGOd+lfr7tjNrZRlcM6z8WetRxjzfdWSdilb+WmcoUdWNIX732qMWAvIuXOjWl/A==
X-Received: by 2002:a17:902:cec7:b0:1e2:817b:460a with SMTP id d7-20020a170902cec700b001e2817b460amr14003457plg.34.1715060004518;
        Mon, 06 May 2024 22:33:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 02/11] expect: ignore various issues now fatal with gcc-14
Date: Mon,  6 May 2024 22:33:13 -0700
Message-ID: <20240507053320.1566814-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199071

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 7b610b1ff2f..18904ebc10a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -81,3 +81,7 @@ FILES:${PN} += "${libdir}/libexpect${PV}.so \
                "
 
 BBCLASSEXTEND = "native nativesdk"
+
+# http://errors.yoctoproject.org/Errors/Details/766950/
+# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0



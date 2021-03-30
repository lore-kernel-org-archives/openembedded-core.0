Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.167.1617139827445863314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEz5subw;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id q10so1455577pgj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 14:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tDZKM6LNqr6W6/xRBHkAe4J/j6nBwm551bIVQouW0g=;
        b=tEz5subwdb8pvd0xf6kfMJxDTFiDi0i6wraOlrZkTmMdzd0TItJnhvWdW6ZduDfoZ3
         lBKYmuKfE2fcVbrEEVdAs5PJ8C1xzipnfpIZocNkArU7PlbnBZeIuObWh/BVSxlIgnD6
         pK14IZ7r++LsobRm7fYBoxiR76BwxnVA2pUH+J7Rrc1j2A9dTgv62HZmyvTOWLed2Ohc
         keOxBbV9GKI7Vblq2NoTZ3asqtnOX8K3N1w5f0z0qdNiCoDNwR2fSFS0ks2guJTAwq9m
         lSh9XkMOkbUHSv7u8psy3mvRimj7xuCPXo9NGqx927fY2BHJuu6ntkkJx5DhCmvwo3gr
         s3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tDZKM6LNqr6W6/xRBHkAe4J/j6nBwm551bIVQouW0g=;
        b=fcM4+PKFOlo7ah68fm1v1pP8wvOlsUDlKp7K6294GvqL9wMQLAxmlvB3HfGEKpv/j/
         UhnF7sQcBJYJRS51kxJddjEuLK3t4ASa545mtUwAxNQ2USKRSwbc0KCom0+DlCjzl2Hb
         i+9TJtKotC9VeZWJu8lIGOljEoEet6AGU/MOaWm/XoIEY9KMAw9BszgZXhAGuNDp+NRB
         KAVkWnrp1QCUxwOZP/7j3u5I/ZkuDr5QoSl3TCI8zk3o3BckgQJO/JF40vGu3/W9KTSb
         fVaAC1YT0eygOudv5+0NurZy6gz4IlRwUhhtK+fgHwbIpvhhts0xLcaZ0WcoJUBeFaSe
         TMQg==
X-Gm-Message-State: AOAM533sGrDvU0mczkHhT6xpFPJ61oTxDu04+/C67B4keHvn8BkHEvfp
	U0/nhVOfXCLVlTBMbZR7e985MQdpM2/gBA==
X-Google-Smtp-Source: ABdhPJzFgVc9ZYJBhEQ3tZZoX9u27PmBjiP27MhMjmiajaKSv1qx4Gdil+MP6B/MSQDnQkJvK7G7vw==
X-Received: by 2002:a62:2a8b:0:b029:21c:3016:3a9f with SMTP id q133-20020a622a8b0000b029021c30163a9fmr47107pfq.38.1617139826828;
        Tue, 30 Mar 2021 14:30:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id j30sm144875pgm.59.2021.03.30.14.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 14:30:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libgcc-initial: Do not build fp128 to decimal ppc functions
Date: Tue, 30 Mar 2021 14:30:19 -0700
Message-Id: <20210330213019.2300696-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210330213019.2300696-1-raj.khem@gmail.com>
References: <20210330213019.2300696-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions depend on glibc headers e.g.
stdlib.h/fenv.h/string.h/stdio.h which do not exist when building
lbgcc-initial, and these functions are not needed during glibc build
so we are fine to disable them

introdcued with [1]
[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=781183595acba67a37c66f59a0c1d9b5fee7e248

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc-initial.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 06bf224f73..f7d8041226 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -51,6 +51,8 @@ do_configure_prepend () {
 
 do_configure_append () {
 	sed -i -e 's#thread_header = .*#thread_header = gthr-single.h#' ${B}/${BPN}/Makefile
+	sed -i -e '/^libgcc_tm_defines = $/a fp128_dec_funcs =' ${B}/${BPN}/Makefile
+	sed -i -e '/^libgcc_tm_defines = $/a fp128_decstr_funcs =' ${B}/${BPN}/Makefile
 }
 
 do_install_append () {
-- 
2.31.1


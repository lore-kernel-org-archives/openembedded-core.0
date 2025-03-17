Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ECCC35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:39:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.55988.1742225976221749168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CH3Ernqz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so23784515e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742225974; x=1742830774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb3SeQutxZJNiGxayVJ0orhQPuDmsdX3ZvrVL4FAfDI=;
        b=CH3ErnqzKhp9l80jnpPTICh1GeNgmuWbE/SnpOvlZ7Htck4Mgc1sqYV08ltzkHbELU
         HbWA7vzro1p3WwYOFni0WxlQxNYColkH6JcSCjsLyTjer9ZdAsbBtzciLvZleMI9mLf3
         5R9+s9xevOnNlUg8QOJQvhjvbep5zRENr8thU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225974; x=1742830774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb3SeQutxZJNiGxayVJ0orhQPuDmsdX3ZvrVL4FAfDI=;
        b=uJgIN8ql8fCJrNF28ZV2Lvg9KvEDm1dEjmRFTX22rbfM2Y2FLsmMiqlFTKmEIzt2oz
         cFX5E4aybWKueboERYrhs2vN7BzfBKXsMjep6fYnL8uH/IWjTZ05EnurFLeOdAZqEer/
         JDJ+H9OvX1wdVDuq1BIeqCw2ecw/bgfpwJlSmJZo9/Ff321Q7UdiWnoz1/xMXTBl+tF4
         VUdZL+Dg4CcQvu2ghRecVLJi9e9DrJcm88DC46FlvmEOvZm5k1vX96RIGklQVNqLtJ6d
         sSBmQevxYFU1UDqiD8vnS2+CRszD+vI+GumuLl9e8DwEwxrx1FmPmbLpmHJgYA5sSaTu
         T3gA==
X-Gm-Message-State: AOJu0YzFckYZ/bvL2DRjQQfoHP4k2njkxBJqhKok9oaZl59ROsuBmYlI
	svMmdmYLc0ETrzfj0nh+I6zT7KT0euzyTqI4E/fVuIbB/Ac9bywbAmQpnDirE4qwETf02jF5zVR
	s
X-Gm-Gg: ASbGncvCFd6lsSlC6w5OpgUU9DGxdxG+ZiMuh5UsKHs54qSzQ0i9atKbDjRGeozOU/W
	tli6ny64mdRO9DoNQBnTOkZ08Gt4Uo/DCM1dMcjBvi+3hdmmPidp10aODf+dv9mH1eta9AS86/F
	1AEsiPCTgMZ+TMVQ1+/cJEuv7jqRqikyY93X3i6713yhLZcOlDVShCAtrZR39cvEg0o+Dz2AhMe
	R92c1owFIOdBsTc4XpGdWx1PNoteG6cb75LdhQdv0+Go3YnyC/GVOKG6a2FUcBTnTgB1GQjyK64
	Ofnv2vjasLrsB+t2/kI68oLkRVrGSi0jTgkxnq4aWUz8G0/g1kQ6lexLXgGiMRebLjcJRVXXXVi
	3wYt1zisn
X-Google-Smtp-Source: AGHT+IFTcmvz9PZ0K4JTH+DhgUIFfcnaAxRcg2BADhjxU6QHuTraitOwLxSAVDQWJ5DbEX4z6qbvWA==
X-Received: by 2002:a05:600c:358b:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43d23137e75mr110049005e9.3.1742225973970;
        Mon, 17 Mar 2025 08:39:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:eadc:d6a2:789c:c5c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe15488sm109421945e9.16.2025.03.17.08.39.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:39:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] native: Drop export statements that aren't needed
Date: Mon, 17 Mar 2025 15:39:31 +0000
Message-ID: <20250317153931.3836971-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 15:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213110

These are already exported by bitbake.conf, no need to export them again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index febb4b60013..625975a6942 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -53,20 +53,20 @@ PTEST_ENABLED = "0"
 export CONFIG_SITE = "${COREBASE}/meta/site/native"
 
 # set the compiler as well. It could have been set to something else
-export CC = "${BUILD_CC}"
-export CXX = "${BUILD_CXX}"
-export FC = "${BUILD_FC}"
-export CPP = "${BUILD_CPP}"
-export LD = "${BUILD_LD}"
-export CCLD = "${BUILD_CCLD}"
-export AR = "${BUILD_AR}"
-export AS = "${BUILD_AS}"
-export RANLIB = "${BUILD_RANLIB}"
-export STRIP = "${BUILD_STRIP}"
-export NM = "${BUILD_NM}"
-export OBJCOPY = "${BUILD_OBJCOPY}"
-export OBJDUMP = "${BUILD_OBJDUMP}"
-export READELF = "${BUILD_READELF}"
+CC = "${BUILD_CC}"
+CXX = "${BUILD_CXX}"
+FC = "${BUILD_FC}"
+CPP = "${BUILD_CPP}"
+LD = "${BUILD_LD}"
+CCLD = "${BUILD_CCLD}"
+AR = "${BUILD_AR}"
+AS = "${BUILD_AS}"
+RANLIB = "${BUILD_RANLIB}"
+STRIP = "${BUILD_STRIP}"
+NM = "${BUILD_NM}"
+OBJCOPY = "${BUILD_OBJCOPY}"
+OBJDUMP = "${BUILD_OBJDUMP}"
+READELF = "${BUILD_READELF}"
 
 # Path prefixes
 base_prefix = "${STAGING_DIR_NATIVE}"


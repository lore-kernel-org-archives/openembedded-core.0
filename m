Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC65EF901F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:57 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23114.1772642929361181152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UAsGofG6;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-413c2977db8so1458999fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642928; x=1773247728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOEUATX1R3zaee+T2FPZecNpF7K6G1L1mqigJuVHEzo=;
        b=UAsGofG6MdGM9Ja6vDTAQju3v7azsdKbkOubvm3seDd1EeZsWEoQUt8DSLdfML5Can
         IXdFJqL8/V9g/hOVq5zRdMsmfy8x0bnQiXH48O+Qf2XcNXZh/Ml0YuLFEeUxxI7WI2zJ
         in1bTaa9cpBfiHqnpXSZaTkanobodq3o2aa5Ry+glO+uwnqadiKobueyKFzjDeBtxw8r
         rPWN1K4t/HlMGWBaBa4r5i2YN+MR5IK4wfLaNyTGIq57FhcORZ2R6vAMGjOuQWNXDGlJ
         vextzWIZZipqDgm7pccGvMWHrGm+x/RcxNVRslb45k1+/3CpJYqiW2f+UKIFi3/O3+bp
         M83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642928; x=1773247728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOEUATX1R3zaee+T2FPZecNpF7K6G1L1mqigJuVHEzo=;
        b=DjqcrEUuNRXW8lrJiqAuO/A+uTGdTC/1zvcFfwIEpXVEw7oMIIQOh8KgFhSFyPbvri
         XsdoUa2wguvqlcrwf/zxIYre/x9P0OW876LREnH7Xf68InMQohg0Has6QUWu8PC7tFtF
         7J8WVhC4Q34y09CUNhNdezWW4l1PCxfatYnJSjypE2woUA0qmths6O6GdL9hSKQkr1K1
         JsQZLRSApxrIEYJgyEd5kzDaAqvrngAunH0OwVYlLs/7GdRTs5/dTIY9oDDpF1O2jHiX
         cScu8o3KxX28HDKDMzVYcduzb3H7xns7Za049/YJZ1/0GKNkin+lw/EOUHQ9q2BqjQR+
         2CeA==
X-Gm-Message-State: AOJu0YzEjwuU8NkAZaO0wcQn+wBP9Q6nkMD/XTNxQ9xUBI3yswtpgxtp
	ev2jVfuTEZcMn141Pm0h0C1B2tduYzciBoVmKbhuawDsFiEi2lu3S2A8cnauxw==
X-Gm-Gg: ATEYQzym12JnBdNqU9iwvFspBqegX5H5n5dW1mOl7P2vAnY+wSkpwiivTeQ/nJJeWSm
	Hx2wTgreyEVAZQoM9PkV2jMxreObxESr3Tv5SF5b4CabYL1Ab1S/bvP9TrPNKl+K1eEX14sgssM
	HROISkPD4I1kV8LSTwUWGee78IsLJQQwal0gbMi4AiXJWjmmAWjFWV3myeI9fSKnPdlnU6uonfK
	sQoQfIDboitAXQh8FStg/S+sxSEKSmv6cHIBhUW9vOzupybrJZTSn4UUoZldN6oRjAekUL1Q+X8
	C7aHBuWzTd0IXpDXgF9YbM13TvQ2/Iow9NgbmAJ0t7WOvKd3BO4Nx8tIR//fiAi+eX4J+A6/qRN
	7ZwJbPM2tVH6VqtBdvE1s3FywGCsI8IEknubeJyB/EHVpQmGCMvI/S9hjPmtEcfeLQ/qZ9pDNiI
	npzFNL2O5c5mBKRpeUHIKBJV6ZO/kVDWs=
X-Received: by 2002:a05:6871:2b86:b0:416:b429:28e with SMTP id 586e51a60fabf-416b4290b37mr845674fac.20.1772642928385;
        Wed, 04 Mar 2026 08:48:48 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 13/13] glibc-testsuite: Do not generate SPDX
Date: Wed,  4 Mar 2026 09:44:24 -0700
Message-ID: <20260304164835.3072507-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232402

glibc-testsuite does not run on target or factor into the build supply
chain, since its purpose is run tests in Qemu at build time

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.42.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
index 6477612feb..1a83a09802 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
@@ -32,6 +32,7 @@ do_check:append () {
 }
 
 inherit nopackages
+inherit nospdx
 deltask do_stash_locale
 deltask do_install
 deltask do_populate_sysroot
-- 
2.53.0



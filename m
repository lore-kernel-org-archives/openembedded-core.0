Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD35EE69197
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87670.1766434087943555426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PBcVtTQV;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso932186266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434086; x=1767038886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59g/YBMzEhvgEvawdHgGZg973UePeni8s9l2Un9iUWU=;
        b=PBcVtTQVQ1FVGH8cX5rOO/qTq5cKOEBKmzm3JyKHm16Eb2E7n7nLOtKlFrsW6MrFSp
         GN5yVaMQ1UkmrYfLtkab8lBPewHCsMFpJD+DywCvqrhin1PF5MN4DuBdIxvsK2Pv9rnq
         huWpVQ13hKDS2BqBxYx6lSvPN9qlFgq88qWac2e5cD4Qk9cV4/nzk99APyYSYsqKg/y5
         CcmqKoUhYT5PO+bS4UeO+tJ5r7cBSy1iQroQiiBm76REE3uUV+jSVdEEQOnPsIOQGIQO
         wHuNVXmiUvkiBFJiETLKDh2PviR+tREyT3SMk+KEG+/U/wbdMFJb0LIvzdK7yqnpdsed
         qs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434086; x=1767038886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59g/YBMzEhvgEvawdHgGZg973UePeni8s9l2Un9iUWU=;
        b=hEx5Hm59HIDXLk3QO4jCuaNbN7EsYEU8xD4y4v+I1Ax9p4gM3IKDWcykJPxrwRHCMv
         BX06I3GrvNnV/haIhzBB+KXhRpC0QcNK2OtQwhaIytlqVSVQElRb/QlX7vyJdqOCePZe
         dC8+pt8LOJTFFqylImakcYIhfyjIaCmhW43OgnrEq3uYfBpS0K0POkAneIK6vFaQTInm
         NST9zIi20S4rQKRwejLcRoZgIkuGmfcLE8+2GC0hlcLR/5hMe7s+yMiS4QsbzUeR5EZ/
         aqM/fw2rKCQBZIn5xcMPAzGrTqmIBmY0q3Ffzt7OvzA8KgGCVbfs9HbJhMBkCzxpDRV3
         yg6w==
X-Gm-Message-State: AOJu0Yw73/LfUxeJQxkaKc09ecxcE0B1XWRzK4hgMlrGAiFn9M4j8CbE
	91UML2s4t3uRv1ylKVnsHzbL6hWlsfVSeRNZX98TVXY1iBuvoan4D5rb0BwbtA==
X-Gm-Gg: AY/fxX5E8CXKSKzOmDZ67DyzvoC8r3fd54obicMq59VYhgtz9nCZilsli/qgWy77aoM
	zUbjZ9z7XNLp12O8vdBZIxJ3vWWdUy+RPCp9OU8MVn3uZXVmuAlEp+W6fZbRvIWn7FlyB/2/UA6
	Ix1rNCxYd9hbj4Eje5nB5G4zCMFMSMmepLR5cYa8eqf+33uFT1Zb3MXR1bWFZgs5pupWfLjeBw/
	bevfmWUtS3ERocKfMXCZFGkTFgaKo9xGXTkPJHZ80+Jr/1qF52+0lfAwSgUCe2ctCu4ic5PB2RL
	z9QBZCv4MhhBqkfTC9/LLdZLFNbBK46wz6ORnCvGwUUhzsSlalCIUX0pnAbF6DN8JxA4pvsU8kN
	H4+U9N1s0wsT2WNl/teYbt5EbiYgeSBor8v07ZU4CLbzEAngjHefHsfKYk4RzhT1eC6caW85fu3
	QCaDzvHgOTr+QfiCquOp1MGoTEYuOGze2iYKuqrEAl43fCrdQ=
X-Google-Smtp-Source: AGHT+IERxYZjCm/VmJL1FmqbExzCYlVzGGl67LNfj4ORYTyF3bD9jgOVMnaTGKYttBDM6vklRIEglA==
X-Received: by 2002:a17:907:9450:b0:b76:4a7c:27a5 with SMTP id a640c23a62f3a-b8035794debmr1387348066b.23.1766434086177;
        Mon, 22 Dec 2025 12:08:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 028/114] libatomic-ops: upgrade 7.8.4 -> 7.10.0
Date: Mon, 22 Dec 2025 21:06:10 +0100
Message-ID: <20251222200739.2278706-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228353

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libatomic-ops_7.8.4.bb => libatomic-ops_7.10.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.4.bb => libatomic-ops_7.10.0.bb} (90%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
similarity index 90%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
index 1007219294..c31ccac7b0 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "2356e002e80ef695875e971d6a4fd8c61ca5c6fa4fd1bf31cce54a269c8bfcd5"
+SRC_URI[sha256sum] = "0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeffeacd274190dfb0"
 
 CVE_PRODUCT = "libatomic_ops"
 
-- 
2.47.3



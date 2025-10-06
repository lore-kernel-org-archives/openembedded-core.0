Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C6FCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 21:48:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.4429.1759787331892196540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 14:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9b8sj+x;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f605f22easo4649864b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787331; x=1760392131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OX/uAsGxVA2PCYk0HQEpyj+b8TGjMGsR6jA4rRGLJBA=;
        b=U9b8sj+xvJkeUtKB1HuZnBUA6zzI5zEqO7ez1OhY43YGNuOefHR3n/4asJ7rI2Lovv
         IbTJor451DwrdghFL18C7DT5Sb+BZf46ahthvVKx6GYTtGdFEezfEhxeHxjH6J1+PSiA
         LRL6GAk1+w1iX8UkWT7O3rcgxGELyeklPmMFLKgY60C+GUO0FFjOxdUdQXzpu6x4agDt
         W2cHgZopDltvqhHAAjZkLjQfwI1UytfIaZJYWPnNXetz4UFNQ3F55NyNObCwPoMr85/e
         c++1PGS3yznIsEmV+tSymkLyfiqdZKN2dEg61h64t3GbmpQTKyluPAy0Uwye6tU8W8xD
         ccUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787331; x=1760392131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OX/uAsGxVA2PCYk0HQEpyj+b8TGjMGsR6jA4rRGLJBA=;
        b=V5yWz/kQZsTXuKPB6Jy0iNQhO4flwilAwyFckNrkpvm2YIUV96mbUkNNb29y5uMw+y
         1LQNhe3xyCwO687JAdPFLCMQE85XIlsEWi3IXibkO0n1amYdri7Vw31cw8FnNnbqyMZN
         LO2SxOwTQGfJUMSRZpd7OIOlQnw5K99DQokJqr1O0yuR4utA/EgrGZHjWbzw3A5MSPr/
         WV1V3zkCZZtZ0OCl6kFrLTlCvYdmFoAW5R7fbJw/VUjZ/g9mJIQsD1Z/UDHZgNDzIBT2
         yeF93cM/Co05vkLxRYVrAYjlTDsaZ6Pq3As7bI0lzcAcDvwkFwKoI2Wm6qHiEnOAENHk
         j8+A==
X-Gm-Message-State: AOJu0Yz/YrB+VA3rJ9RM2TQGXhskQ2p1zgP2mUKksMsfCdYmVpVVy2dz
	60g0xIRXT2G+4+HWnpA8k4sug1GdPdKef9Jwmx98Crp6d1hhUUqFSciUoKmA6Mot
X-Gm-Gg: ASbGncsIMMTjEEvPWFqxVydhB5HNcsAdN/axmPP5NIWO14VEINHTSBjr0RPE4WRBAgi
	ro1a4Q8Z2daVGhZyPW0FS1bbxGEx9WDX9p3Ham4f2AtKp2HkpGzQtI4Oe1zcj0ttAi9tGS0xNxo
	C2Ycxp4U+XjAZ++9t/yapSLqhSNfhHtq8+c6wJEfWB8ys3VQfz+dyKAxT1yYRmVt1Lyg6V2KOfj
	4utd3znCBwCUmI4PtNiH0vyFEyes9D5+uRtBsnu7BuWjfqLmSJL11fj4AaoP3BTh5JrP2f9gsaS
	JSbUY2HNazVdyRavys8eHA+imoHNQmlq7oycmbhgAjwLq4olQ1G2MU23VfGISFuRAXWw1Jzvzqr
	E9QhUM201pSrjg0LYk44kxf0QbBwjZSmsnTUdxNmYeoocic6Nb7bS+wdiFBeT3ffCdEcW+sUXeJ
	0eT7JFMQCPEuowQvEsaQhB0ZW+oIsUT2qa0txbZnqdacFwSxhQSapqb3sOGQwefXNXu4wuhkJsp
	g==
X-Google-Smtp-Source: AGHT+IF5qEyzBEFuWY6fHQQr7/lt/Gmrz0h2l0UAOsBCKawoN9qW8I1d1jTjB3VQa68ynlklouzOAA==
X-Received: by 2002:a05:6a20:3d82:b0:24c:f8f:2b95 with SMTP id adf61e73a8af0-32b620eab70mr20450637637.40.1759787330929;
        Mon, 06 Oct 2025 14:48:50 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62ebe500c1sm7564747a12.0.2025.10.06.14.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:48:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ghostscript: Do not treat declaration-after-statement warning as error
Date: Mon,  6 Oct 2025 14:48:48 -0700
Message-ID: <20251006214848.3633921-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 21:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224507

This option is added by ghostscript and is passed down to its modules
e.g. brotli, brotli does expect c99 or newer standard and hence uses
declarations after statement. This option causes compiler e.g. clang
to find this warning and treat it as error on 32bit builds

./brotli/c/dec/decode.c:440:12: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]
  440 |   uint32_t __fastload_table = (*table);
      |            ^
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 4f6cb454122..4cea8984328 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -47,7 +47,7 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
-TARGET_CFLAGS += "-std=gnu17 -fPIC"
+TARGET_CFLAGS += "-std=gnu17 -Wno-error=declaration-after-statement -fPIC"
 
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig


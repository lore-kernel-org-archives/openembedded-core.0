Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.21182.1589140254871094507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 12:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SjP+LAQP;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id p25so3723164pfn.11
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98iEtOa5+3BTKBXtM7KL55RkIzVH/dgwlzH0AZ9K3mA=;
        b=SjP+LAQPrB3oeUKDr9q1uHTk7iDjEM1RtHDYvsFg2eaAJHr7/0mhUohVTKXYL3IsSS
         Ei6k6llIkgbGej0cCegzv2eOel7Oct+ona0agNdyyPmiT6RrX6+KxmYR9QW2AHRbeTi7
         R2gMIA79eRiiHdW+Ndz7gyMrK+24z0JWivc6POz0UNRk308KgHl7Yof4GVvfGoYVot3O
         VQcihEm2P+OyfqFDftzvYw0pBS949FiOhuU69RuMnoz1giGJ7FcVnCfG5C4Egk0NBr2A
         MdJ0erCdrM2VfTI78MaEm4rosriunZuLgB4M8OIaybqGXhqbCHVVgKnUNwEQCQItz/en
         PH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98iEtOa5+3BTKBXtM7KL55RkIzVH/dgwlzH0AZ9K3mA=;
        b=OVw891tFMhThcuZeR7qO9CjwiHC/CjiGejlkr3mpsf/Xan+jiLUq/hwx4hQuVqHRQn
         n72PYqx65zgZELuuBV5oT3iuWL53kPmSsMyZhEXifiR2a4Lie6NM0Q8HhlyrsVjoD0bn
         mz7HLOS+cAko97MXNcqY1U8a60UHxbNtC2JHeDIGLZyXt+L4YwTT73TxYL88HxTbF877
         ph/L1LGYgGfziR+YzimwJJTKi3wNWgWf4aM4OJuHRd+FLlhJNcHeOR+Msalxm3ElydZW
         D6Oa5hF07yt5V9rJCcK8C26OEaY7Oav+zCozvzqjRI4ML0bw+iAvYCMuEmAyqHbXGqJX
         mf+Q==
X-Gm-Message-State: AGi0PuZzOzSpUDkJimpR9VByJDjGQKPupB/pmuhbnpEqZWNaRv4D+x0V
	Ls5GK4fFIY16Us5LpOGkGZKCh49AJX4=
X-Google-Smtp-Source: APiQypIYLuqLKwhQ3+OEUFfL/oMdU1JbGYX2fv4LtE8eggZv3RkT/m6LFLinFgQ3ZrC15xlxSggP2Q==
X-Received: by 2002:aa7:8084:: with SMTP id v4mr10907709pff.39.1589140253284;
        Sun, 10 May 2020 12:50:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id x19sm7724843pjq.54.2020.05.10.12.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 12:50:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 2/2] gcc10: Default back to -fcommon
Date: Sun, 10 May 2020 12:50:50 -0700
Message-Id: <20200510195050.3470835-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510195050.3470835-1-raj.khem@gmail.com>
References: <20200510195050.3470835-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For time being change back to -fcommon as default, helps us iron
out other issues, eventually this should be removed as we fix the
packages to work with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase only, no change

 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a64c4caf00..6cb40fcb74 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,6 +34,7 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
+    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
-- 
2.26.2


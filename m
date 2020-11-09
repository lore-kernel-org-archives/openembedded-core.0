Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.4534.1604880149510447352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L3Y4m6Yz;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id e21so5307327pgr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5REDx1t+cbyo5fP5YEc42kvwgsnKCwUB9is/YiY7ASk=;
        b=L3Y4m6Yzuq7LSBdaKoH25p662SqymAc4UMnDi23UqwrgKmla6JyetcMkzExsv2sbGS
         A7/M3mzJEuDyh8wL6aq66P81Pzp46eWxC5x4bRoJV7lmo96QEdO0A1/QLEkUPwtxVmsu
         TKwGf2I4XwjI8kuShN+7poxujgrR+J+OMMdfKgcfJP9gwJhF/ajzJq2jHC5JnwCQjvia
         MdlsEPY4UzwkmIVuPB3G9ZatTDL6WlKZPNLjDtNk2VpsS9KzPJZPhhe1kZ+lMr3QRUZc
         I4hD12lKjEzpH2Xg4nJyCSGiMJmimbQ3lzbt2ts1NEeS+4Qp/RA55etmYfnq2fuaZBZH
         1CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5REDx1t+cbyo5fP5YEc42kvwgsnKCwUB9is/YiY7ASk=;
        b=mflk1T+nKGBNWqAkwacF/JDthFfleyq7O6cqHYneQzDsVM7f2HmxW3IhackZS+q9Ow
         Shf/U3fADBpZgOASsqm3BJKzz7bS77gznXM7HWo/ZQ1SEUg3DI8uNUVOHvS2QX50mrEg
         03ux+tGaEDfLi9jEz2RYzRli2r8IGkxrMiEIDYtyRfNXtOdCuKXKQyaDvBR8oj6LuT8X
         qW3SlJx+aEZl0ATjV2Rymu04+3JZF64VC4bxS+CdR/DT9IZ5N3KHczk8oZAAqdlH6+Kb
         VbbUcwopBIFGszBPdd1UyjK8Dd7ui3YnAEpBjt1kgEB8N97aVisj08d68HibyiIz/iF4
         dxoQ==
X-Gm-Message-State: AOAM5329qbvUeI0EXGrXC9C5/gxnBnZtMJkb04Hd2bS9xBRawmYo29u+
	wTuJrhPJVuEqiSX728wIPs+SraO2D6VeVQ==
X-Google-Smtp-Source: ABdhPJwsPPwTPRMigAM9EC9S7eZ8QcvCuYA3oTTH6yrQoVGueKZUqP5qrmJf5pzGc998SnAMq5cvsQ==
X-Received: by 2002:a63:78c3:: with SMTP id t186mr10788905pgc.12.1604880148830;
        Sun, 08 Nov 2020 16:02:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 08/11] gcc: Do no parameterize LTO configuration flags
Date: Sun,  8 Nov 2020 16:02:14 -0800
Message-Id: <20201109000217.3008448-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These flags are redundant as LTO now enabled in GCC by default for
sometime, Moreover, dropping LTO variable here avoids a conflict with
global LTO variable being added for distrowide LTO support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 7625af5110..e88f2ade6d 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -81,14 +81,13 @@ S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 FORTRAN = ""
 JAVA = ""
 
-LTO = "--enable-lto"
 SSP ?= "--disable-libssp"
 SSP_mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
-    ${LTO} \
     ${SSP} \
     --enable-libitm \
+    --enable-lto \
     --disable-bootstrap \
     --with-system-zlib \
     ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
-- 
2.29.2


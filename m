Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.1971.1615606660192613793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 19:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hCjUOvAB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u18so12790327plc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BAillVPq7VcBek7TFXrfna8v80sQB+Mzyg9G9fYPkU=;
        b=hCjUOvABmYhb5W82UBkRLmHVW10aPTuR6stxoYflB1M3k0uQUA3nZtMJPxu3SJYhPg
         TlMkr3+OSUVjPnXI8Uu4wyBFo4usNH38lauPj9kLIJ3HvPRImNOsRz4WixbcBOOs1B0X
         7v9vjWYn8acDlio2Gc4O1eyYF4FIsbzPouaFdcyLIFIV8XCEvp4HJvMjqk1lL/IM+Sev
         +FeBn+2cMDLUZRwxJ3zNRxyN8ykPBW4aHC5G+a1+RCMHqzAPkfMsokI+T3NjdErCk1wW
         C3GX4CM1DG9mQhpprVHXSyI+qWlS8aUjBpbEDX1qKAqTUieuBHR7ghF/7T051CsoMJzI
         nBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BAillVPq7VcBek7TFXrfna8v80sQB+Mzyg9G9fYPkU=;
        b=fFxlQ+1Gb71Rv4FgJfzHflWQc2Xe3nLmVkQt9rYJyKg+iXDUSjbrYbru5L1TW3Y6Jz
         z3fFK3AFoGS8CKzJX50HEoCMj56/q5MNguFdmlfgZecz16h7IULwQYWOTJIAaHm9Rt9N
         P7NMv8ZCnxnGvk0qF4eRA0z7fXmKtIk0a3dr9ESCt+mVpfeeS0uSkzlhsZiPme+Ldkqb
         qQ8jWeD8YY/B05F3X9u+1C7q+jY5X0KavB2a3VO/3xRsb27nQIAukcBSqMU/gPgE/rT3
         lG2SlOPl0o7Ys6oFCS8tAKz3Vn0E1qSFlHI59PXg8xZhyg3Khe504hoLKvEbaxHnLc4A
         t4PQ==
X-Gm-Message-State: AOAM533TJXnX1WbRGW7fn0zME38QqkKozBU1DfMYYRVD2ZIonwMb0cZt
	pocw7zEecy/nBIWq8Z3/13K4Jce9PRxlbQ==
X-Google-Smtp-Source: ABdhPJzarZJcPscE4OTsX4ROTY7Xfakhup7A6FRnpYXqXerLi3x0w3Vd05S52B3HPTsPHl7uG7DMsg==
X-Received: by 2002:a17:902:8501:b029:e2:d953:212c with SMTP id bj1-20020a1709028501b02900e2d953212cmr1575930plb.49.1615606659409;
        Fri, 12 Mar 2021 19:37:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id iq6sm3430010pjb.31.2021.03.12.19.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 19:37:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH] Enable qemu usermode on ppc64
Date: Fri, 12 Mar 2021 19:37:36 -0800
Message-Id: <20210313033736.1276285-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

d044743cdc4 disabled it, perhaps it did not work back in 2016

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index cf5c3ef8e6..467abc5faa 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -10,9 +10,6 @@ TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64${ENDIA
 # musl only supports elfv2 ABI for ppc64
 TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in d.getVar('OVERRIDES').split(':')]}"
 
-# user mode qemu doesn't support ppc64
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
-
 AVAILTUNES += "powerpc64 powerpc64le"
 
 TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard bigendian"
-- 
2.30.2


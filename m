Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web08.10950.1605383937128823422
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dshgsTuz;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id c66so10165781pfa.4
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 11:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NhvVQWtrbtZEM/AITyiypDv/3ncNZy8AHi0CvJqntL0=;
        b=dshgsTuzDNKRMvrkIgWBxhkAodOj+UDX5BnB9T+NbXnh9nh1IYQtiT5sqBf/50Bj6r
         ospAt9rWdtxeIHmaKzzCflFw7XxzubYFpwx99BSynm0LdGzcSTpygXQsPT/LBYLF58QZ
         jZScQ+TPEif93D1HLaak93TdbsOjI+o/0+do8kwtclfiiZhXcJezDjq3d7bpWdRTi2ia
         ArZH3YFCTcfxOagODlobVNjwXKfI1fzMkpk/Q5O72iYaO6Ree5yOMUGQj7oM4meAcZ+P
         INuZTsUPzP3UaiC8hK/IsdcJp0MEgHScVfH/19CCjtwM+pea3H6C+2Njhx3TsZqIAsUg
         buTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NhvVQWtrbtZEM/AITyiypDv/3ncNZy8AHi0CvJqntL0=;
        b=si1STuqToIepq2Nn4dKbTAPI2swSClFY3qjuiOaNahU0QI2mAazn4LV5/U8M1V+5O1
         soPkC9F8FoDbDRTqWtkdJlvylwXcTvjqi5AfIt+yvYcIFbKZddAEhIVIE3oRW2PHyNum
         UKJUjoSFAV0X/IHoaUIh2w1qYkl5uT1dbJSdW3BcXiryM20qQ1aG4PhGKGJrXzr+UPik
         CG95gB/aacE/lEvyZu/Ll/DP3LYoYNdrRLZ7aM0VURMf9ZVC0G/rEz90KlhXelHOgcSd
         w5ooUELPImH6pd51+WUFrsve7q4VLF52B8bHzxj2YK2jjnoppKb0zfN6AMKLj09CM9kK
         vvbw==
X-Gm-Message-State: AOAM531tC9bE5+E6U7H4sDObaKiWKvz3ZGqw3eUeXbmCrCtqtRghZBoK
	cTFg9n2JNSIj0UcaairVlUaj8SvwbCjNa3Ax
X-Google-Smtp-Source: ABdhPJwyXdO25eVK+6hnOtnAJTL6BiLzk4dy3T+0KPUb3aXI3oOtbjSpz2kr/Zflp09ZWTFDdf0HBA==
X-Received: by 2002:aa7:8518:0:b029:18b:cc9c:efab with SMTP id v24-20020aa785180000b029018bcc9cefabmr7636785pfn.39.1605383936338;
        Sat, 14 Nov 2020 11:58:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id gz15sm13798258pjb.34.2020.11.14.11.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:58:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arch-riscv: Enable qemu-usermode on rv32
Date: Sat, 14 Nov 2020 11:58:53 -0800
Message-Id: <20201114195853.2945292-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current version of Qemu in OE-core now works fine in rv32/user-mode the
said nvalid instruction errors are gone, so we can enable it now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index e3dbef7fe3..eae2b88778 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -7,9 +7,6 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
 TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
 
-# QEMU usermode fails with invalid instruction error (For riscv32)
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
-
 # Fix: ld: unrecognized option '--hash-style=sysv'
 LINKER_HASH_STYLE_libc-newlib = ""
 # Fix: ld: unrecognized option '--hash-style=gnu'
-- 
2.29.2


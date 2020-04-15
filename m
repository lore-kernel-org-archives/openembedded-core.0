Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.9.1586992714266739581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 16:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f8CgPLNQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id h69so694347pgc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9R5eKe2O5D2sMtf51yod24Hk8F6mCiIRPF/hfKvSlg=;
        b=f8CgPLNQRR9nU3lqSHLeHgDIEC7Xgk7dTZxrbHVR2IJd6NqnqsvL67lvSyKTIoUdIr
         7q2x68dRB77Z3+6EMCjpvx3q5aNs77F+FjaIJArwu+K/AX1zBOk++TudMBm2kPU7VgzY
         c20eY0VnbXFbGJP4wUntxWuvTFNQGEjCZVkDXskn1kdJ7vJNFYUmlXSDj9BUE9a/IZ83
         j42hEVQbmzR6AhtDPjbCzhntCoqYG6mH+3wasJC/6eL48ph/f5zLdDC/poAu0iaVZlLQ
         8waZYQE/qv+XzE0eyXn83xDCRtinvMkwZEW19y/seGK6IfPhIGMuBSjHrdPpDykjHdzo
         ZOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9R5eKe2O5D2sMtf51yod24Hk8F6mCiIRPF/hfKvSlg=;
        b=Wvp1hE2NbDA0bYoclX62MbCClHPODlrgoH1LdmwZDsnOkxY4ajS5mupO4LYg+391hB
         yl5rxV6pRX93DbA+gX3Ws0yYp4LLcnBNYGST++GaTUJspNBPNq1jIlKBJi+7pyH1oBlH
         gJAa2dW4sZJ0nksqNP+E0BrujWIROEla4kjVQNn3vvpoGXmL6pAsMwl0pr9Uz8iyiPPw
         1/h2wlR1l6eL8z0/rxoCZw3I86hzAWa6phkU9HrOU174mQGVtn29s7qo3fo1xoSV6wml
         uHFx2YL9kPs4TQXkAuG//ZAq2u5cheR37naOoRyo550B9B02dsUwrKhuk0/HB954pjJC
         WXHQ==
X-Gm-Message-State: AGi0PuYy7KDza6Slfe+MYf49t5bxsqLk4RRyrrcqNU3Y3yqioRz9R3GQ
	XLpNwMQTxWvvVJnAFozMcMvH+kZSlts=
X-Google-Smtp-Source: APiQypLa91DKA4uZARgnOZxFVN3dLtPKjT+CyjDf8SlGrMQExnBjJ8PTQVC0faSB3mSU2Z24pJ8tUg==
X-Received: by 2002:a63:7416:: with SMTP id p22mr28514573pgc.140.1586992713456;
        Wed, 15 Apr 2020 16:18:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id a1sm14902161pfi.182.2020.04.15.16.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 16:18:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] binutils: Install PIC version of libiberty.a
Date: Wed, 15 Apr 2020 16:18:29 -0700
Message-Id: <20200415231829.4090244-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200415231829.4090244-1-raj.khem@gmail.com>
References: <20200415231829.4090244-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

some architectures e.g. mips complain in linking apps which have shared
libs that are linking with libiberty.a fixes errors like below

libiberty/../../libiberty/hashtab.c:285:(.text+0xf8): relocation R_MIPS_26 against `htab_create_typed_alloc' cannot be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 4119960c63..e93cd50b20 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -152,6 +152,11 @@ do_install () {
 	install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
 	install -m 644 ${S}/include/libiberty.h ${D}${includedir}
 
+	# insall pic version of libiberty if available
+        if [ -e ${B}/libiberty/pic/libiberty.a ]; then
+		install -Dm 0644 ${B}/libiberty/pic/libiberty.a ${D}${libdir}/libiberty.a
+	fi
+
 	cd ${D}${bindir}
 
 	# Symlinks for ease of running these on the native target
-- 
2.26.1


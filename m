Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C57D33A29
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.28091.1730832356734716480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAofE7Uh;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so4622190a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832356; x=1731437156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8cDWgg+sCChG/Zey9P7FkOxqFdfgPSNUjnlnxB4710=;
        b=KAofE7UhRsIp6zYZAa5wpAB/J+leSKklQaRqWuff7zrAdr1gSeQdbdlfghP2JCuMzn
         Kqwkza5ZCGjXtGoc0YLXuh2Bu/zsx0jW8ht1DT4DvXi6dVrrHI/WlNCjaBUYE6o7SMbt
         2Gc/sSqaslguqdLtQvIBy9AdNKDaat5Jlc2k/I+5e72UFtAS/vue6h4K6Nk7ikCOLjve
         S5okcuDFb9UJeJeCrmir7D3wW/7YE3IgrGHFpWQCTtdYWzkBafTTLnGJDA46XZuBt11x
         pMKoFxxqqneImM4yoJpwCdQOzDb6sFHH6HvLp06bnPzoXbpjh38XNjPM2NF+6a64pxYi
         hL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832356; x=1731437156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8cDWgg+sCChG/Zey9P7FkOxqFdfgPSNUjnlnxB4710=;
        b=tMO6L9dah0TuFhpo9Os2dKDZ/aepMWBW6u1cxnIvtffmS5S/P5DywMJeONlOhMnlaX
         MAtuGaWwc3rlquxHk4cMv1KUJoAN1dg2aO4lNVeIVSQP97QAw90vqtPYvgJMam4xcEmX
         oqJJjteUZVNNlzfsjJotjgM1rzxXNWsMQESoI2dsIIposlKr3hGBo3ao0GkJKUUxxv+Z
         KD41dqkyiDL7zp/3pmCYo32i72tb7tytvZ9FGwXY4W9MpUa2jgvd8vXE7R/gy90odMh1
         qYJ/jEAHBJdtuPuLYnYsJqwX7G7K5O3CLRZrHPlNngL77ZoqLz6lBxP2Bj7mCBLjhRkE
         dZ/w==
X-Gm-Message-State: AOJu0YzlpRoS2GKj14g+KPGBnREpG5ghITgYrtgpWaPntYV/M0mNwiF9
	K2QDNwR1yMCxVT76anfCbbwOfRRT8zJveP0v6fttK+VlK9ys7YCr8G6NfA==
X-Google-Smtp-Source: AGHT+IFpOJawOqD02NDfZ6mB+5gJmfsAgjJ3E7tQgswORF4LenouUAL+FXQYluq4SHN1znCFOF3xDg==
X-Received: by 2002:a17:90a:d14f:b0:2e2:bb32:73eb with SMTP id 98e67ed59e1d1-2e8f10a72a3mr41305752a91.31.1730832356000;
        Tue, 05 Nov 2024 10:45:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 14/19] clang: PROVIDE llvm-native and llvm
Date: Tue,  5 Nov 2024 10:45:33 -0800
Message-ID: <20241105184540.3450302-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206742

Now that clang is providing llvm as well, it should keep
existing demands on llvm recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 1ad40f2fcff..56b569fa73a 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -303,6 +303,9 @@ do_install:append:class-nativesdk () {
     sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
 }
 
+PROVIDES:append:class-native = " llvm-native"
+PROVIDES:append:class-target = " llvm"
+
 PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools \
              libclang lldb lldb-server liblldb llvm-linker-tools"
 


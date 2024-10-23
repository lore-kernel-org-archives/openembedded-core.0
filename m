Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DA8CF537F
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.7923.1729686918760617809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E0hRLsd4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cdb889222so65303445ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686918; x=1730291718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7IVj//B1hfvlmrL8i2za/iFTjJLPzCtUAXlKF8UWFM=;
        b=E0hRLsd4QiVhZJ465LVtB3vej4eGLOVbPYWd7TNx6o5siu4Zx2l6vJ/0lNV2vUVlIY
         0OMOSlTSy1aZwFtDDgTPvol9wPO2MCSb/xSZVyCscJvHdK/o+Yi3ibdq8JhYM9k9fMkB
         7jTq+rjKYhhpsXDublyDq4PjbBbReCUd+K8DWT8KTKv5X7559+MG9DKRZ3XFpJprHM9X
         0ahyDybXLxfE7E39IE5QeGgn/WBcvzGjy7yjzLVkrM9afrkCEgTKvYJhu11HZqfwLLU0
         D0WRNzXXLyiAsUzbrpPgSmt13zRnnVzhiMPD+fUyDdiGRZNm46PM80l2DzHMwplgQHo/
         hrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686918; x=1730291718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7IVj//B1hfvlmrL8i2za/iFTjJLPzCtUAXlKF8UWFM=;
        b=lC57vJXtjaXSWUHlnff5AheWrayenl5JYXNOtojnTznd9luTPHIdl9df/eoTErAy4h
         HwktKD9SNF/D54n/X9+K6JEZ/0hZB9N2gl7I7xzOP6SHjYt3mDAPDnHVVSOgPbd7ohCT
         4G+Mxk9pOzajuRSloKoAsuHXfV238vBCAPjWcsrLoTHlX09BbB3Lri0Kk5Z7x/B9d38i
         +7oTTE4JVbxjnZjw/D1GDgmMSSFkWUOtrt5TiRELYzeIRd21lKrS/lU3kHB43j0VdMRr
         LXbZz3NpLJVyhWIQEK1BicqehuVwSJZwCa6ZlOZ0iBXtqZEoa0Bf2vxM57vQtVhJiziZ
         MLMA==
X-Gm-Message-State: AOJu0YxtJ153JDgu4LA0/KXyEFZvKr13PwaYlFmPjPqMa7PbNFqVyllf
	8oO2t47zlLnhqneUPdljjJoAZlZR/pDMR2ruGVx/GCGKoRgYP84ZGidn/lErKJjlIgtWphyW2tM
	g
X-Google-Smtp-Source: AGHT+IHi4Sl3OIFfjVRdVvBLrA45fRYrj3V4lAsXb4PH9JFHWUDuXu7HkAiOgHn0IJQb0qlIZ4GjCg==
X-Received: by 2002:a17:902:f64c:b0:20b:7a46:1071 with SMTP id d9443c01a7336-20fa9deb645mr34754175ad.4.1729686918003;
        Wed, 23 Oct 2024 05:35:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 21/27] json-c: avoid ptest failure caused by valgrind
Date: Wed, 23 Oct 2024 05:34:29 -0700
Message-Id: <78160463259ac3be6de380d12b8cd6159162792b.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206232

From: Chen Qi <Qi.Chen@windriver.com>

json-c's ptest will automatically detect valgrind and use it to run
tests. This will fail in case valgrind does not work, e.g., intel-x86-64
(corei7-64) + lib32 image. The error is about illegal instruction.
Error message is like below:

  Illegal instruction     (core dumped) valgrind --tool=memcheck ...
  ERROR: "test1Formatted spaced pretty" exited with non-zero exit status: 132

So we explicitly disable valgrind by exporting USE_VALGRIND=0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0429a278e39b7a2846144bcc3fcc24ca298cab7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/json-c/json-c/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
index 2d0e94cd3a..acdce54f3e 100644
--- a/meta/recipes-devtools/json-c/json-c/run-ptest
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -3,6 +3,8 @@
 # This script is used to run json-c test suites
 cd tests
 
+export USE_VALGRIND=0
+
 ret_val=0
 for i in test*.test; do
     # test_basic is not an own testcase, just
-- 
2.34.1



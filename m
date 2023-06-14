Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8AFC001E0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.7485.1686734984988684173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aWKO615G;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9788faaca2dso86662366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734983; x=1689326983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZz6PWFmN7pvFiaq6pta5ltmt7Daqpj5pY4yb0UkQXs=;
        b=aWKO615GBeAoWscus654ODd6d0i3BDIE1yqKN5X6fy11yDTthgG7hECGhe+YN75nqs
         DoZHybCvVG9TKiS5las6GQabZT8RJLdtyqR3hYtCN1ZpPI8vC8+y98uWDfOZ/v9Ms7YU
         XaM4z4IwubKEIi0GG1VzFggfUVi78tE+jw3TXGuYsEkk4iLmt4/6yKpu1qGJBWI/EpSI
         l1ixIK1n81ph2RyNpS+CDpNfBFeeq6OD6NPrZLnZI1zFp8FmteGsh19GnUN3AJrSA+fJ
         zMVA1HEWYpL9Ew6T//ziA7imJ60WJb9XAntMYdpLEzaR7XTo5yHZEDBHSPESvatuFSXJ
         qwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734983; x=1689326983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZz6PWFmN7pvFiaq6pta5ltmt7Daqpj5pY4yb0UkQXs=;
        b=ggCui0g/BimlZ1Ydd4TtOjuqVYmX8vbR4w0XfBfTF4A83Nojh23gcLLyAnq3XUEvts
         DQQezFl7AC4BwuZB/QRIVrLa94s93MFdKVPqhClosSyrnILJZOFbs0GV0Xof/DxxGZhS
         fe0nBgTBCEyi/WYMI2DOSEHW+i+0tQn7cEeDCyhLU/LdJQoVx01t225pEj4kjLPthLSi
         OuOxLM0fYzRzk+ljV/iSa3QlHi0CwmMFRzoUuLrQWKnfR/8fUgDwUQ7QHxatID1h6NSl
         qGyZTJ0nOCYlDGvtJUOhLbL70SweKwk5XokqbcQDXJVtwYdBOoftZk0jDA4p5VX5Gi/M
         zCyA==
X-Gm-Message-State: AC+VfDxkTkz9AXL4yLJAlg+LL9rbTZP7AL7TOwoAJX4rxKYGIpvHG3dB
	XOpGj/NG844Ma9k24H0rWMS8SWtVYNU=
X-Google-Smtp-Source: ACHHUZ6Pzl0rXy2Tl+l5/I9A+fwt0TToqCzK/+kOQqwIlyIfYvpARk84u18sAHtLrX5ejFoQLIXOUw==
X-Received: by 2002:a17:907:a414:b0:965:b087:8002 with SMTP id sg20-20020a170907a41400b00965b0878002mr16141065ejc.0.1686734983351;
        Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/55] ltp: upgrade 20230127 -> 20230516
Date: Wed, 14 Jun 2023 11:28:52 +0200
Message-Id: <20230614092918.4065570-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182774

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 +++++++++++++++++++
 .../ltp/{ltp_20230127.bb => ltp_20230516.bb}  |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
 rename meta/recipes-extended/ltp/{ltp_20230127.bb => ltp_20230516.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
new file mode 100644
index 00000000000..dbe63f21708
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
@@ -0,0 +1,28 @@
+From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 13 Jun 2023 15:10:33 +0200
+Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
+
+This is required for off64_t to be available on musl systems.
+
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ testcases/kernel/syscalls/fcntl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
+index df663a50a..aac774111 100644
+--- a/testcases/kernel/syscalls/fcntl/Makefile
++++ b/testcases/kernel/syscalls/fcntl/Makefile
+@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
+ 
+ %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
+ 
+-CPPFLAGS		+= -D_GNU_SOURCE
++CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20230127.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20230127.bb
rename to meta/recipes-extended/ltp/ltp_20230516.bb
index 4325aa6672c..ddc6523e302 100644
--- a/meta/recipes-extended/ltp/ltp_20230127.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -24,11 +24,12 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "dd2d61ac1a1e09797a6165f478abd4a9f4f43035"
+SRCREV = "3ebc2dfa85c2445bb68d8c0d66e33c4da1e1b3a7"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
+           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2



Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0971AC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 14:27:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.24377.1709648821880044501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 06:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNYIcWIa;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so5528061b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709648820; x=1710253620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN6XmHyYmi72VrhB0RAGmjdcLCVuMws1lM8r6p9XXPM=;
        b=GNYIcWIavO8GLvIV+mITi+WTrmvzqeLjULdgKPkDsbvoaYO8A2/wjewY168NRxUmyI
         DyPb0KWRMD0TYy9SpQkMsAL5eoyxRsiEcLTmks6mfShoIXFKL5E2akeJRPuS56gT60Ok
         6kP0d0FAJSQ6HolVQI0dBRO0bRFc9d6WDzMKeIGcpHvV+vBfsgsyP57FThfqwTELxU7v
         jUEVlq8J5I+EKWs7b9WPCCEFzcjpkZwyvNH6JE3Ayyd+RjxY/dKlsyRr+umJtcAXoZKn
         DsvN6VZMJO1l8lL8WXYbHYSzsyMkzyYCQEnrmSdLBNYcYeL7b8S0S3yl9knf4f1K1I7g
         jhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709648820; x=1710253620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN6XmHyYmi72VrhB0RAGmjdcLCVuMws1lM8r6p9XXPM=;
        b=sPzC9BW1vLHNOFYiv3G7LtQ7B/YHr/QogR+JII/vwgjOuVNVBGz86TUgZVEPWsSvK8
         Ij9HFn/ruKQ1Sj/Mv/DMZ/jbzsnouX8RLuVMKSRUG3LUEX+WAgYF+/w/y9R8KtpKAzRG
         BeicCnNhvsKou/H88xpisKBxmC3sub7Q9ePBJhr4qDREn0/o4sdyB2+9jOiNW/VDDVET
         j2AlMNOJUVLlzoySM637OWWC4Ub734fVa9QlMiP4KqueVwVmW/G/eYRDwbsxK5cq/VZ4
         q+Ig7V7OFsrEnAV6CtuHT8re6LfZJ61CVpP9s1c82nS/jGanDYnGrhKeFDllUh1uMOZ9
         MgJw==
X-Gm-Message-State: AOJu0Yx3baOSCVWO6wW4Es+EoXeZtn26jmh5pg+mJ5wAG7qrdRL07ZQd
	OY6rF3aF9KMn2NXJPTsvESAzfDn+iwoJfAqvgS0ygCZABfIoMFaCn79I4Nru
X-Google-Smtp-Source: AGHT+IFaDwW2gNi54fqb4mOio9hhI2vftTWANklO58Kuj+pZLwnB0p+bYhvmjjmN8qsyL4tj+Zt+Sg==
X-Received: by 2002:a05:6a00:1301:b0:6e6:2dfd:602d with SMTP id j1-20020a056a00130100b006e62dfd602dmr4880791pfu.25.1709648819539;
        Tue, 05 Mar 2024 06:26:59 -0800 (PST)
Received: from LL-2887.kpit.com ([103.53.233.94])
        by smtp.gmail.com with ESMTPSA id v17-20020aa799d1000000b006e639616c38sm1397268pfi.124.2024.03.05.06.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 06:26:58 -0800 (PST)
From: Sourav Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] libseccomp: Add back in PTESTS_SLOW list
Date: Tue,  5 Mar 2024 19:56:34 +0530
Message-Id: <20240305142634.60644-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 14:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196633

Enable libseccomp-ptest in PTESTS_SLOW as
all tests are passing now.

Signed-off-by: Sourav Pramanik <pramanik.souravkumar@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0192146dbd..8474204fd4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -120,6 +120,7 @@ PTESTS_SLOW = "\
     util-linux \
     valgrind \
     lz4 \
+    libseccomp \
 "
 
 # python3 ptests hang on qemuriscv64
@@ -139,7 +140,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    libpam \ # Needs pam DISTRO_FEATURE
 #    mdadm \ # tests are flaky in AB.
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
-#    libseccomp \ #  tests failed: 38; add to slow tests once addressed
 #    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
 
 PTESTS_PROBLEMS = "\
@@ -149,7 +149,6 @@ PTESTS_PROBLEMS = "\
     ifupdown \
     libinput \
     libpam \
-    libseccomp \
     mdadm \
     numactl \
     python3-license-expression \
-- 
2.25.1



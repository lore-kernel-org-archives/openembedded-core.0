Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C1DC83F18
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:19 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.1311.1693417751040336884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bX9FIUjH;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57355a16941so20612eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417750; x=1694022550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kAzgKRq7afeF03E1voNEgY58BOCrIJc9WH8bQllmrs=;
        b=bX9FIUjH2Gf88iQEL7uc3LnVl0d9iViHeygpCQMYeFQqNK3FY+fWyARa8afClJtrL4
         YjgmNFc4dInH0ip/1OXVnoUCMYnIyr8ByNLhexRY9csuJ/W8MZk0IC6wg1/g7dUv+YdB
         3Q6M5L8L6wkgnOM0wXnClz4util6hk9Q0lK/+PEiXq9qMVr2rLYjDfd5qfZQry6NoPtb
         u8K+RKIgGrH4UrPobO2HY4O9OUbky8W2zfX6+gJ94qMNlEDW4ppNqE0No7xofu8q9SIW
         AoSaO3UfkzW1dz2GLqfazqAJ8pRx7tKA0fF8Bxf3Y0zSTnKw9izWRagQEIhZqBV+9jJ4
         hMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417750; x=1694022550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kAzgKRq7afeF03E1voNEgY58BOCrIJc9WH8bQllmrs=;
        b=HrsIuuPNAVNj+6DRzznOYMPFDIKtnyZQ9UmjrGhSBZRolxxSKnzT0KpXgnOueJtIum
         evTmy4NjL2rF5QsqLpUp/RwpF3hiytXf5LBNoGSMQL95RVEexP1xX/NhjlovUyb9vPhE
         Tvpq3WAbQtMGqgP1g4AhTCOsQ1pakwpwyK/Y8oPEsyOoS5CRy4nM2mlkowEhqNSGOb4A
         LbTahCmowRn4IYTlxB3rTxTezk8cPkqUrNsCgR4XEvzGwgezjZTJa1kCW8hTvCC2tT+h
         Z9hApk5Nbj1SqwLzT5HrJ7uxKd+O0ARiU7zh8qTXdFIl/BoRTic3A8U8HlJEISVv1XrQ
         mElg==
X-Gm-Message-State: AOJu0Ywg5DfIQnAL2qYDjOctWmXxOPpid2k+KRJ2ZVdtSVfg2A7eaY7O
	fXjYgUfoVf6+c4dTIgvVb8LQ7Ny8k9dBMu5P7/c=
X-Google-Smtp-Source: AGHT+IG+fUBFwYBLfdhygVQygdwskobiBUXSjGUmBv5yWWEsHtt+7/UJ2/1lmQlzYwb+BRsajaW/UA==
X-Received: by 2002:a05:6871:b28:b0:1c4:e139:33f with SMTP id fq40-20020a0568710b2800b001c4e139033fmr3822073oab.10.1693417749994;
        Wed, 30 Aug 2023 10:49:09 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/20] mdadm: skip running 04update-uuid and 07revert-inplace testcases
Date: Wed, 30 Aug 2023 07:48:22 -1000
Message-Id: <f39988353743e35418a730bfd6b9a9b68d946641.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186920

From: Ovidiu Panait <ovidiu.panait@windriver.com>

04update-uuid and 07revert-inplace tests are unreliable and fail intermittently
on the autobuilder (BZ#15181 and BZ#15159). Unfortunately, the failures cannot
be reproduced locally and the logs cannot be retrieved from the AB.

Mark the testcases as BROKEN to skip them when running ptest.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb219aff7cfe1cff1da93107ac7b22c678c0000f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-files-for-04update-uuid-and-07reve.patch | 39 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch b/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
new file mode 100644
index 0000000000..5a6bf9e4bd
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
@@ -0,0 +1,39 @@
+From ee594b1a12833c06102de888248a361bc49cea09 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 18 Aug 2023 12:20:40 +0300
+Subject: [PATCH] tests: add .broken files for 04update-uuid and
+ 07revert-inplace
+
+04update-uuid and 07revert-inplace tests are unreliable and fail intermittently
+on the autobuilder. Unfortunately, the failures cannot be reproduced locally
+and the logs cannot be retrieved from the AB.
+
+Mark the testcases as BROKEN to skip them when running ptest.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ tests/04update-uuid.broken    | 1 +
+ tests/07revert-inplace.broken | 1 +
+ 2 files changed, 2 insertions(+)
+ create mode 100644 tests/04update-uuid.broken
+ create mode 100644 tests/07revert-inplace.broken
+
+diff --git a/tests/04update-uuid.broken b/tests/04update-uuid.broken
+new file mode 100644
+index 0000000..197b35b
+--- /dev/null
++++ b/tests/04update-uuid.broken
+@@ -0,0 +1 @@
++fails infrequently
+diff --git a/tests/07revert-inplace.broken b/tests/07revert-inplace.broken
+new file mode 100644
+index 0000000..197b35b
+--- /dev/null
++++ b/tests/07revert-inplace.broken
+@@ -0,0 +1 @@
++fails infrequently
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa50325f1f..c367b633a3 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
            file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
            file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
+           file://0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1



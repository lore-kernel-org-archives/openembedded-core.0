Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661C0EB64D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.40.1687143375116421632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ndjWDfBe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-668704a5b5bso1202093b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143374; x=1689735374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4j6UxVXTcnxqiJCYLjhYj1L7okX6sw2gaqAV5BTkXo=;
        b=ndjWDfBexdygPGwpxMUe/urPMSZ7JWA/eEf4m7VkdaIjrHnUG1Zkov0JML/78zJBoP
         MARDISGqo1j0pddXXyKtol+DeOokhKsdndxOWwO54crAnNO+0/JKk1wQb5F/hh41utTc
         uIz3EReNnrdEHtsxHbTT/+c/YMp416tvsCl7ed6+FUeZGtbgFlfaiQi61A2F1SAGWDH+
         YJ5oM7Y2CWhTxblZ1YDXKNQ26zrKIYYiF5yurfTE+k+Smbizupu41uHrae1nuGYpvPLi
         OC0ZSRRVwtKIwaGZuzA7HrdgRLWYZaEEEja+httSjLAIoAc7gYjmKNf8qp+HaanjQHtz
         kleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143374; x=1689735374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4j6UxVXTcnxqiJCYLjhYj1L7okX6sw2gaqAV5BTkXo=;
        b=hL5tQg8WgTiny2p7Q4eMX8gslzdCSr+XpsyIOLPy92p63rTJQ1CjdCvZNp8Aor4SvV
         sTjD17kDlxJCpAeoZApljbyI2NDMoOhxgfGt8/ZQi4hC2qfhc+oXMM5Fubol7wp/YRB1
         StHCmGQX9GeVMppexidhznq6jXdQFTTgSsX8e5UXxZ8aYD+rim/Y4N41sdAd85nIgwmu
         AQmVs7QmUj8srw71coTmNy797nVSQJhLRtyaUvgOo/u2lfnWOVJWLMufFMQ9gZZ20DDz
         70v7iFAlUkLLavIGnzh0hAE6KB/Q9gT5O117F5ZlEn2F2alFPI0sAyHFz71fNTbFAJkb
         duuw==
X-Gm-Message-State: AC+VfDxg4K5gbzrYs/NlcdY9yTSR3s0u2SwVehleGaOJDjxH94ZQps1h
	OsvQglp2H2MjclXgZKV6We2JdvEOCmj7mFNmzfM=
X-Google-Smtp-Source: ACHHUZ6ZYs/dYCJNsZy2kDh3XdZ48UCJfx+No+lLTCco9e+eP/X8taHQk8s+W4oTsPt56GVaFsclNQ==
X-Received: by 2002:a05:6a00:2d8c:b0:666:eb2b:961c with SMTP id fb12-20020a056a002d8c00b00666eb2b961cmr9619060pfb.28.1687143374066;
        Sun, 18 Jun 2023 19:56:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/18] e2fsprogs: fix ptest bug for second running
Date: Sun, 18 Jun 2023 16:55:37 -1000
Message-Id: <3a5ce6f8090f912bb9744e8cc8f3f2510f351a33.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183084

From: Qiu Tingting <qiutt@fujitsu.com>

At second running, there are four new failed case:
  d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize

The test_data.tmp is necessary, but it is deleted by run-ptest.
So it should be restored after testing.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d0d08dd9a8a179e25b9cfcbac696c1d212a1910c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index c97c0377e9..279923db8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -8,3 +8,4 @@ rm -f *.tmp
 rm -f *.ok
 rm -f *.failed
 rm -f *.log
+cp ../data/test_data.tmp ./
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index 5b2d1921f0..68c620cf71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -141,4 +141,7 @@ do_install_ptest() {
 
         install -d ${D}${PTEST_PATH}/lib
         install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
+
+        install -d ${D}${PTEST_PATH}/data
+        install -m 0644 ${B}/tests/test_data.tmp ${D}${PTEST_PATH}/data/
 }
-- 
2.34.1



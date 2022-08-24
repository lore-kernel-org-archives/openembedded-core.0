Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB66C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:35:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.8023.1661322891973119247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BVRfg3KT;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id m15so8071990pjj.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vy2thfHtHcGoF6hr3KuubRsFhhw6adCmAm/PtEJGlR0=;
        b=BVRfg3KTpJgEEVBnf1wuV0Npijk8/hjLOy/dfY/jWzjUctaZYTfvT4b2e9ZqQydHtc
         vl7WgGR8koEHKA5O07FWYk4BZZ+AXx0ahRNe2gIF78t9A+E0ZiVZWGYg1IO559BP/FTy
         dLfdimHC30qEhV0HggC/EwktSpI3TDa3nTD8ooU3pTwVEgK3rIzsaJIBzJXW4c1jReaY
         GsZx/aqruxO+MKdJ/P45NnP0vQSYhZVVrCIPStIBX8LIeAUer1hvLQv7Mcs5ExVmbdfN
         IEn2kAo4OCFPAZF+DNfSnDdlzN74Sqci2hbgZ6g+wn+CmKvoq25p3ikt5nsN3SsDSfQb
         IZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vy2thfHtHcGoF6hr3KuubRsFhhw6adCmAm/PtEJGlR0=;
        b=YHV5Rju2yG8oDJXrDTJAY9xzL6QUIB1HI/UN91aVCGNAdDIOmDfxbsszZMu9Zb1bJl
         65avjIPkeMovsxuMCSZWo2+EO5I2ZYH0AjbJO8lNJ06vPzR95RkeGMnefkEu4TGeJMQ9
         MOjiHZDNmJohvKeo/yvf1Oz5eoFBDcl+XbZrOS2CUzi84IUJXUjPSTa76GelsURQU9Yb
         B7EBco4046Lg1f+z6k15sRBa3Fe6D0CLe7Ov9/LaTcR1zGczWFc0IJhXnLB52HTFCww1
         zRkduNZXFo5jzxxaBSmDz9/rzj9GwMCw0HukVbMBIPucluW94TywkoL/cDDGf0U0Jmk9
         P1rw==
X-Gm-Message-State: ACgBeo1JU6T5uI3xba9IL9BdAdNbX3Et4/f2ibCGnIb0SCpa5O15q47C
	SPqmcihyLUemioACmTcDo5uRBFrVjAJhCw==
X-Google-Smtp-Source: 
 AA6agR7at3Gcf+i9LqR0ogx9GfxCxxlbcWI+/G6LmFdEj+mRZ/CsJeMO5loJdAH0Li8sr25J+eoHWw==
X-Received: by 2002:a17:902:e848:b0:172:dda3:780f with SMTP id
 t8-20020a170902e84800b00172dda3780fmr15718159plg.66.1661322891159;
        Tue, 23 Aug 2022 23:34:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/7] ltp: Adjust types to match create_fifo_thread return
Date: Tue, 23 Aug 2022 23:34:43 -0700
Message-Id: <20220824063443.1774094-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:35:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169781

Fixes build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nt-instead-of-pthread_t-for-thread-I.patch | 36 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220527.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch b/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch
new file mode 100644
index 0000000000..e49f53a9e2
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch
@@ -0,0 +1,36 @@
+From 11e503344c36c1c7df3e455d81736dc4a5b43775 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 23:20:53 -0700
+Subject: [PATCH] rt-migrate: Use int instead of pthread_t for thread IDs
+
+pthread_t is opaque, but create_fifo_thread() returns integer therefore
+on musl where thread_t is not integer, this fails to compile e.g.
+
+| rt-migrate.c:450:14: error: incompatible integer to pointer conversion assigning to 'pthread_t' (aka 'struct __pthread *') from 'int' [-Wint-conversion]
+|                 threads[i] = create_fifo_thread(start_task, (void *)i,
+|                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Align the types used to fix the problems.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2022-August/030239.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/realtime/func/rt-migrate/rt-migrate.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/realtime/func/rt-migrate/rt-migrate.c b/testcases/realtime/func/rt-migrate/rt-migrate.c
+index 3e6c82a2fb..97ab604c7f 100644
+--- a/testcases/realtime/func/rt-migrate/rt-migrate.c
++++ b/testcases/realtime/func/rt-migrate/rt-migrate.c
+@@ -394,7 +394,7 @@ static void stop_log(int sig)
+ 
+ int main(int argc, char **argv)
+ {
+-	pthread_t *threads;
++	int *threads;
+ 	long i;
+ 	int ret;
+ 	struct timespec intv;
+-- 
+2.37.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index a547298828..09c7250608 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch \
            file://0001-lapi-pidfd-adding-pidfd-header-file.patch \
            file://0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch \
+           file://0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.2



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D01C2BD05
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.55029.1718625949592228402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AzDtnNgz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-703ed15b273so3245786b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625949; x=1719230749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHqO/a0AGgNOk7bk6jwUzO0ZDfu7oXd3mqL9u4ju70w=;
        b=AzDtnNgzD9usKRAbYVAeNBbBCkaYubXVdfIXgkveqfVS6R9WRLplNEzm199KZCG+8Q
         2jP3NkaxECTRtLpv3k3XJvDu5mImysCajnmogPq1H1S0nEr2DZ0XjCfNVrSGooCSGMqa
         IT/P5RYbuAUyZB07rRBByB/4kFuzoZopuUCx+/1WyZMiO90B23zZmL/T4/fIjnqKaTwQ
         QctjbBmY0SbNc24XWSR3A7ajHbVAjkM4IEUZxST9v/vzNfSaTYEaSREHyiMQ3SuxcN60
         bJx2IPhmnkV9rk1V1PQfVibX2V5NfVSx0n4N2NS31leODern2fOe7d0/GccbaGSvn8bW
         tHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625949; x=1719230749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHqO/a0AGgNOk7bk6jwUzO0ZDfu7oXd3mqL9u4ju70w=;
        b=v+e0jpFDZZBVB4Ct8LumwHfSsPDc6jFpxby57rTrDzEtpmIhOa50Ff4kp2Y5vecrkg
         KUjs8qXT1m9nokJAgA7odyn5O25FNk0kvH6fJTARqlMh3cOYWZKrKBjJw36Ed9fVLYZ5
         tQpDhjkW4JKy/rnsyE/nIqD+azRKLyr+MqwKr2Y/kwnfbnD7OWl94vatWKbsj8GNSz7E
         0aOHuUrKdiRaQDwQ5m6oX3lGJuXFInTlkRIxOG7lpUDgcgtnvWjk3I9/4SebAdznHoul
         SZv9dtOYg7gEiZAc1y3OvxrXpsRckHnCOXXVKVc+zU1sh3mf0i+OUVZkyI7JuDf1WCJb
         jXxg==
X-Gm-Message-State: AOJu0Yw35VIcZ0sPgOvRgMonX6rXMLMtAzOLmS4wmjtNe4F4eMDDoWYi
	qv3u6rMJiEPd1jNaPRJVS3NQVg6+ABp622xqH1tJxw13uWvr0v2Tzb7Pypz8PWnahvHKQUOzdE8
	Qafg=
X-Google-Smtp-Source: AGHT+IEYkBgaYCqKx2CsBZSaacb0VqEflwyirZvyUTzWtJ+ztR/lL3HUw5SMcI5jpcoMpeSmibAyLw==
X-Received: by 2002:a05:6a20:258f:b0:1b4:4568:4c40 with SMTP id adf61e73a8af0-1bae7e149d4mr11556202637.12.1718625948818;
        Mon, 17 Jun 2024 05:05:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/22] ltp: Fix build with GCC-14
Date: Mon, 17 Jun 2024 05:04:53 -0700
Message-Id: <42c5a8d52f6f01ebf6fd441e5cf7fd2cd771cfd4.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200826

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d3bea7f817aee6eb053eccc22f5c35f8a3d3668)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Use-time_t-instead-of-long-for-type.patch | 54 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
new file mode 100644
index 0000000000..ae8dc8706e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
@@ -0,0 +1,54 @@
+From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2024 11:43:20 -0700
+Subject: [PATCH] sched_stress: Use time_t instead of long for type
+
+This ensures it works across different architectures
+Fixes
+
+| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
+|   744 |         printf("\nend time = %s\n", ctime(&end_time));
+|       |                                           ^~~~~~~~~
+
+With gcc-14
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/0a682f1af42d8d261202821be580fe26d17ee9b7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
+index 61573d788..5b8c187fe 100644
+--- a/testcases/kernel/sched/sched_stress/sched_driver.c
++++ b/testcases/kernel/sched/sched_stress/sched_driver.c
+@@ -136,7 +136,7 @@ int debug = 0;
+ /*
+  * Function prototypes
+  */
+-void startup(long);
++void startup(time_t);
+ int start_testcase(char *, char *, char *, char *, char *, char *);
+ int process_slots_in_use();
+ int available_user_process_slots();
+@@ -251,7 +251,7 @@ int main(int argc, char **argv)
+  * information to the screen and .  It also initializes the	 *
+  * process id list and other global variables.	 			 *
+  *-----------------------------------------------------------------------*/
+-void startup(long start_time)
++void startup(time_t start_time)
+ {
+ 	char tempbuffer[50];	/* temporary buffer to hold names */
+ 
+@@ -734,7 +734,7 @@ void kill_short_term_testcases()
+ void finishup(start_time)
+ long start_time;		/* starting time to calculate elapsed time */
+ {
+-	long end_time;		/* time when program finished */
++	time_t end_time;		/* time when program finished */
+ 
+ 	/*
+ 	 * Get the end time and calculate elapsed time; write all this out
+-- 
+2.45.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index e88e931a68..f8e6d3987e 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -29,6 +29,7 @@ SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-scenario_groups-default-remove-connectors.patch \
+           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1



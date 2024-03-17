Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E39C54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 12:02:06 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.17232.1710676916089915574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 05:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVqo4o38;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a466c85ae5fso83196466b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710676914; x=1711281714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bkz70wDSIVYnmyqFU/THy/PevVAR7jFRV8EUk5m17rU=;
        b=bVqo4o38Fm+/iaFwzAShlGhxkq1omLe33NoZtLiuVQ+EShz3jjqWfqDYHugJYudkAE
         kdwYkpST/lVWvfMZLZL3QBqVrtuxsZqCe1gbby0UPwWyFwHr6XCclng0uJmPBvUJ/o/i
         LPe7HwwWqzAs9lEbfAFl7aqf9QExkNqoF7/GGN0GkpSpBhR5Rw4vnPmPrrybW7kH1cJb
         0LmFDvtlOITAC9Kzm0lg+DPLzkV/yQ5FtMDfABKpNHaX5AlZx84I3HKX8tbIU6BTStHE
         OJzBaN+aV5UYR4d7ah/0iLoieOgN7NLdL8t/CiACiQTkoxiHyNsXE8wZOnbY6ISW+no3
         5oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710676914; x=1711281714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bkz70wDSIVYnmyqFU/THy/PevVAR7jFRV8EUk5m17rU=;
        b=iFzUiIm7/xL2T4NRTN2Z1ittza73ymmbaA3A8gmvJXmIN2tZXt8FevLbAM+L+ZYwnr
         UY/aApTuCGu6iaJ5T5fbGg0EU1WjyHWknccgEMGwH/maar/VWAV1q6UEY6np34nGn65+
         W6PPRQIqDPg77bntVAHuVD77pPjZVnl2+NhoYZB1AUHGUenkLspkCAUCu6HHWII76gBt
         +QpU0bJHeqKo28Yv7xSnhg3+GPjjk9mDgrohmIHyji0HB1CvYWIVofRh+LVHOxsnHq/A
         r61y3xrf0wdzM77FAl0VZjtvWC+6bR76c6NxRl42NoQpioq9pcQWleyGl5sJ9Ez96Uah
         gRQQ==
X-Gm-Message-State: AOJu0YzCB6X+okpY9mK2QbiIUgEQwdbPuL1kp+VymTx1PFQMuHVd2duN
	60x4jXENcAwtCjyDLrGHqHt7VpkIEN2nmiK+mkyAc4Vc7xY6b2EFvdw1vpGq
X-Google-Smtp-Source: AGHT+IFgS/n+EJZ6Xcpw4209mBq5rqx/DmFzSgBHhtn1/G9pQvGPuYfoNlszCsOnCwXbO9CWX4JEZg==
X-Received: by 2002:a17:906:1c4e:b0:a46:7e07:e66f with SMTP id l14-20020a1709061c4e00b00a467e07e66fmr4456627ejg.0.1710676914273;
        Sun, 17 Mar 2024 05:01:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h25-20020a17090634d900b00a454438091fsm3703394ejb.70.2024.03.17.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 05:01:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] stress-ng: avoid calling sync during do_compile
Date: Sun, 17 Mar 2024 13:01:38 +0100
Message-ID: <20240317120138.180013-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 12:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197260

calling 'sync' from do_compile in the middle of big OE world
build harms the build time.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-Makefile-avoid-calling-sync.patch    | 35 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.12.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
new file mode 100644
index 0000000000..fec8c524eb
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
@@ -0,0 +1,35 @@
+From 1d1801902a4944c6f5fa521c19b32fbac7342a0c Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.i.king@gmail.com>
+Date: Sat, 6 Aug 2022 13:05:59 +0000
+Subject: [PATCH] Makefile: avoid calling sync
+
+Original commit message:
+Makefile: use ld-gold if it is available
+
+Speed up linking by using ld-gold if is available. Add build
+time detection to see if compiler allows it
+
+MJ: backported only the "sync" removal from Makefile as calling
+    it from do_compile in the middle of big OE world build harms
+    the build time.
+
+Upstream-Status: Backport [V0.14.04 c10e5c3f9f5560a085279f4c4b399c2f34cb897d]
+
+Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f8f71c54b..23db4c612 100644
+--- a/Makefile
++++ b/Makefile
+@@ -425,7 +425,6 @@ OBJS += $(CONFIG_OBJS)
+ stress-ng: $(OBJS)
+ 	$(Q)echo "LD $@"
+ 	$(V)$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
+-	$(V)sync
+ 
+ config.h:
+ 	+$(MAKE) -f Makefile.config STATIC=$(STATIC) -j
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
index 807ecd3466..72dafddaf8 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch \
+           file://0001-Makefile-avoid-calling-sync.patch \
           "
 SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
 S = "${WORKDIR}/git"
-- 
2.44.0



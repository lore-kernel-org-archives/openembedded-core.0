Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D89AC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.4315.1742272750007022719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTjZyUOU;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224019ad9edso48082785ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272749; x=1742877549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=iTjZyUOUT074j0nEAmpiJB8ggzLo3sv39+LaBZvdHHys2nULIukT2EhBstnPKML2mg
         6HsdJN2ynkwfke8EnAf2bXl2Ty2lVvCR75xwYVMiOdciSI7iZPYmmv2GQEO87vsDPO7Q
         bnmfY4LznaocUYaYM0LXVIqR+CLB2VOu5LO0J8OgeeMk4UoCP1cHnTkcUdwsbNJ15Ih5
         rLHa9VQw6EXtAR9vOutqsHPxxxrhwOHyWSrZSoFTydtemRe3DcEYw2Es8OdtRafAskZn
         nXQPcOC1zaPb0rBaTOc6BUHEcgU/+yiU06OII/dCcGKxrOUBIy/OV9XD5c8wYQxLaiOl
         Nw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272749; x=1742877549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=BW/LHbO9UIN4f4gcKMgBETnZZtrabXUKnZVqSA6ppyyhPDqMOQb4UvzY1XMQ/xlU35
         bUI4jIGsQv+FQSj+mHXy5v94Xfemq5Vm5jHCM1hBnUD01ORZP9YfQ1EH0I8iVeZhEbdN
         BQ7kHpZnrGJimmme6IG4TWpbz0dreWJo+qtYFuCMs4Gwi8sn5cVcEA++kHJoHzivdX0p
         xneDk6JVUqQ/ugwM2vfRz9kO3KnWKizF/u0v8eMtQRQgzKJJaeJMDAYElWAse3XFmls4
         V5c9ocOk7uoZWoeRASJjFIQEC7yD5TvkJc9S/wKOGvqzsTpgi/S3Jxo3faXc5ELrJhp3
         l7OQ==
X-Gm-Message-State: AOJu0Yy8uwtgUxlMCEtitEUXnDEKp6iJZCHIrr+SKXnzMXzzVs9lCMZI
	D9aTMBOscKoL8CDex32L3EDVvAoSVspZyVFCp6D5/FHnypj9DcAjn9fKQ73N
X-Gm-Gg: ASbGncvh20kzoShwq0d6Dsxrrsw97uLgAIGjQbQxYMYS/2LJGjkkdI+ZS5E2GNnSFEx
	WSmI1slvnYcCyHQs2Bem5b8p+IC5FUK/lBeD4wd7VVR+dtYwlONnS8vnu/7pHLewe9lWDXruU2O
	YTssxKMR04hPyatT6o3qLH2g3y346UlTNkFUC+pQwMH2HVbVgE5/zal/TIyOZRL3NEBCaGN12h+
	pK2SdXLE0y3YR4Nyy7QuFIk4/gAlwanyuD/GvdKamgO3dd8bINKmQ5ZwswyaVyS0ba8RhisequO
	aUbD3Zn9SMkAZwq0kv4Unr3ngxkLs99Axux2
X-Google-Smtp-Source: AGHT+IGFW0MheHqRNoRaFy+hnWSRtI0rrPG/tI1mzu3JATunSChOzk8diwgo8RnoZ6ABPdkloJkKAQ==
X-Received: by 2002:a17:902:ce89:b0:224:13a4:d61d with SMTP id d9443c01a7336-2262c55f498mr26372115ad.23.1742272749144;
        Mon, 17 Mar 2025 21:39:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 22/24] time: Fix build with GCC 15
Date: Mon, 17 Mar 2025 21:38:42 -0700
Message-ID: <20250318043846.2422141-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213156

Initialize interrupt_signal and quit_signal with correct type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../time-1.9-Fix-compiling-with-GCC15.patch   | 33 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch

diff --git a/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
new file mode 100644
index 00000000000..76141aec18c
--- /dev/null
+++ b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
@@ -0,0 +1,33 @@
+From 831194f0be7733c99c7a2c69d9e9695b82e05010 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Poho=C5=99elsk=C3=BD?= <opohorel@redhat.com>
+Date: Thu, 30 Jan 2025 08:48:47 +0100
+Subject: [PATCH] time: fix compiling with GCC15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC15 complains about incompatible pointer type in run_command()
+Initialize interrupt_signal and quit_signal with correct type
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-01/msg00000.html]
+Signed-off-by: Ondřej Pohořelský <opohorel@redhat.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..c8d7ab0 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -803,7 +803,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  sighandler interrupt_signal, quit_signal;
++  __sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
+-- 
+2.48.1
+
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 8364210e61c..d9e2d06b32d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
+           file://time-1.9-Fix-compiling-with-GCC15.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"


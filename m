Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15854C36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2928.1742372198517078823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTUosQoF;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22622ddcc35so14505865ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372198; x=1742976998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=DTUosQoFpzHNBiOirEglNAla2G3hUd2exkikN/3FmbgeZx8oZL3dPfWxE+qV/W0sxx
         B5tYgESjNU5zRyntxxE4tNaYriuSCsYPie1WE+LOOtpC419wCVOUIZx01MiuzcitVGXZ
         PRfeEkwLGG1rVjpulb+GNZmWptliwlmg58ZwY3CRrd71mlP+3bt0MdCJKlXyi4wah3kQ
         Ns3DwUQydbZUKtWZLoZjeurfU+45X7kgPF7ugz/1gFP0c2PAhP6VDfOXFSbs6EayKo3A
         rZ2mphm+q7SAoLoxIcK3lkL0qr75aNXjRJbDx+zH4H570jHDwZvfUUoNLqGh3jeVI+Ii
         2H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372198; x=1742976998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=p4JdU+0QMIm/OV9gw6cHlzH6bJzTXkbaI55u4RPW8cQ188VawV4cAIpOArw2xApIEF
         /xnrjfHZREOz7F3q58s57fGE+iTt14ucM4tIKBiV08SeRIrZl+VsOjmzfJgJZ/1CIeSE
         9+dQ+ezawtcwhqFC11B8xfeit/uiy775HYA7xywMGg64xRHd0jzV+8kcPVYQSRJ5mHmJ
         aVCWiOQ7VGlAhGL0Rdjk2O3KO4CPNh29tD7e5+6FzpzefBHysGQGt5If4Vv7di1gR2Ro
         TNbbSX/eXm47q31t9vrrRXTsxnUjSw6VlPkbkt3JQjh7KHeTLDbbBa8li+MgSZwVv8Ap
         +Vsg==
X-Gm-Message-State: AOJu0Yw3e6qJ8JN3pCaTpl7tMJDWa908qcOYofIKGjEQfMU/o+bnPw6i
	D2/TUR8VFXSpDCa22fFFtWewLszVGpCOpY9sjY92CLfNy931oopVKkSPjEDW
X-Gm-Gg: ASbGncvrs7BCVADeTGYQBT/OsJ45FxaB7RRVJZu5u5rQGh0smABLsJdC7IT+h+B1Owa
	nHgcly4EHJtuGq5keJOfhqi6DPB5r759EpIwxdRoTkjYzehgrOQkKBRJMXemuxPjtFNzNiuSqlB
	ogfY6Xl0vxy6walK80vNStqgi0NJfm2VWdLhKhhIQGaqDt9z795xv0v44Y1JBRwr7gH9cGiz1qB
	G5QQ2pYluDnDtpzcuF1RmzSX3u7k4fbNovRfZCLfw3i66SEUUHA2OIKwcb0YEQbpGw73lDoLsfz
	nyNyKQ86OjYTd4926mQbcIGUqIFS2Xs+nW9hOlTlBw3a+mk=
X-Google-Smtp-Source: AGHT+IFwfIWGaDs1O3S9mRIvldR6h7N62ifMAGOs32oSH5nm6HGmOnfDzZHdDo8RnSXoooXF/hUHEw==
X-Received: by 2002:a05:6a21:9105:b0:1f5:6f5d:3366 with SMTP id adf61e73a8af0-1fbed40bbdfmr3811767637.37.1742372197700;
        Wed, 19 Mar 2025 01:16:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 20/27] time: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:57 -0700
Message-ID: <20250319081610.3536475-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213295

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


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC45E6FE38
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108977.1766524974963470542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tp//gnOB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a07fac8aa1so58158155ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524974; x=1767129774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXg0nnNAMtvcNF86cbAtrT6Or204nszWW0tgelCu0DM=;
        b=tp//gnOBUuWDLFjyUPPHH2imBQHYclNQlfU/z5Rst3mMyStNp94AeHzCT+z5CyJuKu
         TMAXThxsCRznLXVCrpI3zYhjLOUY5r8PgZtCKITd4nS06PFsOzdsfex/kHTSfVuSv3Yi
         eALzIlDSrVHn4y8NvGqkZltcGj3CD/PD/7ZIGqXZ4gho8aCcITFr5Ud6eZQiw7YXG2X9
         GiqaJIV9+ue2V8Ki9SQwBd2bWgoeSNab6eP3p0Eg5Z7Omslx3g2/W3k5hc+angAxXJpT
         KkVt/ErGg0hCLobhlLZk2V9l7avpEkILG+5VSXKNzqZd+bvYcL1NSFgfHIWnKBzK7udu
         2mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524974; x=1767129774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXg0nnNAMtvcNF86cbAtrT6Or204nszWW0tgelCu0DM=;
        b=ezM9pRlmfahyOeOVTKijT02wvnVVi67UYeyberPrOL+Bznw2cQ6Ga1wrNMZIFLRgJ1
         qe/cr9ZTR1DmIPsF8c5Vmwwcj/tA2H+6ryvNGtZcQRc2/k/P+So9OpILCk3yr/+40wdu
         o+E0bHMKYU2XOGofCoVTCCBZTf8oS+7RQwQob3x1rt6+QKiZGO5DI2hqyVespNc2L7hp
         Wa995UazXQm5/lWaGaJORf7htk/uyddJ0ZnbcGCsDtYRhz06VBg6ErTrxMCSDCwq0Mdg
         Z03RDVMh04gL6kyS6/XT4KFVgzdjMmCQ8u3XmvsI8mWhxq7e/gN2VLHTj9nxzfmu+3fY
         9CCg==
X-Gm-Message-State: AOJu0YxKTZs5GVlDSBit2Lt2XGF8BPaB6dXwygwoajCQ5qMVTKEJyq++
	IovbOHE6X+PUux0/MTtqcQZNSedQJSmMyOpRwOvjFnCc64ZLh3LhyW6XoMbqJWLQFvmoC7n1I0Q
	lo5MK
X-Gm-Gg: AY/fxX7WvcjHjMKcDPlnQ6nF3bUDdCM7+DB5y5AB/dqI8fEhFwebqGjU9yENv1KYCrb
	bsw87+F2/FRKKuIPL8lzNwjwZ33umz2mIqA6WJTNqGsw/k/df78JxEoIjgisYx1Tmo5z+16Gfkg
	S8uFKsbH1KtdI8aF4tmYFySn3HOt0Qf1SSMzkRh6T7SJG6NlLvUrXORcAlStoItcNt/b4htn76h
	WE3/MP43yTeZQ62Ze+tcVXm4IIzyokDrWt0TDT7yD7P47NafXwEeGLIM59J9GfuFTvD1XLcKnpt
	adLd3nvX4u5nAQh+mhG4Xiqc89NtmNXrUO6QTtr3Qnl5vbPKWbIkTX4MEuF+kSzpMm4QhlVmUPQ
	KKGCaO4NBAlp6u5yI1GlgWb9G1tfbQohSNOcYV1FQMvCXuwW67ZflRc0Pbo+zlvB5DOroGOWaAe
	870A==
X-Google-Smtp-Source: AGHT+IEKWJ4YXyqq93wFRKPa2PCUP/gS17xa2+L6eaORq1EgXJbL4pCvEaoRFoi5BvHaK0wXm2n7WQ==
X-Received: by 2002:a17:902:fc8d:b0:2a0:ccef:a5d3 with SMTP id d9443c01a7336-2a2f2202fdamr178415925ad.3.1766524974036;
        Tue, 23 Dec 2025 13:22:54 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/18] binutils: fix CVE-2025-11839
Date: Tue, 23 Dec 2025 13:22:14 -0800
Message-ID: <d60c144e082d6e6db4f9971bb886751199cd433f.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228482

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0029-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 69c5eddefb..e045ccf00d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -67,5 +67,6 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://0028-CVE-2025-11494.patch \
+     file://0029-CVE-2025-11839.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0029-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.43.0



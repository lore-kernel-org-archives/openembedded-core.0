Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5695CEFCEB
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:41 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96791.1767724112277846896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TGAkYre1;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b1bb9c3c04so24231085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724111; x=1768328911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCNmqatRkTI5xpbleR5UbIQzoEXgsWdlPXf0o/X528s=;
        b=TGAkYre1BllQKpX0AHHPQ96IzVablLCs0ugUX3ByVlabLMbYtBMUbawyyLBNXhBXWs
         hJtyp8SOyiKYm6fYQ9uiL/zp7J/fjhMvCr8pMcqZvYoTbXXx7pgp7fF4INzFJp2B+foi
         8LNeX4Tof1xXjPtrSaJGEUryoPRMF5HsiurBwljaV0N69H63STJo1CJObnDyFknhyREp
         wQzszyBBDzKD1qJSmE6Jx5uGmM/unVtG5pZvR02zH1gEB3+WgsPHOLHOw2sLYFiQjBhG
         axoJY7N5sWw45VlLRDo59lTeppcsdZljrChA3WVxpIRHVC+plPPIt76pHnsdV1wsk1tW
         ddzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724111; x=1768328911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCNmqatRkTI5xpbleR5UbIQzoEXgsWdlPXf0o/X528s=;
        b=HKk4bZsNRJ4b1jIKYK8zMhdHhrRDrr3d20ysA3znXI9nZ8BrDoU05DMO3hQ6fg1/X4
         zI+yd1BbR5kuAfLnV9FdRfPsRdpBLOVBbJg7gDsOS5r1wsJl2CCmfR1EthvDR6Vl4nZz
         zxFpQla4L3fSvCeJ6Ons6/+rPIr8wYq4s66Bc4QijZ7eOUvMx51dSH7WhKAseRj0vGj8
         nlikJLXocvzc6Krl4Dj8D5Npy/MHfcBcF6jmWSnJisnmwaaIoaISthXUtczjEJyZveTI
         qhjs+myT+GyILYBtwyfzcQVSSRUAFWkvX9ydCVG0PiQo42Zoiuay79x0NBw6o9oyk1UD
         dyYg==
X-Gm-Message-State: AOJu0Yym9KH+wVIsWL7Q4iw1mjnFvZwXUsgFmrBoM4vX2m4f7y+JYp25
	OF4ZyYuMtAhosY0Hx3UfCys1KTiFEvLoibUu0XoBUUY7Dx55RziyuYwborA3SFQekJM=
X-Gm-Gg: AY/fxX6yo8LLwtUQVojDL7EQA+duir74SmFqBTs5Mv4uS9wmOKRAyVFztdWeJoPs7fm
	z3LG8bUHP2ZZsKs/AnZvxy4b6cx0GggeMWWYNagZQBY2IECQHJPx+8wQYr7zSPAbR4pgLJtIhuM
	HFibznjbg0CWJ1bcWanU8Gm+mzB0Nb5NiRH0d9bcovnwmesDOz8mJloaUA2mLYldRhtKpltBjs2
	2k6bvvXrO5/iVzGxpGNIgXO6kiYNU3b7ZLah16ePrAlfdlEgKtILgI3DkpjIP4UYjaVgwHnsShW
	cc4/kfK4K4AbkoJYMqzB3YXK33GAF1kWDLGk2KoVKVsotodk2imtFE7Wbsss5Om54dnO0PIcYdG
	KrOvh1MGl/fM3RBb6Fg+yRbQ53jGVuYLXnhmZItMf5yhdi1FretReoIYyAdtq2CDAlp2AKAbpU0
	0URcHW3ZF1riNmYe0APNMqqFi06IOHn+AqnqQyURRdOTVwBEhfMaBiPVM=
X-Google-Smtp-Source: AGHT+IFSvKNcNB0hzZBLdEFoiTXCh6Wq0G/Jgfax2RhNHncCxznIpz6ADelhHREZBOSIZHgDSmu3Vw==
X-Received: by 2002:a05:620a:708a:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c37eb78784mr390554785a.5.1767724111191;
        Tue, 06 Jan 2026 10:28:31 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm214003185a.4.2026.01.06.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:28:30 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 4/4] linux: Add inherit on generate-cve-exclusions
Date: Tue,  6 Jan 2026 13:28:22 -0500
Message-ID: <20260106182822.3377881-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
References: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228912

All kernel recipes can use generate-cve-exclusions class to perform CVE
exclusions.
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 3 +++
 9 files changed, 27 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 9ac8507f9f..5cc735ae93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 1230e4e805..53532b4e7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 32ed29f25e..e95264d99d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 940561352c..6b17c2ff7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.12.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ffa15b0c1b..02e502faed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.16.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 2afdc02467..e36a7fb028 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.18.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 84419f8c78..b6ac5f9b90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.12/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.12/standard/base"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..947de4186e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.16/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.16/standard/base"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 562a997020..66320f7123 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.18/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.18/standard/base"
-- 
2.43.0



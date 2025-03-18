Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103F6C35FFC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2948.1742323143696513330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQBpdnMU;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so6917668a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323143; x=1742927943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=mQBpdnMUtHEmXP8BFneIMIAHglomiK/mfur16abEWdz/4xRYW1bFbjbwr0hHj09Tgi
         ht8y28efH9VxjWlBTAZWnfJ1X+QzmI/s1BMGp7c5js+jO7t1eLDXdrTP34EwhuPdx26Z
         0yhyMi1BDuKfDoJbg8IfoCzkhqa/xw38d0dLNwtwB6rjTJvee40jF2yXMIFBCEdLQ7dN
         NsLh76MvO27X9zqbvzNemL+abcRnxPMW5YD47XX0HMr7QqqUlp3HWDZ2QXPdu2Jj9mne
         aeGrveik/Sht9bnesgtj7UPec2tonTCV0jz63CuNJolZ+Imp23r4Au5JAh6Ol3GZo3iX
         +8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323143; x=1742927943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=DHuw8zIdd51Jy8sxTt9udtnrZrumDVT9lSGCYELGt6JOfnC/DUvf9zcsXp4aoTFagm
         Bp8aiZAixj86/1jlhNvi1lQ2H98IJgTF0v2UZPufYv0VcEzUUcdHqr6ygoLMx88A0z6J
         QXfi7V9NQv6RADu7QRxj4sMo4VNVuPDK5cp5WQxd3CQC8WkACrl36QmfHXHGSPb2g+94
         BMMUHm0lyJmABD6uC7A0i/ylfl6IzlUIKwUVTFx2ZjqnoR9ZVQNe1qv5vSS2QyRtYu8g
         3F5uSx9CvIrU3qt/cludMhqWJ6IHPkpfVBk11bkSc92g6bTzPFoe1dCR7jYkCQjVxZ1J
         upMA==
X-Gm-Message-State: AOJu0YxBRzLbnGnd6Q1wfUDgQcbPaMOGUIl1Vwq7dnsqCPWM/+CezZWM
	0DJxjNfNip8/B+gbjRsGiMd3Zl78LjiWlYHcE78uoKbsQWB7ixRxUOalCnbM
X-Gm-Gg: ASbGncu5tjBAevp7gdoOSqJfC9tpSfd+VDIW+uQrjNh4gAkf2H4/TQYFY9JC97gthzc
	47LxsLXmRHRulWC0oCr3rG8eN0nx7KH8GELp0uJHiDjZoKxsCjFMsyhB6Lqx5GLQ5GgL3CF4rs4
	VUsRNbfxxZQZd6t9qljGArBR1E7EuyPSj8/3nBnenm9Qsi7y0SCeLP2+3euHinIon/5yrJHSC1n
	8hOmjEdM6R5QhsqS29hO/erEe5TS3y2/f/WVIfxZj5Zwh+ogzBD49AXe7TxLbG8GOUf4hQi2MuP
	Ry1ONDy5ljy4e2KpaqhALzmGzYwThz4A+pAH
X-Google-Smtp-Source: AGHT+IHdiPPxKrDN8WLNxcjyecYQHh8XbJ/S5/VX1qGb9LeTMOK4v39d4iROjMPtq8FxCU5/fpwirQ==
X-Received: by 2002:a17:90a:dfcf:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-301b9ea15dbmr408363a91.2.1742323142860;
        Tue, 18 Mar 2025 11:39:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 22/25] psplash: Fix build with GCC 15
Date: Tue, 18 Mar 2025 11:38:37 -0700
Message-ID: <20250318183842.2256284-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213248

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-bool-if-using-C-standard-older-t.patch | 32 +++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
new file mode 100644
index 00000000000..cc5f2e02e65
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
@@ -0,0 +1,32 @@
+From eab6948cd8eba493f2af7533a931df5ef1d30715 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 20:31:19 -0700
+Subject: [PATCH] psplash: Only define bool if using C standard older than C23
+
+gcc-15 switched to -std=c23 by default:
+
+https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+only typedef int bool for __STDC_VERSION__ <= 201710L (C17)
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/message/1213]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ psplash.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/psplash.h b/psplash.h
+index 1c42ec7..138e49d 100644
+--- a/psplash.h
++++ b/psplash.h
+@@ -37,7 +37,10 @@
+ 
+ typedef uint8_t  uint8;
+ typedef uint16_t uint16;
++
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int            bool;
++#endif
+ 
+ #ifndef FALSE
+ #define FALSE 0
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 233c07a380c..e47c9b408dc 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,6 +10,7 @@ SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
+           file://0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch \
            file://psplash-init \
            file://psplash-start@.service \
            file://psplash-systemd.service \


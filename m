Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE3AD7308B
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 02:38:49 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3641.1775183925428531003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 19:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZzEOTE9p;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so2092367eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 19:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775183924; x=1775788724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE9/NFkV/+KmoqYAj1rbI4eePAn2pN7oDPMUtdMkSqo=;
        b=ZzEOTE9puJ5fh6uM6J3ATFM3cZWL7BM+QcOahTIx/QjhTayPKFLuzaXV7cGXUikK2Z
         DQjbKOZ1NPvEzuaeeSxQ7nr61oe3OeHCdiln1xGjaCXgoi3YwCb2fLXei95PhYJYKMb6
         HG912+q868b1sWMZF0G1/Fxrh4Nsv6kUwGVL5rZ0bRbUyVYGDy2uFPBPG8+4Drvww6Oh
         mo4c2oiX9EmYl+8Hn8043DZwMF+yCwC3MBMSOQiv4fsmleNZEG2Z/sNB+xPTCvC9k3Dj
         meK9xRBUOlC1en7ukMehaIVT+UgbuzNY3AmQO68Ml0LQIYvHuYZ0HQXBF7Tbt/Ut/06z
         SsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775183924; x=1775788724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE9/NFkV/+KmoqYAj1rbI4eePAn2pN7oDPMUtdMkSqo=;
        b=KFTufc58U3p9RPNfRwb3+u0kjkcXPIQ0v0S7TZlSmWS9PEcMHVm9rz1kQffwb/hkUF
         KwUzJZU9FwOIAYtF8A8hiIGcmwHeedo0OJvdebbVbILh1Tns8IhMx9eQ1Iqkp3UYm4dv
         E8l7GlZtruZXEfwE5FaBERYooznUC1vktqUAnXQAwlUo5F9q5hRAyiwlZs2vpe5f5K+N
         GdpmRTpwuh27quu7mvVvu5I8vpdBkXuWttRDvwum+Bro4WO7lifFeIAgFpxUI7iProG6
         BuEZrMO0B0Fv87O/vjzKKwZyVDwvf/f4tFroO8uC21sp7B38g5kSFv8DQxI26sRqY4FF
         HBxg==
X-Gm-Message-State: AOJu0YzeZ4+xhusXUzjcMr/XG0rDocq9IYV2dDAwSFpWWMZ7JKXlFH1f
	p1fz3Q4S4ek99tO1A6G2uMKYltdJQVVtF0rkUyyVLQoJc66/5EZCBqwSITQu0Q==
X-Gm-Gg: AeBDieuUAD26i637lipSCNDI+fNGhocURC0FVR/lLOBM96SJ+tCWCu1tJeyNmlKRny1
	Uu2G3L/4qWJU2sxaqiP/ajVFTemsBiVLkhZuqoLUJZd8izmhJc2R0dFay5J83SfRO8R2ataGtW7
	YXESLvXBjGZ6zieA3fWnZdJhufZoKPh69AaYVjpmy2pz+JOuZMsxaeaEhUUTQB5K/NKtTPlzwFL
	UXzU0hXTte2DvXE2ehOa/bodTo4/oIwcvEvc2vp7HZ/CIN5CeHbTEb/04wNMNe8AXM5R2I/a5+t
	xbllvCYGJiTLk3A4R/vW6OdUtXtSBtP6DsJSe29Y5F9G4UOd0iZEElzIT2vjNGKoIV9f0cFDUTl
	0ujud8qfnbxJt1ueh3TiGaOUbMeeG281rUObNaZFGgs3qJb4i/Iq9Op/DNMICsGAlf7GM7u0505
	68Lk9iUKDoJzvJJueV31Gj46SjmFWa02JxLR5bvLUxpyypxb7x6TWaOSP1jE+DLdNuJO7ZaWWTT
	D7Zbt/5L+F3vM62CoQV9fF+c20NVoWs2qfv+eotlQxJsiY5Ai3W2QHDd25o
X-Received: by 2002:a05:7300:5725:b0:2c5:704f:714a with SMTP id 5a478bee46e88-2cbfa5bc98bmr816557eec.8.1775183924339;
        Thu, 02 Apr 2026 19:38:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d00f5easm3766411eec.29.2026.04.02.19.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:38:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Pass linker flags via HOSTCC
Date: Thu,  2 Apr 2026 19:38:40 -0700
Message-ID: <20260403023840.1192106-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 02:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234554

From: Khem Raj <raj.khem@gmail.com>

HOSTCC is used for linking as well but does not use any flags that
we can manipulate to add only during link step, we do depend on
what runtime to link to when using clang for host compiler which is
controlled via BUILD_LDFLAGS, therefore add that option to hostcc

This helps building busybox with TOOLCHAIN_NATIVE is set to clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 355c019738..c7b76a3dd8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ CFLAGS:append:toolchain-clang = " -DBB_GLOBAL_CONST=''"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
+EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC} ${BUILD_LDFLAGS} ' HOSTCPP='${BUILD_CPP}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 


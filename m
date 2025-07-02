Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749A4C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.25143.1751466337019482750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SP+t1KgQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so4655237a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466336; x=1752071136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmS5HMVYWkDjLmd9S/DEkxMeUQR4iJJ/lBx8Kt6R6AY=;
        b=SP+t1KgQ5FIdrNdBaWN2nKX2d+Ce/5/7bJ349IvUZGB6rfxqq/GmKqUmxLQlB4Jqs2
         foIY7KNpZ7vamo5VHP1bTJtUSBFOKTjcsrMbEESIkdFis4Mez/aPwIX3r0JG/EZl+Kcc
         5wzWxOrMPv97wiPR/VnFoolIjMOL5eR3yPxM2liHt4zhMaLb+0gw1UdhR/CInLPdcayJ
         qAzUfeQcer8Sq/JVolowV6WMDKu2WI5HM6rz+QvFbZvkM/m9ONqRarQWPFHH730k20bF
         3OASmN5yb3JYAvWH7Raq/K42hI+s8p4lqSUf01pj9DaeEQPU1x8mlSNznfKY216DL1wX
         CdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466336; x=1752071136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmS5HMVYWkDjLmd9S/DEkxMeUQR4iJJ/lBx8Kt6R6AY=;
        b=KXMTbBO2VnpAlHvNtm83f9mwMn4xo5v5xg1kQhkz8xy0Sz61LzZakyyP5BPvhQ90u4
         MsXSy2StF0K1XY8q6TLHYMoTJmU2c5SckT3Oq5izNOSCoGOID8uG1R9i4uGEqghfLF9h
         TzlWs/s+KXNAAZ91oe5MFegTdMRMskefaUaFrbKvRAh1whyI7XQWnEln05E3tBc5QD4s
         G7PDvxa7VxOkWm76YafVADlWV1A0voErf/lW4S81nQblGMvu4iLYVyFJPEhhd7/KVM32
         6HDDa2UIfKWJgAazCFDdwI9WY7UqXnIKRZAN3DILDLMUqWS/VYPaDiL8VE658YnkBti1
         ALfQ==
X-Gm-Message-State: AOJu0YxqPUzKtOvKwro24sfDsZcyzYYJAngICg0v64wO3bw6G3ZRdW9p
	LrOV/Xi2cHJYzXXg+saqrZRFInmn5mE5qeq26+z9h05WSAWPZ9jNkqejPNPmPzHGP+MnhoGPJWH
	AUmir
X-Gm-Gg: ASbGnctXtmgNk8OLSUuWDnK7lbbbayq13MMqwXTK0qu7J67KyImMQGcIYP+goJwMusS
	a6b+34VD0dny2Z1M/ESWXs/Iz0AnlJrWP0lkZz5vbFkOfDOTqIVdN8kPoE8Mg2kzQxU7mAuFUyQ
	PciW7DPx1QsvOYZZiAEc0dFK5E27gRkaYCtzVkchSNnrPmtDfdTRhXAaFDQEEB1mVYzftImebGv
	SDu9JfxSdWC7iWlSfceTb26CWPc/8oOGgJ9Vl76xd0h7o2Y1vObnMh2BrmI6Zt/WaQrGg24VQas
	jdKZuTYNDhOZqzW58V0FtKcHx0f3E7q0XNDVhAacLRHFjLx+3E+/Tg==
X-Google-Smtp-Source: AGHT+IGA2GlCrvkVqv/ii7miATWDqiDQYoqQUVChxPF4awFxrkKiOiIsjp7Q1RNN+UwT8QTfBfUwUg==
X-Received: by 2002:a17:90b:3d47:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31a90c304b9mr4164788a91.34.1751466336031;
        Wed, 02 Jul 2025 07:25:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/9] ltp: backport patch to fix compilation error for x86_64
Date: Wed,  2 Jul 2025 07:25:19 -0700
Message-ID: <2ba2e0020b5e461473b19c3362d3fad184bd1f5a.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219838

From: Preeti Sachan <preeti.sachan@intel.com>

When the input compiler enables AVX, stack realignment requirements
causes gcc to fail to omit %rbp use, due to which the test fails to
clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
that the test continues working.

Fix compilation with gcc v13.4+. Cherry picked from oe-core, master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
new file mode 100644
index 0000000000..c6fae88eb9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
@@ -0,0 +1,42 @@
+From 28d823a63ee29f5d72c2aba781a06a7e2651cadc Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@gotplt.org>
+Date: Mon, 7 Apr 2025 06:24:47 -0400
+Subject: [PATCH] cve-2015-3290: Disable AVX for x86_64
+
+When the input compiler enables AVX, stack realignment requirements
+causes gcc to fail to omit %rbp use, due to which the test fails to
+clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
+that the test continues working.
+
+Link: https://lore.kernel.org/ltp/20250407102448.2605506-2-siddhesh@gotplt.org/
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/28d823a63ee29f5d72c2aba781a06a7e2651cadc]
+
+Reviewed-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
+
+---
+ testcases/cve/Makefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
+index 01b9b9ccb..98c38e908 100644
+--- a/testcases/cve/Makefile
++++ b/testcases/cve/Makefile
+@@ -22,6 +22,12 @@ ifneq (,$(filter $(HOST_CPU),x86 x86_64))
+ meltdown: CFLAGS += -msse2
+ endif
+ 
++# The test needs to clobber %rbp, which requires frame pointer omission.  Also
++# for x86_64, disable AVX since that could sometimes require a stack
++# realignment, which gets in the way of frame pointer omission.
+ cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
++ifeq ($(HOST_CPU),x86_64)
++cve-2015-3290: CFLAGS += -mno-avx
++endif
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.37.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index f8e6d3987e..18c6439283 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-scenario_groups-default-remove-connectors.patch \
            file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
+           file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0



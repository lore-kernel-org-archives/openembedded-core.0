Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.378.1598389325130852654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 14:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uJdh/aY2;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id v15so7671386pgh.6
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 14:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QD3ujQK3SA8Qremup/GjfXst4tcLUrevA+rhAqTTE4U=;
        b=uJdh/aY21yisZPa99TrJXNGrzb+kA9hoSBwNxLUXmT7I3ZvsS7GwvEShi4XlMlf6zC
         EECDnU+/s9dsrAzaJLDHI5vsy3bsQRG2XSXZNi3KHcyJYRqB8WKBXznYVMWxn6N5Zcwr
         KBE6Zm2zwTCiM7mqPH4yqUnbpNsupZVIibfIEmHxg82vyx5osAxkHGG/shSBVfHjXJdG
         roNGj94oMqCdUaunLgx8N7CIVPv39lak1F12XFWAUZeiRcX0fu0Pmt2UTwRrSGbrASd9
         zCafdY+63fJsfiAoshyPc6dxFataeXlwIdSuGKPjF2OI7Y/EOM06S0L4Y3Ej+5VYLSqx
         jcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QD3ujQK3SA8Qremup/GjfXst4tcLUrevA+rhAqTTE4U=;
        b=qJKOU5GdfW+9iekLwWzDrhrM5s0RaeX9vUlIe1DFkanjchiZFyPpIcOmbj9kjBGPzz
         +QhyYLq//qjmXLRFzZz+Tdp2/6JUfzcxq1bdo2onO7wugoNBvnaXA1INbynMa65CYCAF
         rewDYhVdOXo/lDXRu7oFztFovykhRldubzc9db2aeMkCGxK0hX0VlmvAY98O31S3s25G
         5igSqZ9+kJvhfbUfL0cjs7qGJUeQubLcDLNuJi66GxPwHVjuQZZ/57ecybH9V3XMvjnU
         zfMdMszLRUDCX8N0wvlkGUfA8A3SvXRip5oZvFMsn3zDnahBLwLVAMXYKgbIk3lSVCkh
         g8IQ==
X-Gm-Message-State: AOAM531xO7niyV4vZsjdQTDS9aIehmldoMNflo2WcbtHPbqzpw6FMgXT
	Q50/MLwqWQYB/ojAny0KPbQ8smkY65zUkw==
X-Google-Smtp-Source: ABdhPJyo7U0CLo5LXuW7jycXn9t2IiwKAUY27bB8q2s9p69f+IuxiF4Se/YSoCf2nI43oLB/NLHE8w==
X-Received: by 2002:a62:1bd3:: with SMTP id b202mr9385865pfb.134.1598389323403;
        Tue, 25 Aug 2020 14:02:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id q12sm129131pff.196.2020.08.25.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:02:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng-modules: Disable on riscv64
Date: Tue, 25 Aug 2020 14:02:01 -0700
Message-Id: <20200825210201.5634-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel 5.8+ and lttng requires kprobes and riscv64 lacks kprobes
Invert the COMPATIBLE_HOST regexp, as we support most of arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
index 49b7a116bc..b9b3643001 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
 inherit module
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
+COMPATIBLE_HOST_riscv64 = "null"
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-- 
2.28.0


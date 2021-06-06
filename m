Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.25588.1622999137512132899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gm+WOZyk;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso8880634pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c6G7hzwqDJjIN3J/vy/xKhrxCiE6zgMlHZZg28QpNBU=;
        b=gm+WOZyk0ctpbMqWh4wD9afgtxTdRC4VO4PLt74sc3eqW+UXW/YqqYBByeIazI7jC5
         H4vVIyitOr2Wl+3gs86i5mfv7kqrKAhUqrwfHCye/SlBJzAhoz49bGDWJX2k0TszzL6P
         JsTsiGvUGqMg6BHbyczepoLnOKyxr1DXb315w4ytA6igOPhHuCrYIdiaKXfVaPo7O1Rr
         8wn/VYlBtBhYXrtv+IssqACKSCJoJEP8RNm/eJM2mJbECnqxQ77BHo586p0vVwI9leX1
         p93eKoS9AwCUTtAidMcQ1bsCxP9B1nENTKcV8BNitsOTxK6pueZhtNwwXAVunnK85ZV7
         wiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c6G7hzwqDJjIN3J/vy/xKhrxCiE6zgMlHZZg28QpNBU=;
        b=UjHya5z3darfMh6i00BFDZ4cNldu/yEYbuVDXHjtgnSjECCgwQ8Bzfco5LWT0oL6a3
         6jgxMEkpk6X9bfzX8aESItw8zwqsD2rETm+QjWM/nQkWc+2ZC4lrGZ85Q4kLWSjdiW75
         rU+fNkr+LjrGohFrXYAFw5oYSG+ayFM3PcmgNA7A0Tp7DLdKW4wsuqu6Nc6yN1aZaAXP
         HsT/spxOJI3CSwHCbFCjb6Ks0Hzm79tFWnu1GgC9j6h0Hh2aqsNMp5Jg20Yi+2jVvXLX
         Yb9wV/vAKaFEmab6V03NIt+4ED/7M8gNCAcktPFESt6OErEuh+yI5JTPvO0jczoKLDFd
         9gdQ==
X-Gm-Message-State: AOAM530Gm5AZkwBwmC7VQJsKrcxRQa0Sk2YSv/FfIVB8GLo2fHCQr9dk
	LHntidRa62nX2Gc/tKLFjDtOVKt7Ys1c2Q==
X-Google-Smtp-Source: ABdhPJxwl60k0eiXUwp8qq/8R5f3f8+NguFaelm1VzJO+EA9DJTlrYQHDLHXealkRr/e/gcCBzR4oQ==
X-Received: by 2002:a17:90b:4b49:: with SMTP id mi9mr27515938pjb.219.1622999136796;
        Sun, 06 Jun 2021 10:05:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id s24sm10179031pju.9.2021.06.06.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 10:05:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 2/2] recipes-bsp/opensbi: Add support for specifying a device tree
Date: Sun,  6 Jun 2021 10:05:33 -0700
Message-Id: <20210606170533.2182435-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210606170533.2182435-1-raj.khem@gmail.com>
References: <20210606170533.2182435-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Rebased

 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 15 ++++++++++++++-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb       |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index 2e32943245..cc31ab3b1d 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -7,12 +7,25 @@ def riscv_get_extra_oemake_image(d):

     return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload

+def riscv_get_extra_oemake_fdt(d):
+    sbi_fdt = d.getVar('RISCV_SBI_FDT')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_fdt is None:
+        return ""
+
+    return "FW_FDT_PATH=" + deploy_dir + "/" + sbi_fdt
+
 def riscv_get_do_compile_depends(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+    sbi_fdt = d.getVar('RISCV_SBI_FDT')

-    if sbi_payload is None:
+    if sbi_payload is None and sbi_fdt is None:
         return ""

+    if sbi_fdt is not None and 'u-boot.bin' in sbi_payload:
+        return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
+
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
         return "virtual/kernel:do_deploy"
     if 'u-boot.bin' in sbi_payload:
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index 52965abda5..5fee52136d 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -18,6 +18,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
+EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_fdt(d)}"

 # Required if specifying a custom payload
 do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
--
2.31.1

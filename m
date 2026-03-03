Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927ABEDA6A2
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:51:50 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23349.1772556701215996581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEirJS3V;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb513e860cso608380785a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772556700; x=1773161500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atXP2tYVmWZX0dgiFvKI2ti3aGQxbC+YC8i/UVEShOk=;
        b=NEirJS3Vx7WaJ77puBOPZk5c++7b8ZdGIsakyEMrO/tu9dYKYoqCLa7DBfy442DdO4
         UuOGfZc41nbFLbHm6520y124QM6MzRTpGJZgSNhhzTyasQ84GJI8jEDGdGJqxp2KV99W
         RDUNE0FeDelW704bYE8Hum0CJ+l8u+EnLOgc/cJvA5St7dAxT/RB1+8PZxjb0DS9gKIV
         3/NC4mDBE3K3zUiYpPPyS+EBsVobgW6uijZXZLnwHtjpRcAp+IjFoXhb1dHKy/ew7OzF
         YY3GGPS/NoDzDr1w+DXec3OCUI1v3MCWFB2h/iiEJn1SRgnRVR8WwO1G1bdTGKkUWrIH
         A8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772556700; x=1773161500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atXP2tYVmWZX0dgiFvKI2ti3aGQxbC+YC8i/UVEShOk=;
        b=BFIh61+7XLHRRj3k4qqTDHLkJSZrvKOK4LIgyGNYvEEMpC6uZmGhc8j1oL/r2hzh3r
         4sIHPobBRXbugLeZPoJNoEI23l8mSPdlymfQQdr8a4L/7hhNDPH8cVUuqcCEd/DTRFH5
         YszdXjoNjFrQWILq5r9oP/kHxipRZSeXLIGWFbjw52lO/X4HbRyETsJHvt2HF46Jztc/
         qYouO38Ic1wKMk+9SkjCpR+JyN7Dpf8AO1FKPrsbxeWFOsQBY/XoAKJGnDQH/pJ8bHYU
         OOs3GUPfXbZpSHEdEb1nALqZ/tmdRyOWmyf9IyrjQSdizAR7xJjRShvGNfDQhCZSOwb2
         XmUQ==
X-Gm-Message-State: AOJu0YzgFkEsjCxzOFI+U93DzcOAe8oYKpUa/t0aHag6Hhi1SnzdtMBi
	olNzwDCWsk7qv9Ij9alHPvCt7FRzRhVnMoj+8G5IRsfwocezYyLy/fNW
X-Gm-Gg: ATEYQzz4x+sQidoTdT7s5YBpzNHefOM4AnqICqY1Pc6cmNYXl0FGZXSN1AHdruTCHgH
	dBfojuRupOlYUIFdChOLEH3z1+ZLMa7sChChLFZrjz8xzfSR1w2LsvNhZSBAD1H6mzBcBCrBCS9
	UJoqWEfbChImjoS6Hryeu115/MmBztDbt9LCKioMDxiUHkgAU8lKtgIqKRI1fnGzIwivIuumiwO
	YfBSWfYFS9kiDSIIsF/ner0WlDikpd3DNxKO4nlA3GqSIB+bkZMANtNDWHr3uBacQOgIfH20lfq
	1r2xQrYfe/FzHpBchCEZ69yioKHe+Fr+7YMWfRLYjGqxrqoFr7oQebmCNURIS8H13dbzcr4KhLO
	TPCvTv3/qC2jIxjZJUVL5ZLkG41fF//jIx+8/skIr2AVCuNy7mQAA+YoTpfAM0b2qhz6RwloOx5
	xHDgtHSAvvqVMQeRPwHbZ94K8WW6w81XeSs6zvZqx/EwpdjQ2kdYvjSd9U5uIajKWFcech42V7s
	OmEhtDY3Rv8x1uEqDu5+EVASzYlWiLdwEKDu2qnEapUAHkRcJmOqaytJPU=
X-Received: by 2002:a05:620a:319f:b0:8ca:4288:b16c with SMTP id af79cd13be357-8cbc8e1b7afmr2139128585a.54.1772556700039;
        Tue, 03 Mar 2026 08:51:40 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6535b4sm1425073685a.9.2026.03.03.08.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:51:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.18: genericarm64: fix configuration audit warning
Date: Tue,  3 Mar 2026 11:51:38 -0500
Message-ID: <20260303165138.2242680-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232329

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64: drop CONFIG_PINCTRL_SM8350_LPASS_LPI
    Date: Tue, 3 Mar 2026 11:48:55 -0500

    It has been removed upstream:

      commit 112d4978099700bcf5e3a4a7e571cf672188f3bc
      Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
      Date:   Thu Jan 8 11:07:22 2026 +0100

          pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix I2S2 and SWR TX pins

          commit 1fbe3abb449c5ef2178e1c3e3e8b9a43a7a410ac upstream.

          Qualcomm SC7280 and SM8350 SoCs have slightly different LPASS audio
          blocks (v9.4.5 and v9.2), however the LPASS LPI pin controllers are
          exactly the same.  The driver for SM8350 has two issues, which can be
          fixed by simply moving over to SC7280 driver which has them correct:

          1. "i2s2_data_groups" listed twice GPIO12, but should have both GPIO12
             and GPIO13,

          2. "swr_tx_data_groups" contained GPIO5 for "swr_tx_data2" function, but
             that function is also available on GPIO14, thus listing it twice is
             not necessary.  OTOH, GPIO5 has also "swr_rx_data1", so selecting
             swr_rx_data function should not block  the TX one.

          Fixes: be9f6d56381d ("pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS TLMM")
          Cc: stable@vger.kernel.org
          Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
          Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
          Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
          Signed-off-by: Linus Walleij <linusw@kernel.org>
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

    And is causing an audit warning, so we drop our assignement

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this on top of my recent kernel pull request.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 1b0eb015fe..ae06d6ed0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "9bd60c36af4be5a5905bb5408325961475e66880"
-SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
+SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 6782de4950..619fc8a59c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
+SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index a74520fcaa..f5ad28780e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemux86-64 ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "c9dde4c9d33d3635d3c6604a1bb0c62ea01b0f44"
-SRCREV_meta ?= "0b1ea0e509501b1bd4ba5ea8ccb2f3daf525ddec"
+SRCREV_meta ?= "9b173d3a50825b8bffbb62ac6e504a7a56312e2e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0



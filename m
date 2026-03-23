Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77569F4610D
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17886.1774273862596529960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dt2f9Xsi;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b3488fb31so47126181cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273861; x=1774878661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z/wBUPhDsmyMTsLF6XAyUOfAdEsyVMmPKJByQsuWGQ=;
        b=Dt2f9XsiqUUcuxqwE9x6L3/oclUuUniu9k2d/PQ7wMddIAna3iyjtuV/ha0tyxmMGF
         Bx+MAEsrmyQwNlyC7NcDiEgbukOSvlEpYs0Ze+bQdUdIYjo7xckzasg2CR7Zl3wofaGT
         ZbMt8jnbp0uJ8rVUx0ZhWpIv5s+Su6yvLLvCIR2XxQ5LwXNPuAxFiOD/N4+bj2asOcka
         DVeIUVq4B5IqFS6prZA+SvvvmmzeLsQyAmkYeW35cUxzHty6vyc4PkzLN1p0fGNIaHuP
         wpYzlXpzrCL7Ujl149otwyHvLccq6kTGbF04xsnlVdo+MLOWP5RLba6D8v3KJIrSoePr
         fjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273861; x=1774878661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6z/wBUPhDsmyMTsLF6XAyUOfAdEsyVMmPKJByQsuWGQ=;
        b=nOSFPgW1e+cnwWpuRy+orOxjkDXmLofr6NYV5jJmHVFpC9NbWKLiBHSBdxUjiSdmdf
         5NG+RAQeBbyes6s6LhjtEUr2Q3QQ2bEpPDzAMHvqWkdE91HkXdulScDtsC8FsKx+X/Ni
         aQDXhZkrfIWbRyp3IItXpwLc/Zdz8io347m5ysK//l3E4o6Vbr5PvN6XdAvoqq9ueEEI
         E217b1CiRhqHOyGG2JDCzRlJO9eoFfKYQFl3qecIEerCEIhnEnArZyLP8rDu5i7VoLLW
         lSYSX366rxNi/gBXHXuJTYk2KuHdziYJzEh6z+YsAOlhxEJMD1W8xTPN0uGN755sNAsY
         Yxzg==
X-Gm-Message-State: AOJu0YzzlyNWvdFjZvJfSDdb9awbuFV2pbPyx5X3C2rnWHc4DgyKDIMb
	wtmLzMlb/BQtZPbDr1aKLxKFSkZePtDP4W2yUwKmFyiIaXlwKHJFT6V1Zdzi1ghV
X-Gm-Gg: ATEYQzzIRCmfz4Wt4pD0hR0n0+CN55L/Xc1GrMSdV2VrN5ExJ+vC7ZgTln/7/+7hB4/
	xwbgTsX0bQFZyoJH+534EXXGWPsgkn2QdUuygus5YU/vXiwZSn3tQ3TAagmhO9eG9wT9gsTJgho
	MVJySCao5qB8iuvDce+9+XAHMbZrr6FCDahpTpXxYd/KzRRUe8qFGm0HZTUKRzteNJhxJZ5xwRl
	aqb43s52FxUNkHC0VwwAHMgk455PuZZeO9pKWFpW2AcgXi8mypYcyoIyT6SQnHzeBmHCIey9wBt
	yQhOREpOKndFQX/ce1YOc9j8RDdMkNhwJKVi+HcoiXam+pkBg59iSEImsfioFnT+vMxCKbOIgTc
	obPkBiJKIQwwnMOdpq1JGFPhOE/BXYppoJUee0uQPLwZtZUM+LO7/U5/21js3sdxxbBUviXitSq
	Jv9y0i0GnuJV2OS8uYH7vvxbc1Acq1utvCBmzGkxlFB/giw8gsO3DBJtNNNLxuTdLm6VWcbLDDA
	X2JlkVjNhwjrrtcy/NIEIbNvj+igb/pL/bPyqYx8TN8otJsjA8NftMhtl4=
X-Received: by 2002:a05:622a:1ba7:b0:508:fac4:76e8 with SMTP id d75a77b69052e-50b245b6b51mr227102371cf.1.1774273861446;
        Mon, 23 Mar 2026 06:51:01 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/11] linux-yocto/6.18: genericarm64: fix configuration audit warning
Date: Mon, 23 Mar 2026 09:50:48 -0400
Message-ID: <20260323135057.1605923-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233721

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



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C334EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 03:32:04 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.80683.1691551921551544604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 20:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kSIh9DfQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76595a7b111so448793285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 20:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691551920; x=1692156720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTZB2gwSV2aTcUCYYzvPHMkry4as1fGkFgsjDaz+ODI=;
        b=kSIh9DfQept172XooeL5uyxZ45FvEgLXS/YiiXF0KkLjwQyd/b3QjUGFClKwoCnyiP
         haUUlclERdRGwwvljOHOaPgZEnFfXJrBrXLUK3As9mQVBQdst6EqB5rtrICmfvnvdt4p
         ywZArCJOJg1TSo8Tferoa8R4ZUwK+HsrmL1HfQScqQtdWEMQhyvgvMUKSE9ymCTF0KF/
         eqnZdpfNuKwYP7mNTHS8D49u+AzI00Qpe4Pf4j7QqtPniYvuuiTWyjTd9yGjX+9SFtL6
         znQvGxqClq/iCu+lrfOL5lrdkxcRyNBEz7DjsSOH1eixFPjW5hFyadXZznmGNGQ6OIil
         DN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691551920; x=1692156720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTZB2gwSV2aTcUCYYzvPHMkry4as1fGkFgsjDaz+ODI=;
        b=lXz9hMYpZIwUx8d+fbWAQTIUGhyRPY4niFhXmLnTWyzCi/AkeIEKFY8ms0lT5jAKDv
         kLWTCsfQVOt60bBAiWwe095tqSr7F5n5Q8xVjYfoSt83OLfLMEoO50zhyGclsFgQzwit
         Je2cHAX1IBaXxR/DAz5RWLvKYqEZCcOfq3OvpByXcPP97Atl+DRCzaW8aP/LHldHvKzB
         OPI/f0WQyiIk1WUrRuw+HMxlJI4MzMIqevn7MISn8oEzWzH3cYBgRONWz6yGRTGWhYXR
         qp5pAHDO6wD/j5uQTMsNSGEjbZ9IgV9SuWg+8VzA51yYBn3/+eLFXsims4qN0SQMZc2s
         PPVg==
X-Gm-Message-State: AOJu0YzGjvtmHPyk81iVA80Xt4p04eJn3P7+lTe1iLTr6qOz6x2945pF
	0GOFLqgVmzOIPb+mxCJ/mrbXuYiPrw2L+g==
X-Google-Smtp-Source: AGHT+IGi7hgoOdQ6zYcVx9BEz2lZqxSn5QWO38YsKPTxWtgl4mtg/ftj3U1dURPbEY0fmvKqi0D61w==
X-Received: by 2002:a05:622a:7:b0:400:aaa0:a4f9 with SMTP id x7-20020a05622a000700b00400aaa0a4f9mr2321348qtw.17.1691551920409;
        Tue, 08 Aug 2023 20:32:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j23-20020ac84f97000000b004033c3948f9sm3781532qtw.42.2023.08.08.20.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 20:31:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.4: fix qemuarm boot failure
Date: Tue,  8 Aug 2023 23:31:56 -0400
Message-Id: <20230809033156.3494164-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809033156.3494164-1-bruce.ashfield@gmail.com>
References: <20230809033156.3494164-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 03:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185684

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.4:

    72bad8cd7540 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.4.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index c624b2dac8..8cc39faf9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0bcc161e5d456bcbcfa6852e5e7750636a00ce46"
+SRCREV_machine ?= "121d700ad4b877fab9238a92356ad32506ef70d5"
 SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 409a95e633..834d07be48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
 SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 527b09087c..4deb7bc537 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,17 +17,17 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4d6b5d3235770e00b35d53c0dd33827624e0dba3"
-SRCREV_machine:qemuarm64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemuloongarch64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemumips ?= "1504fdd2f568bf0f39042b69e282a9e6042594a1"
-SRCREV_machine:qemuppc ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemuriscv64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemuriscv32 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemux86 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemux86-64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
-SRCREV_machine:qemumips64 ?= "a55946081548eb8b23d5e1da3aa7f469addef1c8"
-SRCREV_machine ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemuarm ?= "16af0b21320a78b21d5d9ded1188e398352d262a"
+SRCREV_machine:qemuarm64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemuloongarch64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemumips ?= "de46701cb3ac494b27ae70f1475efb855e9d817a"
+SRCREV_machine:qemuppc ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemuriscv64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemuriscv32 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemux86 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemux86-64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
+SRCREV_machine:qemumips64 ?= "47d7881e76d678cc9dc034f0acdd1bc416fa05bb"
+SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
 SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1



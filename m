Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD5AC54FDF
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21937.1785359685861866352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cN/SAE7U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47640541585so1079396f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359684; x=1785964484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WpXf8EqUWjhnZRFuTf5F/S8WPtdJsTrKXxW97Ms+7+I=;
        b=cN/SAE7UmuoLRycEG6rJXVjxk0FIIpC35BEFqGGVbS5Mih0udOD2Are4GNWAG3sTGl
         w35qybR7ol8knAVuDfh5+v3TsB/vVlDMAIwcYOvzE2JoAct6+QckU6QHDsiTr+EHRe+x
         25pi4DZ+x8wAdGbaFtmEx7dNubMdVl87lmZPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359684; x=1785964484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WpXf8EqUWjhnZRFuTf5F/S8WPtdJsTrKXxW97Ms+7+I=;
        b=i9f7zrZmWzN2OYU5S87Zwhi7OBTAPnN5U6CrTT+sXp0L0cCYKTnvzPA2GnS5JWxYui
         lOwRp4mQN/FARvx8AxY4KLDwGLh0r7qk7CgCrVCbxeIZQU+12Nnrzh/qYNoOtPHdF0VE
         rWDLKFKyjmOq/XVx8axtPUmEhprkCmzVLb/A+ORJYjqmnpG4+Zvi7FwH58F5TmL8nDwV
         rH8AsD+WkXoMQiiwEDkDourAQTY6MSNBtqe/3+2PHVwDcAvYHG+0N9O3eLNaXyBNnAuM
         aAnAGGxTwjw2vEWvPX+jeVulbQQIxRj9BTw3z9QlaAAFgzTDGUG2jlcMJOWp/BwAyvvU
         ZuRQ==
X-Gm-Message-State: AOJu0Yze28P1/GUPSMJ4Lfa+F26ow0wtrAyQ1fwPN882nbkZzRcojyUC
	jElHvAK+M73pYi55XubtDNC+W+fetAuvOykCHML5CPbEFyhmhSq0PzX+aa1ICgbLj6ujUbhgpSG
	JYJsByy4=
X-Gm-Gg: AR+sD1077rBl4+C/Ec/DOKwr9N5wYn/IjfdsJRS9RISiMkuJ+fYKmwBev2i6w94zHP3
	sTMLiHYO/XaSVfN3DtGeOOADVSFZD9xTC83SGQEL4IO3QbSpz8kP3P9EiAves7afjomB/WxwsnG
	6xX61AgQBptyFTE7M/h8V8TJCxpiOQ29JM59Jk9u0Fhx8EZ8RQbO2pfcZ9qrSTlT/KKxQ9V120h
	v69fyDG8AudMmSQV1i2F/QWIHaTO75wqWilAu7LTd2p3k0x0exKOQRgI45SISVwD1N3IjVbFYSw
	zO5ePboeNe8+/3HZAFanxy7pz3QOwc7JB81tpzqR7I3oN1L72Mjt1WHjX0yqEtkJxTX5ZvEb5RR
	t89CzTx5fw4T39xGBponvVDz9jeFAVKHMAV8eJqJLndQZx3m/p+3tVIKx/lUjUZ78QXLUX6h0jR
	JvHflMWGB013GP9jMv1BJGFrql+KKTzuKH6XWM8CRfV9km1I/MO1nkLw+w+9KvD0J/4D9hRDLRz
	RFgII1WgyVvaZcz1g==
X-Received: by 2002:a05:6000:4383:b0:47f:9254:d45c with SMTP id ffacd0b85a97d-47fc6667d37mr486585f8f.31.1785359684146;
        Wed, 29 Jul 2026 14:14:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] spirv-headers: upgrade 1.4.350.1 -> 1.4.357.0
Date: Wed, 29 Jul 2026 22:14:34 +0100
Message-ID: <20260729211437.3394641-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242290

29981f6 Fix Int64ImageEXT capability prerequisite to Int64 (#611)
0312729 Implement Samsung Intrinsic decoration (#597)
02c0394 Bump actions/checkout from 6 to 7 in the github-actions group (#612)
8d56066 SPV_QCOM_image_processing3 (#596)
b3cabdd SPV_QCOM_multiple_wait_queues (#595)
575b651 Add SPV_EXT_ocp_microscaling_types (#613)
daa093d chore: Add CONTRIBUTING file (#608)
ed73438 license: Add or update REUSE compliance (#609)
c63848e added source language entry ApilaJai (#607)
1e770e7 Add Pred as a new SPIR-V source language (#606)
8c5559c Add ArmExperimentalMLOperations instruction set (#602)
aaffbc5 SPV_NV_cooperative_matrix_decode_vector (#601)
fe44b20 SPV_EXT_split_barrier (#600)
82dfca3 Revert "Add SPV_MESA_fragment_coverage_mask enumerants (#580)" (#598)
3541d11 Add NonSemanticGraphDebugInfo instruction set (#591)
62d3e83 Add SPV_KHR_opacity_micromap (#599)
5c50cbd Add SPV_AMD_weak_linkage extension (#583)
98c842b Fix OpReadPipeBlockingINTEL/OpWritePipeBlockingINTEL operands (#588)
58006c9 Reserve ImageOperand 17 for Google (#589)
1f2dd16 Update spirv.core.grammar.json revision (#593)
1260380 Fix OpCompositeConstructContinuedINTEL operands (#587)
53b334f Reserve some tokens for Samsung (#586)
1a22b16 Update headers for spirv issue 373 (#584)
157de8e Add SPV_MESA_fragment_coverage_mask enumerants (#580)
948a3b0 header updates for SPV_INTEL_rounded_divide_sqrt (#582)
b8a3296 grammar and header changes for SPV_INTEL_predicated_io (#585)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{spirv-headers_1.4.350.1.bb => spirv-headers_1.4.357.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.350.1.bb => spirv-headers_1.4.357.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
index c4af29652dd..244c6854fa1 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "CC-BY-4.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
+SRCREV = "29981f65241605e08b0ede4cfeb999fe3b723c6a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:


Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E949C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.1967.1645557432896661481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q4/RdeKs;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z16so13077819pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=Q4/RdeKsWokPwkljKfEIjdhINq3e+lZlDV5w9hJ/NVqBtb90YCj+pD1K0LHMU/sM0a
         rdwKBeHt2dYG0enryHeAuPs4lQ5pA+yEXwiXM1SrJdSHoOLjiQRNSFEe1dQS0GwFxFs3
         0D19HOQSo4qaPjehN6mNjSe9buKgiqAZorKugWLzEfyLlGZqQYhvQcuUcRfEICIymZY4
         vlSRpTToJ3nzpGIuJjnp+HVR1UXek5ye5HiI8SYAiZ2RHBnPhyReMfc79Grl4pRZQjyo
         dfQN/4nLchp7UUEJpOM3oYSqPmKqvn7ihHVTDiytRzRtwmNwhTjH0lo9dF23sQFlaFu7
         uc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=VbV3NWqGfecY3TF6eU7d8hgCPCYQXZ4xjhOk7+2qF4VHiHOxH0v41Wu3mh0bAPgUmm
         Hgj7JxqlxKQPVhtC17TpsKP2eHU8YeyxZqog+s+NNnAOaL9LXFEVOvkBCv6p27Gftgwp
         YwgHR/AVoSQVgULPleRWz0ZpcQlOGCxLakFqAdKYO+yamErWiZwPwjCmSJDXmx+kGSUL
         q1uxc0wKhtuZZpUolAHsxUV9Wg1G6XYKRuxTr9GnyHmWg6Hi17MpBKtR8LbXFOwm4ux8
         zx3ie1RDsEk0f5U85+GoaymGxdyinHCaTWESSVj0zZPkQ2dhZjh9FERGtuQRCMOB0LV7
         Is/w==
X-Gm-Message-State: AOAM530LajI+TlNf4C8M1XExPwJ2HSVgkOAsiZWxWe+OnHWDSt0IWdz/
	jxKx+tmyeb0qWdRIF14+EaXyBSK1Aqyhig==
X-Google-Smtp-Source: 
 ABdhPJzmHbl0NXLwa3nwx2lW7Q9jWA0HfnmQWRMnRPRT4493IJ3qG3B8ldo57K9QW0mMhsgwBmCY0w==
X-Received: by 2002:a62:1555:0:b0:4e0:f0fb:654b with SMTP id
 82-20020a621555000000b004e0f0fb654bmr26018897pfv.35.1645557432020;
        Tue, 22 Feb 2022 11:17:12 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 06/32] setuptools_build_meta.bbclass: add helper class
Date: Tue, 22 Feb 2022 11:16:32 -0800
Message-Id: 
 <08688c61ae3479338052bdb1c0f96a1455a17a84.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162197

This class uses the PEP 517 compliant setuptools.buil_meta to build
wheels.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools_build_meta.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/setuptools_build_meta.bbclass

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
new file mode 100644
index 00000000000..b1441e65dd5
--- /dev/null
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -0,0 +1,18 @@
+inherit pip_install_wheel setuptools3-base
+
+DEPENDS += "python3 python3-setuptools-native python3-wheel-native"
+
+setuptools_build_meta_do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from setuptools import build_meta
+wheel = build_meta.build_wheel('./dist')
+print(wheel)
+EOF
+}
+
+setuptools_build_meta_do_compile () {
+    nativepython3 ${S}/build-it.py
+}
+
+EXPORT_FUNCTIONS do_configure do_compile
-- 
2.30.2



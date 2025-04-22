Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7DEC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.41511.1745332527041356041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T2CsUw9P;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6086611e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332525; x=1745937325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=T2CsUw9PW1hW45fJdK9ieGQZRjiSc/RdeDCT4YXGCmj7SBM7lp5lrE62DBE+185rHI
         n4DmpJft9KE8rMCeFPUdUserOwOM0zeCTsJexJaGuRpyCG6u2h8AiTjyEkV1sp6vfMAz
         zY1/UAinxlnTbqGp1IWPz9/lxC2cSiTqfkCzC6vTHM16NvKQAo21nJM3kk51ceZSP7Pz
         qv3RvMaAqFKXdsPK+tUsYMRLcsqFKIRLw3Nq85ZhsCoEP7efveGRCSzeLPklB+N5SF2B
         X7P5ON0naQMeWEws6il1x/cDPKLvErxNDJWdD6eQKNVyQkXX0lrHs1vlPLxKpOaufqQq
         A1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332525; x=1745937325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=sacB+sbwbSrsBxz/eD1glCWfcR+JOKnGSyN3sYA6nXNM9qVuhSctO/3Ou04kSksLKh
         B1PdwFKy4Dds1TjmVpMbm0b6OMBjCq55juUQk56CoXsZSRYIAyNzs+HCCuVd5oLNGs21
         wkvPhLVcUpyQWfANL6XhsvzkMvoGbMr1wKGwRTXpWVpDNUocmGfDMjRFy6Bth+S0qKAQ
         Ks57g3C6nkg11aMxQDMJuTpB5+CyQEGtvD2sA6QwQXqcAS3bSUVR2ADfIzLBmBWGa6hO
         9kCJaod9AUaFmEaZ3LWcS3c9a1XFv1OTxi/uunJb6LWSUOuW8fuuiZxGjKqIOEN5hR8/
         cbvQ==
X-Gm-Message-State: AOJu0YwLfeh1CQkE5S51rizi3pMjBvFCADFlYLM4M5zS3dJ4J7e+s4Qc
	JNoDYMA6J5gM5+rfcptgO+qJOiLkDNwhKLFe4VCyqmsqpmUgKCQnLShx6MfEHqrufPCi0bVpR4Y
	7oKU=
X-Gm-Gg: ASbGncti699fknqyRlLAlFB2Rtp9mzjoDPZxnpR4qcRJIh8Q2W6YwNos7OfLkAj9YXn
	Wf103WVcyuEJlJKaF5/rdBflJQZ61hC6aj3j/aWSpif0CmYymk18T7GHLAja5xI3F0IJi+hChDI
	iiUmDfhA2mlytax2nQwlJfH3tlInippkebVipK+zl46w9zVtdMYUWfJEHmrgcJgVWYHS9Lk+RwA
	DRuDPm6V0qctFjxmnQTNq82b3w19zn1009oloEOfWm6okMU7JN7gHbKFG39uqW389useV5HsJBE
	EzojHKvq2zpxbEFQTqoPCZibQ3cJpASV3PD0N3r9hrn2yysSCr17VZoFzCtQjSJpXf25Z/9C/8o
	qtFlLH+C8mIdJMSuiRQ==
X-Google-Smtp-Source: AGHT+IHPmZD/ChyUwz4dlUVCg8mJTC7bonAD4TpJWYzk+i7l2qVcsZCeUU7mxezNF/5M9IGfI4uxMw==
X-Received: by 2002:a05:6512:3ba4:b0:54a:cc09:eacc with SMTP id 2adb3069b0e04-54d6e6621d6mr4060081e87.39.1745332525194;
        Tue, 22 Apr 2025 07:35:25 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 8/9] wic bootimg-efi.py: fail build if no binaries installed
Date: Tue, 22 Apr 2025 17:35:00 +0300
Message-ID: <20250422143501.99565-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215222

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77..20b1c36a46 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -341,6 +341,9 @@ class BootimgEFIPlugin(SourcePlugin):
                     cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     out = exec_cmd(cp_cmd, True)
                     logger.debug("systemd-boot files:\n%s" % out)
+                # must have installed at least one EFI bootloader
+                out = exec_cmd("ls %s/EFI/BOOT/boot*.efi" % (hdddir), True)
+                logger.debug("Installed systemd-boot files:\n%s" % out)
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
-- 
2.43.0



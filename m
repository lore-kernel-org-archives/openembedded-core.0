Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F33D1F9CB
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41400.1764847881842921815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pFgAIqWM;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso6599395e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847880; x=1765452680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWL6Mv6zSYOBj3OQBzFLXoZBK3mW1Gn2TmDcDMnnqXg=;
        b=pFgAIqWMblYRA/hODF0+UAAGmvNQG29HtZRLdaVpBflp9yMktXMro5QAgWNxNGQ/uJ
         i6ZmyNwJhKP1FQ1oxCIP9jjAhiXiC2pTe7n2Y+58YLE3S6hPiWqYAwTRRK3OTiqSHDa5
         t6r8h9c3+vWPo9p6Q8ljhy5emQMMQoHjPVv4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847880; x=1765452680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWL6Mv6zSYOBj3OQBzFLXoZBK3mW1Gn2TmDcDMnnqXg=;
        b=qvAv6XfZkLbPC+6k6rYDLgKrRNM/ChEF+hMSIqD4NV5g+KzOGFI7O7wKgehbvnYCx4
         p52szR/piW6kFSlnAdoHOxTIKiQ8pDIgol0Uf8nxKUAu4JtZLmWIflc3Fow4uLJzsEze
         CTcJv4HW70awqTFlOy7iTYf3XOK6IbBfDJNa3tkgjNOfmP4OwjCE0IyU281sap+NpFJp
         IYUTwT8CRZGpocydSoOXmB8gO9sK3iflfgh9BXgxJo8mN7Qj16XNSeD4YCZOPwWiDSNv
         3IEqIbyXLqUP2h11BLd1C7wFTOnK2JTmGFml4dMINFJQ/3m8Mt1WkSjja9OOfiJ3HwBk
         Janw==
X-Gm-Message-State: AOJu0Ywk7j9IlRWEtnAIsawG4LxXlDUlHDB9Zhi7xkuWhwH13DQCWaRO
	lxrQKYBH1Yoh2Tx2O5ZqrLwqiVWWd0eeBxiytQqGSQeKbPL9+xmUY7Fz7d7903DoL6XUqEtd3iV
	lq06E
X-Gm-Gg: ASbGncsvTS9nKBJW6oHQZTyASej5UKmkdarNxnIYOH3jWZlTrP/GZVS0lJq0OHecgmZ
	MCK8FSpulDhHn76m6MPRWALwMHlQdtdnKWLmcd9scjTuZ5w5z9aIC51oel0U0Vpiiu0fB2H/Y6C
	X+a+OddzPF2Vs10ETcfRVCB/sVCsw+SHkK4M8hIbCqFRq4HJtAU4yuxSX4rHG3G4giru0iAHAhm
	grEGFliE1YWZCN8hf62WgERDTs9fepPmca/Hx5mi+iEcFTirr8NKuSMl3LXarCipmuUBK+p1Rtn
	3owN1QvnIE8KEWcEg49H1W0VNGn+tI+QpficvaDvrpFAStzIynrQa48h69MPWGHTJfFDLQqpaYD
	JTVkyaRSB3fCrSYNc2cJR/WuL809g0dId19ENyBIIWmOVEnMWJ/hCidRBpzP/tAH0WORW3xUpAI
	ZD7nDXLbGTLnfBQ5K2O5Hj7nhOiqmzLNpsdHOOlldDf+rVW3bz1D8dsKhywF8RAYDX9NEpSaE0G
	ZRSqRPRdcbC6wjtCHZte74V+g==
X-Google-Smtp-Source: AGHT+IFh0W4EolbIaiMVji0ZTZmK/phJDW6ojlT9vPKn8hna6HlH9ZqdH7u+llPesqvEOg/DjuAuEA==
X-Received: by 2002:a05:600c:548e:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-4792af3de68mr46397705e9.28.1764847879896;
        Thu, 04 Dec 2025 03:31:19 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 4/5] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Thu,  4 Dec 2025 12:30:57 +0100
Message-ID: <20251204113058.948115-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
References: <20251204113058.948115-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227285

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 00000000000..642fa80319a
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module features_check
+REQUIRED_DISTRO_FEATURES = "rust-kernel"
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802" 
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"


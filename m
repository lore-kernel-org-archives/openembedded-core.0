Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA5DD1F9C9
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41210.1764847880794696932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H/Mcm2TK;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47774d3536dso8167375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847879; x=1765452679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMvc5Xe2AV5XWfpViGz8eSZbZ3+Nll5/dIvunCLsye8=;
        b=H/Mcm2TK+9Pt6YdaKk+uBRufytNBzrN8Vb0jeyhyDSWUjShaZ03WMJTs65byjhgKWm
         fVUhVe3G/qGIvmG2aWtPX1fzX9nXgqcDU/OHlGI6LbOCAprCuWHazI1SqOPde9+eXqap
         2Ty/RbfMI1tcRyNWoNT18I5VbmUGiTeDqhjAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847879; x=1765452679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMvc5Xe2AV5XWfpViGz8eSZbZ3+Nll5/dIvunCLsye8=;
        b=QA05aB2SlJFoFDVkX5VYkr1a0ldl79xZWfaOcESI272sskiekftdr63xxD3I0RfC97
         IUdDgyRhgSsFG+luKDsED40miA5VvcmchILHjG6ua+DawrwJ6P5gHVDetjgEHv9qM6Xk
         j0fOZchTA+VJ446XBbIJbaKi26hyu+s9f4SME7A3KlnlIgnEOXFKNKTo1CYDsy1Kwwng
         5tduRegqtlMb9YBwsQzjN+v5SWNImNKx++p+VkGq0N/njr66Vbseru/6HkkGPlD5Dinu
         PWjBk+EzClcrKNpHcmr+CGUMmC/RRs3Qu3TOJ80Nzl8nZvIYzeixPMfmS1yhyONxf96L
         syLA==
X-Gm-Message-State: AOJu0Yz3Ep7JdpPeIMvffohkOiuFgdj/ySlinpxeGM4rUc+4eSpJIuEQ
	VZ/yCc/yMvxy1hd80Ss2zRK682+AsBoqR/NAwq0gW94qF8mDRGaoFbjoL3r3TUCnqNWKLsY+01p
	+l6Tm
X-Gm-Gg: ASbGncsRF1+0ZV8+5eWfawShBUbTfW1Ddk+riF5Vy/vXgIm/STN2Q+HkRaEPeUgXMmQ
	+d1yInv9mfoCnZG1J+BsUoPsuKnHqHdUJQjQQB48Y+pZ/cMykyOm3A7JMoDaaaIBdmPXi4Wg261
	6Boz3eP9dnZ3z9RJPDutF7yOIWz1Fp4xxGLX+gMyJn81QwkI6zQEZT+uLV57MUXgkfJkP/JLLgw
	Sl5tfB3dk26/pTkd/XACTQ8AVwsQm7vKgVrHIWH5f0E1QJhx85ayri3LLNZtNKIFT8sMbKTi/k7
	KlmiNW+hDZTUDqaRnbfswvqgABvYzr7xqwvri5a4EAoG8QguwAzk0rbLAlLGFP1Iz3N3zYEDrzK
	yhQ4QxsnXSBL0ENfGlAg9qf/VM96p94t2rYenKRXT2bGXUbToMximv5yVOumEUrKXolxlBEUWbq
	g8y30IVNTMFQmawIejFYXptMA61FfXiLn8eUS7KZVEyHwdfOh84ACBuGfhDwlJMct9RRMKF1kus
	WuVUUmppxTYQWDFZ2lQk7qToiUtaCMhX04t
X-Google-Smtp-Source: AGHT+IEoOwqmXLSWJrfFGPq1X/lqU7lmgJSDFE3cyed9v3FPDU7TwAhBSs+jRZT7+wJPuPjM/D62Fw==
X-Received: by 2002:a05:600c:21d5:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-4792eb19cedmr20933495e9.6.1764847878888;
        Thu, 04 Dec 2025 03:31:18 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 3/5] module.bbclass: Prepare out-of-tree rust module compilation
Date: Thu,  4 Dec 2025 12:30:56 +0100
Message-ID: <20251204113058.948115-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
References: <20251204113058.948115-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227284

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5d..7dbd4194d17 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"


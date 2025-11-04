Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31161CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:16:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1227.1762276559648402681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U+XGwewk;
 spf=pass (domain: smile.fr, ip: 209.85.167.47, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59435d82c1fso872424e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 09:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762276557; x=1762881357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpNk9RbexuHpGVayc9U01Igp96Entj+/CrEHSg3yAcA=;
        b=U+XGwewkrNTpx3IvdytVi0206yi1oIdrGO7f+k4ZKtGJ272Jpbdk4ggkd3/jWrrFGC
         krr+oDQAgLYI41xeAqeG4tXzSDGlAr8to8CX3z7fLozZTRIkRVUwtlROsWPEmtx+SjOI
         p6bpIUBD3FKdz6X9dF66udV/03q07SSVm6Th4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276557; x=1762881357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpNk9RbexuHpGVayc9U01Igp96Entj+/CrEHSg3yAcA=;
        b=PnzTyI2EaIBMAQbM1yVx6wP3qiRV1E9FDzFRW8DcIvVmWwo/x57aFmdFKRsn7avmKy
         9bcLbYNmYSCxnNfGPoOkK+GduEaL+2Xpr3nREN3P7G2E/h94guASTiMUD2nHVTKHjepE
         XpCOp5x7UhXQYDCREYxOw37JzoQXvLOTPp0cs6nD2vOl0/HqEQvKRqJhKkRxRbc87O8c
         xvUZwq8hMUp7Wi2RE0x9hEiSRsOry5IZDAks63eilJ6of0TlsCmPuk+HhOJL0mLdqmkw
         7RvGIOByFR//khJYeXvFQHVXz6vAfqjVZWQLfmLfBsM0zm6WSkEw0hbXbjKJEUvHKjkU
         9IaQ==
X-Gm-Message-State: AOJu0Yzuc9CjMXwveryKXrK8gigZrRgx1O2csf8pjn+iaQR+b5qi5fnp
	dMRDg8fU3Aln29QxYAtEbLuxtr+Fpk0JD5Lkfc9jB6M0RZcAR12fsBAuHU+WMOvE8ipXf4z2qWP
	dIHMuFCw=
X-Gm-Gg: ASbGncsPPdUK4Qp8k7rirHBipmxHmEpuJJkq5pdIB13qUyuD1DsZSL74Fgj0LiWxwMH
	kXnaoW01gvkyWyAQc1ntOWckRyiGk4oc04b712axL4t1xoHh2zC3e+bEm2mfoOjLQHC2YfkQPK1
	Eojqe3DF1hQD35CxzeIztcBqhLDw8tiwlSsYMW/fU59+kNMmtITOgOkFfGZ2oOrO2lc1/Q5OdOH
	hs7Ch+4kYxm1Y0/d58zzcq1RwNkED5hWSQ+nm7CsYZvqMIqOgKflKfzl/fJwoEBZzpTDg5Ih7md
	NzUTKlCs3drVX004puKwp6x9PnTC7vtkhs6CP5W1Al1F8x0Vhb2LvUmObKmbl/7IkWEMtQMSlE9
	sTkIRab/LrAQlfrlzaLnxJbz+PN8uAH/HhYHvD9JtT5xhdhoc0S7P16L1LaVcM51COdMvZmFB/J
	Icj3k2EeXrLu95zH3KSKBnKis8Dcfv0X5Yjs+2vpC/5qfFoAfH8szpaiNfPDOzMhQbd5ulEw==
X-Google-Smtp-Source: AGHT+IERsulMTSAhRjCyopODi3yH/7pEWBCClHL3T2YY/7iH+/Ol7thxbhsIT735ihhsvvLz0+uSpg==
X-Received: by 2002:a05:6512:68f:b0:594:2f72:2f6b with SMTP id 2adb3069b0e04-5942f7233famr2237598e87.10.1762276557393;
        Tue, 04 Nov 2025 09:15:57 -0800 (PST)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efd1sm914407e87.4.2025.11.04.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:57 -0800 (PST)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [RFC PATCH 3/4] rust-native: Conditionally install sources for kernel builds
Date: Tue,  4 Nov 2025 18:16:10 +0100
Message-ID: <20251104171611.2227798-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225739

The Linux kernel build, when Rust is enabled, requires the Rust
standard library sources (core, alloc, etc.) to be present in the
rust-native toolchain. Without these sources, the 'make rustavailable'
check fails, and Rust support cannot be enabled.

This patch adds the logic to install these sources.
The action is gated by the 'rust-kernel' DISTRO_FEATURES flag.

NOTE: For this conditional logic, the native build
environment must be made aware of the 'rust-kernel' feature.
Therefore, 'DISTRO_FEATURES_FILTER_NATIVE' (defined in
meta/conf/bitbake.conf) must be modified (e.g., in local.conf)
to include 'rust-kernel'.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 0319d73b93..e3d68e6d93 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -425,3 +425,11 @@ RUSTLIB_DEP:class-nativesdk = ""
 INSANE_SKIP:${PN} = "staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append:class-native() {
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            install -d ${D}${libdir}/rustlib/src/rust
+            cp -r ${S}/library/ ${D}${libdir}/rustlib/src/rust/
+        fi
+}
+FILES:${PN}:append:class-native = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' ${libdir}/rustlib/src/rust', '', d)}"


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5CAC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.3399.1647298123714452172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K0HI9xO7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so443939wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyBm7EWOuF/R2eD4zNLjjr+2z3VNCf1neF53jvvShAk=;
        b=K0HI9xO7blQ5DPfsFpfFnhwwh8745E7pEbWXCv8Dg7A2XOs7t4tuMEAcuCm57mlWX1
         MjMtVF2lEV2YrkziOri034LtcXkH+PUcF/AUlRS3g6Pou7toHSOsxmMZnPjr/Ml+EnEU
         7YmTeH1te800RNO8mbwwp6ehA7PTZIrG0ljxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tyBm7EWOuF/R2eD4zNLjjr+2z3VNCf1neF53jvvShAk=;
        b=YwFItZzo2w1DeUMFgLhERXjLa24QJwIdzrwXM1eiSebmZjJ0Ur2rUzFG7gy6NsTjvC
         ZEvH9wQX3/9LNSGGFKKWy+dOav6GXUK+gQecAol/xyEHRGzGSMeGTEEXBX8FuDR87iYv
         MIXDnDgDqUVMXAxfLy3chgeTcsZG0er5UobS95l6d2THASJgCAw+gqgtz8cnJnCbpkG2
         x3RMOKXdqGhqjkyxg/6aQFkgx9YetbcuOxSDNdJUUIbJn0JnvE9HRPXOux1OaU81TOJg
         IgV5FS3Xivro1MX04IeZBW2Pup2YSaag1g0ACKW52OoUjjgW4lrFNyx3V5XflJ8zOWCP
         LB6g==
X-Gm-Message-State: AOAM533cmqRUzTtXXreUM2VWMCQ+jWXSHt34hIAKBYf6ueSm7BWAJzzp
	+dth240QRl127PJX89r1IXb4NQccByaxqVdZ
X-Google-Smtp-Source: 
 ABdhPJxcVHp5yh3R0rXtPWr5HOrPk/nrywmzRPbZkHgYGnKMpRxLBY7Rhl7reWYjoOGiA6U4L+mCXg==
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id
 s17-20020a1cf211000000b003816c60742fmr1022984wmc.130.1647298121750;
        Mon, 14 Mar 2022 15:48:41 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 03/33] pyo3.bbclass: move from meta-python
Date: Mon, 14 Mar 2022 22:48:07 +0000
Message-Id: <20220314224837.834776-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163169

From: Tim Orling <tim.orling@konsulko.com>

PyO3 provides Rust bindings for Python, including tools for creating native
Python extension modules. Running and interacting with Python code from a
Rust binary is also supported.

This class sets up the cross-compilation environment.

Export PYO3_CROSS, PYO3_CROSS_LIB_DIR, PYO3_CROSS_INCLUDE_DIR and CARGO_BUILD_TARGET
to inform tools like setuptools-rust we are cross-compiling.

Export RUSTFLAGS so cargo can find 'std' and 'core' for target

Dynamically generate PyO3 config file and export PYO3_CONFIG_FILE
absolute path. This is the trick that finally made pyo3 work.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/pyo3.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/classes/pyo3.bbclass

diff --git a/meta/classes/pyo3.bbclass b/meta/classes/pyo3.bbclass
new file mode 100644
index 00000000000..6ce21329c2e
--- /dev/null
+++ b/meta/classes/pyo3.bbclass
@@ -0,0 +1,30 @@
+#
+# This class helps make sure that Python extensions built with PyO3
+# and setuptools_rust properly set up the environment for cross compilation
+#
+
+inherit cargo python3-dir siteinfo
+
+export PYO3_CROSS="1"
+export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
+export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
+export CARGO_BUILD_TARGET="${HOST_SYS}"
+export RUSTFLAGS
+export PYO3_PYTHON="${PYTHON}"
+export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
+
+pyo3_do_configure () {
+    cat > ${WORKDIR}/pyo3.config << EOF
+implementation=CPython
+version=${PYTHON_BASEVERSION}
+shared=true
+abi3=false
+lib_name=${PYTHON_DIR}
+lib_dir=${STAGING_LIBDIR}
+pointer_width=${SITEINFO_BITS}
+build_flags=WITH_THREAD
+suppress_build_script_link_lines=false
+EOF
+}
+
+EXPORT_FUNCTIONS do_configure
-- 
2.32.0



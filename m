Return-Path: <ines.kchelfi@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26468C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:09:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9121.1747386584212645867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wKUTtZy6;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a35da8bd67so434217f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747386582; x=1747991382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qe8r4L7uvVmk74/psSbJCQ2FZqIVfQgafrv8iOEJtdI=;
        b=wKUTtZy621S4/M8p40mU9U2wBtBZXXo9ZrHF0TYqaZ349LaCUIWIOAg0EfKS31IJ0E
         RJ/A6m0kOQuvLf/k2N+uc4Df21qslT48wXb9L7Cq6OSUOXJ9Dpc7MfipoRom6EdZHqFz
         gBcHtemJWszbISW6BmUEoVXRD+uJ/VU1aH7r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386582; x=1747991382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe8r4L7uvVmk74/psSbJCQ2FZqIVfQgafrv8iOEJtdI=;
        b=O8ijrGRDDbSp1PbyZi5/ZTJ/mcJhrIPoMXz9Is8KA3bAH5ojHx4aZpJd6603tl9NKP
         8+h50mpnWXdsdxqJMADAW9tgELjxjWraYLob9exSJTAMEYirSY/2OHgKibs2iGTKm9yv
         YOwEHNpcVW0BMkuQ9XOqcfoDYRWvYeQzwaWNcZ8+Ia84q/xS74ajIgNCirkEtra/BUUV
         rcBYeR/5POeHHBDFH4vcanCWWxrdOJvK7PKbdloFsmqp4sjpweGsu1Hw0uyLIKWd4TUZ
         eSBreQNfymeSJc7ocZIvCKMGfyY9yiIHxIB8KC8m0wJGam3yxs4aN7uJuk1sNAXbPodr
         Lwtw==
X-Gm-Message-State: AOJu0YxxJt5uewUdC4jDZsQ8sKDsKfBT2wMzWdZK8dxVc1Vr6/CI2VDU
	CTcKWrlD418o7Wp8KNYdBuqGbVa5L7t/ST8OhANM2GiwdK+t10z9Vjpiwhphq8u3SxcsnHQbDW0
	14nUb
X-Gm-Gg: ASbGncu9zrdDSVJGHdNCyNtTAR1uUvtppgTCQEz8aYbuxM53CHwsl7SwWktYX+fmtDZ
	dyUZFfjZPQG/Dp98BJ6Gw9qB0Wu9CgkRV6C2fLZuEPRPSxSoSmz9faVC1srAMvNPGe+ZCdLXsDI
	2CNPfeVIcFMd3kC5zSunvAIc5ICDYz1F0gxrNpo28nNb9Vm7Ytv7cTXSF+CPoyOVysHBzhRtnGr
	NnKpxUR+7gVx85WZRBzx+i56LcK6MugASl/VDz/rdG9c1MgTyzuBH7yLEmcnTwkWhicazlB3o7o
	CoJuwDGCSJNzwDHDun4yd+GIpyOdhnZ3dk35T7+eAvXm8Cfzz1wiKt9cW7SNa9BiZg8FM3meGmT
	0Rj24mmYwqJt5BGpGFtBGyDmyyZ4QGaeaUQn4AG1RD+oUuT2Suc5U9tP3CA==
X-Google-Smtp-Source: AGHT+IHi4xCq6h5UhKrI4ypNLY4bBZv+k+ayZfsbdvqpBt/tI35OPZoHK2Iy/brQPyMZhg3LPoTUwg==
X-Received: by 2002:a5d:64cc:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3a35fe5bb1bmr1578739f8f.8.1747386582447;
        Fri, 16 May 2025 02:09:42 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6294bsm2229132f8f.51.2025.05.16.02.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:09:42 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH] insane.bbclass: Add unimplemented-ptest detection for cargo-based tests
Date: Fri, 16 May 2025 11:09:11 +0200
Message-ID: <20250516090910.972704-2-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216726

From: Ines KCHELFI <ines.kchelfi@smile.fr>

Extend unimplemented-ptest QA check to detect Rust tests.
Note: To enable this QA check, add the following to your local.conf:
  WARN_QA += "unimplemented-ptest"

Examples of Rust-based meta-oe packages triggering unimplemented-ptest:

WARNING: cbindgen-0.28.0-r0 do_patch: QA Issue: cbindgen: cargo-based tests detected [unimplemented-ptest]
WARNING: fdfindd-10.2-r0 do_patch: QA Issue: fdfindd: cargo-based tests detected [unimplemented-ptest]
WARNING: deqp-runner-0.20.3-r0 do_patch: QA Issue: deqp-runner: cargo-based tests detected [unimplemented-ptest]
WARNING: bindgen-cli-0.71.1-r0 do_patch: QA Issue: bindgen-cli: cargo-based tests detected [unimplemented-ptest]
WARNING: python3-maturin-1.8.3-r0 do_patch: QA Issue: python3-maturin: cargo-based tests detected [unimplemented-ptest]
WARNING: uutils-coreutils-0.0.30-r0 do_patch: QA Issue: uutils-coreutils: cargo-based tests detected [unimplemented-ptest]

Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
---
 meta/classes-global/insane.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index cd26bf5eb9..152bef8ad5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1332,6 +1332,13 @@ python do_qa_patch() {
     elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
         oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
 
+    # Detect cargo-based tests
+    elif os.path.exists(os.path.join(srcdir, "Cargo.toml")) and (
+        match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*test\s*\]') or 
+        match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*cfg\s*\(\s*test\s*\)\s*\]')
+    ):
+        oe.qa.handle_error("unimplemented-ptest", "%s: cargo-based tests detected" % d.getVar('PN'), d)
+
     # Last resort, detect a test directory in sources
     elif os.path.exists(srcdir) and any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
         oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory detected" % d.getVar('PN'), d)
-- 
2.43.0



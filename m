Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.17229.1621247757502330403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QtnxvPq/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 27so3051484pgy.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vquc/OZM5e+3lRDg5GKAUt8hM4DPTCBKmiYi3f3asLo=;
        b=QtnxvPq/xTNqllxnw5IkmKKoGEpyRsZacxCefP+l+NwbBMBvPHd+M7dP2Nnls82RWi
         Jqoc3/Cs66Uq5xztW506jKneonJeJxgtjCxDoeZawUtJnxnzVgU+NSBa4DXDjguIEBwH
         MlcQFTXmP87Ss1v6j0XZH3opTrXxhNpWkmbazTlv0KAZE11w1FMcqsdJ8Z323Y/Clq8A
         laMphftjVVplKxpDB9ciMEAWhmyRa+m7X0Urco77na/nDHCkNcIH1vyBm2OrLqVH4uTT
         P6kbMLPDqngUfqa16OQzGBWbEqBNyMBObH0u3cp1X1MWVCb6G+hB+j9RAqCskk6HsI7z
         URzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vquc/OZM5e+3lRDg5GKAUt8hM4DPTCBKmiYi3f3asLo=;
        b=WrQ+zhueLIG7H1t7Gxx6ri22im9woQmm0JJ3mW0aPQtzJG/BL5j/Nd8e7OwQqjQk0E
         VJWAux+BNLUBud6nmwsefQ7TO5RlUnKka1Gp2eKsEW2YeGABxruQ28nZ9crCmngKkriX
         LfxJ1zhaA6cMyUHOF6qqJc0uHh4ZOh+XVvwOsEXixwvqwGbRO4mJIYO8z4I0c6J9Mx7X
         3NUC4/rBfOjg0zem3zLzXix7J+FUAniH3w8jwrMnPZuOjN33qpA/q3gnCZSNKtiLKPzd
         h/iSfqjcohr2/TaSIp8+nMzeuj+m4mftEwa5SiEfCDTHyKS7gTUuktEpUOfiTTluwuVE
         J15A==
X-Gm-Message-State: AOAM533/cDVfOFsLr+9GfRM3oRSYqP8NqM7TxO1gJ/5LD805NqnrvCs2
	dNzZCf+erQp/sJbTR6h0N/uuf0jilRhjLqp0
X-Google-Smtp-Source: ABdhPJwjqPP6s67pYEEEju/V22cjiN/6Iov4YXZwPwxOBG5Ylp7gde+5gErdQOlU4bPIhWdqi7Gpsw==
X-Received: by 2002:a05:6a00:b48:b029:2a0:583e:3dd4 with SMTP id p8-20020a056a000b48b02902a0583e3dd4mr55584888pfo.6.1621247756649;
        Mon, 17 May 2021 03:35:56 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:56 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Mon, 17 May 2021 03:35:27 -0700
Message-Id: <20210517103528.24434-6-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

The rust test involves qemuimage for testing, so
"run_check_emulated" involves building of "remote-test-server",
qemuimage and test execution.

We are booting qemuimage in "nographic" and "slirp" mode along with
additional qemuparams,
'-monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null'

Note:
'-serial mon:stdio -serial' :  To fix below run-time errors while testing
"failed with Connection reset by peer"

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..4efbf9306f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+
+	def run_check_emulated(self, *args, **kwargs):
+		# build remote-test-server before image build
+		recipe = "rust-testsuite"	
+		bitbake("{} -c compile".format(recipe))
+
+		# build core-image-minimal with required packages
+		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+		features = []
+		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+		self.write_config("\n".join(features))
+		bitbake("core-image-minimal")
+		# wrap the execution with a qemu instance
+		with runqemu("core-image-minimal", runqemuparams = "nographic slirp", qemuparams= " -monitor \
+                        telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null") as qemu:
+			recipe = "rust-testsuite"
+			bitbake("{} -c check".format(recipe))
+
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1


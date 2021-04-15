Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.4619.1618479278151512413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AH+Fas9P;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id j7so11739072plx.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B5Mi4CrmlMOARqdN+Fz7R7GANRwB2Ep5mwIkCRVvpIM=;
        b=AH+Fas9PJlaXB0XuhrS0cN9cjPRTxPGmzmUtayMzotycaZiXaDQ/eqsM08l788B7Od
         dpVz7wng0XQpuyluFP9vDIL+GrKghINeegl+/9xgxVXQJBhEQtViJ2YTv+p64976XnR+
         Yzubv+y0MJgZ03ZhE7A4BXzy1PcVXVQYMlc2CAH3CRg3M71L/zT4XE6Loje1BF5O2e3P
         lu8oaN4R92+3YjhGEYkyCzq+hdAtGPYLlWdx1eDz0HkhgBc2ysiFFUY0Hw7BpT8yJohE
         0T9PkN8m6HeZwp1YsVl9bU7d2pd9MQzsW623K/H6OeVMEkIgyR+nePwhcsfmlpn4LgHk
         fY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B5Mi4CrmlMOARqdN+Fz7R7GANRwB2Ep5mwIkCRVvpIM=;
        b=mAIT5UD18MwKoyGuGkUTN10qM+AMiOYidkkVzeNktaayAo0fasKfZjQNCjDosYVa5E
         zWM7eZOvjY8aF6OP/CC24mmbBHvnl//N03WRf2ukQwmhowkNScJV8w+EhGgK2hB1ke3y
         Mdg88JGvRgM6d6cLnCYZBvYUo9zqzI2CL/TSZnDcaI6+JTouq7w1sL4WkHbMZwxt5pAR
         Kb20yWFvNHNRjBjau187y7e9q48gp/jJKBETj53V9v0PN2au2V5XHdHUFW7LId2ENWx4
         KTGwbPIdPRgwCtclhq27sUwsVfMByzVR/gYKOEXdB7aysUAYd6lGiILS3f7v2FhhvQoU
         R2/Q==
X-Gm-Message-State: AOAM533xp5+tp0y4A4WDjYUKoYC9LI8DXoFOZYdTLRR2Eqke6fYhwf8v
	8MjNZOHYzkXut1saFBS92F5UiXTDZFRXxmcn
X-Google-Smtp-Source: ABdhPJyxsvkse30bOw216xZIaXfkjIg3zoD9rdvdIDm6/6bI+pVhwoCKVHn9SOlod3efEZ+217k4pA==
X-Received: by 2002:a17:90b:4a04:: with SMTP id kk4mr3067402pjb.68.1618479277432;
        Thu, 15 Apr 2021 02:34:37 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:34:37 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 3/8] The rust.py is oe-selftest script to build remote-test-server, qemu-image and boot image in slirp mode. Once the image gets booted throgh "check" the testing starts by copying the "remote-test-server" in to the image.
Date: Thu, 15 Apr 2021 02:32:22 -0700
Message-Id: <20210415093227.175608-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..62851256c2
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+
+	def run_check(self, *suites, ssh = None):
+		# configure ssh target
+		features = []
+		if ssh is not None:
+			features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+			features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
+			features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
+			features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
+		self.write_config("\n".join(features))
+
+		# Start testing once the remote-test-server is ready and image is booted.
+		recipe = "rust-test"
+		bitbake("{} -c check".format(recipe))
+
+	def run_check_emulated(self, *args, **kwargs):
+		# build remote-test-server before image build
+		recipe = "rust-test"	
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
+		with runqemu("core-image-minimal", runqemuparams = "nographic slirp") as qemu:
+			return self.run_check(*args, ssh=qemu.ip, **kwargs)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1


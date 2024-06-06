Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3ECC25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:07:02 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.12577.1717675620893922112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=c0hpKNb0;
 spf=pass (domain: snapchat.com, ip: 209.85.208.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57aaaf0eb0dso679734a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717675618; x=1718280418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kl7dGUZAWqyIotBXjJBs8emJRxhT8DDhldcgadFleyE=;
        b=c0hpKNb0SsikpgKgIPf3wfVoXidDLMk53B3j6EajYC3yEYlXObCwmCKhwOR4le+oUg
         rZoP48c3eYW1ZC/roY2hqFIDGLe58mHi6cXlvqvCCZd+JBoVy3SSLg/gl/Gp9cgBBeLT
         8FmIBbSe/0284GwC0ds3JSdrCXEq8/nM9O4hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675618; x=1718280418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kl7dGUZAWqyIotBXjJBs8emJRxhT8DDhldcgadFleyE=;
        b=n8tbelsra5aQYaNAEP/4nwJPmFLQx6E9t7g7yBTZoofJSWflurr0qv4qPl+qo3fKKH
         vr/6E7FfjPc889cGVvwb+AaZAkRsZuKIrJkvOF9K/puWhSMZdbOHluvJvA/l0yELRXT0
         ZRKT0r5Q11+3m7TTAKv3vyKsOEc3Rhg8RFC7mK+vN+8k/onBl6P58pPFwK/TO2VjqJ39
         Gamod1x+exhmu1DgxwjvR2INGgVPw+kEA2o4QkfKHX+aVAronpzqpu/w4DaeTZ3Wl7tO
         17BePd2hA29/n6fkiwYDP/yzqaTHyenSGNCmvQ8vcSfAKu6TKXf3Fy2MIDsogHI6BXpG
         Ou6A==
X-Gm-Message-State: AOJu0Yxb3Bb45DuaPEFJuVvu3xrLeKcukzWmHcNDGNz8kOfL2qRuB1iK
	nq3qtKw8SXAKJN1t2i3T02q+KlGxCwDE3uq5hfHi53uHBNgve1gbuuUthro01/GH9cE3mrZqIgc
	bvLM=
X-Google-Smtp-Source: AGHT+IEhQt+2BVgLrvS/4X9qKeG2c7dWsvEbapanzajQw5IGKH8haz3YQRGwXCSY2Ty+8oCWKDqhBQ==
X-Received: by 2002:a17:906:b207:b0:a69:7d72:b0d6 with SMTP id a640c23a62f3a-a69a0266a55mr339873066b.71.1717675618122;
        Thu, 06 Jun 2024 05:06:58 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805cc3a4sm89422066b.69.2024.06.06.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:06:57 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v3] selftests: add test_minidebuginfo_qemu
Date: Thu,  6 Jun 2024 14:06:51 +0200
Message-Id: <20240606120651.1158780-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200396

From: Etienne Cordonnier <ecordonnier@snap.com>

test_systemd_coredump_minidebuginfo was getting skipped in CI, because the feature isn't enabled per default in any image at the moment.
Add this selftest so that test_systemd_coredump_minidebuginfo gets executed in CI.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index 2919f07939..a8923460f9 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -8,6 +8,7 @@ import subprocess
 import tempfile
 import shutil
 
+from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
 
@@ -42,3 +43,18 @@ IMAGE_FSTYPES = "tar.bz2"
                     native_sysroot = native_sysroot, target_sys = target_sys)
             self.assertIn(".gnu_debugdata", r.output)
 
+    @OETestTag("runqemu")
+    def test_minidebuginfo_qemu(self):
+        """
+        Test minidebuginfo inside a qemu.
+        This runs test_systemd_coredump_minidebuginfo and other minidebuginfo runtime tests which may be added in the future.
+        """
+
+        self.write_config("""
+DISTRO_FEATURES:append = " minidebuginfo"
+INIT_MANAGER = "systemd"
+IMAGE_CLASSES += "testimage"
+TEST_SUITES = "ping ssh systemd"
+        """)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
-- 
2.36.1.vfs.0.0



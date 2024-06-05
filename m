Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DC9C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 13:17:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.15155.1717593455688106266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 06:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=a3mpwlE9;
 spf=pass (domain: snapchat.com, ip: 209.85.210.171, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-702548b056aso3644519b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717593454; x=1718198254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXYt1Kc3Fm2UDybDOXXAO5a9mAjNvHyN094TGBYNfVE=;
        b=a3mpwlE94ukh9k5rRrWPtXdC/uJARAbAi5mjXDNp98msD9ZZfq5GQWkazvnsEBHdHx
         jOFotvu2EKkCBzJcKXGCTvVITnZm4HR4GQKlGBEY8Hm8WAZe0QLC4ynzrOuhU5A1SFAc
         pWuwbWAG0kF/MHh8/8eWf3PlMWzP+cSM46iPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717593454; x=1718198254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXYt1Kc3Fm2UDybDOXXAO5a9mAjNvHyN094TGBYNfVE=;
        b=egKoDRUKaERYS0jiwkLzo5QaBytHbSpO3MwbI9ts8V/Np7KqKEU8dXHhAUqGxm6LAp
         x/DAvnpL/v8i0R3xumgN0OgMu6tcgoKdPuduL1lRAmpv8Y0AJjWuI12GBtXsbBDrssCQ
         v79lEYH0cbusH3iOJhytEptUiVvldIYoESY6HEO82LHQ26AskLaeFK/aJWNSSsSFr/X2
         L2ZDGaKRtYVWLn4HYZOx8mT9j+Qqs3cJ07Eyz1ree3LKmDxdNdIBynWRam8G3yRnEmq1
         sAw2DZ2qjFPoiHlongiOF8nPPb/eHro4UjiS78vMdW9LNAcWThidDEMvGyeVESqvCP6/
         pHig==
X-Gm-Message-State: AOJu0YzV2QlE204rLdwfp8q0jmbCtfYVUS3/yjg0hz+E6/qsVYv7nIL2
	k+nMTt0+zIy6iT8EvY9jNlkQOJZoLefDH3qwa9twLcx90wSolCgP6BJonNcoQxK/NefNLo6SXQS
	dspQ=
X-Google-Smtp-Source: AGHT+IF6T3aaL8YyC8UHyG3ikZsPSk/ZZPVJDh0MgAQDqsFl5xK/ApHb1H3qPJd9nLFGHx8elyR1Kw==
X-Received: by 2002:a05:6a00:2e19:b0:6ea:914e:a108 with SMTP id d2e1a72fcca58-703e597dccemr2797851b3a.12.1717593454173;
        Wed, 05 Jun 2024 06:17:34 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242aea177sm8605182b3a.110.2024.06.05.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:17:33 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2] selftests: add test_minidebuginfo_qemu
Date: Wed,  5 Jun 2024 15:17:27 +0200
Message-Id: <20240605131727.2647983-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 13:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200367

From: Etienne Cordonnier <ecordonnier@snap.com>

test_systemd_coredump_minidebuginfo was getting skipped in CI, because the
minidebuginfo feature isn't enabled per default in any image at the moment.

Add this selftest so that test_systemd_coredump_minidebuginfo gets executed in
CI.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index 2919f07939..a64b334d77 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -8,6 +8,7 @@ import subprocess
 import tempfile
 import shutil
 
+from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
 
@@ -42,3 +43,20 @@ IMAGE_FSTYPES = "tar.bz2"
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
+DISTRO_FEATURES:append = " minidebuginfo usrmerge systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
+IMAGE_CLASSES += "testimage"
+TEST_SUITES = "ping ssh systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+        """)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
-- 
2.36.1.vfs.0.0



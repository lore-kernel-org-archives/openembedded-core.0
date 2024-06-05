Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451E4C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 13:08:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.14843.1717592931456147523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 06:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cPqUtrUx;
 spf=pass (domain: snapchat.com, ip: 209.85.214.170, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f48b825d8cso19860755ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717592930; x=1718197730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39uYd3/yRYhwyj8SGr/W02jXmTrDv+V83B8byoFbHC8=;
        b=cPqUtrUxIlZ5YPSXL96zabAsiqvS59R8TsvMpmITMYxl6GI2TrHoE0qER7+q694eW+
         Epb9IgwrkbJqZkTuIMFDk0ev3guPTOVt7trBdyef7nUJeDei5TrsRNGgtgnIoT9MChfc
         oQKLozEWdVETYlrJJ+paOquek63onVT0XLV54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717592930; x=1718197730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39uYd3/yRYhwyj8SGr/W02jXmTrDv+V83B8byoFbHC8=;
        b=rXJyU9krEj2ks7psmCXVOD564iXYuHgf0y8YxGAT/F+lQrijNQwuyJpAud0FExbFJ8
         MVO1F2aejzizUTisXdjzI7uZFL4DlGkKJcxR+SxpO85o1O7MbIIpxPdAvaOtPRuI4s9I
         8bugw3t1Tzw7EkryyET00JgEf4tPprcwdHwxEQhoFTm3rV4mnH3LAfLgo3AwAaP7Quie
         hqzqhbHZ/h3L0r4xTB4bwvvkmqCT3PLoUIp2XfejK2ronP1Mo0grZ/14vTDv4tvdOKr0
         9EULbOOw0GLdv6IX6IVqoaN+gOW1Hx11rMl5vmB87hIZfirWIWYRQryqyyN+9Mi1/ve4
         Xl8Q==
X-Gm-Message-State: AOJu0YzyydJ2wSd1S08YfAizkOQuufb0jb0HKiE/S6u3MX2/dWR+i/F0
	p2Z5y/rcGNH5YQmbqb9u/7UFCx/MQZxWFCVJZ1lwqT+iPVPzt3lzZK2kEiSNZvWEdQWFwr0wXPf
	QA6A=
X-Google-Smtp-Source: AGHT+IFNYEmJ/UYtE4NdinBXA7naMSwhJ/KwX2wojbhGVilGFkYIIqXBHIAEwy3DlNNtbvpaY0SFqg==
X-Received: by 2002:a17:902:d50c:b0:1f6:70fe:76bf with SMTP id d9443c01a7336-1f6a5a05229mr28770415ad.14.1717592930330;
        Wed, 05 Jun 2024 06:08:50 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d315sm101459695ad.293.2024.06.05.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:08:49 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] selftests: add test_minidebuginfo_qemu
Date: Wed,  5 Jun 2024 15:08:38 +0200
Message-Id: <20240605130838.2643358-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 13:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200365

From: Etienne Cordonnier <ecordonnier@snap.com>

test_minidebuginfo_qemu was getting skipped in CI, because the feature isn't enabled per default in any image at the moment.
Add this selftest so that test_minidebuginfo_qemu gets executed in CI.

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



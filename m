Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7648C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.9212.1739023522518808742
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pGqkLQI+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f48ab13d5so44054225ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023522; x=1739628322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbbxrql7Iutj/myx14Cfcalewu+8I3McCY+wQyizWHk=;
        b=pGqkLQI+hy+dgfFANMjmfjpZAychFoz1uRrxf+4fp9VxGvIIGNyMRy0F6jgDxUv7uJ
         E5jNVEAHI4JwHxTZ3+nddenjxyAdSN5YzhrS2OScpcRcywtLz48ahOBH7AaY97roVikr
         2yoGE1NUTKORb0SKBk+L1fM5RhV+KSIVGurONa6zAxU+TxxmUHthkSfCb68cD0f5RXd0
         TmAcHpSB3Ac9Uq1P4/uhY+TfxoDyYb16NCbVTVa+gMNOQjAk1kNHZxqku6U9XDvoQYiY
         aglMxrTD6tO95t3bcPZcSqe8AfevRnmUGj72AaMQTL4BVd23ia0DjrP9NO18VNPXfPb4
         YtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023522; x=1739628322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbbxrql7Iutj/myx14Cfcalewu+8I3McCY+wQyizWHk=;
        b=ie5RZrZakl67LAB6EZOMzdPylDrCpjsyfACm6vMVpnxc69Fl67FSLCM6J/V4V8UhSy
         yvfHqG3fhoyLD6uwQUd0lfj7wCwzVFHFzVAoLjUY3e8F+FULEnN7M30wNkAfW392PGIG
         qGnyWDtTl+9PJlWYim8YcRMEi3cSfWmaIvDq8vkNbnrfEVmso9PT7IHDQPKFK+cDUKBs
         SuWxF4dVk8NaITNrDGdz9rP1pnb2mEJs66pA/9DR8aADB0YKpoSfZ5TMSDEqFq+ZtHU4
         P4vAkUAPXJv1hVroqZkQLiwG550DqbR5D+k2yBe3Auy3pAL6Q+PZvp2q5oeZIKNKBI+p
         gtUw==
X-Gm-Message-State: AOJu0YxQu81+MIGWOAF96MN3sQY8hZ0TBdgpCXD9gIwKj1TDZCtaibaf
	1BzLUDJ3BS9Iv5La9HnKahfDdmfD1EVrf6G7XbLHzZ6KfhCA1QpqxZwrkXzTOY8sLY2g5RBJ7cN
	E
X-Gm-Gg: ASbGncsSocArjpRsbkePGpRq5Wg/HDRNCR6pJG3rkFZMH6QwPilDhlOq6yBD0uGh/qy
	k7CMl9T/dgBhEKZxG29TQjGchUzijt2Ng5nCN2ZgYU8KqjD9Rr4JD8XW/GdfqLAOs0RW1ziabaA
	l6Drut75azY3t9YfnFulrK34sqGwKRTXfhgiZ/XGJ1H0fwz8NCX428LRPPXMna6D+s462HRn3EZ
	ObV7iKIl30ooJHjWYGe5kvoWL/fCuBP8Edjyb/FCnNeyf4c42i3ceC3301dXzBWqtpZpaCWZJn7
	0E1g
X-Google-Smtp-Source: AGHT+IH3fGPq4U7UVGohhRDAZH9HoqupStnxggBsipFTb2KX7B2XVOSCBdIMfXTuxHkxth8ejPI7Nw==
X-Received: by 2002:a17:902:f790:b0:21f:6896:f80 with SMTP id d9443c01a7336-21f68961121mr42538235ad.9.1739023521841;
        Sat, 08 Feb 2025 06:05:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/13] oeqa/selftest/rust: skip on all MIPS platforms
Date: Sat,  8 Feb 2025 06:04:59 -0800
Message-ID: <681f5ea8d6a5050aebfb1f656da9ba679433e366.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211032

From: Ross Burton <ross.burton@arm.com>

As per "The rustc book"[1], mips*-unknown-linux-* are "tier 3" targets:

  Tier 3 targets are those which the Rust codebase has support for, but
  which the Rust project does not build or test automatically, so they
  may or may not work.

We already skip qemumips in this selftest, but we're now also seeing
failures with qemumips64 so refactor the test to skip all machines where
the architecture is mips or mips64.

[1] https://doc.rust-lang.org/nightly/rustc/platform-support.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 177e268811c04260923ac4b16fa047315304add0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ad14189c6d..ca98f8c0fd 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -3,6 +3,7 @@ import os
 import subprocess
 import time
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfArch
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
@@ -38,15 +39,12 @@ def parse_results(filename):
 @OETestTag("toolchain-user")
 @OETestTag("runqemu")
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
+
+    @skipIfArch(['mips', 'mips64'])
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
         #self.skipTest("The Rust Oe-selftest is disabled.")
 
-        # Skip mips32 target since it is unstable with rust tests
-        machine = get_bb_var('MACHINE')
-        if machine == "qemumips":
-            self.skipTest("The mips32 target is skipped for Rust Oe-selftest.")
-
         # build remote-test-server before image build
         recipe = "rust"
         start_time = time.time()
-- 
2.43.0



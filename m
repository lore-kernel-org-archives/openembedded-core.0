Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4136C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:27:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.13933.1745497942514894241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rAXbGqxo;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1227561f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745497941; x=1746102741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rVembdHevuHAqpuL0kwh/o4sz8A89EhbjqJ+sO97Uc=;
        b=rAXbGqxolbM84rcBMs9xm7xNvntqYaEVeO0CtQBYdny0Y6DtbcusF2kbD7p3y4TmPh
         Badgg4VjgFMk2+Mzx150mDY1Ulha6xSInLDvRo3f3Ne3B6nZ6RqAnU0tGf9r/eelwt8/
         6MVYBh4o91nZ4+HgiOG4yyMSKBy1Eqpq1OmFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497941; x=1746102741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rVembdHevuHAqpuL0kwh/o4sz8A89EhbjqJ+sO97Uc=;
        b=ZomttPRPXCIbTPzOYFko1+WBEoI2x1Zx6+ZFWHC5oUFGzW8utvgoqHv4o2hHO2gLL6
         LxbT7/+m6Fx3lVMbQwZzA4Rz6JZcqXZcg+tdSDu6wKY9GfNJMMOPj4X0ITksCi1e7GW2
         wgY6nFyndwlxC8WkjHtE64+EfXbw+79ew1ibmiNudl6cViaqOAQlvsJ4gSksk7o8MjoG
         quf9pbIZBmLVwZLSEdrdC7rBLxaH+AdY4f8F7crp7+tybpoWd6u+OG+N7XJVjI4z1KI9
         wosUuBi7FpLRa6u3IHx1ZPttvinwa0sckVYaSxr52E+71aID7ZvYDY1bZO9lIk8UEBRJ
         OVOg==
X-Gm-Message-State: AOJu0YzsA2eE7iiFOT/QRiPfKSW4nU3aGQaQkdWDDwDg1Aq0QsdTXoih
	B/c3MtS53ZHFqthKaeYnn8CRRExFTseA/vQ1XnNkY9ird7L0TllIFTqu0k0mnNNAKq65l9W09wf
	Q
X-Gm-Gg: ASbGncsNFUx5AbCoQhJJO5kGsB42CXg/T7jMycwr9XrwpMEfdjAoelkCcIijGFe133Y
	d1v1OReYmV+nFPKRY04jfzOjsjUWuusKkvM9yGAqjNLRE1+xQyfYlIvRKrmPoBSRR/pM0AvGOiL
	tBurWT+fnwKLL4PxJBG1C/AzkhsLDmTM2GoTUOgZJOOqCKyPElrC7ZRgZ/1nvaj5+kcGfcL1R+a
	XHjonw0Tf5F6yrvr1HLuWhTywB76616AnbC1oloeNsdhgaN+nt+oZGlqyWB8s6tP0mFvl7Li1a/
	HmZJTAHoQLAIhI/x7/00soSeRIql+VbyLjcd/3/C7dq4wJt1Vb6zn+K5aHw8CCaLTmdGNFEy0ET
	1jUztzKetj4wuNLNaNhELn+dhMxAKwusAZ5EQouyocneykbw=
X-Google-Smtp-Source: AGHT+IHLhSQRx4yTpbdOnHe41UqR/m9UBE4noyoGmtW+pMw0iFDgKFNrdYg9pro2n3nBFgNc6nqhCQ==
X-Received: by 2002:a05:6000:186b:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-3a06cfa874amr2212824f8f.38.1745497940919;
        Thu, 24 Apr 2025 05:32:20 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8065sm1986116f8f.12.2025.04.24.05.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:32:20 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH 1/2] ptest-cargo: refactor run-ptest generation to remove redundancy
Date: Thu, 24 Apr 2025 14:32:16 +0200
Message-ID: <20250424123217.885006-1-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215376

From: Ines KCHELFI <ines.kchelfi@smile.fr>

This refactoring simplifies the generation of the run-ptest script by
removing redundant logic and improving readability.
Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
---
 meta/classes-recipe/ptest-cargo.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index fd1df9d7c9..6799a454ac 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -97,17 +97,19 @@ python do_install_ptest_cargo() {
         test_paths.append(os.path.join(ptest_path, os.path.basename(test_bin)))
 
     ptest_script = os.path.join(ptest_dir, "run-ptest")
-    if os.path.exists(ptest_script):
-        with open(ptest_script, "a") as f:
+    script_exists = os.path.exists(ptest_script)
+    with open(ptest_script, "a") as f:
+        if not script_exists:
+            f.write("#!/bin/sh\n")
+                
+        else:
             f.write(f"\necho \"\"\n")
             f.write(f"echo \"## starting to run rust tests ##\"\n")
-            for test_path in test_paths:
-                f.write(f"{test_path} {rust_test_args}\n")
-    else:
-        with open(ptest_script, "a") as f:
-            f.write("#!/bin/sh\n")
-            for test_path in test_paths:
-                f.write(f"{test_path} {rust_test_args}\n")
+                
+        for test_path in test_paths:
+            f.write(f"{test_path} {rust_test_args}\n")
+        
+    if not script_exists:
         os.chmod(ptest_script, 0o755)
 
     # this is chown -R root:root ${D}${PTEST_PATH}
-- 
2.43.0



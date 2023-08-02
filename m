Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC13FC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 20:08:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.6293.1691006884025299575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 13:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RynICCqS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe2bc2701bso2441185e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691006882; x=1691611682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwu57wk1mUnCd44O9mi8fuH0hieJHd+DISffcuAyoTc=;
        b=RynICCqSYBf+aPMq0f2YjsWVJOoLDvc6/pP7RxB7NkTTMBw7fYkVYVNnSZRuPqskGb
         QoMgeHLWTcgEvCeDsyX5uCKSgi8SJnMXR8xuhcXJHO1dTmWEwmiyYNJc5QBSg13h2Jni
         bbVDxlvvNQi6Gl//ySL2OtiZPUq2wZLWra5Zwbck/gXqVsgCmngTpVjVRcwAEQ4kc0+5
         99/uRIcLoZ35DR191+y690Qi46aZCoIhioZo1OHb9bLi2IZuyyZCNYjhl30kcCu/eU23
         JeEaRRSO7MCtI/t/hRfQ7Hq7OHecmcl0EiONPb+O+04PQVaT/emEjK8cyiKAgX2UlgRE
         useg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691006882; x=1691611682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cwu57wk1mUnCd44O9mi8fuH0hieJHd+DISffcuAyoTc=;
        b=WOsIHa65dn1nxgg0o6DKfGckzn15LS38BtB0keejj1n/NyPqzXmtG4uFf4EMa6hjU+
         baFHtXs5/5c2DDi7XcvOoxatbkwwsLTGTaiuXWAXyU9cpbWEOqJDCFpn9eFdmUEvChYu
         MzywqFvJ/rEI71SI5ChJybNNbJ/xRLlcoIY856te0QeJZkItROzZzBhfLxNb+cM6ef4V
         +/k3+iEA7ClWM1i2sqUveKANK8W0AmYEA1F/RqUtnIl3d4RTHDHi2ZOlriH74onvu/xS
         EH+vtKca2vS/kJZixnnmOosaXo8fQZ/Y7g7j97Yo5rQnRLiv5sEb8GlbQs2TvYkbswET
         nYZQ==
X-Gm-Message-State: ABy/qLaLUP3/k1STD/S9QrU8cDSjLA331IaAJFF09kpPNvkbD0LVJ/YT
	SmNqWiKWfYjPu3zTBe+3In8=
X-Google-Smtp-Source: APBJJlFboV6I4I3emPosuNemER22V8kNKLRsFKTQIwwkL9KPuZ9pqYnYednx1a606MFvOLhH07kSXg==
X-Received: by 2002:adf:e691:0:b0:317:73a8:e5c5 with SMTP id r17-20020adfe691000000b0031773a8e5c5mr6260437wrm.17.1691006882024;
        Wed, 02 Aug 2023 13:08:02 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm19904555wrs.66.2023.08.02.13.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 13:08:01 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 02 Aug 2023 22:07:54 +0200
Subject: [PATCH] rust-target-config: fix target_features for vfpv3d16
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-rust-vfpv3d16-v1-1-9af645a4b407@skidata.com>
X-B4-Tracking: v=1; b=H4sIAJm3ymQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwND3aLS4hLdsrSCMuMUQzPdRDNToGiiZVJyWqISUE9BUWpaZgXYvOj
 Y2loAHhKW5F8AAAA=
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 20:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185433

From: Benjamin Bara <benjamin.bara@skidata.com>

A build with vfpv3d16 (armv7at2hf-vfpv3d16) tune currently warns:
'+d16' is not a recognized feature for this target (ignoring feature)

This correlates with the supported target_features for arm[1].

With the now enabled features, rustc might use vdiv.f64 with register
d17, which leads to an illegal instruction on the given platform.

Therefore, adapt the features s.t. they correspond to the
armv7_unknown_linux_gnueabihf target[2].

[1] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_codegen_ssa/src/target_features.rs#L32
[2] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_target/src/spec/armv7_unknown_linux_gnueabihf.rs#L15

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 21a56ede3e..7d3965ed2e 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -19,18 +19,22 @@ def llvm_features_from_tune(d):
     mach_overrides = d.getVar('MACHINEOVERRIDES')
     mach_overrides = frozenset(mach_overrides.split(':'))
 
+    if target_is_armv7(d):
+        f.append('+v7')
+
     if 'vfpv4' in feat:
         f.append("+vfp4")
-    if 'vfpv3' in feat:
+    if 'vfpv3' in feat or 'vfpv3d16' in feat:
         f.append("+vfp3")
-    if 'vfpv3d16' in feat:
-        f.append("+d16")
-
     if 'vfpv2' in feat or 'vfp' in feat:
         f.append("+vfp2")
+    if 'vfpv3d16' in feat:
+        f.append("-d32")
 
     if 'neon' in feat:
         f.append("+neon")
+    else:
+        f.append("-neon")
 
     if 'mips32' in feat:
         f.append("+mips32")
@@ -38,9 +42,6 @@ def llvm_features_from_tune(d):
     if 'mips32r2' in feat:
         f.append("+mips32r2")
 
-    if target_is_armv7(d):
-        f.append('+v7')
-
     if ('armv6' in mach_overrides) or ('armv6' in feat):
         f.append("+v6")
     if 'armv5te' in feat:

---
base-commit: b2594471209fafd45ea907371b5bd26df95ab2ac
change-id: 20230801-rust-vfpv3d16-a65080a9bcfa

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CB8C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 14:12:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11633.1637676733128098353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iVwL4tq4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id i12so18867305wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcfUfBO3XvFsZ1hvL1sxwmKjyLTiC8fg9vw1abZpFV4=;
        b=iVwL4tq4qrPODxW/0V2geUH7nkM8aL3k70WLERk5pTWOCkOCa27/lWoqcMmjFjPUHE
         ks/ObFah99B84bRrek4T4j5zczkzRlMdu8JgwcVwWgPlupiWM8+w291BRouBC99ZBPaS
         PeClXQMbBh2/THMIK5njxm0nOqotvAJ+63rGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcfUfBO3XvFsZ1hvL1sxwmKjyLTiC8fg9vw1abZpFV4=;
        b=lskfzZVQWqkqrailQNMCvDvCR2izOyGGGxoGzdZbpzQ+xTO9NWhlLBZ3d/X+znJWZ9
         m1CAdPZ2HCPvYwtGZLv6K0P525Oln/h4f0SizYEq7CQPfgfoNgBUKpMwtoLT5SLc48QE
         iSLDitnYeTKo5yWQwzEc3IVJfbb0cgfqSHJwBZunFNSOV7+VIXtFRV96Sjxgq7QZ4zbS
         i97Q/Jf2+ptb35LG1ziuy0quknmYsBtvXoTpFFgCsNqOXiSf+CF/iyDSPa+An9F+6iJj
         ztdo1GcfoF192s2vH9hmZ7Z5l0SYMMapWUeOw7cJYL9btMPvKRh1Y/GSU0hXdGgJdFiJ
         cWcw==
X-Gm-Message-State: AOAM5314deetdIm00zgGrN6Wh/9NrTOQFyB1ardnUJAUMJRl064EnZUE
	fWQResk4/1THmS2geBrsiV10O1InzQtjaQ==
X-Google-Smtp-Source: 
 ABdhPJxl7gVgcA2W+sMVsC4SDKqKMvoeNlXV/LGa5j2ZC22hbEQCz0/WxVtaJiuRH4GrTwroVotQaw==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr3464011wmq.97.1637676731566;
        Tue, 23 Nov 2021 06:12:11 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 a1sm15230669wri.89.2021.11.23.06.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:12:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jacob Kroon <jacob.kroon@gmail.com>
Subject: [PATCH] native/cross: Add ar wrapper for determinism
Date: Tue, 23 Nov 2021 14:12:10 +0000
Message-Id: <20211123141210.28396-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 14:12:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158607

From: Jacob Kroon <jacob.kroon@gmail.com>

Add a wrapper around ar calls for native/cross recipes. This wrapper adds
the -D option so that deterministic archives are built for native/cross
output. This improves the changes of hash equivalence matches and hence
build artefact reuse.

We don't need this in the target case since we compile binutils-cross
with an option making this the default. We need a wrapper since we need
to remove the "u" option and replace it with "D" but also allow things like
"--version" to continue to work too.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross.bbclass  |  2 ++
 scripts/cross-intercept/ar  |  1 +
 scripts/native-intercept/ar | 29 +++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 120000 scripts/cross-intercept/ar
 create mode 100755 scripts/native-intercept/ar

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 3e6a2f60b9e..9d951076a78 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -93,3 +93,5 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+
+PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
diff --git a/scripts/cross-intercept/ar b/scripts/cross-intercept/ar
new file mode 120000
index 00000000000..bc68ffd7a21
--- /dev/null
+++ b/scripts/cross-intercept/ar
@@ -0,0 +1 @@
+../native-intercept/ar
\ No newline at end of file
diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
new file mode 100755
index 00000000000..642b6eae864
--- /dev/null
+++ b/scripts/native-intercept/ar
@@ -0,0 +1,29 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'ar' that defaults to deterministic archives
+
+import os
+import shutil
+import sys
+
+# calculate path to the real 'ar'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_ar = shutil.which('ar', path=path)
+
+if len(sys.argv) == 1:
+    os.execl(real_ar, 'ar')
+
+# modify args to mimic 'ar' configured with --default-deterministic-archives
+argv = sys.argv
+if argv[1].startswith('--'):
+    # No modifier given
+    None
+else:
+    # remove the optional '-'
+    if argv[1][0] == '-':
+        argv[1] = argv[1][1:]
+    argv[1] = argv[1].replace('u', '')
+    argv[1] = 'D' + argv[1]
+
+os.execv(real_ar, argv)
-- 
2.32.0



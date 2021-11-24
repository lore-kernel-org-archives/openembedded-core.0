Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3C5C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 05:31:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.2358.1637731900403041623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 21:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNsdfolp;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id t11so2899035ljh.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 21:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yoQKrDcjQ5+4q7ClhHWaLm4fGlFX8wwV1SyiTS+1wj0=;
        b=iNsdfolp7FSt8KpqOuyTAbO3Yj2JTNczXADOtzq671OBs3rJT1trf4sJ1994G1ODrU
         U6wYEh4f3k9l04s/thAYvaq1Y0nyjdHFIfx58r4RQXwIoUGgPglbEt7Dnk53v7yplcG4
         k0tq+5biKO6qHkDTmCo0cL9r6BfwTnglLsDruDmJxUf1ShddPvimqbvJSxx3jMPrUyMk
         HlCKeKeingM5YMgDn1b/gVmv5TEC6NYg6cGaegF10fhXa7u/0ZQvHNsd+LX5YzJsKxz7
         HKKYwSne1L3fmGGg2kkAUQGSf1xpfFCqzcc69KxkpdG5MfG8O4RVrqWus1P8tvRDAMTi
         SPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yoQKrDcjQ5+4q7ClhHWaLm4fGlFX8wwV1SyiTS+1wj0=;
        b=McDAalhwRXJmQvJiMmUg09bjhvDzKvfYJa5Z4EofrZC8qXsJf8X+GUc+wsnojURcEG
         x6QWOkop6+Z3wJMfE+6Fj5UWGrPv4A1iH0obfxJlo5nGiugLlTaM4PbZr6/cd0sOgejC
         rwii+kFyqx5+tnQ7Cj+LTuEzvZaAaDksYTZ1M3BCV4uSQ3Jdes3Rtn/NVvnUeA6pwJaC
         lXRXZzadX4+7ATUaV/+WqCc6W85Pu+9FDjVysPxgc7EpD2ZZdEKIDKdd9uS3fTeiGWzw
         52DgJHNe1vqGpBiTBmToi2B9msGTV+bX/6lEjj1uMZs4Ffjc7j8nrgPpT+SiUsFtdnj6
         sGtA==
X-Gm-Message-State: AOAM5338Gg/H62Cj/v5tEsFN6WdOiEMhLTdCmhFWWG5vJFpLTVfoJ94i
	OashpOeJuvatbQd5MvwhrnA5rvEf8zguQQ==
X-Google-Smtp-Source: 
 ABdhPJy3OItskEQ0YYvrGiDg3Q3cU2nQF4JIFbzqshBDEdal+rF+RzOIl01kC3hhvE79+C/H/XgnhA==
X-Received: by 2002:a2e:9806:: with SMTP id a6mr12174393ljj.185.1637731898179;
        Tue, 23 Nov 2021 21:31:38 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 e17sm100817lfq.102.2021.11.23.21.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 21:31:37 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCHv2] native/cross: Add ar wrapper for determinism
Date: Wed, 24 Nov 2021 06:31:10 +0100
Message-Id: <20211124053110.3715667-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 05:31:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158654

Add a wrapper around ar calls for native/cross recipes. This wrapper adds
the -D option so that deterministic archives are built for native/cross
output. This improves the changes of hash equivalence matches and hence
build artefact reuse.

We don't need this in the target case since we compile binutils-cross
with an option making this the default. We need a wrapper since we need
to remove the "u" option and replace it with "D" but also allow things like
"--version" to continue to work too.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---

Changes in v2:
 * Don't modify arguments if 'U' is given, instead print a message to
   stderr that non-deterministic mode is requested

 meta/classes/cross.bbclass  |  2 ++
 scripts/cross-intercept/ar  |  1 +
 scripts/native-intercept/ar | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 120000 scripts/cross-intercept/ar
 create mode 100755 scripts/native-intercept/ar

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 3e6a2f60b9..9d951076a7 100644
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
index 0000000000..bc68ffd7a2
--- /dev/null
+++ b/scripts/cross-intercept/ar
@@ -0,0 +1 @@
+../native-intercept/ar
\ No newline at end of file
diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
new file mode 100755
index 0000000000..dcc623e3ed
--- /dev/null
+++ b/scripts/native-intercept/ar
@@ -0,0 +1,32 @@
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
+    if 'U' in argv[1]:
+        sys.stderr.write("ar: non-deterministic mode requested\n")
+    else:
+        argv[1] = argv[1].replace('u', '')
+        argv[1] = 'D' + argv[1]
+
+os.execv(real_ar, argv)


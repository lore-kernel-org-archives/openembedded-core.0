Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266ACC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:12 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11210.1783523949181162589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ihwKvfpb;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-920f33347f5so42178385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783523948; x=1784128748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEQQfDwP9+yOINtyLM3Sl/SoU9B3VQD1Mmp9qZMr5rc=;
        b=ihwKvfpbzazudcSUwG0lRYuEI5evo/NktLMnASXHyqTxqzkTYCauzA55asJAK0/l/8
         ON9JeGznt3rbxC89E5U5ayTYew9Vf3CSA/z1GPlgB2q1b7H05/QIp3J9uy4BGZasv3qB
         aYNUnY3ip//AdQkSEqih/tMPhr8T37Eom8EFc0gafMxVUsrm1JNlOFNhuIX8KWp/7EA0
         h7ZckZE0mSIyljiYHxR7rC3Om5DXe3mskfHh+k2yqxaqYMrCgzhqTmE892fk3Mx1ZA+6
         +NY8CFyd/qbkd68g1nbiJBvI4QMmEyexkzge+91abO8G+85G89FhEEafLjiONgVTnbx/
         JqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523948; x=1784128748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZEQQfDwP9+yOINtyLM3Sl/SoU9B3VQD1Mmp9qZMr5rc=;
        b=h8kLNM3kTfMjAiYAaH9U5yKETB3PeOn6OEmpQDrwHeDkTi4oH9kxfsUq5+IjDoMhFC
         /QL3uG7Yd8Q74JS5zT4tIYWJp8SYk9BU2+3aIao0qPy4st4nN8m+YdyeHifsKBjJZ7i3
         PUGkECfHXfR4OVKmn6jJcw62JXElSPbXM/jgtolQKdBWyNwzgqxIlEPi7bLGl8j7qj0I
         p1hPDKIXCZEr6QU6wSZRWinE1B9qWv91hcipF9HlDl/A1d3JeKqlB897WqmviMMCp84g
         /cIXe2QZizyogQN6HaHDTJSug7y6T5cCnnSoXIUOdqctDjpOg1R4+4yhI0tMbYMbC4is
         Dp0w==
X-Gm-Message-State: AOJu0YwcOyfF5n/TJnAeGuWxaRcBactYRqaIrbSY7U4jhd12zHpPWg9g
	tA4+dKEfyvJ7sOPEkKUvhVnnvi/+R+6mR3A9M/h+6d5SyVReWaT+/0g6YbQBkn93L52UR23xcEU
	gmAJ8uFU=
X-Gm-Gg: AfdE7clAYBhShKYzzW0tnvBxd7SI3fugxlCfhdEm9GQbm2fxBpgHTLtatnbAYV131Lt
	HderP6gT5DDB7714QJ3l1MCl+UaDQZxUpU9iCnntlIxChvWLkN6YrHYJUZHZS949SOKIU89sR/x
	gi4NhyW+M9NRX/Jbz1PF6hHH/YOeCfcPvapz4Kc/BaOVoQoL5hRiNNPsmP2RColg0vfXtxTCFA4
	FIs9tBsa+wnBv4rBBXGiE1xvm03d6Da2uoaQ2cQKcYVzAXHJEV0R8NNZpjt+/2UNaEVI6trRKCz
	KC7H0dxBtWZkALw20G/OyDEip8ueI/scZzQ3zH0NTNPuyntRR5cDJdsoLOTZaCBRulD7szGbNSG
	JhubHlxsg6hJRXP5l2zg+Euq0Qa276EuIYiyr90VEuqVfYQhe63xUl8vqr8UGmX/21k8EGX5SsH
	apK5EmQhtA1pYAaI5e
X-Received: by 2002:a05:620a:4593:b0:92e:4b7b:b509 with SMTP id af79cd13be357-92ecf929b61mr268950485a.70.1783523947431;
        Wed, 08 Jul 2026 08:19:07 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f472a9ad1fsm184855486d6.47.2026.07.08.08.19.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:19:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] parted: skip flaky test on riscv64
Date: Wed,  8 Jul 2026 11:19:03 -0400
Message-ID: <20260708151903.721223-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240492

t9042-dos-partition-limit.sh has failed 24 times over the past year on
qemuriscv64, which is using TCG emulation (slower) and thus can struggle
with higher system loads. Skip it for riscv64 builds by applying a patch
in that case.

Now, on qemuriscv64:

|PASS: t9041-undetected-in-use-16th-partition.sh
|t9042-dos-partition-limit.sh: skipped test: this test frequently reports a timeout under heavy system load
|SKIP: t9042-dos-partition-limit.sh
|PASS: t9050-partition-table-types.sh
|PASS: t9060-gpt-grow-script-fix.sh
|============================================================================
|Testsuite summary for GNU parted 3.7
|============================================================================
|# TOTAL: 100
|# PASS:  85
|# SKIP:  15
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make: Leaving directory '/usr/lib/parted/ptest/tests'
|DURATION: 255
|END: /usr/lib/parted/ptest
|2026-07-08T14:27
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

versus other architectures (e.g. qemux86-64):

|PASS: t9042-dos-partition-limit.sh
|PASS: t9050-partition-table-types.sh
|PASS: t9060-gpt-grow-script-fix.sh
|============================================================================
|Testsuite summary for GNU parted 3.7
|============================================================================
|# TOTAL: 100
|# PASS:  86
|# SKIP:  14
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make: Leaving directory '/usr/lib/parted/ptest/tests'
|DURATION: 99
|END: /usr/lib/parted/ptest
|2026-07-08T14:56
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...tition-limit.sh-unconditionally-skip.patch | 31 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.7.bb    |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch

diff --git a/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
new file mode 100644
index 0000000000..bec7eabebe
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
@@ -0,0 +1,31 @@
+From b03c399e392c492782e680f66dd47bd34b325ab9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 8 Jul 2026 09:45:06 -0400
+Subject: [PATCH] t9042-dos-partition-limit.sh: unconditionally skip
+
+This test is prone to failure under heavy system load, especially for
+guests using TCG emulation (e.g. qemuriscv64 on an x86 host). Skip it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ tests/t9042-dos-partition-limit.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/t9042-dos-partition-limit.sh b/tests/t9042-dos-partition-limit.sh
+index 87a32df..d6e8d75 100644
+--- a/tests/t9042-dos-partition-limit.sh
++++ b/tests/t9042-dos-partition-limit.sh
+@@ -21,6 +21,8 @@
+ require_root_
+ require_scsi_debug_module_
+ 
++skip_ 'this test frequently reports a timeout under heavy system load'
++
+ grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
+   skip_ 'this system lacks a new-enough libblkid'
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.7.bb
index dfa3ee163d..a669919dd7 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -11,6 +11,9 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://run-ptest \
            "
 
+SRC_URI:append:riscv64 = " file://0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch \
+                           "
+
 SRC_URI[sha256sum] = "008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b"
 
 inherit autotools pkgconfig gettext texinfo ptest
-- 
2.55.0



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BD5C79FBC
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6436.1788939001834303306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LvkAkACA;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cbac3so3560155f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939000; x=1789543800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0FsyASjafASGAIbLR9KVAyKbSTCZuoKNupEmTrZyO0U=;
        b=LvkAkACASccGzTBks5tz3o94gEHFiPItH6INcneU3DofaC2oMoMy6VHnh3+JNtyQh1
         RtolIrxarS+fBN3JrKt/r/NOx+AWZOom2uQTTZ7tiz8faJUz8uIgMIW954ppjGJVkU0t
         /I6PULGvlIxV2gG5E0fu5bjDq1NWm4fFCHPoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939000; x=1789543800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0FsyASjafASGAIbLR9KVAyKbSTCZuoKNupEmTrZyO0U=;
        b=qzadvVjVvtVq/o1fw5+4/JoyshrMe72BrJRHWDnDfOXswn1bG+q5bVzmOJGPyfkiWN
         UFogpY2aF67B07zcMYmBmtTabJXlA+YqJ2ZITWY1FJJbnv7CDqcr+BD42B5kvNTVa7Bs
         z1PlYNEEn+gNpIl/45huCuTpiczk5LNoNXp5NmUe3bHCO1j3U7RJDevHi70nhS2ePhox
         rmwtw0rt/oM7n8GPKKg9X5YrIOCJZY0RPuO6AADRHovHDNQ9ABVOt5t3JcVYustmgulr
         c12p+DGqBuBxEygyr7Njfit3FsL6QTqdNfOXHCZVWQHlkwtInx2dJyUcL2vYoRudignL
         rbdw==
X-Gm-Message-State: AFuF++lJhddYGfsDvSLo/59453OIZIRN88eA/k2Rf0I5X4tvyf0MboeI
	FOxlW3xvoxCZoB6MaFtkVvlzWlg4wQSIgyjzjVwVo+jtb6uGFgFWL43rdhKMFmj9UhBclhikxi8
	CXqPLYaU=
X-Gm-Gg: AYBFou3z5+wVGrPNJVkkBxY09cTXrEsp/iv7b9XGLt7hJM8fn8zalbnFHPy4USV+eqf
	q47FUhCW3tbvEI20joakZ7SGtfcYxr6ylWtqwVZfC2HIj+jPETB9LlsDk8NxHgTpmt4L9HebVaV
	Uk5+oGmm4QmwQuhB5/kFxXscAQD7+6HTpckxwmy92SWbQu3GRLQGfAXFJPYezDq/3wA7PeNkg3h
	KS747gVBTWRnAs8O+N96ywgdw/uJ0iT3DQvfJIWE3rAka+k3P4ep4XnbbBWiAqqNWCDIfW2Np8E
	bKqD6MsnTEIOCF1aLt8GaBzvJQj+j5St1fnvr5du16paTsNaO7todp9u3v6AFG3VucMfzRT52q9
	3RNg2i9JRT1CXDYL+4UNmNfhhhAmfqtoMCBREzpTR7ihzEON035DQ8KIo03/VjZ7/u7HF46KA7L
	bkU0Eqw10YyNfh8U0PVK5UnMjjerKO9igQc1RSDZF3PnfFo+KtcWm/akUZDtu5ZWBym411iCsep
	8BxdlsEIpK5yQ3jaIqgt+X6tT9HRXWSzTCbIlyrkqsE0bRp8znvu2sODTncMEq7+Zzdnm9vyIpr
	0YP91AxErg==
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49d1f109802mr35900775e9.7.1788939000007;
        Wed, 09 Sep 2026 00:30:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/38] procps: ptest: skip flaky pgrep full process name match test
Date: Wed,  9 Sep 2026 09:29:10 +0200
Message-ID: <0cb7cb20339762dae8c1ce6b1ed41dd8714635b8.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245420

From: Pratik Farkase <pratik.farkase@est.tech>

The 'pgrep match against full process name' test uses pgrep -f with a
regex pattern close to ARG_MAX in size (~100KB). This intermittently
fails on qemuriscv64 where the process cmdline may not be fully visible
in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
match times out under TCG emulation.

Skip this single test case while keeping all other 30+ pgrep tests
which are reliable.

[YOCTO #16290]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9166b8fda40bece8c2007ac1f06d51693ac617a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...p-pgrep-full-process-name-match-test.patch | 39 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch

diff --git a/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch b/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch
new file mode 100644
index 00000000000..43c930ce086
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Mon, 17 Aug 2026 10:00:00 +0000
+Subject: [PATCH] testsuite: skip pgrep full process name match test
+
+The "pgrep match against full process name" test uses pgrep -f with a
+regex pattern close to ARG_MAX in size (~100KB). This intermittently
+fails on qemuriscv64 where the process cmdline may not be fully visible
+in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
+match times out under TCG emulation.
+
+Skip this single test case while keeping all other pgrep tests which
+are reliable.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=16290
+
+Upstream-Status: Inappropriate [OE-ptest specific: fails only under QEMU TCG emulation]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ testsuite/pgrep.test/pgrep.exp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testsuite/pgrep.test/pgrep.exp b/testsuite/pgrep.test/pgrep.exp
+index 54e75df..66edbaa 100644
+--- a/testsuite/pgrep.test/pgrep.exp
++++ b/testsuite/pgrep.test/pgrep.exp
+@@ -35,9 +35,9 @@ set test "pgrep with : delimiter"
+ spawn $pgrep -d : $testproc_comm
+ expect_pass "$test" "^${testproc1_pid}:${testproc2_pid}\\s*$"
+ 
+-set test "pgrep match against full process name"
+-spawn $pgrep -f "$testproc_path\\s+$testproc_arg_str"
+-expect_pass "$test" "^$testproc1_pid\\s*$"
++# Skip: intermittent failure on riscv64 - pgrep -f with large ARG_MAX
++# patterns can fail under QEMU emulation (timing/cmdline visibility race)
++untested "pgrep match against full process name"
+ 
+ set test "pgrep with matching gid"
+ spawn $pgrep -G $gid $testproc_comm
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
index a9ec3f39d6c..541a8cd99cd 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives ptest
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
            file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://0001-testsuite-skip-pgrep-full-process-name-match-test.patch \
            file://run-ptest \
            "
 SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"


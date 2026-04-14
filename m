Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAB1ED7B95
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 09:33:48 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14669.1776159224505623271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 02:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lEcHN6zS;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5511494eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159223; x=1776764023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcI6o62gKC6BmYETPs261d9UdkCFtTTw8kNGiefoJfk=;
        b=lEcHN6zSHEs7ls15n3RQlZKUFuV7QXhgnf0ODrtdcRzj1vIv1JGk7Adh1cQEbDdrk/
         xJIJ4tIOAR1QDtNX9FV9oPVHYERFwzVa7LQq3meTOIvUi9lrK/fgOpU9iOmaKHZVDW0L
         MNlU30HSIsFWXSNA+uK+RGQ+tCIHNzViSBlMbD/Fl+GhVZVpN/Nt21sSZb6L0sF+e5Y9
         jII7N++j4idJfgqQn81SXXH+kiOdYycIRxG1GhY8PyJe5pxqt+kkZycN1JCtnt717v0n
         7xMJe5RX+IFp4thlldfvUxxWs9YkGAN5o/crZQ10RZsN+OK6swvhkTPGpajlfwbeRqgz
         /2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159223; x=1776764023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcI6o62gKC6BmYETPs261d9UdkCFtTTw8kNGiefoJfk=;
        b=mAeM9k+tiAJQqm7BQaIeXNIrPU3gjSjkTJIpAZ6DZ3u/W8YZjTYRn34CyIWLjr2iDj
         vMaMaQukehxUM4RyROwCfLU6srrmiQycOKJ8GAY+bK7+GK/4jlViM7n7eULK0U1NN8YA
         TWy1IQvSBVeX6eqBURDUO9gsunVenZ/uX5Lsw0uZoYs7GeQwdmOYO2DshhfH1NGwxCRT
         UXEELTg7lhSN8j6rEQ9M9kQ6Bi7ozWwmZqGpa1UnwvuOqmza6oEfsI4SQBkR0KAuu/lK
         y81JfU0Y+//Gr6OIgkFAVzDy4slXG1g1RbZeAunoP9bl7+W0kWIcF0jeM8pk1DTOOG/X
         1Fyg==
X-Gm-Message-State: AOJu0YxSfJ8AwkzdNCWucv4jQtaacE+BLDNWyTrLmzoiqtx6VcEL0IO4
	4ifmDD2razPCwl8ck6vd7+gaS9bpIZnxcZ0cCGkjvEn7rqmh5AFLX92GrVriIXw7
X-Gm-Gg: AeBDiev6YchvHsGIOLl1jUYLnMvDRw1tahrIl4s4Hg0kdi8rrRY3+nw0PKPDd+jqvMd
	90l/OGjLJhgdskVYM1Z9kf3OitD/w5I7Xay18u2fTOcDc4EsdQ5uX59bBfIJ/YHJye6XlgZb1f9
	5NdTKc9VLheSIetts3nnGqm+pC7pObVDAQThNwY8LEMts62EnNBdVEqWl0wf+MnxJKKR8jq7zf5
	XiHB/gn2QOPzbN1JhPhNMpv21L8vnFmcGlHLaRCr9Rh/Tob4ONWHhb0x5Su5/PaucTKmAh0NeMU
	kGaO1jdLX5+J7b9H9aFlpLb5p5v6PyvZU40PgakYsYrbq8PK0I9oebJZlqEgGtPpNJfg9zLHWih
	6DiKxgPD+qXdCSFJB+5GTrpNG8SedpyqSUdPB78xPNh8/Mmbiwz+e1zyMd8H/RTKTPleyvb2M7o
	zbMWhnXCyYVY6zdcoD+n1DzA6dhEjcdtUPWWXtEGlCMTsfkJMAayLzn3LDJCXaVQpAijUHj9FHM
	Q4EYLgmvyPZrFRvXWaMlBVUbAsT1inQ66B487UnljRclAMjlobqo6EbxPA9kS8KYz4U7q779yq0
	tfrtLZLn8uANCEEs+rxQqEkPqPCfY81muoqNbEZvU22oAQHvPJk=
X-Received: by 2002:a05:7301:138e:b0:2d8:8bca:529 with SMTP id 5a478bee46e88-2d88bcaa978mr2767413eec.24.1776159223421;
        Tue, 14 Apr 2026 02:33:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d944769298sm7958235eec.5.2026.04.14.02.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:33:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] strace: Remove -std=gnu23 from ptests makefile to fix reproducibility
Date: Tue, 14 Apr 2026 02:33:40 -0700
Message-ID: <20260414093340.4166638-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235148

with updated ax_prog_cc_for_build.m4 macros, -std=gnu23 can be added to
CC_FOR_BUILD based upon what autoconf-2.73 detects gcc on host to support
which could vary depending upon build host. This gets into Makefile which
is shipped with ptests on tatget. Since we are on gcc-15 this option is
not really needed on target as gcc15 defaults to c23

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/strace/strace_6.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_6.19.bb
index 9dcf9d14d5..e7c96262ce 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -52,6 +52,8 @@ do_install_ptest() {
 	sed -e 's/^srcdir = .*/srcdir = ..\/..\/ptest\/tests/' \
 	    -e "/^TEST_LOG_DRIVER =/s|(top_srcdir)|(top_builddir)|" \
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+	# avoid reproducibility issue, -std=gnu23 is used only on hosts with gcc-14 and newer
+	sed -i '/^CC_FOR_BUILD=/s/-std=gnu23//g' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"


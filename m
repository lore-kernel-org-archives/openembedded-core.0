Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7EFC7EE21
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 03:45:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19377.1683258310072090482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 20:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cDTYYwDG;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ab267e3528so9359775ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 20:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683258309; x=1685850309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOGn+GtWotbNhs0Wrvg8Fl0lGCh1g7h1G2IraqKR4PU=;
        b=cDTYYwDG6Vc6CwBLMFQXyXnnnq2Q3cyfsROQdav7o7ue+EI+kV+mXYZwsxvvOXLh73
         UJ97wwRhYFOtgcLpSuMUJhr1FYuuN3gzhaBCp01NyBjhpSk+BBzOM4qExNc0+3Ndp4Pd
         iJMu3g6VOwR4LioDMHTFZeKV956DTXgp/9e5KZ+krMiHZLj7lrPgO+YQlyxGJH0P0B/3
         upMqDg7HoTz7HtL1TFtP9AXJJo/gYujZl4JkSPIZJZW1QuCbnlmh2eszXmOfTEwXelEH
         i3sdfozAY5mUSd9QqjpNEcA20b0QPnA5RbFLFA2EKO/6j7wYsyEwkdx9p855nCq5eWGL
         Ifhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683258309; x=1685850309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOGn+GtWotbNhs0Wrvg8Fl0lGCh1g7h1G2IraqKR4PU=;
        b=Z+s9gVZLvg5/XPa3cnE9hcOGvrHssi+XGhM5kbZxlq410X+NkUhHxqcPiWbBNEHG+Z
         1woqtDslFgIw9zrnJQctsdk0j3C1psU5nik3jJDlO8EppJFfpjCbYKzoQn0VzZqGVKNB
         6P0/GCDTcgErJpu+6SydFC2yA+Bpd8/yU7fqxqL2HIFqwnR/z7SWfatUZ+Xlprl1ot/c
         15dOL0sU8X3T4DgiYCQk7W4hooFw2xuu/QgnX5LR2D+SjYsv6hTJAVzb2oGHNDXkzPHU
         gm+E8z1JzeMvBB8RvMdk2P+17EpuAhWcg86pZx8Ztf0vybb13jPxd7eu4+NTKZQv5wqV
         tbcw==
X-Gm-Message-State: AC+VfDwSfn0RaFCBgSf+cW5YoccNDHO10ADlEoLTIG4y4WBurCHaaB6O
	os7TXNSJA5y8iz3vlB0viAPqnsINsakzYg==
X-Google-Smtp-Source: ACHHUZ4BVMHDPAKk4mF9o1yyXQ+pQirA+tfaPh4AaCEFxn6XeXLkg8mrIDok5pNu2wl1X6MNqpx4hQ==
X-Received: by 2002:a17:902:db05:b0:1a6:9f09:866d with SMTP id m5-20020a170902db0500b001a69f09866dmr7085214plx.61.1683258309169;
        Thu, 04 May 2023 20:45:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090ad34e00b0024e3d26f644sm4489389pjx.3.2023.05.04.20.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 20:45:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
Date: Thu,  4 May 2023 20:45:06 -0700
Message-Id: <20230505034506.2317260-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505034506.2317260-1-raj.khem@gmail.com>
References: <20230505034506.2317260-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180897

From: Qiu Tingting <qiutt@fujitsu.com>

When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
in test_script and test_one scripts, value of SRCDIR has problem.
  SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test

ptest log
  # ptest-runner e2fsprogs
  START: ptest-runner
  2022-12-17T11:08
  BEGIN: /usr/lib/e2fsprogs/ptest
  ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
  ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
  DURATION: 0
  END: /usr/lib/e2fsprogs/ptest
  2022-12-17T11:08
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Reason
  In Makefile.in, SRCDIR is set by prefix and libdir.
    @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
    @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
  prefix=/usr
  libdir=/usr/lib (when usrmerge is set)

solution
  After ptest compiling, check and modify SRCDIR in test_script and test_one.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index d3786d6f4c..037fdbb395 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -123,6 +123,9 @@ RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
+	sed -i 's,/usr/usr,/usr,g' \
+	    ${B}/tests/test_one \
+	    ${B}/tests/test_script
 }
 
 do_install_ptest() {
-- 
2.40.1



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75280E7B611
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:58:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.17576.1696424282791226998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=xubOp09V;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3231d67aff2so2071909f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696424281; x=1697029081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hyGAY7xZd8bViT2YpRlnR8oBDo1ueBu+qDmwhylHSM=;
        b=xubOp09V/DEVucS/Y9miMxoBrzMNJqIoGLF5qa0G1/dzfKzYsh3v6Wdsca5wTGlFxU
         JKlbFMvWZkjNkScS4udkUobeTPt/+uIcZVLSWhZNRc0/O7yntu/0LZSbJK/ORY/WK2s8
         Zmgy5xeENc80hjRiddDao2GEfbnkDmsHeJSK9401r8O1jrlGCM7555pxL5YWQJLuAdfF
         SkKWorlgfv4jULkEeRKl3Lk7qbBxriaRP6/7azfoNW4ADQzdJo8bnbQQK8QC0STfpxPv
         0PrChVVyKMiaANsOf1NPoFIQQS2X21Me6K+MUunAk7nUn0ZkybxBp91ysc1b0M8co5Ss
         RfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424281; x=1697029081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hyGAY7xZd8bViT2YpRlnR8oBDo1ueBu+qDmwhylHSM=;
        b=f6TqGOUOt5X3TNL2xvLCWFZyAmiqdHAzfT9YYU02eH+iRfgK4mR3jC9TBgapGnShdd
         /PthCmK4/qzVgGI7MMB+bOJVe/uEwmahpFO2OrRhoCymyqkF+XgSZlVuLEj8+JK+AjAV
         dmHokY6vmQ2mnHIpk7MzfcbCcOTHdJcOOoehuN7I5+1LrTSaxY6Ew+pcBTmzOMp/96M3
         n7vO2GODiw3stVhHgcqxLxz2bOj3SBQBTEILusXmmWtZFj48nanDXEmHjPt+4uRv4xxj
         iY0xfF9LgY3sCf2CscQo/vdLGEZ6ELa9l6AICAI/umn9upFPV8tLjZItrId7cOnbyJlZ
         vGiw==
X-Gm-Message-State: AOJu0YyWdCOHZ1eO+wuVr2Fi7pp55FCXC4O5wQXj3yu3maMeprcqW90L
	hwp43rOhTmMMM+dVvOENf0Tx8VZavAj7RIVzIEI=
X-Google-Smtp-Source: AGHT+IHc5ZjlDqK220T8oLSFqnqswFpWUh2BY99XAlcI92jlkC1ILtCfH6MEa+keieVeiL4iaj6FPw==
X-Received: by 2002:a5d:58ed:0:b0:31f:e026:30ac with SMTP id f13-20020a5d58ed000000b0031fe02630acmr1981368wrd.34.1696424280943;
        Wed, 04 Oct 2023 05:58:00 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b00326f5d0ce0asm3958763wrx.21.2023.10.04.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:58:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 3/4] insane: Detect build-system test harnesses
Date: Wed,  4 Oct 2023 14:57:30 +0200
Message-Id: <20231004125731.1785803-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188683

From: Jérémy Rosen <jeremy.rosen@smile.fr>

most build-systems have a way to implement a "make check" or equivalent
command that will run tests in the source directory.

This heuristic will detect the keywords in the build-system configuration
that activates tests.

Note that in the case of autotools, we use Makefile.in as our source
instead of Makefile.am to easily follow includes. Filenaming conventions
for autotools files are not reliable enough to do naive matching.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 932391e914..35b6408b57 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1382,6 +1382,18 @@ python do_qa_patch() {
     elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
         oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
 
+    # Detect meson-based tests
+    elif os.path.exists(os.path.join(srcdir, "meson.build")) and match_line_in_files(srcdir, "**/meson.build", r'\s*test\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: meson-based tests detected" % d.getVar('PN'), d)
+
+    # Detect cmake-based tests
+    elif os.path.exists(os.path.join(srcdir, "CMakelists.txt")) and match_line_in_files(srcdir, "**/CMakeLists.txt", r'\s*(?:add_test|enable_testing)\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: cmake-based tests detected" % d.getVar('PN'), d)
+
+    # Detect autotools-based·tests
+    elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
+        oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2



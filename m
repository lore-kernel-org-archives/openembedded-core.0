Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F37C3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.9083.1720096350062367690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d8BXUoqg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70af2b1a35aso412032b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096349; x=1720701149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iH4gTcay9mx1lZpsQjFzSlcsrH+7dDBhW2xaFd+q8w=;
        b=d8BXUoqgTfVco3k935JzywEfcyLaU9rieGDS6lyScssIcXvyknrQyYQdgF8KKsRPKH
         OBqnpUcVmH2k2C3MTvNyc+12a5YoqWWrNCPBg9/FkjgxqwBeQqEJZOhnGKFR+2F9TxJa
         z4RDDii1UbDWd17oJCadgqS6zEqkJ/RQVdZ6smk+GHQtBsVw+zJi/5QO0KcmBp5K3SoD
         JQf1o6+rthmO5zjdrmEvXCrkiyidiEl12r192TqRBrTcKabyV3fz/zIIHiYBUU7NpuCw
         +QLHdH/ICRPQdjsTBuw+hMvMKx8TZmTAAN2Rdu4pilnq/BbzuN167m9JzDVEPeO4wbTp
         or+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096349; x=1720701149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iH4gTcay9mx1lZpsQjFzSlcsrH+7dDBhW2xaFd+q8w=;
        b=VohFbJsKFptRGyO00/j0QT6UXWRrsrdlGLVQdGueW6/BDLx2Cw6513StJTIRp+dxX4
         MsMxO03+T5Ut9k/m5HYaFBmlpE9KePSdyOHWSlA+fKtZojaIKzSZdo/D+gOWRHjQbnL0
         5vFPjPi58Lh0vejX5Ju7s9w+dIyn7goNTd7z66oERJk9JFPwUMvGVaOmZNhcpkyNJD5j
         87CkdkhApJrWJg1Br0RE4I/C0ft2EDn20ST/7VYIn8NeEhKqX/i1ZurmI7PYS7pOIrVC
         hAo6D3x4h6cjfWgSBgXrTgTZp7rtpwTHK0mJfUUPVpccVtepEVgPdsrIdojjH/nh1CUU
         GUTg==
X-Gm-Message-State: AOJu0YyHbSXWMlE4K+yvwGelaUbxLHPH99TS4sbi7xGb3zUSNElJi3uR
	hlByiPWxUFNEPZ7Z8prY+qo+hhmU0qFkuDDEJAEwY+tjlMP17MpCvMiTXAupHvfxw5VozClCxeD
	+
X-Google-Smtp-Source: AGHT+IH1hGptNbD3XfmV4X6NLFCTByjaI7GFQg71JdkH/qHcOrB/ksMrT4gj65U4AT4Lr4JrK8i7Pw==
X-Received: by 2002:a05:6a20:7343:b0:1bd:23cf:151c with SMTP id adf61e73a8af0-1c0cc8ce830mr1492074637.41.1720096349304;
        Thu, 04 Jul 2024 05:32:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] glibc-tests: Add missing bash ptest dependency
Date: Thu,  4 Jul 2024 05:32:12 -0700
Message-Id: <8e650506885bc4465f9569b3ccdc327eb83d90db.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201573

From: Poonam Jadhav <poonam.jadhav@kpit.com>

The script has a bashism and needs bash to execute correctly. Mark it
as such and add the missing bash dependency so it executes in minimal
images.

(From OE-Core rev: a1b5afac108d9c94e8fc2ad8cfebfee16f6f243b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28b8d57a88849f7f024d13c5c901f3621f5166c7)
Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 +-
 meta/recipes-core/glibc/glibc/run-ptest     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 4b765eaab8..9c440f92b7 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -28,7 +28,7 @@ python __anonymous() {
 # Remove any leftovers from original glibc recipe
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = " glibc sed"
+RDEPENDS:${PN} = " glibc sed bash"
 RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
index f637986105..c394b49866 100755
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ b/meta/recipes-core/glibc/glibc/run-ptest
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # ptest script for glibc - to run time related tests to
 # facilitate Y2038 validation
 # Run with 'ptest-runner glibc-tests'
-- 
2.34.1



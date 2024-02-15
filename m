Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FE5C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:29:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.3728.1708032539553556099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 13:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J1tlJRXP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412345cca4eso3029725e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708032538; x=1708637338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NaVU6Dj9zugNRVDZjp9LGDCXkLMD1aTZti50JDbhsY=;
        b=J1tlJRXP51pCo86sCFQEMkdbvtmI7APv7Tn9ZEZzlBYbVNfrbF/8MIJiItpSullyvc
         whGzjjgwxmvXmQj03c7HRLbYUWKS1Kt9sNVNC0YTEG/UOM4P3asvTwAj5xSn2nQ5du8Y
         znUbVSh/AVDQ4E9LjvFsK5sqs1rFz0hN2PtIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708032538; x=1708637338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NaVU6Dj9zugNRVDZjp9LGDCXkLMD1aTZti50JDbhsY=;
        b=ZXWjDrYq3c9u8ZKH3DnqTxc7hIdgwlSs2urSFEh/3zAWw9FbPjX4GyYqM730g8SyB4
         NhhyFVgneteCOJNULgjqoKZUzer9pnyMvTm8qKFBjf3RepNQJyo/P7/kyRDGPu8em5FJ
         j5wO9O8zlSGhpRNQ/xfvhhdeyGDBG2PSKttGace8w1E9L1Zge5kIUui6GRWESLbnTfCi
         zhSHcq/+lSOpMBpeHK5GBANHwre2JWHGsj6SFVq956SPS1zsW0tq7dn9DdB4LethFWSk
         BaRMSpXGvZOa/3Yjw8aRJ1+RuwVlY6c1BCOy2N5cNU1nHsBKPMtgLJ+VCnJgsBsPbLbG
         0rtg==
X-Gm-Message-State: AOJu0YyEQqpA5qWRk9EFLJAViQ9DKzbTEfSVjQkh3+rzEOwVD1D5W4rk
	6nLom82AliMT70aiswkNMg6jsAejT2yY0G06yq8w69E0kEzaQgWnVp5RncbOeCLJeBGlBImYuDr
	p
X-Google-Smtp-Source: AGHT+IE9nC9dxFN26tQU0RNeiFVheT0x/qTsJKa3nPCIx9GMF7C31s8EyxirGhbxqpHyJWJSWgQEPA==
X-Received: by 2002:a5d:6882:0:b0:33b:4443:46cd with SMTP id h2-20020a5d6882000000b0033b444346cdmr2264898wru.0.1708032537759;
        Thu, 15 Feb 2024 13:28:57 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd13:6695:6348:c567])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b0041207e096b2sm340738wmb.1.2024.02.15.13.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:28:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3] openssh: Add a work around for ICE on mips/mips64
Date: Thu, 15 Feb 2024 21:28:56 +0000
Message-Id: <20240215212856.47492-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 21:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195704

Unfortunately the new openssh version has an ICE on mips. This looks similar to:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820

Given how long these have been open, workaround the issue by disabling the compiler
hardening options on mips.

It is likely better to do this than have the open CVEs for everyone
as we can't upgrade.

An example:

| during RTL pass: zero_call_used_regs
| clientloop.c: In function 'client_loop':
| clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:407
|  1699 | }
|       | ^
| 0x14d0acc internal_error(char const*, ...)
| 	???:0
| 0x5cf765 fancy_abort(char const*, int, char const*)
| 	???:0
| 0x826f1f emit_move_insn_1(rtx_def*, rtx_def*)
| 	???:0
| 0x8270c5 emit_move_insn(rtx_def*, rtx_def*)
| 	???:0
| 0xb7b994 default_zero_call_used_regs(HARD_REG_SET)
| 	???:0
| Please submit a full bug report, with preprocessed source (by using -freport-bug).
| Please include the complete backtrace with any bug report.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6366cefdf96..1fd36a266fd 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -81,6 +81,10 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
+# Work around ICE on mips/mips64 starting in 9.6p1
+EXTRA_OECONF:append:mips = " --without-hardening"
+EXTRA_OECONF:append:mips64 = " --without-hardening"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.40.1



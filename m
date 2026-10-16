Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A0CCF2C6
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5944.1792189489803324023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ji9sR7J6;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so2989745e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189488; x=1792794288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64khh2UhqjnLEQqcWQLOHR2HCOZJ+aHqR/Qv/HiO/Uc=;
        b=ji9sR7J6Gb7Ut1KpQXvAOIKSIuIl7/nq92Urvwu7e4BvMKvFobPHfi/Wgz7gOiWBlI
         gB3WsB6iMEKAJ6aH1kCsX6BaubRon4byjpTR7QsVy3MEz8p9zu9M04hJnd2EPfkIpyeT
         5Fgauzj7Xk6XcK/3Zl04lr11ZZOsoNjIjypCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189488; x=1792794288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=64khh2UhqjnLEQqcWQLOHR2HCOZJ+aHqR/Qv/HiO/Uc=;
        b=RyoGh0ODtQQTSI6jlgk8sVvCJA6Ii8WC2mo/PwSU+sfjOknY/b82AfuWZ1HoHg8nrt
         HgZATMCbRcxOd0jABwv2crTtxL1WdZ1F0o6Ze0ce1wkz1V9sLmHIhT7Lb12N6qozV3mJ
         WZ8x3wk6n8Ra2CtaElRAQKsbEeM40x3CYrRDU5FLwws9xJXZlHW9AbeEtwMLX5eY/9Ur
         fEPHoLmAY+TIDsIrya8akP/CnZbEpzo08E8gw1eEMYwyUVabxIiAiocM0NzFMOlQh5QB
         WOA8CiRPjIPjLPdX9PDZdHCJfOTqrnssu9JiHWEW4QmRxmsQ6ch1HXGwrICCBsk+tqE0
         cxBw==
X-Gm-Message-State: AFq9FYJwdoRL9vU2ljZhvqFb/cWVYWzF/OCX69TdjcJ83iXB2VEP/FtZ
	GvzIafmGUhotVkPccyIQCu92G27OVO6hko5meVZ/mXBSZbabaD/dL6HsCBtRZs3q8bRh3sD7wRK
	VX7lG0w0=
X-Gm-Gg: AYBFou3zCyfkvTsgzCSGjnTSEo+g7B5AKFX9OJ7PL0tPDXm7Z58nSu8FuTDI2TNGfIl
	i3w2/FFHUINo5YdCK0erY0NNHmFNq5CCp9RFxFEvbLxogaS2DVR1MMPwb+7Fi3v4f5Qt1A37iwt
	7qGSc5MRsfj1vVVAsNCUnk5kpwqsiH22hYVOW6VrKkHFeHgVJjkClPU1maQ2z1LZzhSWZOM7Rk5
	YdrORNJKUQKm6/qfHkdPTSwL8eMOTCtRa60Kd/iu15YOx5VKa+v1u85JrJo9jV3RkFykO0SxBkW
	ddSURHyVwPf3c+Rqc2DisL4QE6Ur03gFsnyavyU48Ug6FRYtVWUAi8lI3cWFNwfODNEhv4tVEJi
	Cprfm1TWQ/8j1nULBOq2RvpnmpTFJOgHQDp6z4bcFRYBn6Ggd8WtUEXmXoG5Wuq+nnmcOl9o5eh
	Ot4HtEyoQ96gUjWzgw5rFyZU7/TuTMnRc0vgO4KDpqQMCHjOutwtQhuZM1A+U6bs3ubQQCnA+Ku
	u4kp0jgmd1J3rNtC5B5e8oEqMPGckm8CIGRKYtKwlZ576XXVs1voOLRXjlCVZiogA58WGzQWg==
X-Received: by 2002:a05:600c:840c:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a1d760d292mr23575705e9.29.1792189487965;
        Fri, 16 Oct 2026 15:24:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 13/17] tcl: skip timing-sensitive clock tests
Date: Sat, 17 Oct 2026 00:24:15 +0200
Message-ID: <aaa2097fd2dbb9702c7a78538e0587ddf1329176.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248063

From: Ross Burton <ross.burton@arm.com>

The clock-33.* tests check with millisecond-accuracy and as such are
unstable under load, so skip them all.

[ YOCTO #16324 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e73a6ed434591fa644c567f8f59e2f442022e66)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index c01a7a1da28..18e03716e30 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -14,6 +14,8 @@ SKIP="$SKIP async-\* event-\*"
 # This test behaves differently when using a system tzdata, skip until fixed upstream
 # https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b094ffa1a
 SKIP="$SKIP clock-59.2\*"
+# These tests check millisecond timing and are unreliable under load
+SKIP="$SKIP clock-33.\*"
 # 14882
 SKIP="$SKIP cmdMZ-6.6"
 # 15081
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index f4d0e90c0f0..40666ef851a 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -14,6 +14,8 @@ SKIP="$SKIP async-\* event-\*"
 # This test behaves differently when using a system tzdata, skip until fixed upstream
 # https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b094ffa1a
 SKIP="$SKIP clock-59.2\*"
+# These tests check millisecond timing and are unreliable under load
+SKIP="$SKIP clock-33.\*"
 # 14882
 SKIP="$SKIP cmdMZ-6.6"
 # 15081


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8CE10706E3
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 15:18:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11662.1773501504326860099
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 08:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nkam1oPT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48541edecf9so33419845e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773501502; x=1774106302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YzwMdDjddgfJ/C5ri4oD2ZgLMMznFmZ++oWpKXLh64=;
        b=Nkam1oPTqWwBlj9cQ77lnWJNPndudC+8oK0ydTmeJtyMxMyLZApAt8IM1vL6Qms1oK
         9vUKZwNiVrwfBqKA9R8DKxQv+JkenZ8j82yjcRcE92X4qodkG7Q45rmeRthIfNYjPfmb
         sefg53wvWaFxCnjKvDpaBAikGFGZHCL92nNyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501502; x=1774106302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YzwMdDjddgfJ/C5ri4oD2ZgLMMznFmZ++oWpKXLh64=;
        b=Vkx/Q6MFxPm3H7j2ozhw75u+EvLr3yp120j1sybr0v7rZZ1NV3IiN2/aIDiJUwAcZd
         goTWessslIPr5+E7M1vHIU/0h6oGad4F9AVmtpePvvUj93g5CZlOetjW6VDhKJqECCCp
         r910ggE7UZv3E3v24cP6ymUGMemfqtO1tNB7lMbRZkx+WTPdP4oWYA6pPgx2p21QPo0J
         P8eMUDvRyfPXlvn2BiRXaP9kMraQHIzSrFVK0preQdv3iEWjBaT5Ma02KaEL+L9lsbI8
         Z+05rcwAloE8G0kvNoaQh9GU5Z3R0Sv8jT8k3xcfeY4rAKrUvEJw5/ILPEYdt6dXPIb8
         zGxw==
X-Gm-Message-State: AOJu0YwzOuZd08cRA+oHG35MGZKAcbCwYpIrVyCJO2XoVmFR7KE23JvV
	dUg4xt8BIQa/EhBLnA6nLHMzx4B4qdh1+UqeFHGkYQ2F/9EGT8MFYf4NABNbvJVOc7+oUTmZU12
	MVxiV9+k=
X-Gm-Gg: ATEYQzw/yys5CEALaM56lZZREpdzET8ewl6FeHTz4GG2vgRfvGbT4sHoack5hOS1/iR
	0ZI6fSaGoNoSbJoftPDCde84YP7lx9ZojTY/3s5ST836wNrHZUVfDvUhHXWerJn+7wfldajeNG5
	3+e3XJng2lH4RkR9SwATKTzgdm/I875JshCtNwbXg3SAP2QnX9e6ecmi3/P3dA3TupMFKS+GOYx
	CjE4dMPr2XXANjWcbZ4/VNoc55BDW3lSyT/KBbo0/nz8sb3KJ5yOELOovqheFBzT/qrYS0EKKXe
	5qFqWCamd+x/4Bj0A0mMlP8UjeMdMszxPqmwWhsGSk+rSxkZn/qQ9bWYdQws+orycubzUicqGjz
	mEP2N1V0J8Z8lKjOuvEup5WfefOqfG8CQq/nX/2kgpCUVdrjSzxknsg7+qXAAceBCuOKdWWoGKL
	6dnLBCyEvR0z0OtbLV5cJ2yusS7QieAyBbI6idNXh6dUJ6fbOFXLs=
X-Received: by 2002:a05:600c:a4a:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-485566f79c7mr113636375e9.21.1773501501953;
        Sat, 14 Mar 2026 08:18:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6070acsm246174415e9.8.2026.03.14.08.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:18:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-packagelists: Exclude ptests from musl which are known to fail
Date: Sat, 14 Mar 2026 15:18:20 +0000
Message-ID: <20260314151820.3978613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 15:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233088

Since we'd like to start tracking musl ptest regressions, mark the existing know
failures for qemuarm64 and qemux86-64 so we can then start to test without
warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 627eae417a6..12eac7c313b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -157,6 +157,15 @@ PTESTS_SLOW:append:libc-musl = " libc-test"
 PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
 PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
 
+# These tests don't yet pass for musl qemuarm64
+PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl"
+PTESTS_FAST:remove:libc-musl:qemuarm64 = "libarchive"
+PTESTS_PROBLEMS:append:libc-musl:qemuarm64 = "strace perl libarchive"
+# These tests don't yet pass for musl qemux86-64
+PTESTS_SLOW:remove:libc-musl:qemux86-64 = "perl"
+PTESTS_FAST:remove:libc-musl:qemux86-64 = "libarchive"
+PTESTS_PROBLEMS:append:libc-musl:qemux86-64 = "perl libarchive"
+
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design


Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C93CD3420
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 20:32:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.8363.1725309139970621876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 13:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mj3bxU/d;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so33119095e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725309138; x=1725913938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQLCQVhf1j+4T/Ts+ZPw3R8gGMd3TXwoFmHuqhI4UG0=;
        b=mj3bxU/dqLUL0vzk1pOgLv+w08Jgf7ZPLfCJDvfc+ih3ebaYChDK9HyeN+/4Bz9Db8
         n6MnZAedYrweHazlU/SiPCERi3iD3vu9EefEgn00czxT1BEg4ZGPt94LJGFkUCc7Tj8R
         la42Q+qk8YkuYmbrSLGhGuiH4no5DZuYZhL16a0KLqYj3Fiyhh6UnCLwyFRi7HLJO4BC
         YXKuYqJ0X8R5oSixKIOc7gRTN+mP/j9beHZ935TyC5be7HK9ceZmTXELA1m/Z/x/k3xt
         rq12Xez3AEwhfJXXmQQGs4HIKoHRN+yWC89vENQ/KO3LaoaJzPlJBYPhpD3w/WIZKCgA
         x90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725309138; x=1725913938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQLCQVhf1j+4T/Ts+ZPw3R8gGMd3TXwoFmHuqhI4UG0=;
        b=fOan/sFDOBWXyQuw8wUQws1PLSu+Uzc34d/UZlJhJd5olS45i7yLRV85UIpVHAw9bD
         lhx2knJwAGbhA/cGAoxvN6uYzYC8HYTFHs5LwTcTQ2+u0lGvRylZfirfoX935muDj1uU
         hk9oGzOF1w548ZY36Rmzhtby5ibu3KmoDftOIbMlhHMmPe2EDIq5WpKuVzdkyv5f6LGk
         /6N9d7vDS7ABknJpI8HgkDPd8BPK6Lf2KC4fZZeYLLbr20vQ6fQ1lXHz1GRwUaABfuel
         rmiBeEHPC/PTOL0Bdr542cwFYi0RBnmRlr15OTKYX5PmINWkSv0iF0IClhx6uTaN7psY
         GTwg==
X-Gm-Message-State: AOJu0Yz0h24EQClde9JdPpeN3M4tVfdLiMbI3vu8jJIG1B7VIokq/VqH
	PZzv9YeCH2H/516cn9Uxxv5kYXBOwRAIriZZmNNJ0pwZCFWlnIn/7ncx4Q==
X-Google-Smtp-Source: AGHT+IHSq84F7dmTX24DKbcnC5e/78bzsmjvMW1Pcn8joNGLfgul129Ak2VQnRDiAtyfXFOcQ5/F1w==
X-Received: by 2002:a05:600c:1ca9:b0:42b:af1c:651 with SMTP id 5b1f17b1804b1-42c880ec221mr10306195e9.5.1725309137708;
        Mon, 02 Sep 2024 13:32:17 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc8de253sm96537205e9.0.2024.09.02.13.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 13:32:17 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] devtool: remove obsolete SRCTREECOVEREDTASKS handling
Date: Mon,  2 Sep 2024 22:31:54 +0200
Message-ID: <20240902203154.265515-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902203154.265515-1-adrian.freihofer@gmail.com>
References: <20240902203154.265515-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 20:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204113

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The kernel-yocto.bbclass defines some tasks tasks and it also adds these
tasks to the SRCTREECOVEREDTASKS list. There is no need for devtool to
duplicate this code and override what the kernel-yocto.bbclass already
does.

devtool modify generates a linux-yocto.6.6.bbappend containing:
  SRCTREECOVEREDTASKS="\
    do_fetch \
    do_kernel_checkout \
    do_kernel_configcheck \
    do_unpack \
    do_validate_branches \
  "
  do_patch[noexec] = "1"

linux-yocto set SRCTREECOVEREDTASKS to
  SRCTREECOVEREDTASKS="\
    do_fetch \
    do_kernel_checkout \
    do_kernel_configcheck \
    do_patch \
    do_unpack \
    do_validate_branches \
  "

The code in devtool modify is therefore considered as redundant and
removed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/standard.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 312eb8ab506..b2e1a6ca3a5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -952,9 +952,6 @@ def modify(args, config, basepath, workspace):
                 f.write('EXTERNALSRC_BUILD:pn-%s = "%s"\n' % (pn, srctree))
 
             if bb.data.inherits_class('kernel', rd):
-                f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configcheck"\n')
-                f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_kernel_configme:prepend() {\n'
                         '    if [ -e ${S}/.config ]; then\n'
                         '        mv ${S}/.config ${S}/.config.old\n'
-- 
2.46.0



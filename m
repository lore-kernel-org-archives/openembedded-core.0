Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC7ED2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 08:51:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2392.1768899104307660381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 00:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFTejjzl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so33341335e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 00:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768899102; x=1769503902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8K9vyeQj2TWiHP9MoKTpWKQxTSgxVHXR+TH5kIoMA0g=;
        b=HFTejjzl6HPpjn+iVxZWtD9RyyWtuKOPOzMGUTBv+fcqZKAQNe4AQ4F7fUTLGKbLTd
         0fb7U5vXg/UF6OP85Ka1mjhAfpXGoCr0myyiBr3Ak9OBykOk9DhGQn9Ncj2TRGZDolUe
         ryFr5Jm+MBejHGaLvPatmFx2PwZUTRjrx42os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899102; x=1769503902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K9vyeQj2TWiHP9MoKTpWKQxTSgxVHXR+TH5kIoMA0g=;
        b=SSTGRvOvbaMlGT/qMNidUyso/HfL4CwXFDEdn0CCNUt8LOjatpgUG+HBATQZV2pfLV
         FcK9OcbCkpowC70MpbtKPNmXeaLv6cGT6UNgtf9ZiuMmMlxwgsnQQxvLp05Hn7UnZGqc
         Ol3Q0VPwGDTyCAcfWfN4l5Th4Q6I5dKRzsGzjHg4A0PzbBmXtNRzFtqtKbVE/9uAg+gy
         m5U0NAQ362dOVT7O0TBDH0KP7P3HW4dw6eq/4ODCO7D51Oxb7EJUUBGLl14TvR6iBvab
         sqbj5HOPNi6k06LDQY2Y7ugDMEXRTUJPdZYOLy5EvWpo5d2eXBPBqc+0KYYzoDBLDVjT
         q24A==
X-Gm-Message-State: AOJu0YznbacOTvj903w+clt0MeWZaFV00F2P/t7G89rTtkMtvQOv2dkX
	J5zc8KOhAkZZmhr4rdA3hQdcDYog++AJYIe74N6v1z4YWxEnq4VkLbWCHc/gERKLAEzZjKNPDbE
	nRE1Qxws=
X-Gm-Gg: AY/fxX6C+J9kDe7BzuRAqz5TuPEmgaILP6QedsU2AG3pyleR7cor2XMgDtdJBE6EXxY
	PYg1+vLCVsC1TC0ir0dr1XVx/TUUq3sZmReLML8Wk95g6hV+2HZKQu/WtaoHyvXQPstk7bH+VX6
	RKNm8qPQolgI6waWCmnVA0ySwkGVsC1YkezpPMAITnTYL3zid+mUb0sV+VbBuXcPUzFViKel/XT
	FghNo/4KkPDoh0QLbWOhNYSL221DAlyVA4Dmec/F4d1LXkhZYlxgRoifbscawn/qtMsE/WSM8pN
	Xfl0O/pV1lTfdEFpSufh/JIUQF7nyhJ0CfH25lzM18CpVsyTsAxvJ2lQatBtbeFAO/ualdvD18d
	ko86gMla/B2ukWsvhi3B9tmM+rB6nN3MeVUk3/4qe/4FFjkJMTjVZGQPhhm3evEjzjH/p0upFDy
	ug1WPiVmtLnXNaNbG6f7mq0pV/sQvcfZrtKaB4MQ==
X-Received: by 2002:a05:600c:a0a:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-4803e7e7db7mr16061325e9.21.1768899102220;
        Tue, 20 Jan 2026 00:51:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:62c:c694:1cc8:4ee1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm237999135e9.5.2026.01.20.00.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:51:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to 1.9.3 release
Date: Tue, 20 Jan 2026 08:51:40 +0000
Message-ID: <20260120085140.3719857-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229652

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19b0d29b718..5fe8b20d4e8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=fray/master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
 PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally


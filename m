Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9B6C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:34:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.25133.1673447687462365035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iNxe5RI5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id c26so7107393pfp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n/z5VFCjyMjYgRzZFOHXBOCR1oicD8Vy+jMExlM/D8=;
        b=iNxe5RI55oQGxemDzR+FdFsnks1g4vlvzp/kJ394tZqAnixxPrqxzysRIdO4G6onVI
         CfzPNmkaTKOkOklOx8Fg9RRMAO6aB1XBV15zo33l2kW6MBuw027EtA9gferklBq4JCwg
         J7e8RSuR2YKmg67s8wDLdui1aCJntaTu3avXXFWC8RsToxVV4Bb5ksKJ7PiCTgHHwbHl
         8698aq5mSUVf14+v/X2/WSz0/BrqfXAb8LlUgB+FP3w1dpYTDZJZasDVjKP+Jv4EDbaF
         V5H7LEtQOVejgqHJ8JvTfMKS93/uSx6lFIOWoTsDVJ23lU7KzQBKRizSF4EFeyo2/0GS
         J/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n/z5VFCjyMjYgRzZFOHXBOCR1oicD8Vy+jMExlM/D8=;
        b=oClu/bbu7HZnqsOf4cL2ktfDjEx4GgG1w184D2suCdop3bC2Xzb7Kq7FoBPfAghzVw
         iw6Ce6dKtKhdWSs+SPerR+0XxIRy0fKRM+v2C0A5t6qBtd9j3SwcArXVG8Jmyy1cQte0
         4fus7LBZUhBzpzzjlEOvWmofJSm8ZtFOZAJNvTa6D69AfxpfzTvJOjx3nRUce2BKNxy5
         hSZh+jSE8IIPIuk5ZKnolgxNrRpC7muSpJ4dDV/KQsutCfYHIfogELfw6GK9qFS98sIA
         LJdS+0XFGvFTy/jMgMLJ96zzo06wwMpQ7uyiEbb3E0fS+njvBWQM9OfpFqVh/g03l2aN
         lxxQ==
X-Gm-Message-State: AFqh2kq5o+NljCzXddJdaSk+C/svb2SBfucxWgWs8BQvqGUC8sLJwmqG
	YfMYlhTKZo1n8QjI7aJW6rVzv8uUULjCi2BYYDA=
X-Google-Smtp-Source: AMrXdXsC62Q7MFaIXsUcaMXQYnD4ny162FLyy6ZJizkcsUFwDpIyJG+lvFnEGFYG9GqfoYXC0mBMRQ==
X-Received: by 2002:a05:6a00:21c6:b0:576:a74a:13c3 with SMTP id t6-20020a056a0021c600b00576a74a13c3mr93765700pfj.1.1673447686482;
        Wed, 11 Jan 2023 06:34:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] base.bbclass: Fix way to check ccache path
Date: Wed, 11 Jan 2023 04:34:25 -1000
Message-Id: <f2f70bf8d93b33b65875828c0402a98e943f660a.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175744

From: Changqing Li <changqing.li@windriver.com>

The previous code had 2 issues:
1. make hosttools/ccache always link to host's ccache (/usr/bin/ccache)
even we have one buildtools
2. make hosttools/gcc etc, link to host's gcc event we have one
buildtools when keyword ccache in buildtools's path, eg:
/mnt/ccache/bin/buildtools

This patch is for fix above issues.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b7c81414cf252a7203d95703810a770184d7e4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 19604a4646..3cae577a0e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -139,7 +139,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is
             # /usr/bin/gcc, this code can check and fix that.
-            if "ccache" in srctool:
+            if os.path.islink(srctool) and os.path.basename(os.readlink(srctool)) == 'ccache':
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
-- 
2.25.1



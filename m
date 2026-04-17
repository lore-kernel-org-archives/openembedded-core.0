Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FFAF8E4AA
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 05:16:43 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33136.1776392892958068981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 19:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wbinvd.org header.s=wbinvd header.b=biwII1Fl;
 spf=pass (domain: wbinvd.org, ip: 209.85.160.54, mailfrom: calvin@wbinvd.org)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40f0e14b9f9so173769fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 19:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1776392892; x=1776997692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N69Bc+xCzIbfKht0VLKCD3/TCfG5Kft6nx45g58oMH0=;
        b=biwII1Flfv9HDCzb/ywDd/Sa6ukWABPpH0DSm0Xrw7o5l6jQnABbWzudsJbsrQi8Ry
         reZI6St0nWAKxgroxyfQYJ4rT3zcL3uGg6gghJChcw1ABQ8huxgJ8BRBjTV6VHOX52MR
         R5/eLXpbf9KC7WYNTWgNmZ5TuMzJcqr6hI+6FGCjB5vQb6slvpJdxPbqQXm6AriBmkHj
         GAPZrccGV7XYBu6zctxtzoLxJVuH4sRF6JX5HHH7HEe4cEUzxxNkyPa2OyKZg5WnVCwn
         Xb2xilfMlmO90SDSlLA1Y0xEkYFF7Bc8YspRvDfv8Un4rexbRTmXSqSG89dN8tAb+NRQ
         6CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776392892; x=1776997692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N69Bc+xCzIbfKht0VLKCD3/TCfG5Kft6nx45g58oMH0=;
        b=AAjP/K7Qo1sgvHzTjGE/fEDgf24qJ+8agBuadeqTFwlp+LRb5H/yUNGBDhndLSW1Z8
         un1+1accop6SzQasXqYHlf70ZwYWoJ/8eKfz4qeyN0JGjUYalUa5AJSJGt3DOT4nv9Ix
         VoDOeDDrjILfZVjXHv2u8hu+yVN/rWYtRQxsawZdrljp9yA5mdUinq66RtAxieSYG5QV
         hkinfheiPkcCPg9F7m+lxYfQ+U+IcrsthBSiW4p2SkS+Syc+cUsiZQSPyYmWZmh80LES
         JylABVrWTV3h7FyQSjIgL/Mz5AwL1wB6kDcZcyzHfDRDd48jiOWBuVu3SBu3/QTJo8cl
         I/LA==
X-Gm-Message-State: AOJu0YwfKDz8uJTcsTgPcXEc5dxeaI2IOuzH1SEDzrZxkSCB9+SnSi0k
	syq3LL3JhQ3BDRIYABT7zbUDgchInpE8wPD3WAKa6hBPyve/VKPjFXkWtxjKFNEbN6kfUq7Y3uQ
	TKQ7t
X-Gm-Gg: AeBDiethuG+enM7z1SnzTVCBK3uNhbScVIZNSfA9x91bdHA07zHYq90QAQSwqCiDzwm
	XnSpmmZc+ro0jvQ03wDCGazwNcGAt03SWGUAiCP+HTmUcwMNMAw9GJURvw3HCUsU+X3QWMXjIa9
	EbrGdZpKN/wl4jup22XQNUY5jZIBPdcoBTR0X+NP7haIvOoKKWZSw8PlDh6lnSy5cZNvCTxvxSK
	f2nkBaBt0GLGUyohJwdN0Ys+qKbQx8KpWl9yOx1+qeubqRVKDeTXMs8ImMj9GG5c3iLRgoGHD1w
	0FEtjiVJXIXC5hijTUOqOqLfiPiecYLuZQt/Hj/tAdaN0Rb47XwEEOuGZsBeDmTNerB5zlKvf72
	UkbEYdoNm54wb4KC/1h3rLHmVPdpJtK5cURN7glTv4PC+90aK/nWihLJ2xPXes1wiT7PfsNqsc0
	9wfijZw4dqLeibMWucDrAg1P2wo/InSNH4IbfQ
X-Received: by 2002:a05:7300:a187:b0:2d1:9b35:4eec with SMTP id 5a478bee46e88-2e464daf9f2mr362520eec.2.1776392475157;
        Thu, 16 Apr 2026 19:21:15 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:d569:c297:44f4:cfac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce426sm345647eec.16.2026.04.16.19.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:21:14 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [scarthgap][PATCH] Backport 'kernel-devsrc: make tools/Build optional'
Date: Thu, 16 Apr 2026 19:21:06 -0700
Message-ID: <e2093fdff31efa8b84fa09cc62fb72a77a8cc29a.1776392062.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 05:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235482

Backport a patch to fix v6.12+ kernel builds on Scarthgap:

    commit 13e16e5be25f379211c7329fa1462464174c0f2d
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Wed Nov 6 21:29:17 2024 -0500

    kernel-devsrc: make tools/Build optional

    kernel-devsrc fails to copy files for v6.12+ as the
    following upstream commit has removed the file tools/build/Build:

       commit ea974028a049f2cea4bb6be963ee3e3844a03f6d
       Author: Brian Norris <briannorris@chromium.org>
       Date:   Mon Jul 15 13:32:43 2024 -0700

           tools build: Avoid circular .fixdep-in.o.cmd issues

    We make the failed copy of this file non-fatal to support
    all kernel versions.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 7724967151..1500aff2e2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -156,7 +156,7 @@ do_install() {
             # these are a few files associated with objtool, since we'll need to
             # rebuild it
             cp -a --parents tools/build/Build.include $kerneldir/build/
-            cp -a --parents tools/build/Build $kerneldir/build/
+            cp -a --parents tools/build/Build $kerneldir/build/ 2>/dev/null || :
             cp -a --parents tools/build/fixdep.c $kerneldir/build/
             cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
 
-- 
2.47.3



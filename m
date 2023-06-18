Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A99FEB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 09:09:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.2648.1687079389403418098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 02:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=CwGaAhUy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f907f31247so6823245e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687079387; x=1689671387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8++y0rW+irVDAtb7FYP98ljG+EmQBfgzE1GR+BzyenE=;
        b=CwGaAhUy27cUvT9zfA1qproxM2a7m5LF6CdDYAbF5DRbAZQLpSA7gQMgAL1N/5Ltuw
         pv1vqGAEAAC6FlT090+lFI2NVgOsXV7HxzCp2pAzb2ESMZ5f5JaXx6Bn+ibC8EEzXAqX
         N5XM7LOFD0pzhRpGAzpwYHa91N/3rsFd3c8vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687079387; x=1689671387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8++y0rW+irVDAtb7FYP98ljG+EmQBfgzE1GR+BzyenE=;
        b=Qmh9dGLSqNoRhRwFsswhv/k1a8ltgkiTbHLaBnC9jfcbMuht1VEOJ61glqLpkYe40U
         YNtPkPXaZBnjLr0UMvUXUj8cbVwkQbZ0rAW8o9X5Nq/SLR1FszFaTn5G/LyRE93/mK7l
         6AL5x6ayFm3bKDlhbF+3bKgJTf5A8p/aL1vuCeTDEobMJvIldtQeWOoXj0x8QiImR1/F
         i7lk3d8MArKLuwX1+FMfEpLJE/cIKR4/Mt6PKlS74rk2ptKLQTXTXen+ohBrKcIq7Dwv
         oqHMR0mO3xQN9T662NOUBFz0vIiM+6HK5YqsUa1U3bFUD9IzW49twJ3qOZp40rotsNoz
         XDIQ==
X-Gm-Message-State: AC+VfDyf9/ZV/wmToVTYz8XDwgYj/UclMTWwju9khrjpoR37m74Uoc1z
	/4iel5B4N6YT8KzYmHJGlFboYf/lkQxy8zhXu8s=
X-Google-Smtp-Source: ACHHUZ5zqOwLja2Owo7IhRrEc4VS6/9V3MnBN5Nn92JCnKzepa6AlduJQkiFNCNpKocCWAVtsNe3nw==
X-Received: by 2002:a1c:7404:0:b0:3f9:aaa:37d9 with SMTP id p4-20020a1c7404000000b003f90aaa37d9mr1260471wmc.34.1687079387296;
        Sun, 18 Jun 2023 02:09:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6795:a107:916c:13d0])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003f7cb42fa20sm7114876wmj.42.2023.06.18.02.09.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 02:09:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-runner: Pull in sync fix to improve log warnings
Date: Sun, 18 Jun 2023 10:09:46 +0100
Message-Id: <20230618090946.2478083-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 09:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183056

Pulls in:

    utils: Ensure buffers are flushed after child exits

    We currently wait for the child to exit but we don't flush the buffers.
    This can mean the output ends up out of sync and the END: line isn't at
    the end of the logs.

    We've recently seen a lot of issues related to this on the autobuilder.
    Add in a flush call for all fds to ensure buffers are in sync. This
    does appear to improve warnings on the autobuilder now we started detecting
    the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index ff5629c6f9b..67dd887c240 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
+SRCREV = "ea2a9cc159ad5f64ee75781d55101d7c340e0303"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.39.2



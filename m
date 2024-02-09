Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258EBC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:30:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9335.1707478239113815182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 03:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YUZupntn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fd2f7ef55so11002935e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707478237; x=1708083037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7pXkbLabwNEuUn79Q4Be7bdLz9r4EO+PqIvuMM3I2c=;
        b=YUZupntn/IewOmHS/0bPe7/hqmubOQ/r5Xp4wuG8U+eNx6SEiUQeMtHM42XtZUSzKi
         AZXXeGHWQrayoimoQDL9M2g2aXNJ08jfChBFT4NFYSHGkWzMA2/pV5vewWOSB5DhEZUk
         TEIaA9somereh5FrTospfVFZqQM67WcoE68Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707478237; x=1708083037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7pXkbLabwNEuUn79Q4Be7bdLz9r4EO+PqIvuMM3I2c=;
        b=QOI5i/MMUccZjYQl/qvfXI+TCeGrBtRPKb28zcrrr8VpAs/7cIzA9pjvx9fHp6c9aP
         3f2i7pwtcjFTEVqr8Tq1saWJYCLY8dR68JNyaSMCkbcTRxXeg23ssiIPwBKDG+pIpzMd
         qkbbVNR7bzGkZcVZ5oDESoBXr3E2+i4IsSpOnhMGTG1z+O5Z3jF6eRC9EN+fuiCYYDpW
         BsMZANJfLynFn6HxRq+fcbVjPEysNndUxiNJFu4ayG/qYiCVp3b1tWb8J5fORT1YjTQK
         gyQMadrYde5MB5FV+6w9OlmctF/EiLnzZ1LwWZ6oKFk2hClyK7vJFqV1WJUJgmyRpnL5
         25Fg==
X-Gm-Message-State: AOJu0YyFOJ/je5cs9ZGA2NpQUjEApZroqzd6cqWsMOXW38yNTaiIDMc+
	oemr5emgvz1dE1KehAo3PPrxbaP2EfrGAVLUJfQI14Mc056whHty29MsfquDoeS6DRM4TSxsB++
	B
X-Google-Smtp-Source: AGHT+IH+QB7Pi9Z+6ClRZmojEKTwgNbcjb0Tppw5j+aBTN4j/zqlXK8syhfjh3951PuYblhAMbvBxg==
X-Received: by 2002:a5d:4e8c:0:b0:33b:38ce:8a92 with SMTP id e12-20020a5d4e8c000000b0033b38ce8a92mr820099wru.20.1707478236780;
        Fri, 09 Feb 2024 03:30:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b0040fc56712e8sm359282wmo.17.2024.02.09.03.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:30:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] no-gplv3: Add workarounds for update-alternatives and ptest
Date: Fri,  9 Feb 2024 11:30:34 +0000
Message-Id: <20240209113035.3372683-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195200

Document the tribal knowledge that we have to disable ptests for gplv3.

Also document the workaround for update-alternatives issues with bash
and opkg-utils.

As with anything in this file, the exclusions come at a cost.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-gplv3.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index bb2e836f982..571e7f882d9 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -5,6 +5,9 @@
 # The intent is to allow some images/configurations to build, not everything. There
 # will be a cost in reduced functionality.
 
+# Many ptests are problematic due to bash dependencies, need to disable
+DISTRO_FEATURES:remove = "ptest"
+
 # Settings for full-cmdline
 RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
 RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
@@ -26,3 +29,6 @@ CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
 # Some python-tests use bash outside of ptest
 RDEPENDS:${PN}-tests:remove:class-target:pn-python3 = "${MLPREFIX}bash"
 INSANE_SKIP:${PN}-tests:pn-python3 = "file-rdeps"
+
+# Assume opkg-utils is only for update-alternatives
+RDEPENDS:${PN}:remove:pn-opkg-utils = "bash"
-- 
2.40.1



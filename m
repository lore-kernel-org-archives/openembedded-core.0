Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFE1C636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:23 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.3.1676236274818413688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5/Eximu+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id h4so3794019pll.9
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXUxri+vOw2JKOk1Z8QFuQBKa9cVXhpv+ggtJVSGxo8=;
        b=5/Eximu+zpePg40HA+lSNnYg1gS1EDjUXSyDDvrccce27q7HW1btWrYC9hPe2gCf0v
         jKmUaR//fKYE7gkusP76Mry27CB1lbUM36sBh+L79Tc249NirGuDbkHgrDqxNFS4edPf
         ZEjsW0B2vNV4CBX8ndOPoorei21FVLF5pnaZpBJoRIOmyYAFiLbj0ripjTNx2OZDepdv
         V+KQ1VhORcpKWmMLH4DQPDEfQAz9gSvfjByq3/I8xmvQm9lRZUQc9eAn7tJP7+mWkz2Y
         PdzsQJBfr5UDUQx6PgmtFji9x9z5S36c9OXGs4y8wtb3451NQdfQT83VFY1v4eSKg/os
         oPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXUxri+vOw2JKOk1Z8QFuQBKa9cVXhpv+ggtJVSGxo8=;
        b=ihuLfkAR5Ik1Tz4J/i78o81Q2SvOT3xvrN0gy9r6+roHrBSzE74ccGhoqc/feLoz4k
         +x75RYAgS9ImdOts1SP2pTTJS51EJjB8XevxhLBzy+QL/JEMM9UFcePBxMt4i9X0TWK/
         o+kzt/+QSeiAKnikFrw33yeDphsIiQYNpexRISNkgoh/ZVOi2vnDVBhEua9u7KEjUV6B
         zqRo7ZipL68PDMfCN0CXc7e3829bdC4GfB2Oha/PmE6dzH/HR9iaItLoBnPFSVr47xnP
         RX9XjOJtLUiCIWAF0P/q4QkXV9h4+GKqU26E59bFmTcIGC44kRpeq61CVCXi/hV9YQrt
         HY7A==
X-Gm-Message-State: AO0yUKVaXIwbofgHFklPJcX/BsZhXVK5YTM/jnFQ07STCvwMCf4idA7m
	4rRv0kCk4njQk9QhUdN2ZPtlne0OqKQszfnYr60=
X-Google-Smtp-Source: AK7set8aHRmQ3k/G71LHwjsJ1k2V8juuWC7/d6O7IUV0w4DTxZ5BRDgtoi4AjIbMSpak3mJfO+euMA==
X-Received: by 2002:a17:903:283:b0:19a:9880:1750 with SMTP id j3-20020a170903028300b0019a98801750mr3161157plr.53.1676236273787;
        Sun, 12 Feb 2023 13:11:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/27] make-mod-scripts: Ensure kernel build output is deterministic
Date: Sun, 12 Feb 2023 11:10:28 -1000
Message-Id: <5fbe4dd7dc45f8f219d5c7cd30b50928b69af26d.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177055

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The definitions in linux-kernel-base are needed to ensure the generated headers
are consistent. This was a small step that was missing from the previous
changes to linux-kernel-base as both kernel-devsrc and make-mod-scripts
need this information defined consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d79d4883f924cef0d0ba361506ad75d441b9721)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0e420a25d9..f6f47cfff5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit kernel-arch
+inherit kernel-arch linux-kernel-base
 inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1



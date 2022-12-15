Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BC4C46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:34 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.143571.1671132088604680073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XQkbEQ6k;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3714936pje.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=XQkbEQ6k4PJK3CP/58+c2lUwFz5rkldnQN+0QjuWr2CFXV8qa4k92mUyGRoqaiiPAi
         EuQUzpoRVvujMrjcWXhWmwOdet8ClMfx25iLRq2RomFkefQjoJ2mjHpf678/aFpZxvES
         sf160w/xJ42T72dKx1itT4NrVQ0M2qHiH2Ld/BxqolezeZuIwbLuMn90nC5Q0Mrhnnhb
         aZ7wx15BOhyb8p6upwJqM60jGwHKZxzci440r61vPXr817Wm3tbB2jysH4Yd48Vsf2s5
         IHNzUsvxgk/+cUx81VK4UAtj2L06xshVzCQO/f8CrEVPDC3CeRqRN0vHsc43G14NUfp0
         euug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=LmIutWMSpMUkymA+V9CKnTWA35Q2ibc0lxfXxiBzrPiLMFm8mQywFX3pAsY9EXs5jR
         5gOcLD0BNXD1U6hSbUays3WbDvqNh8k6sgBlB+29tO5xneHBWwKPk5rEzeWkzSIoGK8H
         syA33cdyYx5ydkmTE+P3T0a6C+nYoUEWFDtawrFfXKcb5Gn/axfkpmc8tWiHog7rPr+j
         56Uixgecv7qGDabYDfGXhoxluosGw3alDHe2cQrMGKucvf8Ot/z8KhrwTAIZcLXELyo7
         k8ScujZRZXXRyOmV4UfkLK+HEA//3tZkO2VRf5kkAkt7sC+8CDke9yZJpdfZXekHwkNp
         Y55g==
X-Gm-Message-State: ANoB5pnPeN9rwCxYoqmxiUQ+G5wbvtIIxn40xxvcL2ippDSwM/qnoghF
	EDaoyMzE0XZufoeLrWIVuDCGjgJXcBJgZ2fT2S8=
X-Google-Smtp-Source: AA0mqf76iZVgSD6CldUGazOIDzrYzDg3oh8wIQL2CgbjIz8vW+GsAO4WC9G8Y/qKon3U+cyqArSOCg==
X-Received: by 2002:a17:903:138a:b0:189:5f5c:da1f with SMTP id jx10-20020a170903138a00b001895f5cda1fmr30416395plb.5.1671132087582;
        Thu, 15 Dec 2022 11:21:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/30] psplash: consider the situation of psplash not exist for systemd
Date: Thu, 15 Dec 2022 09:20:39 -1000
Message-Id: <ef12862ceee15b77eda108f75d656c58e6b4b29d.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174607

From: Chen Qi <Qi.Chen@windriver.com>

In current psplash framework, the psplash might not exist at all.
For example, in case DSITRO is set to nodistro, the psplash does
not exist.

In our psplash recipe, we have:
SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
This variable is parsed to if psplash-poky-img.h exists, a package
named psplash-default is created and is added to RDEPENDS:${PN}.

We can see that the psplash-poky-img.h resides in meta-poky,
and in psplash_git.bbappend file in meta-poky, we have:
FILESEXTRAPATHS:prepend:poky := "${THISDIR}/files:"
So this file is only available in case poky distro is used.

To fix this issue, add condition check in the corresponding systemd
services.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7a62ff9ed39c179d2b9b0c40f4f8423ced413063)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..bec9368427 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -2,6 +2,7 @@
 Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 Type=notify
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 082207f232..e93e3deb35 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.25.1



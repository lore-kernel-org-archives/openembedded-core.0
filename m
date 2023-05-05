Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC08C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.30325.1683300033434856161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Prl7XDEw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64384274895so1448905b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300039; x=1685892039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VLYXQe95cmNnehiDpcfRbPRieARe4w1GWQufuopgXE=;
        b=Prl7XDEwBEmmc3T/Cg6VL93pfj+7G/5RMF11gvMKk5Elp84l9GdImKSWlBRgN0L+Zf
         5VPODi/GDOv+uyDu3G5h1ivOKpBZQKAz7x6gah61Hy/XRQ2+s6M+VNhJQu8j2ZCBHY8v
         HNIbNciMf/zzKNovty20AgHgMC49ZOU4AiD8Qy79KuL44bD5W/0V70OoXaUxXOIoWfUy
         aOGk/aeuQO4kEhywUbmVfh4WDQwO4v8ZcJRHzojahVOJZVpuApr/jyt9fa55+Saz9Iel
         PJdCfIGkOl2QoP8+PjrC5diyPD3HyuI2gtf1SOTfnX7zPdSELiWVZTuNQwQrOG0JI0JO
         5u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300039; x=1685892039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VLYXQe95cmNnehiDpcfRbPRieARe4w1GWQufuopgXE=;
        b=iPL58v/e5EFDBO95GkTpQMOTcCmS/PXNWBlkl5Ty7SgCISzXlRq/jy4loVReX8jFDl
         m4aIKnd9cjzKSnuunicyZL0oXPLeHBKaMoDU9o1hL+jN4OxCpu/JMleWb2e1jgkBaNuh
         WPUiCkF4sqsuvmWKxEAJA2OLMQYEVJMwJB6V8pzwSNmMpGtq4a+FiLEzZF7EjQWAC5yg
         Eerp4M8rLYth3Yh5AUiNN+O/AaocJwqwHMJQ4r1WuauSEhkCGEgMVxLSsWLXtz4SPy8Y
         YuaBs/XoCDR69+fXao1gTA5FFyPd6YI7fQli9IFD3ON0oZLanugbUMNONfNEtKvwoB03
         UQXg==
X-Gm-Message-State: AC+VfDxWHEpGzZEypmq7GJxj/bsRj+yIA9QpymJU3kGvlNL6z75NQdXd
	qZdQYmoe+8W9XWDjxegM+sRRCWWRa4OJ91yk8+s=
X-Google-Smtp-Source: ACHHUZ5SR2fbcjq0ePSH45WfhbfmADBXiMbnFXWWz5jU1sIgcObf92IeYmBwPSfGo2W6Alqi8S/LrQ==
X-Received: by 2002:a05:6a00:24d5:b0:63b:22e7:6ee6 with SMTP id d21-20020a056a0024d500b0063b22e76ee6mr2832164pfv.31.1683300039313;
        Fri, 05 May 2023 08:20:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/35] xwayland: upgrade 22.1.8 -> 23.1.1
Date: Fri,  5 May 2023 05:19:32 -1000
Message-Id: <a622fbb571d72c1a86ebf9ae01f61b4dbfe48c1d.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180941

From: Wang Mingyu <wangmy@fujitsu.com>

This release contains the fix for CVE-2023-1393 in today's security
advisory: https://lists.x.org/archives/xorg-announce/2023-March/003374.html

Benno Schulenberg (1):
       xkbUtils: use existing symbol names instead of deleted deprecated ones

Joshua Ashton (1):
       glamor: Don't glFlush/ctx switch unless any work has been performed

Michel Dänzer (2):
       xwayland: Refactor xwl_present_for_each_frame_callback helper
       xwayland: Prevent nested xwl_present_for_each_frame_callback calls

Olivier Fourdan (2):
       composite: Fix use-after-free of the COW
       Bump version to 23.1.1

git tag: xwayland-23.1.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 35fdbd0ea81650a0421d50fb53989d96c5956331)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.8.bb => xwayland_23.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.8.bb => xwayland_23.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
index 6919ba421b..a065e92f01 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
+SRC_URI[sha256sum] = "fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1



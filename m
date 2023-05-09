Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661E7C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2955.1683671584013447630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cEkVhxg6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-643a1fed360so3532385b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671583; x=1686263583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHzcO+y0BaNavzmLbKnrgabe/cFUeg/wQXoqzFoURw0=;
        b=cEkVhxg6/dFTPqH6cUTuMSdYYChWmjjpEofsuVnIiEa1Dhq/SVeD7Vpza5T30Nh1UB
         viHhL4lO7ay2qtuXkXlpww+q8Zs3vt9D5tFuBBwHY1sF3drgz6p6a1xqyw3AunzID3LB
         WOSqWOoI1iTeHzEMGnHdu7nY+++rzEDoyFYOobbFmMpzXsiO6Lvvln/6A0BK7UsXtFOS
         0604DURwOipbzS7VipKSrdo7ojqeZiD1iVR+gVkT5o8vFZspuVbZ+XaAC2hYj8tt32Vo
         8Xgh+wpHPL88u5FeXxYImucYc/MW9zcBf4WYAK+UzR8A7ITULQEEFWooeoKAgpMuFtva
         GofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671583; x=1686263583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHzcO+y0BaNavzmLbKnrgabe/cFUeg/wQXoqzFoURw0=;
        b=jS/e7YulC5M2/P5PGgDexji8FRjZDHm6iakittQU1GJlwJdyGZ9jRFamT+YK5U+2Bl
         FBcwKZkElbPQ9B3Nw4cEJqcjMbcmJfeAW+kjWBlcP6wwGsMDSmMSbz0QNkbv4yiRT14K
         PVXkbKKIHbFlVDIN4xFUCmS4RT7BlrLqf57TvnGlDybKSwQwD2h9xa6bFAuOLZzSOwGs
         pIz8f0vrgqeSoSXeGcT3+oFGQ8YiUJjYmU+mmaf1Y1FNpUuSBC2wKA+ZtqBeR/jMjI8X
         rw06FpzYwvuPhYkPZ0VutmOBNW9SQWSmFYdGOxP9C9cL5SGbsdUIOTgNjylFi5nyNsy1
         2vKw==
X-Gm-Message-State: AC+VfDyjNDaFpoGnEejkVRCRshXKIa6oPqCJ8eGbGMSQOqCufNiOmoi2
	e9o3MYvoxXozFjOqK0j846qWXYvZozJ7QKz1gAY=
X-Google-Smtp-Source: ACHHUZ4TtXMhaqyOASsEL7eiDEBP0fZnqI2e6bvmiezdCM1g4XOr922zqAeHtn3r4iQNkdGe1rgmSg==
X-Received: by 2002:a05:6a00:88f:b0:644:ad29:fd37 with SMTP id q15-20020a056a00088f00b00644ad29fd37mr13910056pfj.28.1683671583102;
        Tue, 09 May 2023 15:33:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] kernel-devsrc: depend on python3-core instead of python3
Date: Tue,  9 May 2023 12:32:35 -1000
Message-Id: <a2301aa1808d631f8f00cbc1c5790ab4e734dc0a.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181094

From: "bkylerussell@gmail.com" <bkylerussell@gmail.com>

Avoids pulling in potential GPLv3 packages through python3-misc catch-all.

python3-core is the intended minimal RDEPENDS for packages requiring python3
support.  Other python3 module dependencies should be listed explicitly.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 231f93becad619f6afa383f9b1132f1d4b02fa64)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index f8f717199c..ed9746f837 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -334,7 +334,7 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 FILES:${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
-RDEPENDS:${PN} = "bc python3 flex bison ${TCLIBC}-utils"
+RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-- 
2.34.1



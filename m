Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B97AC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.54503.1677012314972301851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G1LoYpvq;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id m8so2311872ilh.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1uCrQguv7U9iGkXgRCzolwMPoKYGeMjRfOZlfScQX8=;
        b=G1LoYpvqG4ZjzM/+lmSVKbBz0nCHGXzisBwyDnc5sUlPodIyibS15/IUbRYQVzSZSl
         2lodSqvBsZhNbvADY2rfdXilUEkBktEbfiKIuXM5QkMLTAO5je4IJ6WyWFIuvebMp+rf
         myJa+buf1VXTxzCNrJRzUdWZWN2Nm5DFfaaU8ZLl+ERDvadzBKwbZ78yNIXF87LACJUZ
         sfitlnsXIbF6zrgZoQ9CMvuS5bTFXyDfCVtDItTALkN6iAvXUDE+cCLN+PIPzPg/BKbO
         g461SzsCtlntC6wRoOXS4I9QCmVUpXSFGEvnGnhaTs6Y45WrQJdDwJImm+3CCFXtN8dO
         odYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1uCrQguv7U9iGkXgRCzolwMPoKYGeMjRfOZlfScQX8=;
        b=NAbozPHGE7ebk8QR51E/gKBPRs2LYYX7U4G745NcWHjpy2MT2WNSctpJ9RJbSIlQhw
         mRp1goeFx7ZCnK6OX2hbPSj1jMJCWrG9+QBC8roOc/UuCyTZqZCCkt/I6djuKKqCCrjU
         gHrr5MJDP918dFhy8GCKZ6v8Z9BIF0933HdR+EwQ7lYaCQHXvdVFfbwaoxPEH2BBPTmD
         EjsSo8mQM1Rvvk4QYYxeqF8GJJPgUGxC0BEXEzAqPiBMGePsglPkcJw93b0nHWTLlRnV
         eVi1Tr7moouQ0a/BDKGkB+2smJiQuXWyJGMWo0sPIUPBOQN6oD4Esm67skvNlhnzAySB
         JK9Q==
X-Gm-Message-State: AO0yUKVp4f/WEJvpK8s0YWpcvmuixUrChKRHefXgGe1rW4bFaeeJ/k4r
	bmvPLHwP5Cje7GALwA1UmcDfwA7wX+E=
X-Google-Smtp-Source: AK7set+CuW5a2ELsyvbV1m3fPF0/z0mlcRYC3jtcBYAE7tNgBAUzGgbEq9/BU6SxbLLNekOdfFot1w==
X-Received: by 2002:a05:6e02:198e:b0:316:dc3a:fdc1 with SMTP id g14-20020a056e02198e00b00316dc3afdc1mr3152859ilf.19.1677012313807;
        Tue, 21 Feb 2023 12:45:13 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:13 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] build-appliance-image: QB_MEM: allow user config
Date: Tue, 21 Feb 2023 15:44:43 -0500
Message-Id: <20230221204445.23931-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177547

Allow the user to specify a QB_MEM value of their choosing, otherwise set it
to a default value.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 1f7b96a9fcf4..aa1e87763d57 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -11,7 +11,7 @@ IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegro
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
-QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+QB_MEM ?= '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
 
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
 IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
-- 
2.36.0.rc2.17.g4027e30c53



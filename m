Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD061CD3420
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.27422.1694943562795289892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXwFWumS;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so467882a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943561; x=1695548361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7wCpk5C/D8bA6+ZIIF003clqGH1n2y011vy8JUMoQw=;
        b=MXwFWumS5zfkH+TmNUe6q0BVps4Nl2CyXmaJhPSh83Q6b9T2OqSYZBsIJcUPmRufDo
         ZW2v0VgUfmojtjpDnzD1K6FhXA3xe+gKGwjZKW+U/o2qybNaY3Sc5cfHFs46Wx0Hr908
         TiOWYIi7q7Gtr6vs4Z4PJDIjpE/vBQB0beXvADuugcITieoTX8zSz6yY2cELw6fahWNd
         pAcO2U7AI3GlUlzHbqDiJOGbgLXwDt+5WAgX+qq+Kh9TUYpYsgK0JofVn90NXqpVQLog
         GPanjLV40pbLd08rHSkRmXVUwF254WumPtlfR3bCZm3dTYcDwob0Dlj6NZrfsr4Tznzp
         tkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943561; x=1695548361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7wCpk5C/D8bA6+ZIIF003clqGH1n2y011vy8JUMoQw=;
        b=crmEwS2pVg2PNyT/WKpK4mbr/nJxgmY0/KW7uqzDLxnwNTjpkHS4csZia7tsq6c/IH
         mmcGFIMqM1sc7R18m26/UA385eLlwxcs7o5mh/d7bdKDeRX5+JAgn5SnkiTlGR9cqA/g
         sfvjSGAUpvxF5f6sLAFn1sTAuTN8Ng2iveEvaytzI/fhKT0hVNVjrNDqSZCcm8vh5gFq
         l0HEKGX7vnEj085rn57yibXPvOKIoogCxF9tRub8GM+CduhjLQ4KlRsVhxBLAUrRjq1I
         eeyn00MksVcDcbDuDc2ibQS2OBMBJpHYMvF6AirY7SaVirXihCtbLXgIbv7Zt5S2siYe
         kpUw==
X-Gm-Message-State: AOJu0YwW7lm4dNTnonDQ2oRskQLJktNLmLc2cO34S1RpyNNt1Z1E3iqJ
	Y1zch8VQ+PdCvUu9Z17V/sE1O8Qxltk=
X-Google-Smtp-Source: AGHT+IH2R6mMGW7w4ljaKVxF9FEwf797ONkzuie9ivjaX3I643245ARMSakjWPPeTjj+hw/Nv0AH5w==
X-Received: by 2002:a17:906:530e:b0:9a9:e326:d0c2 with SMTP id h14-20020a170906530e00b009a9e326d0c2mr9155851ejo.4.1694943561252;
        Sun, 17 Sep 2023 02:39:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/29] piglit: update to latest revision
Date: Sun, 17 Sep 2023 11:39:00 +0200
Message-Id: <20230917093901.428214-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187801

Drop patch as issue finally fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-bash-completions-in-the-right-place.patch | 35 -------------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
deleted file mode 100644
index e07e810a733..00000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 26faa2c157a27a18a9f767976730fe0c115e3af4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 13 Jul 2016 19:19:02 +0300
-Subject: [PATCH] cmake: install bash-completions in the right place
-
-The completionsdir variable is a full path and should not be
-prefixed.
-
-This does mean the files may be installed outside of
-CMAKE_INSTALL_PREFIX -- the alternative is more difficult and
-means that bash completion files may be installed where
-bash-completion can't find them.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [mailing list]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e2abba..784a8f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -532,7 +532,7 @@ install (
- if (BASH_COMPLETION_FOUND)
- 	install(
- 		FILES completions/bash/piglit
--		DESTINATION ${CMAKE_INSTALL_PREFIX}/${BASH_COMPLETION_COMPLETIONSDIR}/
-+		DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}/
- 	)
- endif (BASH_COMPLETION_FOUND)
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 62cada75906..69294c6c946 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -7,14 +7,13 @@ LICENSE = "MIT & LGPL-2.0-or-later & GPL-3.0-only & GPL-2.0-or-later & BSD-3-Cla
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
-           file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
+SRCREV = "71c21b1157c4f9a96453bdfcb9f4dda091360afd"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.30.2



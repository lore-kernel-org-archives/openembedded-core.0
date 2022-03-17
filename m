Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B692C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9309.1647518254181002017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DIZQwOSw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id r7so2970631wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ag3/aaKCfKY8F5pVsp6Ejld5LzW2c0QuNuKcVe2qmp4=;
        b=DIZQwOSwkgyjUZUhnCY+5SISlFRoYSOIB4BYxyRAX7a1rm6fgbdB1U7THPXupgBk3V
         sJ0KSWvLTRSo/jn8cHam5QYDXF3ImQqVpTG37zvVTIZFDQVwOBJugy8p0Fvgpiyueizp
         2VuYeVByLs9KNHAYfESJfAfXARsPdlTOWZSog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ag3/aaKCfKY8F5pVsp6Ejld5LzW2c0QuNuKcVe2qmp4=;
        b=K0qXQYW9h6EEH82KutKySiNIlzW5sIZP4a+kTpNELpcvCvinG6XXK02KT+wDgNK0Sr
         Ts5vSSVzjjfzNOo68nLEma118c9HvuadsQleKl5Csrai8sh/kp2D5XdFMQTPoDQ+hB88
         hl6yCGC1i+tMk/oeql1rGM234pLdogTkCgGYMjs0FuOm39Nnqk0FL2bb0K7ZtbIaeGuD
         eYr/R81lGJdsHn4PIoLFMgHzUOY7dG25x20r8EhhDsNaQwYfu4jWFVu0clSoAeCuOnU5
         bJMc+8UkqqkJdf1GioAzBpSX5ZGNUrv4rJrfW9zKqyVr0w9Lxbouarr31UZ7uVfPpgni
         eMIA==
X-Gm-Message-State: AOAM531lMBlQ8fI2wRnBgaHIUs2bCDj7l12ksiirEwSHasg5Mc0vI2Tj
	olmpSmE9BkQElEizOxHbYVAR+6PxqM2zryiQ
X-Google-Smtp-Source: 
 ABdhPJyfM4vBQbJvyiI/VofgaS2ZehYDI5Ia8d9y2jNO6eFhj4bDKbKghBnyJvjKvQmQnIMz2zZ8OA==
X-Received: by 2002:a7b:c1cb:0:b0:384:177d:871c with SMTP id
 a11-20020a7bc1cb000000b00384177d871cmr3633608wmj.84.1647518252429;
        Thu, 17 Mar 2022 04:57:32 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/26] Add buildtools-docs-tarball recipe
Date: Thu, 17 Mar 2022 11:56:59 +0000
Message-Id: <20220317115700.993924-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163411

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../recipes-core/meta/buildtools-docs-tarball.bb | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-docs-tarball.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4a5a74aa49f..2c5e7308275 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -83,6 +83,7 @@ RECIPE_MAINTAINER:pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfound
 RECIPE_MAINTAINER:pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-buildtools-docs-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER:pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
new file mode 100644
index 00000000000..72a256cf04a
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -0,0 +1,16 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+DESCRIPTION = "SDK type target for building a standalone tarball containing the tools needed to build the project docs."
+SUMMARY = "SDK type target for building a standalone tarball containing the tools needed to build the project docs."
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK += "\
+    nativesdk-python3-sphinx \
+    nativesdk-python3-sphinx-rtd-theme \
+    nativesdk-python3-pyyaml \
+    "
+
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Docs Build tools tarball"
\ No newline at end of file
-- 
2.32.0



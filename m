Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D77C3527E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1774.1649872702054359860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E1mciQ9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i20so3701955wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BvEV5yqXwqA1qLv/Zyoc6+S5yyQuA4/Hd5ww6987tqA=;
        b=E1mciQ9NxNGfUkqQd/oxpGu1nVc6RjXnFYci0ESODAOOImgMNtR0ECmxP73pXWJ2BK
         hbRIPDDv118X6F3ZdL6Ea1BIn1RCchYDhkS9uj2ijUM7YXDP7dLXgLxtg/aZ5ARFlG9V
         3g4MxQUs+sUrncSpTxEFJ89iprTkjZ/mAIBqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BvEV5yqXwqA1qLv/Zyoc6+S5yyQuA4/Hd5ww6987tqA=;
        b=oqLD86H898uh7tl3jInf5oPF/lvf7QqVorF4Cym8tF+wuKvfEFrSZdWVnBphT+SOi7
         48ztxRZK2IexrrGrt3Lx/Bagm5tpe2QqN32FbnMs2mnh664uybpf2XuxD4W/swtDkU+J
         390pmo9hebOHmZlp36XpBwSUzNQciA2jFiUYxwF3Kh5pnHRF5ooBqMva2dVuydPbnhUf
         V7Fk95OiF3ZXwJxgFwKuxHDa3dkrcNAB+eEKDvrleo0A7+eZNe9wLcIi1bVoYtWbd02d
         h+LH6CJuCrPBAPjo37FTUixJk/k7YKf51g4LScnbo0oVqfS0xEK2a2wzgE9JW3iSKfMl
         dreA==
X-Gm-Message-State: AOAM530pNFjTUVlKYD+0rNWnBnrcLn/RVxix1GMW77La5PhBWapAW5w+
	OG2DVHfCoW8283N8CaSbWkWMyk+4u5lKHg==
X-Google-Smtp-Source: 
 ABdhPJyAhQQy/QpxeCKRXJGzg18pUQZedBEdbFEwOWADR5qj261PmHtQL9FORm6w/PE3IokIfDWUQw==
X-Received: by 2002:adf:c3cb:0:b0:207:9b86:ecc5 with SMTP id
 d11-20020adfc3cb000000b002079b86ecc5mr34596wrg.661.1649872700326;
        Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm14770056wrr.67.2022.04.13.10.58.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:58:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildtools: Add standalone make tarball
Date: Wed, 13 Apr 2022 18:58:17 +0100
Message-Id: <20220413175817.2187595-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220413175817.2187595-1-richard.purdie@linuxfoundation.org>
References: <20220413175817.2187595-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164354

Some versions of make have bugs. Add a way to provide a make tarball
that can be used on it's own in these cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../recipes-core/meta/buildtools-make-tarball.bb | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-make-tarball.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2c5e7308275..09a75933e26 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -84,6 +84,7 @@ RECIPE_MAINTAINER:pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.o
 RECIPE_MAINTAINER:pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-docs-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-buildtools-make-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER:pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
diff --git a/meta/recipes-core/meta/buildtools-make-tarball.bb b/meta/recipes-core/meta/buildtools-make-tarball.bb
new file mode 100644
index 00000000000..e278f682719
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-make-tarball.bb
@@ -0,0 +1,16 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
+               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
+               usual version requirements and have ancient compilers."
+SUMMARY = "Standalone tarball for running builds on systems with inadequate software and ancient compilers"
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK = "\
+    nativesdk-sdk-provides-dummy \
+    nativesdk-make \
+    "
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-make-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Make build tool"
-- 
2.32.0



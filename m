Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EFFC83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10488.1693064353126962058
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kaWpIPZa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68c0cb00fb3so1211365b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064352; x=1693669152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INM4t0YwcuCgUoopDcvgt40N4A3mUd/5gx6h1nMlUHY=;
        b=kaWpIPZaKG/dsEPCuedGEvLg5lG56wy9n55MNSorSW7gn6KJaLZz4x/w5+lWRbVo6L
         cZhszJqm0OADk0A5UnzNxb3cthVLGlNXBzgKDYL5nOD4eZUY3AN972iAAy3q5+rVV/hv
         RSecsBYqhftNHmtwHC8u9/SBzofKPHluVRX4eEfspgeBhOzZLQvzmCdGYaRrO5lVBZ2x
         TtqU0LX3VY2jbMZiRvLYxJuFt5ytjnKddTtdt6D9BMYAs/Xrfw0xmOLksU3DP6He7Jbx
         mvmC6LIeXKL2BfwsC8AxgiW36ggbC7aqiS2vgE6aNkNhqyujMWIKyya8NsXVI6eZ0uZk
         qEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064352; x=1693669152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INM4t0YwcuCgUoopDcvgt40N4A3mUd/5gx6h1nMlUHY=;
        b=eLDMAPj+dnvJu2Wtv6eR99Ikx3DZbdzYMLLyweNz8DJVKN2x6qjQW4uPbw6vZR9gwl
         4igX19Q2kO0rwXDmiDrY0SRMmXEd/Pm5PN8VqdVqH/RSUz5eDkLQXosLQUnhbWEqi6/X
         6EFr+BcjyCXX+HhtcxDRhrAIWP0UAqxpFWTAK8tgoYHlmEWyrRvCNe6Srnk82mxFnmFN
         HcF7YtJM+ZZevrE/wlF/p264eyLH8dyA8KT57zE9V6SK07ub6W0/ObRFJp0sHCmqTGqT
         ptTBk9YuOAUhNlpTrIf39k1bpc0TQpFjUHUHZZa92lPIehezJZ7xnwdZhr2q6lkDG/04
         AIig==
X-Gm-Message-State: AOJu0Yy7Z2CybjEB6oCCcw099Vm2frfonu1c/Y/a9vwxXzb8KHf7iSfi
	wUw0V9A05Mk1etNrX1FSeT+C29WXq3hI/iNsOTI=
X-Google-Smtp-Source: AGHT+IExyzUGcYRa4IGadZOfE2AF7jOnDH8ksD+llHLBteJQg+2E+bSCD3AuCfzp5T5xKYvz3kfPsA==
X-Received: by 2002:a05:6a00:2d83:b0:68a:366d:5ae3 with SMTP id fb3-20020a056a002d8300b0068a366d5ae3mr22299025pfb.27.1693064352257;
        Sat, 26 Aug 2023 08:39:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/20] python3-git: upgrade 3.1.31 -> 3.1.32
Date: Sat, 26 Aug 2023 05:38:39 -1000
Message-Id: <fd38c8d91f95b44ea7b833772b9a07e1f1d74479.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186752

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.1.31 & 3.1.32 contains the CVE-2023-40267 fix and other bugfixes.

Changelog:
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.32

- Bump cygwin/cygwin-install-action from 3 to 4 by @dependabot in #1572
- Fix up the commit trailers functionality by @itsluketwist in #1576
- Name top-level exceptions as private variables by @Hawk777 in #1590
- fix pypi long description by @eUgEntOptIc44 in #1603
- Don't rely on del by @r-darwish in #1606
- Block insecure non-multi options in clone/clone_from by @Beuc in #1609

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.31.bb b/meta/recipes-devtools/python/python3-git_3.1.32.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.31.bb
rename to meta/recipes-devtools/python/python3-git_3.1.32.bb
index 08b9f66bcb..f217577eb8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.31.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.32.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce3bcf69adfdf7c7d503e78fd3b1c492af782d58893b650adb2ac8912ddd573"
+SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1



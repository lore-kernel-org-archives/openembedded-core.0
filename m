Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD768C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 20:57:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.1947.1646859461334484985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n5U5rKZJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 27so2959257pgk.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0eEXJF1pI5I/nubBvf9oXDBbVLXpfy3ysyVqTkq4YNY=;
        b=n5U5rKZJ+FJigDeuE7Ow5xSXV4CikK0bPLJmtWk1MmcfW6tkB8Ao9IT1HxiF9HBbBr
         DQA5WaV7/cR2ICF0hQikU4O5XZbQK4EkxbdGlwP+KDRt5gzRPybMlr+dC7PlhJEC3iU+
         AFBwQyz+QkbblYIWglJ9qBcHUtbXOur2SLsUAD+gEg852NZn0dddlgKoC/SZnRww4B0A
         shMQ/CzpAq4NLix/EWIOQofqbvnCHpwevm0oDOGDXrDhpAhvUixcdRpKZlPX5FXdkxAj
         2QG2TCdnpRdTir10zUzeyyCctYXq0WdSYc403hWWHNc9sZ4ZXkle3YMKxyIX9OSQPPZ0
         rEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0eEXJF1pI5I/nubBvf9oXDBbVLXpfy3ysyVqTkq4YNY=;
        b=TC+FQZTHnBrhmBA7V+d2p2kJYT3z4Fmk2mZowNnF55LYlHV2KNHy5YK/mnbtEUoXKt
         v4ddsYyrmSEOyEyP4x4KzNJ77alsmqFYgoyWsAb7W0lELyAX/c3SOebZA8ayt3GRWz2S
         Fz2B2zVG/wmnasx5OoG/BqeT1rxiWgAFz5Mizuul4q613PnfeF7uPsfI9hyTjB6a4800
         a/bkfdjNEQ8KzPxAygJWhrWytbWbo/1M83XWpAvTv0CeEDEh64fxiZm2d9NOur02g6sy
         7tXBspqZ5y42Axn/LRQ7iWW6yfGtSWqW0hCBUxq0buCLFwp7sM1/KsGCmvF3ZRKU69Pc
         RdLg==
X-Gm-Message-State: AOAM5315enPTRaolDfT00GmhAWlZ+QIXsqS7fPoOZFsHEtRJAJGrSePc
	sjbbE2+QsevDIfUzMg4yajJCO/B81WQ89Q==
X-Google-Smtp-Source: 
 ABdhPJylRN/18sRqS0fcrZq1j9LApoQd7KFrMnRwJ9j6rVtUNj4of8lAJLECWGCIyuVoYTNuDOXp4w==
X-Received: by 2002:a63:31ce:0:b0:34e:4052:1bce with SMTP id
 x197-20020a6331ce000000b0034e40521bcemr1257884pgx.459.1646859460545;
        Wed, 09 Mar 2022 12:57:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 d20-20020a056a0010d400b004f7093700c4sm4136139pfu.76.2022.03.09.12.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:57:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libtool: Recognise additional linker commandline options
 passed by clang
Date: Wed,  9 Mar 2022 12:57:37 -0800
Message-Id: <20220309205737.3796035-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 20:57:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162991

Like stdlib, these options are also used to select runtime libraries by
clang driver

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...in.in-Parse-additional-clang-options.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 2b5fd8fd942..ad6f5e6b6eb 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch \
            file://libool.m4-add-ARFLAGS-variable.patch \
            file://ARFLAGS-use-cr-instead-of-cru-by-default.patch \
+           file://0001-ltmain.in-Parse-additional-clang-options.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
new file mode 100644
index 00000000000..d59b5a834eb
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
@@ -0,0 +1,37 @@
+From c3b90d6107a1b638477d5f4dcee48af289647af7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 12:52:51 -0800
+Subject: [PATCH] ltmain.in: Parse additional clang options
+
+clang uses -rtlib and --unwindlib to select proper compiler runtime in
+some cases. There fore pass these options to linker when found in
+ldflags
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build-aux/ltmain.in | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index 6a7bb72..c355c0c 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -5423,10 +5423,13 @@ func_mode_link ()
+       # --sysroot=*          for sysroot support
+       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+       # -stdlib=*            select c++ std lib with clang
++      # -rtlib=*             select c runtime lib with clang
++      # --unwindlib=*        select unwinder library with clang
+       # -f*-prefix-map*      needed for lto linking
+       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
+       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
++      -rtlib=*|--unwindlib=*|-f*-prefix-map*)
+         func_quote_for_eval "$arg"
+ 	arg=$func_quote_for_eval_result
+         func_append compile_command " $arg"
+-- 
+2.35.1
+
-- 
2.35.1



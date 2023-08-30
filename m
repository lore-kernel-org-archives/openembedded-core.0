Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75121C83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:35:01 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.9419.1693384491241837202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HxgJ2YXo;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1325298a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693384489; x=1693989289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZesvGjIumjHZyya+wi3RPuPcKRSBUmrbnfey6MabO3I=;
        b=HxgJ2YXodtc72QCJDBcagiEBxsuGk6XvC2ttZuD2mHapGWN8d9D82YD8cZq2yOWVxn
         H3k4DpwcipBRFG7SZNGG3Z1DoTSCfmfSgxvKAUtF7XtG6d152Ri2CVQT+/hMiK4gfdQR
         TCbA3y5I3caBLDtFSEFEuHRtV7wGSqG4hPkm8gLNhWMbJkHrhwaoieyZ0XDfA+InTUKd
         +9ebTL9VwRn6P50ubXXQB2qAJ4afdw6prUG/kxBmqXS24G+jUC4cI0x6kWQ0MBRevopI
         zrbkQNjtBf1NR7VBJwx1E2KXdj7rW4APNf5Yu5QsIJjIZccIkMw9Ld2hw3G2bBbI2WhT
         nAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693384489; x=1693989289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZesvGjIumjHZyya+wi3RPuPcKRSBUmrbnfey6MabO3I=;
        b=Sp7Eva5Y1sHI7YspngCSVEN0FSC4zp8q9QxptWuNTR+KbnKz0mq+NCJGI9NUZqfCIt
         c1+EnJvS/RK7Dmix7EjLgmbRFDzlJYRocI6tpRhcaJT9lvSQo0MnLwaexi3/2XnKFgt6
         mB2kC3sbQ/fpABcarLxtyu94uxL6jpxGlZevy5vlX01Z8oqDCNLwvAgLzwxxZ8CyizyV
         0aVRYjTEK4/xwTPS0KUbDrxhqPyNsMD87pwnmDPhRBGvjIvD55YVn8LuJb57yzFfe8j5
         6tJ3SP4o7OZ/kJgZhosxgJv0LXSNsHc6JFwXbx+5zvy2u9BjoFz6q0fvQThbn4NTz3ul
         zzHw==
X-Gm-Message-State: AOJu0Yw1z5rY+AFjSozzbJ85hYyc5muS36Dc7RpKAbCg8grucKmD0u74
	Y0E/xd1bo4PnoeOtN7LS3MdPr4i1a7I=
X-Google-Smtp-Source: AGHT+IF+zGJMcLpXK7DZdUDt9Bc9zSkVz9aQ8W6M1efI+RaMLm6x+FCq3IzjoHZ2MK6guRR0ZBGePQ==
X-Received: by 2002:a17:906:10ce:b0:9a1:e07c:1ae9 with SMTP id v14-20020a17090610ce00b009a1e07c1ae9mr979864ejv.57.1693384489252;
        Wed, 30 Aug 2023 01:34:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906044800b009a57d30df89sm6595140eja.132.2023.08.30.01.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 01:34:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH] libdnf: backport a fix to build with gcc-13
Date: Wed, 30 Aug 2023 10:34:30 +0200
Message-ID: <20230830083430.871652-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186873

* needed to build libdnf-native on hosts with gcc-13

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ite3-Sqlite3.hpp-add-missing-cstdint.patch | 33 +++++++++++++++++++
 ...onNumber.hpp-add-missing-cstdint-inc.patch | 30 +++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  2 ++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
new file mode 100644
index 0000000000..8bd63ebaae
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
@@ -0,0 +1,33 @@
+From 4413d3f62f0abba02ba73de92025da50e37efad0 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 27 May 2022 22:12:07 +0100
+Subject: [PATCH] libdnf/utils/sqlite3/Sqlite3.hpp: add missing <cstdint>
+ include
+
+Without the change libdnf build fails on this week's gcc-13 snapshot as:
+
+    In file included from /build/libdnf/libdnf/sack/../transaction/Swdb.hpp:38,
+                     from /build/libdnf/libdnf/sack/query.hpp:32,
+                     from /build/libdnf/libdnf/dnf-sack-private.hpp:31,
+                     from /build/libdnf/libdnf/hy-iutil.cpp:60:
+    /build/libdnf/libdnf/sack/../transaction/../utils/sqlite3/Sqlite3.hpp:100:33: error: 'std::int64_t' has not been declared
+      100 |         void bind(int pos, std::int64_t val)
+          |                                 ^~~~~~~
+
+Upstream-Status: Backport [v0.68.0 https://github.com/rpm-software-management/libdnf/commit/24b5d7f154cac9e322dd3459f6d0a5016abbbb57]
+---
+ libdnf/utils/sqlite3/Sqlite3.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdnf/utils/sqlite3/Sqlite3.hpp b/libdnf/utils/sqlite3/Sqlite3.hpp
+index 3a7da23c..0403bb33 100644
+--- a/libdnf/utils/sqlite3/Sqlite3.hpp
++++ b/libdnf/utils/sqlite3/Sqlite3.hpp
+@@ -27,6 +27,7 @@
+ 
+ #include <sqlite3.h>
+ 
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <stdexcept>
diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch b/meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
new file mode 100644
index 0000000000..b2bd6877b5
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
@@ -0,0 +1,30 @@
+From 12582624bb5e25b84124dcd3b35b358ad56ba2ec Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 27 May 2022 22:13:48 +0100
+Subject: [PATCH] libdnf/conf/OptionNumber.hpp: add missing <cstdint> include
+
+Without the change libdnf build fails on this week's gcc-13 snapshot as:
+
+    In file included from /build/libdnf/libdnf/conf/ConfigMain.hpp:29,
+                     from /build/libdnf/libdnf/conf/ConfigMain.cpp:21:
+    /build/libdnf/libdnf/conf/OptionNumber.hpp:94:41: error: 'int32_t' is not a member of 'std'; did you mean 'int32_t'?
+       94 | extern template class OptionNumber<std::int32_t>;
+          |                                         ^~~~~~~
+
+Upstream-Status: Backport [v0.68.0 https://github.com/rpm-software-management/libdnf/commit/f8af6399c4f6a65a35d33ecc191bb14094dc9e18]
+---
+ libdnf/conf/OptionNumber.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdnf/conf/OptionNumber.hpp b/libdnf/conf/OptionNumber.hpp
+index f7a7b3d6e..a3a4dea67 100644
+--- a/libdnf/conf/OptionNumber.hpp
++++ b/libdnf/conf/OptionNumber.hpp
+@@ -25,6 +25,7 @@
+ 
+ #include "Option.hpp"
+ 
++#include <cstdint>
+ #include <functional>
+ 
+ namespace libdnf {
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
index 2558f96851..9154414212 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
+           file://0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch \
+           file://0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch \
            "
 
 SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
-- 
2.42.0



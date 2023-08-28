Return-Path: <abe.kohandel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7306CC83F10
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 03:23:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.6367.1693192986959509793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 20:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mFl2iMnR;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: abe.kohandel@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1735178a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693192986; x=1693797786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8+p/CvR1bE+KelyQjN9MAwfUFbbrFDIyQ9fFMakpYU=;
        b=mFl2iMnRio1c+B3gdptHhcvnV6CG7rDosUYpWHWcTRchUgz+6N/IHE5KpaoRBq6h4U
         6guyn8z1SRhxFOFEyc+Js7R5rYavtuYw2jrk59/SF4aTnXZUfwY/ggDFpZX5kkmG+vsW
         k8dYQcfdWeFV4aUCHsTy8GB3X5cTaeWl7IDTkXgCLPKE+89cNDfwpxW6DA1v2WvaYJW9
         IFTjcTqQARHDaPTg/nd3T7h3GWX16NeBvFmyW66/AAH/qGGXGYQ2ZumA7sL5fZJ/uWaN
         9yQm0AxKiFVWGefeeXQ9A5GI8EXWPeSwH6GwEwxNlX7OR0poTw/qGAToeeuONxJgezSz
         KQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693192986; x=1693797786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8+p/CvR1bE+KelyQjN9MAwfUFbbrFDIyQ9fFMakpYU=;
        b=BB+dCRUrWZK1rSijK7HFTUOChOZknDT22Zh1CB9INPJq7RovVDDr7gEpaxH37UzpPS
         lW6+QpTKBRgc7vmIo/KivPfsLGRlehunr6Eve64mrJuF4IRLRtJlJlrUUh8RN8mCJeOf
         TwmJ+WURJljzOyMgWgWKjBjmlq4x34b34fSK5Y8xq87FUbB9YIGf3KR6jkSwcp8S3hry
         Y+LaPskobu/iqhSxWyK1dEuLE5+Sd1LyBcH5TcBV6cQz9F3uMpHsaZyxhMFln4g5ipPw
         oKqbzL57JvebdYFk6bgWf5uMvWMVKdGGr788Z2yItA/LgCox6TNEV2FuuzPdbrTLbPzf
         StAQ==
X-Gm-Message-State: AOJu0YwiN/4vw1Thya36PpIvNN2WLIWlDhfx4j3JncD7jk8TMnyguysk
	zIbK3nFQIyFbUH55gNvkINgBlWUQgbSYzw==
X-Google-Smtp-Source: AGHT+IEXchhavwCgieU0rwRB/bGwn1J5ZL3b+JU/KHutCyN0o43l+7qwf5MQkGIFvCoiRu18bpuoVg==
X-Received: by 2002:a05:6a20:7287:b0:149:2fd0:a4ac with SMTP id o7-20020a056a20728700b001492fd0a4acmr22692621pzk.42.1693192985998;
        Sun, 27 Aug 2023 20:23:05 -0700 (PDT)
Received: from localhost.localdomain (216-71-201-106.dyn.novuscom.net. [216.71.201.106])
        by smtp.gmail.com with ESMTPSA id y7-20020a636407000000b0056c5454105csm6106855pgb.93.2023.08.27.20.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 20:23:05 -0700 (PDT)
From: Abe Kohandel <abe.kohandel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abe Kohandel <abe.kohandel@gmail.com>
Subject: [kirkstone][PATCH v3] libdnf: resolve cstdint inclusion for newer gcc versions
Date: Sun, 27 Aug 2023 20:21:15 -0700
Message-ID: <20230828032114.2432518-2-abe.kohandel@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 03:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186812

Depending on the host gcc version, libdnf fails to compile due to
missing cstdint inclusions. These issue have already been addressed
upstream, add the patches to resolve this for older versions of the
library.

These commits are taken directly from the libdnf project at
https://github.com/rpm-software-management/libdnf

Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
---
v3: add 2 more patches from upstream that were missed as I incorrectly
tested this by building libdnf instead of libdnf-native
v2: change Upstream status to Backport as upstream pull is already
merged
 ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
 ...onNumber.hpp-add-missing-cstdint-inc.patch | 33 +++++++++++
 ...ite3-Sqlite3.hpp-add-missing-cstdint.patch | 36 ++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  3 +
 4 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
new file mode 100644
index 0000000000..788bdd1020
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
@@ -0,0 +1,56 @@
+From 779ea105564b6d717300af2fcb02a399737a536f Mon Sep 17 00:00:00 2001
+From: ctxnop <ctxnop@gmail.com>
+Date: Mon, 15 May 2023 19:30:16 +0200
+Subject: [PATCH] Fix #1558: Don't assume inclusion of cstdint
+
+With last versions of gcc, some headers don't include cstdint anymore,
+but some sources assume that it is.
+
+Upstream-Status: Backport
+Signed-off-by: ctxnop <ctxnop@gmail.com>
+---
+ libdnf/conf/ConfigMain.hpp    | 1 +
+ libdnf/conf/ConfigRepo.hpp    | 1 +
+ libdnf/conf/OptionSeconds.hpp | 2 ++
+ 3 files changed, 4 insertions(+)
+
+diff --git a/libdnf/conf/ConfigMain.hpp b/libdnf/conf/ConfigMain.hpp
+index 19395c71..59f65c48 100644
+--- a/libdnf/conf/ConfigMain.hpp
++++ b/libdnf/conf/ConfigMain.hpp
+@@ -32,6 +32,7 @@
+ #include "OptionString.hpp"
+ #include "OptionStringList.hpp"
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ namespace libdnf {
+diff --git a/libdnf/conf/ConfigRepo.hpp b/libdnf/conf/ConfigRepo.hpp
+index 2b198441..84cafbad 100644
+--- a/libdnf/conf/ConfigRepo.hpp
++++ b/libdnf/conf/ConfigRepo.hpp
+@@ -26,6 +26,7 @@
+ #include "ConfigMain.hpp"
+ #include "OptionChild.hpp"
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ namespace libdnf {
+diff --git a/libdnf/conf/OptionSeconds.hpp b/libdnf/conf/OptionSeconds.hpp
+index dc714b23..a80a973f 100644
+--- a/libdnf/conf/OptionSeconds.hpp
++++ b/libdnf/conf/OptionSeconds.hpp
+@@ -25,6 +25,8 @@
+ 
+ #include "OptionNumber.hpp"
+ 
++#include <cstdint>
++
+ namespace libdnf {
+ 
+ /**
+-- 
+2.42.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
new file mode 100644
index 0000000000..b5424b28ea
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
@@ -0,0 +1,33 @@
+From f8af6399c4f6a65a35d33ecc191bb14094dc9e18 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+---
+ libdnf/conf/OptionNumber.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdnf/conf/OptionNumber.hpp b/libdnf/conf/OptionNumber.hpp
+index f7a7b3d6..a3a4dea6 100644
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
+-- 
+2.42.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
new file mode 100644
index 0000000000..a75995b82e
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
@@ -0,0 +1,36 @@
+From 24b5d7f154cac9e322dd3459f6d0a5016abbbb57 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
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
+-- 
+2.42.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
index 2558f96851..bd06937ed8 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
+           file://0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch \
+           file://0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch \
+           file://0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch \
            "
 
 SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
-- 
2.42.0



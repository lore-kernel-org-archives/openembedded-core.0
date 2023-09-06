Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847DFEB8FC7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:49:02 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.7699.1694004534579815383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wKK3szCm;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.53, mailfrom: steve@sakoman.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7927611c54bso141208239f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004533; x=1694609333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBtbyc6cKHRRtrfC7N8i/gwnFlEUU4cLIAtBckbW/vg=;
        b=wKK3szCmT4Wlw3NqAvMS4m+K+o+cOjTS5SfyhcMGHAHasrNhN23PoR+cTgVFD7ALLA
         dX2jNmepgezMlYhTN1ewATQNLimHwuggLZ3H/IkRoTkozrI69jTnPMDJ+YV4jMnJzrMb
         d7iO4MyZIPzDWyUcCinO49EKrTG3bd7E68Wv3Urs79wn5+NkCBp2QRfO77QbEe6e8H9u
         L5YstI47Cv8dJeg4S26AqVEnCsiVNxdMsOpcNoGxzGhlW3z044pETq0DO9auYPsIO/KT
         ZbFx31FuA5zvJclJxP8aat1RZXa9kQr2lw9dAt6dYEoFmvRb+uTCrv6gdoyJ8qnsNfrf
         46lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004533; x=1694609333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBtbyc6cKHRRtrfC7N8i/gwnFlEUU4cLIAtBckbW/vg=;
        b=hS4o3Sc/ohTmCw2szwDdMF3VdF0EFd46pQgnPRDSqjSVfGfI/OlXmvldSrCFVSPnPA
         j0uexQ7taYSD15cKl1SaNRTslHIwmHNudkWHyR8PS32lFUJdJyUIV8W2cpndfDKAlWLi
         BqqA7Szc4icgHHEnqKg8rg5oh240AkiPfCsiCRz2Kom4GvHuBLEQHRVqhj0zL8V6Zn0I
         QifCc82ZnkByHwvoDD+8v1O/6CyUEpt3E7H0FdULpg7waJC/S/SKt7PEocB11OQ6vyXz
         rodha9RSZWnDD4ckzOjdyLhXWwx+YbiPcXnfRQhs+pMlo8N/u6DFNs+dGv5piyvJ4hnf
         nMkQ==
X-Gm-Message-State: AOJu0YxiMo1Da7jfGNT2s7K1MmmzI58C9mzCPh8GWBfby/aenbPvHNmV
	PSrtv/kiOBSI59IEmjUzEPDCy29tCBc/bror65k=
X-Google-Smtp-Source: AGHT+IHFpN2F4dbFE5Sst4E3DoyPFf5m1+h/w0cKZgIuhsnAY6+hoJQAbQKDb/Y3VN3bQPUc0CWVtg==
X-Received: by 2002:a05:6e02:1b0a:b0:34b:af03:e2a with SMTP id i10-20020a056e021b0a00b0034baf030e2amr18649849ilv.31.1694004533425;
        Wed, 06 Sep 2023 05:48:53 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/14] libdnf: resolve cstdint inclusion for newer gcc versions
Date: Wed,  6 Sep 2023 02:48:20 -1000
Message-Id: <e1d9bc1f88bd989bafc20063938d7a70e1da104f.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187309

From: Abe Kohandel <abe.kohandel@gmail.com>

Depending on the host gcc version, libdnf fails to compile due to
missing cstdint inclusions. These issue have already been addressed
upstream, add the patches to resolve this for older versions of the
library.

These commits are taken directly from the libdnf project at
https://github.com/rpm-software-management/libdnf

Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
index 0000000000..277fd9fbf6
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
+Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/779ea105564b6d717300af2fcb02a399737a536f]
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
index 0000000000..abb9504e6e
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
+Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/f8af6399c4f6a65a35d33ecc191bb14094dc9e18]
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
index 0000000000..adde48ee46
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
+Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/24b5d7f154cac9e322dd3459f6d0a5016abbbb57]
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
2.34.1



Return-Path: <abe.kohandel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34BBC83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 22:12:54 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1601.1693174368326346420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 15:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZGLsy3DI;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: abe.kohandel@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-26d4e1ba2dbso1286192a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 15:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693174367; x=1693779167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRo5EMDapRtE/u3L24nrSCuGNKCQcMRqzDHBNLZA3DM=;
        b=ZGLsy3DI9FJxwvB1Snh4q2+gSzjalwvaKYt8HvB6E9a1IppUF67qlw8LhMZiINI9mv
         TAy/OQobuw9rYEqEw7I/X3RLgdbLywtNvJuwRj4BzesgrHl7Mlee3NbvpQ/lXSnq3+yV
         /WePlKxyHRnEnvR82Eabv83NjnVF/1fQCBOCi+VzpFguNhtSkvEFO/MJaWWZVI0bfIU5
         4+wqTRCB0v/0nKjlA8XGXKddpbguU6czkhk26D8IWWRfZwxZ/I1qyZKT7x8QujRrNRF7
         MSPbL5dBfgsE59OBlGXi+vJDsba0Oa3mohOkCN7sd3kW795UJhqZta3DVLSW/p9lbrYw
         nmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693174367; x=1693779167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRo5EMDapRtE/u3L24nrSCuGNKCQcMRqzDHBNLZA3DM=;
        b=B0gbA8KSfIci/8wdRrpfVYWiI4b2bRA//mCye/xGz5u6Qgu/ktuTt5S2j3Am18I9Ij
         /rAjIuwgcAlrnS5MhyXYocS2pfT8hweiYS6Ac/RvaRBj3uqspugwGiKbP9ItDDRFDWSZ
         H+phuHQMSBWwC8Z1dW9g1sKWguV1dD+NXEww/uspqrP5z3bxglmUAeSKnSjmpjyUtDXK
         r2WQD5SGdEbCcB7vimJXeJtDy9WfXuGATQqoKhE2JtUZuDfVJH7OcnYflfQs52O3s3yP
         Ngm3zMBeINgYnO0l7U5+MNYpzHzXsNTgPIVyYkFEv830EwryYbL/bwSYdjy1KDLy+bTs
         8RYQ==
X-Gm-Message-State: AOJu0YwDmTEUW4ZNzsq9mcgLHb2aRYZRJNmW3R4bQ99okvNXME3A4JQI
	9+XLE9jccciaL/cYUhA4b4m+PCqle1Hksw==
X-Google-Smtp-Source: AGHT+IGFaQgL+zUlWolY0biBHVgbPHAwZP/pKeCLvMz/AVn/sjHMXPi64j2pZoCXybEaV5YOxKyJRg==
X-Received: by 2002:a17:90a:ba81:b0:26b:6a2f:7d96 with SMTP id t1-20020a17090aba8100b0026b6a2f7d96mr17109047pjr.18.1693174367578;
        Sun, 27 Aug 2023 15:12:47 -0700 (PDT)
Received: from localhost.localdomain (216-71-201-106.dyn.novuscom.net. [216.71.201.106])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a005600b00268b9862343sm7911760pjb.24.2023.08.27.15.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 15:12:47 -0700 (PDT)
From: Abe Kohandel <abe.kohandel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abe Kohandel <abe.kohandel@gmail.com>
Subject: [kirkstone][PATCH] libdnf: resolve cstdint inclusion for newer gcc versions
Date: Sun, 27 Aug 2023 15:10:21 -0700
Message-ID: <20230827221021.1349269-1-abe.kohandel@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 22:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186808

Depending on the host gcc version, libdnf fails to compile due to
missing cstdint inclusion. The issue has already been addressed
upstream, add the patch to resolve this for older versions of the
library.

This commit is taken directly from the libdnf project at
https://github.com/rpm-software-management/libdnf

Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
---
 ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
new file mode 100644
index 0000000000..51fa141f79
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
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1602]
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
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
index 2558f96851..9ed4108777 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
+           file://0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch \
            "
 
 SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
-- 
2.42.0



Return-Path: <abe.kohandel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FAC83F10
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 00:19:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.3738.1693181975927498788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 17:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I5rO1/kl;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: abe.kohandel@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf078d5f33so21059705ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 17:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693181975; x=1693786775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMM5YTemMbiS7UogrK5HgLQvAHq/s8Vu3Tkuv9BFfa4=;
        b=I5rO1/klb5YZGznJ8PRJ9N+vnp/1Ccj9lb0UAEIbAxhw0DEs4zfvS1YOyqVrQcBF8h
         nQcG0KHNfedAMJf9K5eIZbmyq+oigFWrSVeGCJcpskPs41PpoW5TEIq4Cj784Fufm9KX
         FNraXaF+v1voWKJyya6f0Xg4VgTEWRIBRWSIN9nN/xSAjP+mlRWt6EKlWXYCE6I2kcPC
         veF4bbUNiyULIqaooB5QRybFrfJMs3eNlgKD1RLW1YYxlZqr5cVXbX6Cx6t+GaLmZHEv
         /WfbTJnq15RZQOJ43O5qwGew0XnfvPDNSSZubskTcberWG9CsQgSt7qJyNuUiU2Ernxm
         TX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693181975; x=1693786775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMM5YTemMbiS7UogrK5HgLQvAHq/s8Vu3Tkuv9BFfa4=;
        b=VI3ACEKtzyhgGJO8RVhdfk1SFJj94caIzt0YTx/k9XqJzXyC+VuA65q4ueU/Uf8+yI
         le952cVWJVjGe3S8G5u8TcG0tAmcCDtlD1KcQgE4BFNUz7BsZViXW47OcZsb8yEftlk0
         R+E53dPF9F5CNb+4M1OTgO9P54inOGh2Jhlcqi27rtaH1tDKcfRu1qoy5b5n/qaX3ymz
         Erb9tA53uhmVBy9CA8EoregKa8Ry851roFe6/w39sH7WHgCs2rn/47AbGg8bxRz51yiM
         nyGywu3wcW5OJCnClT4Z97LrLE+bQWGqzLwEV6EkC9zpiJZsP3eAcJI8iG1wxDrt84zF
         Q7+w==
X-Gm-Message-State: AOJu0YwuWypf+fSLlvDgnARj4UxC2oOcSSNJX73ww5qqd+tTNKL44gv4
	Kq5mEMjfj8k2nRVw1Ax3981ModCok/ki4A==
X-Google-Smtp-Source: AGHT+IEqTCes9es9fTvl1SsH6FMZIe6J8sh6of46CnbFsTfb7Tk6Aa4Z7EoiURgwkpKSMDA64kKHPg==
X-Received: by 2002:a17:903:11c4:b0:1bb:9b48:ea94 with SMTP id q4-20020a17090311c400b001bb9b48ea94mr30712298plh.32.1693181975056;
        Sun, 27 Aug 2023 17:19:35 -0700 (PDT)
Received: from localhost.localdomain (216-71-201-106.dyn.novuscom.net. [216.71.201.106])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db0600b001b8b2b95068sm5875029plx.204.2023.08.27.17.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 17:19:34 -0700 (PDT)
From: Abe Kohandel <abe.kohandel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abe Kohandel <abe.kohandel@gmail.com>
Subject: [kirkstone][PATCH v2] libdnf: resolve cstdint inclusion for newer gcc versions
Date: Sun, 27 Aug 2023 17:17:21 -0700
Message-ID: <20230828001720.1960969-2-abe.kohandel@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 00:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186810

Depending on the host gcc version, libdnf fails to compile due to
missing cstdint inclusion. The issue has already been addressed
upstream, add the patch to resolve this for older versions of the
library.

This commit is taken directly from the libdnf project at
https://github.com/rpm-software-management/libdnf

Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
---
v2: change Upstream status to Backport as upstream pull is already
merged

 ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch

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



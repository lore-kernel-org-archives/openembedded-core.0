Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB1EEB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.17389.1687961626693174269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Df/miHhq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-66872d4a141so3489304b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961626; x=1690553626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFhI5ntYXogRZRfl4dWiyQRljHDYXMxezFl3Htd0pxg=;
        b=Df/miHhq601+MttiWsCXM9ZiwHcZgDGoEVQPeuaafZRNkDDJcZBAuqfoEsTUIuTqtX
         DwZdd2K7WtKWGsrJtDhuIn+JVfOZh7FPTDnPz/61eqljldZeeiowQOBN+v8F8dJqc/zi
         pKhQV+Yb6usiUyBz/rH/D8qmh5KJ4+saAbahLwxmuJE9MEI4Wp57rDj/AwMc8bTEyZu5
         MoZ/pyHTIMj0aetaYel5Az+4aAAJKsatmsK0PFhb55jG4LU8uNlEUWrm0/dWCja+quEu
         YJcVcGPHgXKdQbh97f5IWlMLk6jccF5s44X2rsBtvLVPvErwpX5ic6UlTyvkYR23yIPb
         mSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961626; x=1690553626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFhI5ntYXogRZRfl4dWiyQRljHDYXMxezFl3Htd0pxg=;
        b=ClBGLNpWrNu6gl9fLfJDQDkzFUkbcWJASefe1Wo8oId7n5tEijE3QraHxGhXCdaWWb
         oPcJvsoP0Fm2yXg78l9mskY/J+uSMCkrXhecpgDv6/zB8wWJLOClRHovUnV/A/kZt6Ft
         VLVLvZ7WMU2wzXGgwXgGDosrRvjMSqmAvzp4cLdlTWUCcwfRNXvWCNYmcCz/O5Zuu7sf
         v3nJ3LVY/yXcDO1b3ckNZUN8U48dbGUjBRZLPW7hW4CcmmJgwRvNN+gEeWp620ToS/Kx
         mstIbnAANAFwM9hyDt25smOCzkTOGEBcKIwogxSB2LWSPRRR8Wf6Oy46IxlGU0Z7FnLQ
         YmXw==
X-Gm-Message-State: AC+VfDxf4fvJY99mt1CMfgQAYV6uxSJpP3x8Yd7nN8nunsLemRj5sROl
	y2t0TfwV10V/r/naihsLfT2+fS0wvIG5W2W4XWls5Q==
X-Google-Smtp-Source: ACHHUZ7L7VaCVfzbjZhm2iIiqJqmZ0EpexgCxQEGSZaECEMH9/i5HjVcnQk/M30LdSniHwGqFZlaZg==
X-Received: by 2002:a05:6a21:788a:b0:125:dee8:328f with SMTP id bf10-20020a056a21788a00b00125dee8328fmr12375708pzc.20.1687961625751;
        Wed, 28 Jun 2023 07:13:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/29] selftest/license: Exclude from world
Date: Wed, 28 Jun 2023 04:12:51 -1000
Message-Id: <82ac6a3f22c3aec03d3ba162c67754bbf28fd0ba.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183581

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These test recipes shouldn't be built as part of world builds. Some recent
changes are exposing issues from this so exclude them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80d3f5586cd060ae69fbc6dec2e8978d87da10ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-test/license/incompatible-license-alias.bb          | 2 ++
 meta-selftest/recipes-test/license/incompatible-license.bb      | 2 ++
 meta-selftest/recipes-test/license/incompatible-licenses.bb     | 2 ++
 .../recipes-test/license/incompatible-nonspdx-license.bb        | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-selftest/recipes-test/license/incompatible-license-alias.bb b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
index e0b4e13c26..1af99e7809 100644
--- a/meta-selftest/recipes-test/license/incompatible-license-alias.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an alias of an SPDX license"
 DESCRIPTION = "Is licensed with an alias of an SPDX license to be used for testing"
 LICENSE = "GPLv3"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-license.bb b/meta-selftest/recipes-test/license/incompatible-license.bb
index 282f5c2875..6fdc58fd30 100644
--- a/meta-selftest/recipes-test/license/incompatible-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an SPDX license"
 DESCRIPTION = "Is licensed with an SPDX license to be used for testing"
 LICENSE = "GPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index 9709892644..47bd8d7c00 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
 LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 35af0966ef..142d73158e 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
 LICENSE = "FooLicense"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.34.1



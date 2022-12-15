Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA85C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.129133.1671093950845663649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aqvx63HO;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so5906325pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXLBNZIaWN69yWBDM0FHjLYM3eiB+/2hmhh0k/ptxak=;
        b=aqvx63HOChvALozbDMHOtxSV0CxyDETTsulXZhQL1RmEgP5Q3HYNUjvoqyk09o7cy4
         Y7kML5DdQfcG/W0c1Y4AJlUxrTnK/A9+3O81IlPk2ey1vbxoCLSkd4J4ZKztd8knjVYr
         0wE3ekURFQYJ+bnYMHsLkUuGM8RsNqoE5tj3nuSzKDzHTLq1Uci81hcj3LXO/cXl3IKS
         FTGOh7yfVa08smlAXUnsHhGtVs+xDy+TTOSB4ZDKn2DB5pdt5UFH1DzxN0nzzV8Zhkdp
         pmdDoT9ZnTzyz7V/QBM0cCTESwhoujwo4k8QIHQ2CbkXsRlIw+Tz/tDk2dKWT1OnxhTE
         is/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXLBNZIaWN69yWBDM0FHjLYM3eiB+/2hmhh0k/ptxak=;
        b=KAZLaXtHrG/m3S4N8mxHfKHZUgPEVKIKOteodkTOqckHRXbE/57vEfSgOakYtRfAMo
         WjFBmOAdCfOTt/sGH+LPBWADEGDZj0HVylUIHJoKrC1vwahWQa7bYAo9GAOsCfblTFdp
         1gXZpVFJsapA+nqhCmvUHUKMuESIY2hKSy0POPUeX+Ioi6wDrRiUS5d9v7dViekut8I9
         84+pSzI1Mc8pu91+P1wx/kNncw9fN4AXnCjSFr07cbAx8xB/3SxIw76MZ+wi0GNA8eif
         1I6xBfQ+Oygbx2zvxPv4BEQ+m0ag89nmd6KPYRCM3S+orRmQMfnSBGmUDvnK7Nis9NjO
         CARA==
X-Gm-Message-State: ANoB5pn6CEgI9IGrMliuH5nnoHfuhfZjtZmq2nFpNR1FhnERnHFQzjWn
	d+cXRYsSgjnuUKwbkaqEq5H1RpwBeSA=
X-Google-Smtp-Source: AA0mqf6I+k33hYCHArbjNYvJMgG+xhDouGDWYaqbpI/N4A/oKOpjGeXM7w9dfwHuRHHybBN7C+OA/A==
X-Received: by 2002:a17:903:330c:b0:189:d066:81c5 with SMTP id jk12-20020a170903330c00b00189d06681c5mr32982697plb.36.1671093950044;
        Thu, 15 Dec 2022 00:45:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 03/11] unfs3: Define off64_t in terms of off_t on musl
Date: Thu, 15 Dec 2022 00:45:38 -0800
Message-Id: <20221215084546.125368-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174565

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...4_t-to-off_t-on-linux-if-not-defined.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch b/meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch
new file mode 100644
index 0000000000..91909fa236
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch
@@ -0,0 +1,28 @@
+From 949db882e487d728c44bb68139682b38396dd275 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Dec 2022 14:50:10 -0800
+Subject: [PATCH] Alias off64_t to off_t on linux if not defined
+
+Musl C library does not define off64_t and has 64-bit default off_t
+therefore define off64_t as an alias on linux as well when configure
+detects that off64_t is not provided by a linux system
+
+Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/29]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nfs.h b/nfs.h
+index aded011..7996c67 100644
+--- a/nfs.h
++++ b/nfs.h
+@@ -62,7 +62,7 @@ typedef int32_t int32;
+ #endif
+ 
+ #ifndef HAVE_OFF64_T
+-#ifdef __APPLE__
++#if defined(__APPLE__) || defined(__linux__)
+ typedef off_t off64_t;
+ #endif
+ #endif
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 606c103a79..a4701bdb57 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -14,7 +14,8 @@ DEPENDS:append:class-nativesdk = " flex-nativesdk"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch \
-          "
+           file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch \
+           "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.0



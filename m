Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA689C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 19:09:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.1649.1672340962551416072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 11:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDFGOYxQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ge16so16431899pjb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MER1q61bB2aZako9Ujmk8Gvz0yYpm9pLvFkR0g7EE80=;
        b=dDFGOYxQc1fXEu2mxDiKX74YTAAVt31bXhYj0yOQVE/iEAg4pXKMd0S5EJWVjFxZZK
         nCevhoJ6Yd3SxcJyyqlGd1KJCnocvMEIZcEAt1Z+aw7VUKhta8NlsVWQj0bGB3RF6m1A
         9BVOXy6pl61D4HqvCO2zeFfk0UraYg/B7B1vXTpXlzi9i4RAcpaLgcQuo5A3DI6zvZ4c
         kW6lG94whJZx7RIfdYVdlbO6V+xftCFWMEoTTN75HYTVvIu/2yrvP3e65XgZhW5mGhyY
         WwpeJCiYkvReMSgEUEOhKwV8s9Ug4B98ztVD9ZmcYEcFdM83iHJeTJkk/H7TLxd81m7P
         v7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MER1q61bB2aZako9Ujmk8Gvz0yYpm9pLvFkR0g7EE80=;
        b=bDQ0trtqNIURUpkKRNy7GoEZihosvweEp5jTX/CTkuA5vAVwWeMk1I8OVLAC3lOHlB
         R21e6tFGwVyXB7mPfjucchOcTPMD9UsboJPqQYGeommPgQeTR7xBsPSYeYyCTXFUbtZ1
         YZaoWCl8YgiiG0qN51pFABSTgsURQKbXDLeVyOpTbgmbNzqpb6U7u86tmBTlhfip/7FR
         EhDx1XRAAKQ5sW72e1wx4YHzRyUl87ZnwTF1qZNudFeQBNmFceFM+rrFS4XS6zp59fqq
         3u8w92xu56f2fFB6TMJBMCTqhQl4oSrUzIWKNg1p5sxwj/goJzpYkoWRjS68DJy6t3JP
         4VlA==
X-Gm-Message-State: AFqh2kpeCf8OaBKQNtfvdw7N36+aUXSpEIAexyLPzyB5qSr4VIFdUybn
	Rwo9DahKtC79bM9seUa9/iWN139DoKw=
X-Google-Smtp-Source: AMrXdXuqXDPRMBTFVmX56Rl9RYugUH47iYMxik4vcnh7d4vK+n94ZD/PxW9jGFni+7NpSbt060tP+g==
X-Received: by 2002:a17:90a:d811:b0:223:bb51:979d with SMTP id a17-20020a17090ad81100b00223bb51979dmr31216971pjv.2.1672340961617;
        Thu, 29 Dec 2022 11:09:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00225bc0e5f19sm11411356pju.1.2022.12.29.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:09:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cargo: Do not use open64 on musl anymore
Date: Thu, 29 Dec 2022 11:09:18 -0800
Message-Id: <20221229190918.2242791-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 19:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175126

The same rust getrandom patch is needed for cargo on target as well
as it uses the same crate

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/cargo_1.66.0.bb                   | 5 ++++-
 .../rust/{rust => files}/getrandom-open64.patch              | 0
 2 files changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{rust => files}/getrandom-open64.patch (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.0.bb
index 37e0123ee3..f45f8f1e12 100644
--- a/meta/recipes-devtools/rust/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
@@ -14,7 +14,10 @@ LIC_FILES_CHKSUM = " \
 require rust-source.inc
 require rust-snapshot.inc
 
-SRC_URI:append:class-target = " file://crossbeam_atomic.patch;patchdir=${RUSTSRC}"
+SRC_URI:append:class-target = "\
+    file://crossbeam_atomic.patch;patchdir=${RUSTSRC} \
+    file://getrandom-open64.patch;patchdir=${RUSTSRC} \                          
+"
 
 # Used by crossbeam_atomic.patch
 export TARGET_VENDOR
diff --git a/meta/recipes-devtools/rust/rust/getrandom-open64.patch b/meta/recipes-devtools/rust/files/getrandom-open64.patch
similarity index 100%
rename from meta/recipes-devtools/rust/rust/getrandom-open64.patch
rename to meta/recipes-devtools/rust/files/getrandom-open64.patch
-- 
2.39.0



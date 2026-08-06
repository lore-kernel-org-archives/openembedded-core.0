Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A42C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:27:55 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17592.1786015670496470906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=SlJSTCOt;
 spf=pass (domain: snapchat.com, ip: 209.85.128.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso6425065e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 04:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1786015669; x=1786620469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSZvkToRvs5NlvPLewWUYmO8M3haRi0SfkJX8/6r5Gg=;
        b=SlJSTCOt1ziBwGYO9HYvsH5DZnBHUkCRN1/cg7loLRe7gQOU71BcNKfBkQ1H1O5pD+
         beTc/SJt1Pf11AxYknkNzDWoBJuZ13gK1VocuZ4TUd3K9uWTgw2x/A/RofWTjFa5SPOk
         GFejV2Jx0S06Pn3F1nwMLN2RbZ0kDunlgRz9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015669; x=1786620469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSZvkToRvs5NlvPLewWUYmO8M3haRi0SfkJX8/6r5Gg=;
        b=QeCA9+O0+vMtASceWw/YPYtp4u5tlDpU25hlUNDd3v0j+OO4Uwo4O++kz7q71BhQso
         9GF267FrHEbGRc1JymE+G7xkLAsSrZ8Jbq97ansMQBgTA+4WbffnsQpayMBwqlwglw6p
         ox/fhiCKvNvH5dNpWphbssvvwE7OL2E8aThE1pBpUKneSuK0gphThJf4ZRve8iJtPMFQ
         NIQkIMy33PcWh7qBS05XVlkar7SZyPp/8lVkZXtWNBEij6BhNdQaZ8UmfH2b/+C3xt2F
         H2pvWzF9RMZ64q2/yPByVzXz/jMppNaWzku7OQQm97NgZIUr/qyLYy8X8hqzzu4uMhMU
         6tZQ==
X-Gm-Message-State: AOJu0Yxhf4GwZcATgCRSTDd6jEPcYqgDkz9ogqMJuynC+pumdtefCGru
	9o9LjbDzKkK9adt4brP7AyPURgRrtoVPgr2U6ehfmApaEqPHrQraJtxR+OGKeHgiR5oPHZk9Lva
	VHMhmVQs=
X-Gm-Gg: AR+sD12dF2Cwhqwqh4x87guiaJxba6isn3deG/Sb9I+0T7JK61QBdq0n/Q4vuulqD0R
	OuYudA8tiYQHMNjxMMIrXenLIBiQateZ9peckfwV4Isvrg4lqmpmmHp1utjjHXwLyeRFOE11sWE
	CU9IMGkyz7qFElzpbTRYxv8aPorECN3gFwrQsop+tazfcFsvrRVPL8SvwxnO9g/M1QR+VIux4mn
	fPHUiv45XFlrt7Fg1knxZ3oOJa36kD1nI7d33jOZ683mt0Wa85nascrCE8Fy3hQ1ABwUaYeRj+Y
	kfqSbkkptcIr0R7nQGzzpjWqu43fIuqkg7yLduBpTx4gMNiVmOQDX501YG3Oqj7cfb7uZ0ysGP2
	fnFf/Q4DQhRPCapcyw8/5bR1o2Ip0fVum36mWzYa+GFu6/5DZL4qh6OYTWEgK1OHEPLRkj/W65Y
	7lgDPOvgAYEIhx/Dl/mtd2fs93er1xRijst9Y1HFk2jUdtB6n8AY234IHp4qW+eghQM+4w3gUiN
	cVB/+bKtuZe8jiyUn8pLwj418f4HvXD5Q==
X-Received: by 2002:a05:600c:1546:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-499553bcbc8mr38414805e9.2.1786015668598;
        Thu, 06 Aug 2026 04:27:48 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49952da50bfsm27039085e9.1.2026.08.06.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:27:48 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] opkg: fix sha256 support
Date: Thu,  6 Aug 2026 13:27:41 +0200
Message-ID: <20260806112741.778666-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242930

From: Etienne Cordonnier <ecordonnier@snap.com>

A regression caused sha256 support to not work in opkg 0.9.0 and 0.10.0.
Backport this patch from opkg master branch.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ....h.in-add-missing-WITH_SHA256-define.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-add-missing-WITH_SHA256-define.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-add-missing-WITH_SHA256-define.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-add-missing-WITH_SHA256-define.patch
new file mode 100644
index 00000000000..346bf8dfa6d
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-add-missing-WITH_SHA256-define.patch
@@ -0,0 +1,42 @@
+From 7477db1d557516386593261685a16f31b3aaff43 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Wed, 5 Aug 2026 11:15:25 +0200
+Subject: [PATCH] config.h.in: add missing WITH_SHA256 define
+
+WITH_SHA256 was used throughout the codebase (file_util.c,
+opkg_verify.c, release.c, release_parse.c) guarded by "#if
+WITH_SHA256", but config.h.in never generated the macro, so
+sha256sum support was always compiled out regardless of the
+WITH_SHA256 CMake option.
+
+Also add a comment noting that the option order in this file should
+match the option() order in CMakeLists.txt.
+
+AI-Generated: Claude Sonnet 5
+Upstream-Status: Backport [7477db1d557516386593261685a16f31b3aaff43]
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+Signed-off-by: Alex Stewart <alex.stewart@emerson.com>
+---
+ config.h.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/config.h.in b/config.h.in
+index f2d74c5..b45ea23 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -1,3 +1,4 @@
++/* Keep this list in the same order as the option()s in CMakeLists.txt */
+ #cmakedefine01 WITH_LIBOPKG_API
+ #cmakedefine01 WITH_XZ
+ #cmakedefine01 WITH_BZIP2
+@@ -5,6 +6,7 @@
+ #cmakedefine01 WITH_ZSTD
+ #cmakedefine01 WITH_CURL
+ #cmakedefine01 WITH_SSLCURL
++#cmakedefine01 WITH_SHA256
+ #cmakedefine01 WITH_ACL
+ #cmakedefine01 USE_XATTR
+ #cmakedefine01 USE_SOLVER_LIBSOLV
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.10.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
index e3c2dd790dd..0631868a30c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.10.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0002-config.h.in-add-missing-WITH_SHA256-define.patch \
            file://run-ptest \
            "
 
-- 
2.43.0



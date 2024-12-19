Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83164E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 19:14:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.136728.1734635672218316208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 11:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A74KCm58;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7242f559a9fso1476432b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 11:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734635671; x=1735240471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CzNPLfrwaRCpor5ScpN/PNYQLRUHDLblPtHHQXb+334=;
        b=A74KCm58Xn9FxXlvH9LMmk8/nWSWVWXpgs4Xl6dQ4Ji+hXpBsWrZC3Zv3souWqKeNY
         q0ePakUNenpS+fK2qr8CyRA+9b6Yra0a22+dYXxg5CZc5/yEhqrNFf/mp6DT17YaBurh
         hodp9RN9CFNobt0s9kUpOGdrKqHyY1X4VF5F3O8GCz2Z+KG5MRXJSfuaFqADBxVcTAeo
         YwkwkoJBJQoIJW1vMuumXlDdaj6h286IumD7U+2dLqKd/f91d0FeJ5vwEtDU2XNOfp9S
         CtviAaKuBovVvtVEcDBXsRLTggKWT6wPImg/8i1Ey8jTnEQCNTOwa/TOtlrUPF5O7GJW
         4vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635671; x=1735240471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzNPLfrwaRCpor5ScpN/PNYQLRUHDLblPtHHQXb+334=;
        b=aQzEdl8sh/WI4/EJZ3mWPVIcXMB3rQnD8ljPEZyugH4KCvGW5/71mdkOTzfHvJrUxZ
         XCXPi6qmjjWppHjpE2DYvOWQyRxuuUsWuqf51FXE8sxzGBBKAa1wpq0kHA4jsQlOHXO4
         Jz/b/QK/NmOGxVlogN8CUdgaWee9Ql0i7DEU+svCWMjZyoPqWnSHNoruOkGVuOCUso51
         d6ZYW/K7/uXEKeVVR12Rd53bfzMb/xEr68JtRQa1y31/KgP+tz8vvfHQ2UGqOFbR5boz
         tbYo8azfMiWA1Rv+cAiN8dpE1Hgz3qaufzX1GP8Vvw2lQ4kGGfvQ4MnrbN/c3koBJXx+
         d/LA==
X-Gm-Message-State: AOJu0YzczZAAy/pBFCa9zgxHJgYe8MG+IG+WmTklDzj1XMhuWEo4VO9y
	QM0/LPAk7w+XWfzAELvAA/A8ADMpkpqeyDYVRWdyWauOLRUvasrRNAYdiGKC
X-Gm-Gg: ASbGncvyGKRDdl11pY8ih7OhgLVuKaEZ3MRVpLxB5oaJ8sRlKRhEM6qggpRQbAI/6bs
	2ME6sb2BTUcMDGxDKWU2/1s56SE0jCAAsS+J70Qlzd01c/I15tXi9duuBBWO8/WxcLym8JrLHXD
	PYd+UzTzj+wh8clh1uI1ZC/1CsFeEy6+6kKWos/Wepg48HXIyQTtiFHeRuAMVLxyQKURl+wOgsg
	t3w8yqaHGyIuwEz2NheYNnIaM4I6bTWMPSOxuZbUNgzWO9bTncCWiqdOx8=
X-Google-Smtp-Source: AGHT+IGCqK95RCW/h+VAucaMsMsoPe4y84GNmIzYI2Ut1bNWm9L028+/H63rMWLMTe40m5l7h50ddg==
X-Received: by 2002:a05:6a20:7289:b0:1e0:d4f4:5b39 with SMTP id adf61e73a8af0-1e5e04a0ee8mr476784637.24.1734635671317;
        Thu, 19 Dec 2024 11:14:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::5df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7310bsm1329745a12.1.2024.12.19.11.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:14:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] nfs-utils: Fix warnings found with clang
Date: Thu, 19 Dec 2024 11:14:28 -0800
Message-ID: <20241219191428.531286-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 19:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208930

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-typecast-warning-with-clang.patch | 28 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
new file mode 100644
index 00000000000..3322a0d06f5
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
@@ -0,0 +1,28 @@
+From bbed752dfad73738baefe518e5959b5c0f038c75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2024 19:20:39 -0800
+Subject: [PATCH] Fix typecast warning with clang
+
+Fixes
+file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173457863307678&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Benjamin Coddington <bcodding@redhat.com>
+Cc: Steve Dickson <steved@redhat.com>
+---
+ support/nsm/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/support/nsm/file.c
++++ b/support/nsm/file.c
+@@ -184,7 +184,8 @@ static char *
+ nsm_make_temp_pathname(const char *pathname)
+ {
+ 	size_t size;
+-	char *path, *base;
++	char *path;
++	const char *base;
+ 	int len;
+ 
+ 	size = strlen(pathname) + sizeof(".new") + 1;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 543c68f7f5b..18c4a249b33 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0001-Fix-typecast-warning-with-clang.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"


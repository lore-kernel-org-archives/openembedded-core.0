Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89598C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.14468.1751641854883288548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uNuwNP+b;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747e41d5469so1217740b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641854; x=1752246654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud4IC+OJeW6aHlhCyMZ3pgZzXSASkd+ehnm4nxpr3Ns=;
        b=uNuwNP+bxKdTYmOxXQnhoDvbkEe+RGQ3LYyBf6krqrmvOWQ0xte1hd/11CmYt53nqn
         +Lst5acPRkzXhttKbRECBuA5qTfqSgfWVQZA/CQWQnCGAovcWwD5spVA8HaFrqSRWcdk
         fyNnr6kSA663xjyP4FDT0rhs085AmFfvpm5+SCuYxBm2bsZwI9BhvV8AVYg7wMAHl2gG
         CQA7l6T79QwovHxBBkJvA3BgmPtFdVAEzT9YRfUW4q81EnNdwQammuXFjxfIiKiDPUDK
         EtP4Df0QgycTVG04U63uiXzCur72Sdt+XDIF73AfIllShcMhUrkwxSf9rwbCjb0kURab
         cxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641854; x=1752246654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ud4IC+OJeW6aHlhCyMZ3pgZzXSASkd+ehnm4nxpr3Ns=;
        b=WU9QJe7i+8suLs+MhAZ8b7rx4AUZpGpWt1kvwVMlUTuEInncYqK4dzvu+fe1MZiJyP
         nNlE0ypc6OGBp1+1oM6bykjbdR5sa0bjdlq/jCYCEZkryOXG9qKSzdAcqREHufgBU5E/
         ZA3axW/MjGqXJCClIXmkbi/j/zX2IVnytO6WaMgtANHtKJe2qXu4C/Ts4qf6u8yKIiDI
         Ijb3GZTUP/vRPt6UlbwJMKE8/zdOhpxFHVfTFPDs5OdFrR50WEy7dpBOIG3hlGdchyz4
         Kt/PzZd3Q65RqYkQK7p3zR1Ql/lct1IysrhNBl/Nz0il1bS12XWCRu/Fsnk5Hc0YLtgd
         FGbA==
X-Gm-Message-State: AOJu0Yz0SWCFNxWaMbamVTGdGito5NOndRl1etcZoc9AG2gk11rVXIvT
	q+J0ai9hDEImn2vqJpU6D9/UxsxEQtdVIx0+4/h8c8K5zP9y3n7TY0b6U3WIjBoIOrEna+AbFsF
	2lqcK
X-Gm-Gg: ASbGnct7/d+Uu5+JhBZeTJLIP7b4elJAQgXdfLUeexuisp1XBuDl87xBfg9PEuCdiwi
	KQst7BLSAT2NL1GPdYyC2UZuC6EbJBemQnxp0VEfVfBB4cIhEijByU8kGvDakO2Zf35GihspC25
	1iRN1HbUi1lPocFunWkSbu69Nd77yzKtEvXijkXb6PxVRmZNQMe3WQQcDfQgmQ3yaIfpKu9xaC/
	Cb9ZgE71NBEeEmP0yqqBGX4HC0LSbwUxHogreAlpMbSKeHzgXNYoyGaBQ7UkG84c9uqERGYGKKQ
	RGuWiWkvCLuyO6ZqVrQo3xLNwyH+C9auT9KF7iMsEO0mL0FAZO9hFw==
X-Google-Smtp-Source: AGHT+IHnHfoRWSMFrkCZWOM14Yo0FDgpYsCeufiflSivxt+5rUIH+iXL4l1N3u95Uoyq0n/6bOC0BQ==
X-Received: by 2002:a05:6a21:6f07:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-2260cfebbdcmr3908009637.39.1751641854024;
        Fri, 04 Jul 2025 08:10:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] xwayland: fix CVE-2025-49177
Date: Fri,  4 Jul 2025 08:10:31 -0700
Message-ID: <0b2afd59ce8c35083c1cb3596a2f7d4eaa7bd1c8.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219934

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the XFIXES extension. The XFixesSetClientDisconnectMode handler
does not validate the request length, allowing a client to read unintended memory
from previous requests

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49177.patch    | 55 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
new file mode 100644
index 0000000000..56ae1de800
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
@@ -0,0 +1,55 @@
+From ab02fb96b1c701c3bb47617d965522c34befa6af Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:05:36 +0200
+Subject: [PATCH] xfixes: Check request length for SetClientDisconnectMode
+
+The handler of XFixesSetClientDisconnectMode does not check the client
+request length.
+
+A client could send a shorter request and read data from a former
+request.
+
+Fix the issue by checking the request size matches.
+
+CVE-2025-49177
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Fixes: e167299f6 - xfixes: Add ClientDisconnectMode
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49177
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ xfixes/disconnect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfixes/disconnect.c b/xfixes/disconnect.c
+index 28aac45..d6da1f9 100644
+--- a/xfixes/disconnect.c
++++ b/xfixes/disconnect.c
+@@ -67,6 +67,7 @@ ProcXFixesSetClientDisconnectMode(ClientPtr client)
+     ClientDisconnectPtr pDisconnect = GetClientDisconnect(client);
+
+     REQUEST(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     pDisconnect->disconnect_mode = stuff->disconnect_mode;
+
+@@ -80,7 +81,7 @@ SProcXFixesSetClientDisconnectMode(ClientPtr client)
+
+     swaps(&stuff->length);
+
+-    REQUEST_AT_LEAST_SIZE(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     swapl(&stuff->disconnect_mode);
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 72396dcd40..5ed8ca0365 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49175.patch \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
+           file://CVE-2025-49177.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0



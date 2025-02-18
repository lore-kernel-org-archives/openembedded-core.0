Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D349C021B0
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7325.1739913343592919086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Er5LBdEr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220c8f38febso111493805ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913343; x=1740518143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfiZtkoai+zfrd5srM9dza8fy0L6yz3JFbR0WqiFyeY=;
        b=Er5LBdErhHoZooPBgiQmWWkBQAeneyhzkscChPli/e5gB+Qbhsh0YcyIz+JJEr13x8
         kcSuGu6/a2yUung41Zs1QHiFszkzShbFb8IYoWbfh35dwSNPI9npeUS2x/e+PrtRpxVA
         YFD52pZBKa3srWWoESmSS0KWHjqMUHqLoKXFah+n68QWIjc1rYI/R97z6wLNQmoGibqM
         xK816ktj6s7umJN7NKg2XFo1Kupw92M5B5S2GbBjWl2c2KYePM+4s8IwRMi//B3CYPen
         PrloG1K65o6fZ1/pZLcwfqs6vxschz783q2zf+FHG/BRji9E+jmJe0OP9RAt5c/3cIBx
         Zppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913343; x=1740518143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfiZtkoai+zfrd5srM9dza8fy0L6yz3JFbR0WqiFyeY=;
        b=O4LTgNLd70+BCkO8xpU/3bs2PfcZ1Go/jcJ7NHplAZFkZYizHRCBd8CUAiJTNqlCPe
         vAan0mIsdLsDy4LFCmhnY2yBKXBjUg3BEUM9mha4eTNZ/AgQ/kjCXpgsMXAfuJsIGic5
         MrMrNUDBCBObzhQ31Qg8dxmQsn73cGquf+QifUwWwO/kPwsrDhEUT6SsgAOmbxkxujd0
         eDwd0KCSNuyYyon7zSEB7+IaHCMm6ZQ5l/mWD8LDRMnfcL6lnpPhHnw84HwKJ7xJhHkB
         tPnfSp9EvMLK4E4A0R9qFRcL4u+Tz9yldGT+Sg+fLkfpAUnyRyeLw+C8mzkKr7di2qC8
         reXg==
X-Gm-Message-State: AOJu0YwuyNFZ46nyGJMOHhlLaPrdIiP5ZKqwQlCKcT1Ledj7IAvhg1y2
	eBXIPCcIw0Ba0Apv0laWUY7lj+CLMWzBrUp0+aBIhjeOJlGSzQ93uS0RsG+3l8vQOw7aWZadXvA
	j
X-Gm-Gg: ASbGncvcWvmTnSQ3WNAugKBPW92BpYWtvuw3aIpfkLZK+NMvmnY1KcQuMpdGIQbarhy
	xS1+GuHMpd1jyq6OcRqjQpSapwD/DTboD5IzMFkOwAsya7N80oRhROXKd2hjbZseBfrGeHR2cZ4
	PgCg7pUcPOORpn72AM7M5euanWxVGwE0KHShb+0llbqhNPiKMv2+tP4ligxugkBxzmiSg/a0BZ9
	8TtOzkrGuxh+AYx3aPatp9l+e0hk+rGFo6ZG9azitR7O5iO+ksfeh2XHa4fZRVx5mFDaCPDxZFL
	VuprSd4=
X-Google-Smtp-Source: AGHT+IEkrKmVSCC+m+19AleBl5/Uc7HiWg+vJyA98IIiX0t7kehoqk2j4evuWxEOtydiR3ZEyvCFKw==
X-Received: by 2002:a17:903:2c6:b0:220:e63c:5b10 with SMTP id d9443c01a7336-221040a8faamr234728975ad.34.1739913342817;
        Tue, 18 Feb 2025 13:15:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] ppp: Revert lock path to /var/lock
Date: Tue, 18 Feb 2025 13:15:24 -0800
Message-ID: <183d2ff42636afeb4fb2394dfa17ab9c2c0620ce.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739913090.git.steve@sakoman.com>
References: <cover.1739913090.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211658

From: Johannes Schneider <johannes.schneider@leica-geosystems.com>

ppp version 2.5.0 fails to run properly if an expected /run/pppd/lock
directory does not exist, which is not usually created in a yocto
built OS.

Backport the patch from upstream version 2.5.1 that fixes the issue by
reverting back to /var/lock.

The related github issue upstream was:
"lock directory moved in ppp-2.5.0 #419" [1]

Link: https://github.com/ppp-project/ppp/issues/419
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Revert-lock-path-to-var-lock-435.patch | 63 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-435.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-435.patch b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-435.patch
new file mode 100644
index 0000000000..573eb413b0
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-435.patch
@@ -0,0 +1,63 @@
+From 99cbf5e269994482edaf64624be8b1c806f9587c Mon Sep 17 00:00:00 2001
+From: Dominique Martinet <asmadeus@codewreck.org>
+Date: Tue, 10 Oct 2023 10:05:50 +0900
+Subject: [PATCH] Revert lock path to /var/lock (#435)
+
+lock dir changed on linux from /var/lock to /run/pppd/lock with
+pppd-2.5.0, which makes pppd fail to start if the distribution does not
+pre-create the directory.
+
+This reverts it back to /var/lock.
+
+The paths for other OS should be identical as LOCALSTATEDIR should be
+/var, but also revert them back as well just in case.
+Since the variable is no longer used remove it from makefiles.
+
+Fixes: 66a8c74c3f73 ("Let ./configure control the paths for pppd")
+Fixes: #419
+
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Co-authored-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+
+Upstream-Status: Backport [https://github.com/ppp-project/ppp/commit/99cbf5e269994482edaf64624be8b1c806f9587c]
+---
+ pppd/Makefile.am | 2 +-
+ pppd/pathnames.h | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pppd/Makefile.am b/pppd/Makefile.am
+index e5bedf2..7cb3005 100644
+--- a/pppd/Makefile.am
++++ b/pppd/Makefile.am
+@@ -83,7 +83,7 @@ pppd_SOURCES = \
+     upap.c \
+     utils.c
+ 
+-pppd_CPPFLAGS = -DSYSCONFDIR=\"${sysconfdir}\" -DLOCALSTATEDIR=\"${localstatedir}\" -DPPPD_RUNTIME_DIR='"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE_DIR='"@PPPD_LOGFILE_DIR@"'
++pppd_CPPFLAGS = -DSYSCONFDIR=\"${sysconfdir}\" -DPPPD_RUNTIME_DIR='"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE_DIR='"@PPPD_LOGFILE_DIR@"'
+ pppd_LDFLAGS =
+ pppd_LIBS =
+ 
+diff --git a/pppd/pathnames.h b/pppd/pathnames.h
+index de2fb68..12609a9 100644
+--- a/pppd/pathnames.h
++++ b/pppd/pathnames.h
+@@ -120,12 +120,12 @@
+ #define PPP_PATH_PPPDB          PPP_PATH_VARRUN  "/pppd2.tdb"
+ 
+ #ifdef __linux__
+-#define PPP_PATH_LOCKDIR        PPP_PATH_VARRUN  "/lock"
++#define PPP_PATH_LOCKDIR        "/var/lock"
+ #else
+ #ifdef SVR4
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/locks"
++#define PPP_PATH_LOCKDIR        "/var/spool/locks"
+ #else
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/lock"
++#define PPP_PATH_LOCKDIR        "/var/spool/lock"
+ #endif
+ #endif
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index 5f0c75de83..badf22db97 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-Revert-lock-path-to-var-lock-435.patch \
            "
 
 SRC_URI[sha256sum] = "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65ecffe897de636ff"
-- 
2.43.0



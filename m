Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB73CCD5BBE
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8285.1725540074368386262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ybWeSGom;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20551eeba95so7076805ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540074; x=1726144874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtvdG5Ct9dFs4vc7+VYh+FjpjxpfWolb0U+QtCfxVZY=;
        b=ybWeSGomd+ty7Slegx6GRd50Try2/cKUtTNkYDY0sbPJ8c8NvZU77U76OF/Yb4YP0U
         s/Jfrpx3uf/fT4THv3WqWwr4LSfSIgQ9c143SepGg+NG9ecwArgNFFpBKCDADj//dlnc
         JcasecN4s6bgdTubkQzmJowEox4fyI4oZXmp93y6d1ZNvnqoNykexlpSrA3VcdgZkU1k
         UUIHA+Jn92PnN/aPimLM6w8N3nxMvL3903H3S1oy/rsErd6TxkVH/zWXCU9cfFwYBPGC
         9584ZQYyzJQqdn/mxDQxKt2+NXO55x84Erk0f0r53Zt36wOzbIqrZHl+TGXnM07U0U03
         Fk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540074; x=1726144874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtvdG5Ct9dFs4vc7+VYh+FjpjxpfWolb0U+QtCfxVZY=;
        b=cqtD/FmpMTrESwXPrcN28Ttnnp9XEVESWmdCYKx7f4ThHbzUuZCSuHbQFIxRCvw+sE
         a3/N4qIVf5gdQDwIZOcN66/m9Gm060Lrgxz1htXQPpEaXD/FkmQ5c8oIxPV9KbgWBcKn
         9KELtuxERPjIdgOBT8SeRFPpRX3UY9D4hLdtpwNvG9hVzwNf59z+tkDyEN8V+1bIoq7Y
         nePt2mjYtNyaLq/I/mikCYkNzc9wX4QKko2peTQKdXtMbZ94bRuxWNvafX6R0W3UvlTW
         ADoYeckpEog4eN9PBwMMHgGtYUHH4fHIKXRCnSNfQ/Je9vTcuoVA6j5Zd7fqbXFW8tqr
         HLeg==
X-Gm-Message-State: AOJu0Yxh0mUEag8lx4+hpP5PEFYNwNqVDwuXUs2HjzzlqoZg5AANxhta
	xlfmwBG43tQNNE5V48szZnJkoixoT47Sw2ba+LeKsz06r+lw3TNfH988R5y0ACepYamcIcxYytC
	VC8U=
X-Google-Smtp-Source: AGHT+IGnpMOmX03h5ElMfUPgCtrvWNB+t1VC5ZTahL1IoaPLHYgfPawj53PUp/ahI51t0vsOeF18Kw==
X-Received: by 2002:a17:902:d507:b0:206:c675:66d5 with SMTP id d9443c01a7336-206c6756979mr49400985ad.15.1725540073448;
        Thu, 05 Sep 2024 05:41:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] sqlite3: CVE-ID correction for CVE-2023-7104
Date: Thu,  5 Sep 2024 05:40:58 -0700
Message-Id: <9d7f21f3d0ae24d0005076396e9a929bb32d648e.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725539924.git.steve@sakoman.com>
References: <cover.1725539924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204233

From: Vrushti Dabhi <vrushti.dabhi@einfochips.com>

- The commit [https://sqlite.org/src/info/0e4e7a05c4204b47]
  ("Fix a buffer overread in the sessions extension that could occur when processing a corrupt changeset.")
  fixes CVE-2023-7104 instead of CVE-2022-46908.
- Hence, corrected the CVE-ID in CVE-2023-7104.patch.
- Reference: https://nvd.nist.gov/vuln/detail/CVE-2023-7104

Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/files/CVE-2023-7104.patch | 10 ++++++----
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb         |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
index 25c6ba017c..5f3681070e 100644
--- a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
+++ b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
@@ -1,18 +1,20 @@
-From 09f1652f36c5c4e8a6a640ce887f9ea0f48a7958 Mon Sep 17 00:00:00 2001
+From f388a0c44d2abdbd582686e511fef36c1b96ae43 Mon Sep 17 00:00:00 2001
 From: dan <Dan Kennedy>
 Date: Thu, 7 Sep 2023 13:53:09 +0000
 Subject: [PATCH] Fix a buffer overread in the sessions extension that could
  occur when processing a corrupt changeset.
 
 Upstream-Status: Backport [https://sqlite.org/src/info/0e4e7a05c4204b47]
-CVE: CVE-2022-46908
+CVE: CVE-2023-7104
+
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
 ---
  sqlite3.c | 18 +++++++++++-------
  1 file changed, 11 insertions(+), 7 deletions(-)
 
-diff --git a/ext/session/sqlite3session.c b/ext/session/sqlite3session.c
-index 9f862f2465..0491549231 100644
+diff --git a/sqlite3.c b/sqlite3.c
+index a16db27..0b979f7 100644
 --- a/sqlite3.c
 +++ b/sqlite3.c
 @@ -213482,15 +213482,19 @@ static int sessionReadRecord(
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index cece207eae..b3d5029365 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
-"
+           "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
-- 
2.34.1



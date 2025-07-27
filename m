Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31828C87FCC
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:12 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.66856.1753646702071950859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QmBooVZj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24022261323so2846375ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646701; x=1754251501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX+ujdFumNyw0ATS1gXmOwk3Zy2ESfKNHEFEotIWw1k=;
        b=QmBooVZjQ2FgDNSyClbG8dFLUlAln8/GyGRlGRKZri1jyrJd0rek3RBjmcR92/BP7N
         DNOsYDXyWjCJ4saI8jFFt0PIMxHYPsLol+bpmXDCdYVlaEukCT9EAx46zfMIOD+deJi9
         0H7zk/Q75MINnrPK/fSe9Nw8dhf2AJfGCf12Q5bvsbJ3yUaNusJ734GCSerUu2xOSaxX
         ECj/euT9lFVUbq8SKioKi1hG8utFrFCh232zmZJtSVokg3SdH451jcDN4ngsVBOj5Tn2
         zSvGDNXfdbsrJN3YXobbrypADXwZhF/qheIRMu/HJ5EPOBHM+OX6nk3Ih9to5N/8cbso
         BvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646701; x=1754251501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX+ujdFumNyw0ATS1gXmOwk3Zy2ESfKNHEFEotIWw1k=;
        b=Fl8Yn/5BS6N/pw4+gRw4g2SGV07qA6fgCHE9LN6VN8irBvoXC7qPaRb9DFmZwf84cx
         YWBfButyfAxG1UACggU8l0PcqXJYHl8a+FimboOUdEAMzq56wN7caYSTlOZFk5stpTEM
         +CKhzJDsQ0HYo7l9ZfQQjDKZf/azUHQGnWDm3bfSQ/VksfjWqT3UEjCbNynnUzaZdAwu
         0BxrpG2fnCy/g6WyNqkQdSx0K/Kt2+8eCTso3PoH/hnd8U4diLRCDVrY4/45Odkv/8ae
         NmLNTt+udycHXd5B1aS2i/+qXVqDm498QstrvqcB9eua24AdnHJqqqUOHhw3GtHCrv0w
         U1zQ==
X-Gm-Message-State: AOJu0YxYKJEVQenGB366stLu827av6jpVPq44F58W+dsP/vyn0AnfUTk
	veGmlFvs7+td2bwbLuH6KPO1uOkLrWieS3QQJq6/gZ/poxfn8ojsD4vFs1EuTvuQWB0SzGyaosu
	zwtSX85w=
X-Gm-Gg: ASbGncuzhvfLQK7YL52ehI8wicN91S8TR5qr3mRufmZOxrP5hqnXwJLlZa26GDasAZO
	4QKH3bV/mNSAbeRDpWnK65FNBSK4nBUfvCqOFHJathIlo/YTn9YVG8RSwgESebVtkwtzNBab1TZ
	LptbAPIH8hl3rEhB1IUAB61WlPM/+4Jj7WbC5c76R1yiFJtSnDkJTfV7g1D2+ZENibWM+dEOUVO
	xVbBfI6jjpNygSPgLNM6kSaMwhPWwZAKGx27qjmKPaAQq/sq191jBDnyHgGwgK8AE0hrtCig9f8
	gD11XnxwWB9UP4GrmyMH32lxVzsq65u3l2p+uIFnpREdDvPGis6SbRD2WIyhpQtMNo2vWY6iSYC
	YnyqYWq5eCdC3vaxzZHZD48/x
X-Google-Smtp-Source: AGHT+IF7QH7aaWGAQDedfAo6NnER7oEj3wlPnIAprxAJYutWyCpGxpfgsM9PTA7Cg1mkCBzGyU6p3Q==
X-Received: by 2002:a17:902:ebc3:b0:234:325:500b with SMTP id d9443c01a7336-23fb2bc78f5mr140780705ad.22.1753646701152;
        Sun, 27 Jul 2025 13:05:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.05.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:05:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] ncurses: patch CVE-2025-6141
Date: Sun, 27 Jul 2025 13:04:39 -0700
Message-ID: <8d09a78a79d7f4b4ae9654bdcdf5f33dab9a8b95.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220978

From: Peter Marko <peter.marko@siemens.com>

Pick relevant part of snapshot commit 20250329, see [1].

That has:
add a buffer-limit check in postprocess_termcap (report/testcase by
Yifan Zhang).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20250329

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2025-6141.patch         | 25 +++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
new file mode 100644
index 0000000000..331535e4d2
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
@@ -0,0 +1,25 @@
+From 27d1493340d714e7be6e08c0a8f43e48276149c4 Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Sat, 29 Mar 2025 22:52:37 +0000
+Subject: [PATCH] snapshot of project "ncurses", label v6_5_20250329
+
+CVE: CVE-2025-6141
+Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/27d1493340d714e7be6e08c0a8f43e48276149c4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ncurses/tinfo/parse_entry.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index a2278c07..c551c780 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -954,6 +954,8 @@ postprocess_termcap(TERMTYPE2 *tp, bool has_base)
+ 	    bp = tp->Strings[from_ptr->nte_index];
+ 	    if (VALID_STRING(bp)) {
+ 		for (dp = buf2; *bp; bp++) {
++		    if ((size_t) (dp - buf2) >= (sizeof(buf2) - sizeof(TERMTYPE2)))
++			  break;
+ 		    if (bp[0] == '$' && bp[1] == '<') {
+ 			while (*bp && *bp != '>') {
+ 			    ++bp;
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index 1fa5e036e9..68a845f27c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-29491.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
+           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.43.0



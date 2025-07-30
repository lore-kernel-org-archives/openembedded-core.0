Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529EBC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.46611.1753909714270123510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rXqtuLPQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748e378ba4fso368433b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909713; x=1754514513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkZ4kjQSN0sxYg/MaC2MXp0GELhztnadJj/U8/RVztk=;
        b=rXqtuLPQIlJj6t/U4iBw0D7sP5tH1RdOt49I26dxhqMqnP7HeT/Pf/No0GiFjFpC7E
         oHHCI0WyxHAXaxHaLCK67T+i9oW2GBOYulmGS9Jy2dA+yZRxpMJtvCG2ZrIOWyYjWKrT
         8lNIFJhH/soJTM+LmMOn7LRk2xkGWoX8DGxhZkWhr29SIFff6ZWiN6k/m5j9DdWXd2RI
         fqKD/PvGuZqiUyZdLYlbs7N6JDLVxuydv+Mr+A/Qnv5JzVyNELeMVh7XqBIiltf8T41O
         iwt29jOLS0ya6bhA+dckA2bsvtiqsAJIXDwwtSMWk6OJ7AfdXxx3xLwH4cU51JYMArTV
         AqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909713; x=1754514513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkZ4kjQSN0sxYg/MaC2MXp0GELhztnadJj/U8/RVztk=;
        b=lUQp0xpb/giUdqKgI3YBLBTmdr0iN1Fhq1bOF1WUCUd0g0zOIa93Ddfe0sgWCIKo1v
         DKoHf+PJgpFtDgmF4dDLTDaQX3/L6NPfpAiKTPahQncw7MMRtCp0ZdTvg2NDWvwYz2QE
         /raiLpkjjXoNdTX8rPikZuN01cQiceCRzJk869aD0TIbdDFTdlOtJw1o/B+mlpK/IOEA
         bQ8XxJtHHu1cbg+SMbJ6w44amnMiB6kmtF6KS0gUVJGw5dGkrUej1z2vRktdAUKOfdKC
         1dfOBv2ms2zllnkp1pE50hAC96mFI1gdPudPWq7RSGNhfcU40/y5QGkiHPMXipXRFDVT
         E7Tg==
X-Gm-Message-State: AOJu0Yy/A2PwGvPkgecC1Wm7MHZbFW18E99+9NCt5Lo3RZF6HwI4ZMIy
	u9RLAL/lgLiNX7zBTa1haCk22OobQBE/gEnEr+deVkXMy6i3y6PSnBSRfJ6H4jH+3mjkv0KjzrZ
	H7WNO
X-Gm-Gg: ASbGncuaTkmGzvHsOVWPAuFDfVFXO5Uzm9iKQb8FThwVd7EcJcwXzS1U3zelKRHDGh9
	Nr1dF1GL77L8SWUXGwTDIVbMLdGHuGK4jpE9ebfnvnjm+kfQHJM3EHfSOUR9U86d2jqB3DqH4Sa
	UpBMJTdYjvVFNagECTqEiIuENPHX1kOBS+/xEZ+rYrI55uZ+IPdPf/mBH21sBs5URn14e4mp6de
	VaSt1N2+jHum5ouuocRxUvrbeh8kBBxAGCdjMVVrgpK6nycJAZJnM0CLsUZpTPtSMdHc8NRMqql
	jk1HrJkKWkacwXVMR4VlJoKuANIViYv4dfdnspiHpHeUDjT8dUQxVy9N6F6HA6DXyI1i2JJ3sDb
	2iHVIg4O/XVYqLaKW1LYYfVc=
X-Google-Smtp-Source: AGHT+IG2P/kRIZBCITxQWtUfLZOYiFUJ8CVzKaPtxlwOGyihljbyxr+qhzLChHZ9y1MP5tWwVzUGjw==
X-Received: by 2002:a05:6a00:14d1:b0:76a:7b13:e6e3 with SMTP id d2e1a72fcca58-76ab33001c6mr6437406b3a.23.1753909713434;
        Wed, 30 Jul 2025 14:08:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/8] ncurses: patch CVE-2025-6141
Date: Wed, 30 Jul 2025 14:08:20 -0700
Message-ID: <408f1d820616d2bf73cbd319b911885d79d3ca9d.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221151

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
 meta/recipes-core/ncurses/ncurses_6.5.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
new file mode 100644
index 0000000000..ec7e8a94e4
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
+@@ -985,6 +985,8 @@ postprocess_termcap(TERMTYPE2 *tp, bool has_base)
+ 	    bp = tp->Strings[from_ptr->nte_index];
+ 	    if (VALID_STRING(bp)) {
+ 		for (dp = buf2; *bp; bp++) {
++		    if ((size_t) (dp - buf2) >= (sizeof(buf2) - sizeof(TERMTYPE2)))
++			  break;
+ 		    if (bp[0] == '$' && bp[1] == '<') {
+ 			while (*bp && *bp != '>') {
+ 			    ++bp;
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
index 2e3ee337ea..83de792d89 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
+           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
-- 
2.43.0



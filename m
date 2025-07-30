Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9574C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.47218.1753910962800155195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EHnY/+6P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2403c13cac3so11743895ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910962; x=1754515762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUvUTF1rHjoKpLWbjvAFKaYAFWnqevAA003nTb4ap00=;
        b=EHnY/+6P0mPQJbvLgPT+Jf9RNffpEJUCXqUa5iAQuafa3nzpvDip6LtealNpEQAHaq
         BFdYM8ftLaGlSqmmk/SS3EDwLsS7kYB/x/1nVfMifqoy59V5CqtIwP4M4CSZY89gnSEH
         4VpyC2YKz36DN+SQD9tBUogNpWwWTqS2z0V4VtKjqN/HVeG4Uqx9YAAUlo7X6FpQPBZJ
         ZM6z2vUF0RF337I0oIy7pgQEjG2YgoW94KWagNRRHcDj09SY2ORP0XQXAuDxLDBu7+wd
         bGE+jjwRcyMqLgn31+esSPHwnjyFU6wgIBGgtxkwY1qPwQSZnVaSu7VMwO54zaLDbxBF
         iAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910962; x=1754515762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUvUTF1rHjoKpLWbjvAFKaYAFWnqevAA003nTb4ap00=;
        b=LB2Lo9Q8/ktjRtmY5ehRnMDSMJi5zmu4nZulqZLUuIJimx9Qh0OaIG58IE9SV3oEcH
         tBa5LKbzAvdcpndrmvEaE8J76ZYR8AbURn1GIXsQv4x8OjAkXWekWRE8sTiUOiJReiKU
         UKb8GqNE5yp+bVX7ClEr3aVQg2dniYRbdAOPce2IqZY+smT5A6RnIBahwfG2apfNfFxx
         91fdhGEMSoPydpGSO9dDewha0Eq4Wx1vPo7UXhnelNaYt6P2lkTQgtoiT7WPfgAA9PNM
         7504sfFn716l4Vj5/KHoVkfX/RHphDTEgaMq4dmZkNBt+otS6p4Xgpi5kOPDOLo5Kmj0
         xvVA==
X-Gm-Message-State: AOJu0YxtGUHqKQ+camMICEOGHyUn5oLpFzogVsBEPtoUR3/8trXEXQ7p
	7nLkmC15bpPjGEd/KV4MJuwtm6gzkAckxu4G/B7bGGOXGWBxFTZhDPZhbbDrwUkQ8CzmAZ6fFMV
	hp3Wy
X-Gm-Gg: ASbGncuNxylAl7UKSsje9Qr3srWraRiWCCY8zD5S/X5nHvK5J40mVcrO4sQ2aPMa9iO
	Bf84C6ILJb2p8a2lU/S4wwpqYba7DcpdV1FBwBBRVp2f/qtF4TPJb/sNIzfx9cH7RlM8gJrsr9r
	xcZRMp09n6MTxD2X3zxdZmml/Xtzwr3niXDR0dNFxe5qQ8us2BHBORshdEc2ltBnEx7da910nMw
	ptlA9KTGqTsz768UDMP3H6qFwjV97oTKMgngSLtAbfNHp5s+WZ/U8LLhGxerkNkSfcDgStwliAc
	4HiHsjiBWLJIB4TxZhZSkgO4w0muh3Fz63jlYsCbnAKo5w/qskjV5IX/vnqQqD8J5x9oqp9FOul
	notof2ZwLk7rQ
X-Google-Smtp-Source: AGHT+IGgBFBDdf+C6W08a/666ULG/hAY1c+AMJkcHo6Ptn+LUGjIaJai8nCOXhQuZiO0tuWpbVeuiA==
X-Received: by 2002:a17:902:e78e:b0:240:3245:6d40 with SMTP id d9443c01a7336-240964f533emr71562125ad.0.1753910962016;
        Wed, 30 Jul 2025 14:29:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] ncurses: patch CVE-2025-6141
Date: Wed, 30 Jul 2025 14:28:58 -0700
Message-ID: <79b080eb93918431c97edbbc80de5f70a2b09a4a.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221166

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
 meta/recipes-core/ncurses/ncurses_6.4.bb      |  1 +
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
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 61558ecfa8..d3b4106118 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
+           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
-- 
2.43.0



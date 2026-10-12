Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CC2CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:50:18 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10628.1791802215659074583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dYgxHxin;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so4041326eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791802215; x=1792407015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjL75ADxIt2OAseUxWb0StXoawJndyGsCDKgnkDH0Ls=;
        b=dYgxHxinRbZDVzBjb/o0K00HlTD4Q6jYsT+VJMSxxXk0wv12NEZRa0VvdqHRONzL4L
         bVr9f6Cd12kh411zg4lhflg1TX/v4Xp0Hk1yu08WQ9Ut4vdag+1K6jN3kxYifTY955Qb
         Pi6cuKMMMkcvVuzugcGG3U6hmXeA7gfz0Bo9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802215; x=1792407015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjL75ADxIt2OAseUxWb0StXoawJndyGsCDKgnkDH0Ls=;
        b=iQEwsoUEz5MqVlfS+6SUA5vJLxI03tPspgf9h+wc8TxcHERDoRus1b2KFyFd3ofazZ
         voZXik5T6rQBHTjzV7fPlvYgyYkiyu0/Y42OfKVQhtrEwKA5h6tdChjgkqOD8xssckZO
         3kZU5H4rE0yRcbzpDnJOz3kG0fim1aTmQ2MrexXnTrXptkTukl3kY+SodHJYH+K/4Sd8
         tq/7Tx1ciZEG4Wl1gzOfbv4fqFdqzS0Q8IDJHVK3d98c93b9om8WMxDZbk0sICjj6waF
         /HNx/b4MPTY7NaAx1iV2nMmJZYPRuUCUuxKCM00yTyeuDz2NParzaFdI7e9OZA9uGkMK
         D5Uw==
X-Gm-Message-State: AFq9FYK5nIg9/xf1Yd2lq6flDcZJ1o5Wal1h+VnvbsUBR3s7J6eX8pHI
	p85/TmpTP+8K6FDv0kCnMa49vBIMAN/SOQ/JOg3iNEn5lTj5nlV8ajzNPj1ToozM+8VQgyBicCm
	kZ810+6E=
X-Gm-Gg: AYBFou1UhnVqI7IaDSGq9SA/tUwA5fnK3o3CbxfLyvha8oWddEg0Ke8NXO/BFnGPCSF
	oiySmHApT5iCvUquQhIPIu6JbB5ZGgapAvPQuXVJEpZ4x0qLemvThrW89wHOBJT8slKMHoSbxAv
	Y+mJuHbAHUlJCP8Im6Imprd3uKRAF5zJkLRgw7Kpb1UDQdl/h8of6FYKUD3LpDECmSl5MQpY6iy
	G6heu6c3OPL02KOXc+xojpsQ2GAKcb9W+PzwpQcrQXcTlbHdk3ooPpujSvVhG/+YHrkVDw4eUMV
	S08T+lKQPr+cD4UjUEzg3P9AiT0XorD+bmjzEG1qlacxmC5dFFNclcM4E0ik1gK6Ka3pCSJ+vK1
	bB7x5afInxUNkguo79QFH56ISNYk2Gb735DuiVQzSuiIj56C6UpWFoalqW6oyW7Gv9dD5QaczjA
	aD148lAtqi9EyeGQBqQWIpDqJ2ewiPKPwLjW2ug28UBzs+LfvgvetnM2dveCRS5ie68TsN5w==
X-Received: by 2002:a05:701b:2917:b0:143:3617:c595 with SMTP id a92af1059eb24-16a56c9d998mr10931349c88.1.1791802214663;
        Mon, 12 Oct 2026 03:50:14 -0700 (PDT)
Received: from MVIN00352.. ([106.200.30.157])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm27008230c88.4.2026.10.12.03.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:50:13 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][patch] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Mon, 12 Oct 2026 16:20:04 +0530
Message-ID: <20261012105004.1463096-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247631

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 441dc9be99..704d6b603f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
-- 
2.43.0



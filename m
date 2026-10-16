Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35969CCF2C9
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5947.1792189493549184583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tYusje8N;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so2720735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189492; x=1792794292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=exYnRmKTmgPPn8TpSPW27Up2Gu+n/tL1340thEZlicc=;
        b=tYusje8Nxmhk3kJS5AIsZujQy+VgPpWAKvMnscjFugf3ilwBTKqe3PC6vkkeuZEGNU
         aOOk4G7oWhZWC5DSgK0adOOHdtK2k5K2aLk+ilf0pttfRVYLWYjNNdO7opQsAi3xXVBU
         GjiVo47yt7OKK0opoTa3kjgRjsNvYa2dkY+4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189492; x=1792794292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=exYnRmKTmgPPn8TpSPW27Up2Gu+n/tL1340thEZlicc=;
        b=2TBuElyRql30D2FZJw+DCzJAOZTqSj38vsW5BVJefOEOMmUfP+sVhmSIi/nhpUjP8E
         0B3CePEjXjPg1uH6V//7c4O1WRxsK93oQGjbfN35xbDqr50nPU72e/W1OZJi68N7l9Np
         5OVyuCnlXj+7IhiRAGLLKOghFbtVvGb72Lhu8jiw8+vJaRA8vCzGmD6pl+kL2ZZEhKE+
         HVrC2rYY7kpeXPRUqo6v0AlAzTsUyCkLxeIvDmujd28Od5T54quQaEY5V1iBHHDQzMuH
         h8050utf2JLLSLNwwfzS7Jy9nhavKX22aSzJfFhwutEVysmBIRCB8/qQuoU/0XRo2Xju
         J2cQ==
X-Gm-Message-State: AFq9FYLBPf+8HcJwI2WdZ2QZLKBh/hjUDAQKDIFnra16rx35Z+/nMJgF
	QJE0qEW+a7FS+f4pefzEJ5raRM5PNtuU1k8RpRbLzRDHCg8YYEDEN7gLkGW0cWBiw8KLzM+RGL6
	9fr1afoU=
X-Gm-Gg: AYBFou2yJ7Fn8/srvhdd/CabG9KOpMi+orPK7QsI06tb1GYtXkiilhLgL0nPlyhW2pT
	l8hG1+mqxeIcuJPYwTKggDvYLpEQi/IKW+FfShRV6jpqd0pzhZzPZ/GT6Yf+BOlgm9E+PPYWKJZ
	9324p90tChq89ZFk6P2P0gdQX/4a0YM4TXtVGdHg1BIpIjxFe6vAmaI2v3IzjJ9T4PS38drb1Mv
	rsHTcfieeUieJdaKEUqhHwJlhESV62kQWjPAsy+S0e5ulIpAS45bAi/1KrSyBDGJbWLjRZnaqo+
	mk4+XQ+TMPeIQLlwZXKzbhezgj42dXKMqmN71ksBktHKhpSrD7vgMytm62Fy3nbARq84xcbP7ew
	aX3RtyhUSKrG2Z7hGu/iv94/V1hfYgikxXUrYS6EDkqA4gcvmQKKVgLzBiKphavCbPK4OL7yjER
	yE1U3OvKFX6L7iYG2l+vjq0quQgdzGIk6wYYg8d81L6c4XMPZHmVlNy7f1AQfdTWA78XxRzSJJz
	yqD2dFpDXlEw9BPH0ZBYFZ+Ix219ooQVt3vHwXBR3aoUH2C690cRKh4GXmoIMiIvY+UDddCapQ=
X-Received: by 2002:a05:600c:3513:b0:4a1:a39b:e75b with SMTP id 5b1f17b1804b1-4a1d7607560mr23643265e9.21.1792189491693;
        Fri, 16 Oct 2026 15:24:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 16/17] sqlite3: Fix host include path leaking in with readline/editline
Date: Sat, 17 Oct 2026 00:24:18 +0200
Message-ID: <c0502cf522aefe45bf94b779fab4c87c5325af50.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248066

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The autosetup based configure derives the readline CFLAGS from
--with-readline-header, so the ${includedir} based path turns into
"-I/usr/include" and the build host headers are used. With the cross
compiler this fails with -Werror=poison-system-directories. Use
${STAGING_INCDIR} so the include path points to the recipe sysroot.

Tested by building sqlite3 with PACKAGECONFIG readline enabled for
qemuarm on master.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52f471a0aacd1115886ec1ac1dd3c25798781926)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 137ec26207a..007a823dc59 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -34,8 +34,8 @@ inherit pkgconfig siteinfo upstream-stable-release-point
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext unlock-notify"
 PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
 
-PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
-PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${includedir}/readline/readline.h,--disable-readline,readline ncurses"
+PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${STAGING_INCDIR}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${STAGING_INCDIR}/readline/readline.h,--disable-readline,readline ncurses"
 PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"


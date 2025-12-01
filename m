Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA86AD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:31:39 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19724.1764588693123889382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=L7I6XOmI;
 spf=pass (domain: snapchat.com, ip: 209.85.208.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so7167954a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 03:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764588691; x=1765193491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqaoGXDOJH9C/YVK0P2U/JFDAqnikD7WH/yzCzWgbaU=;
        b=L7I6XOmIdDC+ug1sWS4JYplXfWJONKf5oUtd9oG4jamt6+HBW203TpsulDuKrd+pZr
         gHJcTT64Ab6e+kRKEYwhn/aCMCHjWCISp4wYzkLBijDYLBMcurk+DkxUoOIXqTaD6zv/
         DeOvvh0CsFC7bhojxzah/owr/kyLONETd4BBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588691; x=1765193491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqaoGXDOJH9C/YVK0P2U/JFDAqnikD7WH/yzCzWgbaU=;
        b=NncyjKuV0PqQbfiv/F4LOAo+H44FTlMHCVhHiMXcgIO7Lomq5oqggG6D0fXxNZyxFf
         +SXAXRvdA7XM42cSjg7Q3M1l9AJn8Op9C7qRYf3K5rfocb+KaTzxw8SZNdhwxdIGcfbV
         X09dT+9czLDVSN8X9OIsF3yzH3Y7ESKhYWzYpTSz/2ZOtHbym2eXHM2N88RJ6j8lZYED
         RqPI/xvpIMGJ/TrSwVV/key5/+FpXR/1oX58pN2BDGC7ZItml7PKAxl21fP4Six6D9eV
         8tpe/uHvGSbK+knxuq6R3N6uq93MWTGAB/fGVsVXx63OEJIri0CTyMPyy3G3o1t+272t
         2xuA==
X-Gm-Message-State: AOJu0YwY0JwaRwiNXkLIqvIo23nnqenoKWxn0/PuNeerC9m14meC5cOx
	MZhBGondSY9hq9W6GlfLWGRAgeiWbEu96pY2pZFpcolP8rSuYvPQ0MqecU1lplGZN+fU6c4sI/d
	g3W6gXnU=
X-Gm-Gg: ASbGncv3GImBOQpbjfvDclSg6mDP9K1NWlwzq88YrhffOGexQTVnC4uSFbDYjiZv32e
	zvHcIL5A2njHOk+MpYjHgQSg3e6Se3C62mVqUwyRkOfs9zv3j0rFRY8mg2gX2IE80thkY+0ENcr
	f9kPwEqwkYUkIPfY/5jnJoxQsj2N3dAuQ0w95v41KKsODW3+/c5qbcO/ALL99gW0zxyF0B5ygq/
	3a6+OpZd9EOgNZ0ksQQbie9WHGDZpjWn83lK021QpTgzTJ85dQU/3kcYwoWQajk3HvRXLf+9SDN
	EAr15kVUv6ELmoMgzd9TwebtWDpoCgni/J13ZDqQoApOTCwsFz1WzZCwOnjkNsdvs04WbuxJ+Be
	mLCSzF3zDJKweih0xppTNjV9QpCBwFfLCqK/VekK09gn68h2rcifNoNRz1FwJ5ZhTFL229lRa5u
	KtArsg0ja1CO0/QUE7/CAE+BvHQC0ChU7R2SRnL0g3fkqfVtvL9LZzB5CEv3UtjyKg0Q==
X-Google-Smtp-Source: AGHT+IHbh8T9rQsnqROa8iLi4aG+m7m2rWNQU40IRTDk8FHQ6nIqYQFIjRoCz+vbZVWdcIAnBSxKMA==
X-Received: by 2002:a17:907:7f08:b0:b72:6b3c:1f0d with SMTP id a640c23a62f3a-b7671a469e7mr3343741466b.35.1764588691022;
        Mon, 01 Dec 2025 03:31:31 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm1192746466b.29.2025.12.01.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:31:30 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] ncurses-terminfo-base: add tmux and tmux-256color
Date: Mon,  1 Dec 2025 12:31:26 +0100
Message-ID: <20251201113126.1279071-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 11:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227121

From: Etienne Cordonnier <ecordonnier@snap.com>

https://git.openembedded.org/openembedded-core/commit/?id=5624dfcea87da54c49ba1d63b528da020f351908 added support for tmux in ncurses-terminfo-base in 2015
by adding "TERM=screen". However the value of TERM is now a build option of tmux, and it uses TERM="tmux-256color" in my testing on Ubuntu / macOS.

This commit restores support for tmux in ncurses-terminfo-base. This fixes e.g. `top` not working when starting `tmux`, then `adb shell`, then `top`.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 951f96beb5..8482db7f6e 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -182,7 +182,7 @@ do_install() {
 
         # include some basic terminfo files
         # stolen ;) from gentoo and modified a bit
-        for x in alacritty ansi console dumb linux rxvt screen screen-256color sun vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
+        for x in alacritty ansi console dumb linux rxvt screen screen-256color sun tmux tmux-256color vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
         do
                 local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
                 local basedir="$(basename $(dirname "${termfile}"))"
-- 
2.43.0



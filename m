Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21161D74943
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9472.1766114573422786334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvKcgr0H;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0bb2f093aso13521215ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114573; x=1766719373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRi9jbNrcrRDQGLgzCmEKEM0UC6UK7Q34AiOw3qbgas=;
        b=OvKcgr0HPyEYZdM9AXA+Y0FQtPFyJ5kCQujYrCpMp7krYSitYGykUNUB4FaETnN1sN
         INfZ4kG61gx65Kh2H/IIZNCERz/LbGRNvFMtzeEMm12uoCskBlFGhqPgBzSkqbXSLZLl
         TkpRWmxKelbfj8WBpDkReTm+06Anv+cW6G0NcV9vYadErN1ttOwekb8RAw8Bm23COD03
         mQMh0KEULvMdxqwNhkaOW6aHOUpD4Kg/l6BhwP7RYVOvZtqoi9N+0NgO5bkCwF4ziWWr
         TWPo74IZec2AJtmaR00Ki01jEwKmS9w1oMP/mM4H9YyLL7245MiWW1JZEvgPhFUFvDYQ
         YBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114573; x=1766719373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRi9jbNrcrRDQGLgzCmEKEM0UC6UK7Q34AiOw3qbgas=;
        b=HFPbbAdDrjAfXntbg45O2Vzq2jORm1qwwir4TlpbdjktMuefhxAR50AItyul39/nKv
         hnhWUT2oHovu8hxZXCn2ofOJhS5DkVoxOCjb1IUDXOu4vIYbx8Xx5E0VKzrigAc6j/ST
         SBxH49wc5riTE5cfiojps6+NA9EgyehKs5zunXEIEO+QIXMgBC8EQTYAUsQkNlylNB9b
         zfrOTPy0Pti4bBGkGCA+PbYU7PuiWUDmkOUFQdLzVoYsijWehQaRXU6Mer/NnJLin1iY
         Jloe+J2LYzqHIhOPdWafayix5Keiz8GjzpTTRbPGaZ3BP/UQ+G03FHLqYGNzM6LTENbw
         w47A==
X-Gm-Message-State: AOJu0YxRrUipK04rQYziVG96ATJ1cJuZwSVGo2V5U8Vv67vQzMwKUJKq
	NF785wf96ifKUcJW9KeNtZZ8BArVfSooParxW3ar9scZQ5krUeyriCGAAOkQmQ==
X-Gm-Gg: AY/fxX6bsW+khk0t3p6nU8BbzNS2QOChsTjQ2724i29bbqEmipDVfMUJIIx8ulLLOPU
	nw6VhWLwPd6CIxPWLR2i1tAfQuSL1oWpxDnkLBugIK0edWLqbTbSXjbMG+rN1Tz/cU70B+9dMY0
	5Ijv9Xe/1VdPrst98k0oeVLWkqeyVgifuzcu/M4Uq0m4jzz9CZ1Kak1oNklNpIN/YgVmbFhYvi/
	kDUtheJZrRvBU57JTnx7S84nlpnDrPCqD3CDKQB+OUxUwfBq4rVzSlrXV2bUPtQ8hVK2tkjE3ss
	Ysi25jCmuqgvoDv5lo+vEDiyEdOitXC5/b9v6yigG36TlVqC0+82EFYA8pWj+hG5Z5x4hph8egM
	sWYpCNZE15vPwevpytuj1sZL92HI5c3z/j8bARjEfTWfI2X0VhjxrkY0SQkT9ebauSDVmyTaLBE
	WqZoTY75Rr4kt6Rd4v2wtS/EM5
X-Google-Smtp-Source: AGHT+IF9+3RnhBy9s4QSb5LYQvjV0AdXJmMdt2C42Na9AebWLqUxEVtzG2y5lY6V83dppp7IPVeaSw==
X-Received: by 2002:a17:903:3508:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a2f2202da4mr12101825ad.10.1766114572615;
        Thu, 18 Dec 2025 19:22:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 14/29] gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:53 +0530
Message-ID: <20251219032209.960840-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228182

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03dbfa735eb15295e7d58b2029c1a88cd98c2fd2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
index a6bfd1d2b0..0bc858a03b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "4f234594aea692e3c1bfaa969965039aaf7483bdfc5862b31d614a59e6718abf"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 


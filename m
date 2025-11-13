Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB5DCD98F6
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4355.1763070470574872151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qtL5B+61;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298250d7769so8254085ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070470; x=1763675270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YtNj0wBV9cDniDp/zQHOciuQWtxkp3gLFmekfoT30U=;
        b=qtL5B+61YlDzFA3mvxGIH9s91rq6MsSoQgdOPSxUpRkqOTD0lDrmvQz6scIX2Z3+EC
         iiyeFNR4k4bvzP3JnlfHRUlFuVNg5x0aKj+U+k3K0/tp3giRi3UHBSpIz1jPqYe48Hdm
         we/e4InoYgZV0SgY3Ipw7LrBAovpLBdGftHnzaDxN+2k0PY6j1JHSnkFbaPKordj8E+u
         JyW9QhXhChX8CvZIABSQNbGB9TdMjGTcD/XJeMlbDqGCHRhuyJjHII9SrMam+Gj18f+8
         SYEr3ko0UbcNfphQpsyxpVpKgJxj1mrRXA0aDUfgLU0GmlSnbmG1xf0x/DHvr9FnxC+I
         glmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070470; x=1763675270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YtNj0wBV9cDniDp/zQHOciuQWtxkp3gLFmekfoT30U=;
        b=Fg9IEjagxXW3ucYfC+1bJOei/kcyBsL/I3D/sDJBg/wYSvABgdlKsAhzBrmWShclEI
         JizOrRCClOdFEUfsM4GiPy0ne46kUxdD7axkQIjo4xYe/aJQHtfloWyPYrX92zuqSn2d
         eKDnFSROKDlhHTdUrWFt1E0L0NFaYLIUg6EVp/SBMLvEFA1UODxmt9KGIrNUyQbeRH+D
         zQL4YD21ua74Q9iZ4dkG0ViTVdLb1mE6lZLIUwq4jqf2cz43vzpMquaLLhfhFxKoNMPv
         bYHZjt5X6X10V8feYjFVYecynLlDiagDYcw0Etj2JXff8ZTb8Wu9O8J6bbEjVnGuHlrF
         uyzw==
X-Gm-Message-State: AOJu0Yymk1PfBOaDWBgC75fgaXQZlUbs5OD1CqdkeK4SkNb4QlygP0Gn
	PqDjsi0ljY/oKGphY++GlJd0n0thew0331HHete5yDv/Gmy1pW2bBxug41gWMFe85238d9X5HBt
	uUnWk
X-Gm-Gg: ASbGncuHUmkp0bu2fApNaf/R22kk3o5lqujGlLyzP+lfQu7iYiuiAm95D/W15QdZznK
	aUjqey/Cruw0p/ROV6uK6dRtYAGtsmVrTX711zhWbA6QBX6VMtbDdb3CK9N+Gp46Z3zsXm4xfru
	tt33u4cP9NjGQJfh9VFU0wEINNIR6ICPXPxgMnDXHZT7JPWj1AlmjVArfWe68L58mjVgHwZztzH
	nF2Qq3Wry7qoB57rHAcTzOD2lpvWa0mU2qvmGg5mxwwX3U0HGDtiPlmbuvJiwNKe73D1FuPf/Wy
	OxDj8HCmv/K2QDlffCP/4RNKvkPk0g2VTKbLc0DG5gFAWpVLixtWmJZk1FJpjQRa2BS5W56cx51
	8vzCVd43AvXjYx5kwNAeaAOxUa8F2iGEO36u0lbwzJJ7fE77jOTyE5rlzMZDJivEdTA==
X-Google-Smtp-Source: AGHT+IG+ks4N7BHEIlFsQtOLMqlsA+4lkrMQQ5b1SEKk3NYTFJx6klpiDljtvgupPZ+0oC79BeytCA==
X-Received: by 2002:a17:903:1a26:b0:298:250b:19eb with SMTP id d9443c01a7336-2986a755e6cmr4239495ad.60.1763070469860;
        Thu, 13 Nov 2025 13:47:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] babeltrace2: fetch with https protocol
Date: Thu, 13 Nov 2025 13:47:28 -0800
Message-ID: <4351a427b2ec270ea5e4c698fe4c213036c1241b.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226281

From: Gyorgy Sarvari <skandigraun@gmail.com>

The source doesn't support the default "git" protocol anymore for
anonymous download, causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 7ece3140f7..8fa0f9f20d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
            file://run-ptest \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
-- 
2.43.0



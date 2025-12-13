Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63930D5AE69
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:19 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2896.1765620073613149912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSk1Zhu+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2981f9ce15cso22923015ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620073; x=1766224873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjQQTmCfAOsMPk/jbRXGjSp/WpCMJatjuwdiwgr4h0Y=;
        b=KSk1Zhu+xZk0JuNMeXkBaBehWm1dh4o74ZgMwnWzNSgYTFrnr8lPk46N3ilo+w0dwS
         YcDu2M0xJJ3u5+sPTLDUN4ZsLv++WQJkdL0yPTXZpuXa/JdgNTWK8rU+0EQ29SmuNUO4
         3odd00JWYK+SbLBiwF1hAlGnc01FY4XrsG5b9FYp6GX2WZUDJn8BrFbKnBC5TkTXr3LV
         D6ANrTgGgP1HSuYxRqU7PCJxDmBIOhOW1nyiqUFrGZE2QBLBIjnVXR8WrzsxqhrUxDNM
         c0a1ph6K82QhPZz7lpmcvm2HemZ8AhdA6uTLLj9fGSxbnaGkL2HJ0TnvWcPkO2Hq5cGZ
         67PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620073; x=1766224873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjQQTmCfAOsMPk/jbRXGjSp/WpCMJatjuwdiwgr4h0Y=;
        b=DQAbBBQTTVUZ+iY6KfXHgKGX0XPmW6KMEg/FTsFsRWx6ozqu86l3Gdk91eXw+BbaYk
         9QKtoKf/SYRqZrqrUEjIhrkgDJesonkZ3yLyNy1DNQl7KhlYf/clDwCzFCmSNEK8IeI4
         +DolcOOVZz8at+6I15If0TCvEH62OWXuRkoXzZ7lNeOpqC/SSDBQr9FyMxx3cu6+dMoe
         l+eE9a96hneeMYOjEYSPUxLhPfkb6x6ucgYCTgGoCKPktr0a/NpGGZkW0AKxejUixGa9
         nWrB/fzvnp9Oj9BDGuPjNF2dpVROfME+5t6T7YW9Lo1UqhXLBGgXEVq01Lv/VW1r4IEt
         KHlg==
X-Gm-Message-State: AOJu0Yya3G+WjvofqVreBqmcAQzCZ36HZhJwTYYqbuGGOXqV+pnjXZj3
	Jn4yMNI3XytFVJAfR5zlSEPEF7EyN1gVk2I95HH4lFwIYLpX5w60UW1X6/mmHaGA
X-Gm-Gg: AY/fxX5Ces01UXTMuAJvxOPb+n8YqswDvBH7IUyzC0+7tSVDR6IXPRpKNzWjvbjadit
	6xgV3NzJonb8sDK8pldsucQRPg66cr3KUNCY36Hq0K3DPsgxgHeCV3oFe9JrMX7fyOEq1quqi+d
	SaZh5DD0FvikL/lmaGFr2QE4ogiMD44doySQfYYzdAgiRpqzVZ0cUSuUDzpMQz4AFklF+6lu7v7
	lIE7mZG2z4Zv6MVu1utr4mbi8QmQjchwdO07Supc2lACrd9grI9R8pU5iEUOz2jQNQlen1gwuFk
	F96leq2Hys8HgINHzTeQe1a550jPtBNMuE/n6z5L/XxQD4L6UiRbEkYGmHSVZJRxktFOuZf4GH5
	B+f1dKTbY07YKTsbwTsMBlso5fb6qyV5vFe5NXLWr0CEdBh5aXl0BgA9dLZYm/imtlhkl/wiKZc
	SXBqzfLqWDMBSVhGp1nYStskmE
X-Google-Smtp-Source: AGHT+IEp19IMKKBKVU/YUpAg9D3yVs81D2s9YtXQMOhsko6ulxtkOttExxq/oV+SSOFtVDOeDWWi8A==
X-Received: by 2002:a17:903:22c4:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-29f26ed3a62mr45043465ad.49.1765620072800;
        Sat, 13 Dec 2025 02:01:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 34/67] gstreamer1.0: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:58 +0530
Message-ID: <20251213095931.2571498-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 985ac9fcbe526617265a9e61d529c492a0400e24)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 4c800c22d4..444165a869 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "0a7edb0e7b42dbe6b575fce61a4808a3f6b20e085a1eaecbc025d0ec21f1e774"
+SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \


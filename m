Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.58520.1622557160279853330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YFqJbC4H;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id k5so8479615pjj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yN6GVXYMimUYNFrO4cII2EkhWQB7GrngwFKP61yEl9g=;
        b=YFqJbC4HEyArk40yN9bHL+f2W5qIAg5upGdRNRVHOttVayaB0f7D6FU1ZgT5u088Mr
         YgXd+TfWD0cJ3uz4/iJs0PizBLVfw3IUX1mVTfVZggmZDxQsIjgdzRk1gwUOV6WIFfWb
         6aS4n1cFlWV7r735aJRlUUVKvHGVXwjYVi9ww7+60PISAYa+dyTPK1eNWWXt2Nt4Si1b
         DojINH22mYjydkP+uXA2P+JosyHel7uMcBRtSEfE93O/KQ+5bTtT8uf9ycSxgU9QKqMe
         ieWlCbS4BE9Rb5Af5NB7X2lYygTRbhpgy0IGo7Z+K812co4BN9lcpt7hhxBe7IzWyyOv
         qouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yN6GVXYMimUYNFrO4cII2EkhWQB7GrngwFKP61yEl9g=;
        b=rsO01VRass2fmIQdQZWXJO8kxGKg+77+ldBbL47lQ7X0lYcuFk8bZALBOUPSXHGA/W
         d9k1d4y7HqAPN5rCqv3UyCNhfoNfXH9OEYM4QQAExWLUK6dBoxZvG5VC5AN4HqtIxsYE
         qZqkXZjhb6O+urPtmSjNNsKtLfigHO2XyOjez+AemnCyqDySrykU64tKxF0mGpbo6LCK
         BgCfquW40eK/GO9nddqnueznFarmLXmmj8e2udNDmV76LoFxOXxuUFGYE1NUgpwuiWFn
         bu4CsYm1EfzAtsP2nN5Q/1TJ06JqDAQ7nSWU1chJZdLOCy9RwRyzuQHIGqJFAicaQXYj
         Qfcw==
X-Gm-Message-State: AOAM533ghhRDTq9Bv2Ux1z/zsTc/g+GEPIh+9Hfk8kf03/kJNDL6jZGH
	IZcRhBNe2emyTWfhuW6DY3J8fTl7B09pyZ0WwOQ=
X-Google-Smtp-Source: ABdhPJzOBNO3+a9cuuoVfFQF2PpzQHmZil0LJ73fWGuGHVBypIUBr9Ew9o4SJP0ck/V8N8164DDwoQ==
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr25494659pjq.228.1622557159433;
        Tue, 01 Jun 2021 07:19:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/26] image-live.bbclass: order do_bootimg after do_rootfs
Date: Tue,  1 Jun 2021 04:18:11 -1000
Message-Id: <4bc93b8ddc7bad210a5816eabd2e3e37b4afa6c1.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guillaume Champagne <champagne.guillaume.c@gmail.com>

do_bootimg expects IMGDEPLOYDIR to exist, since it stores its artifacts
there. Therefore, do_bootimg should run after do_rootfs because
IMGDEPLOYDIR is created before do_rootfs runs since IMGDEPLOYDIR is
contained in do_rootfs' [cleandirs] varflag.

When do_bootimg depends on ${PN}:do_image_${LIVE_ROOTFS_TYPE},
do_bootimg is correctly ordered after do_rootfs because
do_image_${FSTYPE} tasks are added after do_image and do_image itself is
added after do_rootfs.

However, when do_bootimg doesn't depend on
${PN}:do_image_${LIVE_ROOTFS_TYPE}
(introduced by: 96f47c39f1d17f073243913d524bde84add41d8f), do_bootimg
can run before do_rootfs, thus before IMGDEPLOYDIR is created. To
avoid this situation, do_bootimg is now explicitly ordered after
do_rootfs.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73c21db8e54002b300ba4972cb49c0577acc5406)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index e9eba1fc4b..2fa839b0de 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -261,4 +261,4 @@ python do_bootimg() {
 do_bootimg[subimages] = "hddimg iso"
 do_bootimg[imgsuffix] = "."
 
-addtask bootimg before do_image_complete
+addtask bootimg before do_image_complete after do_rootfs
-- 
2.25.1


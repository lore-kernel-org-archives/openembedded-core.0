Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.20436.1594649847832674553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OkA/EaoZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id a24so448435pfc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=99hkkYy2rGRxELC1Pi/3tEyqG7uxarbX3fULgX8SAi4=;
        b=OkA/EaoZ9ynOumnx0JF4urnWxDppbXUvDOUIi2S8AKrglu0jsX0o2OpPH+GAZjUI9h
         /OmrGOYoHeRwZMj8UmWVs17F9b1tkWaToTyPaM7+ZnU5da9QZkbjlqnQhidMecJ97ObY
         QzR3atTq/BsgpmrhoVZzN/R+auc2LufYFz2m/0gcfOv69uqATJHvuUqNH6EDt64kfpdv
         tzW/HFoyuL+y0/Bkkji7A/AzIB/vkf3AYIu92UdpOwvcVP03RBT6sESJuFBzziEYgrx5
         GAjv5NhqzfTEZEQ1vaFmnSCqwkGuzzcUuWwDrWofUDcAhOOUzxUUcijnu0EDbvYbkGUH
         ed+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=99hkkYy2rGRxELC1Pi/3tEyqG7uxarbX3fULgX8SAi4=;
        b=glUo+OSfhtJ+vOre8Yhp5BJLj3PcCWbc4pThzfoNbhb32BmY4ltqnd0rtTzH+l4SQ+
         Npye8gx4WxZZdKhCiSdYof0lNxabfcE509VYKeZqadrKw+LGNp8LCGy5iRyRChdF9/zG
         KtqarCVITFvXdsms8jS8lL35ArGg/1vWlrCUhnh3mYAj0HTLbnfSN0lMmxh+eIY/NIk6
         4UQA9znUvNCRO6lVaViTbV5puDY9H9OfJk14ovG+/qxtwUcmttY2tualsTWl8MZq/8AK
         MrOa7hT4q+agY5iNRbAivZ2L7klqHb1uUI6FUPqFhNuWCKpqnmgqFOS+ezX3Bfy/vj+G
         XdPQ==
X-Gm-Message-State: AOAM532cD21vvxErNqdAl1TGR6SyfhzueAfMrVrFHj9NU0JXLfsYfHMO
	DMQj56d1R2Rq07r+r+5S4N3JOsp2BH51kg==
X-Google-Smtp-Source: ABdhPJyWbk02qJXS00ftyxOUXGgpREpMRdoQHaYTxNvA5E1hYOeOB3PuIcnQUF3ZDMKe/XO9JjAZRQ==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr66842919pgk.434.1594649846938;
        Mon, 13 Jul 2020 07:17:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/15] classes/archiver: run do_unpack_and_patch after do_preconfigure
Date: Mon, 13 Jul 2020 04:16:51 -1000
Message-Id: <b6d4176f82b9728af91a4b982ca25fbbee5f9890.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The commit 8a7c779487 ("classes/archiver: Create patched archive before
configuring") fixed a race condition when using the archiver, but
introduced a bug where the GCC source would occasionally be deleted due
to the archiving code running before do_preconfigure. Instead, make sure
the archiving code runs after do_preconfigure by making
do_unpack_and_patch depend on it. This makes more sense anyway since
do_preconfigure is effectively an extension of do_patch.

This fixes errors like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4be264061023ae0ea6e023d82a7b99605bfc22c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a8d3afcbe9..bf275f4543 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,8 +583,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
+addtask do_unpack_and_patch after do_patch do_preconfigure
+addtask do_ar_patched after do_unpack_and_patch before do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.17.1


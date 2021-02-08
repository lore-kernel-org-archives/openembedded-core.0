Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web12.35280.1612792555910670967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S4Dky0zE;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id y21so3441756oot.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oVUAEihSTW7DavbvTXZIz39ccPjPzZE8nTLelVnrMUo=;
        b=S4Dky0zE7AS4Y4kfLN9iciMlNME5GOp7H0gwsN7QiowHQL3cn7N+ds8YvREd/iYF0U
         XzFhYCkZBulDbdPKLYa0roxZrvESPWh942eZ3L+ub2Xq+444ryj9Fp2AtqiGyHxQS2G3
         pLHcgLVAw98x58imfRngm1TOKAVM8EaBb1tnxF5f0G1Uw+zhii95Rp8Hw6jm5BcS5Xls
         0VjPEEJawT6Qxo2gisTYK/hr4lUes/AdL7CYPDuAMZwpxtROH4UVa04na8RrYxbkD5JY
         46MaYVy5xxMHZcivJFqppBloCEdv+fJ2k5v2cqAfSScs5edtS5+U8fpigUEJYVQB+wEk
         3jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVUAEihSTW7DavbvTXZIz39ccPjPzZE8nTLelVnrMUo=;
        b=FmweZPpzG9EdsDL0OIh46MTXaGYTQ5V9EXGT0yi6KKB44J7iswd4o089LmFb3vTOYT
         VLrmAoJIGwFXWdLP1QHjFCx3L4DiXhMT2Oy+AQojt6g7vcU+5ADCms6PzbRws2Utfq2E
         MgksBtmSxWr22tr4nv9s+OXlLYrgH607yIRfvuKOP7BVmOM1pGPclCPBME7s40NGkd8F
         2LfpA2CP1Z9Xm66uTCIHZiC4gqIScSJYNp1mG32rbU24lZEo9mJJcOL8jAyAqu8yQjnc
         Cz8aY0JKYGDBLGq5BJt0vgDepMShyAo+LH3s11ibmFrt4j8Ly/hdgAY9lIo3URg9SJaj
         Z+Yg==
X-Gm-Message-State: AOAM530O1XMFZQCwbWCuM0F3fiIf4ReBV+FQBkmI5mWPuwMV+xNBWEJV
	8//zXLkVk7Ocy4k3TcOj9yhEBfwDGmP3oqrAxLY=
X-Google-Smtp-Source: ABdhPJz4ciKGMQ8iK2gB8o2lJcFA1f6FlzvZ3D1j+XqY2v/ITbUQ/6u35Dh/4lMGhwmgKY1OlQ00ow==
X-Received: by 2002:a4a:b1c4:: with SMTP id j4mr4969573ooo.78.1612792554848;
        Mon, 08 Feb 2021 05:55:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/28] classes/image_types_wic: Reorder do_flush_pseudodb
Date: Mon,  8 Feb 2021 03:52:18 -1000
Message-Id: <651334114ccddad02eb3b5fb4e638b32452e50e6.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ricardo.ribalda@gmail.com>

When IMAGE_FSTYPES contains more types than wic, it can happen than the
pseudo database is not flushed properly.

This can be solved by changing the order of when do_flush_pseudodb is
launched.

Yocto Bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13898
Fixes: dde90a5dd2b2 ("wic: Fix multi images .wks with bitbake")
Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 445b0a9544b55735496bbb23dbff3399b3b9e9a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index f6c8d8995e..ae00acc5ea 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -151,7 +151,7 @@ python do_rootfs_wicenv () {
     depdir = d.getVar('IMGDEPLOYDIR')
     bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
-addtask do_flush_pseudodb after do_image before do_image_wic
+addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
-- 
2.25.1


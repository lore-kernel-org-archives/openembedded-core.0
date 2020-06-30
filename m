Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.7647.1593486312251915954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uwGklizj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id d6so8863298pjs.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6RnA3+/VoSsW7uT8wqxqshnb/AC075qQ8voX8u9BQGw=;
        b=uwGklizjeMTCXXTCdsXhwtyxK1WLmKXX3zYQ5up8eX7NAR22dSEcboHlH2OxaGoac7
         Tf1QkA0cfJIehDtU3Uzjyy0DYSfdJFJ8jmWayIO/RvdhUCBP7q4VYzTAuqYIf7/PIHn/
         i79vWI1lKKfxdHbti805DqKTMGQ2q8A1FQWnAUrjBEJjJ5eBk2B1rTw9JwRgY1f4cDKg
         Pe8RIb1ma+/HVSOKKIRPFKp8WA6HB0tRhb7IrESzHJ1HEdJOX0KNXKiqnpFFumNv5BgK
         fAXSv1RrT6gIKUVTp2NGHySv5Kof/IKdVhIHaPuwXYImVCVWh9Y1O0EHY5gl4iK6IuMx
         j0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6RnA3+/VoSsW7uT8wqxqshnb/AC075qQ8voX8u9BQGw=;
        b=oljp1YwV55c9zsKBgP9+bf19d/tZQP4lb0WdwTVJMVB4Q7UUG8ZAZWgFKiZsjmXIIq
         NfTqnxISy8uD0q5K7fcJz7F4tGgl20hzH9xeImbbelyQkA254+FTlJwKxYVM5wJMzLAo
         ghy6pgknrZI87OBl3/DbB6UgRRdQSXEl+xy+OYAsIob+580NCBbBmyRH2IrNcJpwrL4L
         rsRJA8FvGGU8q6BXELN7dVrQtb82LdnBxKc7p4tB84TakfWDdaAcGEUgxsJ2I6TFCC1P
         ll7x4xAynaJzMD0ltcndm83PiX8oTF4hY9k8IpPuGOLk+5BMcRecV6bGhaQmc2qEra/S
         zpOw==
X-Gm-Message-State: AOAM530i/QaetwAgYUwLn5Y2UeT6d8fwukN4rvKOQDtHJj+lsEPYXJfl
	xZUzhEsueBZ9izhEy+WRxSE/fi36sTSk4w==
X-Google-Smtp-Source: ABdhPJy/+HFRCwopEOYqo6Gu+6unHB5uh2yfVR1B4AHv0JKB30G4bBvSziCsQt6DtmXaxMV/jGD5jg==
X-Received: by 2002:a17:902:8210:: with SMTP id x16mr15838765pln.244.1593486311360;
        Mon, 29 Jun 2020 20:05:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/22] kernel.bbclass: Fix Module.symvers support
Date: Mon, 29 Jun 2020 17:03:15 -1000
Message-Id: <e96d99824f085644162fe0599988a3408eab90f8.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Lili Li <lili.li@intel.com>

Starting from v5.8-rc1 commit 269a535ca931 (modpost: generate
vmlinux.symvers and reuse it for the second modpost"), kernel will
generate new vmlinux.symvers instead of dumping all the vmlinux symbols
into Module.symvers in the first pass.

Error log:
    'run.do_shared_workdir.16614' failed with exit code 1:
    DEBUG: cp: cannot stat 'Module.symvers': No such file or directory

This change will check the file Module.symvers existence before copying it.

Signed-off-by: Lili Li <lili.li@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd2d62a08a1dfcd890a03ee55132b6d6c65f5ab7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a3990aaf59..6d07b29e2d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -463,7 +463,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	cp Module.symvers $kerneldir/
+	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.17.1


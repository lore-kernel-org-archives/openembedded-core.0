Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8346BCEE32F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.21046.1728490629568275097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 09:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hcKjhHbf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c71603217so6247945ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728490629; x=1729095429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIU7wkSDwxr9ueCFrQO/5RlsQM9K6C4NSH2jEEkPUkA=;
        b=hcKjhHbfJslqywtBH47P5iTurELUgYfTjdcbeEmrTmLGqUdf5wb9I1uoGqmGAV6kzl
         QjAIjjKO8/FwILX0SRXuqeD5Ajt/gFjuJ0ZoVMl0GpvmdNw6X/51pJ0gHSqoMD0uiIqw
         wH4pHjd8j6PBc40GCDwrKyKm1Fp6qbluMo7Lwcg/XuXh0L57EIVCc5uvevTRiWfhhuIe
         0YZ+sYZgNcME+3M86EUHT7HtVLl0fb8b7cfzrG+G5cFztHQ5S+/U7PEwxEQ7mjvDmCRv
         XtkU89hjzJu1c6RBhgKEQT0k8lcrye8c2GsQ9WRPp43/6yXy89ypmINdL1vJ8BVaXZLO
         DnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490629; x=1729095429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIU7wkSDwxr9ueCFrQO/5RlsQM9K6C4NSH2jEEkPUkA=;
        b=QKdQIYAZN/tXxZmp54A8vRMTVCJGiiP8hwVILV/7zk/VEcmZubzfSotCsAJ8My+6aF
         lJYGgh95vxfCjQIfuBOb4QRtgKUY/BAoRWt/ABI4LBlDXgCT/eOXaYOqQ0fAstkYsG3Z
         RRSnKK+jruMcZegJpLsF9WF51B7FFEpm1EJBsPUnlTycovn0BogataHS0ahgakS64XSS
         8J1ONL5aGy0be8lLoUUo8WmhGoUQAbzG4y1aq+r7grmSJYCNM6HjQTWHeC380XSEaK2K
         ww5RJkJr3XVRBs5qvqWjUQzfDGmFQ/rHr5YQKg/GOswDb6dPwsnGEUBzqeGRSJnS4WmG
         CwVQ==
X-Gm-Message-State: AOJu0YzkHriDSvVzSN9qTkQKmFenSWnPnY6ZuMIjCdqa0JyHReeYdj9N
	+0a/Zf+HjUsqvblbSz0m7FGUg+vDD1UpDy24dsiCjIfUt8KFRVR9Ld65uuuplMznN9A1iUY3z7h
	y
X-Google-Smtp-Source: AGHT+IFDfS31vltjbV48T26nkzCOFc7kT5SN6XiUCdSLsV9buIPV/aJT2bkItTnJcpxOE7kJtRAFaA==
X-Received: by 2002:a17:902:e84a:b0:20b:9078:707b with SMTP id d9443c01a7336-20c63744f17mr46887535ad.30.1728490628517;
        Wed, 09 Oct 2024 09:17:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13934817sm72545045ad.158.2024.10.09.09.17.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:17:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] cdrtools-native: fix build with gcc-14
Date: Wed,  9 Oct 2024 09:16:54 -0700
Message-Id: <6fd1bc0620e6d6ce9b940eaeb68474f4d0b9369b.1728490465.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728490465.git.steve@sakoman.com>
References: <cover.1728490465.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205364

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
http://errors.yoctoproject.org/Errors/Details/770525/
| checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe ) works... no
| configure: error: installation or configuration problem: C compiler cannot create executables.
| RULES/rules.cnf:70: incs/amd-ryzen-threadripper-3970x-32-core-processor-linux-cc/rules.cnf: No such file or directory
| make: *** [RULES/rules.cnf:59: incs/amd-ryzen-threadripper-3970x-32-core-processor-linux-cc/rules.cnf] Error 1
| make: *** Waiting for unfinished jobs....

where config.log show it's caused by gcc-14:

configure:1189: checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe ) works
configure:1211: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe  -D_GNU_SOURCE  conftest.c   1>&5
configure:1208:1: error: return type defaults to 'int' [-Wimplicit-int]
configure: failed program was:

main(){return(0);}

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 094273bd7d1768e14fbdcd2f239bee14c630a625)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 757132eae6..e19939cce2 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -16,13 +16,17 @@ SRC_URI = " \
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
 SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= CPPOPTX='${CPPFLAGS}' COPTX='${CFLAGS}' C++OPTX='${CXXFLAGS}' LDOPTX='${LDFLAGS}' GMAKE_NOWARN='true'"
 
 # Stop failures when 'cc' can't be found
 export ac_cv_prog_CC = "${CC}"
 
 inherit native
 
+# Use -std=gnu89 to build with gcc-14 (https://bugs.gentoo.org/903876)
+# this needs to be after native inherit (which sets CFLAGS to BUILD_CFLAGS)
+CFLAGS += "-std=gnu89"
+
 do_install() {
 	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
 }
-- 
2.34.1



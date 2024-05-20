Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22407C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 14:34:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.61891.1716215675020985195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 07:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNw1voMD;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-573061776e8so7562616a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716215673; x=1716820473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/D8c4Im3BVJHMzpaGlg5QDAfqris7J9l5EwuI/Oz84=;
        b=YNw1voMDPN2Q/BtjxILU8UOchjcxqAIXh9DLxfrP9bf6s+moZezn4wHnADLFxoLjeE
         jq0I4hnwuWoImSvDfOndu4UFyS2ib5f4i7m/559q42f97qKEeK8J519hBqN2auK9RNNO
         uInhkiLFFb8U94f7N8ZQNIUcl6gVdP6M7EsB1j4M97xUp1yvLcE+blMgRBv5JE0nCQuT
         NJIzZzbyTdPOGr4L5AFLzCccz4jJGUc+wz7vS3TrvHcpWRwwBcotgYO2o9onBO/SQJPf
         L80MrfURVQqbbdC9j7id3PyhuwBqzGp+KeoszHn4TVYy4/He+zQa3uTrVvwLOZDeGC2v
         6oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716215673; x=1716820473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/D8c4Im3BVJHMzpaGlg5QDAfqris7J9l5EwuI/Oz84=;
        b=iBy/OS4B9tFoDw56i87VJdYCyNq1KsjJD8vaw94P98d6DyeB6a2KWyffV1LM5CnSKi
         1yh4Sygt7e9FhzDURpv4sQv7CIk9wWUY7Vd6JH51ftExQoVJeWQl/sffrylU63yWOrpU
         25Ba7BUPvnUKF4kahQTcZcn3yxZBO+AGzo9taROboLcSDB0fRG5qHJ6Uba4oQW1FpcLU
         rDDM+/vJc0di6LKr9pe1yS1FrpNa6psPL/AUNDQRYR0jMBF0LMjoJ1kglHk5cbHrRbHv
         z+s4vnpZaWWRhSepb0uZdiWjw5m/5IfMqdlA/nBg7S64KfEXe675Lp/FIuzogO2Sf8m0
         wbgg==
X-Gm-Message-State: AOJu0YzKExD9sFFvEppEIhU+YZcgBltUyeATMyhPD+ECgA/awAeEgpux
	DogerB/u7HPoxhEeIuO73rahkdL42wGTduzhHFXgICmf+Fee1fQfy+GsoQ==
X-Google-Smtp-Source: AGHT+IELbgndTf8pmTeM7CZdhQSLIpJx4Ig1gxVWawPb//Q0ZpoF0mejeJq3nCIMLDJhAprCpejnaw==
X-Received: by 2002:a50:8d18:0:b0:574:ebfb:6d93 with SMTP id 4fb4d7f45d1cf-574ebfb6ddemr11068587a12.10.1716215673058;
        Mon, 20 May 2024 07:34:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323887sm15173565a12.89.2024.05.20.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:34:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] cdrtools-native: fix build with gcc-14
Date: Mon, 20 May 2024 16:34:27 +0200
Message-ID: <20240520143428.4168152-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 14:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199594

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
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c..239b351933 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -19,13 +19,17 @@ SRC_URI = " \
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
 do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
@@ -33,5 +37,5 @@ do_configure() {
 }
 
 do_install() {
-	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
+	oe_runmake install INS_BASE=${prefix} DESTDIR=${D}
 }
-- 
2.45.1



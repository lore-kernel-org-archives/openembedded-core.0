Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A38BC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.55033.1718625953861545829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h/Q08obp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7046211e455so3059889b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625953; x=1719230753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sASjh3Soqh5J5COhjkUwXLHGiMvpqBDrZBz1W7eNH0Y=;
        b=h/Q08obpIuILUnyVvOiHiEYR7IDCZPDmS3UJ3uu1lTc4gxbEB3qWeiNIJQo129lwiK
         aRMX69/0glpmPg9jpFOYS4ZLsHvpvCOApUWB3zD5P/miQj2nQRAH9GqqxRZ50GRMeU2X
         oO5V5OfD1AT+rAkat+rzFPljGLR2SCrU6wq/gXfWz9P+n0X6zJl0IoFOgJyORVb0lSfj
         SULSSAr4xqDb61WzlMXd+pW8T8we9CRHszzqasmPOQUyPdyjaeQLhTDTIQvljbWZsiTq
         eu2+isvO+HotNzKRiHqwboKLkBEiBODRHZvcdhXNcLGfDE2pb8qgWK0/nMYrj60JGa23
         B+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625953; x=1719230753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sASjh3Soqh5J5COhjkUwXLHGiMvpqBDrZBz1W7eNH0Y=;
        b=wVQEgMK8lKE6uumqjEaBSLKp6olOV34Z2LoP55KqWwBKyRbEFMXK5ZmBgQVdlD19Tj
         yMZYaYFE6wA057V/NANmEMb7scloVkerYHB8xTTBslkCofwmoyx4pqUgfOq3t3fbVow0
         7ZvaGNlcdYf2fkmNE2AL4DSlEoewrNB+ABlp3b4v63oyLLsmZzAUdn/Adou0o1HkIqYP
         34C3OQPLZx1qvrMqHOcxSrTnShdXZZEUh7ZkdQYf8KMQeknMiJsSIMIeIcbL2Tk+QJ2/
         B1bRl9AY8vgYjseFhVcWA2MP544inC8W2kNfVlflaEEgw4R7eoTj0Mzi6j3zOgxsXWeT
         UVtA==
X-Gm-Message-State: AOJu0Yw6YUhia4lR8GP9EgIkGb8dSB1qgCD3gVUyIUfGr3N8U8G2lJ7x
	qJ0mSnvCOa9nWZp8hwUdFY3Ikz52Eb9gVKrXUTGxZHaeQMsbUgvLuAx6Bsa661SqIVK1DaETcCO
	y17A=
X-Google-Smtp-Source: AGHT+IH5no8pRPIPKXg5JpHsgcyYf8orjSu1vr/wmJBB/FniDvOJDpsAqB0hhKbxRVrKQSppYWTXjA==
X-Received: by 2002:a05:6a20:748e:b0:1af:9ec6:afbd with SMTP id adf61e73a8af0-1bae7e3cbd6mr9800191637.11.1718625953168;
        Mon, 17 Jun 2024 05:05:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/22] cdrtools-native: fix build with gcc-14
Date: Mon, 17 Jun 2024 05:04:56 -0700
Message-Id: <2297334257e102f33a6ef8c116896e159d35e1b6.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200829

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
index b9cb59032a..ca9fc5988a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -20,13 +20,17 @@ SRC_URI = " \
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
         # cdda2wav does not build with GCC 14
         rm -f ${S}/TARGETS/55cdda2wav
-- 
2.34.1



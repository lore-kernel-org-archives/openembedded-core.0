Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D93C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 06:36:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.13487.1716273362371202403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 23:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W771Fquj;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-574f7c0bab4so10610068a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 23:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716273361; x=1716878161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZSZ0rvRIFtGs2YQDdcH9fDoEy2APPMu65DJjHEcP+I=;
        b=W771Fquj7dhrwROPkJLhroYcssmxEq5FqTnHikwyoJtuO5b8Ri1io7LD8WF1S4NnQt
         iL80BiZmtKMQp74rmm5KMXk+dMzl5m2mItq/NaG5r7HoptKolXfClaWGfWyITjqN/ZHk
         5yl48tEYllUmA3UHdMAcm6rLVPjlxKLU2LyN0DVkmER10aUF4XgTAOytd3f375ceqrx9
         SoeRavgRbj6OyNuBGUJ2MWm1ztrwUBFNLaGtv7Mrpa/4aEtsEor0BmEEdjyvh4tFs+TG
         CIAG9xkFKIrsM0arFiibkO/JrJarAeI68zKvC38wrSNJXjjryJZpqvP1gZXiEayC3PEq
         cLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716273361; x=1716878161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZSZ0rvRIFtGs2YQDdcH9fDoEy2APPMu65DJjHEcP+I=;
        b=Q5Sp/X/GwBodO4p7/ihGoijnax7CQ80JqcX31OBJWpUJdZWYcfWDe4xtLwh/EdXB1/
         8/RusTMvvPnWmXK0bkfg4w7t/oCGP8eddh4WY36ZwfxWv+3JIQPZFzpZpAi7fEbxLIze
         bIq2R/Z9bAEk1o8YzrgTzTh2LNKX5XHadoirwM/QjFhoi3G+iVORKL+CKVeM5cQgiHBF
         fJcaJpJoDRXsO1zf7zaqdLRs1nFbAX3uqjp6sh9qBZs3DmVw9q+xRiyL908SeSEA5OwM
         0Zet3WEDnrzR0gF05tptKrE6hZRXorxZe4BTlPZMSyAXqglj5gk0gIip7NwGgGZVpUUM
         DCTA==
X-Gm-Message-State: AOJu0Yx1u4aDwR3KIdCVGz8dp7oEEa+orTYUiow4LS6um2siuU2fJKWS
	MueFQsUo/KZFikN3cK9E3XRFkQay94LLgXa+tMR6sCE6eJzzm0PvOGgpuw==
X-Google-Smtp-Source: AGHT+IGs7Ul0HeMesnwbdHbKpFwG9eJpDTRWFitoI74Y5Xvwx8kIz1frl3MXT/XAHMy1ytUhfAn2sw==
X-Received: by 2002:a17:907:868e:b0:a59:cf0d:d7c8 with SMTP id a640c23a62f3a-a5d59fa1367mr795561966b.15.1716273360511;
        Mon, 20 May 2024 23:36:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d787sm1591061966b.11.2024.05.20.23.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 23:36:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2] cdrtools-native: fix build with gcc-14
Date: Tue, 21 May 2024 08:35:57 +0200
Message-ID: <20240521063557.202491-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 06:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199603

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
v2: drop last minute change from make to oe_runmake in do_install which caused INS_BASE=${prefix} not to be respected

 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c..0fe661ae6a 100644
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
-- 
2.45.1



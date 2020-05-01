Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.14336.1588351566662881878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 09:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=alZoRP9Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 188so281404wmc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2020 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yM5IDgkMprS/cXwjPYQvRipPK0jDpJZu/bFjbJu4a24=;
        b=alZoRP9ZNg1CAugXtPomy8CWZrHMmtOxqkMz6h1r5Sn31XJTBvBqjW6RyfkETzIE+M
         7Pb3DDbPHYGUkDadUJt+foG7lnW+1PWlK3tliovmoz8AGX0WqLeuV8F6DaON2JYS5SBt
         So0evVLAIeMI4t0ZyJcPwJunP6jGUJEcLNS6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yM5IDgkMprS/cXwjPYQvRipPK0jDpJZu/bFjbJu4a24=;
        b=H0IQtaoXxfR0pHGCiu5y6kQVZUWTFSovTpDo74IsoG03Fjh+1/fBIUNdU6Ix8umwp4
         ypHL6SUxXZ5xrFBdFVjiMBgDTlpCb23Ij1ZCRfZfNppH37lIrzqxgbqpWQQwFhehLsNY
         dJJXXCoMc+PcPLyMEVzkLqkwS9K+kotHdtIIIWv0r0WjsbaFBZFVgWXPvhazq01kACPv
         4fIMR3enSEWOwHx8QK5zfpUVgr08NXAzXsaJ6fjWHxbGGbi4WIEuifqLFYDgOC8BoSDm
         nsDjqHUCxeQtU2A9iHQkK0CnPusXdbqFbEOnyLVAoJN7NoIP1e1wKk82/tw9st3wbNtM
         zVSA==
X-Gm-Message-State: AGi0PuayvKeLKk1XrimzRONW2j0/jb97kCg+ExkNLDVvXBGclxjv80ld
	La8zUKw9NE6X2lDMTm+aCe7vmMsGkC4=
X-Google-Smtp-Source: APiQypIgAeK0huFsQOeOf1DVcayoXMgURigGW1ccLLnWrkwBMS/yJrywVjpGW96oNs/EB4j0V5zfDA==
X-Received: by 2002:a1c:492:: with SMTP id 140mr404007wme.9.1588351564263;
        Fri, 01 May 2020 09:46:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z1sm194318wmf.15.2020.05.01.09.46.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 09:46:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native
Date: Fri,  1 May 2020 17:46:01 +0100
Message-Id: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A nativesdk BBCLASSEXTEND was added to gcc-target without realising this
would pass arch=native through to it for x86-64. This heavily optimises
gcc output for the host its running on meaning it can't be reused via
sstate on other machines.

Add class-target overrides here to get the desired behaviour. All
targets have been covered for completeness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 8cb432780f5..6263e814971 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -15,11 +15,11 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 ARMFPARCHEXT ?= ""
 
-EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
-EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
-EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
-EXTRA_OECONF_append_x86-64 = " --with-arch=native"
+EXTRA_OECONF_append_armv6_class-target = " --with-arch=armv6${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7a_class-target = " --with-arch=armv7-a${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7ve_class-target = " --with-arch=armv7ve${ARMFPARCHEXT}"
+EXTRA_OECONF_append_arc_class-target = " --with-cpu=${TUNE_PKGARCH}"
+EXTRA_OECONF_append_x86-64_class-target = " --with-arch=native"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.25.1


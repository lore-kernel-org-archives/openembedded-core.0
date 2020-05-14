Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1743.1589477413855489183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t0B5f85G;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id r22so1505740pga.12
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jFoPh+UGQSUISx64wrBOcL7sErElbRrUPNAR/DEbcw=;
        b=t0B5f85GCVWRCoMAayUSmIxnd+WqoyBOh7bU8YbCvjThBIzLd0h7qL0D0snvw/T6Wl
         kApbBwQa83YlX1I61Hm60o1vSuvSPsrfAImm6kRVM02YB5Vr/nRb7Ec551ffZZn03TIl
         Hip7+d5FdlVJWnXjIiNhLtqj54h22P1v+K/Dg287AZ5U/Ak/FyC4/nDsWKj5dCqr/ms4
         r8867LPMzpdG/eI0taSOd8+Y5Zii57fGhRchwsgcv07oZfuazyh0ZVKEAWXgZjZiCnBw
         Ue0DKjqFdvmwoVIy1zxV42exm2JIWFF0NeImU4WJZ2GjmNbfqvFwc5q/bRnsYELejZZ8
         HhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jFoPh+UGQSUISx64wrBOcL7sErElbRrUPNAR/DEbcw=;
        b=HgdQdSpqAxU7o4bEc+ZTb864/1eATcQVVBUS9xzssO+JC9T0oUx+432KRcVSgcux/S
         ln3ykUeRj1ED+kKWvAqq2504t3AUxvx3Nb5QhDDyRRneTFXPo/FQKmHZZsieju2KMiNy
         HYIXgHXS+XHfm526HzYR6OyF23YhfBm3qte6a/p+Ago8oUtHz0UVD+RzstKTEpkeDfUR
         Z27N2WXlzoMLoCOUXRWryCpFpCgkPcV5wtxHwWKCjRLiG8mPYk/qn/sxUP2fAGceEbbE
         hJz7PM/B02NalTY6DKdtX5Vnd19/9pML8fLQHuIk9Uw+b2luTFalP2HrxsJjK4T9rjZ1
         af0w==
X-Gm-Message-State: AOAM531xB+7n7w5P6r+H/XCF9/fTacpmNPtwN5KIBdE2z7W2Py5YWze7
	s6kwV7/uy/xN2UBAj0NoOKVd9vK1LEk=
X-Google-Smtp-Source: ABdhPJx3648141I5Qj4ENrq3BGyTOe3vMkxEOrmqn5+GK4gZYMdb83UfmjzZB5tIsFbaNUHMldgiUQ==
X-Received: by 2002:a63:b91a:: with SMTP id z26mr4851881pge.444.1589477412777;
        Thu, 14 May 2020 10:30:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id a21sm1977460pfk.32.2020.05.14.10.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:30:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] valgrind: Do not use outline-atomics on aarch64
Date: Thu, 14 May 2020 10:30:09 -0700
Message-Id: <20200514173010.3407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids the __getauxval undefined reference error seen with gcc10 on
doing static linking with -nodefaultlibs, which is uncommon usecase
anyway, disabling outline-atomics is not a huge deal for OE in terms of
performance as we already use -mcpu which is tuned enough to the SOC the
code is being generated for

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 7954437a1a..25837e4b44 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -74,6 +74,8 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
+CFLAGS_append_aarch64 = " -mno-outline-atomics "
+
 EXTRA_OEMAKE = "-w"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-- 
2.26.2


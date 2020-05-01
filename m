Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.14337.1588351567012124451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 09:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z9BaVnYq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id u16so275495wmc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2020 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yC0SjB1wYWZ9r3Os9gi+MLx04M2brVkffXH3C1UpYWs=;
        b=Z9BaVnYqhDCXf+Nh3B1N1182NWqnz1F5KuCeB6ogZschT+AHug3snqcpEuqYzEa6Za
         tLCIVQsa7N1nIW+/UpazE1HiFQiEuf8lQTaQRbXM2p68nQRwfaWjdolcZ9OcK86m41BN
         UrSEqGCwvAca2G5xU4VVKKQKEM4aEgHUTg34I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yC0SjB1wYWZ9r3Os9gi+MLx04M2brVkffXH3C1UpYWs=;
        b=cUeRHn8u7MhI98Gv86AESl8+QrSDbIil+5t6QEro5tUGQCcgszlFsLJmYDO1gp3Pso
         D+/rGCYtr4fPd/x4CXMN5oWhzyCBrXZpSCx9Z/XITu6nRc92guYNF/f3BMTrgw/HS40g
         NZKyAhQu/S930iobo8SJDo/HT+UtA7aq3/XQc4lf0/5KF5W7k/0VigVF7Hhd7bYJmubK
         LtfYpilIEgadgDWiFWpiOOxuwR8dDcWu05jrBBwQjAlnSH3e1is/Lcl5ZeXZVdIhIl4l
         uUOCAccFkaZ1Km0wZLYcVjw/bmB5jLUVd3sWS88GLyUgCz1yIuTcdFwKQ6Y8nWwrdVEn
         yIng==
X-Gm-Message-State: AGi0PuY3GccLOtYjZ39xTxM0bvw6U4P1wssx22stOU133dXYAwTtvzrc
	Or1lRljhXGQ16JuVqDWbkXGY6uajkr4=
X-Google-Smtp-Source: APiQypJTxZeC9joa6IT7EI/wJEt8vxEYX2jzLUv5ET3elMuNPTXVBER8H5RuhC5mP8xMv3iuI/K6cQ==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr339315wme.99.1588351565221;
        Fri, 01 May 2020 09:46:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z1sm194318wmf.15.2020.05.01.09.46.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 09:46:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] abi_version/staging: Bump versions to force rebuild after sstate corruption
Date: Fri,  1 May 2020 17:46:02 +0100
Message-Id: <20200501164602.1540633-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
References: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A "broken" buildtools-extended-tarball has been released into the wild
where it is optimising binaries for the host processsor. This is fine in
local usage but in a non-homogeneous cluster like our autobuilder, this
results in SIGILL on other machines when the sstate is shared amongst them
and is painful to debug.

The buildtools tarball has been fixed but we need to invalidate the hash
equivalence and sstate data. This change does that. Adding to OE-Core
rather than autobuilder local changes as its good to illustrate how to
do this and the issue is potentially wider than just Yocto Project
infrastructure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 1 +
 meta/conf/abi_version.conf   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 5b04f88b2d8..de3a19815a3 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -93,6 +93,7 @@ SYSROOT_PREPROCESS_FUNCS ?= ""
 SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir"
 
 python do_populate_sysroot () {
+    # SYSROOT 'version' 2
     bb.build.exec_func("sysroot_stage_all", d)
     bb.build.exec_func("sysroot_strip", d)
     for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS') or '').split():
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 2bdc55695bd..e04343b47c1 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "12"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "1"
+HASHEQUIV_HASH_VERSION  = "3"
-- 
2.25.1


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C26C44501
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139213.1783291373051416385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aCmQqYP/;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2022225f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291371; x=1783896171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHCjFrtkTJ+pFXPodu+00rA6fg82rTwULQEtrOQyh6c=;
        b=aCmQqYP/48pTznem92Pl6gGZEMt93x0aCsIr4u0BmWw/NyElroQD7uW18O7AomBSlz
         r1jl3ZIwpyGnElalTHRrWSfZPiGvkcM395O2rBCw141GXeEInMEkUqMEaXcfd9sI/qTt
         30Iw1eLsybi9ZMyOA3Km9HGQiMINk3y7EMG4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291371; x=1783896171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHCjFrtkTJ+pFXPodu+00rA6fg82rTwULQEtrOQyh6c=;
        b=ipCZDFWqb4xt2BifDecZGZvRB50SOicCg5J+Up4MScBFD4PS9uq3GDswGLXcS2HoC3
         eOuvGywBZi4Wt04S4/eXcoo2h//ao+VBXQ3NRLX+y8OKZxEaN1HvJGQT1X58tV1SA18l
         HZixcwrpkYFMQgf77gUec+xNEcjQNx+5HbVaWLQ6VWwJrNQYbJIZpoz4s6K5lUQjBms5
         OVyaRwSZ1JI/yTBWefLCl2vRyfN8ckk4CbrKG01eiR8sT+1mIUmS11OPBiBjLeT0Fve4
         aPv8Vx6udl7YHmFySuS/yRiZFF12WEpJRInLYxf/C00YOpkBkmLKUegrHAW9T1yu8yE3
         L7Wg==
X-Gm-Message-State: AOJu0Yw/2fxxDg9ciWF7Ksj1BLvu9E3WxVlP+iqOw8Ntz6DTFXbGLtDW
	mxAbCoVq5TMhkLOKyQCvUWXq6Ynen6Wda0y4VltWnHDys9wR/XAPvF2vWx+68pTUA95g7GIPyg9
	hIZ0KpBs=
X-Gm-Gg: AfdE7ckbGogu5kHJJzopIA/+G/EMCu15gPqyrhM6CxZDjeWJbheMgOPUJzJqIc0HuDz
	DZiCOb294emf4UBYrVOeiGwLLZaA53rUVZcuRSKLt8ZnUymm8G5OuGmV5UuSTvrtsfNlqbu/fed
	Q3e6rq3DqNLxGOeCgSBDGydRdOHYFsjiHQJ/TOsgfGB1irVG0tQRenWiCOmIs/hzJvuT1Rf3FxI
	4+uHMjgs6eV2IjKTdTrFUGSEQv4etqP88nSl6fXrrM3pJTizKgW2u52XMRP8Kv8AJCFXAbUqrIL
	qJDKKi6ixw5LUg2MIwQznceSbdwV3adFIhcsnr4NLDWmej2BKvPrr0DiktrLCzkVOofTtlNyT+t
	c1SPVtNAicxTzVCTq/ikt13QYJNPL4lORqh5B4ea3RZow/ybkCKhrQhOavleVMzxVUkhPFC8ms/
	zhkI+AW9OTKOSN4aLJEUsrblYarA==
X-Received: by 2002:adf:e448:0:b0:472:326c:a4a1 with SMTP id ffacd0b85a97d-47aac5e2e82mr7123328f8f.22.1783291371313;
        Sun, 05 Jul 2026 15:42:51 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/55] cmake-native: prevent host libidn2 contamination
Date: Mon,  6 Jul 2026 00:41:06 +0200
Message-ID: <65bed27e9fb2ba89a1c9093ed13099dd88e126c8.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240170

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

The bundled cmcurl in CMake 4.3.x unconditionally enables USE_LIBIDN2
and calls find_package(Libidn2). On hosts with libidn2-devel installed
(common on RHEL/EL8), this detects the host library during configure
but the compile fails because the compiler is correctly restricted to
the native sysroot:

  fatal error: idn2.h: No such file or directory

This was introduced in the upgrade from CMake 3.28.x to 4.3.x, where
the bundled cmcurl added find_package(Libidn2) for IDN support.

cmake-native does not need IDN support in its internal curl usage.
Use CMAKE_DISABLE_FIND_PACKAGE_Libidn2 to prevent the host package
from being found without patching the source.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Anders Heimer <anders.heimer@est.tech>

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
(cherry picked from commit 861eaeb79f12273baddd24f615997ac78cfcb2a3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
index 9ab1f0ce738..a859cef1517 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
@@ -31,6 +31,7 @@ EXTRA_OECMAKE += "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CURL=0 \
+    -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "


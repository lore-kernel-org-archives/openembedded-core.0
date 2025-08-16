Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E503CA0EEB
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 10:22:42 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.31766.1755339753470844349
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 03:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DeUE+t0b;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a3a085so436395466b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755339752; x=1755944552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H6wm0FrWdhcQIPDMqtK/WnKsXr7WoSY4BmhaO3ReoA=;
        b=DeUE+t0bRky1AxmNPInScUOWfZs8SsRtEIID4LHBMqPlK3hC93mpGkmIi7pQEuK28K
         kLpUuDhyb6i3fVKHaldffClSTTHO5If2+YCAixsc+2LzwEB5+bARCQsfmA4e8/3X2/JI
         gTIE1jSoaR+tuExypvr3yHo1XyNToGbF4MP1PYGc1qam+FhPfI7HIzq9HAEuJRDC4rjP
         tQov9SaKUCPYLABfSGmXVBBhmyyoE9+NgxoQPV7IwiwnB++U5vqWXPWQy3ytibPmUZsy
         4dbJbO2qOSvfZdfnLEw/ZDsV9veRW8Q9PfLoIeKBDi7QHoWi6ELiN63Ch3G+NVwaVIot
         h+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755339752; x=1755944552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H6wm0FrWdhcQIPDMqtK/WnKsXr7WoSY4BmhaO3ReoA=;
        b=f98DKe5ybyhYhTHbqoncd9jRvyUtud3F/60G/0WfgKwn0xgxPj15P80EHsYCd6Fe81
         r6/vH2ftLCpAAHeyjIevLg5pYndtel3P10Osfxs7mt6OLjU23Q1EOLIkkLSA1+z0Avpp
         1wVxj75ZQHrfXabNbpe0g4aVchwBBFm7RwQbjGFaKvTvg54bL7/lzN5zY0grbaKVQr/+
         lp3iHbuUB3fftojgGCJMglWqDvwNTJ4NzwfjvLmGehucnRp6RopvRjVQRHaVzATazApy
         bqzuFH/uuwbn6miiFz920uE0aVcFwYjpkEBHHeSQK6kw/ecClIJqyVtjXVhv0fBzfwdK
         d/Mg==
X-Gm-Message-State: AOJu0Yxg0lQyQN0elBte58iVtZwkPlyxOs6/RjFFEbF1pXFzEOxAIWBC
	Nx19zQievrDikp7N+EHIYD/aop9uHFl/tzEzCmjebQuHKCDCl5V9MXkesiG3Ag==
X-Gm-Gg: ASbGncu4d75LxXjvXp7TXNdJTYxNwwl4KBkM4mXWp+2WCL/cWeRip+SC7e2eZqIlhnz
	wlXcq6lkRSKObLieKwyEmr+teoo9xCKMb18fYZKgd8yU/ef47TJd9MjlTt1qGexqb4Tc8cGzxa3
	tiaJvwfR3HMN8Y9DlTRr5P547Bztf6oYNi6HQd0dDBjh/elOVPxPONa+Ud+h1sNFpUK6HQXht9e
	eDdLef4+JmMnx3dmoM3GCrBvkE7Npw5+ueD9jZhUHtiUFyemXXLv2zVjOw8kR8qGxt05PAyix27
	83nw8t/P/ZoxCasU7kjA+M9hhfWcneo+F+T/Ug1auNBc2ti2HNzYvyrGHSR+GlT86NCordrYoO7
	ED+nWEZv3EmhwsnlZuv24
X-Google-Smtp-Source: AGHT+IG7qm0LRRsHzh7ZXUgu/xMHTMgZrPMIRL90BvJ2+C+4SGnk0kdU43YIV7vXiLr8qmTHDTM4Ng==
X-Received: by 2002:a17:907:7f27:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-afcdc1dd446mr399706066b.22.1755339751655;
        Sat, 16 Aug 2025 03:22:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab3fsm346939166b.102.2025.08.16.03.22.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:22:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] boost: upgrade 1.88.0 -> 1.89.0
Date: Sat, 16 Aug 2025 12:22:29 +0200
Message-ID: <20250816102229.55627-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816102229.55627-1-skandigraun@gmail.com>
References: <20250816102229.55627-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 10:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221996

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../boost/{boost-1.88.0.inc => boost-1.89.0.inc}                | 2 +-
 ...1-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 2 +-
 .../boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch    | 2 +-
 meta/recipes-support/boost/{boost_1.88.0.bb => boost_1.89.0.bb} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/boost/{boost-1.88.0.inc => boost-1.89.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.88.0.bb => boost_1.89.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.88.0.inc b/meta/recipes-support/boost/boost-1.89.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.88.0.inc
rename to meta/recipes-support/boost/boost-1.89.0.inc
index 96bd986f6a..ea2827ec14 100644
--- a/meta/recipes-support/boost/boost-1.88.0.inc
+++ b/meta/recipes-support/boost/boost-1.89.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b"
+SRC_URI[sha256sum] = "85a33fa22621b4f314f8e85e1a5e2a9363d22e4f4992925d4bb3bc631b5a0c7a"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 04bede4578..25512d582b 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -16,7 +16,7 @@ diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
 index b7825d4e6..ed7e39baf 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1144,156 +1144,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1143,156 +1143,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index db1ee03898..d23cf03b1a 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -16,7 +16,7 @@ diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
 index ed7e39baf..90513f84a 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -377,22 +377,6 @@ local rule compile-link-flags ( * )
+@@ -375,22 +375,6 @@ local rule compile-link-flags ( * )
      compile-link-flags <link>shared/<target-os>$(non-windows) : -fPIC ;
  }
  
diff --git a/meta/recipes-support/boost/boost_1.88.0.bb b/meta/recipes-support/boost/boost_1.89.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.88.0.bb
rename to meta/recipes-support/boost/boost_1.89.0.bb


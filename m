Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA9EC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 14:22:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.12781.1747491751926975060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 07:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2NVfeYu;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fadbe77so3102463b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747491751; x=1748096551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCi+TVnE+Z6oE1YIHNe7uU/m2nZPp7H0Y6vLqTU/kV0=;
        b=N2NVfeYupqxcTpuls3A2Ky5kK003xdE0LX2XR4fFdZ/5MrdlKXe+Frs8diTNHRQxaJ
         /SYxPujpUErzofQwSAXcLnWkOIV9gto1Cr3JB9dRq4j4hxRU8rrXYFAijN1ZABE1EcqZ
         I78kB1RgiqaMg2t9uY4Q72Ry4iMH4wd7X/tm1Hk2MW6FGE2GH5KLfNVmxwiz7O8Bk4TG
         Wbfsk9b1MMZzZtxScaZvHu7ystqOl44llWwXNdjQD8S6eh1+LWh0j3spB906VKLyXf00
         29Epnn5sHvj4cr0z3GeyFkpLhB5DdZ+5pmIsCoEMVW9OWtph3FH1ODJor7wmf79w7wVd
         H8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747491751; x=1748096551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCi+TVnE+Z6oE1YIHNe7uU/m2nZPp7H0Y6vLqTU/kV0=;
        b=sv73zqB6JM7ppqCmltoEC9mllf90dMrsE0DKNG5Tv3XMV3A2sgvA7Jr7z8pWXw6hS8
         S/y8/IkOBXJUq7DUVokdg/KhDjkx+ys393cPYuu9VDH+aJJVmlWLFUcA4siY2PDOOhKD
         7eHi4w2IQOu67HS3D3I6YJO9vC/Xkq1ySe8711zMnarsRhr9rH9YsU4ijjpXaHlO++HY
         sN9bF9BsWuD4lufU8knDQok+lMcSgPloeNMGJ2+yyWqn+MV5XmmhaN4uqLO/66Z6SNdq
         6xnylhxGrnT/hD1oUg1CxCCh9tYyeFtgpHNHfwnuOI26AJKGOjwJVO4K86QF5/NX3SM1
         H2XA==
X-Gm-Message-State: AOJu0YzcfcJGCPY9BPShFUIgn/SJoniRPIMV3DkbypN+hsj+yrmvFjhn
	a63MNyCm+Y1puelFCOVE3oqvs4woYZTuHpz+gamGaoqHSSTK/NMySjx5f7zHR0jk
X-Gm-Gg: ASbGncvlJB+FRGHD4tVKIGQ9LgOrBeSQEckWujBeEYmt/QT9kGiMNU/8mTiS586azmJ
	X3lWo3GQ7IRjA5oTjrWZxndBfczBs2FK4ecopxonXW/ezl9pPIcnqqYaPYQ1rg4JkxpwZ6m8de7
	qn8zHGGsTElUa9ZoL5T5k4zwfzYEj+A1WP75OTO7OIlslXRTV5Wifq9Qdxbh/GBHDJQQj5pkgDW
	jGACbWUobTLV+CuOHkKD3tcUSspo2OtwUIFR48C76Wd0+f1VdO6cb0F//NMpYcYZEf49KIFG/k6
	3jmczaYuRZupWEOYX+t+Umkgclx0zfoSGB5+OHPMHN4=
X-Google-Smtp-Source: AGHT+IGys0VcYusMgk33Zg4OjaTfnpLIUhHjf6HxZH/z6MFk6qxR643WdaifLGXYJVxSi/NNbGwx3g==
X-Received: by 2002:a05:6a20:c887:b0:1f5:8221:d68c with SMTP id adf61e73a8af0-2170cb10f1fmr10823179637.3.1747491750903;
        Sat, 17 May 2025 07:22:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b7ffsm3327607b3a.104.2025.05.17.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 07:22:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libvorbis: Ignore -mfused-madd as well for clang
Date: Sat, 17 May 2025 07:22:28 -0700
Message-ID: <20250517142228.2476412-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 14:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216769

This option is not universal for all compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-Check-for-clang.patch      | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
index d4fac605b66..36f47f91739 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -12,8 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 19 +++++++++++++++++--
  1 file changed, 17 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 28b0a14..2d4e984 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -98,6 +98,16 @@ AC_ARG_ENABLE(examples,
@@ -51,6 +49,20 @@ index 28b0a14..2d4e984 100644
  
  		# glibc < 2.1.3 has a serious FP bug in the math inline header
  		# that will cripple Vorbis.  Look to see if the magic FP stack
--- 
-2.17.0
-
+@@ -178,12 +193,12 @@ else
+   		fi;;
+         powerpc-*-linux*spe)
+  	        DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES"
+- 	        CFLAGS="-O3 -Wall -Wextra -ffast-math -mfused-madd -D_REENTRANT"
+- 	        PROFILE="-pg -g -O3 -ffast-math -mfused-madd -D_REENTRANT";;
++			CFLAGS="-O3 -Wall -Wextra -ffast-math -D_REENTRANT"
++			PROFILE="-pg -g -O3 -ffast-math -D_REENTRANT";;
+ 	powerpc-*-linux*)
+ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES"
+-		CFLAGS="-O3 -Wall -Wextra -ffast-math -mfused-madd -mcpu=750 -D_REENTRANT"
+-		PROFILE="-pg -g -O3 -ffast-math -mfused-madd -mcpu=750 -D_REENTRANT";;
++		CFLAGS="-O3 -Wall -Wextra -ffast-math -mcpu=750 -D_REENTRANT"
++		PROFILE="-pg -g -O3 -ffast-math -mcpu=750 -D_REENTRANT";;
+ 	*-*-linux*)
+ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES -fsigned-char"
+ 		CFLAGS="-O3 -Wall -Wextra -ffast-math -D_REENTRANT -fsigned-char"


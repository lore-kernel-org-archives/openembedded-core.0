Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.4972.1618291772152213372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 22:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@matician-com.20150623.gappssmtp.com header.s=20150623 header.b=ud3aYZT9;
 spf=pass (domain: matician.com, ip: 209.85.214.170, mailfrom: gavin@matician.com)
Received: by mail-pl1-f170.google.com with SMTP id m18so5373021plc.13
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=matician-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b99kWQjTwm4NqdKUm/7w8XyzEE01rC7j+L8KGcABCXc=;
        b=ud3aYZT90pp7dGD86n5aN1vgUf6cjVn4/hw6bkT/UXEMi9izzSq82lubFmACVng+We
         tCra5COO5pViL0Y47k1JLBh1nsYbXBqGiKu31WrPfuS3l9hD0hBBjve1LELTImpizx9h
         xR2TtqILCJKYuYmELtf43rodQn5Dq3b5+Lgzw6/p4PAAXBhJVYo9np666PuZawIGaWLK
         C6wYerhzcftLs710Erx0J3ms762PcrzELBHXqn0PJOVaPNG+p+9cD3DCJHzo7iBUdlhV
         VL/KIQFs/jKgC12NNTrSf4NIleGpBSIc+hVpga5PrvscbolmAuH8JIFjD41ccLAK+jjC
         Nhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b99kWQjTwm4NqdKUm/7w8XyzEE01rC7j+L8KGcABCXc=;
        b=Ls4XQ92nTDMtv+gs43m46PN8lgXAd7pqWmEVsq5VJsrdXCaNvE9JmP8ItxfRD/+5Dt
         OJjOufFGm8AXaFvBxvo4aQgby+x2jKRZDqIxWfMfyyBY6Hvo6Wc+F2e070ZxpcOR6lRO
         3HiQHT4ojMtSu0SGpj47Jg9ipdSJqglpFIQ+4Eta4n+2plMUdxWjclkIHApqa8lDYcHx
         nIQmFp44MiYu9KfcXdFNINdome114VUsr0njTdRXfD/up9r0VE6xXJsVRFnbQJ3z64xj
         LfzpfwHg5mP7aPnaCAcPYBoPA0cvSi/1P9vPNpD82z128X3GJXrZtBITVErqlWQelwvA
         vb9Q==
X-Gm-Message-State: AOAM531N+O0wQRsq7JxURxevDCAZZzUC+bxe0RwJmEq94CthOkz7gPap
	L0+YLiwqiX3Vn3MUqnbEkhM2wBkZJgWkpWAKde39jSqQXK8+kutOpIsSROYmlKgAP5ySlKqQX2R
	47deYTOOJ2Q/00VJiZFgR9aU3rUbvh4JnaHpc1qqqcvguV5oyFlqoRIB8mzkZE9m7sv1NU+x679
	axTeCEjGkBslN4PY4U
X-Google-Smtp-Source: ABdhPJw8eyr0Px/gwXJWB848HOoQBCZLS3L4FXB+Jrl8fQU2/E7dLh/JIOdesyptSz1yIe8m9CH25Q==
X-Received: by 2002:a17:902:fe8d:b029:ea:fdd4:e667 with SMTP id x13-20020a170902fe8db02900eafdd4e667mr8420245plm.36.1618291771270;
        Mon, 12 Apr 2021 22:29:31 -0700 (PDT)
Return-Path: <gavin@matician.com>
Received: from mtgav.corp.matician.com ([38.88.246.146])
        by smtp.gmail.com with ESMTPSA id b7sm11157052pfi.42.2021.04.12.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:29:30 -0700 (PDT)
From: gavin@matician.com
To: openembedded-core@lists.openembedded.org
Cc: Gavin Li <gavin@matician.com>
Subject: [PATCH] kmod: do not symlink config.guess/config.sub during autoreconf
Date: Mon, 12 Apr 2021 22:29:23 -0700
Message-Id: <20210413052923.2251258-1-gavin@matician.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavin@matician.com>

I was encountering the following race condition on poky:

- automake-native does do_install.
- automake-native does do_populate_sysroot. This hardlinks config.guess
  and config.sub into ${D}.
- kmod-native does do_configure. This runs `autoreconf`, which runs
  `automake --add-missing` (symlinks config.guess/config.sub from
  recipe-sysroot-native to build dir), then runs `gnu-configize` (copies
  _its own_ config.guess/config.sub _on top_ of the already existing
  ones). Since the destinations already had symlinks, the copy would
  overwrite config.guess/config.sub in recipe-sysroot-native, which
  would in turn overwrite the same in ${D} due to being hardlinked.
- automake-native does do_package. The outhash is thus calculated on the
  clobbered config.guess/config.sub files.

With hash equivalency enabled, the different outhash produced a
different unihash, which kept me from reusing sstate between my laptop
and my build server. This race condition would happen only on the build
server (BB_NUMBER_THREADS = 32) but never on my laptop
(BB_NUMBER_THREADS = 6).

I didn't see the --install and --symlink flags being used by any other
recipe, so I removed them, and that fixed the issue.
---
 meta/recipes-kernel/kmod/kmod.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index ccda9f2b73..ba5ec7f650 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-- 
2.31.1


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.12323.1586184525821623085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 07:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=baEBoVGc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id y20so4232828wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BwGBsfyAGjxhfDqRpJ8ja1YZHs2N9I6CTkFfiSF9sE=;
        b=baEBoVGcPSEUJ16tCY7AhPCdT7t6R84CcHlS7QWoxZEBvzoBaF8WfX6GQBXVxd+kVC
         9HWqC2IzEoS2lxp77dreKDafptx6FoiROeo/GSbEmPsSF+Np+qTcvuTl9Ru6x6uYQtqu
         CgCJRzqs5VNfHnCfpuvn4tN7p2mH4YQz1IGBfm8/aFqQJSrnS6WY2QEr3Dkeis7T+Lun
         mCNis3wVK9G8SxiEuUB6hiU8e1Q/GdhTPkZDtGb+DSUjqK41OzAsLTo8DVE14wkVVOgy
         B+UmgYCnaPlN/YY/KfPJDSm8lwNwnV0sQXh28Zc5sypcra+Ep7a2XKfnZATfj5m7Y4he
         xPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BwGBsfyAGjxhfDqRpJ8ja1YZHs2N9I6CTkFfiSF9sE=;
        b=CiAT0NDXJCjXWYSIJxt4YZHnHBqVOPC4WEK/1FYWSHjPDGK+hlR1H7dO+6eYXsDDNt
         IXxyKpC5VWM6dXW0f7QyXNNDEYejQRk9WSr7Dd1uORk6I8Qh7HGLqKfos/zYYfCGmAgX
         VvpQ/cRMGH5B8/KLT+Ymg+v7HrGUN/ZpmxY9FrzoOkjdWcTsWiRvxmXBCuhMBVl/CDqL
         sXMIaqHJ05D/N4u5boRKIYWTUaU9is26WXOQlutPRbs5ITosJQqUQaAhAqIvSAG+KFcH
         KgRHbWs5fDcPd/GXLsWbcUy6s5FkgxxvPYXjaP4dtHtc74Q7zeQeDCgznSU1j6T7iwTi
         5lRA==
X-Gm-Message-State: AGi0PuYBZBDjYqxZlsrjlPb/A+8o1Mz8rybR/Bos4tcOabRSRo8su5EZ
	99jukBCXqhCQEU7QtRkrphXc/tGC
X-Google-Smtp-Source: APiQypKci0D6k98MEjqX6L78dZdXCxAovrkIr58ubVz9xsoT5PQxXhwGQ98szZS7Zvmg3yadl7koWg==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr29805wmh.141.1586184523973;
        Mon, 06 Apr 2020 07:48:43 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id j68sm27960965wrj.32.2020.04.06.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 07:48:43 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] runqemu-extract-sdk: fix install debugfs on rootfs
Date: Mon,  6 Apr 2020 16:48:33 +0200
Message-Id: <20200406144833.274967-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At least with my current setup and acc. the manual, the images are named
like image-dbg.rootfs.tar.bz2.

The filter has two bugs:
- expects something like -dbg.tar
- tar without compression suffix is not allowed

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-extract-sdk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 8a4ee90a1d..9bc0c07fb8 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -69,7 +69,7 @@ fi
 pseudo_state_dir="$SDK_ROOTFS_DIR/../$(basename "$SDK_ROOTFS_DIR").pseudo_state"
 pseudo_state_dir="$(readlink -f $pseudo_state_dir)"
 
-debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.tar\.'`"
+debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.rootfs\.tar'`"
 
 if [ -e "$pseudo_state_dir" -a -z "$debug_image" ]; then
 	echo "Error: $pseudo_state_dir already exists!"
-- 
2.25.1


Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.13589.1619796905285195513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zp9adkG7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id lp8so6575241pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hl+iY60OOWVD+P4TccRA/rInhzohRnMMkZqfPK6giew=;
        b=zp9adkG7zOz3QEYkgQPbhZhZP+qQ7H5o9OP47GJYFwZjXjqAfFC6NgNmCpwkgviFhi
         j4s7MsSAYN5hJbfPi2ZNperknCjXjEdCrKQ2o9QH/qU+eJRNAMy2WMPGOnqeUSlD2dMN
         HY2/4AnwlT1ZnUFlwxru2FXmoaW61q9v0CP8pdCCfE36ywPZu+YnVhvj4RDKQGofiLPL
         uIBQMpl60qFZtB1RB6WbCFseQApCBtDVAawzI5Y3iD6J1F8d6cXbGYU2GEUF6gK3t2iC
         yM7zk5bJEBfxHWQqql8sRJVVmmkJ7V1cpble1RQF5GrR5iUEq01t22Q5T2IhxPKD9FMB
         CBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hl+iY60OOWVD+P4TccRA/rInhzohRnMMkZqfPK6giew=;
        b=f+tQDcS764lMgswA8ilYbNuxg9RI+4Wv6V+xwLCeH8NT4lZ4PVeYIPKE5fKzzIlKY9
         NE4Ya22aY9gobbxzhPyQt06YtIsvlvisHwKFYA98IBYW8IHvG44rMj7OVCKepdJ2D9z9
         x9OJyO424wCQPDO4kZR8wJvQvArHUuImNnPxNOmyFXgdXdQeq5ISxIGuE6uaEyXuvw4f
         Y9tBuJb+4HXkprHbntQKdbfTt3c8CXAyTvL2nlQMyUc4NL6Whw60pQjKIX4D7UvGpXrL
         z/bUZgBJTfU0fDHbPXcr6eZVUfi4t8LAwk3rLWz9PXOOlf8WIt/vNUQcHPJxpCQStZnV
         4zxQ==
X-Gm-Message-State: AOAM530gj2b/yBnGrY3bkprQnoKOLeFmd0iMAN2UIZUyxgnhvs0dUb+X
	8rgmLJhOdQaYGtpIkGvQ2qZYjy8Xc02u1Fyn
X-Google-Smtp-Source: ABdhPJxOej3hFMzokJmfHcwYf+0JDM/oK+4zlnRkTSyhwlMszyV/U1lW2eO8JMa4xJbSSS+bIXt+QQ==
X-Received: by 2002:a17:90a:b001:: with SMTP id x1mr6355522pjq.122.1619796904483;
        Fri, 30 Apr 2021 08:35:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.35.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:35:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] kernel.bbclass: Configuration for environment with HOSTCXX
Date: Fri, 30 Apr 2021 05:33:47 -1000
Message-Id: <d64382f7263319bd82ae21f7cdec0948a45df9cc.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Qiang <qiang.zhang@windriver.com>

When compiling xilinx-zynq board linux-kernel-dev(v5.8) if
"GCC_PLUGINS=y", The following error will appear:

"HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
fatal error: gmp.h: No such file or directory"

the GCC_PLUGINS depend on return result of gcc-plugin.sh execution
however in gcc-plugin.sh use HOSTCC to detect the feature of GNU
extension of gcc, this will result that HOSTCC can compile the file
successfully, but HOSTCXX is used in the actual compilation process.

Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 83a574efcd..22b1224d79 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -194,6 +194,8 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
+
 KERNEL_ALT_IMAGETYPE ??= ""
 
 copy_initramfs() {
-- 
2.25.1


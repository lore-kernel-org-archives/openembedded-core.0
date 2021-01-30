Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.7367.1612029763886239566
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 10:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XQXelbSs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f52.google.com with SMTP id f1so14245012edr.12
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yl03x7u1dce49avbO1G5n5maOKs0X/W2rc505SnsjAc=;
        b=XQXelbSsY7Yy9K9Ky94JnoFzpXBLVp13lj8h7Z4mr4O5y4saR0NcbApSIwArTLmN4P
         NaZqvbN7aQyvRYn2gyOnDtnGTXeG5jW0i1Z8gecVPgpeEUA8BHAEr+IUB55Gz0fu+LPa
         nksvHlmAzP/GFwP/B39CqBhMpbpe/XoXKGQJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yl03x7u1dce49avbO1G5n5maOKs0X/W2rc505SnsjAc=;
        b=Rt+10Js4+F6nPpW13+46UJIdHUd4r6Cj/573pnUBJZ8mzCfdCIlJHoJPFAtXHqkBqr
         G6CB5LJad6lPa7gnGuRyJQZKEqirVpUOkJeIJQyfYtJ+OIzn5C39uVevoZl/VBjmPM2W
         g1+wgnDYIkf/uNV4F5zVK07w1kTAbJlNmd6RO6D/t9UleIOXWbYWHkMSKRfT07WDiTzG
         Jx9XdHNPEv41BPpILksjoO1hQA8f/RujgznSfgJlYC/C8XLhCraLciyGUeuyR7IC9NZL
         oIM2pqjVEtKgeZaAL8zQL87v5rNLYolznf1nCVG/l3K2rs6ZJFwws80S7o1ehDDbXqF5
         DYvg==
X-Gm-Message-State: AOAM531+5Js6gpQFxrASAbKAZ0cryLOtFVbkobpTq8sBT6kJpM0lt9W3
	Slj2zLKpscbsZCGNoNKGDB+LZ69cE0QP5w==
X-Google-Smtp-Source: ABdhPJzAqcV1qu8eo/3LCpSNCEFnZrT0W2w8ect3O0wWBAcUUegpI7Xqn7xwJJLVIEDWYEJ4N+eHfg==
X-Received: by 2002:aa7:c384:: with SMTP id k4mr10987802edq.23.1612029762352;
        Sat, 30 Jan 2021 10:02:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id du6sm3855085ejc.78.2021.01.30.10.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 10:02:42 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu.inc: Should depend on qemu-system-native, not qemu-native
Date: Sat, 30 Jan 2021 18:02:40 +0000
Message-Id: <20210130180240.1417810-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
References: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This looks like it was from before the recipe was split, we'd expect
the system qemu mode for running the images so the dependency should be
updated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 8dedb1a42d3..7d0a6fe458e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -21,7 +21,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.27.0


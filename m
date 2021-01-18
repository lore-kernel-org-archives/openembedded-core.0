Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.3323.1611009445420269974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Yod5xJL+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id p15so10387631pjv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8SjP5Uut2F0OuyW0vDhRNQzANKJ+DQDWdiLOaTShfPo=;
        b=Yod5xJL+Vexc23HhQU2Vv5VjH8s3uzUrPCBNKFsE5ERtPnQE+F4FmaxcYLoEdkGuWi
         OJesUoG8mEkZ76q2YUNmlOLBR16vQ+4BmjLfnfthtDt99L6djsKIBou+i9y9BZiSbCf8
         i84ywBFWiiXKLtbYYeSw/fegD7j0Ut3kfPEUaBpTIVjYzquoZ2C+uQZz09GLG4NZz8hs
         pMMoGSBM5XLNnsWS/oKeibihYZ3hj1Imw8cUtkanujQl8/ZDFrujrIGDIKBXOP65sSpU
         /XuJ0RbOFLrKo+G1z4fckDFW5hydX++hkI2k56Hb0Qfc7eGvOljjMjWt99ZQRJ1UK3V8
         8fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8SjP5Uut2F0OuyW0vDhRNQzANKJ+DQDWdiLOaTShfPo=;
        b=Ivx5uSXWQHpQFlJjZb+YUZUVlnTmE53Zyfg7CL2+W8uwZ2Oi7QJXjeKGRgEm4oSp4M
         vdCL7HDfuDcEPU1Ur285PbQTumFoqM6GYpBemLGOsV+8W0ews1rGfA94NTG4qrKaasne
         ZLUJMk3KgEM6wZz1W/ylIBTZ6Sm8LL5GpFUnNV5/JTwkuoYHYLx6oWUuXrSYNg31QOAC
         fWexpzKsCsD92Nizw8p+pUoequeYZwNltUVPGo7pnPuWvzRFwU4Xmvvfd55IopjQrDdH
         5wJkdSwa0S1Aeex73QcKshPhHxYnAsMxmh28F+ZR2XDDIJ+YXpv/OE8uolPGaLb0ts3/
         5ahw==
X-Gm-Message-State: AOAM533HMFKOtoWk6nhTKuwZiEGWYVTtMRW398AD/QuZvhxMlHI3Pt66
	IQ25g0AA35r9WcnA8qAQ9m9RjrwSMcr8fBdDBZ4=
X-Google-Smtp-Source: ABdhPJzXZn81SNvImaeYLYHWUjWF1zdcry9lgpCG/fASo+uQ7VPJortrnwvBaw2MWEM//JFlH8pQOQ==
X-Received: by 2002:a17:90a:3948:: with SMTP id n8mr1618035pjf.206.1611009444457;
        Mon, 18 Jan 2021 14:37:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/19] license_image.bbclass: fix missing recipeinfo on self
Date: Mon, 18 Jan 2021 12:36:13 -1000
Message-Id: <444118a185ff6cdd20ad0a10ffae7edfa9ab18c4.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Michael Ho <Michael.Ho@bmw.de>

Resolve a build bug where image recipes with a do_deploy task will fail.

If the image recipe inheriting license_image.bbclass has a deploy task, then
the function get_deployed_dependencies will add itself to the list of recipes
to get license information for.

However, image recipes don't generally deploy license info so this results in
an error.

File: '/nvme/poky/meta/classes/license_image.bbclass', lineno: 192, function: license_deployed_manifest
...
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/nvme/poky/build/tmp/deploy/licenses/core-image-minimal/recipeinfo'

Add a corner case to exclude the originating image recipe from the list of
dependencies to check.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13fb39e49e55a0bc7c78b0bfdc372163b3f9e70a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index acd8126f68..a69cc5f065 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -209,9 +209,10 @@ def get_deployed_dependencies(d):
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
     taskdata = d.getVar("BB_TASKDEPDATA", False)
+    pn = d.getVar("PN", True)
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
-                    if not dep[0].endswith("-native")]))
+                    if not dep[0].endswith("-native") and not dep[0] == pn]))
 
     # To verify what was deployed it checks the rootfs dependencies against
     # the SSTATE_MANIFESTS for "deploy" task.
-- 
2.17.1


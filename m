Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A01CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1009.1779233437230900979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b6IsNtk2;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso44097895e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233436; x=1779838236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HJKg1tJy9aiC63wH7W7apZNAv2shqC1M9hJbeiBrMg=;
        b=b6IsNtk2xgdQY6/WmzdTcZYeCGNBFHGL0KcWdmqOZkxVLRmVN99/Ktk1uItnHMmBqm
         hvki2WIBUy2XfvUFi2CxhEnBQU1h9+DhPJJeFmJHsOCJBSSFMUo+OIW7NOWlhX2XvCm8
         1EEUSWToQn7kd+Qs8PoZPABab1oLeu2ZcyIbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233436; x=1779838236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HJKg1tJy9aiC63wH7W7apZNAv2shqC1M9hJbeiBrMg=;
        b=KmevKUav855OZoskWqKx8uCI4x/StL46R28x1YLJ/zPuL2aXhkmo2H8kmDXGQSeG/c
         MEouXwSYx6eacjDjzxhqRU7JtTMdIzl/lsk1rr4Fn3V0wr6RER0fAXfra0xcw6a5nZ6q
         ydD3kxOnyNGPFp75qANxpzSZaFTOFbR5veHRPgq4wBs+RHX02DhtgX6IKpuUKw9GxH/p
         IJvnN5aK3+y895ltKIFxyeRsncXQ/p1rXtPwcoySNewIg8T25hHwwgcu2iNdIkPsIl/5
         5j1sD+J6yQuAhdXjyscc3EgDh/M6SvvqqBKfQ58a9oir3UTsccWuclKvUWBTtOvK2ON3
         F0Ag==
X-Gm-Message-State: AOJu0Yw3fh/9Mra5LIrBZ/6fIu8goeUauc1U7copv+rcrM6yJZi5NY2c
	eMlHEBoLlTCG4g+85RoH7yCJS8HzGpDoYWUDRKWJ32GkC2n1c3Gn1o3olFM39L+JlWbV656I8Go
	/AfdY
X-Gm-Gg: Acq92OHYkn01nXvVHQSOywAse/HR1l+I6OhBNEgEJVdFv4Q2RrJFBXB+aaS70DA/VrN
	JfM0YesUsuXgt2xQ82EzCPaaMdw0eMXyk0bzJmYlZirCU7Dqas/XHsAG0H8raU0QR3NzXIpOzsJ
	VxFq8ndG5z19JGg8VNkE+dMGq0LZN6+3HtQmPxJC+MKXdkTYxJjxqISj6mhKgIqsan14IEbr6NC
	amB9awG18UbWXVgr/B6bbclKVRNIJvwfYIwcpnp4dTyd/M3/ToKSI2oJUf29dKf8O6ptS/4PeNp
	LDYG/LVVWu+UJCYILiMwfL5hVmQdO92CU0FfvExAaD4s1ekH2EKjUDxpnYuLldElDTza6gBJES6
	9/kVq3UWF8ErBScnV1ZupEa8f3DN4k5VlciR06havvVR5XYVAED1brgha5rWjWBi9omfzIHkFkz
	GPKCkYrP81HdDKaJblQ2JCajofKZEKMN2W8KjHzAtUFszKaL0TFjAmJAzj+8Hy30RPWEndw6xXk
	aGxCz561yZywrAb18z8xv4yk/4=
X-Received: by 2002:a05:600c:2d86:b0:48f:d5b2:7c42 with SMTP id 5b1f17b1804b1-48fe63259camr229961645e9.17.1779233435679;
        Tue, 19 May 2026 16:30:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/28] oe-pkgdata-util: fix empty runtime-rprovides directory handling
Date: Wed, 20 May 2026 01:29:53 +0200
Message-ID: <7da5986c081713370b4bd93e291ef6dab27d64fe.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237363

From: Sam Kent <sam.john.kent@gmail.com>

An empty runtime-provides directory caused lookup-recipe, package-info
and list-pkg-files to skip the runtime-reverse fallback.

Use os.listdir() to ensure the folder is not empty and use
os.path.isdir( to ensure it is not a file.

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 678c1c2077316b6b81ba9be000528b50dca19ca6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-pkgdata-util | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bbfc6a2dddd..904008bd029 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -289,8 +289,9 @@ def lookup_recipe(args):
 
     for pkg in pkgs:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -355,8 +356,9 @@ def package_info(args):
 
     for pkg in packages:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -507,8 +509,9 @@ def list_pkg_files(args):
 
         else:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                for f in os.listdir(providepkgpath):
+            rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if rprovides:
+                for f in rprovides:
                     if f != pkg:
                         print("%s is in the RPROVIDES of %s:" % (pkg, f))
                     pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)


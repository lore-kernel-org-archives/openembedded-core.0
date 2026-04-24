Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F60FDEE3E
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31967.1777064208077790765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TFyN3zOM;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso66527805e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064206; x=1777669006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MffMAA+ldKCr97stuFCm4kUVOy2AlXh8wWGczznJjE8=;
        b=TFyN3zOM/nzbVFEqismeKu31Ku/h0EEQTBUk1se+p8sfqufk0bLindUABdKN/oVizc
         gU4kubazUfBm4RnUJ6sO2oCuEeBMVcB/vQHtMv2PvIXkhIAB++uo+mhAONNS5htNv75f
         h1T8NRh+ZYDIyQ4vPQSBXqdjUyrtzCwwpA3fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064206; x=1777669006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MffMAA+ldKCr97stuFCm4kUVOy2AlXh8wWGczznJjE8=;
        b=cJ7xG9uqPMQF4dssnKBSHT+AODuz7uWCahyv+fCTjK113zNS4ZkuFP17RiEjLWK+GM
         hNLFsG/EIq3uyVj61BkBSqJXp9IRJUpAEgNvKL2hkKw0rJObLDXareEcIuk+STH1UxSY
         2+0uE2c+Q5Lbh9vG361n6CRDFFm8aRrxTAP43oL9RO8D3exH4L1B5LrCxXF0iewq4o3I
         XuaNjTjdjR2PLN5fDyBRcQ1pZAGwRx1PvjeJaUSBr9JxBqBCbT5C6ET9qxcaroBQ9TuO
         gipA/Y7d12PQhdz2/naIoapkEiqFnUp+ComsNci5hDhnJBPeczw8cPat3lp21IMSDM+m
         C9AQ==
X-Gm-Message-State: AOJu0Yx6L1VHta0/sCqBM1b//yQKt/rKCj0BACnV2CmSfIt21AGFnUDj
	g2MtYM8im8wdroXHY+Nf/P9tVCUmeMU7d9B79umpYok9azgqD2+x+R45VqvCpMlcIc9Eef9jyip
	Wb/6wOXMPQkmi
X-Gm-Gg: AeBDieuTZQcwcOEuzUbsi1GINqf+KWe2kBO4BD+TjPodIh3m9GoPp2GKUB919Gz/vbD
	RozHt8W22wxtw+wis6oN53mOXSGTki/6SSiky8hD5f6T4ppSBG7i1SgBQC4ivo4l1tJexyZ8cDK
	Hp6gIYRoq9smPKwAUl1OjfZis78le20uq2LH3iH3LPtp6jodONi6BmNChdTEqErFg48jxo1SXGi
	gA947ZfG+YzPDkXzVW5cbRfmOYcaTfWneXjJ4UiEqPNVFgGD6PqNYIBxxNNjFC8ABXMxjWEUioc
	Bq0rLgsxwXp61W2kM7eWE5qC8OXoQsww1qYmlHotFq7wLh0ZFMGlVoYgpx8PnmcLwL3e69yeHp2
	Ffrnul9OktGaVb2tgYllSWpRm4OrEmZeTUPmS8GrMqVFv2IwudMAlK0Q+kqWD9QjYULsi5nUNwR
	uXjHQsL8CM/OXAvwvvkD8anJN85BsRr75O484O4SmRgayU9WGdjVN3hN41XnHby/ovOwL2F79S5
	XiyfJGJIp/KqapUGtQa14bQTLsjN5sSAqzz3A==
X-Received: by 2002:a05:600c:a31a:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488fb778db4mr369203555e9.17.1777064206219;
        Fri, 24 Apr 2026 13:56:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/66] unfs3: Fix race issue causing a glibc test hang
Date: Fri, 24 Apr 2026 22:55:14 +0200
Message-ID: <34f34512e5eeefc24b36b102a36fc90f14e2f7d2.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235888

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
hang was traced to unfsd exitting with a buffer overflow being detected.

This was traced down to mksocket() where we'd see:

socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108

There is a length check in mknod_args() but obj may not be setup at this point by
cat_name() since the functions can be executed out of order according to C.

To avoid this, make the order explict. This means the length is checked and we
avoid the buffer overflow. This will likely cause the glibc test to fail however
it won't hang, which is a win.

[YOCTO #16113]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
(cherry picked from commit e51d5e19cb1ba1d5ad7442064b64821d178bc9ca)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../unfs3/unfs3/fixrace.patch                 | 38 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fixrace.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/fixrace.patch b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
new file mode 100644
index 00000000000..ebdb0d79f57
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
@@ -0,0 +1,38 @@
+When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
+hang was traced to unfsd exitting with a buffer overflow being detected.
+
+This was traced down to mksocket() where we'd see:
+
+socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108
+
+There is a length check in mknod_args() but obj may not be setup at this point by
+cat_name() since the functions can be executed out of order according to C.
+
+To avoid this, make the order explict. This means the length is checked and we
+avoid the buffer overflow. This will likely cause the glibc test to fail however
+it won't hang, which is a win.
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/nfs.c b/nfs.c
+index 3e92f87..784089a 100644
+--- a/nfs.c
++++ b/nfs.c
+@@ -776,9 +776,11 @@ MKNOD3res *nfsproc3_mknod_3_svc(MKNOD3args * argp, struct svc_req * rqstp)
+ 
+     PREP(path, argp->where.dir);
+     pre = get_pre_cached();
+-    result.status =
+-	join3(cat_name(path, argp->where.name, obj),
+-	      mknod_args(argp->what, obj, &new_mode, &dev), exports_rw());
++    result.status = cat_name(path, argp->where.name, obj);
++    if (result.status == NFS3_OK)
++        result.status = mknod_args(argp->what, obj, &new_mode, &dev);
++    if (result.status == NFS3_OK)
++        result.status = exports_rw();
+ 
+     cluster_create(obj, rqstp, &result.status);
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index c5b7898b3c1..50d5cd272f0 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-locate.c-Include-attr.h.patch \
            file://0001-fix-building-on-macOS.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
+           file://fixrace.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"


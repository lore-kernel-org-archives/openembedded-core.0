Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD14CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:52:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.19099.1761925935278065806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFTrrEA+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-294df925292so21648325ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925934; x=1762530734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EHVSFrhNO1nvETHI5LUGKzZTa1Sb4QKbdhC+Yx/j2Y=;
        b=lFTrrEA+Vxn/C65IfDm6o3AYum0+52vUPxf5Ojt/v4soO1thBmRaJwLgyyl+YCAAB7
         Q+j6pxop8LZNZER5njsyXsn5odzauflprNB2Ojc651SQTSC2d6KD3IOd5ArLSBkDQLnT
         1QtI5JHG0HxWrB/sB3gYXWpQlwnHYyYM+LpRAjbYuWJwPMr6STS1jJmMdqwLtmNZ90Iu
         QSYvoxxMxVKY5qD4/p/2IOvYQQdnKmZcjS5Ae2D1eKdcuiK05ihL8zn+InjiEVJfuG5p
         eYBBaZUNJKH9SCjWiW4k9n4NnVlelU6VzDnGWA4oTFGTvBLBTdNvxb9LHKXPhYJlxMdp
         8r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925934; x=1762530734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EHVSFrhNO1nvETHI5LUGKzZTa1Sb4QKbdhC+Yx/j2Y=;
        b=PYwE7GBP+bOmHAfs8PZ43wr7gSThsaQULxPQl4Rpm7b8/zUvp1nJxGlI9UTTcq6U3l
         cDifSZENeuGXsqQE29hw1fQFTqNP6HZbWVduHzLvmGV17kcEzGTPf8/ASNMFb43FKRAE
         nSabdVmEFSvJWPstitFFRJJ8wSf4mAgkOzGNX1oTuC+X8gxjkeo3gomr0DTH5+c8GvrN
         Nh9zfdoqWeW1YgSmxDt7I2CujT/RkYh+HVB0tGquJP2ki+9J5o43JRC/H7yPJbh39LqZ
         J4Yl2Ssyl0B/jpkzIEXC/AOI1FYac5u08ujZajFH+qW1BP4oJ61ZmMKwppJ4Rh5i1VEL
         L0Lw==
X-Gm-Message-State: AOJu0YxCigmeyfHSB478KWNk7uLkOHLH2PSsF7KE5RBS1rUWFu8kRK4E
	JLyr3/1buUN1DbUx8R9GZ51xdaZoSVhFKkJlsZplVR1rWjlxKAEw9oxh76JKM/xd57Y=
X-Gm-Gg: ASbGncvcv2YmBfCi2dG3mgoSUlBIdyu8i4qJcc0pt7YOGTzAxW3zj24HH9bmNXinKWy
	xbAQq/qRKZL/kW95STSB+x73Y76772Lx1YdKHIKnoBy1+qwRZZDQj+YNw1vBwMDgxOW5qWxi9GH
	QNhDnRgqgLbbpaL8/M75HhlCrtTjE2/54KZrStdetVmGCc8DWuKHoz5Iq3Ci+MTe23c6zlu+sDU
	xnoREvZEvY7sCHVoWYWUp6Zrv8Kf0ED3Ge4taYuQc3ePpWFCiwNAgUocO2UPJe+q5qmK/yfmlcA
	OYyh/+cpz1A9Kp9ayUUSWim6r0plhiO3+VLWwde5axdXlz1UPRjSW3AebFws/62ID96cod/UC2x
	cB3NFqmKR9aYvgGe9V1SDrHCduHPIdcv9vBNMtHsoBfFfMbWgU2j97st7ppCMEp3kIncAezZFKe
	TfoDgQXwx4DviQxio5oQ5+Aqb00Cx+CsmOM1avj//O8vxQdn84jP+xIL6WaT9eIIIQW9yw55PH
X-Google-Smtp-Source: AGHT+IHyDcu2vwZBmgRXq9i5mMrJa9RHAxBOQrl/eBSG1CG2sUu0owamLx86vwlyy6CM2y5usY8Ddg==
X-Received: by 2002:a17:902:dac7:b0:295:6d4:d6a3 with SMTP id d9443c01a7336-2951a4d15d5mr52630495ad.41.1761925934252;
        Fri, 31 Oct 2025 08:52:14 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268a629csm27779875ad.30.2025.10.31.08.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 08:52:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Omit trailing whitespaces
Date: Fri, 31 Oct 2025 08:52:11 -0700
Message-ID: <20251031155211.1449225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 15:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225545

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 2d9f7d7c19d..abe4649b2a1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -451,7 +451,7 @@ pkg_postinst:${PN}:prepend () {
         # Need path to saved utils, but they may have be removed on upgrade of busybox
         # Only use shell to get paths. Also capture if busybox was saved.
         BUSYBOX=""
-        if [ "x$D" = "x" ] ; then 
+        if [ "x$D" = "x" ] ; then
            for busybox_rmdir in /tmp/busyboxrm-*; do
                if [ "$busybox_rmdir" != '/tmp/busyboxrm-*' ] ; then
                   export PATH=$busybox_rmdir:$PATH
@@ -471,7 +471,7 @@ pkg_postinst:${PN}:append () {
               rm -f $BUSYBOX
            fi
         fi
-} 
+}
 
 pkg_prerm:${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
@@ -499,7 +499,7 @@ pkg_prerm:${PN} () {
         if [ -n "$(readlink -f /bin/sh | grep busybox)" ] ; then
            BUSYBOX=$(readlink -f /bin/sh)
            cp $BUSYBOX $tmpdir/$(basename $BUSYBOX)
-           update-alternatives --install /bin/sh sh $tmpdir/$(basename $BUSYBOX) 1 
+           update-alternatives --install /bin/sh sh $tmpdir/$(basename $BUSYBOX) 1
         fi
 }
 


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37271CA5FE4
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:05:48 +0000 (UTC)
Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13188.1791061544810371832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RCEXHOwT;
 spf=pass (domain: gmail.com, ip: 74.125.230.229, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93d9310b207so50083985a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791061544; x=1791666344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGe9fLta3D3fpJ8uXsugoNdjyxAJR60yt2DwIhKVE+4=;
        b=RCEXHOwTh+MfQQwjU0Q2Tz0llDdiOmB4nOM/4a9jAKNZgkDgPIgY3a29VpwIk/k1eq
         p9srODOk869EyEmQ6D8FHvr9KIMOHYHYJ/ypVWVt7wOJ9zn8SbeRiKY5ZW5or/Po6L64
         kpjBDXGIS7/fou4y+B7+Wv8hSyUSN8c8iOV+2rpkQ49VEay0MpZUvZADlaaGPPRgAimu
         2fcVRd/uF/brA0zu37LwJSgktIWgoFwkR2pvErBC/2Jm9oKN4dJPNvySgKSuvqw7lljD
         MrGl+kY6HrS6XJoAd5pDpyxb2WbQCWXFpjkdyDvFkPMxo6NZKR7eVdaEkd8zR2Zd8PCv
         fYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791061544; x=1791666344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGe9fLta3D3fpJ8uXsugoNdjyxAJR60yt2DwIhKVE+4=;
        b=tTQ4ZeBc+kTvgGQu3tyqAz/BUhDqUwIHDbeounDfrVERHmG5GAKGC3OXibANVOXmnn
         cpsqOLBIcTiWM15FcGsN5fIgeLoy6bn2/Lpe6Y7ZhxuJVnlqEMZld3O/tlum6dnwjIgu
         abkTYrQRmxXVPnS9ipOgmLzooHm5bePbJgDqDz+UQ/MHPnMfgo+l5VkhMXBgLNumTFCt
         0oWTY8eeNR1FXRrPHJ+nttyol3JPrwyOM+r1HTxmTKbvd4+k70Nx43lvhIEbzBMTrsiq
         3si2Dy9DRPqEWCZxOOj4x4PjIBQkTrXBMx8Dpl8I3thjqgqze3uQ7Z6shjp9gmuMRoT9
         DA7Q==
X-Gm-Message-State: AFuF++k7cpXToeJiOJ6hCXmezjnQKVFdf/Hk5HYTiapVV1HEGY7n9IM5
	/gd5vbphX6dBmS1P6poHeHWHfz2KimhdFP7OQfYk4jaqrVzDwxbhX9mi
X-Gm-Gg: AYBFou08fdLBz+mBuISuiwbtUgv6fRO4Ft4mfFTLI/FxNBGgYc5it6O52jWx97wMmLU
	L/fXCdpYhcbTweg90c8GggYfWeQCYpyeuO+eKkmXJsGfTHJb9E2A96frmPRto25qpCAPTIJOseK
	iXHlq1ux2PsNt0A3PPsVUVGPvAInQcK7l5xh+99IPioj74Km2hSgFNqQGVt6d5UVl3urOr5Y8no
	f9kcH+X7z+wBJbgAmActplGMiVlcqOkr9Pync0UI4wshawU13GzLCobzWpgX+CYOTRhrrL1gpjA
	5wWXVQfbmMzZZXGqtZJvqfEI27VdGIxecWFd78VQWp6swuMXthkTkpEZIRe3ck6lqcg4ubwOF00
	pP0rYdfNzH3GK0GXJKSljizQuPbaZu1cY6QUV/vDKkUBJsi1dXftjrA+UVui8N2YqM9g042gCS6
	55YCK0sBNygcDnzBl7/v9pk3cSkpQZXNqAo7ePvXYcW7I42/k91SenAIRx3elsxL29U+YiSQtdL
	e9oSBKBmsF1gsPn7zJ85eE7k6z8UcEGiLjX895AP0oBIXQ4wNKLo2M+zAO9EhBDVzpedw1IkWLq
	92BaLvRiTMk0OIJq9J24gXag0ZhcwZ5O5jf4aXVXOLy+tlsfoZRpHjl1PhEoYzQESieSL79wGSN
	1DlFb+AvzcOM5Pvw=
X-Received: by 2002:a05:620a:4622:b0:93e:63fd:40a4 with SMTP id af79cd13be357-93e63fd4833mr49441585a.55.1791061543105;
        Sat, 03 Oct 2026 14:05:43 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d9fa1sm529197285a.44.2026.10.03.14.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:05:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: bump to v7.3
Date: Sat,  3 Oct 2026 17:05:39 -0400
Message-ID: <20261003210540.2761229-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247176

From: Bruce Ashfield <bruce.ashfield@gmail.com>

7.2 is released and 7.3 is in -rc, so advance the development kernel to
track the v7.3 branches: point KBRANCH at v7.3/standard/base and set
LINUX_VERSION to 7.3.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 1ac2824b4f..c1554f1090 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v7.2/standard/base"
+KBRANCH = "v7.3/standard/base"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
 
@@ -29,7 +29,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "7.2"
+LINUX_VERSION ?= "7.3"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0



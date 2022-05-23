Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F264EC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:54 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.27624.1653314453300847101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rzTCUwEB;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.41,
 mailfrom: steve@sakoman.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-f1eafa567cso15144760fac.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bBIq7CqWrzdVIC8FH5Elp5+/Q2+rZQx412xvJYJuTuc=;
        b=rzTCUwEBzEo9YTZksOvivXNiMRWeK3xbDkbUVNxWi4JJi/fV4LvFaIlUDy1Fd8FAtU
         DN1Kffq8a1AMjrkhe1lntSuoHlvF3vdZFeppmG8xi+M+2gw/1jiXdXwxN+UmNIG5pLqK
         LF0QBM6Nsw2K8cUzihty3eLZ1ID1vnx1HLMlXdwHuD3vg8Iw43wpKJT8qyYaSIJQ+O7Y
         ynQDC60NRQmvnd/uPisaoMon3Ju1aGc5QeM3/q0gAW2x0l+DAzpuqeorf0A+GQx+jT1o
         FlSug/bI4iMrJRlJlFwuOndk0zeLt4n8wFfrY8T2Ge60KV1nnwChgWrW3Img9JfSfHAi
         pEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bBIq7CqWrzdVIC8FH5Elp5+/Q2+rZQx412xvJYJuTuc=;
        b=nP9+BXnLsRWJtneVDpCu8edjPKqkeP1L7uOvVUBVUzRMTVSa/a8MD72qGbE8qK5KJq
         Y4So+vAoN0VOPFVoxpYAlWM5nTtRiSYNWN7ZS0/azUEpaB1r17JudEC0dfxsS+7YGnIa
         P4MI+Az6S4+3XEB/dvZM0RVqaIuEQYaFo9WpCEkIGfkeq+wTH0jsRcz6G/7gB/mWha7h
         /HETTCT5htBLaUEG9qMBRJePDY9imFuxXBAC+BZ7tvY+6XRtn2F1rDHzgbnalSvb/fng
         9ECVSVJHSrrKmCFyzlpmWVPtsY7qlQskD06f+KiaaX3+9jZGyNWodJELJe/6BExE8+u7
         Zdqg==
X-Gm-Message-State: AOAM532XL9pDHiixP8euRnSTong9ZSZm9ZuNKtIacH3xazDHpmIIf6yp
	C+P6LpvBsvrBuLAXFdCEmxP3zbyHOTpKQDub
X-Google-Smtp-Source: 
 ABdhPJxduLlEMAty78aSygyp/4WptHZ7dRN/arHDDZIlCozmR5rxLfte+FK9k62hMnhW6O4vkRYjxQ==
X-Received: by 2002:a17:90b:4b88:b0:1df:a87c:f741 with SMTP id
 lr8-20020a17090b4b8800b001dfa87cf741mr26376328pjb.110.1653314441133;
        Mon, 23 May 2022 07:00:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] selftest/imagefeatures/overlayfs: Always
 append to DISTRO_FEATURES
Date: Mon, 23 May 2022 03:59:48 -1000
Message-Id: 
 <d3beac233558242ab6895e9ba8536a6df9df8eb3.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166032

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Using += unintentionally removes all other entries from DISTRO_FEATURES
if DISTRO_FEATURES was set by ?= such as by poky.conf. This reduces
sstate reusage on the autobuilder. Fix this to speed up builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 124b82c32c4545bb216a8249954817f692f9795a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 6b94ace4eb..6d010b3e3a 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -235,7 +235,7 @@ USERADD_GID_TABLES += "files/static-group"
 DISTRO_FEATURES:append = " pam opengl wayland"
 
 # Switch to systemd
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 VIRTUAL-RUNTIME_init_manager = "systemd"
 VIRTUAL-RUNTIME_initscripts = ""
 VIRTUAL-RUNTIME_syslog = ""
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index ce1d2f1ec3..96beb8b869 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -55,7 +55,7 @@ inherit overlayfs
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         self.write_config(config)
@@ -94,7 +94,7 @@ OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         self.write_config(config)
@@ -112,7 +112,7 @@ DISTRO_FEATURES += "systemd overlayfs"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 """
 
         wrong_machine_config = """
@@ -136,7 +136,7 @@ OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user systemd-machine-units"
-DISTRO_FEATURES += "systemd overlayfs"
+DISTRO_FEATURES:append = " systemd overlayfs"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -271,7 +271,7 @@ class OverlayFSEtcRunTimeTests(OESelftestTestCase):
         """
 
         configBase = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -313,7 +313,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p1"
         """
 
         config = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -349,7 +349,7 @@ INHERIT += "overlayfs-etc"
         """
 
         config = f"""
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -391,7 +391,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         """
 
         config = """
-DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
 VIRTUAL-RUNTIME_init_manager = "systemd"
-- 
2.25.1



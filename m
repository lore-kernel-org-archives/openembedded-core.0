Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71070C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 07:32:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.9047.1660030340361722649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 00:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k9tDGRaZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 130so10053108pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Pl5HgTSst3MXZ0ZXbCnGk96adJBybxtk6PB6YYiT0bE=;
        b=k9tDGRaZnSdI/4gB39heBzP12B2pv5mfmSr23Bo9gg1QwaFrqzNRmX55Fx73WByHDM
         LuHumrQrSXcSFCvA8wszu1l9eCS6n+3Jo/fENZiqhXmU98qV7NWrGf5cF6eh3AhrkQpD
         F1JIip4QGn7wxhPqTRcTKOFlQXu0dIlmdrsivfONoBsc37tItIPMpxSFes22UQmHS5zX
         VQkVyH5jQUONMtcgmw6S5X13yCwsLWaPqsbb7Z8U7LCT7LotoVwNuj4M8jeE9JlSF0En
         YblV/qTT83kytCMH+y/bmhJO46ehcIyMUAz4/tKEkIaJDxir8TnVLfDXzIR2/VeLLlav
         gffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Pl5HgTSst3MXZ0ZXbCnGk96adJBybxtk6PB6YYiT0bE=;
        b=kY+cZiBpFZFD3YmnSN0CbcCNLyv8GrgWGpbRrpR3JvMMkbVNW8elFLNiNkVIFKZ+TD
         poZECHAGAyq++FjVPyb9yvnnsHDA28pGPdsXermINUHdM88LgnrwxyfQ0226BVDts7AN
         fT40eeMtrfwrZje3amvtE8kdbVkwNiBjjf4quQhencYpUZMPAW0/Nppj8KJp5BduFEqe
         zFdMR2H7XgI/vPQKPb3L6bb39aC8sskwNKtvjQDCGwliOBnXDVoPuYwdw9h1Jaopwg94
         Jghp3HTjsKyeQ4AhCnPB0yja2NezspFngoJLIyqIxWxf0P+Ho95QrGZjJIPhAy1X+7iJ
         J17w==
X-Gm-Message-State: ACgBeo3Rnn7XIRsMrIus3VO6rbNVVXQ2xv5tfQvauYXsZ9rdb7pbd1e9
	hsZ0IjUt0VsDWhIFBD8bBk6KGBdyMhk=
X-Google-Smtp-Source: 
 AA6agR5ygWf8JZ4XYjULGYC3k3HDirIdCZsdPxPJ455MffknosW2iQLa1Y8n+oX4ERe07gouDAsBJA==
X-Received: by 2002:a63:2110:0:b0:41d:234f:16aa with SMTP id
 h16-20020a632110000000b0041d234f16aamr13077437pgh.481.1660030339133;
        Tue, 09 Aug 2022 00:32:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a63b20d000000b0041a67913d5bsm7728980pge.71.2022.08.09.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 00:32:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sysvinit: Fix mount.h conflicts seen with glibc 2.36+
Date: Tue,  9 Aug 2022 00:32:16 -0700
Message-Id: <20220809073216.940143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 07:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169138

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sysvinit/sysvinit_remove_linux_fs.patch     | 17 +++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb     |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch b/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
new file mode 100644
index 00000000000..89d65c23b71
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
@@ -0,0 +1,17 @@
+# From glibc 2.36, <linux/mount.h> (included from <linux/fs.h>) and 
+# <sys/mount.h> (included from glibc) are no longer compatible:
+# https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- sysvinit-3.04/src/sulogin.c.orig	2022-08-07 23:07:42.952576274 +0200
++++ sysvinit-3.04/src/sulogin.c	2022-08-07 23:08:26.511470983 +0200
+@@ -51,7 +51,6 @@
+ #ifdef __linux__
+ #  include <sys/statfs.h>
+ #  include <sys/mount.h>
+-#  include <linux/fs.h>
+ #  include <linux/magic.h>
+ #  include <linux/major.h>
+ #  ifndef TMPFS_MAGIC
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index f678f65c1ef..76b187c1961 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://pidof-add-m-option.patch \
            file://realpath.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
+           file://sysvinit_remove_linux_fs.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
-- 
2.37.1



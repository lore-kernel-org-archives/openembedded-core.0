Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.2787.1601320254032725820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 12:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDO6LsmT;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id u25so2042336otq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cC7tiVkZq9z01bxoL+U5T4U8qiCTNWq78OGU2QZBBlA=;
        b=VDO6LsmTe/13AH1UCg31UE8ecgz9uGW/bJ8wLTXg1OUOmBjZd+dyuuKu87Tvh3RqP0
         PUmbAcgXyeCF9mG0kQF0zR8pQKvrsgT+32N2SWUzBZV0KrfaWDKVJlL6zMl9mjGfdJTn
         MjzaF/nXgbjfAykQEd/7w4Sp2eGiQ97+hLAI0mxH3C835iZ3YJzmH2N0DzLVMewawqlB
         VaCkWmDRCt2A/77+7+f7ndsTTLaixcuyHn2Wa8nIXm2mkN+6nErK2NzUXnQAIgCzPfCa
         Ug3kKLy/PiGJcaa07mY0ne+TeJUMrbkkCNcSpJENTURsTPp7i1G5wgs44EQ22pmq9D70
         gHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cC7tiVkZq9z01bxoL+U5T4U8qiCTNWq78OGU2QZBBlA=;
        b=eADja5opuLFMq+vo/cCprxF9isAGZePRtx8JrPkLNflgajVw/rV+SXdf/pwFCnx0Fv
         dpyZAYrgV18MCuvCgysK/OLevu+kPKaeB4JpNNnjl06SprcLNaAjnjb8usugJRDR07Ws
         bzSSrplxW6UH94j53Ixwl0D0y1fgT64LIE1KxuQtMNY9F6YexjMgdQoCFAG5ub+BCDrr
         cJ3A9W30S0OIR4VPkr8G48blnFtqI5VDJcGB0mj/tdr/O8PMeypjT1wk/dLhUPrl9jDx
         8UOUrXldvjnRqIOJlr7TATFlvGvctvsFR9VdezEAhmUT26XTedFm6WaXmbE9J+GdWcoo
         jQSQ==
X-Gm-Message-State: AOAM531Coz3CHzytljO7jCRiprKnSU0dxLHsatKLjex5gjb+0cuPnHMD
	RIfDCapzlwWTVVCqa6IQfPDMXaovSPg=
X-Google-Smtp-Source: ABdhPJyufk1ksXwFKqJ3CgRPpt3WZEJ6Sn7tBYyRMJ7imy9dMocfz6RcxoyGwJ0bXlfULZGWtt7S8w==
X-Received: by 2002:a9d:62c3:: with SMTP id z3mr292771otk.321.1601320252946;
        Mon, 28 Sep 2020 12:10:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9d97:e0e:5802:c8f4])
        by smtp.gmail.com with ESMTPSA id z20sm2301184oor.3.2020.09.28.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 12:10:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster <akuster@mvista.com>
Subject: [PATCH] libdrm: fix build failure
Date: Mon, 28 Sep 2020 12:10:51 -0700
Message-Id: <20200928191051.26865-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: akuster <akuster@mvista.com>

Failure seen on my CentOS7 build host

Signed-off-by: akuster <akuster@mvista.com>
---
 .../0001-xf86drm.c-fix-build-failure.patch    | 87 +++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.102.bb   |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch

diff --git a/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch b/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch
new file mode 100644
index 00000000000..60c996ca855
--- /dev/null
+++ b/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch
@@ -0,0 +1,87 @@
+From c7d89412884de2dbfa543720d185027377e62f21 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Fri, 5 Jun 2020 23:46:52 +0200
+Subject: [PATCH] xf86drm.c: fix build failure
+
+./xf86drm.c: In function 'drmNodeIsDRM':
+../xf86drm.c:2825:7: error: "__FreeBSD__" is not defined [-Werror=undef]
+ #elif __FreeBSD__
+       ^
+../xf86drm.c: In function 'drmGetMinorNameForFD':
+../xf86drm.c:2938:7: error: "__FreeBSD__" is not defined [-Werror=undef]
+ #elif __FreeBSD__
+       ^
+../xf86drm.c: In function 'drmParsePciBusInfo':
+../xf86drm.c:3258:7: error: "__FreeBSD__" is not defined [-Werror=undef]
+ #elif __FreeBSD__
+       ^
+../xf86drm.c: In function 'drmParsePciDeviceInfo':
+../xf86drm.c:3427:7: error: "__FreeBSD__" is not defined [-Werror=undef]
+ #elif __FreeBSD__
+       ^
+../xf86drm.c: In function 'drmGetDeviceNameFromFd2':
+../xf86drm.c:4305:7: error: "__FreeBSD__" is not defined [-Werror=undef]
+ #elif __FreeBSD__
+       ^
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ xf86drm.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/xf86drm.c b/xf86drm.c
+index 07a18c4..50a6f09 100644
+--- a/xf86drm.c
++++ b/xf86drm.c
+@@ -2822,7 +2822,7 @@ static bool drmNodeIsDRM(int maj, int min)
+     snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/drm",
+              maj, min);
+     return stat(path, &sbuf) == 0;
+-#elif __FreeBSD__
++#elif defined(__FreeBSD__)
+     char name[SPECNAMELEN];
+ 
+     if (!devname_r(makedev(maj, min), S_IFCHR, name, sizeof(name)))
+@@ -2935,7 +2935,7 @@ static char *drmGetMinorNameForFD(int fd, int type)
+ 
+     closedir(sysdir);
+     return NULL;
+-#elif __FreeBSD__
++#elif defined(__FreeBSD__)
+     struct stat sbuf;
+     char dname[SPECNAMELEN];
+     const char *mname;
+@@ -3255,7 +3255,7 @@ static int drmParsePciBusInfo(int maj, int min, drmPciBusInfoPtr info)
+     info->func = pinfo.func;
+ 
+     return 0;
+-#elif __FreeBSD__
++#elif defined(__FreeBSD__)
+     return get_sysctl_pci_bus_info(maj, min, info);
+ #else
+ #warning "Missing implementation of drmParsePciBusInfo"
+@@ -3424,7 +3424,7 @@ static int drmParsePciDeviceInfo(int maj, int min,
+     device->subdevice_id = pinfo.subdevice_id;
+ 
+     return 0;
+-#elif __FreeBSD__
++#elif defined(__FreeBSD__)
+     drmPciBusInfo info;
+     struct pci_conf_io pc;
+     struct pci_match_conf patterns[1];
+@@ -4302,7 +4302,7 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
+     free(value);
+ 
+     return strdup(path);
+-#elif __FreeBSD__
++#elif defined(__FreeBSD__)
+     return drmGetDeviceNameFromFd(fd);
+ #else
+     struct stat      sbuf;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.102.bb b/meta/recipes-graphics/drm/libdrm_2.4.102.bb
index fb9a94207f9..ad512d14a90 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.102.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.102.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \ 
+           file://0001-xf86drm.c-fix-build-failure.patch "
+
 SRC_URI[sha256sum] = "8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b"
 
 inherit meson pkgconfig manpages
-- 
2.17.1


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAE9C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.6903.1645799280198085559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7gFj3WdW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id x11so4936096pll.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tz9gUFjfnP8Zyv1nXiRmx//dv3iunHUd4fQCsRWJgns=;
        b=7gFj3WdWCDqjwVC1bfDavTD2n7fMNN1kUtX8+6SDURL+fAf7V1lRG5d8Kzr8GYRjhV
         Tt4x+DYMH2K+qKprtEQub2i1xwFTHABlfCMtONOvKsYIDznffItn5f+B7v4gTfpHU33y
         oGg/MBqwlPFwGzdTwTqJyl50F7pwk5Komrt64oF2YjGRYwlwk7FcKDiJ6A83YZfx/847
         3O7HmwbFKDOQMNDJ8phlvUNM05RBZOuvRo//kNissAWb4sQszvaPUjUpj45MLl6MrOVH
         jvp3ESqew+sMYRO62InSdtc/TWH0BiEXQYDER8l7/RaVQpS3HcnJJLlI2sH4CzH0Vw4e
         Sc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tz9gUFjfnP8Zyv1nXiRmx//dv3iunHUd4fQCsRWJgns=;
        b=58AvzTTm5yBpNM0thYU2j5nh+9REfLFB50G235MRWsqMG6W0J7TE2o11pTMmoUlu6z
         IjmaqOBmEvQBv44uQF2yClJ64zlL3M43FeMsB4x4Yh0Cx+2Slm1LdrHL3/DDpzTRwuy4
         s5OIUE2M9+0uQi8UVEL16MllD5Id5Cjp0szirjtdqOztee+NCVi0tsUS24OZXhn6UiNv
         UvQwFL7W3h8gqactirn2QSS5O+FC33i0/VtPwp+BBAyZlNxcyBzkjzo3DnAH8cOQi/BO
         ByQILB2hZqjTl9LMnWJj2fZRET8Aw/L/UdWnYLWNr/V3HEPM62pZyfKuy64HuwZgeW3U
         RReA==
X-Gm-Message-State: AOAM53318vK3FXuqdaom6L2UQ+jbGIK/URqsKie9O7vvggEcsIyWp5qN
	Iw+r5oClHcKPEgoshpOGibYEUG6iP4EJosbJ
X-Google-Smtp-Source: 
 ABdhPJzTaKWhnmVsPGxvT6LhtlG9M0L/pM7qCMgWiw/CdWpzvxXJg3RU22Va6M1ZIQCqYYRTmYKILA==
X-Received: by 2002:a17:90b:1104:b0:1b8:b90b:22c7 with SMTP id
 gi4-20020a17090b110400b001b8b90b22c7mr3445067pjb.45.1645799279245;
        Fri, 25 Feb 2022 06:27:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/50] grub: add a fix for a possible NULL
 dereference
Date: Fri, 25 Feb 2022 04:26:11 -1000
Message-Id: 
 <33aa1a133cf2893a6d3a1f94bd098ee1c16a8abc.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162377

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a possible NULL dereference in grub's
libgcrypt/mpi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...pt-mpi-Fix-possible-NULL-dereference.patch | 33 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch

diff --git a/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch b/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
new file mode 100644
index 0000000000..08299d021e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
@@ -0,0 +1,33 @@
+From d26c8771293637b0465f2cb67d97cb58bacc62da Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 10:41:54 +0000
+Subject: [PATCH] libgcrypt/mpi: Fix possible NULL dereference
+
+The code in gcry_mpi_scan() assumes that buffer is not NULL, but there
+is no explicit check for that, so we add one.
+
+Fixes: CID 73757
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ae0f3fabeba7b393113d5dc185b6aff9b728136d]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/libgcrypt/mpi/mpicoder.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/lib/libgcrypt/mpi/mpicoder.c b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+index 7ecad27..6fe3891 100644
+--- a/grub-core/lib/libgcrypt/mpi/mpicoder.c
++++ b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+@@ -379,6 +379,9 @@ gcry_mpi_scan (struct gcry_mpi **ret_mpi, enum gcry_mpi_format format,
+   unsigned int len;
+   int secure = (buffer && gcry_is_secure (buffer));
+ 
++  if (!buffer)
++    return gcry_error (GPG_ERR_INV_ARG);
++
+   if (format == GCRYMPI_FMT_SSH)
+     len = 0;
+   else
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index be35ac04ef..ef409bdd6a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -73,6 +73,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch \
            file://0025-affs-Fix-memory-leaks.patch \
            file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
+           file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1



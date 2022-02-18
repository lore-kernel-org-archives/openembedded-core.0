Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D4FC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.9121.1645178817340490422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PGf/ROS3;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so8222409wme.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hSfclK+kD8tC9MSWVYM71GRYzlDS1Uk30GpWveUtAJ0=;
        b=PGf/ROS3PsmHqqbNJUrz9VjIAeANjXf+21xxz0IoyL0+9J0oeXG9/t5iIaknYSDq2u
         vnNfpqk9OyuAMeShfrov2xWyDdYFg6mxuch+suR9hNCRkxxfVgUlsBqKeWhEUN1631jy
         WqemDRzds5uiDDwSDsU5jDp+EAfof9bzZfWzC2+8SsoUkVSmz8oLj+uXZb7Uxee3tKGd
         95ST3/DJjJ8nGhRpilXjhf3ZU7/oFwhOKYlnMHZXSOPw2jyG87oNqZZl9eR4q2V/YcK4
         BgJ25nfxe2xrVPht79DwhFaszi4vTY3Y5ANXVFvbVqwLjqvNl0le7Bu6391f4nsFUotm
         xpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hSfclK+kD8tC9MSWVYM71GRYzlDS1Uk30GpWveUtAJ0=;
        b=vFEj3AtykdAVYFu7TYAN2SwXvGV3ZNgVq14iZ0jho5dvoWSoiAGlj8UDjYJF8sTS1q
         5NlRoYw/vDrB/tE5IMee1R+XTEEkRqarD6sQWOziaGt75ioOe2DlooF5vZ2wXhPSdeai
         N2HBBG75Oiq6GPn67mDTQZbXrQkAM+2SjcKtI+IMo2aU5bdchgxqq9BerG1NNLufSdUv
         hH7w5e/T4h5PtbqNSVmPlHEu3h+LVl/TpCNImbVaGLcC33W46FMF1y2p/fU6rebq5wHM
         DXUrMQW5gCUU4kQC5kPm6/ZgAainxREp3sxbvhDp9x/EPgLVVVB+T14l1XyBVoiJ5IAP
         1mrQ==
X-Gm-Message-State: AOAM533+jmkHjBF55ySPFolxYtIi4XQ7ZzYEhpLSYWTQNOo2OfuxZrix
	9R4CGev32G2JdEFB5EOF0ZE=
X-Google-Smtp-Source: 
 ABdhPJyPmSJ308CMmVfskNUSgYNa3zlfb2bN3nSqeBwlnhicUmZPVLVJSnWTXGMgBxJnkdX8yKXE0w==
X-Received: by 2002:a1c:4d0e:0:b0:37c:b85:5404 with SMTP id
 o14-20020a1c4d0e000000b0037c0b855404mr6221882wmh.184.1645178815910;
        Fri, 18 Feb 2022 02:06:55 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:55 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 37/46][dunfell] grub: fix checking for NULL
Date: Fri, 18 Feb 2022 11:05:45 +0100
Message-Id: <20220218100554.1315511-38-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161925

This patch adds a fix for checking for NULL in grub's loader/bsd.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ader-bsd-Check-for-NULL-arg-up-front.patch | 47 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch

diff --git a/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch b/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
new file mode 100644
index 0000000000..34643e10ab
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
@@ -0,0 +1,47 @@
+From 7899384c8fdf9ed96566978c49b0c6e40e70703d Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 21:47:13 +0000
+Subject: [PATCH] loader/bsd: Check for NULL arg up-front
+
+The code in the next block suggests that it is possible for .set to be
+true but .arg may still be NULL.
+
+This code assumes that it is never NULL, yet later is testing if it is
+NULL - that is inconsistent.
+
+So we should check first if .arg is not NULL, and remove this check that
+is being flagged by Coverity since it is no longer required.
+
+Fixes: CID 292471
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5d5391b0a05abe76e04c1eb68dcc6cbef5326c4a]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/i386/bsd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c
+index b92cbe9..8432283 100644
+--- a/grub-core/loader/i386/bsd.c
++++ b/grub-core/loader/i386/bsd.c
+@@ -1605,7 +1605,7 @@ grub_cmd_openbsd (grub_extcmd_context_t ctxt, int argc, char *argv[])
+   kernel_type = KERNEL_TYPE_OPENBSD;
+   bootflags = grub_bsd_parse_flags (ctxt->state, openbsd_flags);
+ 
+-  if (ctxt->state[OPENBSD_ROOT_ARG].set)
++  if (ctxt->state[OPENBSD_ROOT_ARG].set && ctxt->state[OPENBSD_ROOT_ARG].arg != NULL)
+     {
+       const char *arg = ctxt->state[OPENBSD_ROOT_ARG].arg;
+       unsigned type, unit, part;
+@@ -1622,7 +1622,7 @@ grub_cmd_openbsd (grub_extcmd_context_t ctxt, int argc, char *argv[])
+ 			   "unknown disk type name");
+ 
+       unit = grub_strtoul (arg, (char **) &arg, 10);
+-      if (! (arg && *arg >= 'a' && *arg <= 'z'))
++      if (! (*arg >= 'a' && *arg <= 'z'))
+ 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
+ 			   "only device specifications of form "
+ 			   "<type><number><lowercase letter> are supported");
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1a4be33fca..8b55afccbb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -83,6 +83,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
            file://0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch \
            file://0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch \
+           file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0



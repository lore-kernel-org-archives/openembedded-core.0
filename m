Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A30C2BA15
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9987.1718288471114408888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ou7J/N0T;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6f031549bso10673335ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288470; x=1718893270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD++L7OdwUd0xgkA71tNDV5lOODqzBnF9/mLiv3ZFB0=;
        b=Ou7J/N0Tiyl+ftBRGPsyp7hNIcNq2Uw8T/J9dMOIaSuqKjEgmX1aL0et7bKmxQgNWV
         LEG/PK9Wi+Zt7RcryPxqEf4sjvO3XQD75D6ZLQhlmkzLVcZvojA4KYv1TzP4CPj8K9db
         CzFPPCypVqHo5uQUzMsDN5If6ftL+CXD8ttvdW3jp1C5yN1CUi5AVv2uxi9X/X3t2IzI
         G8j8M4lHdutqLgcUGtTcYWMlHl+c8jombKMBlMCk/2mHn+mYUQOBCmqcoLZfE4O87VvQ
         0RsbRnFSYBhlMJwrhBRLiNAz7SvS4A9KUf9VRMOrutAGL4xtq1E55mpnJUH2qM29fC+G
         zhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288470; x=1718893270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XD++L7OdwUd0xgkA71tNDV5lOODqzBnF9/mLiv3ZFB0=;
        b=m6KMteyrM8T/BEj/yKEjtX4H1jeeqHqKXMNTYjIMH4Rf/fvKL44UacJ8ZTv1Zz1GAg
         byi+zIjnbJE7clHJkxtZP7RCRY/1W4jQY8a9xdUcniZqISLPgT0Txa+qOqC/SC0zF0eT
         GxC1J0sJkIFHRWgytqj5vCGYlTYmhR9oYH5YIEz5FhYtF7ohPD6VjXZ/IDrjLMZl1adj
         3bJ4Ks0mfyDOdsnMnaHHHJgIofCDzErSE5R2kLrqD0EK8Yslwt3VAecE6R26w/yloqBQ
         U2ByOenMat1tHNA/gDC3vAUdVg9Ida0aYb5LoBQVdajkz0cU2vncj79sWYAvQTZFkmyl
         FnVg==
X-Gm-Message-State: AOJu0Yyw5bXQ/G18CZ/7MDy8h1US53FHYtykto9p8LY3QOEdhzZ8ue2X
	r4EAyO1VtNmBJsbrAxYP09yTtG97pALLSq7cvgxRQCevfkjGPXQoqglEtg/5Ukqv4dQAli05wDI
	H
X-Google-Smtp-Source: AGHT+IF18xi8FKLwl2Uw6sH3wcSmXGwKQSqtBmEGNkp2QX066Bhxja94STn1VTCqX+fSCBSjcit9wg==
X-Received: by 2002:a17:902:f54b:b0:1f7:ace:448c with SMTP id d9443c01a7336-1f83b56783emr52971495ad.23.1718288470302;
        Thu, 13 Jun 2024 07:21:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/29] iproute2: drop obsolete patch
Date: Thu, 13 Jun 2024 07:20:27 -0700
Message-Id: <2e3588ce3f0f14e6e0e6d2f4b6d8a52b68309394.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200625

From: "Maxin B. John" <maxin.john@gmail.com>

libc-compat.h fix for musl was obsolete after 4.16.0 release of iproute2.
Drop it.

Signed-off-by: Maxin John <maxin.john@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad57a1e124a1de7af7ef8479ed779230e923d3af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-libc-compat.h-add-musl-workaround.patch | 39 -------------------
 .../iproute2/iproute2_6.7.0.bb                |  4 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
deleted file mode 100644
index 74e3de1ce9..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 22 Dec 2016 15:26:30 +0200
-Subject: [PATCH] libc-compat.h: add musl workaround
-
-The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
-__USE_MISC) to solve conflicts with libc provided headers. This patch makes
-libc-compat.h work for musl libc as well.
-
-Upstream-Status: Pending
-
-Taken From:
-https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
----
- include/uapi/linux/libc-compat.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
-index a159991..22198fa 100644
---- a/include/uapi/linux/libc-compat.h
-+++ b/include/uapi/linux/libc-compat.h
-@@ -50,10 +50,12 @@
- #define _LIBC_COMPAT_H
- 
- /* We have included glibc headers... */
--#if defined(__GLIBC__)
-+#if 1
-+#define __USE_MISC
- 
- /* Coordinate with glibc net/if.h header. */
- #if defined(_NET_IF_H) && defined(__USE_MISC)
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
- 
- /* GLIBC headers included first so don't define anything
-  * that would already be defined. */
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 640b3013f1..442c6bdd4f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -11,9 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "flex-native bison-native iptables libcap"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://0001-libc-compat.h-add-musl-workaround.patch \
-           "
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
 
-- 
2.34.1



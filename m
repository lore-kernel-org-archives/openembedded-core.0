Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C857BC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93235.1782742827419384837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T0WDi+Iy;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-470174001a0so1491771f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742826; x=1783347626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYxudwPqD6Vu2nOqb9IemCfdpST4RcV1eQKwzYiQ8ZQ=;
        b=T0WDi+IyTs/K811nCDHLx2PVcLzTnaa4Pe0nBTsHXPt2s09oHpnN9aS6UA/ORgyW4H
         CNdy/tdgKVIRaf0XPODrFmhhhUBaEfkJeXOoeTzxs54PiMZZmgdRNNvHGM6Y7YaTz4OB
         sVgf/19gZx/C/f1n4YUQ0ZWg0OpGjdBNKiv5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742826; x=1783347626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eYxudwPqD6Vu2nOqb9IemCfdpST4RcV1eQKwzYiQ8ZQ=;
        b=Dnr/aeY+6UiyMiZNf2JQ9T/EA7FLZqj3WxgfGYfv8qFfcriVO7Gr/k+OCGwDWv/Wdp
         qGFSDcQENQP/B93+lo5mYQL1IX7UbdRZzYUx+86QqikQlA3VWeD1bzJQUMW4iOWA3Bjv
         VpN3SNtKy+VRvSaeT84hksjKjQVSV2U56z7PGAb/Hyah/41Ya0jZc7KT+jyCGUlOzQeE
         Rz2+o4FaSy5VaVn7cV72OOAwhGl5DHG9u7wlUz8G2825Y2+rMDvBvCqb6U081Z6v6loV
         FyZTEb4KwbhjXF32ZeJghw3/YNQPqYVjH2HAace0Rcni8UNi5O/jvs+Iz+mndEEVFZVd
         d7mA==
X-Gm-Message-State: AOJu0YwL6MLRhBEtP5W0gkDwUBbZDcWv3kDE6irF8iYP2Lv2U7AhISZP
	mgwNGq7rDgXqVdWfsw1lFFonUGgqNvcCvSWBSXiltUVeiKK2+aTSCZozWRLrz0iFlzLK0FI1jXZ
	ZHiveOnE=
X-Gm-Gg: AfdE7cmA9nRF6y89LuADWLbKz0uRtU/FfCEgYAWjbYQZck/plS6HiuYqc9JWj6ajqPA
	tPxUwWD+HAdr0I+LcMLZnc0sHH1WxoJh9lJxmwskEFY2DUa/Jp8JvabX+z64QB31v8zl6EzFSs+
	u/qdLwMy6VUWoadD//RrR8J+ufPESTa2a60feA5PJ3c2WeqgU6jwfkZR/Oxs4yIQp1z/tbF08h2
	eQpH5BKMpvwq0SiTzRrNxRWgFFX/jqOX8phD9OTsWEyjYDAKdPlKKV5hE53o3qEjua1kyzGAjNm
	6sC6zymDP3YEUrFJ77zLCxp9yjeJTFmRIeTjxAjUqwFZvlxMK2ohRjJb5aaD8jddO5bPhcEM35S
	zfFMrOlJqvgdy0PdIsfbncZ6uM8RD3IOiY/VFifibZMMAMQ3QVl/XbOVoJsO1ASNQNZGDfF1aEw
	lQ26PpRFGrvYbjxJ8LYp5XLURsOIKCJnjvgr5HhmhXjgqdro3sn/bLHYyd/p87SWd+3NZVxw6jr
	Tu917cy0TRuH/4gq1LByqU=
X-Received: by 2002:a05:6000:46ca:b0:46f:8cc5:4548 with SMTP id ffacd0b85a97d-46f8cc546c8mr12381127f8f.9.1782742825573;
        Mon, 29 Jun 2026 07:20:25 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/19] grub/glibc: Bump versions to resolve hashequiv/reproducibility issues
Date: Mon, 29 Jun 2026 16:19:47 +0200
Message-ID: <a455b21f9170b3f2d74763b5bf99625dbda81ff9.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239790

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After the gawk dependency change, we need to change PR/hashequiv version
to replace the corrupted sstate/hashequiv data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0f7632595792a73ea0a935b924e8bdf9954ec7b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/grub/grub2.inc   | 4 ++++
 meta/recipes-core/glibc/glibc.inc | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a2173bee04b..dfc87eaa94d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -44,6 +44,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61663_61664.patch \
 "
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 60e3daaf326..a3d0bb40713 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -3,6 +3,10 @@ require glibc-ld.inc
 
 DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils libgcc-initial linux-libc-headers gawk-replacement-native"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools texinfo systemd


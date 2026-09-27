Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F49C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33579.1790495021473427915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pe0IANu6;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso2790545e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495019; x=1791099819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfCYmfmmfiw0ZvQn/582uN/Gss5ZZgKQHk4Km4WHwuY=;
        b=Pe0IANu6wvFHAbr3pbmW7SXgqdu25bhYkUUcw8NraZYOFeuns8+Uw14MUnCiwjonE9
         +viiX7ChhicisZ4uR8t+gB6XQlY4pfGZVq1bEX1twsivBorDLGJgoLb2K0AANMj5WOBC
         j9Bvd+6idfHFPiO1ZpRRsFglcd2VETifRbeP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495019; x=1791099819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TfCYmfmmfiw0ZvQn/582uN/Gss5ZZgKQHk4Km4WHwuY=;
        b=ZJ+XZIR3Px3lLwcG6cfIfdjuWt9oSlDS30aSmKY0Q5ERmRfqecFrQQFgXU7UoNtOjA
         WLTn2PuI/tVeu4qJj3BS/704dn69woOJZ2mPdIHjcUo83NtkJwqSWkvc+JCePe+V3Z4c
         ivYbQ4nRcK8+Y74QpMXhcYK8AynjaT36V0ROFMmayJeHRSoEcbfVOJvqEx/tdlR68Vrf
         J9tjXRRxkSzRJFcZ+yXIdAOwJoz8AvGeUqhH7p+dK9fip/7Dc/3P8jP414Qo863RB9NQ
         AoegLKFDW1cFRb3QOQ4YaLNW3ZlJtuOz7u8GWT3LAQkoNuGuc6o20oq7CL+5yINaFJrZ
         XB1A==
X-Gm-Message-State: AFuF++mEl6QeD+but1o6Zh6fSExaH8/rReiSGZi2/ds6+Ab+eydZjFK2
	tv+Xb9Dq4JJI9aK7e3rXh6r0v9dCS8+8rhYW+3t8XVev7xrs7HPYFVpJ7IgerDZ/9cEn4FgaWUg
	iq2YTkQc=
X-Gm-Gg: AYBFou1IYjz5nDI5apZ2na/wH0gSJlfyfDJabU9GMpmfpn+T7MGOr/cULDyXT0xdW+l
	Z4RaePlDlSD4JbsYE1rlv2rvaYujEwyX8o9wz57iWrA2vzsqysZ6QlUCLjXdndvJV0324n0Y1Jw
	ooXxBEIqLg1zr3cc7/mLl1s2LSWsCMytCOQcj45ervIm0bSaDVCyzEguDflkk1c8nADeajy9Rif
	7U4/ddSHFcehpu7zj9NSEQ8W5jvoc9k96p9hJboohmGXHfFgEn4U/se8P8epJ3ZsUjr+R3UrB+u
	HOUv1wNklWQ/pZJ5Gb2L42hZjHBslaJQKAUtAY0Fw/o08croARG9XGlOF0A5PVMzmGR5VAa3Lxj
	MGVNJn4mPlRRNWft76+Il+uSVgS91hKa2wZ8Cn/tYUsHYS5P6JhrKRPasswi6Be3nKTTsGmRlH6
	t+5cEsRsR5v1CWNasyRQ6QJWIGGVbiuRCWVi2vwDycBOukdfCpKebq1l13lkbvpOE76QFVHI4Xa
	JYRV6OU742Z4Knq7VC094R7ix3n/BIs/ItF6AciM4k7DYWG5Z0zRSyT4hTOXmPk2UtB25WykQ==
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr5490375e9.34.1790495019583;
        Sun, 27 Sep 2026 00:43:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/28] cpio: fix "CVE:" marker in CVE-2026-66484.patch
Date: Sun, 27 Sep 2026 09:42:53 +0200
Message-ID: <ead2a6e88862b8493b2445c08fbcdb96b0a7f87b.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246652

From: Yoann Congal <yoann.congal@smile.fr>

"CVE-2026-66484.patch" should point to "CVE: CVE-2026-66484"

Cc: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f561c3454924dc288c86be0978bd2e2038785a8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cpio/files/CVE-2026-66484.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
index 97ce9a785cf..538f80daf9b 100644
--- a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
 
 * src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
 
-CVE: CVE-2026-66485
+CVE: CVE-2026-66484
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---


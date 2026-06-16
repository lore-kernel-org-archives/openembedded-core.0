Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D25BCD98F2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5750.1781637402236913166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ECv/44sp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490afc47455so22623885e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637400; x=1782242200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0WFzE2imJ6wjBVEqLT96TxVkaCWCOP5mfjkxsRO5P0=;
        b=ECv/44sp4sztZe5G2LiDzybxgzJxvWxU7lN6tfo2sLR1TGDcQ0mEhAY06zYzf61K4P
         PGiQE/aowJw4vooVMvkc9QC6Q1RUJH2HbZt/AKja/k9bvmlntauhxmb3Feqc/Xt4NvHy
         x2A17820kK2ZC+NwRwjKO5O26Mj9UaOgm5gHbXmQvttmGZ1HqmVj4bwlti5f25JM56Uo
         zKcmPtpVmqj12oIQJWv2bcpOtD6CcEme5aGaFjYDZIV/H1fdt7ZkVdTeYu6gby7cZb0T
         YtJb9axMuRYgZWZwTVnjY8rfhqwBemdugUE7JQPEbk/L79KVz5zuMbwY5jFqcJnq2FcK
         m25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637400; x=1782242200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0WFzE2imJ6wjBVEqLT96TxVkaCWCOP5mfjkxsRO5P0=;
        b=bnSJr6eVzuECTPsvklcHaEU3xLG8rG2WF3NuGf06yYrWXq2fvVaSON3o6URxSmOWOi
         sDOgf3mpPvAj6gmrQxJahAYi0uUif3M29DKIOJSQu+IGtmc7th8ooeeA+CyehdLzuImY
         1vex/oaP7ACMDj4Q/4mDOvHOeJJu5aafvfSeVlgdgRhHdyLxAjicXrypDdhEg3ThNYBs
         lGLiQoUN431LXkZ+8/pBn1OBFzajEYuFfhwikD2zvW1mRvDhJX/syR9CoUPqt0efVsUe
         /Mm2OUIN8HZcrxQAvmaJVQR7ThspALe/tFWpCqxSN/3CoevuCun3sIA6zLotwOvceMei
         PjAA==
X-Gm-Message-State: AOJu0Yzs/22z/4rLHkEAxYXepAnbkwM4XgXJw+VljO4fJ7aLd91qR7MO
	OAyLqkjcY0Y9u0vsgUaJFs/8gSHRm15CuvfcKcazLM8c13t9+MEu5VS5K0at5OHO
X-Gm-Gg: Acq92OEqlhyjXpFv/D00uXKuddU2WCOQerZNw1PhWcPovvIcNd2+Abjx5Bdqa7Y6DYs
	IhjGIoq88BEgGyaS2mHWKEjxJnfl3xdInHfjeK1pFYpMv6E7vB7Mg0eBXevpbQfNDrdGv9ImVEm
	+hZnRrV/5I6QC9E/YMdyEgU6t96+FdW3fuMcZZ5c+H8MSGZo/xvXM41Z/duOVgbFViIFsCYuwmM
	tGo4s9AaG5qDAQTcONHSXmGg8LRb8tDaC0poG8V6DJVPJZ0KhdHO7LRgwnJLt6OYnx3t+11GE7D
	jKzUss+JpMrlL+arxvkp96sMl0O7pvXQvWApeWELqthmCrvjQOCsqbwe7l1C/dyp+cNnR/Eh8sw
	AbGVie5Myfi1nx9isq2x0FcQfOpee08T/lpu4b3SN5eOFIPiG5RBkiHXN1eNM3zswxbYJ4l8IwA
	Ht38NwsjyrBaowbxSyqrKxYk6z3j0qRsH1iiRw02OJm5gGYHuBgFeXPO+H/js=
X-Received: by 2002:a05:600c:c0c8:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-492333af102mr11858265e9.11.1781637400449;
        Tue, 16 Jun 2026 12:16:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/30] vulkan-utility-libraries: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:16:04 +0200
Message-ID: <20260616191628.2014553-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238933

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...aries_1.4.341.0.bb => vulkan-utility-libraries_1.4.350.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.341.0.bb => vulkan-utility-libraries_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
index 46d317adce..600d88dcea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a663eca87ba71294dd4b74ba9d3e64a72d725453"
+SRCREV = "a96bd4933c6adfc21329d15e9999791a0153bbf3"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.3



Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0C3C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 08:29:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1335.1653640191570437539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 01:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wp7dgIAY;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so1861235wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uph7EZJ7+3Bdv7W3YbEopPQiEjNTmu8ER0eVz6EeXkE=;
        b=Wp7dgIAY9cvtQa6INzd/pkxTc8e4L+ltYaGIwvUHcAFD9tOAD9HzkcwTmPdiwpUYmS
         4fA2wiShELlViSJjxgH49QZ79lKFQ9RrOkADpFbB+83FzpTddMW4ukEU5mgi19eGCo7T
         B1cUG2jdzYZUb0tYuwKlWNupe63FujZ1NPAQdqqBa1rkJAOOSglW0Ry/TM1a4LsREffr
         zU9v/4UVjtTLcPFTFq+BgKwJDegvcL/9O3Nx8CxyPM2H451elA6CIzYXZ35GkcPoa+U5
         uK9VZmHlYZZ5+AnFaxJDbYyKwUmGxs7x1eYLU2lrVJWnAfCFwH3LEWs6WPVWx6SenFIf
         zUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uph7EZJ7+3Bdv7W3YbEopPQiEjNTmu8ER0eVz6EeXkE=;
        b=YEbmIbS6vaOx4rFv14LTDrJPbPTbvV3d3NNdqlqZIppE458Oh8mWx7+XRgZqtrFSn/
         tJqky0UQGEoCrCOTCBWTmHc1WOPRKVzqJGPjurP57GGrKtUBHQr9yM7XFofoeig0Cd0t
         RYfZWrUXD0WzTVU3vZFNoXToXVzd9ViRUVFELZ8CJPOTAwmoZsxp2xf2bNe5Yc5Uc0yb
         GYmAlTNq8a2kiS+vsQ+F22lXKaypVg9P2sKn+k2GWcn9IFeJbUE6zj8HMrgV3/qh6eOv
         9YLD3p771mmjtpMLyFVInyNYS/J904mLRiVILUsTqar7x+Ckeo/RsJGj0QpWkTOozK2r
         DRCQ==
X-Gm-Message-State: AOAM531WxtefFL8fvZHECATU4l0UK896LVfYxBceg9E/r9wsRv9az+q0
	nWA2z6G3YKHYp9tGi+RcdkP0pCY/MF0=
X-Google-Smtp-Source: 
 ABdhPJyPxVlXvE45EGZLieiB69kxDlN8zPZqUM8Nm6HsUhk3aYmDWd4Q2l9h8NRGDj3TkEfleLGZiw==
X-Received: by 2002:a05:600c:154d:b0:394:8582:58f3 with SMTP id
 f13-20020a05600c154d00b00394858258f3mr5865712wmg.90.1653640189428;
        Fri, 27 May 2022 01:29:49 -0700 (PDT)
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a1ca107000000b00394708a3d7dsm1489638wme.15.2022.05.27.01.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 01:29:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] archiver: exit to avoid race conditions
Date: Fri, 27 May 2022 09:29:23 +0100
Message-Id: <20220527082923.3652488-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 08:29:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166203

The archiver doesn't support using multiconfig sharing the same TMPDIR
so rise an error when we have something that shouldn't exist.

When in the multiconfig and using the same TMPDIR: the two machines can make
the same copy at the same time to the same destination, which will not work.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c19c770d11..5514e44a78 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -486,6 +486,8 @@ python do_unpack_and_patch() {
     if d.getVarFlag('ARCHIVER_MODE', 'diff') == '1':
         src = d.getVar('S').rstrip('/')
         src_orig = '%s.orig' % src
+        if os.path.isdir(src_orig):
+            bb.error("A previous copy of the original source already exist '%s'" % src_orig)
         oe.path.copytree(src, src_orig)
 
     if bb.data.inherits_class('dos2unix', d):
-- 
2.36.1



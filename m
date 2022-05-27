Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7798EC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 10:29:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.2135.1653647364898022108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLrvV0Mk;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so2005836wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gc0k8pQdD9p1zlfurTziGSlu9of1Np2lA03w8bmF5lo=;
        b=jLrvV0MkU05OZY1B2RR0re74A+brDVyxGE8yzSFT5fn/rlr6JbOSYSwLt7hXPkgxb4
         CJpwf+IU3jFHNGunVvKvXmDJ906kea2Oo+Unv1fNSPkwqwxAg3ZyjsA10gKE6fP0DDvH
         scqgYu/IIRQA7W9z06MC24txm7+5ei0ZSauDRLDYgzHjNX6qBJOklKlRbVIhFO4Ag0qF
         GEUX7RorAKbudvjlZx22X0Hm2SETn6Mfmsv2DRVvNxa7+GqFKxrpg0Gpg5pJqPDTuk36
         hHDen9GGvgqPp+lobpEGsLnBQ74oE4ZelVvtCRWXkGUzmC2K2CLzby8PbNoAEmj59tfK
         Sikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gc0k8pQdD9p1zlfurTziGSlu9of1Np2lA03w8bmF5lo=;
        b=vwyty1TQoQYBGjam3NkiJ7aeEUmx79RT8gP4eFhstOH9U5VyToLgODh6aZuY9J9GrR
         sB5o9GhOPBECubXoygCWSzgGU21T4VkWvrXiTG4fbs4UF4gHiiCTKFIfxom5ibqJyZfR
         iaXRRezK+S43+lluou69GZLTR5w0WqhzsYQtHfy/Bbi0HoLUP5VW971jqQQorLkPard+
         rqyEjtAxpkbezMHuxsbzjatCb7nPWG6EnLcoaGciT6JAuOZUeJyIOvyf85mW+lREcAMc
         uMNwnmv0hROwyy8wSQI36W0ltOWBTCJbz8y2mv5neB9OgP6dfyrv9VxWlzHsfx6lPwb6
         TbUw==
X-Gm-Message-State: AOAM530zB+C+1SKYCz2UDXZC27TXmoi+zKbxuKSNidtKmXYIrBgSIEqe
	xABbH8+Hqma/0lKsP9sBX+XVH8FWKvQ=
X-Google-Smtp-Source: 
 ABdhPJx5+2IBf/y8Vnx+rI26H8if434dKqGZdAOYQGHO5o7eyElvj0+fhBwO1/vRRwHqXXEJP+1U9Q==
X-Received: by 2002:a1c:ed0e:0:b0:397:2c71:c476 with SMTP id
 l14-20020a1ced0e000000b003972c71c476mr6355502wmh.113.1653647362778;
        Fri, 27 May 2022 03:29:22 -0700 (PDT)
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a5d66c5000000b0020e5e906e47sm79530wrw.75.2022.05.27.03.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 03:29:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH v2] archiver: exit to avoid race conditions
Date: Fri, 27 May 2022 11:28:02 +0100
Message-Id: <20220527102801.3733241-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 10:29:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166207

The archiver doesn't support using multiconfig sharing the same TMPDIR
so rise an error when we have something that shouldn't exist.

When in the multiconfig and using the same TMPDIR: the two machines can make
the same copy at the same time to the same destination, which will not work.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: replace "bb.error" with "bb.fatal"

 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c19c770d11..87c0f90252 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -486,6 +486,8 @@ python do_unpack_and_patch() {
     if d.getVarFlag('ARCHIVER_MODE', 'diff') == '1':
         src = d.getVar('S').rstrip('/')
         src_orig = '%s.orig' % src
+        if os.path.isdir(src_orig):
+            bb.fatal("A previous copy of the original source already exist '%s'" % src_orig)
         oe.path.copytree(src, src_orig)
 
     if bb.data.inherits_class('dos2unix', d):
-- 
2.36.1



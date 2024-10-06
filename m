Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7FFCFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 06:57:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.26956.1728197870229842774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Oct 2024 23:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQvPVLVg;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c46c2bf490so2154744a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Oct 2024 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728197869; x=1728802669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk7zTIrqq2h1z+TDrUpe62gpMgElY05Gp2z+ySZlprE=;
        b=eQvPVLVgeBTyFXPQXM8acxXxhOMb5ittj2wGCKJJb1wv0w7pPVUmERr/vLzi/uzbXO
         ZAM456DCb08WLa0hBhYOcleV1BSXkBnTMPxZr1kurtSvwCEjJrSZK7R1x4dkokbzS/Ec
         ueKaa38UgFkTMNZv7aJE1ZmG5+WRsE3i4L8HVtN5EmnBwCxntJpkG474Bx8Q+A8wkFYQ
         LQUL4UjKBC/oht4budrzpI0TYjwnLMRIT/QBaImpgeTKiHSh5yfodyMpoSUPaS86mm04
         PmyW0dzdSBMaLKHHTjSPG2eoI9nq5xEZGiM4xc5XTq6QRB+wEu55c7sMAbGRXuIrRVlm
         7Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728197869; x=1728802669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk7zTIrqq2h1z+TDrUpe62gpMgElY05Gp2z+ySZlprE=;
        b=rV6jyfi19Ana2Rl9vT6CnZQlDA4wbqH6nPL20MY4EgOx3paW8frWc68NyjaQkHapiU
         91Xxp65DeT//vVXliOPycYh8zZ2HJYs+uAbocSHWwtRimTetYLMeQSap08rDZuNnilFI
         R/m7ObiOGyRTChd9/KW9dtdS4ci4eLx21JXUPtWlGTIgvLqa88KGfS/jl1A0j2EEHfBs
         iw+GZl76dOdIuPZPVaIxsmqeTcMHxyq8mxopkPUlYamBsgtYCK52UtxiRZnJPMIIuVnu
         cJob2k4fkXChoeW0mLbAgZqKakVPCwX6nY0UalNVWupGE4xBMi1vXV7NHFL+h/VgM8Ly
         Xf6A==
X-Gm-Message-State: AOJu0YwZroqSEPFYP/p82xy8SLytOSYDsYA73oj07cvIJuz0ZKBSZWu5
	+o/QPwid7JhX6I5qddE3IzP6y7FgJ7lGcsAy5NgbbaFsMOLP4zL46kAhSg==
X-Google-Smtp-Source: AGHT+IEk4uMolxkfHMuiNEBWL9cUjlqcI0AUsBtLHjc3cYQvfj/zk5Zv/6UGsicypKCIVfeOkxXFeQ==
X-Received: by 2002:a05:6402:84e:b0:5c8:9f44:a0b2 with SMTP id 4fb4d7f45d1cf-5c8d2e1765fmr12562236a12.5.1728197868348;
        Sat, 05 Oct 2024 23:57:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994f3806cdsm28386166b.118.2024.10.05.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 23:57:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] meta-world-pkgdata: Inherit nopackages
Date: Sun,  6 Oct 2024 08:57:46 +0200
Message-ID: <20241006065746.3022-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 06:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205242

Since this is a recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-world-pkgdata.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index b299861375..96051cdf9d 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -27,6 +27,7 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
+inherit nopackages
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-- 
2.46.2



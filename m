Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80665CEE32D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:12 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.21044.1728490627744257141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 09:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x1F6Sq6S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9ff6fb4c6so5763870a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728490627; x=1729095427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQaF0+K1qVqeiDMUpxaOhcn+N6x+FaEpSNN80EPds2s=;
        b=x1F6Sq6SgUFPs0IieD+UQz/bvBiaqDB1H+k8djI0AI/tMDw44viVT3Ziy6oe5ABgTu
         CblDP+Z9fok/3jt8qZ4mCQjcwfBP7+ySjpEXc5bOF+sazfrSe0m7QoUFEnlOV8BEasZg
         umJssTx2NOUeaNvd29bALcttte/nnx1l5jk1RHcyVL6e9n2NbRVT2VANoz4+3aNEl4wI
         T1fV3bPEAumSxhtwoHa+bR65/gIJfE4bw2DS0TfkrS8aIPhFWy7HZUCDykfH8VMqs5Wo
         oVbq7jxLpjI26Qy0ecqY72Wqqlt4XoHlgeWzD8Vw8+3uJfjxJmWGpL3AfOZxIDtdidVb
         Hg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490627; x=1729095427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQaF0+K1qVqeiDMUpxaOhcn+N6x+FaEpSNN80EPds2s=;
        b=wCakNPwJ3goEVzu1KiaMLrmZs0akgIUSEri3CLHuKni846FI6dywzpWMjo6TcjamXJ
         MQCSbDSRYF/xyvl8wKfuu8A+GDYgrlwO+hYNtf+++8fib4og3oNVLmr4u3fDqjqk3n7c
         qBkFHTWQiUzimu9nticzRCzIHe2jROculREy6QaZCBgnxeqLp4YVORw8uwEPDofeSzSB
         lga1ONC91LWdpeBdHCaGM4xU9iJgSM1iT+5+ma3nGxzM9u51qZzsEaB9qcCrFAD5lqkf
         7D3SXGEoxt9pS1HhojITNNR7txSZ7OI45tML3JAA+/+KfrmB741EjgAhtLAylOaPtwL7
         VKEw==
X-Gm-Message-State: AOJu0YwgECKyKisAT+z1H6eqHGg5Q+n/sTekQSoL3AlWxFbRQWtwQVKX
	i167fmGbyODAlLjp/Z8LMMHoihWHRTrZHNx14Mp4CEBNJ8gGdQUwMRvgZCtMlk6vdlaYLP6CIwH
	X
X-Google-Smtp-Source: AGHT+IE7mi1yitMK7G4AA9uhh9R1EJbfmr4rP6f51o3ga1nsAJ2GrbOi1rViZcU+Tnp6yV8H6/w8+w==
X-Received: by 2002:a17:902:e5c5:b0:20b:59be:77b with SMTP id d9443c01a7336-20c6375aef8mr52475795ad.6.1728490626849;
        Wed, 09 Oct 2024 09:17:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13934817sm72545045ad.158.2024.10.09.09.17.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:17:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] meta-world-pkgdata: Inherit nopackages
Date: Wed,  9 Oct 2024 09:16:53 -0700
Message-Id: <fc8ad580c5d76266ad722c9429f39adf5370c2fb.1728490465.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728490465.git.steve@sakoman.com>
References: <cover.1728490465.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205363

From: Martin Jansa <martin.jansa@gmail.com>

Since this is a recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D77C001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:40 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.9007.1689690396642331346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HqnEqVno;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66767d628e2so3733688b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690396; x=1692282396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW7Wu7mxAK+eXexbz9GTusNt/WCsgIZSbqYMWzY1VWE=;
        b=HqnEqVnoeV3zfalb4+6UF/D1LFY9vGNYle3RbbT3ZAPmLmYfVh5BbKv961Sf5MPnxb
         3vD3UfxXkqo49KyLRsKD8hiZazDHRE7c9XrIkMYL93fAyUGwnHTD/uALbPjdTrs7g/L2
         VEKPxDA/HNCk2aLJINusOcn2X4gaVY3qLJhg5lxmtlmKlu7Oi9tV2WdDLh+bpHhaY4wL
         +3EPRejWAyjGyBZpBzSyAzU85yc+iPBEU4j2K1OFFQidAyD0JYhLLy+sgApFtnzg1FHf
         7+oCGTTK1ECvaVLJ+80DC1QSl0Jkb896hMocZ4vyaQrnBlYkUJT+Anm3/gtGMb2FDd9R
         mKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690396; x=1692282396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW7Wu7mxAK+eXexbz9GTusNt/WCsgIZSbqYMWzY1VWE=;
        b=RJu5l3CH47D8SrCETieeP2YiVtjfhRF1QY6WGOgkHZvZJWAN+8tO5zFhukjDk0/lju
         vBanuU5V+1yD0Y7klWvfFgq4P7Uhb5q/0xl78YiOaOfclfTSe1htSxCbu75erIMyy5ZT
         FywXSUQkYS48OH3wrPfWzhKNkYZC2IIJ8JHyG4IJj7BXVfI9nd0QI453LmfuTkGA8YGi
         qjhxquF93sU3+cisnM8PCKlFD8vn2rFvRZPayNos7eFIGWybmwzJqHClscXJrnIfSr+T
         bhcuZqqlXRawMFyOg56IHvfW/quP/J4W3/9eBqOHJMls05rE1H6eLBgToYsDr2BTp4NB
         ZA2g==
X-Gm-Message-State: ABy/qLaQjGn1Cq6Kc+mRW2xICrJbuYdAT2hh2CIrhZzW2EuLRZOXHOTM
	APTls9brgGcq87Wd5IWp871E7b1A4c4tGDTpZLQ=
X-Google-Smtp-Source: APBJJlGiNCgp8NQlVsrusyh2//t1hAwI1e293G82S8BRhDPvPCQHgRy1FKBSKb+boPZhU6Hfud/+Wg==
X-Received: by 2002:a05:6a20:8f2a:b0:12e:7c29:a6dd with SMTP id b42-20020a056a208f2a00b0012e7c29a6ddmr15132485pzk.43.1689690395729;
        Tue, 18 Jul 2023 07:26:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/27] linux-firmware: upgrade 20230404 -> 20230515
Date: Tue, 18 Jul 2023 04:25:44 -1000
Message-Id: <8ac5ebfa83c3e1f5effca5154b771b2f2bed607d.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184514

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64603f602d00999220fe5bafeed996ddcb56d36b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230404.bb => linux-firmware_20230515.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 7412c022ba..3470131294 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230404.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0782deea054d4b1b7f10c92c3a245da4"
+WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c3f9ad2bb5311cce2490f37a8052f836703d6936aabd840246b6576f1f71f607"
+SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
 
 inherit allarch
 
-- 
2.34.1



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398FCD5BAC
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7373.1779265259205730946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uwyYATS8;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-448528f4e69so3064720f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265257; x=1779870057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4XlJIzQ5ChvhcDMoRDlo67Z6JVWb63GAHO7Dr21kR8=;
        b=uwyYATS8xpz9dncZ4BmYRqCS574VoGhMdrlE053olRSE9gpUqn3Xthe8xPkMswZeQ5
         rJkG47xPTvgQZLR86cckx6gNNqBIhg3CO0/+Nv/6nWqZY/Ft3j9+E6/IRQhOVZJCCFSE
         q4PiBgOe/SLg+AQSc573uYqqlLBpXaRm00d1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265257; x=1779870057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4XlJIzQ5ChvhcDMoRDlo67Z6JVWb63GAHO7Dr21kR8=;
        b=DVO7UW0/eeNuON6utEa2M5olML9f8zHQU0hxS+SnFjTcb98TIJGxzmqXxRbxURh8FD
         2R2GKULPSo28dXC3MrPyemwT8Apx1vW74gtMH4pt324CWnInZdJkSkoUWlakUTdxQXDb
         phH3RSl5hDrMLYm8iE5bH3tJeTEoYi8tA+FCWVE+RNutxP8rFPCjWYcqcx2q1XVRtdFQ
         KN2nSUZZARMaKjcV8YFV38CQy9iyqZTduDDgMv/mAZ0U+ODRepMVm3YcBvSZ6IEsg8wz
         3ANa50qaS3OCz+I65p32J5ekkDBX7MBzd1rtsWwySmnAWyx7oeoAb+AVPN5eIbk7A4Ls
         oe/A==
X-Gm-Message-State: AOJu0Yw4rvkpzkQX5uYMHqO2W8rFL97m8WxJ5myxlhX6NwMAsiPlw4Dp
	VW42AhSAQkOqIyL9sCvIyCn7Ky+ld/kReFUFniei9fCXFUJJf8dddRi3BFDKH4hcdtPlU6piTmP
	GGOyG
X-Gm-Gg: Acq92OGITwGP5NhQOGh+hI8Sl8FlG/wuoEpbrxWOHQQiUKP/IRF+Cs0WB09+jU0I3vo
	pJB0XTL6VBnu4GBxNK7yaChyJRgh5fJm1+XAw5Um9PB4EOeSIBo/6HE9GITpXHKGnK3yiVsFgBd
	28FmP6W7aBNqq+P6+eHyOAZhsH6B2MUOBGgNzH8Mk2W+c4vqbzLSuicwsER3ESsXwvTlV/t6Dec
	+aNclZLVZgolsIGvwsIxbFiMpyZ1Hfr4FXRXcFTU4TRfYl5r2MGS4exi80vW4JjOewjEXmwmnW6
	YfFvxiIohVNLrMxE9QfNC3PXZAAp8fbk/wOa/Jf6d5pqwkOp/ttHz7f7eF2mimb6nSOfThDesfw
	jYUp+kr9XIsDmL7RtR8fqYICcI+0yT+tjYX0TJ+sdYv+CEIKo7nsFEDugFEYgZSbMAJNffyVkv9
	wvf7zvXU0ENz10cJNsGesmwD4MDFIIslaP9xqNcSf/sqsT8YLuu+XLOBFw1wEMl8nel+Sjx6lOO
	4QZIkFe4ciASNSoBZSoXX5g6VIV
X-Received: by 2002:a05:6000:1ace:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-45e5c58906amr35895794f8f.10.1779265257122;
        Wed, 20 May 2026 01:20:57 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 04/28] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Wed, 20 May 2026 10:20:05 +0200
Message-ID: <b4f2d3c86e25f6eba91ecb3fb3a3ae5f9f7a452b.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237403

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 97a940bfdeaa3f9f4442a6fbb0fabe1ce5eaff69)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c8160434..a70e9dd0dae 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 


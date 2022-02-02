Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41997C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:08 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.2279.1643826486751331367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NCelPau5;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id m11so336555edi.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nUQ+KHPZpgL2m6X+uUbuTSaxZxKPnZfX0cw6RdRfK7g=;
        b=NCelPau5e6ARCGD0S/yOmlClfhajp+hnaitzWqOpQUr1YKikZ+Id8+3ZLa0jSgW+xO
         AMY7zpkLaNjU75MhMbXTLHBMc5CUtQe4jUk4b9RQDSCTWrVEJNdKC/uXyIpKHQNQxIYj
         8voojg/nyq/LIgI1IBvJjg+zuNAxuE2LG6xCp8OlSdTTXCwZuYEbuEGdDuqKOzwVRuTb
         IvDMbqXOUBghACjaY2o5U8Shfbm1W/+OnX4IrZyRu2R805GSFS/Tc/dTLb4pCCYh7qPS
         QOxIiISVq63nFkgJKlM7M7XKYlFeuVHdo02XoajM23WLhD3uPyQaNIEWsFVVANTHkjzI
         AcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nUQ+KHPZpgL2m6X+uUbuTSaxZxKPnZfX0cw6RdRfK7g=;
        b=cUvSL1beQCcCuxJrA1Kz/ACboQo2hqCSZjAvf/2Xb7HcYJ/ieLoyVz1mBjoI6LFXfH
         53UUIcIjLSzQ9muwoI/fX4TegeNCW2QHKYHjrUHgcAsJ2bALB5fja1SxGd1PujIcwh/B
         t/9A9L1MMPEZxTe0EW/0v9Xk9iHYSVf+us7xuDWSMdWBHMOqTzqrWwlTnB9bv1jZf06i
         mf19tYCvfA2Q1u5n5+dK7izHe20g3h8/54kqwuzpJE0GDYkosEHBXiu+ym2pg46XJF6t
         aNHt7bI5Y2hzs92anOUX5Iz2t/Mkj+udk1OEb+FBke+tuJIvEDeEl0p401GWKiqR0/cP
         4lyA==
X-Gm-Message-State: AOAM533xuf5ysM029KbTJNcwDVelvbxfO4fB095V5XHx49fi6usR6dGl
	8AOdDDu1EMThufBHh/zxg2dfqamXnWc=
X-Google-Smtp-Source: 
 ABdhPJwaS8ln2ZJ28bJqXA96Nstyc9aFhvRZi6xxIzLzVcqA8O7GEBvgiFysWuerDka8BZ2gZG2SUQ==
X-Received: by 2002:a50:baa9:: with SMTP id x38mr4410394ede.213.1643826485267;
        Wed, 02 Feb 2022 10:28:05 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/33] connman: update 1.40 -> 1.41
Date: Wed,  2 Feb 2022 19:27:29 +0100
Message-Id: <20220202182758.919991-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161229

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0002-resolve-musl-does-not-implement-res_ninit.patch        | 2 +-
 .../connman/{connman_1.40.bb => connman_1.41.bb}                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.40.bb => connman_1.41.bb} (85%)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 9dca21a02f..63a8fa81b1 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 01974865e4d331eeaf25248bee1bb96539c450d9 Mon Sep 17 00:00:00 2001
+From f2e6254a48fc0bb41b1617b7832aed4977230cf9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] resolve: musl does not implement res_ninit
diff --git a/meta/recipes-connectivity/connman/connman_1.40.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
similarity index 85%
rename from meta/recipes-connectivity/connman/connman_1.40.bb
rename to meta/recipes-connectivity/connman/connman_1.41.bb
index edb23a1267..736b78eaeb 100644
--- a/meta/recipes-connectivity/connman/connman_1.40.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
+SRC_URI[sha256sum] = "79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.20.1



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49053C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:16 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2248.1643826494847417601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QukvorTg;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id j2so384141edj.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BfiFfEZX0VXSHpfmALr93RMZE9fhizl6S4rs9Arn/sU=;
        b=QukvorTgd6H8wyURQ3Cq4fqKBdAMOGhrl/yaCaoqt1XRWldd2/0G1wZRkZO1FLpDvc
         LAqA8iT+2K7yLfCLgJx/X8aK6rxvD4CsZH39CZJewjwOMOgMwnXknOgUtbmKyGbMI3tn
         p3RaWInwzFLsqqOR9l81qWhiadPbr1Qt+2SL2HTiSmS+/lvFduxOVLckxBDwTGr1xuZH
         wHTgXFYIFWLdwKxLRX8xqUlPxFm6qiHBAPFrh6X3rYfAq0m04S1HhkZQEOwDZSEBk+tz
         YmzRhO9GdG2V5rqOSWFddOGJZsfNPk3dgB19/3loPeuJuRJhBDeg+UFPelySlhkcprYj
         LnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfiFfEZX0VXSHpfmALr93RMZE9fhizl6S4rs9Arn/sU=;
        b=D46mWtF6sAQDd42iFj/JXxd25Fd0zFxUK1xRr9TbND/76Dl8gc5dyZSXWvpVZrw8B0
         qUEI56ZAgW905v9PHrpiX4GBwGRJ1b+/Mh95qrdbzkPkp7WtrjkoYvBBH+kgorh1/b3l
         chEMlzk0aWnA1HmlD7y26tXg72nmRePS90fysKaExMppW45rKIJimFO0OYhNG04mZiXR
         HrV9qSi1/lCUDJ6JPvpNz/n9AM3MDxY45KqPveeZNTaGJu/3+8/0983ibAbp6Tg/JCYb
         fxuEYWqCKmisxs7UUcy6IaF+4pnHa4BcSlNwgdWMe16yd2epRdiVbKoPJGu63bqGO2N6
         dP7Q==
X-Gm-Message-State: AOAM530I+OAHDZUC1Lv37mpsXh2FLYoP1qaffXuOx0rDG5fbuyKWQSdF
	84yb085jaJmcDzrLWXNbOERBOanAF+c=
X-Google-Smtp-Source: 
 ABdhPJyu7F5co9wF145+bRtne3l69pnbK8Keeu9YRES4R1TFHOCvLA5XyV09E9ZhRsJbg86ww77yGA==
X-Received: by 2002:a05:6402:894:: with SMTP id
 e20mr31754961edy.267.1643826493425;
        Wed, 02 Feb 2022 10:28:13 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/33] sudo: update 1.9.8p2 -> 1.9.9
Date: Wed,  2 Feb 2022 19:27:37 +0100
Message-Id: <20220202182758.919991-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161237

License-Update: markdown conversion, copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/sudo/sudo.inc                           | 2 +-
 meta/recipes-extended/sudo/{sudo_1.9.8p2.bb => sudo_1.9.9.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.8p2.bb => sudo_1.9.9.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 82040de8aa..05d030c2e9 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=b969d389e79703121cbffc9f3ea18a8b \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.8p2.bb b/meta/recipes-extended/sudo/sudo_1.9.9.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.8p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.9.bb
index b2afd1f98c..f1c0339bb3 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.8p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.9.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d"
+SRC_URI[sha256sum] = "6d6ee863a3bc26c87661093a74ec63e10fd031ceba714642d21636dfe25e3e00"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.20.1



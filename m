Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6CCC6379F
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17886.1675446645464898998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cni8Eroc;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id m13so5975820plx.13
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7wrT7H6XDTL9YADvP8KOwpa5VR4XvpIThuth0N9MVM=;
        b=Cni8ErocpChjUXbAliipwhG+9uV5flECeyPZQDaPaEIkNLRAXPRJt/eZ3ht4nn31SL
         6Ok2DWwRlrFZd38fc/hHQ2N/ELnHllXA279YM9wGEgwEuAzpHgf5MzKmJ5ISAj06DfGo
         j+FX2BXWNy/gOe4PbVVoa8fL8PT6ul98zjULOMyu/CfOLKVHo8W5ZyLk1+lKT2IB9vxm
         c0y15oLD9tL7UJIJZ0KXtwSH4pN+KbV4V07kT+/ov77mw3cqpHylymrY0Hpvgm/6EkMC
         wPBTTTV6IUj2WJfdIxzGTwVMoKL4NU+uXsKzmAeYGTvw0K//XQwGlMmfMzL5Yr6uiFrO
         Do4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7wrT7H6XDTL9YADvP8KOwpa5VR4XvpIThuth0N9MVM=;
        b=I+76qB+Eqeqkf6uRP+BQuNqEAPaUOU6IA1adRTdQX7cRl32RCZbn2vj07LucWA0M+M
         enH+BrbBxpbhfBk8OAj9heDrRHCrJKcuNa3XkZAdtXar/5bq4tsku08NLllba/d/bgkd
         V3EXvFc4ni0AMwYZLB9GgrU/bTdCOHlhuy01lSsHyWPFnwTvNTkr0I5K5jafguIBQP8e
         edVW/B8Ummr4Qg3y7a3PR9USOOTDneVbM4QKqBZsE7WL2Ek1s8BofiywNG9x0cmXyEg/
         JQdt6MHgozMtvFWMYq7ao3Duyn+9+JQ2J4doqKjPUvisO8WQoWuvHcTrsWJxitYRZjLR
         iFVg==
X-Gm-Message-State: AO0yUKWYhBen4N3L8vrET6OR4WBdR1u/UjAsMz7obx4x+QuOALu+XN2M
	PDGf0sasYCX0eReXSHGumk96iNdFhec=
X-Google-Smtp-Source: AK7set/h5uaHtkT5LasFaedPGpTBn/WAbiqYCuZGUn0V8CjqkzRuDykDKdMAcYRZbt9n5l06G6hMKQ==
X-Received: by 2002:a17:90a:5:b0:230:2052:1c2 with SMTP id 5-20020a17090a000500b00230205201c2mr11712395pja.42.1675446660147;
        Fri, 03 Feb 2023 09:51:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] python3-iniconfig: upgrade 1.1.1 -> 2.0.0
Date: Fri,  3 Feb 2023 09:50:26 -0800
Message-Id: <2915515155066054111fc6224bd07c03bdae8abb.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176739

* Switch to hatchling build-backend
* inherit python_hatchling instead of python_setuptools_build_meta
* DEPENDS on python3-hatch-vcs-native instead of python3-setuptools-scm-native

2.0.0
======

* add support for Python 3.7-3.11
* drop support for Python 2.6-3.6
* add encoding argument defaulting to utf-8
* inline and clarify type annotations
* move parsing code from inline to extra file
* add typing overloads for helper methods

.. note::

  major release due to the major changes in python versions supported
  + changes in packaging the api is expected to be compatible

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...thon3-iniconfig_1.1.1.bb => python3-iniconfig_2.0.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_1.1.1.bb => python3-iniconfig_2.0.0.bb} (46%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
similarity index 46%
rename from meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
index 4643437b800..ca50ebbc352 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "https://pypi.org/project/iniconfig/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
-SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
+SRC_URI[sha256sum] = "2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3"
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-hatch-vcs-native"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
-- 
2.30.2



Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BE6C433FE
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 10:03:02 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.17954.1653559377329195615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 03:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dz0zqbuw;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id p26so1199630eds.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l81iKSYXVeTdY2nKX5TCijlG7KP4yue0sxLMyhSEwu4=;
        b=dz0zqbuw0RKrzfE7n2NROT23ZW30X199srCkUl4KydAsrqzQpStF6E40XRQE3EP398
         jKdLvSD4JKCH9q/PI+M2btNm7bNDwa8S1npk08iGy8jzzkW1Au5K3933aPw2uMew4bx5
         uBBcntgNeHKitEHNOCCeC4BUl6CSZOygpytiNw543514UZAGoUNh1XwYJSL3COcqsORs
         ovYnZItmSOdVez80MTgmva4In49q95BPFh6/bAf3/LiHC2w/lMLgRpAXed5oKCax615J
         zORQnNzY4NxAOVCF9g0hw2sFMQ3Vi34kfTbK001KymQ7RcJA/mkLnMkBKfg4xQK0XoQV
         PJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l81iKSYXVeTdY2nKX5TCijlG7KP4yue0sxLMyhSEwu4=;
        b=hsxT5HeaHLxxojPkNbzrEKpjd88e+8IXUbGYDqJOYsaUHPpcCt9/dZDKdj/kXuEns0
         IVpN11fStKl+hv+v759cN48eCv9dnpoHf7q5tJI/nLSJJhHKxMGZIS/S004Larygwyai
         TK1wJ2ICRf3lin40uocx/SRj8BtsCfRjdEavWMYiMSz+Dc9FHN9rNOiOWbh03IB3Ouu/
         EM4zCOQdyvOPyAUSppgzpYdCH5xRlaOoAk5QvEDsx+NiciJoyvm7aigd3SuvlYHrVkdZ
         FEoX/I2HPefs498kYiopwJK9UuAdjeZd2j3Ul8Naf7h+xqHB8md+frsnsaAZulrv1834
         L4Tw==
X-Gm-Message-State: AOAM530XElD2iFFP5ThEwVOSWLCxu1cqDk/5c2yTT9gN82hiZHYzqYqm
	863TbOAtAhsCgNbJMMMpACBWC9xeRw0=
X-Google-Smtp-Source: 
 ABdhPJx7D/Ef/QDiNIyngVR1eZhcFhe5R+BNDp8qa3SuaJLTeAM8F3LHgPiwFzGtzEFCCxqgUjpihg==
X-Received: by 2002:aa7:c38a:0:b0:42a:ab63:c5a3 with SMTP id
 k10-20020aa7c38a000000b0042aab63c5a3mr38989534edq.303.1653559375743;
        Thu, 26 May 2022 03:02:55 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a170906348900b006fe97996423sm359270ejb.219.2022.05.26.03.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:02:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] staging.bbclass: process direct dependencies in
 deterministic order
Date: Thu, 26 May 2022 12:02:37 +0200
Message-Id: <20220526100237.2224982-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526100237.2224982-1-Martin.Jansa@gmail.com>
References: <20220526100237.2224982-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 10:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166182

* this doesn't fix any issue (at least AFAIK),
  just keeps the log files more deterministic to avoid unnecessary churn like in:

  --- /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31/temp/log.do_patch.2213051      2022-05-26 11:35:44.110063749 +0200
  +++ /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31/temp/log.do_patch.2213372      2022-05-26 11:35:54.553062630 +0200
  @@ -1,7 +1,7 @@
   DEBUG: Executing python function extend_recipe_sysroot
  -NOTE: Direct dependencies are ['virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot']
  +NOTE: Direct dependencies are ['/OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
   NOTE: Installed into sysroot: []
  -NOTE: Skipping as already exists in sysroot: ['patch-native', 'quilt-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
  +NOTE: Skipping as already exists in sysroot: ['quilt-native', 'patch-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
   DEBUG: Python function extend_recipe_sysroot finished
   DEBUG: Executing python function do_patch
   DEBUG: Executing python function patch_do_patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 65499283da..aec44349bb 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -352,7 +352,7 @@ python extend_recipe_sysroot() {
     #bb.note(" start is %s" % str(start))
 
     # Direct dependencies should be present and can be depended upon
-    for dep in set(start):
+    for dep in sorted(set(start)):
         if setscenedeps[dep][1] == "do_populate_sysroot":
             if dep not in configuredeps:
                 configuredeps.append(dep)
-- 
2.35.1



Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5549C30659
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:02 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.143793.1719242578505019476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnVHlftg;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-254aec5a084so2610634fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242577; x=1719847377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukvE+z5+LbnSSO9BfRSA0G8AnwVloDbRflBwydW9ULo=;
        b=XnVHlftgrfwlI1wO08+1HYGaqWLfJnQGzOp299EVm0O3fLOInU0i9AfWulcfcyVUV9
         SSq0ohoOo8+cA0mTEV5zck6YWzBXJc3TyCWsQCfv+nO9sPEOKz7lxK46/pMGS5wd4o+x
         msjbCq5Z5r4e5GmM3GNJxJ1uvmr9Jwz77W6dCcxhFDb/gymkU1gqJm9tkPdxoUWe9+eY
         z1t81+zzJkxXyy7vQhzaNLa08rxVvlIo84etyPzk7vSzTthqjfFUElBiBUktslWQxvYR
         elmxo6llBPw4uR0iTnXrvlwDLzpew6cHkyuL7Gpmf//KNpTOT2efmp/p0fN+/OIDL6e/
         OcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242577; x=1719847377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukvE+z5+LbnSSO9BfRSA0G8AnwVloDbRflBwydW9ULo=;
        b=XdzmQ7l7kMNFShu9q6u8+By/V+PcK37/oTQ5z+UwOWNfrYcU53kw/J+E331TkaM3pj
         +z1SwtdmZcPrmxKt2aOiMynXru0ikfTKFsuzDxEDr+XxsCh6/FUCIyQ/n94vAQNyx3s0
         D4reiKP8qxcynaJzCmnH1emcsLMj/BRlUDnW2U/WPZuex6//Q+nGauCL5VHSR3rYlQlM
         7iib/WhKqiE1XlXHrHSjrUokYGBv+yJgrBjdgEuDwWcFn4PrSU/eevNiQrlhgqqRYIIn
         DDqvz3ZUIdpOuRkC48RZLKTkmNGx/cYCYOtS0A+rYchZrx00u1b5tIHZ+dLeQc2bm6cg
         yAPg==
X-Gm-Message-State: AOJu0YyXrMLGBZE+gtSE3XSPR21s/Nn91wuFtvjGQj4p1gwTHsaW4X3r
	xGnS30aL6oz9kJr9rL3HTelORleThXn7RSwJy5j4LDS0/0eNHvNKJ4Ro1g==
X-Google-Smtp-Source: AGHT+IFHImWIf2ebUEBFQccxbxqKjT2Zwr5idf8ni3cVnmRnAzoo6gybFfuU7bnzha40ra6sjFXV8g==
X-Received: by 2002:a05:6870:1c8:b0:254:a7ef:b714 with SMTP id 586e51a60fabf-25d019b26ccmr5650791fac.58.1719242577099;
        Mon, 24 Jun 2024 08:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 05/10] binutils-cross-testsuite: Rename to binutils-testsuite
Date: Mon, 24 Jun 2024 09:20:34 -0600
Message-ID: <20240624152236.1019980-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201095

This recipe needs to be renamed because the "-cross-" substring in the
name triggers the cross architecture detection in sstate, but this
recipe is not actually a cross recipe.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/mirrors.bbclass                            | 2 +-
 meta/conf/distro/include/maintainers.inc                       | 2 +-
 meta/lib/oeqa/selftest/cases/binutils.py                       | 2 +-
 ...tils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} | 3 +++
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} (95%)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 862648eec5f..d68d30b0f2a 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -88,7 +88,7 @@ git://.*/.*                   git://HOST/git/PATH;protocol=https \
 BB_GIT_SHALLOW:pn-binutils = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
-BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
+BB_GIT_SHALLOW:pn-binutils-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
 BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 14e0637c838..368d3de1583 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -64,7 +64,7 @@ RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-binutils-cross-testsuite = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 1688eabe4ec..5ff263d342a 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -33,7 +33,7 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         features.append('CHECK_TARGETS = "{0}"'.format(suite))
         self.write_config("\n".join(features))
 
-        recipe = "binutils-cross-testsuite"
+        recipe = "binutils-testsuite"
         bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
         builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
similarity index 95%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
index 630815c7a3e..f2facd52c3a 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
@@ -1,3 +1,6 @@
+# NOTE: This recipe cannot have -cross- in the file name because it triggers
+# the cross build detection in sstate which causes it to use the wrong
+# architecture
 require binutils.inc
 require binutils-${PV}.inc
 
-- 
2.43.2



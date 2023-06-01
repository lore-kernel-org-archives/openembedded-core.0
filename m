Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02039C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:56:41 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.31917.1685627791956479336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=1xyiRi96;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-75ca95c4272so70998985a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685627791; x=1688219791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=md2iNVf3oIZY+krLueWl15WIpZqTcMtEZPQlo5/c/Ko=;
        b=1xyiRi96ZG/cbzkwCqyAnCK1rSKf9Da/BVYtk1spfSE7W/qT5CQkkgaG264Ni6L225
         QpZZaAV8L7GTSDmByMhbgaxb2/cfCEZQl3qKOs/jcogZ0fri4BT+1mqRWpi19QQ91/g7
         4nxMfffC2it09yB5QWacKOcFCdse2oHm/o2iZVY52C0JSrfYt7nzwtLxIKp7fnjLRP/a
         z6TAYT946VtrjJVnl0bkkkZ7IgWJZopvLfqMign7nscAIxgqW8EADnzAYnPRH8o/zZsx
         5vsPPFgue0GtEC76q3c8bk5KawTfZsTCNLUsTiX99pbv2FR/7D5MqT1D+No1A8dkSZ5Z
         3+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627791; x=1688219791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md2iNVf3oIZY+krLueWl15WIpZqTcMtEZPQlo5/c/Ko=;
        b=RPLV+HBfnayREe1mZNZgNxXT+sC35c9p0NCNsgdC+IPiWMr4YGrF8a24dqZWRq/ihu
         n2I1xvUHa/g0Uwc/Mt5ht6C6HY0TyWvXR1PJUJCLa+/frvsqtcYwzXtZvWRIzHp756UU
         cNfq/90aqN90h64/bUVz0nmv1Vitfmno6rTGTGXYBOVqQ9FPg9kKtjcUD7c01vXGK1Db
         TPLtzARriIajWhL2LPetL7BbtR07MeM7UdZFKcMpmJkzQLJNJl9sCL7OyaIGlXahKw3f
         +MwxJVm1xNL5BN+ViZ1dH0RWae8NojLmbSxcg280M/fW++8/scm4IUfHEVXKKpvzl+OS
         1ZlA==
X-Gm-Message-State: AC+VfDwDwTO1RRgcG2mUJfqxzFsdX302EZ/9K3LYvylusUtOsqwaNnm2
	o7cI4poCHiuEKcR+7fWbiL56T6UWe4m9RPaWmWs=
X-Google-Smtp-Source: ACHHUZ6/JhManKTwUn8yiEoeRm+888haTEjBqn19YqiY/oGcVPXLP6Fd33ThcBx6M6V08n/AD8YI5A==
X-Received: by 2002:a05:620a:2707:b0:75b:23a1:8e73 with SMTP id b7-20020a05620a270700b0075b23a18e73mr8882449qkp.68.1685627790739;
        Thu, 01 Jun 2023 06:56:30 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h14-20020a05620a10ae00b0075cc4d03b70sm5600267qkk.22.2023.06.01.06.56.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 06:56:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python_hatchling: remove empty python sysroot dirs
Date: Thu,  1 Jun 2023 09:56:29 -0400
Message-Id: <20230601135629.3119138-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182111

In some cases, empty versioned directories are being left behind in
sysroots from previous versions of packages. This appears to be found
with recipes relying on hatchling, and causes errors at the do_compile
step:

|   File "/workspace/yocto/manual/openembedded-core/build/tmp-glibc/work/core2-64-oe-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/version.py", line 197, in __init__
|     match = self._regex.search(version)
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: expected string or bytes-like object, got 'NoneType'

To fix this error, add a do_prepare_recipe_sysroot postfunc in the
python_hatchling class that removes any nested empty directories from
the sysroots during build, so that dependent recipes don't get caught
on them.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python_hatchling.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-recipe/python_hatchling.bbclass
index b9e6582eb5..b5a3c3feea 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -7,3 +7,21 @@
 inherit python_pep517 python3native python3-dir setuptools3-base
 
 DEPENDS += "python3-hatchling-native"
+
+# delete nested, empty directories from the python site-packages path. Make
+# sure that we remove the native ones for target builds as well
+hatchling_rm_emptydirs:class-target () {
+        find ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/* -depth -type d -empty -delete
+        find ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/* -depth -type d -empty -delete
+}
+
+hatchling_rm_emptydirs:class-native () {
+        find ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/* -depth -type d -empty -delete
+}
+
+# Define a default empty version of hatchling_rm_emptydirs to appease bitbake
+hatchling_rm_emptydirs () {
+        :
+}
+
+do_prepare_recipe_sysroot[postfuncs] += " hatchling_rm_emptydirs"
-- 
2.40.1



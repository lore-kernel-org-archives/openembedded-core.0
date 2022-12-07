Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A6BC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 14:16:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.16206.1670422608709158439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 06:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FDc4Tyag;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso2765596wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TD6CGYPo75GmZX8c6vgulKtOEdtjQ7pXm/rDH9Cn9lM=;
        b=FDc4TyagoHa8TzBB9AH/BtIzpmPn5v0OYcujAA5YUoEsILs8i9gLWiGUn8L/BfzZ6m
         CgTE80Ok5ZEcvWOZtp7K1ZJwBl6rnNOrodtq1049drvwVDLzwhqTlZt+B1G2sn8E8wu2
         W8pprRPjbGOC+KycA7zSJxD0y4MxsTJRI1Knc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TD6CGYPo75GmZX8c6vgulKtOEdtjQ7pXm/rDH9Cn9lM=;
        b=eDqZF2fRK8rj297R6oiDcSM+kllDy3+HcDuhYroHVpUi4GvNExoJWOZIwUWKxbkvUd
         qDwDGxqWBqIM4fwe8Rop54nnyLLqzHXQrwyIK5HzHG6X+6qUf8Vbeg5q7FVAOrFKM0Ss
         +NoBk6TWkkDcMV3ZxCkdOUEG62cepAG9+cus6SG5kzsGff3sp+KvL3d3UnC2283RYQlY
         h6xjA98kMov4pZ2P3F5BRYFkfAALfw30jKPZ3nc1b9Y2ysukjwQrhDUaD9DOYOxWTGNB
         mj69/gG7s6cq8cIGnsN94v0LMSw5ETylveL5PcRWHMKQHRMj9R/meTSrqSLadoGp/O5K
         velA==
X-Gm-Message-State: ANoB5pkL4ahOLugKWSIs7idFJTSVYjrRTFxmoslJQ7Ikd8GbKWv4mVUY
	j7EUraSB90FtQqcDHA/ipdDUQS2OOU68/IBb
X-Google-Smtp-Source: AA0mqf4uyv8ETmVe5a/4XvL6oRnWN18pY85ZhF6FCX7qF9zhjczqicwed0wnxtQCqcdhHDBkynxF9w==
X-Received: by 2002:a05:600c:3587:b0:3cf:a9c2:2b04 with SMTP id p7-20020a05600c358700b003cfa9c22b04mr66096981wmq.152.1670422606959;
        Wed, 07 Dec 2022 06:16:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7cc:35cb:98f7:71b8])
        by smtp.gmail.com with ESMTPSA id t8-20020a1c7708000000b003c5571c27a1sm2295384wmi.32.2022.12.07.06.16.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:16:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Switch to use addpylib directive and BB_GLOBAL_PYMODULES
Date: Wed,  7 Dec 2022 14:16:45 +0000
Message-Id: <20221207141645.2129293-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 14:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174355

Since bitbake now supports an official method to inject python modules,
switch to it.

Anyone using OE_EXTRA_IMPORTS will need to adjust their code accordingly,
probably switching to their own module namespace.

Also switch to using BB_GLOBAL_PYMODULES to list the global modules
to import.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 23 -----------------------
 meta/conf/layer.conf             |  5 +++++
 meta/lib/oe/__init__.py          |  4 ++++
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index c81aa51ef3f..c4ac43c5696 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -15,31 +15,8 @@ inherit utils
 inherit utility-tasks
 inherit logging
 
-OE_EXTRA_IMPORTS ?= ""
-
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust oe.buildcfg ${OE_EXTRA_IMPORTS}"
-OE_IMPORTS[type] = "list"
-
 PACKAGECONFIG_CONFARGS ??= ""
 
-def oe_import(d):
-    import sys
-
-    bbpath = [os.path.join(dir, "lib") for dir in d.getVar("BBPATH").split(":")]
-    sys.path[0:0] = [dir for dir in bbpath if dir not in sys.path]
-
-    import oe.data
-    for toimport in oe.data.typed_value("OE_IMPORTS", d):
-        try:
-            # Make a python object accessible from the metadata
-            bb.utils._context[toimport.split(".", 1)[0]] = __import__(toimport)
-        except AttributeError as e:
-            bb.error("Error importing OE modules: %s" % str(e))
-    return ""
-
-# We need the oe module name space early (before INHERITs get added)
-OE_IMPORTED := "${@oe_import(d)}"
-
 inherit metadata_scm
 
 def lsb_distro_identifier(d):
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0ce90355baf..e41ada5d35d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -125,3 +125,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
 PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
+
+# Only OE-Core should set/change this
+BB_GLOBAL_PYMODULES = "os sys time"
+
+addpylib ${LAYERDIR}/lib oe
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 92f002d8726..6bdb93196f2 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -6,3 +6,7 @@
 
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
+
+BBIMPORTS = ["oe.data", "oe.path", "oe.utils", "oe.types", "oe.package", \
+             "oe.packagegroup", "oe.sstatesig", "oe.lsb", "oe.cachedpath", "oe.license", \
+             "oe.qa", "oe.reproducible", "oe.rust", "oe.buildcfg"]
-- 
2.34.1



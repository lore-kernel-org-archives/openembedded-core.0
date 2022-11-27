Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8061FC352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 21:36:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.102016.1669585003093599775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 13:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aK4toEF7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id r66-20020a1c4445000000b003d05a3775d4so765105wma.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3L8NZ4wZ5zDQ8nk9/SgTiA7eD2Fdm0PKvLJqrDjFJsA=;
        b=aK4toEF7QRdSVJUXBU3265Qh4VxQXxA8qD7aeCHZd3+Pm1YsSR7i7RsEQ3Msd3cQN1
         fZa2pjIUdeVgxMjeFNbSJQh0gyvxzbX1WhJi+VEDxMQ+3wcRejqW+I3S8YICAH7aRykO
         Ek9t5tJAuQFftGHSrebRd1AxGGY+egVssKBuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3L8NZ4wZ5zDQ8nk9/SgTiA7eD2Fdm0PKvLJqrDjFJsA=;
        b=S3vP9Qr+prqTIvqP9BXl1psuAk6vrckIvDjeetp3PDIkS/KI/b/TwuPjvmfWEAGYgT
         +s/Qq9iNgjJe48b4krzi1qsSVzM9fO22J8DJUbjhvoKdmQup35pBp22Kts8GHlhoe+KL
         pGqHhkln63di891Na5fKOZsisBtrSEdEKTWb+BLdAOA+ZKJfX7TmHwHkspVH2p+YbDoW
         MMbbv/zhPW/mSMhWZT7hVYlV4JL5hkC+s9dq04QHtTIKBnlGAwPRbj//Ok+4SMUxDUDr
         S1udJU+SsixPI6zXyTzQPFIFordmuELsT9DBO8DNOI/fF8vJ0osXuhKoFUpxVMN4hqJs
         TNyA==
X-Gm-Message-State: ANoB5pnMUZJzZo9XjKumHg/RPDsqV1sBH+30g+VOnnDpaSDivg10hrFK
	4SnQnbwRY84vHBpbLKa1LfWnI8uZP8q8Fw==
X-Google-Smtp-Source: AA0mqf63UV3BuSO254wXU6DExfJltX5ewnITdliQ6GFbK/buWM4YNLw6x2PJ6xDiOv5SVMZKKzjMOg==
X-Received: by 2002:a05:600c:600c:b0:3cf:81b1:bc7b with SMTP id az12-20020a05600c600c00b003cf81b1bc7bmr25856836wmb.121.1669585001399;
        Sun, 27 Nov 2022 13:36:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aafe:fe4:d699:e1e9])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b00241d2df4960sm8996514wrv.17.2022.11.27.13.36.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 13:36:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC] base: Switch to use addpylib directive
Date: Sun, 27 Nov 2022 21:36:40 +0000
Message-Id: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 21:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173885

Since bitbake now supports an official method to inject python modules,
switch to it.

Anyone using OE_EXTRA_IMPORTS will need to adjust their code accordingly,
probably switching to their own module namespace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
[This patch is an RFC as part of a series on the bitbake-devel list]

 meta/classes-global/base.bbclass | 23 -----------------------
 meta/conf/layer.conf             |  2 ++
 meta/lib/oe/__init__.py          |  4 ++++
 3 files changed, 6 insertions(+), 23 deletions(-)

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
index 0ce90355baf..0fe05beebf0 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -125,3 +125,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
 PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
+
+addpylib ${LAYERDIR}/lib oe
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 92f002d8726..9166420b00e 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -6,3 +6,7 @@
 
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
+
+BBIMPORTS = ["os", "sys", "time", "oe.data", "oe.path", "oe.utils", "oe.types", "oe.package", \
+             "oe.packagegroup", "oe.sstatesig", "oe.lsb", "oe.cachedpath", "oe.license", \
+             "oe.qa", "oe.reproducible", "oe.rust", "oe.buildcfg"]
-- 
2.34.1



Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B323C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:04:22 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web09.3137.1668153852489540313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=S3N/GnU1;
 spf=pass (domain: underview.tech, ip: 209.85.160.53, mailfrom: vince@underview.tech)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13be3ef361dso4658922fac.12
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 00:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNAUBsvyQPVBJr7yi3KaHwy8T+F7l7QijtcWm61wegY=;
        b=S3N/GnU115SVkspoiThC8q1TNgl0Mcp/KgF9tJA7RtNBtJ5zTBWeh6TpRUktMd41Y6
         jH4CaMmN4VXbLq/UhjNOXHPZJhKM2BRmOfgkiceK+dOwab5cs9F+RBxsQAiaGTsrmRSd
         mRN0VPXrtUef+x50yQx/YmTll9pRZ+K+TqPqRt5oIm13Ou9458pIlDKgG/yQlWaQsKu0
         ojqDt9vbpmahsoww2f+7zr0L3JeBWpZQy0bW5bIMqNDOeGa5fjfEZqs3amSgI9GoOdDg
         7Z47Fer1hbBPrjqgqwckf5MQffh6M9EPC/TngRgTNQsyMC9bQLLLAAjcZu9mUmTeaq7p
         iZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNAUBsvyQPVBJr7yi3KaHwy8T+F7l7QijtcWm61wegY=;
        b=fOUeTUSApZtDgjgEU6f7/FFQjzpxResuU+EosDmvc0knU0nJq9UN0SjYdKuF0r4cm6
         eDM7psq4/74ranwY14s+xlt3zPImWjWhc5yn2eHNM2mYpzzw3azF34XtTm82nGvzigz7
         XCOWv26RWDq8CFAPs1hyCCTGYvhtWBSAAX1Bi1RgaUxkP8E0t6aCLpwUsDkOQyWg38Ak
         2sqF17XfUE9aivSuG3M7uig+ID7D+DNlGaFbby5VCOtDrHi8v5ZipEcjVVAfWvuEbLBZ
         KRysJ2kQ0jrrS4GfVrS0q3oIQ5uDvD6q92KFn2V0b+H16BlNcg9eoavXEiVbBbMTTwdg
         5IKw==
X-Gm-Message-State: ANoB5pl2nkGjkiJkcGxmr5b9Dm7OZb/T1Yr0eD8OGZ8MiB/mJs+x2vyz
	p2Ac776SwARkE4cGBBzcgVKsyosGiS4xQF3tIZQ=
X-Google-Smtp-Source: AA0mqf4W1lmy4Kyxn6Ztrzp8iWmt/AT9vz/3LGCezMyYX/ChljE6syxUeynZUIs+XgEcj8V6a6uWVg==
X-Received: by 2002:a05:6870:3d88:b0:13c:e933:28a0 with SMTP id lm8-20020a0568703d8800b0013ce93328a0mr263989oab.180.1668153851358;
        Fri, 11 Nov 2022 00:04:11 -0800 (PST)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id v15-20020a056808004f00b00342e8bd2299sm629487oic.6.2022.11.11.00.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:04:11 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] mesa: update llvm-config RPATH
Date: Fri, 11 Nov 2022 02:03:58 -0600
Message-Id: <20221111080358.1046007-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173119

RPATH on the llvm-config binary is set wrong which leads to.

llvm-config: error while loading shared libraries: libtinfo.so.5:
cannot open shared object file: No such file or directory

AND

File "/../../../mesa/<version>/recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line 223, in finditer
  return _compile(pattern, flags).finditer(string)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: expected string or bytes-like object, got 'NoneType'

Which in turn leads to meson configure failures as the llvm
version number isn't properly returned.

The libtinfo.so.5 library can be found in STAGING_BASELIBDIR
update rpath on llvm-config to STAGING_BASELIBDIR. So, that
meson configure succeeds.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/mesa/mesa.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7dbca5876a..77f9a5c81d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -64,6 +64,11 @@ do_configure:prepend () {
 	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
 		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
 		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
+
+		# RPATH on the llvm-config binary is set wrong which leads to
+		# llvm-config: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
+		# Which in turn leads to meson configure failures as the llvm-config version number isn't properly returned
+		chrpath --replace ${STAGING_BASELIBDIR} ${STAGING_BINDIR}/llvm-config
 	fi
 }
 
@@ -227,7 +232,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
-- 
2.34.1



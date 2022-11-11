Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED859C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 07:34:11 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.3014.1668152050379091686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 23:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LTTtRIzl;
 spf=pass (domain: underview.tech, ip: 209.85.167.171, mailfrom: vince@underview.tech)
Received: by mail-oi1-f171.google.com with SMTP id t62so4187334oib.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNAUBsvyQPVBJr7yi3KaHwy8T+F7l7QijtcWm61wegY=;
        b=LTTtRIzl4fv74CqUlrzj48DvN0Nik8RvKCUJWhgFwX7bgtQRdtuNp6FALWKu/Xw/Zu
         u0GdI9lshNNaoDXECcKsMnv3ERR/NQlsGQPjOqpOGrLriDzntijZVBfVS2CNgwToQCc3
         pnaLiqcfGD93oPAAE1+F5R7hM5jaG4aESQibfC+V2ZGmfa59cRcUqVJUBNVlx6wsuF4m
         QHOjQ34IbvF5fB8X60NbLSyea4koOPoiFclJyUZ3PWqpwHmIDomeMFQX00NKriL9lPSZ
         om5BuKUnacNsEIs2BdRgxXPvpYDAWBslOc2ObGchHBzobVTCCpMpmZ1MBm0jqeQK87N4
         6/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNAUBsvyQPVBJr7yi3KaHwy8T+F7l7QijtcWm61wegY=;
        b=zuQpKN4+YuwnfKAcWpnya8mLkfRo9c80vdEja7gPxvIeGBX3KLFv0KImi33xQ2A7Cr
         nhXJRr4Wk4GbrTHKn3wk2pUveqofuzwNwyLN5vTzWsj6BlG0bhoCDdZxI48oLpqEj/KT
         R7fALk9+T9QVWjcCMvEKa9adTG6O9WXeN5pnix7/EneIrXrr25o1AdpN+29E/UJpN0Fa
         cobK3AzICcSsF8RVu7HCBsNGftnN2+wqOin7xSZEvwQzBT567hQlnhYhCGDCZ/YAiSad
         7x/ThVTINOkjpLqU1LuZiYXuqICEac1wjxb6moo6Q1nCcf337cOcBpWTbmFgCzFN2EU/
         pDBA==
X-Gm-Message-State: ANoB5pnOAYoAJ/A+MOo2zgFYYBTfaOWSjhsPRqe5I81f1f6yYc69PHM/
	ixDu+jDYSc+OdTo5Gtyk8nCJfYNneO9qmQOD1LY=
X-Google-Smtp-Source: AA0mqf7evctb/0VsO5cpyK2tzdbrBTmqaFP535OX8wmwItaMcowKz066TOvvytBsArfJ9F3l1hAVjw==
X-Received: by 2002:a05:6808:1119:b0:359:fe66:d49a with SMTP id e25-20020a056808111900b00359fe66d49amr208367oih.209.1668152049347;
        Thu, 10 Nov 2022 23:34:09 -0800 (PST)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id v4-20020a9d6044000000b00661a05691fasm690696otj.79.2022.11.10.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 23:34:08 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] mesa: update llvm-config RPATH
Date: Fri, 11 Nov 2022 01:32:44 -0600
Message-Id: <20221111073244.1014136-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 07:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173117

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



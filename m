Return-Path: <athoik@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07F0C433EF
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 17:15:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10920.1642871755981837853
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 09:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igThaygN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: athoik@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id s18so5688836wrv.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 09:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NH7uj7KwuFWEjsDsra2TdMxDLjO+eUjVsRq+8qWk+rQ=;
        b=igThaygNbxxxxgIFPm63KE+fd43RYMR8iioCg5L+riBu+m0sn2JJgHQPQR18Zp24yH
         fTqbWiHFrn42eq74ssKAF1RRpSDA+dF+VcIZWrf6/acrmF72FiZmObQfu6g2nbkcA/gu
         greXQ7Do353/a9Bdx5HBilZXh1e/KQQ5i4IaqOPRoaAd55KNJujDmOXVwxz9ggmm48f2
         ZFblaQsWz4533FeS33nqqrsdT3g/I2ayJ6R/bR+Smqz1HzeptPkyYaBNA3LSUprBYtvP
         1Z9QqUZ798c8d0Mg5KTCESIGvSlshEQ6cUMl4CgV8ZAEyCvIm0AO+NLWFp/d2jOZotv9
         ZTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NH7uj7KwuFWEjsDsra2TdMxDLjO+eUjVsRq+8qWk+rQ=;
        b=G1uD/zg4jCzSLtsn7Xcve5Scitm6nBdvLq6XnKgYO/Tuga6QSWojG+CFOa1yqKP+2c
         naKpzwLJl9qlIjenaW4OsWx2z07+CphZSUZ7GaEzuwYBSoc872i/ROqOBqq0jiU2ZZEo
         38dimSH1WzZumkt/K9//e9SsC+aO43GSg8mVrFnKtwdQUbfl3i58h2XI2RM1sVDThZNk
         xI4wtrwOAobZrzXv69JUDG2+XXwlSl0YWsyUn5rxq7lVcWhgAbZtDmvjSRFxH67sEqpA
         x8viuEH92JX8QhcnPE43dlPLWXsvS6d7os64tzuV/MpwBajtVxrcAWt/220ylgciX4/v
         GHmQ==
X-Gm-Message-State: AOAM530zEit9Xf3kp1M1GP+e4oYaJnkv+i9CSAANJFswrpYPGafL2Duu
	6NIHBjGHeBtI2tiCHbMZ8gmWk1i6FAw2rQQ=
X-Google-Smtp-Source: 
 ABdhPJwFaTeK6TB/ICdlZS4wnSNC0lOTEKbapiJ94nbyYGq2hxQlkSzpxFM8YtGVhY+Fv964wEKsrg==
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr8358085wrm.670.1642871754261;
        Sat, 22 Jan 2022 09:15:54 -0800 (PST)
Received: from images.net ([2001:41d0:2:c72a::])
        by smtp.gmail.com with ESMTPSA id
 o8sm10445155wmq.41.2022.01.22.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 09:15:53 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [OE-core][PATCH] python: prevent build failure when pycache files
 missing
Date: Sat, 22 Jan 2022 19:15:46 +0200
Message-Id: <20220122171546.30099-1-athoik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 17:15:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160858

Building a patched version of python3 with byte-code files saved to their legacy locations and names causes the following errors:

| rm: cannot remove '/.../build/tmp/work/x86_64-linux/python3-native/3.9.9-r0/recipe-sysroot-native/usr/lib/python3.9/test/__pycache__/test_range.cpython*': No such file or directory
| rm: cannot remove '/.../build/tmp/work/x86_64-linux/meson-native/0.57.1-r1/recipe-sysroot-native/usr/lib/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*': No such file or directory

Force remove pycache files, preventing build failure in case they are absent.

Python3 patched with legacy byte-code locations in order to create a sourceless .pyc deployment for small flash boxes. Unappropriate for upstream.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         | 2 +-
 meta/recipes-devtools/python/python3_3.9.9.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index e186dede92..bc8ff2bcdc 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -44,5 +44,5 @@ do_install_append () {
 	# Upstream is discussing ways to solve the issue properly, until then let's
 	# just not install the problematic files.
 	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
-	rm ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
+	rm -f ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
 }
diff --git a/meta/recipes-devtools/python/python3_3.9.9.bb b/meta/recipes-devtools/python/python3_3.9.9.bb
index f41529833c..7d0bef06d5 100644
--- a/meta/recipes-devtools/python/python3_3.9.9.bb
+++ b/meta/recipes-devtools/python/python3_3.9.9.bb
@@ -174,8 +174,8 @@ do_install_append() {
         # Upstream is discussing ways to solve the issue properly, until then let's
         # just not install the problematic files.
         # More info: http://benno.id.au/blog/2013/01/15/python-determinism
-        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
-        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 }
 
 do_install_append_class-nativesdk () {
-- 
2.20.1



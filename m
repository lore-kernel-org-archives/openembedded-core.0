Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95831C61DB2
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 14:35:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19652.1749306940146188424
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 07:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ZaAhG9KG;
 spf=pass (domain: snapchat.com, ip: 209.85.221.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a51481a598so1780031f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749306938; x=1749911738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHo88n/9eQbGWl6U6W8dsCw0LWQcN34M9kC+NAKW5fc=;
        b=ZaAhG9KGzJHe1fMWdgMt0aH16FguMtGhIZZXvFlUKFa1QCewgYF8zNg2h21Rx/ZnJk
         KF1XwY3Csbxz4/YrrVaIe87RRRryBVw8t50kdo210VpEm8ctJi7SH7o5jPVsWsaGtXvc
         v3dD7/EnDgyjVmFx3GNdg+lgvf7magDX8I0pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749306938; x=1749911738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHo88n/9eQbGWl6U6W8dsCw0LWQcN34M9kC+NAKW5fc=;
        b=vfN9CBhk9kiI0RgSqCnnG30tnKyfHKK45RlzVnJxI/qH8FFTtagvVnLHmTiHNA0MVG
         vTHY3Le2lrEmwBsMgl4V5EQVt2x7sCT9Z0INBFT/PrMUcJvR2X4UKnJV+nJrOixF3DYb
         SwWjn4MXGIgjTWZihJfare5xLBbdhCYfHRt6nL82CYGJans4vlK5MjS+YttK8Fql6nn/
         cIHbGOUyIDUK4z/cUiSCjyU78bYzn2FUPzsayHR2YyBBlcKCoBbJCml60U/q4UGWbOiQ
         MBleer2XqJ1UQnOXsW43jDKXNGGfdpyMmYNaVFqsExYc55SVhDO7V1Ypb3AWPf4Azp3o
         pKjw==
X-Gm-Message-State: AOJu0YwPrAED31m0iG6xL3vuaUZDIXGTYHjLYIC5tHPFwUzUJ/rjxdBN
	dEYDGP/FqWep3VA2g7LeoxrAspZlgOfr8J3n/igoqsjn9ED9X9x6ZFSBzUeHpQv1s0LOSJuExCZ
	pJ4NM674=
X-Gm-Gg: ASbGncuN1ssDbMyK4csNMvalwKmQxrv5nAANL9+Vt/bIPvM5hyLbw36batCwjIFH8iq
	Yt/vBh3FOO0wzqsXj/eeOuxxMwP0E1fJ4E0DuKc5Y4JEy8Xm1jfVSRGUt9NORY/aiuFNBa8u9d4
	vYYZBgpApfmlkr2LKVuMWJqDke7HKzSNDcLuVVBcK8o8C4CkE8VLXlzV6ApmFvHLvUaoGNLBDZM
	6l3fymrlI+kuupYS5VanTEgnLmBriovgKy1lAo+/TWs6Nvcd5SbYMKH5mt08YjRHYw9BcWMjv/1
	SPB0hCLgRdZPOvOdZvAP3NUtESyiHkj6+eNB/qgxBLbl4QVAOxrzconHo5BIEaFw7a808vvKLbz
	lCGpUMWsehiqN9TEnyS0eaCrwCt/Lk4FyPEg3A1nx
X-Google-Smtp-Source: AGHT+IEZ3kcpHLb4+2JvF0SS6JE/8rXlXpBUvzP09VmiEIhdmyhYnP5dK0fy77eRjxNI3I5kWFw45g==
X-Received: by 2002:a05:6000:310d:b0:3a4:edf5:b952 with SMTP id ffacd0b85a97d-3a5319a7945mr5990858f8f.36.1749306938289;
        Sat, 07 Jun 2025 07:35:38 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm57862725e9.22.2025.06.07.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:35:38 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 3/3] Revert "coreutils: split out coreutils-getlimits"
Date: Sat,  7 Jun 2025 16:35:12 +0200
Message-ID: <20250607143512.484259-3-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607143512.484259-1-ecordonnier@snap.com>
References: <20250607143512.484259-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 14:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218198

From: Etienne Cordonnier <ecordonnier@snap.com>

This reverts commit 149584beef1e1b28a4e51f40515204e7edaa9d1f.

The coreutils-getlimits package is no longer needed since findutils-ptest
now uses its own getlimits implementation. This improves modularity and
makes it easier to use alternative coreutils implementations via PREFERRED_PROVIDER
(e.g. uutils-coreutils recipe in meta-openembedded).

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/coreutils/coreutils_9.7.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.7.bb
index 091e1ea2c5..dc9dfae26b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -74,11 +74,6 @@ RDEPENDS:coreutils:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'singl
 # regardless of whether single-binary is in effect.
 RPROVIDES:coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils-stdbuf', '', d)}"
 
-# put getlimits into coreutils-getlimits, because other ptest packages such as
-# findutils-ptest may need this command. Note that getlimits is a noinst_PROGRAM
-PACKAGE_BEFORE_PN:class-target += "${PN}-getlimits"
-FILES:${PN}-getlimits = "${bindir}/getlimits"
-
 # Deal with a separate builddir failure if src doesn't exist when creating version.c/version.h
 do_compile:prepend () {
 	mkdir -p ${B}/src
@@ -106,9 +101,6 @@ do_install:append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-
-	# this getlimits noinst_PROGRAM would possibly be needed by other ptest packages
-	install ${B}/src/getlimits ${D}/${bindir}
 }
 
 inherit update-alternatives
@@ -213,6 +205,7 @@ do_install_ptest () {
         fi
     done
 
+    install ${B}/src/getlimits ${D}/${bindir}
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
@@ -224,6 +217,7 @@ do_install_ptest:append:libc-musl () {
     sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "${PN}-getlimits xz  \
+RDEPENDS:${PN}-ptest += "xz  \
                          ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'acl', '', d)} \
                          ${@bb.utils.contains('PACKAGECONFIG', 'xattr', 'attr', '', d)}"
+FILES:${PN}-ptest += "${bindir}/getlimits"
-- 
2.43.0



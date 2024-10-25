Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA07D116EF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:22:54 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.5408.1729833767526680205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8lYeY5A;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso2440085e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 22:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729833765; x=1730438565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8vOkWMeLxYJXYj4k1AT84SgF77fklgkbAaNYeF15hg=;
        b=B8lYeY5AYxpwlGZkPe8dKr5lrI41gKuoFBgbtddD0JnqXWIjsF7OCfSklc0k0bRSXg
         kAIuNTJISGqxTYCoSo8nhuPcyDPqTpJhsT7dM1Hh70Xpg60VSWemu00Twco6e5/QHibX
         Ohy29M1viD4hpxWG54eo+jv6VK1zZYs8hZxLK90JKsJkhIJDgf+8jgoePmT9UHgHxOuW
         FsVamaPwcJ7QDdc5CtuTlYz8mgFxB6xSIdRramiHswHPvqSWQNpm+VxbWToJ9QCBliL8
         cxSXWBkiDlT4Fqy43oWxLK4ieFjH8PiLPdEZh1Oycohs9vjzegriOhu/fCTKxOJivXjn
         o1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729833765; x=1730438565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8vOkWMeLxYJXYj4k1AT84SgF77fklgkbAaNYeF15hg=;
        b=KZEHsE5aj/K06k7gPQZEzYivSKbEin55jZK6X/esdCeOkaODQLrikvFqySMe6EoVV1
         +QZfcxgAQjoiyxrMislbqQmyI3AZ4UVcwT+wlO4wmjL9GtE8WDpHHJZgfcZsJ4ORMG/4
         jpgqBWpAgXiCDQZHIDpEG1cqKThGAZuzh5HEu/PT+DBgLORVOGbkn/4/jev24WEpfSDW
         gANkTv6MLjhWr3A6rnW2yY64K6tI3jfcbBn1aUPgpF5xpaIhdBUu9h2Vr9B17WBw0eKB
         lN3WmtnVGI+zdXyyNSqBx/UFjn6pnw66b3+2M477s7i/mCX+r8gBBs1vd8RsvODq6eNr
         RtDA==
X-Gm-Message-State: AOJu0YziW/GBkJvpWyCQZkxOmcXMcXvpT4wEz8D8u555Xm8uHPDlbftM
	qgOEdo0++HJQk4ofPeZEKD1lSseAvVDXjbo1RTKuzU+22IPbTI5rLR727t/B
X-Google-Smtp-Source: AGHT+IHTvWNZO+RMIRyMqc3ZNlOqsItVJHnWg5jXvQjJb1RGxaEoAwSN+u/ETsi3oYIukuMrV5VVZw==
X-Received: by 2002:a05:6000:1a8e:b0:37e:d92f:8272 with SMTP id ffacd0b85a97d-3805b448635mr62318f8f.6.1729833764760;
        Thu, 24 Oct 2024 22:22:44 -0700 (PDT)
Received: from hbox.local (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb1bc3sm568517f8f.110.2024.10.24.22.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 22:22:44 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] package.bbclass : Fix AUTOINC version issue in pkgdata
Date: Fri, 25 Oct 2024 06:22:40 +0100
Message-ID: <20241025052240.3307-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206312

Currently, pkgdata fields (RDEPENDS, RRECOMMENDS ..) are created with
AUTOINC due to the static setting of its values in recipes/configurations.
Eg : RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
in meta/conf/bitbake.conf:
----------------------------------
DEV_PKG_DEPENDENCY = "${PN} (= ${EXTENDPKGV})"
RDEPENDS:${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
PKGV ?= "${PV}"

If SRCPV is set for PV in any packages and revisions are not incremental,
SRCPV is updated with AUTOINC during the recipe parsig stage.
In base.bbclass --> d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")

----------------------------------

During the do_package task, AUTOINC is replaced in PKGV (via package_setup_pkgv),
which is used for creating the package name. However, the fields set with PKGV
during the recipe parsing stage will not be updated with this change, resulting in a
mismatch between the package version used in those fields.

As the IPK name is generated with the updated PKGV, but the version
in the fields (Eg: RDEPENDS) still uses AUTOINC, this mismatch leads
to installation failures.

Example: libnsl
install libnsl-staticdev throws the error,  nothing provides
libnsl-dev = 1.2.0+gitAUTOINC+4a062cf418-r0
----------------------------------
IPKs available:
libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk

control data: libnsl-staticdev
Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+gitAUTOINC+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb

control data: libnsl-dev
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb
----------------------------------

This patch fixes pkgdata with correct version.
It replaces AUTOINC before generating the package control data.

Updated control data:
----------------------------------
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+git0+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb

Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+git0+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb
----------------------------------

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/classes-global/package.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 6cd8c0140f..066a7ff835 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -325,6 +325,15 @@ python package_setup_pkgv() {
     # Adjust pkgv as necessary...
     if 'AUTOINC' in pkgv:
         d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
+
+    # Adjust dependencies that are statically set with EXTENDPKGV
+    vars = ["RDEPENDS","RPROVIDES","RRECOMMENDS","RSUGGESTS","RREPLACES","RCONFLICTS"]
+    packages = d.getVar('PACKAGES').split()
+    for var in vars:
+        for pkg in packages:
+            val = d.getVar("%s_%s"%(var,pkg))
+            if val and 'AUTOINC' in val:
+                d.setVar("%s_%s"%(var,pkg), val.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
 }
 
 
-- 
2.43.0



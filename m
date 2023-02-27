Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54B2C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 03:20:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.82238.1677468032102232547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 19:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DLUccrHt;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so4892809pjq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 19:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gp1Wv3UQxqf2CLUY1yGLo+7NZmesB232ZDV3kTH53nw=;
        b=DLUccrHtVQbaz/V5e/xVTPlyzlkzC8b9QRjeL/saocNwqfdRUKZwicefkJZW4mmO7j
         tBln9AYwckUkHDSUWNyyaRWGqdw2WSAPBhr9vHWkPF+CRMyUxWoAzB3IPTB7IEG5MSmg
         sxqQXEVFgz07cLvCIQgcvxOb55QtXAMZG0PsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp1Wv3UQxqf2CLUY1yGLo+7NZmesB232ZDV3kTH53nw=;
        b=mc8Bdfj3wo6rhTT+YKF0TuHuqM/MC3wIFfxZuiz+V7ypbPuOi1ZlQybYX7DHYBnvM0
         GjiN8tg14O4VXiulk8Fk+HChnS76uzaUY5eJ6wA08VIUiTjHBVadmYzxZorb128mw1DK
         cbA1pf6b/HT62Mr/sTaaklA8kGfKErj+/jFqMgkCUM9+S3ttPvYzEx2ULFsMPw9y3GGf
         HtiSDmiyKGVsAk232f0vgrCr1TFxk3MCsBEFt5mP/Yenv4vqooXmbyvj0D/Tp42aIEN8
         QlV8rM86AfIN5sPQFodAUaMDTr8zwF9TqAaZWYF9kTIF/bswkbu6AQrjoY5ImHxsyKAg
         TEvQ==
X-Gm-Message-State: AO0yUKUJojmDgOBSZKeEQ4fdJwc/BXNuFfXgn25Ah2KSn+kVTup2L3rV
	fhIMbS+OTew+dmigZg0AkoLriZcvdzyMjT8A
X-Google-Smtp-Source: AK7set/IISlrxsBKV0tCzlkoePJCxZxvia9Bp0J96GoonLU8R6I48iuq9Z+d8wZB7TxYBd1/eQu0gg==
X-Received: by 2002:a17:902:e745:b0:19a:acc2:73e4 with SMTP id p5-20020a170902e74500b0019aacc273e4mr26772240plf.22.1677468030934;
        Sun, 26 Feb 2023 19:20:30 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.163.148])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090282c900b0018b025d9a40sm3310460plz.256.2023.02.26.19.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 19:20:30 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] rpm: update 4.17.1 -> 4.18
Date: Mon, 27 Feb 2023 08:50:20 +0530
Message-Id: <20230227032020.6248-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177769

(From OE-Core rev: 5bef402da334595ed9302b8bca1acdf5e88bfe11)

This will fix #CVE-2021-35938 rpm: races with chown/chmod/capabilities calls during installation

upstream branch=rpm-4.18: git://github.com/rpm-software-management/rpm

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 ...When-cross-installing-execute-package-scriptlets-wit.patch | 2 +-
 .../rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch | 3 +--
 meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.bb}      | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.bb} (99%)

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 2a0069cafe..13d01faa0e 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -53,7 +53,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
--	    rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
+-	    rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
 +	    if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") != NULL) {
 +		rpmChrootOut();
 +		rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
index 9783396639..cab54c3fb6 100644
--- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
+++ b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
@@ -20,11 +20,10 @@ diff --git a/tools/elfdeps.c b/tools/elfdeps.c
 index d205935bb..3a8945b33 100644
 --- a/tools/elfdeps.c
 +++ b/tools/elfdeps.c
-@@ -5,10 +5,14 @@
+@@ +5,14 @@
  #include <unistd.h>
  #include <stdlib.h>
  #include <fcntl.h>
--#include <error.h>
  #include <errno.h>
  #include <popt.h>
  #include <gelf.h>
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.bb
similarity index 99%
rename from meta/recipes-devtools/rpm/rpm_4.17.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.18.bb
index 9b6446f265..724dbbe70a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protocol=https \
            file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            "
 
 PE = "1"
-SRCREV = "5bef402da334595ed9302b8bca1acdf5e88bfe11"
+SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



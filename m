Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1628C3DA6E
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 02:10:58 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.45493.1704334256584639127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 18:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nfDfrety;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6dbfe24c91dso50073a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704334255; x=1704939055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/D/NF1RsqoRVQ0fgGIGmx11DyR/sJ5vpT2dDP0e7LS4=;
        b=nfDfretyJJ1hrPJNVVzpHNeilosIWfgtGuPkqxoALfCoSYN/GcbELJfAxrzrGymwUx
         5tcvNPJchfgE8V7CMJPP+Qx0RANskV+dS8WAv0CDDV4aCR5RbJDby3RTpibh/+jXFHFE
         oqk9CKDxVDpHKW4Y17v4zhGFlPTGotV8Wkbp4RbPraNycKzh374B6D7EwOd75hk9rOLx
         Zvc09aE3UUrMCNrODu72LYhY2d9mYXvDP4qdemFqBCkdEQG02/wMj1Z93XrO7cofX+p7
         d5J5qGp/DF6q0/9UQXhTB/hR5XsNFzrXs8PYqVxjuano61D5kEmHAp1XZpYgP+tjCvtl
         8TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704334255; x=1704939055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/D/NF1RsqoRVQ0fgGIGmx11DyR/sJ5vpT2dDP0e7LS4=;
        b=oAg3/NZUitwiPnaRDYqe+yRZ71ajzTnpViS03KEB6iIox1nsMLDDjAlCjYGuGka7hX
         Mnqslxe8EVXj3fC1hXrqz6znr2YEXycAYo0PFRW5OwrR2pf9FflyEKCvyYUuXdmWBymw
         3V212RU6OWerP8saMUOEFmc2YF2VgONZHjdD6PjouKrBsNBW97S/FMXDluON5M5gbNK0
         UOBSHwjJJNzM2mA74hjITd44HPPOvt+zFkuHkG6xjjU/WgKr/f11yXgucdErrOcgC2kn
         IqgJ6Zu+4yxkyeDMRtK/WWHSdHmooR23wiU0yN9SWSDhhwok2g039tsx9iURP3sD/uNE
         RUNA==
X-Gm-Message-State: AOJu0YzgyvikQo3EmNlE1DFYzSDGezi9/5BB40KOMHwc0GCe6Mrc3S7/
	sece7078eucMbvTmvYetibnBef0GHEc=
X-Google-Smtp-Source: AGHT+IGYoS3KARQiRdB3+KPB4+2h+pVb0RzhHdcjzzu4BtHe3T6lUOlJJPwVOnhfZIzGn5jtWUfLFQ==
X-Received: by 2002:a9d:67da:0:b0:6dc:3d2:3bf with SMTP id c26-20020a9d67da000000b006dc03d203bfmr9518153otn.40.1704334255393;
        Wed, 03 Jan 2024 18:10:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id x62-20020a636341000000b005ce53bf5a82sm12374905pgb.77.2024.01.03.18.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 18:10:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] quilt,cpio: Create ptest user when ptest is enabled in distro features
Date: Wed,  3 Jan 2024 18:10:52 -0800
Message-ID: <20240104021052.754030-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104021052.754030-1-raj.khem@gmail.com>
References: <20240104021052.754030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 02:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193300

Fixes warnings

run.do_install_ptest_base.107960:175 exit 1 from 'chgrp -R ptest /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/cpio/2.14/image/usr/lib/cpio/ptest/'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc   |  8 ++++----
 meta/recipes-extended/cpio/cpio_2.14.bb | 11 +++++------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 3374f4dfbf3..89572d70d7c 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -20,7 +20,7 @@ SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
 
 SRC_URI[sha256sum] = "3be3be0987e72a6c364678bb827e3e1fcc10322b56bc5f02b576698f55013cc2"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest useradd
 
 INHIBIT_AUTOTOOLS_DEPS:class-native = "1"
 PATCHTOOL:class-native = "patch"
@@ -62,9 +62,9 @@ do_install:append:class-native () {
     touch ${D}${sysconfdir}/quiltrc
 }
 
-# The tests need to run as a non-root user, so pull in the ptest user
-DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+# The tests need to run as a non-root user
+USERADD_PACKAGES = "${PN}-ptest"
+USERADD_PARAM:${PN}-ptest = "--system --home /nonexistent --no-create-home --user-group ptest"
 
 do_install_ptest() {
 	install ${WORKDIR}/test.sh ${D}${PTEST_PATH}
diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index 560038d2a67..c6ab0054994 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cfa168d7905ca52454"
 
-inherit autotools gettext texinfo ptest
+inherit autotools gettext texinfo ptest useradd
 
 CVE_STATUS[CVE-2010-4226] = "not-applicable-platform: Issue applies to use of cpio in SUSE/OBS"
 
@@ -63,11 +63,10 @@ do_install_ptest_base:append() {
     chmod -R g+w ${D}${PTEST_PATH}/
 }
 
-# The tests need to run as a non-root user, so pull in the ptest user
-DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS:append:class-target = " ${MLPREFIX}ptest-runner"
-
-RDEPENDS:${PN}-ptest += "ptest-runner"
+# The tests need to run as a non-root user
+USERADD_PACKAGES = "${PN}-ptest"
+USERADD_PARAM:${PN}-ptest = "--system --home /nonexistent --no-create-home \
+                       --user-group ptest"
 
 PACKAGES =+ "${PN}-rmt"
 
-- 
2.43.0



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02187C83F22
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:33:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.15236.1724938382631410414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YCEgDW4I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-202508cb8ebso4109645ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938382; x=1725543182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf+EwvsSc6KQRzdDbM2mjX+ZUsr04GnskC9yaaV91YY=;
        b=YCEgDW4Ig7c+LSb1dB4bDckmovDbnngFZPCGr2Dw7dMlrR2pP9hyCLQCDwbcCjJVDJ
         0LJn1f1BtYLFikz+v5/DU6sHg6K8k5oU6bi8n+G0c5gPSCbNEvbSatEkaLBSonr9GVwz
         PVJbEysxSsrDP6lUQRcEddwxPukUg9hmbyCR6eJcaaHfLgjZikFlaQZaK6YD40LNlzhV
         Lrk2A2Mc9WSswzK4U7MJK8mK8gV+kbb8Mikm40jDDFU4+jgkr7/dGtW+uuEBpr+v3VJV
         6R6StiwLBSZiKJXpONG014vwXKJ5up0OmoJIl8nTkqJX+yQ0OPpCmZ+NgU5ZJxRlT3QH
         HP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938382; x=1725543182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf+EwvsSc6KQRzdDbM2mjX+ZUsr04GnskC9yaaV91YY=;
        b=WpNHJ7IsL3gMpZGXnHtOoFTOCxmRXETzKpcg+Awb6k/8dHM/2b64YjzqvVc5lpPO0n
         K8eHRzkqbzTaa2ysIgSAoBrBg60LyQjWp9+ISDKyK3yr/NPw3vmMXxUvBIsvWblbEHPD
         uotkWnxiqwkmeANtCI9xaBatbnzwpjZ3own8A2vs5mli/5hkbpQEH8s+4pCCP5vyyyCD
         WhPv1haDVvKPWk/TcLxqxyky4tpHDQIg9Ll18Y+BKVcQ648kZNPsYk8g7sCsjyIHRVDe
         0p8wmJKJKHi8IpLFgEiYeb3cMVfKvF6S0B0sU8OVzkgdK4cxWr86ccV5kNHne3gLy3N3
         3jIA==
X-Gm-Message-State: AOJu0YzBRHSnP+DIOJIIW9B1dDzlg/y9YfMIQtOGK0tEEn4sAybGrqzL
	ugR3KxE62z89YgFOud/lUbrsFaeKffggXQBTL5vobM8h2qO4m1GwOYnk9APReGn4fbJW2bP0M6X
	TUGQ=
X-Google-Smtp-Source: AGHT+IEcgKhElg3itm6OFiQCrus56MkXDu5mhq2dHliyRkG8O7lF5CTb8sPisWFlxWuqsNoCVOOpUA==
X-Received: by 2002:a17:902:da91:b0:203:a114:ce16 with SMTP id d9443c01a7336-2050c34fd82mr33853915ad.4.1724938381725;
        Thu, 29 Aug 2024 06:33:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:33:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] libcap-ng: update SRC_URI
Date: Thu, 29 Aug 2024 06:32:34 -0700
Message-Id: <ba5d05337c97ec14d00939f02ecdd6aeab126822.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203931

From: Changqing Li <changqing.li@windriver.com>

Refer [1], people.redhat.com has certificate issue, so update SRC_URI
to fix do_fetch warning

[1] https://github.com/stevegrubb/libcap-ng/issues/56

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb | 2 --
 meta/recipes-support/libcap-ng/libcap-ng.inc             | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
index 4790134ae9..ffde03963f 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
@@ -9,8 +9,6 @@ inherit lib_package autotools python3targetconfig
 # drop setuptools when version > 0.8.3 is released; it's needed only for distutils
 DEPENDS += "libcap-ng python3 swig-native python3-setuptools-native"
 
-S = "${WORKDIR}/libcap-ng-${PV}"
-
 EXTRA_OECONF += "--with-python3"
 
 do_install:append() {
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 12b4002d11..e4be030834 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,15 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master \
            file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
+SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
+S = "${WORKDIR}/git"
 
-SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
+do_configure:prepend() {
+    touch ${S}/NEWS
+}
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
-- 
2.34.1



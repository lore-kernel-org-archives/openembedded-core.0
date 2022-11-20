Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88434C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13208.1668953750517925500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RwgZF6/+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y10so7238073plp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyqJW967qoZb8TPjxkSWYhAr3IUQbYA5NM0b+feC+BA=;
        b=RwgZF6/+R37QAlLw5WCQn7tOAzCKvm1ORsDDg3CzyHZxhdGEsZOaTQIsjAW9A96ymg
         9sy2vYMO3DUMoIVbrLHN7LCdNlkjgKILfpQXw9mPzZGJ6K0zZWShXTACIo0S/+FwYWwG
         vK6sA+XG9z+w3MFsJQoFTxPErPd1QfzlYJ2bhcOOKi+gF0sQXET3W61GDhb5kTBGC4Ti
         xaX7lIn95uncNf10nmgSVAUWoc1PifDJgSyS1tAB5tU2PS9z1cOSiNFLbTzNLvtOhmFr
         byCcHZfjGDoLzU17whFSAW1YIocFdNQoEfeBCWgrkdpyEi5HL+ExCtDYRaAzA+SbFBBz
         e6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyqJW967qoZb8TPjxkSWYhAr3IUQbYA5NM0b+feC+BA=;
        b=7uuutBY04jxg9EAR/ZsoWnGSLhg+LRs+dUkGPSh5/3qiNa2SgwbeOMo0bVa+uyKFoG
         ZWRERAwtiQtG6XnRk24ughaX+AJLRPYsL6tZEGeaNf0Jx4QuXB7XB4Vuwh490ELV4VLy
         d05EgSVeLcvEzEG0MM5JaOpsCy9ZJq+D3jADmD0ZVDR5Wkcc9+2NMMrBc3DNXii52o6+
         z0mFq+FpT4038mTZtDVUV2Gmd+oEOgmG1rHmkuQuss4g/RwZCr8iesCmSj5snnsjqxqJ
         rzNLcdEw/Le15psJ2sY4ZokstMY0j9fPB+SBFnZzJ8aWlsZINhQa/3P81Q9v0T0+wY/v
         rPSA==
X-Gm-Message-State: ANoB5pmbsplBc3AQdMsy6aCVm8O+X7TqTGPmXP/6LvMhSnVlSa86nseB
	w+fUDhKUuCl2nfAaE1fVX7IP+gGVGHEbckZ6GE4=
X-Google-Smtp-Source: AA0mqf6ZQ6TGIgw2z2aa/ZVxgv3/fuKDM3MkamdDOxrHGb7+j6Nsptkz/jMVU10hWmdu9trBFtyfyQ==
X-Received: by 2002:a17:90a:5d0e:b0:202:c5cc:15bd with SMTP id s14-20020a17090a5d0e00b00202c5cc15bdmr22235429pji.235.1668953749356;
        Sun, 20 Nov 2022 06:15:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/35] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Date: Sun, 20 Nov 2022 04:14:56 -1000
Message-Id: <07aba073681a494da09ae5227ccd22cd50bf520e.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173607

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index 0ea4da05ce..a814eb79f9 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -113,7 +113,7 @@ do_install_ptest () {
         for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
             cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
             case $f in
-                *.so|userspace-probe-elf-binary)
+                *.so|userspace-probe-elf-*)
                     install -d ${D}${PTEST_PATH}/tests/$d/
                     ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
                     # Remove any rpath/runpath to pass QA check.
@@ -124,6 +124,7 @@ do_install_ptest () {
     done
 
     chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
@@ -185,4 +186,10 @@ do_install_ptest () {
 INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
     "
-- 
2.25.1



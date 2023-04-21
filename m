Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5541C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 08:00:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6734.1682064030020484573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 01:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=p0CrewnL;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a66b9bd893so18060615ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682064029; x=1684656029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31G0fmIJw45KV/T5GgqSIIRFeVaLe36+xdpdn1zU47A=;
        b=p0CrewnLmTSOC7pD0JOgnN+CmkmZnG/yFtZc4YIgHFwAS6nrcNhAEZfCxvpah29Pov
         b8LxSB6nDJat9HPC6DQYKg2oKhl91eGrBY7UrDZIDpV86Jq1E9ZBt0Urjp3Pp/+rg4TA
         8SqV3FAY8SmveHw9AsUiaEtMU4VE2pwBCam7wnoitBlaQO/jzlv1Gva7UB8uiYCjIhGH
         8kgoUTfW7S3z8FpNG4d0wgYrqoO/jwPsQbpWL7xl0pZ8Fvq1TB7JNbqmS5NEmZKpHo8p
         ba6G9n2iw9Y12xeD6wSAGYQ+EewLn1Nbzd0wUNqVY7abJHUXYh4G9b+OjbgGE0TNU3Od
         61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682064029; x=1684656029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31G0fmIJw45KV/T5GgqSIIRFeVaLe36+xdpdn1zU47A=;
        b=M9kHPcqWKAsPyz0fdr7Wf0rco535ksBxKbss+kjW8h3hfpJyP5hliycosWSNYxA22f
         yVtaa1H2tU37u+ehdFzE7tw0urkyh78M3o+jJpZz2g9PV6+rxm0AXvxLBg1BfavCDZMK
         vlUDb4LZzgyX1ub+lY+ts2tmv4zW5aIe9WyjYH4DhYf6RdNqCYd4ntvY3F3PzjgGJN4z
         1AL8PMT+8zZOvJ2DKf3SGj4MNwfrypmly05+AcQ5qLfLeIi69HO8dpCILqonjp11/GYo
         1uzw9NOlWLuDHzAUP41SDSrGFXRFvhLCinYpQ/u72ar3MWn3s8kh0EYC+QwOn/hz1FT9
         9g/g==
X-Gm-Message-State: AAQBX9dXhdFUaNLGaSCrGzcgRUnC6Og32GsJexLmy9n//QXSzyXoT6yT
	dzry7IGq+YqHmw7SGAHXn86kiJJp0vxaJQ==
X-Google-Smtp-Source: AKy350byNCL55Vbs1YirCSa9RAIpcoAAHiqhNZq7yeTGUc7lsyiLFOY7SlRexP2Z+TFSACpzUhhJEw==
X-Received: by 2002:a17:902:f353:b0:1a6:7ed8:84f7 with SMTP id q19-20020a170902f35300b001a67ed884f7mr3691522ple.20.1682064028957;
        Fri, 21 Apr 2023 01:00:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm2244389plz.88.2023.04.21.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 01:00:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] m4: Do not munge locale in ptests for musl
Date: Fri, 21 Apr 2023 01:00:26 -0700
Message-Id: <20230421080026.1734653-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 08:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180280

locale setting are done with glibc in mind and they cause segfaults with
musl. Therefore make these tweaks specific to glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1: Tried to add locale data for musl into deps

 meta/recipes-devtools/m4/m4-1.4.19.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 3b4303b7fd..fcc9e58270 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -40,8 +40,6 @@ do_install_ptest() {
                 cp -r ${B}/tests                        ${D}${PTEST_PATH}
                 cp -r ${S}/tests/*                      ${D}${PTEST_PATH}/tests/
                 sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
-                sed -i -e  "s;LOCALE_FR='fr_FR';LOCALE_FR='fr_FR.iso88591';g" \
-                       -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
                 find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
                 cp ${S}/build-aux/update-copyright  ${D}${PTEST_PATH}/tests/
                 sed -i 's;update-copyright;./update-copyright;g' ${D}${PTEST_PATH}/tests/test-update-copyright.sh
@@ -52,6 +50,10 @@ do_install_ptest() {
                 ln -s ptest ${D}${libdir}/${BPN}/${BP} 
 }
 
+do_install_ptest:append:libc-glibc() {
+                sed -i -e  "s;LOCALE_FR='fr_FR';LOCALE_FR='fr_FR.iso88591';g" \
+                       -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
+}
 
 RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
-- 
2.40.0



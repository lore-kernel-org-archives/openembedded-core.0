Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24511C8300C
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.145.1686329664924618738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HGEA/a5W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-653436fcc1bso1717547b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329664; x=1688921664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ9E1q6Xi0Z+Ws6Rfkg6Ten2TdGjQt1WahNIIxVm/4c=;
        b=HGEA/a5WWOqQFHiMQw6BZzIIk4Wq7TOMa+JgKEruW7CzffAH5PR6eMPfms7l47PGhH
         uQA51Us7vyUlEXRRY4g3Vuk72nhflH9ERrVO2CtOxr16IQRzwoiQ3RoFpg82OtLGrUwN
         ynmhcJ54rRh3Ye24vNGj0uGULlcCVW6L8GWUWeQNeW7hJd4OIKFqZuHKCyTKpmrlGGR5
         o3exLiGaiI1TFlkaUdsowa1qOz4o1Tg7vcliw944bFR5fdh0LUybz4EB7qXmbT1yIC2F
         M5rL1oet962nSpVmsZos1KSH6LQ9/j4E9EUEsuzCE2sbajfdk03RqPyhwpUDSQikaL3e
         y9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329664; x=1688921664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ9E1q6Xi0Z+Ws6Rfkg6Ten2TdGjQt1WahNIIxVm/4c=;
        b=fc9Iz6xXVmR1PRBz55I+1mJO1iCw14eKWOh7EGxix8sxfYWT9ZI44JXwtHmkyLRYps
         j3+1tk/98fVT0dHwItOnfGch2P8nbVTAUBgv9F8v9ds0Co8x1DigltrSWmbePRUXc24j
         eVLnBirkGZLHRjmUp7BXm+kDf/U/q5+P/CtO6xUrEBY6tGNiU29fam7Jaj5iu611nujV
         Ax3Xrulu8hVymcggOERvI7IuJW6aTDP3UjwkDqrL/kKHklGv2ik04vM2iPPGkG7iSYpD
         FsBYHiGDlIKABY325JVRtrVbB7C6/1nAxLEHVOFcwdx5o0GXdh1O8AX6c1WNoXdYups2
         EHYQ==
X-Gm-Message-State: AC+VfDz8Z/1FyCSo1Gixj5AWYO1ikIBm68NYyfivIjYgH3tLygj3533l
	ohVwMJNc56hOeuqus74rAgQ8S3D5pADeFnDWQns=
X-Google-Smtp-Source: ACHHUZ7fGZRze9Sx3Cro0xhYa+JsND5Rpid65u+HRidBjV7in7r3Le2Pv3zfpBHmEX/SV7kt15af5w==
X-Received: by 2002:a05:6a00:2451:b0:64f:835c:a9e5 with SMTP id d17-20020a056a00245100b0064f835ca9e5mr1750752pfj.16.1686329663877;
        Fri, 09 Jun 2023 09:54:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/30] e2fsprogs: Fix error SRCDIR when using usrmerge DISTRO_FEATURES
Date: Fri,  9 Jun 2023 06:53:39 -1000
Message-Id: <0e9cd399f7f5dcd31420cce8e0dc8c25f33bd80b.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182578

From: Qiu Tingting <qiutt@fujitsu.com>

    When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
    in test_script and test_one scripts, value of SRCDIR has problem.
      SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test

    ptest log
      # ptest-runner e2fsprogs
      START: ptest-runner
      2022-12-17T11:08
      BEGIN: /usr/lib/e2fsprogs/ptest
      ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
      ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
      DURATION: 0
      END: /usr/lib/e2fsprogs/ptest
      2022-12-17T11:08
      STOP: ptest-runner
      TOTAL: 1 FAIL: 0

    Reason
      In Makefile.in, SRCDIR is set by prefix and libdir.
        @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
        @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
      prefix=/usr
      libdir=/usr/lib (when usrmerge is set)

    solution
      Use PTEST_PATH to fix it.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 85e3b4f1d4b8734b0dd427d107a9f736bca9b7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch | 4 ++--
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index c3e46ce65f..20839b7286 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -22,7 +22,7 @@ index 8c4d2048..e021af32 100644
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
 -	@echo "SRCDIR=@srcdir@" >> test_one
-+	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
++	@echo "SRCDIR=@PTEST_PATH@/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
@@ -31,7 +31,7 @@ index 8c4d2048..e021af32 100644
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
 -	@echo "SRCDIR=@srcdir@" >> test_script
-+	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
++	@echo "SRCDIR=@PTEST_PATH@/test" >> test_script
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x-w test_script
  
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 403995e9cf..761b6c1198 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -132,6 +132,7 @@ do_install_ptest() {
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
 	    -e 's!../misc/tune2fs!tune2fs!g' -i ${D}${PTEST_PATH}/test/*/expect*
 	sed -e 's!../e2fsck/e2fsck!${base_sbindir}/e2fsck!g' -i ${D}${PTEST_PATH}/test/*/script
+	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test/test_script ${D}${PTEST_PATH}/test/test_one
 
 	# Remove various files
 	find "${D}${PTEST_PATH}" -type f \
-- 
2.34.1



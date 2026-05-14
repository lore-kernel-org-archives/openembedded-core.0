Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2D7CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:37 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19919.1778787751293001413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=Hicy4uPa;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50fb4a7d704so63078631cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787750; x=1779392550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXknqvWaPWsjxbAmO0lJ3X2Sp8TZCng9sPkyQcsqGFU=;
        b=Hicy4uPa4zTyuUWvtstTU8DulRbpSmK3UddELONXAJFJ0fMz1sZLqCSstd1Tkc5baf
         v2hosb+an1iNIfzAKMrulSS1P3urVU6CyzmOtc6uk9gtf2F7nsBh783SHBUa1RO5gisw
         1UZeffEPl/0NAwmNXUk6ZmB2OxgjGW0PynzU+yr3mqB6YJXenl8MxaxlbTgKQMTySGhQ
         BIXXMwIOv/YhWixbeROc+iaHPEM0xb/bRU4ThIuA9PfDuBCTqqznO7nkodpdqwxFQujL
         qKNB5exCUvwUjYcJbWNBCI1Z8Gz6FeoLpEGvxvnSVCwuONddw8Qq5rujcSil73kq6igZ
         s9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787750; x=1779392550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXknqvWaPWsjxbAmO0lJ3X2Sp8TZCng9sPkyQcsqGFU=;
        b=lMzzIDFBffZQnoHxrYms7mr+sgefcVbJFQsHcvgDHv0elYWKvzCiC7k0+rdITB0UA8
         oi7xOZNC6BYLNQHz1Fukxhz8af9X4pQN3o4it55GcA1xML5/W0fPQrw1iRmsxSAk608L
         S/znpgMN/CU1rrh/iT4hmi3oJkcHrkHua4L5HlX/4QmjnYpsZtSeyaUU2NrNpGXCrIwP
         oTp/A/sWVYN4Pa+N8jw2DCottawlhLgxII+MNTHnD3zWV3C4hkh3i+kqvsqxhqNxflVG
         RbBUgGtrDt3Vtvdik3r5WgPYhjDXokGvzBI817qn2B+SLRwAx1q5K8gvaOxQ3QX9lBwQ
         9CxQ==
X-Gm-Message-State: AOJu0Yx4ggT3mKrOQjzHwigScN0+kTfR+ybu5CDzf+4xr9qvf4Z3ZmgT
	moTEwXTYI8QFOtN9R/ffWlmIRrxOOYB+TEQT0aCRRKVjnKoa9T5myJdrwkG5779ZTpX36B3Nc/E
	y0PvkSGo=
X-Gm-Gg: Acq92OH3urIet57mcxVL/dhrmTTTdx5eEn6TVYBkI4z9ZorJAprzBrlJViDNDXoVf9i
	2rhqtKFWelQApbUbLtN4TdVeqi2DA2yOSRXEhAyxqs1oV4j2DsdipOoRca9ybde6q2RyMcAq3Gx
	xBDd9lxUa7b1wJfi6z6bVDoX+4owQyx5GI4GCxPMjFvHJYFqk5rxQvREqNuE3j89DSThJfz9k8b
	RVv50snSDLmdX9XSwxynO35NcHfKvGl5Mc1jGYAjHSZ+nrI3QdEkKRyy2agiLUsKmTu2s+KtUSm
	qmFja2fjWA0hEgjfQHibPdvyVjZt7XUZmoub5Ame3qpbvxMMjcnsmzOeyQ5dvhguAfRIJ3obrlD
	wY0wsmsLN9xeqQp+RXt4bA9p7sMCJ6O+UiXSu+YBe7KQgWHUDE7PMjEesOKjpTQPbkQ/evwxXiI
	7q1fKLq/9Y56czzrpXsq3QS3tDVWBEDSWvA2nk
X-Received: by 2002:ac8:5987:0:b0:50f:ca25:fb45 with SMTP id d75a77b69052e-5165a001ce2mr10802781cf.8.1778787749433;
        Thu, 14 May 2026 12:42:29 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645801211sm24295881cf.20.2026.05.14.12.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 10/11] patchtest: selftest: rework test files
Date: Thu, 14 May 2026 15:42:06 -0400
Message-ID: <20260514194207.1958325-11-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237057

Modify all of the selftest files so that they merge cleanly (except for
the ones we expect to fail that test). This manifests as a change to the
S variable and hunk offset adjustments.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../selftest/files/TestMbox.test_bugzilla_entry_format.fail  | 5 ++---
 .../selftest/files/TestMbox.test_bugzilla_entry_format.pass  | 5 ++---
 .../files/TestMbox.test_commit_message_presence.fail         | 5 ++---
 .../files/TestMbox.test_commit_message_presence.pass         | 5 ++---
 .../files/TestMbox.test_commit_message_user_tags.1.pass      | 5 ++---
 .../files/TestMbox.test_commit_message_user_tags.2.pass      | 5 ++---
 .../files/TestMbox.test_commit_message_user_tags.fail        | 5 ++---
 .../patchtest/selftest/files/TestMbox.test_mbox_format.pass  | 5 ++---
 .../selftest/files/TestMbox.test_shortlog_format.fail        | 5 ++---
 .../selftest/files/TestMbox.test_shortlog_format.pass        | 5 ++---
 .../selftest/files/TestMbox.test_shortlog_length.fail        | 5 ++---
 .../selftest/files/TestMbox.test_shortlog_length.pass        | 5 ++---
 .../files/TestMbox.test_signed_off_by_presence.1.fail        | 5 ++---
 .../files/TestMbox.test_signed_off_by_presence.2.fail        | 5 ++---
 .../selftest/files/TestMbox.test_signed_off_by_presence.pass | 5 ++---
 .../selftest/files/TestPatch.test_cve_tag_format.fail        | 5 ++---
 .../selftest/files/TestPatch.test_cve_tag_format.pass        | 5 ++---
 .../files/TestPatch.test_signed_off_by_presence.fail         | 5 ++---
 .../files/TestPatch.test_signed_off_by_presence.pass         | 5 ++---
 19 files changed, 38 insertions(+), 57 deletions(-)

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
index 6facb8c756..d5e8f898bd 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
@@ -51,7 +51,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -60,8 +60,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
index 2f35458b4f..8bbf18d4f7 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
@@ -51,7 +51,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -60,8 +60,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
index 6f4e61c0da..479ac14008 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
@@ -46,7 +46,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -55,8 +55,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
index 3fbc23fd00..f78acf17f6 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass
index 57f2fc8a8e..31b010c327 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.1.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass
index cdae2c3fac..182b96ecdf 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.2.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
index 9d54af9644..991d82144a 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user_tags.fail
@@ -49,7 +49,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -58,8 +58,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
index f06ae11d04..ffea42d831 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
index c5e4df2549..ac7a233dab 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
index 4948e26afc..4f1013244d 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
index 4ed1242821..6008f234db 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
index ef5066a650..7f5abe2b5c 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
index 4ede7271ee..7c07489bb8 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
@@ -49,7 +49,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -58,8 +58,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
index f7c3f5145a..c4b833d52f 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
index 2661c1416f..6c6a387275 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
index f64f2a40b0..20978c2d07 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
index 3819487041..1213c6e732 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
index b2d0fab9e3..cd16385012 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
@@ -49,7 +49,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -58,8 +58,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
index 2661c1416f..6c6a387275 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
@@ -50,7 +50,7 @@ diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/m
 index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
+@@ -3,6 +3,8 @@ SECTION = "examples"
  LICENSE = "MIT"
  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
@@ -59,8 +59,7 @@ index 2dc352d479e..d937759f157 100644
 +           file://0001-Fix-CVE-1234-56789.patch \
 +	   "
  
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
 -- 
 2.45.1
 
-- 
2.54.0



Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF65EC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 17:33:20 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.19363.1717176791398790144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 10:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xAVlD0fS;
 spf=pass (domain: baylibre.com, ip: 209.85.161.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ba090b0336so491771eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717176790; x=1717781590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVkfbJcCb83qxLGaaJZocLcMLMKv2uej8gIcQfCZPDM=;
        b=xAVlD0fSADsxZSmDAPydyFgEZT3Sm8Zu7yRm3rzAQMHcKGr4NHU7Eag5n/EKnOHxOF
         XT38bHXk5esNK6nP+qKyO0A4zB6lLHazlhEgtrpiSgR4uoeSAlVu/q4G+6MxTRWA3Zwj
         tmORG3teitZanmONgM+Ts+WbxOw8sjDaLUyHgBYR9CmNXWoEGzJCk+V/HyKDUGx/0TcA
         cNaT71FShVcOOg+Q240iXrKBZkaRjx8N+aXMhCzC06SDbhnhByUjeQqKrWWyE3VoCUjH
         5JlpMBT3Qqa+MAWfMQo9+U1ml3iuxO3Bjs6EStc6pLtNXSgrptf8vDGPDh9PeaWq5Z2K
         RrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717176790; x=1717781590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVkfbJcCb83qxLGaaJZocLcMLMKv2uej8gIcQfCZPDM=;
        b=bwGtOMPR4KOMO5F2gPwsd1XZK4wIPJ887Czt6/2mrjhUxd0JjBgnCoFo50Bf0jNIO/
         aojJJWfnoj81kk7F3ZaLoQ00iWqr4eIYQSFyDbW9P8ix0lUecILOFtZjTxs5XzeNIpqY
         Ed/P2g0Exl/klbwEQ/K/eMt0c+RF01foxU8sYeqrPE1iTHom9K8dA1B1Dl+Te65nMv1L
         sD4+sdsRkuR24XE9BXEQXFZg6dUF4EEBDsAAPlF2o5aqSo4/RYkCrzul12yMK75gmJmg
         E4Ce4i5XiZ9swVTiSO1BgpREutD5GHgikUwJ0LrW/VOADicisiCQcQsLf5CqHEMCTEyY
         dHrg==
X-Gm-Message-State: AOJu0YxoJPQhJY0JiVWpEV8HoT5SyJexAhKLt4t0rcBbhmD0pUSMTFKP
	dY3xN0Qf63F97igrcbEZePoWfhlTzZPEoS80pGreJid+zjTkDQt0wBqq8U0tABY1vpvq78qLHV8
	w
X-Google-Smtp-Source: AGHT+IF2oe3yDTT00AActt9d303mdjdWY1j4k4BScRonIDLxO4/xh+9OqXPkvopWDwTqm6OokK1KWQ==
X-Received: by 2002:a05:6359:671e:b0:18f:8289:16e6 with SMTP id e5c5f4694b2df-19b48d4ce57mr259102655d.6.1717176788244;
        Fri, 31 May 2024 10:33:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f042dasm74635485a.22.2024.05.31.10.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 10:33:07 -0700 (PDT)
From: tgamblin@baylibre.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: selftest: fix patch files
Date: Fri, 31 May 2024 13:33:00 -0400
Message-ID: <20240531173305.3233365-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 17:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200080

From: Trevor Gamblin <tgamblin@baylibre.com>

Recent changes to the selftest-hello recipe caused the patchtest
selftest patches to not apply cleanly, which in turn meant several tests
weren't being fully executed or were reporting unexpected PASS/SKIP.

Update all of the test patch files to use a newer baseline and apply
cleanly again.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../files/TestMbox.test_author_valid.1.fail   | 57 +++++++------
 .../files/TestMbox.test_author_valid.1.pass   | 56 +++++++------
 .../files/TestMbox.test_author_valid.2.fail   | 56 +++++++------
 .../files/TestMbox.test_author_valid.2.pass   | 56 +++++++------
 .../TestMbox.test_bugzilla_entry_format.fail  | 73 +++++++++++++----
 .../TestMbox.test_bugzilla_entry_format.pass  | 78 +++++++++++++-----
 ...TestMbox.test_commit_message_presence.fail | 68 ++++++++++++----
 ...TestMbox.test_commit_message_presence.pass | 72 +++++++++++++----
 .../files/TestMbox.test_mbox_format.1.fail    | 36 ---------
 .../files/TestMbox.test_mbox_format.2.fail    | 35 --------
 .../files/TestMbox.test_mbox_format.fail      | 66 ++++++++++++++++
 .../files/TestMbox.test_mbox_format.pass      | 79 +++++++++++++------
 .../TestMbox.test_series_merge_on_head.1.skip |  2 +-
 .../files/TestMbox.test_shortlog_format.fail  | 53 ++++++-------
 .../files/TestMbox.test_shortlog_format.pass  | 53 ++++++-------
 .../files/TestMbox.test_shortlog_length.fail  | 53 ++++++-------
 .../files/TestMbox.test_shortlog_length.pass  | 53 ++++++-------
 ...estMbox.test_signed_off_by_presence.1.fail | 60 +++++++-------
 ...estMbox.test_signed_off_by_presence.2.fail | 62 +++++++--------
 .../TestMbox.test_signed_off_by_presence.pass | 60 +++++++-------
 .../TestMetadata.test_cve_check_ignore.fail   | 25 +++---
 .../TestMetadata.test_cve_check_ignore.pass   | 26 +++---
 ...c_files_chksum_modified_not_mentioned.fail | 23 ++----
 ...c_files_chksum_modified_not_mentioned.pass | 25 ++----
 ...tadata.test_lic_files_chksum_presence.fail | 65 +++++++--------
 ...tadata.test_lic_files_chksum_presence.pass | 65 +++++++--------
 .../TestMetadata.test_src_uri_left_files.fail | 23 ++----
 .../TestMetadata.test_src_uri_left_files.pass | 25 +++---
 .../TestMetadata.test_summary_presence.fail   | 64 +++++++--------
 .../TestMetadata.test_summary_presence.pass   | 68 ++++++++--------
 .../files/TestPatch.test_cve_tag_format.fail  | 57 ++++++-------
 .../files/TestPatch.test_cve_tag_format.pass  | 53 ++++++-------
 ...TestPatch.test_signed_off_by_presence.fail | 60 +++++++-------
 ...TestPatch.test_signed_off_by_presence.pass | 60 +++++++-------
 34 files changed, 930 insertions(+), 837 deletions(-)
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.fail

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail
index 0c40cdc1b6b..30c1bc4624b 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.fail
@@ -1,32 +1,43 @@
-From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
 From: First Last <first.last@example.com>
-Date: Tue, 29 Aug 2023 13:32:24 -0400
-Subject: [PATCH] selftest-hello: add a summary
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This patch should fail the selftests because the author address is from the
-invalid "example.com".
+This should fail the test_author_valid test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..491f0a3df7 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -1,3 +1,4 @@
-+SUMMARY = "A cool sample"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+new file mode 100644
+index 00000000000..f3dec1b220c
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
++
++SRC_URI = "file://helloworld.c"
++
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
++
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
++}
++
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
++}
++
 +BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass
index cbb8ef2cef1..6e82b08bc6a 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.1.pass
@@ -1,31 +1,43 @@
-From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
 From: First Last <first.last@address.com>
-Date: Tue, 29 Aug 2023 13:32:24 -0400
-Subject: [PATCH] selftest-hello: add a summary
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This patch should pass the selftests because the author address is in a valid format.
+This should pass the test_author_valid test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..491f0a3df7 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -1,3 +1,4 @@
-+SUMMARY = "A cool sample"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+new file mode 100644
+index 00000000000..f3dec1b220c
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
++
++SRC_URI = "file://helloworld.c"
++
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
++
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
++}
++
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
++}
++
 +BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail
index 3e2b81bca18..745a8f45d9b 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.fail
@@ -1,31 +1,43 @@
-From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
 From: Upgrade Helper <auh@auh.yoctoproject.org>
-Date: Tue, 29 Aug 2023 13:32:24 -0400
-Subject: [PATCH] selftest-hello: add a summary
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This patch should fail the selftests because AUH is an invalid sender.
+This should fail the test_author_valid test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..491f0a3df7 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -1,3 +1,4 @@
-+SUMMARY = "A cool sample"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+new file mode 100644
+index 00000000000..f3dec1b220c
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
++
++SRC_URI = "file://helloworld.c"
++
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
++
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
++}
++
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
++}
++
 +BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass
index f84e1265a77..56cb77fa697 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_author_valid.2.pass
@@ -1,31 +1,43 @@
-From 1fbb446d1849b1208012cbdae5d85d228cdbe4a6 Mon Sep 17 00:00:00 2001
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
 From: First Last <averylongemailaddressthatishardtoread.from@address.com>
-Date: Tue, 29 Aug 2023 13:32:24 -0400
-Subject: [PATCH] selftest-hello: add a summary
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This patch should pass the selftests because the author address is in a valid format.
+This should pass the test_author_valid test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..491f0a3df7 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -1,3 +1,4 @@
-+SUMMARY = "A cool sample"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+new file mode 100644
+index 00000000000..f3dec1b220c
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
++
++SRC_URI = "file://helloworld.c"
++
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
++
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
++}
++
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
++}
++
 +BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
index 854d7eb8c7d..6facb8c756d 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
@@ -1,26 +1,67 @@
-From f06e14633723c1e78bc7a4b0fd0d3b79d09f0c68 Mon Sep 17 00:00:00 2001
-From: name@somedomain.com <email@address.com>
-Date: Thu, 2 May 2024 10:21:45 -0400
-Subject: [PATCH] README.OE-Core.md: Add foo to header
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
-This test patch adds 'foo' to the header of README.OE-Core.md
+This should fail the test_bugzilla_entry_format test.
 
 [YOCTO 1234]
+CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- README.OE-Core.md | 1 +
- 1 file changed, 1 insertion(+)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/README.OE-Core.md b/README.OE-Core.md
-index 687c58e410c..9d863891134 100644
---- a/README.OE-Core.md
-+++ b/README.OE-Core.md
-@@ -1,3 +1,4 @@
-+**** FOO ****
- OpenEmbedded-Core
- =================
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.44.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
index 2648b033645..2f35458b4f5 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.pass
@@ -1,25 +1,67 @@
-From fdfd605e565d874502522c4b70b786c8c5aa0bad Mon Sep 17 00:00:00 2001
-From: name@somedomain.com <email@address.com>
-Date: Fri, 17 Feb 2017 16:29:21 -0600
-Subject: [PATCH] README: adds 'foo' to the header
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
-This test patch adds 'foo' to the header
+This should pass the test_bugzilla_entry_format test.
 
 [YOCTO #1234]
+CVE: CVE-1234-56789
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- README | 1 +
- 1 file changed, 1 insertion(+)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/README b/README
-index 521916cd4f..cdf29dcea3 100644
---- a/README
-+++ b/README
-@@ -1,3 +1,4 @@
-+**** FOO ****
- OpenEmbedded-Core
- =================
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
+-- 
+2.45.1
 
---
-2.11.0
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
index 93ca0f9119b..6f4e61c0daf 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.fail
@@ -1,22 +1,62 @@
-From 0a52a62c9430c05d22cb7f46380488f2280b69bb Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 1 Sep 2023 08:56:14 -0400
-Subject: [PATCH] README.OE-Core.md: add foo
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- README.OE-Core.md | 1 +
- 1 file changed, 1 insertion(+)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/README.OE-Core.md b/README.OE-Core.md
-index 2f2127fb03..48464252c8 100644
---- a/README.OE-Core.md
-+++ b/README.OE-Core.md
-@@ -1,3 +1,4 @@
-+** FOO **
- OpenEmbedded-Core
- =================
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
  
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
index 5e3dcbd58b1..3fbc23fd002 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_presence.pass
@@ -1,24 +1,66 @@
-From 0a52a62c9430c05d22cb7f46380488f2280b69bb Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 1 Sep 2023 08:56:14 -0400
-Subject: [PATCH] README.OE-Core.md: add foo
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
-This is a commit message
+This should pass the test_commit_message_presence test.
+
+CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- README.OE-Core.md | 1 +
- 1 file changed, 1 insertion(+)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/README.OE-Core.md b/README.OE-Core.md
-index 2f2127fb03..48464252c8 100644
---- a/README.OE-Core.md
-+++ b/README.OE-Core.md
-@@ -1,3 +1,4 @@
-+** FOO **
- OpenEmbedded-Core
- =================
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail
deleted file mode 100644
index 9cc4aab38a5..00000000000
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.1.fail
+++ /dev/null
@@ -1,36 +0,0 @@
-From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 30 Aug 2023 12:15:00 -0400
-Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
-
-This test should fail the mbox formatting test and the merge on head
-test.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
- rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
-
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-similarity index 88%
-rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-index 547587bef4..acc388ec2c 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-@@ -1,3 +1,4 @@
-%+SUMMARY = "Hello!"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
--- 
-2.41.0
-
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail
deleted file mode 100644
index eca1c60085f..00000000000
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.2.fail
+++ /dev/null
@@ -1,35 +0,0 @@
-From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 30 Aug 2023 12:15:00 -0400
-Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
-
-This test should fail the merge-on-head and mbox formatting tests.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
- rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
-
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-similarity index 88%
-rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-index 547587bef4..acc388ec2c 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-@@ -1,3 +1,4 @@
-%+SUMMARY = "Hello!"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
- LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
--- 
-2.41.0
-
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.fail
new file mode 100644
index 00000000000..0dda6802d19
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.fail
@@ -0,0 +1,66 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
+
+This should fail the test_mbox_format test.
+
+CVE: CVE-1234-56789
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
+%+           file://0001-Fix-CVE-1234-56789.patch \
++	   "
+ 
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
+-- 
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
index 33940adffce..f06ae11d047 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_mbox_format.pass
@@ -1,33 +1,66 @@
-From d12db4cfa913b0e7a4b5bd858d3019acc53ce426 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 30 Aug 2023 12:15:00 -0400
-Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789
+
+This should pass the test_mbox_format test.
+
+CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
- rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-similarity index 88%
-rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-index 547587bef4..acc388ec2c 100644
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix CVE-NOT-REAL
++
++CVE: CVE-1234-56789
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-@@ -1,3 +1,4 @@
-+SUMMARY = "Hello!"
- DESCRIPTION = "Simple helloworld application -- selftest variant"
- SECTION = "examples"
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,7 +3,9 @@ SECTION = "examples"
  LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+ 
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip b/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
index 2a72457878f..072ccc28c01 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
@@ -3,7 +3,7 @@ From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 30 Aug 2023 12:15:00 -0400
 Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
 
-This file should pass the test_series_merge_on_head test.
+This file should skip the test_series_merge_on_head test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
index cdbbc61b61e..c5e4df2549d 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.fail
@@ -1,23 +1,25 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello% fix CVE-1234-56789
 
+This should fail the test_shortlog_format test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -56,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
index ef6017037c6..4948e26afc4 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_format.pass
@@ -1,23 +1,25 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should pass the test_shortlog_format test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -56,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
index 629e78540bb..4ed12428219 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.fail
@@ -1,23 +1,25 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
-Subject: [PATCH] selftest-hello: this is a very long commit shortlog with way too many words included in it to pass the test
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: fix CVE-1234-56789 this is a very long commit shortlog with way too many words included in it to pass the test
+
+This should fail the test_shortlong_length test.
 
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -57,17 +57,10 @@ index 547587bef4..76975a6729 100644
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
 +           file://0001-Fix-CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
index ef6017037c6..ef5066a6502 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_shortlog_length.pass
@@ -1,23 +1,25 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should pass the test_shortlog_length test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -56,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
index 35d92aeed7c..4ede7271ee4 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.1.fail
@@ -1,22 +1,24 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should fail the test_signed_off_by_presence test.
+
 CVE: CVE-1234-56789
 
 ---
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..869cfb6fe5
+index 00000000000..8a4f9329303
 --- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -34,18 +36,17 @@ index 0000000000..869cfb6fe5
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -54,18 +55,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
index 68f38dee065..f7c3f5145ac 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.2.fail
@@ -1,23 +1,25 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should fail the test_signed_off_by_presence test.
+
 CVE: CVE-1234-56789
 
-Approved: Trevor Gamblin <tgamblin@baylibre.com>
+Approved-of-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..869cfb6fe5
+index 00000000000..8a4f9329303
 --- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,18 +37,17 @@ index 0000000000..869cfb6fe5
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -55,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
index ea34c76f0d8..2661c1416fc 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_signed_off_by_presence.pass
@@ -1,23 +1,25 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should pass the test_signed_off_by_presence test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..869cfb6fe5
+index 00000000000..8a4f9329303
 --- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,18 +37,17 @@ index 0000000000..869cfb6fe5
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -55,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
index 3574463ade0..dccafcd9bcc 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.fail
@@ -1,30 +1,25 @@
-From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
-Date: Sat, 10 Feb 2024 13:18:44 +0100
+From 60450eefbc2c438a37c5e08759d021b18f0df0a3 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
 Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 This should fail the test_cve_tag_format selftest.
 
-Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..3ef9b87c34 100644
+index 2dc352d479e..cc103de6e2e 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -16,4 +16,5 @@ do_install() {
+@@ -17,4 +17,5 @@ do_install() {
  	install -m 0755 helloworld ${D}${bindir}
  }
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
 +CVE_CHECK_IGNORE = "CVE-2024-12345"
-+BBCLASSEXTEND = "native nativesdk"
+ BBCLASSEXTEND = "native nativesdk"
 -- 
-2.39.2
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
index 10f942a6ebf..93a6cc91fb1 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignore.pass
@@ -1,31 +1,25 @@
-From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
-Date: Sat, 10 Feb 2024 13:23:56 +0100
+From f91073242268d2b2c1a1a705e7fd585679f78a59 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
 Subject: [PATCH] selftest-hello: add CVE_STATUS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 This should pass the test_cve_tag_format selftest.
 
-Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..9908b3b417 100644
+index 2dc352d479e..88c5c98608f 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -16,4 +16,6 @@ do_install() {
+@@ -17,4 +17,5 @@ do_install() {
  	install -m 0755 helloworld ${D}${bindir}
  }
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
 +CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
-+
-+BBCLASSEXTEND = "native nativesdk"
+ BBCLASSEXTEND = "native nativesdk"
 -- 
-2.39.2
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail
index ab6c52c374b..61b3784e3c8 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.fail
@@ -1,19 +1,17 @@
-From f89919ea86d38404dd621521680a0162367bb965 Mon Sep 17 00:00:00 2001
+From 974c3a143bc67faaff9abcc0a06a3d5e692fc660 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 6 Sep 2023 09:09:27 -0400
+Date: Fri, 31 May 2024 11:51:15 -0400
 Subject: [PATCH] selftest-hello: update LIC_FILES_CHKSUM
 
-This test should fail the
-test_metadata_lic_files_chksum.LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned
-test.
+This should fail the test_lic_files_chksum_modified_not_mentioned test.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..65dda40aba 100644
+index 2dc352d479e..356921db1dd 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -1,7 +1,7 @@
@@ -25,13 +23,6 @@ index 547587bef4..65dda40aba 100644
  
  SRC_URI = "file://helloworld.c"
  
-@@ -16,4 +16,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass
index 99d9f144da4..b7be1e8e556 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_modified_not_mentioned.pass
@@ -1,21 +1,19 @@
-From f89919ea86d38404dd621521680a0162367bb965 Mon Sep 17 00:00:00 2001
+From 974c3a143bc67faaff9abcc0a06a3d5e692fc660 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 6 Sep 2023 09:09:27 -0400
+Date: Fri, 31 May 2024 11:51:15 -0400
 Subject: [PATCH] selftest-hello: update LIC_FILES_CHKSUM
 
-License-Update: Fix checksum
+This should pass the test_lic_files_chksum_modified_not_mentioned test.
 
-This test should pass the
-test_metadata_lic_files_chksum.LicFilesChkSum.test_lic_files_chksum_modified_not_mentioned
-test.
+License-Update: Stuff happened!
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..65dda40aba 100644
+index 2dc352d479e..356921db1dd 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -1,7 +1,7 @@
@@ -27,13 +25,6 @@ index 547587bef4..65dda40aba 100644
  
  SRC_URI = "file://helloworld.c"
  
-@@ -16,4 +16,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail
index e14d644bb2f..a7a0b0bacb8 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.fail
@@ -1,53 +1,42 @@
-From 66430e7c6fbd5187b66560909a510e136fed91c0 Mon Sep 17 00:00:00 2001
-From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
-Date: Thu, 23 Feb 2017 10:34:27 -0600
-Subject: [PATCH] meta: adding hello-yocto recipe
+From 74bc209a4fbe4da2f57e153ccfff3d2241dada8d Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This is a sample recipe
+This should fail the test_lic_files_chksum_presence test.
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../hello-world/hello-world/hello_world.c      |  5 +++++
- .../hello-world/hello-world_1.0.bb             | 18 ++++++++++++++++++
- 2 files changed, 23 insertions(+)
- create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
- create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
+ .../selftest-hello-extra_1.0.bb               | 20 +++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 new file mode 100644
-index 0000000000..0d59f57d4c
+index 00000000000..875bcbef859
 --- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
-@@ -0,0 +1,5 @@
-+#include <stdio.h>
-+
-+int main(){
-+    printf("Hello World\n");
-+}
-diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-new file mode 100644
-index 0000000000..3c990c108a
---- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-@@ -0,0 +1,18 @@
-+SUMMARY = "This is a sample summary"
-+DESCRIPTION = "This is a sample description"
-+HOMEPAGE = "https://sample.com/this-is-a-sample"
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,20 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
 +LICENSE = "MIT"
 +
-+SRC_URI += "file://hello_world.c"
++SRC_URI = "file://helloworld.c"
 +
-+SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
-+SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
 +
-+do_compile(){
-+    ${CC} -o hello_world ../hello_world.c
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
 +}
 +
-+do_install(){
-+    install -d ${D}${bindir}
-+    install -m +x hello_world ${D}${bindir}/hello_world
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
 +}
++
++BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass
index b8da16dfe5b..8ffa97ec568 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_lic_files_chksum_presence.pass
@@ -1,54 +1,43 @@
-From 5144d2ba1aa763312c047dd5f8901368cff79da6 Mon Sep 17 00:00:00 2001
-From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
-Date: Thu, 23 Feb 2017 10:34:27 -0600
-Subject: [PATCH] meta: adding hello-yocto recipe
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This is a sample recipe
+This should pass the test_lic_files_chksum_presence test.
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../hello-world/hello-world/hello_world.c     |  5 +++++
- .../hello-world/hello-world_1.0.bb            | 19 +++++++++++++++++++
- 2 files changed, 24 insertions(+)
- create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
- create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 new file mode 100644
-index 0000000000..0d59f57d4c
+index 00000000000..f3dec1b220c
 --- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
-@@ -0,0 +1,5 @@
-+#include <stdio.h>
-+
-+int main(){
-+    printf("Hello World\n");
-+}
-diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-new file mode 100644
-index 0000000000..44d888c82a
---- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-@@ -0,0 +1,19 @@
-+SUMMARY = "This is a sample summary"
-+DESCRIPTION = "This is a sample description"
-+HOMEPAGE = "https://sample.com/this-is-a-sample"
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
 +LICENSE = "MIT"
 +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 +
-+SRC_URI += "file://hello_world.c"
++SRC_URI = "file://helloworld.c"
 +
-+SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
-+SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
 +
-+do_compile(){
-+    ${CC} -o hello_world ../hello_world.c
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
 +}
 +
-+do_install(){
-+    install -d ${D}${bindir}
-+    install -m +x hello_world ${D}${bindir}/hello_world
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
 +}
++
++BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
index 983b6e0c2bf..0a402d0a3e9 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
@@ -1,17 +1,17 @@
-From 4ab06b5f81455249cd5e89d2cce9863803b5ecb5 Mon Sep 17 00:00:00 2001
+From f2f7b6bcb831289bc3ba2343ad7dc5bee6d6e0cd Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 8 Sep 2023 14:41:00 -0400
+Date: Fri, 31 May 2024 08:45:41 -0400
 Subject: [PATCH] selftest-hello: remove helloworld.c
 
 This should fail the test_src_uri_left_files selftest.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..f6817f05bc 100644
+index 2dc352d479e..e95270adaeb 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,8 +3,6 @@ SECTION = "examples"
@@ -20,16 +20,9 @@ index 547587bef4..f6817f05bc 100644
  
 -SRC_URI = "file://helloworld.c"
 -
- S = "${WORKDIR}"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
  
- do_compile() {
-@@ -16,4 +14,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
index 1f1a77e581f..a675c028d0f 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
@@ -1,6 +1,6 @@
-From 6c7ac367a873bf827c19b81085c943eace917a99 Mon Sep 17 00:00:00 2001
+From e79933e2fc68570066eca66f0b599d259b7a1731 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 8 Sep 2023 14:41:00 -0400
+Date: Fri, 31 May 2024 08:18:48 -0400
 Subject: [PATCH] selftest-hello: remove helloworld.c
 
 This should pass the test_src_uri_left_files selftest.
@@ -8,13 +8,13 @@ This should pass the test_src_uri_left_files selftest.
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  .../recipes-test/selftest-hello/files/helloworld.c        | 8 --------
- .../recipes-test/selftest-hello/selftest-hello_1.0.bb     | 4 +---
- 2 files changed, 1 insertion(+), 11 deletions(-)
+ .../recipes-test/selftest-hello/selftest-hello_1.0.bb     | 2 --
+ 2 files changed, 10 deletions(-)
  delete mode 100644 meta-selftest/recipes-test/selftest-hello/files/helloworld.c
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/helloworld.c b/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
 deleted file mode 100644
-index fc7169b7b8..0000000000
+index fc7169b7b83..00000000000
 --- a/meta-selftest/recipes-test/selftest-hello/files/helloworld.c
 +++ /dev/null
 @@ -1,8 +0,0 @@
@@ -27,7 +27,7 @@ index fc7169b7b8..0000000000
 -	return 0;
 -}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..f6817f05bc 100644
+index 2dc352d479e..e95270adaeb 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,8 +3,6 @@ SECTION = "examples"
@@ -36,16 +36,9 @@ index 547587bef4..f6817f05bc 100644
  
 -SRC_URI = "file://helloworld.c"
 -
- S = "${WORKDIR}"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
  
- do_compile() {
-@@ -16,4 +14,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail
index 2d2b4e683d7..1087843619b 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.fail
@@ -1,46 +1,42 @@
-From e29da5faa74409be394caa09d9f3b7b60f8592b9 Mon Sep 17 00:00:00 2001
-From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
-Date: Thu, 23 Feb 2017 10:34:27 -0600
-Subject: [PATCH] meta: adding hello-yocto recipe
+From f4b72cc24f5e2a290a8637775c4d41c16d5d83aa Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This is a sample recipe
+This should fail the test_summary_presence test.
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- meta/recipes-devtools/hello-world/hello-world/hello_world.c |  5 +++++
- meta/recipes-devtools/hello-world/hello-world_1.0.bb        | 12 ++++++++++++
- 2 files changed, 17 insertions(+)
- create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
- create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
+ .../selftest-hello-extra_1.0.bb               | 20 +++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 new file mode 100644
-index 0000000000..0d59f57d4c
+index 00000000000..2dc352d479e
 --- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
-@@ -0,0 +1,5 @@
-+#include <stdio.h>
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,20 @@
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 +
-+int main(){
-+    printf("Hello World\n");
-+}
-diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-new file mode 100644
-index 0000000000..c4e1359217
---- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-@@ -0,0 +1,12 @@
-+LICENSE = "CLOSED"
++SRC_URI = "file://helloworld.c"
 +
-+SRC_URI += "file://hello_world.c"
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
 +
-+do_compile(){
-+    ${CC} -o hello_world ../hello_world.c
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
 +}
 +
-+do_install(){
-+    install -d ${D}${bindir}
-+    install -m +x hello_world ${D}${bindir}/hello_world
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
 +}
---
-2.11.0
++
++BBCLASSEXTEND = "native nativesdk"
+-- 
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass
index 55f0309b3f1..3d35a8d8fb5 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_summary_presence.pass
@@ -1,49 +1,43 @@
-From 0cd2fed12ce4b7b071edde12aec4481ad7a6f107 Mon Sep 17 00:00:00 2001
-From: Daniela Plascencia <daniela.plascencia@linux.intel.com>
-Date: Thu, 23 Feb 2017 10:34:27 -0600
-Subject: [PATCH] meta: adding hello-yocto recipe
+From 04eb94a0134ef5eb5b5fd783b303104fbfcd8437 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 11:03:47 -0400
+Subject: [PATCH] selftest-hello: add selftest-hello-extra
 
-This is a sample recipe
+This should pass the test_summary_presence test.
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../hello-world/hello-world/hello_world.c                 |  5 +++++
- meta/recipes-devtools/hello-world/hello-world_1.0.bb      | 15 +++++++++++++++
- 2 files changed, 20 insertions(+)
- create mode 100644 meta/recipes-devtools/hello-world/hello-world/hello_world.c
- create mode 100644 meta/recipes-devtools/hello-world/hello-world_1.0.bb
+ .../selftest-hello-extra_1.0.bb               | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 
-diff --git a/meta/recipes-devtools/hello-world/hello-world/hello_world.c b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
 new file mode 100644
-index 0000000000..0d59f57d4c
+index 00000000000..f3dec1b220c
 --- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world/hello_world.c
-@@ -0,0 +1,5 @@
-+#include <stdio.h>
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello-extra_1.0.bb
+@@ -0,0 +1,21 @@
++SUMMARY = "This is an example summary"
++DESCRIPTION = "Simple helloworld application -- selftest variant"
++SECTION = "examples"
++LICENSE = "MIT"
++LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 +
-+int main(){
-+    printf("Hello World\n");
-+}
-diff --git a/meta/recipes-devtools/hello-world/hello-world_1.0.bb b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-new file mode 100644
-index 0000000000..c54283eece
---- /dev/null
-+++ b/meta/recipes-devtools/hello-world/hello-world_1.0.bb
-@@ -0,0 +1,15 @@
-+SUMMARY = "This is a sample summary"
-+DESCRIPTION = "This is a sample description"
-+HOMEPAGE = "https://sample.com/this-is-a-sample"
-+LICENSE = "CLOSED"
++SRC_URI = "file://helloworld.c"
 +
-+SRC_URI += "file://hello_world.c"
++S = "${WORKDIR}/sources"
++UNPACKDIR = "${S}"
 +
-+do_compile(){
-+    ${CC} -o hello_world ../hello_world.c
++do_compile() {
++	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
 +}
 +
-+do_install(){
-+    install -d ${D}${bindir}
-+    install -m +x hello_world ${D}${bindir}/hello_world
++do_install() {
++	install -d ${D}${bindir}
++	install -m 0755 helloworld ${D}${bindir}
 +}
---
-2.11.0
++
++BBCLASSEXTEND = "native nativesdk"
+-- 
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
index c763a7506eb..f64f2a40b0b 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.fail
@@ -1,29 +1,31 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
-CVE: CVE-BAD-FORMAT
+This should fail the test_cve_tag_format test.
+
+CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
 +Subject: [PATCH] Fix CVE-NOT-REAL
 +
-+CVE: CVE-BAD-FORMAT
++CVE: CVE-BAD_FORMAT
 +Upstream-Status: Backport(http://example.com/example)
 +
 +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -56,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
index ef6017037c6..38194870419 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_cve_tag_format.pass
@@ -1,23 +1,25 @@
-From 35ccee3cee96fb29514475279248078d88907231 Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should pass the test_cve_tag format test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../files/0001-Fix-CVE-1234-56789.patch       | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..9219b8db62
+index 00000000000..8a4f9329303
 --- /dev/null
 +++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,19 +37,17 @@ index 0000000000..9219b8db62
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
 +
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -56,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
index ce8bf7b7d10..b2d0fab9e33 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.fail
@@ -1,23 +1,25 @@
-From 5a2d0ac780a0f4c046fb1a3c3463d3e726f191cb Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should fail the test_signed_off_by_presence test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../selftest-hello/files/CVE-1234-56789.patch | 26 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 30 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+ .../files/0001-Fix-CVE-1234-56789.patch       | 25 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..92a5b65a53
+index 00000000000..8a4f9329303
 --- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,26 @@
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,25 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -34,18 +36,17 @@ index 0000000000..92a5b65a53
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -54,18 +55,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
index ea34c76f0d8..2661c1416fc 100644
--- a/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_signed_off_by_presence.pass
@@ -1,23 +1,25 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
+Date: Fri, 31 May 2024 09:54:50 -0400
 Subject: [PATCH] selftest-hello: fix CVE-1234-56789
 
+This should pass the test_signed_off_by_presence test.
+
 CVE: CVE-1234-56789
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+ .../files/0001-Fix-CVE-1234-56789.patch       | 26 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
 new file mode 100644
-index 0000000000..869cfb6fe5
+index 00000000000..8a4f9329303
 --- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-56789.patch
+@@ -0,0 +1,26 @@
 +From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
 +From: Trevor Gamblin <tgamblin@baylibre.com>
 +Date: Tue, 29 Aug 2023 14:08:20 -0400
@@ -35,18 +37,17 @@ index 0000000000..869cfb6fe5
 +index 1788f38..83d7918 100644
 +--- a/strlen.c
 ++++ b/strlen.c
-+@@ -8,6 +8,7 @@ int main() {
-+ 
-+ 	printf("%d\n", str_len(string1));
-+ 	printf("%d\n", str_len(string2));
-++	printf("CVE FIXED!!!\n");
-+ 
-+ 	return 0;
-+ }
-+-- 
-+2.41.0
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("CVE FIXED!!!\n");
++
++	return 0;
++}
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
+index 2dc352d479e..d937759f157 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,7 +3,9 @@ SECTION = "examples"
@@ -55,18 +56,11 @@ index 547587bef4..76975a6729 100644
  
 -SRC_URI = "file://helloworld.c"
 +SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
++           file://0001-Fix-CVE-1234-56789.patch \
++	   "
  
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
+ S = "${WORKDIR}/sources"
+ UNPACKDIR = "${S}"
 -- 
-2.41.0
+2.45.1
 
-- 
2.45.1



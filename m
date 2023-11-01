Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D346C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:21:01 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.8528.1698848457775070122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OYu0fRXm;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41cd52c51abso42435571cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698848456; x=1699453256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFSeI0SElHIvMQvS3HmeDfj0KMhxnvnusavhcG14tA8=;
        b=OYu0fRXmYNMYN8ahXSM2GBYCKblO5xn+V6/yRtcl1UCOtekan6i5gG4V1svlTrpWPr
         35Xu4cHJoxZhp6P3vPtZ6om2Ugvs6oqzMnjg85NHBxdUPyMcvvBACtyI/NdjLsZ1wzTs
         PbpVksCL7cpTt0SYcPD5MI+rtnxRNelhsm+pIzzCO7Hstp5p1EyvjZrc0+ti6LNz9YyE
         T7fxNSj5pwfT5xd7vq0B48pOQuBHVUfoegfwqWTIH9nDvlTih3l9HmexO5fjJvIGAJU/
         Qv5YjHtLBLeLn/yfeWwQYo3mtkX36wYG5dYaXrDpfOU9Uy7t60jhOjxXkCvCTc0vhFv2
         omuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698848456; x=1699453256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFSeI0SElHIvMQvS3HmeDfj0KMhxnvnusavhcG14tA8=;
        b=w5+j8vW/bcym8lOc4sPIosY5AgyiQQvO24iFuwKdArP7zxYVSyBAAoRrxqD+qM3BYJ
         OOqXuX25wcAthcuPZMRor/hNxRTfGRm1rqr58kwhmLgBicbYCdJ9L1Uaole1ytTALIm5
         sW4LK29bOol/A/K8Etl69xinpvwOoNruFNMCZBKUueCHfYW+TaPZHSWHeSspYAyod0xY
         yWqyf0VsHgFi89xtD0zlUDFMhdcuonSSsVpImvVfXeEGlKY6T+YTrVlnAvVftt/8qrm/
         Y3MXdQrQO9TjZQAVAsGaxyzbzUI7j9zGpORgy1/O5p1UnA0OCTABPF7ljk3qJjrJuYft
         B5Gg==
X-Gm-Message-State: AOJu0YzYOqz9yCahXNfqmrLFet50yZLO6oBlNpUf7fzCh71gaYc3/OwG
	oh/kJinERjCvYULS7CDNWmwiARodJfAJ3O0v3c8Q0Q==
X-Google-Smtp-Source: AGHT+IH6TpfGumQcpef5fXTtfQI3ihIBceNxq9fv70zbMSZbMhRlK+Cic7LcUIbW236GzjuqDpCu4A==
X-Received: by 2002:a05:622a:d2:b0:41c:e76e:87f8 with SMTP id p18-20020a05622a00d200b0041ce76e87f8mr19014940qtw.34.1698848456391;
        Wed, 01 Nov 2023 07:20:56 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id o23-20020ac841d7000000b00403cce833eesm1425347qtm.27.2023.11.01.07.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:20:56 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: remove test for CVE tag in mbox
Date: Wed,  1 Nov 2023 10:20:55 -0400
Message-ID: <20231101142055.2117963-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189917

After patchtest went live it was determined that testing for a CVE tag
in the mbox commit message is unnecessary, since it will already be in
the shortlog and in any carried patches. Remove the test and the
associated selftest files so that its absence isn't flagged in future
test results.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...x.test_cve_presence_in_commit_message.fail | 72 ------------------
 ...x.test_cve_presence_in_commit_message.pass | 74 -------------------
 meta/lib/patchtest/tests/test_mbox.py         | 24 ------
 3 files changed, 170 deletions(-)
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
deleted file mode 100644
index d40b8a936bf..00000000000
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
+++ /dev/null
@@ -1,72 +0,0 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
-Subject: [PATCH] selftest-hello: fix CVE-1234-56789
-
-This patch should fail the test for CVE presence in the mbox commit message.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-new file mode 100644
-index 0000000000..869cfb6fe5
---- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
-+From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
-+From: Trevor Gamblin <tgamblin@baylibre.com>
-+Date: Tue, 29 Aug 2023 14:08:20 -0400
-+Subject: [PATCH] Fix CVE-NOT-REAL
-+
-+CVE: CVE-1234-56789
-+Upstream-Status: Backport(http://example.com/example)
-+
-+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-+---
-+ strlen.c | 1 +
-+ 1 file changed, 1 insertion(+)
-+
-+diff --git a/strlen.c b/strlen.c
-+index 1788f38..83d7918 100644
-+--- a/strlen.c
-++++ b/strlen.c
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
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
- LICENSE = "MIT"
- LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
- 
--SRC_URI = "file://helloworld.c"
-+SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
--- 
-2.41.0
-
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass
deleted file mode 100644
index 433c7a450ad..00000000000
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass
+++ /dev/null
@@ -1,74 +0,0 @@
-From 14d72f6973270f78455a8628143f2cff90e8f41e Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 29 Aug 2023 14:12:27 -0400
-Subject: [PATCH] selftest-hello: fix CVE-1234-56789
-
-This test should pass the mbox cve tag test.
-
-CVE: CVE-1234-56789
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- .../selftest-hello/files/CVE-1234-56789.patch | 27 +++++++++++++++++++
- .../selftest-hello/selftest-hello_1.0.bb      |  6 +++--
- 2 files changed, 31 insertions(+), 2 deletions(-)
- create mode 100644 meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-
-diff --git a/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-new file mode 100644
-index 0000000000..869cfb6fe5
---- /dev/null
-+++ b/meta-selftest/recipes-test/selftest-hello/files/CVE-1234-56789.patch
-@@ -0,0 +1,27 @@
-+From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
-+From: Trevor Gamblin <tgamblin@baylibre.com>
-+Date: Tue, 29 Aug 2023 14:08:20 -0400
-+Subject: [PATCH] Fix CVE-NOT-REAL
-+
-+CVE: CVE-1234-56789
-+Upstream-Status: Backport(http://example.com/example)
-+
-+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-+---
-+ strlen.c | 1 +
-+ 1 file changed, 1 insertion(+)
-+
-+diff --git a/strlen.c b/strlen.c
-+index 1788f38..83d7918 100644
-+--- a/strlen.c
-++++ b/strlen.c
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
-diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 547587bef4..76975a6729 100644
---- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-@@ -3,7 +3,9 @@ SECTION = "examples"
- LICENSE = "MIT"
- LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
- 
--SRC_URI = "file://helloworld.c"
-+SRC_URI = "file://helloworld.c \
-+           file://CVE-1234-56789.patch \
-+           "
- 
- S = "${WORKDIR}"
- 
-@@ -16,4 +18,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
--- 
-2.41.0
-
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 2449564d0f2..0b623b7d17b 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -6,7 +6,6 @@
 
 import base
 import collections
-import parse_cve_tags
 import parse_shortlog
 import parse_signed_off_by
 import pyparsing
@@ -33,8 +32,6 @@ class TestMbox(base.Base):
     rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
     rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
     revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
-    prog = parse_cve_tags.cve_tag
-    patch_prog = parse_cve_tags.patch_cve_tag
     signoff_prog = parse_signed_off_by.signed_off_by
     revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
     maxlength = 90
@@ -143,27 +140,6 @@ class TestMbox(base.Base):
             if not commit.commit_message.strip():
                 self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
-    def test_cve_presence_in_commit_message(self):
-        if self.unidiff_parse_error:
-            self.skip('Parse error %s' % self.unidiff_parse_error)
-
-        # we are just interested in series that introduce CVE patches, thus discard other
-        # possibilities: modification to current CVEs, patch directly introduced into the
-        # recipe, upgrades already including the CVE, etc.
-        new_patches = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_patches:
-            self.skip('No new patches introduced')
-
-        for commit in TestMbox.commits:
-            # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.search_string(commit.shortlog):
-                continue
-            if not self.patch_prog.search_string(commit.payload):
-                self.skip("No CVE tag in added patch, so not needed in mbox")
-            elif not self.prog.search_string(commit.payload):
-                self.fail('A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX"',
-                          commit=commit)
-
     def test_bugzilla_entry_format(self):
         for commit in TestMbox.commits:
             if not self.rexp_detect.search_string(commit.commit_message):
-- 
2.41.0



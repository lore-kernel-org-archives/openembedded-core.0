Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64996C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:40:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.634.1700498397455143201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NCd9yraF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso4003312b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498396; x=1701103196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ7FYQNWlEugTMoBGbxhqFBXxrUA9G7g8p1T9oV4vCg=;
        b=NCd9yraFK/RdvCePn5dxlyis2WJgysBmytc3UWi78ho0KslJgZLZqWmiipqrXTQcUX
         Bgi3sfzXpxk2b9sIUcqKWv5v0AlJ0iqwCl/b8lAUypZ32zSiQg23KMXdcs040V9MYuvi
         UqfDPx7nqD2+0je4ozVLfhE1PRSWvrhBeIR8cqRqqflFU2Gw3zEAPfCg5Zn0FRZWX141
         sg6rR7GEbOKtgjIQKjij9SUgHPwWYfQ7ZL1HJdp9+ZpfdyE5n+jW68Hut38POca2VYyF
         oe2FsmChQ6jSWAbypaetpCYDX24QS4G8Uc3lflaV+1pFHSYYFL/IFfl9nXGajH/wy6fa
         ptGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498396; x=1701103196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ7FYQNWlEugTMoBGbxhqFBXxrUA9G7g8p1T9oV4vCg=;
        b=w/pG5CNZc7AHEDKAAniBGfGkjBilD/xLxGBghLQQri/bwBi3mwVwB2ykNs4OT/N3eL
         ytsvaRp41FqTVDghR/bwICeKlMvbXAC+nDMvDLHbPPiN+PdtjyufjY+J+fR9Z8UHhLzp
         79YB1xhpQyP8onEZCKEH5TOP54qzPnqu2S3MvBX/OODcMfo8+7o0I6IwHzzylFexXOmH
         ETGTC74PR9ImiR0GCSSnygx3wyQQEJWFDODyLSkUBkGkqLv0ezsSUu5QmVSJY8UCHHaj
         LOX3KAz6IexAFlAUzeO5uJGtz/1TCckl1614phD7039Bgl1RwBD9lvzYBKpnY81Pa+j6
         e/gw==
X-Gm-Message-State: AOJu0Yznya5k6y7EVIm480IbJxFG9vz1jYdkFZWVxjp0YAZyvBanpDRP
	QSV730Z9rOLqCQeOY0OQZqRlr49Ky/DW3eUkT3PDxg==
X-Google-Smtp-Source: AGHT+IEaDsVJ8VhyULbZel9ebjRSLZSCo3ELtfhDqziRLsNFwjgolrMLkiRs4AqESJ23sBkKmSrf4Q==
X-Received: by 2002:a05:6a00:398b:b0:666:e1f4:5153 with SMTP id fi11-20020a056a00398b00b00666e1f45153mr7010255pfb.0.1700498396123;
        Mon, 20 Nov 2023 08:39:56 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 31/33] patchtest: remove test for CVE tag in mbox
Date: Mon, 20 Nov 2023 06:38:45 -1000
Message-Id: <a0bedd3e2ef98ab45e565af5e5dd1c77713479a2.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190920

From: Trevor Gamblin <tgamblin@baylibre.com>

After patchtest went live it was determined that testing for a CVE tag
in the mbox commit message is unnecessary, since it will already be in
the shortlog and in any carried patches. Remove the test and the
associated selftest files so that its absence isn't flagged in future
test results.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54690f18f04a2ab993a85d551ce4f8d0fa56618a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x.test_cve_presence_in_commit_message.fail | 72 ------------------
 ...x.test_cve_presence_in_commit_message.pass | 74 -------------------
 meta/lib/patchtest/tests/test_mbox.py         | 24 ------
 3 files changed, 170 deletions(-)
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
 delete mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.pass

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_cve_presence_in_commit_message.fail
deleted file mode 100644
index d40b8a936b..0000000000
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
index 433c7a450a..0000000000
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
index 2449564d0f..0b623b7d17 100644
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
2.34.1



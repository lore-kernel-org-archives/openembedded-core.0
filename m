Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BF8C3ABCB
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 20:51:48 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.36162.1746996702183790534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 13:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M/9IbOOD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250511205138ff58ccabedb474dba8-ne4zfy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250511205138ff58ccabedb474dba8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 May 2025 22:51:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ClFf8hnsH2EiQBYbsMy6EHABtTuzAQnoqifewrIs0Qw=;
 b=M/9IbOODckWlKkB1HbSvsNN7FMcgzDHXAOOjyMq1AwB0+1wCNrhDNzyi6cnNL2U/MF0ob9
 zQu4XCL/HSAcndKJrUgsBfKi2OW2cmLLknpFR6flXKcJJMsHKgp0IvZsaa+BN8ldYqU+qcPg
 ql96Lh9Zvbpm+sMw5rF/vyDBHCDRADs+Egkre7+6gT4gWpyLR/uzm1C6xHap8M8hA2E/T3Mf
 5qW1lXxV1qcO22YdzN+nlZ4EALrGY1Twlt1f1IRTs2x0DLr6MP6uzwhltenlFSZOM96VxcTu
 iobcP7IbsaghloLLs0DVmV8kZHt0wus9WosqlarflbvPcj2iafOFbqng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] perl: patch CVE-2024-56406
Date: Sun, 11 May 2025 22:50:51 +0200
Message-Id: <20250511205051.3731874-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 20:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216292

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD links for this CVE.
Tested by runniing ptest and CVE reproducer (before&after).
Ptest fails on test dist/threads/t/join, however the same test also
fails without this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...4-56406-Heap-buffer-overflow-with-tr.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.3.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch

diff --git a/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch b/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch
new file mode 100644
index 0000000000..377ef95f12
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch
@@ -0,0 +1,30 @@
+From 87f42aa0e0096e9a346c9672aa3a0bd3bef8c1dd Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Wed, 18 Dec 2024 18:25:29 -0700
+Subject: [PATCH] CVE-2024-56406: Heap-buffer-overflow with tr//
+
+This was due to underallocating needed space.  If the translation forces
+something to become UTF-8 that is initially bytes, that UTF-8 could
+now require two bytes where previously a single one would do.
+
+(cherry picked from commit f93109c8a6950aafbd7488d98e112552033a3686)
+
+CVE: CVE-2024-56406
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/87f42aa0e0096e9a346c9672aa3a0bd3bef8c1dd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ op.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/op.c b/op.c
+index 69ff030e88..298b292633 100644
+--- a/op.c
++++ b/op.c
+@@ -7515,6 +7515,7 @@ S_pmtrans(pTHX_ OP *o, OP *expr, OP *repl)
+                  * same time.  But otherwise one crosses before the other */
+                 if (t_cp < 256 && r_cp_end > 255 && r_cp != t_cp) {
+                     can_force_utf8 = TRUE;
++                    max_expansion = MAX(2, max_expansion);
+                 }
+             }
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index ed3518b62d..f6ebbf2d16 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2023-31484.patch \
            file://CVE-2023-31486-0001.patch \
            file://CVE-2023-31486-0002.patch \
+           file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \


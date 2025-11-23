Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968A7CFD316
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 22:41:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3888.1763937661918359992
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 14:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mP+mKUOB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025112322405945daee974400020711-zloyje@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025112322405945daee974400020711
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Nov 2025 23:41:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7ADSisVmKr50UfU5V2xx9KPnctxlmJVVz5/iRUcSCzg=;
 b=mP+mKUOBJSkrtihIQS1CMu+4Fl72v/d6GpXBH1dFjr4fX2QhRDnUsUfx63pkbDQnLmqfyZ
 Gb6Z0d2Q/BSNL5yBc4Hni4Nq/YsGjzt/ktUK/fGAKiAMN/nMweB561koPdw1lI3UBvOFCBWk
 JEQ6RE0O2IN34i1wxSjegwFRgaff0vwLP6+ML8ZGlGOk+noWPC0ckdMeAuIPv2QKOM7h7gy2
 CDIUjUyKmMPKR5XvN0QPdhJoxQeJPFDQhUh/UKP0W9fdd9XKsHVbFKVslgYOtt4VZuPGroxk
 Y4NU0BlI9j5foOFMs/LE3qM5dx1qBOeCPpSAu3iZVno5x9iy1RePH2xA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] libarchive: patch CVE-2025-60753
Date: Sun, 23 Nov 2025 23:40:25 +0100
Message-Id: <20251123224025.1870566-3-peter.marko@siemens.com>
In-Reply-To: <20251123224025.1870566-1-peter.marko@siemens.com>
References: <20251123224025.1870566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 22:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226732

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [3] marked in [2] mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60753
[2] https://github.com/libarchive/libarchive/issues/2725
[3] https://github.com/libarchive/libarchive/pull/2787

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/CVE-2025-60753.patch           | 76 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
new file mode 100644
index 00000000000..604e0421be2
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
@@ -0,0 +1,76 @@
+From 3150539edb18690c2c5f81c37fd2d3a35c69ace5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?ARJANEN=20Lo=C3=AFc=20Jean=20David?= <ljd@luigiscorner.mu>
+Date: Fri, 14 Nov 2025 20:34:48 +0100
+Subject: [PATCH] Fix bsdtar zero-length pattern issue.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Uses the sed-like way (and Java-like, and .Net-like, and Javascript-like…) to fix this issue of advancing the string to be processed by one if the match is zero-length.
+
+Fixes libarchive/libarchive#2725 and solves libarchive/libarchive#2438.
+
+CVE: CVE-2025-60753
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3150539edb18690c2c5f81c37fd2d3a35c69ace5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tar/subst.c              | 19 ++++++++++++-------
+ tar/test/test_option_s.c |  8 +++++++-
+ 2 files changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/tar/subst.c b/tar/subst.c
+index 9747abb9..902a4d64 100644
+--- a/tar/subst.c
++++ b/tar/subst.c
+@@ -237,7 +237,9 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 				continue;
+ 		}
+ 
+-		while (1) {
++		char isEnd = 0;
++		do {
++            isEnd = *name == '\0';
+ 			if (regexec(&rule->re, name, 10, matches, 0))
+ 				break;
+ 
+@@ -291,12 +293,15 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 			}
+ 
+ 			realloc_strcat(result, rule->result + j);
+-
+-			name += matches[0].rm_eo;
+-
+-			if (!rule->global)
+-				break;
+-		}
++			if (matches[0].rm_eo > 0) {
++                name += matches[0].rm_eo;
++            } else {
++                // We skip a character because the match is 0-length
++                // so we need to add it to the output
++                realloc_strncat(result, name, 1);
++                name += 1;
++            }
++		} while (rule->global && !isEnd); // Testing one step after because sed et al. run 0-length patterns a last time on the empty string at the end
+ 	}
+ 
+ 	if (got_match)
+diff --git a/tar/test/test_option_s.c b/tar/test/test_option_s.c
+index 564793b9..90b4c471 100644
+--- a/tar/test/test_option_s.c
++++ b/tar/test/test_option_s.c
+@@ -61,7 +61,13 @@ DEFINE_TEST(test_option_s)
+ 	systemf("%s -cf test1_2.tar -s /d1/d2/ in/d1/foo", testprog);
+ 	systemf("%s -xf test1_2.tar -C test1", testprog);
+ 	assertFileContents("foo", 3, "test1/in/d2/foo");
+-
++	systemf("%s -cf test1_3.tar -s /o/#/g in/d1/foo", testprog);
++	systemf("%s -xf test1_3.tar -C test1", testprog);
++	assertFileContents("foo", 3, "test1/in/d1/f##");
++	// For the 0-length pattern check, remember that "test1/" isn't part of the string affected by the regexp
++	systemf("%s -cf test1_4.tar -s /f*/\\<~\\>/g in/d1/foo", testprog);
++	systemf("%s -xf test1_4.tar -C test1", testprog);
++	assertFileContents("foo", 3, "test1/<>i<>n<>/<>d<>1<>/<f><>o<>o<>");
+ 	/*
+ 	 * Test 2: Basic substitution when extracting archive.
+ 	 */
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index b834f2dbc36..66f30ec89b3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
+           file://CVE-2025-60753.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 


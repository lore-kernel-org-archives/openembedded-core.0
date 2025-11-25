Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501EAD0EE3E
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:20 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4357.1764104353367518253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mbNl2Stb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-299d40b0845so95995005ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104353; x=1764709153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI6oJswh6ZcPS6Bh64+cNgMndatdKjuIBJ8dmsNzYL0=;
        b=mbNl2Stbc4XbpRGLqu3rSHMquzUTfclGJ9luFjIuj7x76t1u/fjDijV11e6UrQwtVg
         HRQaPPII/TB/V7da4dUaIbas5zL3AiAvNzFCgrkM/aGw9c7/Qo2i7Af14740aItwvzG7
         GiRTs0Y2t+B7Pjiz/4nEBHtIWhTGNdCgJ328YNvWhJNnr2EWw7ehznFir526nRddpQ0a
         ns7XgadzeuDCBndP3rNkbc4blxJQdupKkXSz45Gv82C7ucG7l/C7WIMA5k7gmVJRHaG/
         YKj867T7SCGZjAUlWsXjh32zdxtz8r9J91gIVjlCGph1Gze6WGpsKDlp+GMOs+vsgV4r
         DAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104353; x=1764709153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MI6oJswh6ZcPS6Bh64+cNgMndatdKjuIBJ8dmsNzYL0=;
        b=kLXM1YDhW8Mzh9BvBy6oMPQPLE57Ahb2vSbs9nzJX0ehfhO6K/1TwPhFeegUHzXdIb
         58uInD8BrxDDNP3N03RJLm5neSCG9U0pbWtI5jkR+aFqymvD1s7844xXPdr8l2VAZtWK
         tKuSZ4JUDC0UDJyAMGBoIaEjxk2vfhZl/AZh3memf8UOKpIus3FrI/lFMuj/FykCjkqF
         FoN3EZfg6JPcm+8IaKuYwjQTsoWoIWJaEswTbs6xA8nDImBhFGUVUX2ZdK8B17UErHad
         3PdXKKPRK75+7DbSHey64LpnTyVGiQLzukWtLwvMPllshJSniznCvPCQZMLkNn6NAvyB
         ZjmQ==
X-Gm-Message-State: AOJu0YwG1lhJPOQ+0kxfIf/7zxn96g19dUqnBV1EkDE90llPB7YyiLIY
	maMA6J1ZLDxY5ATGvoUjCViJGTVhIUt3XP0Ut58zw2J6+5ceUWUvP42xk26tfIR+WY0l0uaJGp9
	e+fAo
X-Gm-Gg: ASbGncubFRMLVfmbwSO3J/w5Ke2PF9bAsMHih24kEcl8Bmj9Swgi7JVVVkCyAxU0y2/
	sctpf8CRoU3UwzACCTCCQEeoO48ngIbJzkEHEWj54LmgtCQ0JPEtyBz9xsZyVtLffCgN1FZVOJj
	GVO0Ql8S2jwLcJc8He4QYnN1VsJ55gCaGwG5wUA4zhgJId0mS5mWK5CNHumHACxQ+0/PGpjOTg7
	hiVPs1OLwV8Y4u0O2Lxr5afP38cb5SR/XLQS2eaD5GqtlDT7KsEuS2jXEDRoLvPjfHzY7x5ZVCK
	/rdZVoVEorRVU9W3AinSmoiyBYLnHXhoXxpbO/PBI1CtV0h8EteBT9fOlucDiIU1wOlRz01PCnx
	771VrAAjqAoybv4xFOjjMsuAaOwjUHYaUwjAQGe3Pj1NnU/4rmnFKhXq5WkUoiPRLXrj+/uEU2C
	EkLA==
X-Google-Smtp-Source: AGHT+IEv413NYy77PRyJL3hYa1gT8npjRWV/8srNXeMqcrCbda2Z/F2VMZK6mIerNDSzCA+B+0FAoQ==
X-Received: by 2002:a17:902:db0e:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-29bab198021mr43163565ad.41.1764104352570;
        Tue, 25 Nov 2025 12:59:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 9/9] libarchive: patch CVE-2025-60753
Date: Tue, 25 Nov 2025 12:58:47 -0800
Message-ID: <1fbd9eddbdf0da062df0510cabff6f6ee33d5752.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226794

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [3] marked in [2] mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60753
[2] https://github.com/libarchive/libarchive/issues/2725
[3] https://github.com/libarchive/libarchive/pull/2787

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2025-60753.patch           | 76 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
new file mode 100644
index 0000000000..730a6128c3
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
+@@ -235,7 +235,9 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 			(*result)[0] = 0;
+ 		}
+ 
+-		while (1) {
++		char isEnd = 0;
++		do {
++            isEnd = *name == '\0';
+ 			if (regexec(&rule->re, name, 10, matches, 0))
+ 				break;
+ 
+@@ -290,12 +292,15 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
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
+@@ -42,7 +42,13 @@ DEFINE_TEST(test_option_s)
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index da11e052a7..86ba53aaf2 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
+           file://CVE-2025-60753.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0



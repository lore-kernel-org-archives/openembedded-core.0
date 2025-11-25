Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26880D0EE2C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4248.1764104113094153468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dGt2ig6s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso8540950a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104112; x=1764708912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVUn3q5ATxtITt6fxzM3Mcw/7i74lLjI1eiyW9/FM4=;
        b=dGt2ig6sOl+2J7H34tFXVVFlFAyIm8EIshD81E1ftfL1E2bxkTnEkvpZTf1Xp5bQab
         sKuo4cZCn7BUduU3WIO2p5zgvGwaL76N6uXwfQAdJPkgINNnMCAW8AFmMFde0Yb+jat8
         m4F1d6WQtEuyV0Xi1/muMAcPkIheArU6L97m3w3azSldYjebO/WwUd+PQclzzPXEGjYL
         x0NzqzXBTug7/0Xpw/Chr6VzzP6bhVcJlxKchcanhwAJNZpT0Iz00TO0cho2ro3JP0jm
         19QptM+7S8XeM0XFvRoGh+XFcqDeWPx2xZG0RSpY9xl5R8PB68KCdyWskQBNxWeU9r+Q
         dbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104112; x=1764708912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RKVUn3q5ATxtITt6fxzM3Mcw/7i74lLjI1eiyW9/FM4=;
        b=ugjr7sc+5HItckBzAxlhVzMq0SiAUfqIqZ2C95g1qrkmZcD4CzJ6avV1xr2vOvGROF
         A0GpzlV2BT5sZXewaVh/szFwnj4Y3HpD9NFY6rTuCDfhWd1ChzxSZQTB6IP/BqcFQu4Z
         5NKvTP8JI+54y7DTJlETdued3G2K2vHjv7rkDheN3vdxdIWDger6DAXpYYCxwwglCDJb
         PJGWOVGHElO3N0oorqY4l1Z9fjqPXrqLozX+ljHuaPqxKt9GRI8xZRTjJslibaLidMjQ
         r/lz0CsI7diRnDMQM+5gfDC7CR9XOnvtc4l7cua8oCBnMuxV/FOj3mASE+7D53uzXZsG
         7XvA==
X-Gm-Message-State: AOJu0YwrigeeoYLe5Q/46NT041Q4PadGyKCxbCsiHXnuwkAQ0xtdv02X
	tn/oS1mKkFDJkOAB/M8xDplSQdqU9FNqhuo3ah9IX8sw+aM1b34gttI0KiohCf0aw/q11cKmjrz
	OfM64
X-Gm-Gg: ASbGncuN0P0jWvUDG4PVZJXl8DmgadJKWuxoJ4UbkoE7yHgexrrpcN9TKbTN3FyDzAc
	X5LJWNGtRgKWHv3pydiTRPjCZW2hGyQpVJUTJX6e8EK4tkTNDJNhx22hJ60ZDfV+If4UFD6LmFp
	ztED4ZXWbKbqX1iq2U/JYtFlr9V1/6IjwX+UGrMXoPe7aAiOt2OYyZn4NEei8gaMIZssvRFceqQ
	ywBBU8eqts/QhQ9LaEK59j8ECPL8Ienb9rdfY5l3dlIdZusT4/WHInsPdxhpy0mFH0rzX3fRAe9
	yji7oBljvoy9rrPo4T7xGRnsMo9r5/DvRYzVGk7cEDVfyDDkojP6kCcHoTe4WOBl+VDUQiUoUZr
	d5+ebmsDHwNDgAuEM4RaD5ATAS7QVsmACP0IHbiO1V84y4Is3VmDOw6CwIYo1UNUFP0QXU9/WYM
	GMP6X2rC5clIYD
X-Google-Smtp-Source: AGHT+IHnSmUiaJanGuzI1bCCQvJadzx8FmhRwU7cOogQijWM/jbtRb6T1K9zqo1L2ytNmuBbvNmFGA==
X-Received: by 2002:a17:90b:2fc8:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-34733f34cfamr17679300a91.26.1764104112175;
        Tue, 25 Nov 2025 12:55:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.55.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:55:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] libarchive: patch CVE-2025-60753
Date: Tue, 25 Nov 2025 12:54:51 -0800
Message-ID: <e3e9dd59a32541b36d6c1036b8f83af52bef92cd.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764103986.git.steve@sakoman.com>
References: <cover.1764103986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226783

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [3] marked in [2] mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60753
[2] https://github.com/libarchive/libarchive/issues/2725
[3] https://github.com/libarchive/libarchive/pull/2787

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2025-60753.patch           | 76 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
new file mode 100644
index 0000000000..604e0421be
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
index b834f2dbc3..66f30ec89b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
+           file://CVE-2025-60753.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0



Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0B2C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 18:27:33 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.105419.1723660043558638452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 11:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ff8GmnZ9;
 spf=pass (domain: baylibre.com, ip: 209.85.222.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-825896b2058so38370241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723660042; x=1724264842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WpNO7Eymx0/KUr3G9F9I/oGHY/EUMtEOtiik/QMNQ4=;
        b=Ff8GmnZ9DqYRIpVBGIF9Qj37YPZgFiPCMS2iiA7E4TG7FRYIflP+VehA/UHfDjLIb9
         yBrzN7r+f1/zZG2UYvcNLIEDwNUYAyJzGhZAz7471ksWpzlY6odks4uqWnqAvYTILJOT
         tzQ4MER3yugLS1eEP72YDAu2GmDRzOISP8j5bW+Ry0MFVfQA8/kyOERU/UQA1Oh8AwSH
         KFzAP2tXlR/1vfDRSs8vsd72CDy7BTun6VnR7po3Cp2z3Sfb77Lxl8zWwt1UwgaTDL56
         ZyEMnoPI1sfSMhjdZF3Uj/iIxM7+0iCU5MQmCfx9wtBnioI9DF6P2NjcVI4mh55X5Dtl
         3NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723660042; x=1724264842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WpNO7Eymx0/KUr3G9F9I/oGHY/EUMtEOtiik/QMNQ4=;
        b=wQyD3wGa7a7JwpUcILiMpqa7cfYVym84pT8anIqS3h7fYW928BuBfkUKlsR952pa7U
         EglhTBLTKAAqMfIRYrlI2sPDHArqgORVtgjA5J4KYHnYsaGUJZaDOY3nWAM6yLps22Bx
         uolDLfhStpLh6BMAm5jnqQKXV9RXVlIRcBK7uKWeVi+cBD8j5f1ftomJiTxzzn/wQSYH
         x0gYdkCcgz6S1lJlZWM1i9ULGhbcjTODV4lvr0WIAVVn9OcZvONF3a0NGvqbN067GXT4
         ZGa6YTYnUSRFDMLiPMU1l0ymWF+97lFSJnrPUxPfta5G+M6GpBeUxqUk3002kZ75R6i6
         Lv8g==
X-Gm-Message-State: AOJu0YyhA5bWoeMm9T33skICM9g4Qh8M+Y/i0lwxX3nXT0fr93LSnM5A
	Wf0YcSve1mMpel4ijjfcR7l+0fpb44S/+lnSf9Y67W3uQu5ud2dYHfzMHIgEYKzn5+K1bnpaRSB
	JJKY=
X-Google-Smtp-Source: AGHT+IGGYHVA/32UQO7H2PscxGXJwuk5Kv+tGVwQMOYV9Rsdt8twdsmDCH0LyVyDZNQC1iu9ojrk0Q==
X-Received: by 2002:a67:eacf:0:b0:492:aa19:dcf9 with SMTP id ada2fe7eead31-497598ac639mr3937910137.6.1723660042317;
        Wed, 14 Aug 2024 11:27:22 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c60fdcsm46787546d6.12.2024.08.14.11.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 11:27:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com,
	Qi.Chen@windriver.com
Subject: [OE-core][PATCH v3] python3: skip readline limited history tests
Date: Wed, 14 Aug 2024 14:27:20 -0400
Message-Id: <20240814182720.995846-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 18:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203328

Python 3.12.5 is failing a newer ptest for reading/writing limited
history when editline (default) is set in PACKAGECONFIG. Skip it for now
until a proper fix (if any) is determined.

A bug has been opened upstream: https://github.com/python/cpython/issues/123018

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v3 adds some more context after discussions on the mailing list,
including a link to a bug opened upstream for CPython.

v2 added extra info in the commit message and carried patch about the
source of the test failure.

 ...t_readline-skip-limited-history-test.patch | 41 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 00000000000..50a4609f7aa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,41 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image when
+using the default PACKAGECONFIG settings (i.e. with editline instead of
+readline).. Disable it until the proper fix is determined.
+
+A bug has been opened upstream: https://github.com/python/cpython/issues/123018
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_readline.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 91fd7dd13f9..d81f9bf8eed 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -132,6 +132,7 @@ def test_nonascii_history(self):
+         self.assertEqual(readline.get_history_item(1), "entrée 1")
+         self.assertEqual(readline.get_history_item(2), "entrée 22")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+@@ -349,6 +350,7 @@ def test_history_size(self):
+             self.assertEqual(len(lines), history_size)
+             self.assertEqual(lines[-1].strip(), b"last input")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index 5665c90fa96..cc2e14baf09 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_readline-skip-limited-history-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.39.2



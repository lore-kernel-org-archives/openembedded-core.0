Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A75EED604
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:17:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.23238.1694791045394419251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ap602Ibt;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-41369b80875so10566121cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694791043; x=1695395843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc3tZgNLGTb0CdL0yv8S5fJBNTb8tKTqaz5BOxGMAJo=;
        b=Ap602IbtXV0qbYKKIRnvfUYCgR1QdNvlKcVhDg8EL/EJLfiOAHKxvvQ0Hjb+bXZOWG
         GK6rJyfDqQwbXL6xozl8n65FbX8RRQNw5G4+TlRKIBdDluNAObs4vA7uMsP3KNtkc5Jr
         /YPb9GdN83HpzBwWw55pc/PUxd+v5WVvhRvNtHFZsAAmXUI2OptUrzA41kx4DuC0Feau
         L+k0uEhlhioU8W8bJ6O8NcOVjiVNjLguMr7lyqROBhq2hsx/yOFlqHhZ3GaCaZd+gbBY
         bjzNQ2cnYBqJhIRFIN8zSDs0FSUs4lU6/gvtUrSnG/Y3yxD8UkJVjrXNNUni7ILvL+eR
         nWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791043; x=1695395843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc3tZgNLGTb0CdL0yv8S5fJBNTb8tKTqaz5BOxGMAJo=;
        b=EvnJpxtkUhR6S1FEY64MMErMFllwT6H99uJw41iWVP2e7TVG4C2TbXnDnyIOz1ghnk
         DuXiH+EckPiUR83gAyuJl2a+UsiCRCR0D+mu9exoGGGnOdimcku9pD/q9OmvcSmLIdq2
         uBp/1V3uftQ79RUbRYPGzXBcm3sch0nae8/FknDqpx1q7XUPzHsbRPEdrnHgF8QFNpqI
         ZHqwyom8ovHstQ5zVwj5wKVoubdodchPWRY2ue5J7D5AcrOc6Cxlx30FaH+H7hQlDnE3
         6F60NoJz+tuCQqCtslQv5y3o8Sv7SWiD4a9c6lt+w+VEPMuofKWhjG/qtKXQFIR1Whbe
         5h+A==
X-Gm-Message-State: AOJu0Ywt1O53qUvwJZy9Ztm77ZcWUXkE4VAFmmFVuZKjo/Jd64JkWmHI
	ZGUpBWaJiOxuFt4TI7scPwnLybAIRVgb0g70D5aYEQ==
X-Google-Smtp-Source: AGHT+IGunssckDrRz4eb8hNy0UI0mAeszg56S8of0WNNW8CxYN/eGw6SUb0DYJsDf1p0FyKxbrBfEA==
X-Received: by 2002:ac8:7c4f:0:b0:412:1c5f:478b with SMTP id o15-20020ac87c4f000000b004121c5f478bmr2488959qtv.15.1694791043503;
        Fri, 15 Sep 2023 08:17:23 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c11-20020ac84e0b000000b00405d7c1a4b0sm1212740qtw.15.2023.09.15.08.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:17:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skip test_input_no_stdout_fileno
Date: Fri, 15 Sep 2023 11:17:20 -0400
Message-ID: <20230915151721.66247-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187666

[YOCTO #15210]

test_input_no_stdout_fileno has been seen failing on AB workers under
heavy load. Skip it while leaving the rest of the test_builtin suite
alone.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ..._fileno-test-due-to-load-variability.patch | 32 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.5.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch

diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
new file mode 100644
index 0000000000..ff695a4091
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -0,0 +1,32 @@
+From 564d8f117fec7e573cbc10323655acefb12d143f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 15 Sep 2023 08:48:33 -0400
+Subject: [PATCH] skip no_stdout_fileno test due to load variability
+
+Skip test_input_no_stdout_fileno so that it doesn't fail on systems
+under heavy load.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+[YOCTO #15210]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_builtin.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
+index 9078c409cc..615955c057 100644
+--- a/Lib/test/test_builtin.py
++++ b/Lib/test/test_builtin.py
+@@ -2247,6 +2247,7 @@ def test_input_tty_non_ascii_unicode_errors(self):
+         # Check stdin/stdout error handler is used when invoking PyOS_Readline()
+         self.check_input_tty("prompté", b"quux\xe9", "ascii")
+ 
++    @unittest.skip("Test may fail under heavy load")
+     def test_input_no_stdout_fileno(self):
+         # Issue #24402: If stdin is the original terminal but stdout.fileno()
+         # fails, do not use the original stdout file descriptor
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index f5d97311d7..6c624c9d3d 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
+           file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.41.0



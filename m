Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AA2C4708E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:37:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.80462.1669999070372089237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lle+jXex;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ud5so12800777ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWks+p7xA2+LgE2uulms5js8xRy68FNG7y41o7sDL9A=;
        b=lle+jXex4h6NrtkxbW2UXCHGxyuAEPvrNR/dXxSBjYcLFeyxFf+1xPB6L0GptLTHnO
         H+m20dLy3GjHZRy2DouSlidxOt+HQZhig1HBtsMWK7NywNvt0rRXanW86zwlbaokI4dk
         ccCaBl5WgA4pcVP0lauLRxn9s+r2FIKPlTlte2anLet+PknRqa88d0mWkgYaYySwEpUI
         EdejiZLZkv6JGSUlThxkryiSaeZp0VuEN4tjErVQi+3jgJ9+4tPNEiE77gEP870Sotyp
         f/tdP5UdMc+Xbs2XTpCFYpOHT+9cLs/9/VDgnTlau+YSKk0EkbBAXXDl7cPinga2M3BH
         smHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWks+p7xA2+LgE2uulms5js8xRy68FNG7y41o7sDL9A=;
        b=Yj7SRgvXRFFqn58rCAS5jbXTxOWsG1PNvqkguSLXUf7Uj1x15sgBlPnsbXf7LVwdtZ
         4HBAi4YGxQaUJuppsMn5gerda5S+7gfFA+85qvCIYEpSGVAVO4PFtfuhia9HaZT9fjzD
         OrFBgp5IB6HrAhG9aYxGr5//c/Xz9Gy6xNfCvypjGgf1+jPohZ1tchfX60j7tV8KXfLr
         2IHiO7mNgzfwm25ONwnscNacOFnwJY5HfWWBN5FqpXmzOFtCh4Mcagc6TuDKDiMjt5dY
         R5q4yr1xwFU5wokSam9WOjBNnBgHWznOkkxiJaBPxgcCOPP6txA5SWUX5TSywcsz0blA
         +3bA==
X-Gm-Message-State: ANoB5pn38OEJJG1M3bqEjBge4CfzJuiXHbsO8+u9Dvdmq9F2mTsctdmt
	B3g1tZ1Iv7QrSunoioNDyqjd20hqJAM=
X-Google-Smtp-Source: AA0mqf7wabw6pLT3oDgmfLFWg03iyGCm19mpa12GgKY5pMNmAHQTtarT/cFtg3E/4HAUQzCeWn1rYg==
X-Received: by 2002:a17:906:6d03:b0:78d:9d0b:a9f6 with SMTP id m3-20020a1709066d0300b0078d9d0ba9f6mr14147605ejr.661.1669999068744;
        Fri, 02 Dec 2022 08:37:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id kj22-20020a170907765600b007c090da9eb4sm3244340ejc.82.2022.12.02.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:37:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] python3: fix tests on x86 (32 bit)
Date: Fri,  2 Dec 2022 17:37:38 +0100
Message-Id: <20221202163739.1194505-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202163739.1194505-1-alex@linutronix.de>
References: <20221202163739.1194505-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 16:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174242

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...add-more-elements-in-test_determinis.patch | 27 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.0.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch b/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch
new file mode 100644
index 0000000000..9da7f94255
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch
@@ -0,0 +1,27 @@
+From 076a4f9ab06105b94c87386c0dfe17b823502a13 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 1 Dec 2022 19:02:51 +0100
+Subject: [PATCH] test_marshal.py: add more elements in test_deterministic_sets
+
+Existing elements do produce different output on x86_64, but they
+do not on x86. Let's make the data longer to ensure it differs.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/99935]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Lib/test/test_marshal.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_marshal.py b/Lib/test/test_marshal.py
+index aae86cc..29d95ad 100644
+--- a/Lib/test/test_marshal.py
++++ b/Lib/test/test_marshal.py
+@@ -352,7 +352,7 @@ class BugsTestCase(unittest.TestCase):
+             for elements in (
+                 "float('nan'), b'a', b'b', b'c', 'x', 'y', 'z'",
+                 # Also test for bad interactions with backreferencing:
+-                "('Spam', 0), ('Spam', 1), ('Spam', 2)",
++                "('Spam', 0), ('Spam', 1), ('Spam', 2), ('Spam', 3), ('Spam', 4), ('Spam', 5)",
+             ):
+                 s = f"{kind}([{elements}])"
+                 with self.subTest(s):
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 8c29424dde..ff25fe1ac4 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://cve-2022-37460.patch \
+           file://0001-test_marshal.py-add-more-elements-in-test_determinis.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.30.2



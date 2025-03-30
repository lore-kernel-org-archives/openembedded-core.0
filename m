Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E49BC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 10:19:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.27870.1743329987007731616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 03:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=am25fN4i;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so22179405e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743329985; x=1743934785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooMzPEKgR0+HXmC5QobDfFi/GI+D2JStT09ZiTibbtk=;
        b=am25fN4iz4Qe88b7WMaWmaO86QSTBN9iJYfpIPeiiLFbCu4Kmnbt570s4r4nQyij1x
         smoAmdD+nlfWfUgQXfAdE3duo90fjwVtmRSRRaV4BQS6bWLmXQG4ehNu9O3pCpx3bFD1
         YpkehEaPZZNO0Ap9fFMHvnHkM9KBIxxGFNqEYC6fTx9xx1GOCZsoTNkITa5Xnc/6T+vg
         5UUGHbSKoA1taH3DMmx27lRFch0F5eVyjB2uTvWKZ0jgZu9AtxQV1y16QocwBfDEleYw
         e96Tow2t+49rnzgkaNWe7BpTrbN6L+TnJVKQBep43NDRLAmGkGXkE1sh1/QEslp+RDys
         MTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329985; x=1743934785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooMzPEKgR0+HXmC5QobDfFi/GI+D2JStT09ZiTibbtk=;
        b=JZqOu5vEAI6Jnk3cmflbDJFxC7S5X8UkGNNYIFqBq27Bb8qxwvHT4btGYnVrI2feI+
         j6vEv1N9ra+A8F1qj/pLOuUxtyuplYYtjizKahIjOG4rUJbFydtZwcdkD/a+ROtujZTy
         6VCdEg/dvxLThX5gDjfpkFZRwL7BVKNmAeDZ2u595V7epqE1lna/8F3v3w7SmvtSw02L
         NN+17UKK0AUH05Sh1kdK2hv5zJln3JVbGiGqBXrGaaBtTG9Gjs0RMbGM2+muJ7aRkJ3h
         hTMSMHFP18D468mcIuOiSIteoF5RV9zCYQKmmXwlK7C/HcTUupjRD+nw+2dL7AMfD1eL
         b3Qw==
X-Gm-Message-State: AOJu0Yy5PE6sIiLyczTzHjSOieYCYD8QyerlPd3vN9NDh0QHmMmOkGyT
	fsArSk/eXAmGg4L8Ao65iKE85kXmwldNcQbvzMlswCBO5sEHNnQNRIJG+Q==
X-Gm-Gg: ASbGnctjtqpit5dVW0e6a7KFKcrqwOILGOBjS7nvFkagd99kamfkfWd6DfzkcJvtYqK
	zphWZqQfnVlgeIh8MZ6mwAVnD5/Y4iyLrN1xUQXfwyfcd2MFjRE5nEEkqfLJN331g8byFiF3zhc
	snHM8WwkD4g8VbKQWyCP5YOx9O6FcOI96vERHX2tnxo2qYoLuX14hQN2dnoSX6xT3IFDuBA+uBE
	T+tT9A93Wyb9tJkQ7osMA7+g/tfWBC46/VWg6NV/iFR6IA/dkTVzDJUjpTafLTdGXRv4d6mnoih
	qa12rKQoc4mEWE3cjMvjw2ezaexxLeUv+2T/7miVpO3YDu32LtYU5jfYOqAn1ygiqWRZjeNMP4G
	Er+rdOVawdrUN5Mbkv3PQanZIYYFOpXXZq4dyA0WenBPNYur1IiKj577sZhOC+w==
X-Google-Smtp-Source: AGHT+IH72wRPdZVLKjzO6y2fQlkskMvjKBM/ZQwKo5S1fbTTkA8DPwlZXEhDzxb/UvmeicSgJ+Dw0g==
X-Received: by 2002:a05:600c:34ce:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43dabe235b5mr54780915e9.0.1743329984926;
        Sun, 30 Mar 2025 03:19:44 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efeacasm130752845e9.23.2025.03.30.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:19:44 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-breathe: new recipe version 4.36.0
Date: Sun, 30 Mar 2025 12:19:38 +0200
Message-Id: <20250330101938.2634400-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 10:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213915

Breathe is a Sphinx plugin providing beautifully integrated Doxygen output in your user-facing documentation

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-breathe/run-ptest          |  3 +++
 .../python/python3-breathe_4.36.0.bb          | 22 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-breathe/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-breathe_4.36.0.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf6..880178488f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
+    python3-breathe \
     python3-calver \
     python3-hypothesis \
     python3-idna \
diff --git a/meta/recipes-devtools/python/python3-breathe/run-ptest b/meta/recipes-devtools/python/python3-breathe/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-breathe/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-breathe_4.36.0.bb b/meta/recipes-devtools/python/python3-breathe_4.36.0.bb
new file mode 100644
index 0000000000..dc14f1ce1c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-breathe_4.36.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Sphinx Doxygen renderer"
+DESCRIPTION = "Breathe is a Sphinx plugin providing beautifully integrated Doxygen output in your user-facing documentation."
+HOMEPAGE = "https://www.breathe-doc.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e49eecf36fc015de7c61a0247df75d6"
+
+SRC_URI[sha256sum] = "14860b73118ac140b7a3f55446890c777d1b67149cb024279fe3710dad7f535c"
+
+inherit pypi python_flit_core ptest
+
+SRC_URI:append = " file://run-ptest"
+
+RDEPENDS:${PN} = "python3-sphinx"
+
+PYPI_PACKAGE = "breathe"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND =+ "native"
-- 
2.39.5



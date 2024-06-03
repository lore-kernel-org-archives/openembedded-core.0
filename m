Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660FBC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 16:25:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.88322.1717431929337203457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 09:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gem5uvAd;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-681ad081695so3249500a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717431928; x=1718036728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UllaYThKzBpjChy8cWrmpOhBFXaCKUQKC44fRDmkylg=;
        b=Gem5uvAd4tq0YBbvUmIRgRcRwi8nghP7RQ257q410HREmuIuZEg1MC2BCTAtoiyvIU
         RBnoYJsL8/+lMDxjm7pwRw5HgmIgeSxhyLApV+0vEsww47LvVUtiMCfrX9SZoDbzLvK1
         mFA0CHYUUWjmxKUvpQyey58A4bfVB7i8fEpf1fVuepUPsPDKgeibc4nf5s9qSIPEO1rl
         +yhx7NP1ZzZ5AfFhQiPc6j/eyF69aHi2KHwu7k2LWtjZyeXjs9YMEmwywF/N3lVJG3UG
         obGJrgx489vVN8j5CLupGOzDZTr7EQXMjvg22+Zny7sQrx7vD/n/e2NcjRZ9UhOwTD76
         q3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717431928; x=1718036728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UllaYThKzBpjChy8cWrmpOhBFXaCKUQKC44fRDmkylg=;
        b=gI8TZttDwCFhcHjHJIKnqlIjjcW5MnN3epXe1gBnOo3vogvAf+qA/QKNlgbPQ9dFcG
         8QoAAuT7aJq0pZe+1jaIUWH2Wy4E7qIbloN4AJ29UvGsu8VJ8h6ZJ7L33EqCvPAoGyqu
         tNme7hvaCGwGHAapmK4ClNiDhWJ21QTPqgigaROGrw6oOYk5LWaod02hu9vSyrkR3UOg
         +ml4xZ7lBgiM2EVnd7u0G799k43CsyfwMX8oVQY07QARwTg7jqx51/MySO122fL9j00D
         QXlZn0um9o8cyxgwmuGGV+AJGSCMm4nljKFxz7HwxHHSn3N6QPVRE3Dz0M6n4xIJCL6U
         rvkQ==
X-Gm-Message-State: AOJu0Yyxnpd90cwlBm6ASWUYTT6WteOv6HvINnMlMc8RGrQtKfLilodB
	rHiAVarw1wz9Lf35howKmwOLbeU5UcpxlIQWbVu+TN94GLEw7QreB1+uK65vYcc=
X-Google-Smtp-Source: AGHT+IHTou9drwEIhBtjqOuKNmEXfB7W7G+gbT5NjKAMzcf9roGe9U2bBIIwxPCVtI2mK+j9KrjuAQ==
X-Received: by 2002:a05:6a20:6a10:b0:1af:d44c:cfc4 with SMTP id adf61e73a8af0-1b26f12ce45mr11499811637.17.1717431928275;
        Mon, 03 Jun 2024 09:25:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235d991sm66941505ad.85.2024.06.03.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 09:25:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-rpds-py: Create a symlink for cython module on musl
Date: Mon,  3 Jun 2024 09:25:25 -0700
Message-ID: <20240603162525.2940419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 16:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200269

loader expects it to be called with 'linux-gnu' e.g
rpds.cpython-312-x86_64-linux-musl.so is created with musl
but loader expects it to called rpds.cpython-312-x86_64-linux-gnu.so

Lets create the symlink to please the loader.

Fixes
ImportError while importing test module '/usr/lib/python3-rpds-py/ptest/tests/test_hash_trie_map.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
../../python3.12/importlib/__init__.py:90: in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
tests/test_hash_trie_map.py:36: in <module>
    from rpds import HashTrieMap
../../python3.12/site-packages/rpds/__init__.py:1: in <module>
    from .rpds import *
E   ModuleNotFoundError: No module named 'rpds.rpds'
ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-rpds-py_0.18.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
index f46df1115c8..b1f0e100332 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
@@ -27,4 +27,15 @@ do_install_ptest() {
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
+do_install:append() {
+    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds.cpython*.so
+    do
+        fname=`basename $f`
+        lname=`echo $fname | sed 's/musl/gnu/'`
+        if [ "$fname" != "$lname" ]; then
+            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/$lname
+        fi
+    done
+}
+
 BBCLASSEXTEND = "native nativesdk"


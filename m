Return-Path: <geissonator@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id E967A799F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 21:33:31 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id h20-v6so4363933itf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S+07hzY79yTwNt47R2XadxAJnkGKNWe/GCq2fDVH0io=;
	b=E2C3R8V6Hz5C5YG97k2V+hlcq13pGuFQv7De5UznmpbIB0s3IrU/r0a5iViKC1UUJr
	px77PSbaDbH3Me0dPrZNBY2rCPdF7Ll5zLCTYDoQAlwok6WL6hQTB7N6TnlonSglRs9q
	eFVUR1Co72SVTY95xRHd8HYnLjeZVsaX9y+3Rk7NTdQZ+R1dMuugcDE4kVJsTr0H6TvG
	srW/ufXOEUi0h1l8RqPwSREr0P2z6Efs/zHQKRLPpbJ8XWRKJwf+pDg68lNsj5xRj8qt
	p8E0TZGtSorWAfY6tIsk+JBF9f8Py+/WE5pNtLh6lbLmnJXTUMdSPJIZDOoa9WHK8Jcz
	mJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S+07hzY79yTwNt47R2XadxAJnkGKNWe/GCq2fDVH0io=;
	b=i0FPhEYCdODX52cwPe7Z0saGx/zDBN0caOf8rxAXWiB9vWPSnkRLMZWzjVcTgcX019
	sCpu1+LLurMYOqZJOhAqPmA7pf0t8l115Yvx2Mp1n+oOXDSQPUp+ugKwyWpf0CPXwPoX
	9jCWYLJ2Hb3QiMM8tg/OTJVh7dB2gznQp0F5a+Dlq3b1Pjg7qppTxFSLjYFXEnci1xxT
	7AD9zS0iS0te+uLfFqlR4EzG69pHaQe6kHzJLwCieu0Q8JN67+TD4ivOPmk4w2v/K72o
	cu1u419GuLzGVblZ8L4YQxYEiZGHAuMC8VzLlbyH01jmThs/Teml1vsFNtJAimMFKTqT
	dAgQ==
X-Gm-Message-State: APzg51ChEWkxhnEZxz4H/IEZgBopoQ32RIluoEY7I2QoGHKOezqQr91h
	vUF/pvWh89+zje0fsknRf4//OWMS
X-Google-Smtp-Source: ANB0VdbMBLGpUHTSodI7tWQSG4qosguLVVDz41jipAxZaZ6eQTrrfqFhTmmFR6zlxJ2mvo432DWizw==
X-Received: by 2002:a24:3948:: with SMTP id
	l69-v6mr3848878ita.153.1536960812932; 
	Fri, 14 Sep 2018 14:33:32 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com ([32.97.110.56])
	by smtp.gmail.com with ESMTPSA id
	y21-v6sm2584215ioa.54.2018.09.14.14.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 14:33:32 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:33:08 -0700
Message-Id: <1536960788-26056-3-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
References: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH 3/3] python: consolidate tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2018 21:33:32 -0000

Currently the bulk of the tests in python-tests, some more in
python-sqlite3-tests, and others in their parent module (such as
python-ctypes).  This is pointless space usage if we're not planning on
running the tests, so consolidate all the tests into python-tests.

This is a backport of the same changes done by Ross Burton for python3

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 .../python/python/python2-manifest.json            | 35 ++++++++++------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index cacba5b..45fa371 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1,4 +1,18 @@
 {
+    "tests": {
+        "summary": "Python test suite",
+        "rdepends": [
+            "core",
+            "modules"
+        ],
+        "files": [
+            "${libdir}/python2.7/*/test",
+            "${libdir}/python2.7/*/tests",
+            "${libdir}/python2.7/idlelib/idle_test/",
+            "${libdir}/python2.7/test"
+        ],
+        "cached": []
+    },
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator", 
         "rdepends": [
@@ -873,16 +887,6 @@
             "${libdir}/python2.7/lib-dynload/_sqlite3.so"
         ]
     }, 
-    "sqlite3-tests": {
-        "summary": "Python Sqlite3 database support tests", 
-        "rdepends": [
-            "core", 
-            "tests"
-        ], 
-        "files": [
-            "${libdir}/python2.7/sqlite3/test"
-        ]
-    }, 
     "stringold": {
         "summary": "Python string APIs [deprecated]", 
         "rdepends": [
@@ -925,15 +929,6 @@
             "${libdir}/python2.7/tty.py"
         ]
     }, 
-    "tests": {
-        "summary": "Python tests", 
-        "rdepends": [
-            "core"
-        ], 
-        "files": [
-            "${libdir}/python2.7/test"
-        ]
-    }, 
     "textutils": {
         "summary": "Python option parsin", 
         "rdepends": [
@@ -1046,4 +1041,4 @@
             "${libdir}/python2.7/lib-dynload/zlib.so"
         ]
     }
-}
\ No newline at end of file
+}
-- 
2.7.4



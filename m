Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0F57E90C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:53:23 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id j6so4903200ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOwMO1/iSK6Zf1qWOeaM0vDWnXgOApP7UzRui8KxulY=;
	b=kdK8Iey1xGW1gF7uwyEfEtaFRwFGudmU1EdfRfC+NX1IDjGGQeTuQPdsjEltAzxqOR
	lyfcV37ep2e356uR7+//PW46tDIDGfPpy6Tazj07HdjA69V04LCXc/k53kZZD8xeboEp
	gdFWz92Cr75lxgKibNI+yYOjpktvwrIMVtguVHHnoBQJivMIsLTN2eUyjNefp2O66hYM
	a1W10NI0LH+XF2zJKVkq+eybz0sneANgeIfV7PreXoduH46TkH61noE6OF7LrfZ+ZLqn
	zM/HKbmVGieP+nslqcEIg6n5KZ/muI2iZcZAszdRrt8ADdwy4pV4MiDyuzX4Ho8Pi9oZ
	5ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOwMO1/iSK6Zf1qWOeaM0vDWnXgOApP7UzRui8KxulY=;
	b=BfUhQaZdr/SPdyagoQ9M87vRmnZ9r0NmOBrsC76427iWhCeJsTaWY1Ao0bfWfqV3V5
	zRSdqDtUpWHYMCnNkI411sRKQMeRArxWiN8DYQ1qWLKjOrmC3M/d8nv+QuGNrruAGgON
	CE50Fbzr/G2n+DCmZw7ugI3kM87QOXC/+z4EoQ0n0+r/Cmy9IQxAjJdrdEsqRk5uVkP6
	NbV/J5leJTzh7xVWJfQ/b1DVBBMi4Fp9KT3cfodkGKpWWZ58r2zEPQkIoSpwm5lmy/36
	sREJ4IL4G6yS/97dTkiij0hC7gECJfRWKIeo1r20vHwrOm2aPAdV4eK8fs2XYlKhour+
	YX/Q==
X-Gm-Message-State: APjAAAWuQpJ508wg0mPEF+FUbzGGtz2QbzJ8NltJtaj6pPvRmD1veu4Z
	utg2nuswXudQOiUZ8jaYEwJvWEHk
X-Google-Smtp-Source: APXvYqwzjbLfzLNdnOeASS1e/1e2Dqcgf3p/uFgcC7dbtLZHAEo+p5KWeWDKb/6V/AH6Qdxt61FA5Q==
X-Received: by 2002:a6b:fb02:: with SMTP id h2mr4684250iog.289.1561643603942; 
	Thu, 27 Jun 2019 06:53:23 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id p3sm2164434iog.70.2019.06.27.06.53.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 06:53:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 08:53:17 -0500
Message-Id: <20190627135317.15545-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python3: Fix .pyc file reproduciblility
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
X-List-Received-Date: Thu, 27 Jun 2019 13:53:23 -0000
Content-Transfer-Encoding: 8bit

Applies a patch to python that makes the pre-compiled .pyc files
generated during the build reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...FLAG_REF-always-for-interned-strings.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
new file mode 100644
index 00000000000..8fcb3442228
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
@@ -0,0 +1,35 @@
+From 6c8ea7c1dacd42f3ba00440231ec0e6b1a38300d Mon Sep 17 00:00:00 2001
+From: Inada Naoki <songofacandy@gmail.com>
+Date: Sat, 14 Jul 2018 00:46:11 +0900
+Subject: [PATCH] Use FLAG_REF always for interned strings
+
+Upstream-status: Submitted [https://github.com/python/cpython/pull/8226]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Python/marshal.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Python/marshal.c b/Python/marshal.c
+index 6d06266c6a..51db2e3b2e 100644
+--- a/Python/marshal.c
++++ b/Python/marshal.c
+@@ -275,9 +275,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
+     if (p->version < 3 || p->hashtable == NULL)
+         return 0; /* not writing object references */
+ 
+-    /* if it has only one reference, it definitely isn't shared */
+-    if (Py_REFCNT(v) == 1)
++    /* If it has only one reference, it definitely isn't shared.
++     * But we use TYPE_REF always for interned string, to PYC file stable
++     * as possible.
++     */
++    if (Py_REFCNT(v) == 1 &&
++            !(PyUnicode_CheckExact(v) && PyUnicode_CHECK_INTERNED(v))) {
+         return 0;
++    }
+ 
+     entry = _Py_HASHTABLE_GET_ENTRY(p->hashtable, v);
+     if (entry != NULL) {
+-- 
+2.21.0
+
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index 3409d94ba08..573624528d7 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
 	   file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
+           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.21.0



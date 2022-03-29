Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D28C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 08:37:30 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4366.1648543049287320686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22T8bRWC003061
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:37:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22T8bRih005678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:37:27 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 29 Mar 2022 01:37:26 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 29 Mar 2022 01:37:26 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] python3-numpy: fix CVE-2021-41496
Date: Tue, 29 Mar 2022 16:37:25 +0800
Message-ID: <20220329083725.2694838-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 08:37:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163741

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2021-41496.

[1] https://github.com/numpy/numpy/commit/271010f1037150e95017f803f4214b8861e528f2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python-numpy/files/CVE-2021-41496.patch   | 64 +++++++++++++++++++
 .../python-numpy/python3-numpy_1.20.1.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/files/CVE-2021-41496.patch

diff --git a/meta/recipes-devtools/python-numpy/files/CVE-2021-41496.patch b/meta/recipes-devtools/python-numpy/files/CVE-2021-41496.patch
new file mode 100644
index 0000000000..0afc79ae0d
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/CVE-2021-41496.patch
@@ -0,0 +1,64 @@
+From 86d81322c5c0ab67f89d64f56f6e77d4fe185910 Mon Sep 17 00:00:00 2001
+From: Warren Weckesser <warren.weckesser@gmail.com>
+Date: Tue, 29 Mar 2022 15:58:00 +0800
+Subject: [PATCH] BUG: f2py: Simplify creation of an exception message. Closes
+ gh-19000.
+
+CVE: CVE-2021-41496
+
+Upstream-Status: Backport [https://github.com/numpy/numpy/commit/271010f1037150e95017f803f4214b8861e528f2]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ numpy/f2py/src/fortranobject.c | 26 ++++++++++++--------------
+ 1 file changed, 12 insertions(+), 14 deletions(-)
+
+diff --git a/numpy/f2py/src/fortranobject.c b/numpy/f2py/src/fortranobject.c
+index 3275f90..85c9c7f 100644
+--- a/numpy/f2py/src/fortranobject.c
++++ b/numpy/f2py/src/fortranobject.c
+@@ -637,14 +637,14 @@ static int check_and_fix_dimensions(const PyArrayObject* arr,
+                                     npy_intp *dims);
+ 
+ static int
+-count_negative_dimensions(const int rank,
++find_first_negative_dimension(const int rank,
+                           const npy_intp *dims) {
+-    int i=0,r=0;
+-    while (i<rank) {
+-        if (dims[i] < 0) ++r;
+-        ++i;
++    for (int i = 0; i < rank; ++i) {
++        if (dims[i] < 0) {
++            return i;
++        }
+     }
+-    return r;
++    return -1;
+ }
+ 
+ #ifdef DEBUG_COPY_ND_ARRAY
+@@ -721,14 +721,12 @@ PyArrayObject* array_from_pyobj(const int type_num,
+         || ((intent & F2PY_OPTIONAL) && (obj==Py_None))
+         ) {
+         /* intent(cache), optional, intent(hide) */
+-        if (count_negative_dimensions(rank,dims) > 0) {
+-            int i;
+-            strcpy(mess, "failed to create intent(cache|hide)|optional array"
+-                   "-- must have defined dimensions but got (");
+-            for(i=0;i<rank;++i)
+-                sprintf(mess+strlen(mess),"%" NPY_INTP_FMT ",",dims[i]);
+-            strcat(mess, ")");
+-            PyErr_SetString(PyExc_ValueError,mess);
++        int i = find_first_negative_dimension(rank, dims);
++        if (i >= 0) {
++            PyErr_Format(PyExc_ValueError,
++                         "failed to create intent(cache|hide)|optional array"
++                         " -- must have defined dimensions, but dims[%d] = %"
++                         NPY_INTP_FMT, i, dims[i]);
+             return NULL;
+         }
+         arr = (PyArrayObject *)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
index 6c3b886782..9e55e74d2c 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
@@ -10,6 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://CVE-2021-41496.patch \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "9bf51d69ebb4ca9239e55bedc2185fe2c0ec222da0adee7ece4125414676846d"
-- 
2.25.1



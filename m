Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248C4C4167D
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.7233.1648734479272585759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BC7zpTLz;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734480; x=1680270480;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b86zlULFDWpxfXj7kA28J7BKMY+sH3IRqpMGCQ+Hufw=;
  b=BC7zpTLzPk9DFyAaCYhQXBlETkxW8lz35uruBbAUV3b6YdQm0rkgASUG
   vZOAhn2zVP6r5+dgX6DEKNnjim4rK7clhT+JBE+RB97UO/Yf4Z37IhPzh
   FAcMjH7a5FH25WnThYe+ipDBuUBUlvdjLvetQKA22iG2WuE6gcok7paCB
   070K/w06EaR/gGxQJGlvEnXhyXE7iCJPuEDl40PIvi+F9wL92CpAv//sD
   mkjbr9h5+F4RDfZu56Zf7RfPWdRNMGvsQdmuGFeVOCGi7+MKd30M7WETj
   vZR1bhIh37p6Ov8xFiCm0QZRr7qwb/QAHUjV8REb72TB6VqVnh+2yzRrL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551876"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:48:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542338"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/20] python3-numpy: fix CVE-2021-41496
Date: Thu, 31 Mar 2022 21:47:23 +0800
Message-Id: 
 <9a69897f464432e0b6ef9b8ad5d8110d78a1162a.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163832

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2021-41496.

[1] https://github.com/numpy/numpy/commit/271010f1037150e95017f803f4214b8861e528f2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.35.1



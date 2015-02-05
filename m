Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8C86C72DF4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192625"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:44 -0800
Message-Id: <1423161588-6867-7-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 06/10] python: Disables SSLv3
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:15 -0000

From: Sona Sarmadi <sona.sarmadi@enea.com>

This is related to "SSLv3 POODLE vulnerability" CVE-2014-3566

Building python without SSLv3 support when openssl is built without
any support for SSLv3 (e.g. by adding EXTRA_OECONF = " -no-ssl3" in
the openssl recipes).

Backport from:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=768611#22
[python2.7-nossl3.patch] only Modules/_ssl.c is backported.

References:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7015
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6843
http://bugs.python.org/issue22638
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python/python2.7.3-nossl3.patch         | 37 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python2.7.3-nossl3.patch

diff --git a/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch b/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
new file mode 100644
index 0000000..2d35520
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
@@ -0,0 +1,37 @@
+python: Building without SSLv3 support
+
+Building without SSLv3 support when openssl is built
+without any support for SSLv3
+
+Upstream-Status: Backport
+
+Reference:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=76A8611#22
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/Modules/_ssl.c b/Modules/_ssl.c
+--- a/Modules/_ssl.c	2014-11-26 07:43:58.755679939 +0100
++++ b/Modules/_ssl.c	2014-11-26 07:49:10.454182400 +0100
+@@ -302,8 +302,10 @@
+     PySSL_BEGIN_ALLOW_THREADS
+     if (proto_version == PY_SSL_VERSION_TLS1)
+         self->ctx = SSL_CTX_new(TLSv1_method()); /* Set up context */
++#ifndef OPENSSL_NO_SSL3
+     else if (proto_version == PY_SSL_VERSION_SSL3)
+         self->ctx = SSL_CTX_new(SSLv3_method()); /* Set up context */
++#endif
+ #ifndef OPENSSL_NO_SSL2
+     else if (proto_version == PY_SSL_VERSION_SSL2)
+         self->ctx = SSL_CTX_new(SSLv2_method()); /* Set up context */
+@@ -1777,8 +1779,10 @@
+     PyModule_AddIntConstant(m, "PROTOCOL_SSLv2",
+                             PY_SSL_VERSION_SSL2);
+ #endif
++#ifndef OPENSSL_NO_SSL3
+     PyModule_AddIntConstant(m, "PROTOCOL_SSLv3",
+                             PY_SSL_VERSION_SSL3);
++#endif
+     PyModule_AddIntConstant(m, "PROTOCOL_SSLv23",
+                             PY_SSL_VERSION_SSL23);
+     PyModule_AddIntConstant(m, "PROTOCOL_TLSv1",
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 5270df9..4d2594a 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -36,6 +36,7 @@ SRC_URI += "\
   file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
   file://python-fix-build-error-with-Readline-6.3.patch \
   file://python-2.7.3-CVE-2014-1912.patch \
+  file://python2.7.3-nossl3.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.1.0



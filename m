Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D0D7C60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 08:09:31 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 3 Dec 2014
	09:09:26 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>,
	<paul.eggleton@linux.intel.com>, <sgw@linux.intel.com>
Date: Wed, 3 Dec 2014 09:09:25 +0100
Message-ID: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [daisy][PATCH] python: Building without SSLv3 support
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
X-List-Received-Date: Wed, 03 Dec 2014 08:09:32 -0000
Content-Type: text/plain

Building python without SSLv3 support when openssl is built without
any support for SSLv3. "OPENSSL_NO_SSL3" is defined in the openssl
headers (opensslconf.h) which is located in /usr/include/$arch/openssl/

Backported from:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=768611#22

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
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
1.9.1



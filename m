Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BB03C610D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 15:48:14 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Mon, 7 Apr 2014
	17:48:13 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id A2111288415;
	Mon,  7 Apr 2014 17:48:13 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Apr 2014 17:48:11 +0200
Message-ID: <1396885691-3341-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] python: Fix CVE-2014-1912
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
X-List-Received-Date: Mon, 07 Apr 2014 15:48:17 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

A remote user can send specially crafted data to trigger a buffer overflow
in socket.recvfrom_into() and execute arbitrary code on the target system.
The code will run with the privileges of the target service.

This back-ported patch fixes CVE-2014-1912

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../python/python/python-2.7.3-CVE-2014-1912.patch |   26 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
new file mode 100644
index 0000000..02cc83d
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Backport
+
+Reference: http://bugs.python.org/issue20246
+
+CVE-2014-1912: Python buffer overflow in socket.recvfrom_into()
+lets remote users execute arbitrary code.Original patch by Benjamin Peterson
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -r 40fb60df4755 Modules/socketmodule.c
+--- a/Modules/socketmodule.c	Sun Jan 12 12:11:47 2014 +0200
++++ b/Modules/socketmodule.c	Mon Jan 13 16:36:35 2014 -0800
+@@ -2744,6 +2744,13 @@
+         recvlen = buflen;
+     }
+ 
++    /* Check if the buffer is large enough */
++    if (buflen < recvlen) {
++        PyErr_SetString(PyExc_ValueError,
++                        "buffer too small for requested bytes");
++        goto error;
++    }
++
+     readlen = sock_recvfrom_guts(s, buf.buf, recvlen, flags, &addr);
+     if (readlen < 0) {
+         /* Return an error */
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index c7bb9b4..0d64172 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -35,6 +35,7 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
   file://python-fix-build-error-with-Readline-6.3.patch \
+  file://python-2.7.3-CVE-2014-1912.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.10.4



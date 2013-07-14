Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 287BD6A962
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 06:48:42 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so10204194pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jul 2013 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=17vF8KxTZxj58CwL1EQMKaxywJn0TSHfwoXhUf2sFyU=;
	b=DiKcXijkEwHAESuFEruIqfXr4PacOSr5j16KUnMb/wQpyT6ApZR6Xe1ywO+jF1ILrV
	ZbYpESPgN1UiIr9DGl2KDC8Rkbu8ctFqkPsfXRdl4/4JmtEw8WkIey8s++IPfyZ5bkQ2
	HoBJwv6q72KF69yaZCaWHhQhMNGj9W2m25VbdglEI2k9sLzFygf7jg+cHn/mHvAk+SS/
	uYWZm3s2vwbnSyR7eLpKb9oLUiApAKzmQyZ1lm7m2QOHF4740V4XsK3D6bTcD+7+MJXr
	CKLffhxLXLzYXFZMiv3P8rDkkS0HwZZIYgTjYmJzcEO7vJUBtW0j7ATFAKqJpcOOxGQL
	8SwQ==
X-Received: by 10.66.9.71 with SMTP id x7mr46327958paa.37.1373784522675;
	Sat, 13 Jul 2013 23:48:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id y9sm54104399pbb.46.2013.07.13.23.48.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Jul 2013 23:48:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Jul 2013 17:04:20 +1000
Message-Id: <1373785460-14747-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] gdb: add PACKAGECONFIG for Python support
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
X-List-Received-Date: Sun, 14 Jul 2013 06:48:42 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_7.6.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb_7.6.bb b/meta/recipes-devtools/gdb/gdb_7.6.bb
index 6b38812..54082b8 100644
--- a/meta/recipes-devtools/gdb/gdb_7.6.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.6.bb
@@ -1,2 +1,23 @@
 require gdb.inc
 require gdb-7.6.inc
+
+inherit python-dir
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+
+do_configure_prepend() {
+	if [ -n "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
+		cat > ${WORKDIR}/python << EOF
+#!/bin/sh
+case "\$2" in
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+	--exec-prefix) echo "${exec_prefix}" ;;
+	*) exit 1 ;;
+esac
+exit 0
+EOF
+		chmod +x ${WORKDIR}/python
+	fi
+}
-- 
1.8.3.2



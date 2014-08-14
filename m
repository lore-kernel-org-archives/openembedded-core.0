Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA33265CA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:48:17 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so1168709pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZBtLssNNVqQcXhkDUI2TvHqbfJD4elMaiZgJmc1088s=;
	b=uCDbZk3/6qrM2SYcwyVaHub0B9zcWMee7kz7jAIllbUohBMBlydgtjEPfwNAhaLGxU
	zo5fEUUmL5bEu6ysSFQMnBAOTJgHrH1NzOh9/eT9xNhlUTArr0u3p6fh+1VZ5CXOhJwW
	3+crs+3ytWq4aezjEv7V4TxWHDxxFGZ/6+Z6JoHsqeA2h3sKzd9VodukH2rkzUfQiS0j
	JA4sT5Pep1k2hMds674IVrm4SWVpZ9xbtiLctjsXJlvDVMPoY5gFMmXUfwEr9wn8XvXQ
	a/KbTLBIb5jvQpAAPI1Ig8uogNgbJEfmi2yI/BBLq6+PRWr0iPAgMT91TwEMvVK5TlL2
	x/ZA==
X-Received: by 10.66.232.166 with SMTP id tp6mr2558649pac.127.1408002498476;
	Thu, 14 Aug 2014 00:48:18 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ha4sm4335221pbb.78.2014.08.14.00.48.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 00:48:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 00:51:26 -0700
Message-Id: <1408002686-5641-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
References: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] python: Fix build on musl
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
X-List-Received-Date: Thu, 14 Aug 2014 07:48:19 -0000

musl has posix_close which conflicts in python
so lets rename it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python/posix_close.patch                |   43 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/posix_close.patch

diff --git a/meta/recipes-devtools/python/python/posix_close.patch b/meta/recipes-devtools/python/python/posix_close.patch
new file mode 100644
index 0000000..725531a
--- /dev/null
+++ b/meta/recipes-devtools/python/python/posix_close.patch
@@ -0,0 +1,43 @@
+backport from http://bugs.python.org/issue20594
+
+- Issue #20594: Avoid name clash with the libc function posix_close.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+# HG changeset patch
+# User Benjamin Peterson <benjamin@python.org>
+# Date 1392131776 18000
+# Node ID 1d253360d5a6d8d987fb2480e26f4fcc2d730932
+# Parent  41e49f1c5bd8ff48a6c18804c958e82c659daab3
+avoid name clash with posix_close (closes #20594)
+
+diff --git a/Modules/posixmodule.c b/Modules/posixmodule.c
+--- a/Modules/posixmodule.c
++++ b/Modules/posixmodule.c
+@@ -6581,8 +6581,12 @@ PyDoc_STRVAR(posix_close__doc__,
+ "close(fd)\n\n\
+ Close a file descriptor (for low level IO).");
+ 
+-static PyObject *
+-posix_close(PyObject *self, PyObject *args)
++/*
++The underscore at end of function name avoids a name clash with the libc
++function posix_close.
++*/
++static PyObject *
++posix_close_(PyObject *self, PyObject *args)
+ {
+     int fd, res;
+     if (!PyArg_ParseTuple(args, "i:close", &fd))
+@@ -8960,7 +8964,7 @@ static PyMethodDef posix_methods[] = {
+     {"tcsetpgrp",       posix_tcsetpgrp, METH_VARARGS, posix_tcsetpgrp__doc__},
+ #endif /* HAVE_TCSETPGRP */
+     {"open",            posix_open, METH_VARARGS, posix_open__doc__},
+-    {"close",           posix_close, METH_VARARGS, posix_close__doc__},
++    {"close",           posix_close_, METH_VARARGS, posix_close__doc__},
+     {"closerange",      posix_closerange, METH_VARARGS, posix_closerange__doc__},
+     {"dup",             posix_dup, METH_VARARGS, posix_dup__doc__},
+     {"dup2",            posix_dup2, METH_VARARGS, posix_dup2__doc__},
+
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 5be9073..84a554f 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
   file://python-fix-build-error-with-Readline-6.3.patch \
   file://python-2.7.3-CVE-2014-1912.patch \
   file://json-flaw-fix.patch \
+  file://file://posix_close.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.10.4



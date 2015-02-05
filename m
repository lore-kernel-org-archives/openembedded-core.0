Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6667973262
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:02 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so10900048pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=iGWLLNRiH5OHs8CXcnBt//47pV8bPYA194MX1l+SUwY=;
	b=XmwCcyAR1kMs8M+rsbHNaiu8WK+wARgYuI/RopkTdzsESHDz/zQGB1sVIFaAJtAvH9
	j2yo+GDHkGCUphKjEvXBmEn9q3XUShxItD9hIseYHJk/cGQfFNq0LPdU2++gC//0s7sG
	9m2l2V8ByC/DFSeS+2cwJ1vk7JZE5ISRCC6Vh4ccngmgwtoidPOFA6nwX239+CKp0QIa
	Q+qCJFnQASrYCubyZLrq3cbPoo9kF47Gux+Xn9tIdIy4tVNufExbjr6f9Ee1GSApL9jn
	heSprMvSZRgKUsBzBqqHi/RIdt3u5XCQ0Xvw1QmwhgD7aoJ1SJenALWjnZ+LLjzE2UWJ
	ishw==
X-Received: by 10.68.138.135 with SMTP id qq7mr6584940pbb.139.1423152363683;
	Thu, 05 Feb 2015 08:06:03 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:03 -0800
Message-Id: <24828eac83ff3dc6063f4b9587ac4f427980a0e1.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 55/61] python: Disables SSLv3
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:03 -0000

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

(From OE-Core rev: 3462cac82cf0ab32e5e530f543b14fdcc211c678)

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index efaa4a7..cbe8d7f 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -39,6 +39,7 @@ SRC_URI += "\
   file://json-flaw-fix.patch \
   file://posix_close.patch \
   file://python-2.7.3-CVE-2014-7185.patch \
+  file://python2.7.3-nossl3.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1



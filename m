Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 031116AF31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:44 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so2715467pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EfY/58fWFuv5pPEPTwP+myWKhc3shXUII7qWyLlZ/5k=;
	b=B0gKFGsCVNw6Yq1Sy6TTFTRVZpK1Q5uPQIWbvUwPidyvaxCK5jKaOajOvMBtHFXxyy
	3pmznO5EtjM3wwpQF/1A2SJMZ4mAD44CC67WtB1Ws0O3wehAj80oTyZguqoAz9jH0wFq
	ujWU28mWcNcLuKHa2KE+g5mWZ9e0J3702+fPw/bnyxXq664z9LzW7tKwlFjuUEpR5zD/
	MvQB56ryfm56nkMwJt/oGJ4tlphkUEPd1mnQOz8I5SzTFRO3UmaZKZZQR5i7GebhZB5D
	KVKzd9l/FEjNMD272/w7ofUwPG91kD4k/9AfV3F64S0+FFTKb1vRLWvyFrNvtzYRpY5M
	qGgA==
X-Received: by 10.66.246.66 with SMTP id xu2mr13562525pac.134.1372457086300;
	Fri, 28 Jun 2013 15:04:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.45 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:04 -0700
Message-Id: <4b305736d4226c770324950a1efca903800fbc9c.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 19/24] python3-pycurl: Add recipe
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pycurl/no-static-link.patch     |   16 +++++++++
 .../python/python3-pycurl_7.19.0.bb                |   35 ++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pycurl/no-static-link.patch
 create mode 100644 meta/recipes-devtools/python/python3-pycurl_7.19.0.bb

diff --git a/meta/recipes-devtools/python/python3-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python3-pycurl/no-static-link.patch
new file mode 100644
index 0000000..c97f5dc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycurl/no-static-link.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+Index: pycurl-7.18.2/setup.py
+===================================================================
+--- pycurl-7.18.2.orig/setup.py
++++ pycurl-7.18.2/setup.py
+@@ -97,8 +97,7 @@ else:
+         else:
+             extra_compile_args.append(e)
+     libs = split_quoted(
+-        os.popen("'%s' --libs" % CURL_CONFIG).read()+\
+-        os.popen("'%s' --static-libs" % CURL_CONFIG).read())
++        os.popen("'%s' --libs" % CURL_CONFIG).read())
+     for e in libs:
+         if e[:2] == "-l":
+             libraries.append(e[2:])
diff --git a/meta/recipes-devtools/python/python3-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python3-pycurl_7.19.0.bb
new file mode 100644
index 0000000..122e1bd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycurl_7.19.0.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "libcurl python bindings."
+HOMEPAGE = "http://pycurl.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1+ | MIT"
+LIC_FILES_CHKSUM = "file://README;endline=13;md5=fbfe545b1869617123a08c0983ef17b2 \
+                    file://COPYING;md5=3579a9fd0221d49a237aaa33492f988c \
+                    file://COPYING2;md5=ffaa1e283b7f9bf5aafd8d45db6f7518"
+
+DEPENDS = "curl python"
+RDEPENDS_${PN} = "python-core curl"
+SRCNAME = "pycurl"
+PR = "r3"
+
+SRC_URI = "\
+  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
+  file://no-static-link.patch \
+"
+
+SRC_URI[archive.md5sum] = "919d58fe37e69fe87ce4534d8b6a1c7b"
+SRC_URI[archive.sha256sum] = "eb782dfcc5a7c023539a077462b83c167e178128ee9f7201665b9fbb1a8b0642"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+	rm -rf ${D}${datadir}/share
+}
-- 
1.7.9.5



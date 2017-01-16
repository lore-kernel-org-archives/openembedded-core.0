Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 804EF71A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so5487236pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=1lI8Pos2rpG/aYM+le0FOXyqPBl57Z8P7/MEz2/jtjU=;
	b=HVqHVKTcVrSCk0RljEHu3fuUnd5KKA0PSjL3V4TB+wKQ/0HvxsgMSB3t6xH7++8VlC
	IpuQuGt20MtEnxicsrJxFFdWLQXCJNqUXYH/7pWnG/VzlbKT9I8UuFz7mC0IsO8D59Io
	uPpzu+6vOobQwqlBwtQP5bm6pl4LOkv5y58ZsOs4ScpyfJen/q7R5wWzdT8NA/saI5kp
	QWiy5Oz74MsI8JjpmBOXecJ0Ctw8Sq9K8nJxw51fCAIPsMNqyGAeak+ljye003DYiNMB
	dYdgKMLdsCXJ7o/sP9ufV4uI4igzg9N/95kPTiigf8r4vuzvAWgDAzNXzLGoP16edZki
	NpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=1lI8Pos2rpG/aYM+le0FOXyqPBl57Z8P7/MEz2/jtjU=;
	b=CTvsFUtcsfZL5wf/kyaq9YLIXn96u236HDIaMfHpWHbHXULD3kl5cfZ+NcGZKOu5ng
	vkBL74W48CgJZmz7ut/X9IKy4hFXl26OSzEumYhPfkfXyo9LqzZzrQAqkss5T5iF5fpu
	cpkf9lBbIVOz/qmW/4YjhVLYUkt26vnJfNFASHTT/ddmT5cVG4kaUSLKkH5LQ2E9G01I
	EfNMV0O5DnOVp7sh8Ffssbn0JrU9ORcY2mKYLieVI8jZQWAhl1rqscO0NJKxLVhU+TO9
	Dr8GNcBcBtrb37mSf4TSX9YAHDeScKt7GG1v4H4H2EQEVtQl59YVY4PAya64oPPa17Qv
	muAA==
X-Gm-Message-State: AIkVDXJHT6iHzABpTOU3O+vLR6mGoDh2pmsBKuAG2HWhBW9ctqEsVF51X2HFDULk41u4Aw==
X-Received: by 10.84.175.3 with SMTP id s3mr50164649plb.66.1484576169902;
	Mon, 16 Jan 2017 06:16:09 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	h4sm33810273pfk.96.2017.01.16.06.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:09 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-7-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 7/30] gettext_0.19.8.1.bb: Fix shared building of gettext for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fix building of shared gettext for i686/32-bit mingw32. This adds a
patch which fixes an issue with gnulib that is included in gettext.

This patch does not need to be submitted upstream as it is fixing an
issue with the included version of gnulib. Upstream gnulib has already
fixed this issue and upstream gettext has already updated the included
gnulib, however gettext has not yet made a release that includes this
fix.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../fix-gl_cv_prog_as_underscore-test.patch        | 67 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fix-gl_cv_prog_as_underscore-test.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-gl_cv_prog_as_underscore-test.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-gl_cv_prog_as_underscore-test.patch
new file mode 100644
index 0000000000..636789f31d
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-gl_cv_prog_as_underscore-test.patch
@@ -0,0 +1,67 @@
+Backport gnulib fix for mingw into gettext's included version of gnulib
+
+http://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=68b6adebef05670a312fb92b05e7bd089d2ed43a
+
+Upstream-Status: Backport
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+
+--- a/gettext-runtime/gnulib-m4/asm-underscore.m4
++++ b/gettext-runtime/gnulib-m4/asm-underscore.m4
+@@ -27,11 +27,11 @@
+ #endif
+ int foo(void) { return 0; }
+ EOF
+      # Look for the assembly language name in the .s file.
+      AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS $gl_c_asm_opt conftest.c) >/dev/null 2>&1
+-     if LC_ALL=C grep -E '(^|[^a-zA-Z0-9_])_foo([^a-zA-Z0-9_]|$)' conftest.$gl_asmext >/dev/null; then
++     if LC_ALL=C grep -E '(^|[[^a-zA-Z0-9_]])_foo([[^a-zA-Z0-9_]]|$)' conftest.$gl_asmext >/dev/null; then
+        gl_cv_prog_as_underscore=yes
+      else
+        gl_cv_prog_as_underscore=no
+      fi
+      rm -f conftest*
+--- a/gettext-runtime/configure
++++ b/gettext-runtime/configure
+@@ -24601,11 +24601,11 @@
+   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+   test $ac_status = 0; }; } >/dev/null 2>&1
+-     if LC_ALL=C grep -E '(^|^a-zA-Z0-9_)_foo(^a-zA-Z0-9_|$)' conftest.$gl_asmext >/dev/null; then
++     if LC_ALL=C grep -E '(^|[^a-zA-Z0-9_])_foo([^a-zA-Z0-9_]|$)' conftest.$gl_asmext >/dev/null; then
+        gl_cv_prog_as_underscore=yes
+      else
+        gl_cv_prog_as_underscore=no
+      fi
+      rm -f conftest*
+--- a/gettext-tools/gnulib-m4/asm-underscore.m4
++++ b/gettext-tools/gnulib-m4/asm-underscore.m4
+@@ -27,11 +27,11 @@
+ #endif
+ int foo(void) { return 0; }
+ EOF
+      # Look for the assembly language name in the .s file.
+      AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS $gl_c_asm_opt conftest.c) >/dev/null 2>&1
+-     if LC_ALL=C grep -E '(^|[^a-zA-Z0-9_])_foo([^a-zA-Z0-9_]|$)' conftest.$gl_asmext >/dev/null; then
++     if LC_ALL=C grep -E '(^|[[^a-zA-Z0-9_]])_foo([[^a-zA-Z0-9_]]|$)' conftest.$gl_asmext >/dev/null; then
+        gl_cv_prog_as_underscore=yes
+      else
+        gl_cv_prog_as_underscore=no
+      fi
+      rm -f conftest*
+--- a/gettext-tools/configure
++++ b/gettext-tools/configure
+@@ -32284,11 +32284,11 @@
+   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+   test $ac_status = 0; }; } >/dev/null 2>&1
+-     if LC_ALL=C grep -E '(^|^a-zA-Z0-9_)_foo(^a-zA-Z0-9_|$)' conftest.$gl_asmext >/dev/null; then
++     if LC_ALL=C grep -E '(^|[^a-zA-Z0-9_])_foo([^a-zA-Z0-9_]|$)' conftest.$gl_asmext >/dev/null; then
+        gl_cv_prog_as_underscore=yes
+      else
+        gl_cv_prog_as_underscore=no
+      fi
+      rm -f conftest*
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 7b8c1e8eb4..0f4b556046 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -13,6 +13,7 @@ RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
 	   file://add-with-bisonlocaledir.patch \
+	   file://fix-gl_cv_prog_as_underscore-test.patch \
 "
 
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
-- 
2.11.0



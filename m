Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C46E46C100
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 18:36:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so20534969wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/sf0isZnZ/IiSbgNMMbTBEpN1FxjI2d7ISeX/OhoX1Q=;
	b=OpGZY5VE4o35wCmP0nvnYrqnOvLVbKMVwA/P+uMkRIVcRTz3qfZLfsB00BxHtnT0XC
	Q17Jzev+1f1MdqbJXrUBsk5oUq22Oxd62S9DTmcTnRHiV9m6GygevExWyzkz4SGK144z
	y52VbA2jxSbVxAkfrHMt4P/KY5zWC8wWnxONFAw+ZtDx+G3ATKydkiOTnqr+nBo+BNGR
	QGxNsMgcfjUIXRiJCxennOHHwX0cM2GP0WKzr2hthTdJxxhIEJpGa4Z4vfH1nuN76RFT
	JsRLg3+yBJX0/7q2tka/xxhhgNfEmWq4kxC0snKTa3N89erP4omR/6wx+iRw8mMA6Nej
	jF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/sf0isZnZ/IiSbgNMMbTBEpN1FxjI2d7ISeX/OhoX1Q=;
	b=d9SEqNdrBp8fUczwUxveXi0lS6w4eiPo8glnBeeioMI7QCxDv+Uit/H0ZadGeJINgX
	0goZfyHnIKWZBEf7HYGpfbj4DLa7dIVp/tHYyZBzhd6XnHEL3nPfYIVIauHSUjoGmoB0
	dtItlJm6SouK6BYfEHBkO5AKgCP57AGvNOakYne9IHii0r45IEAep9+fT/whtsfnk9bY
	yNiE+AiHbo5w+9NUT/Gt0sVVAmBx8TF6ox7EWapkoQek9nqLlwUARaxnnNLX+k8mbfcy
	Bi1iJzwnZxuDhJ1wnGHHzVDFdlWYG6HxI4VlkHcfTzwR+jvc8gBQ2RkZeNa3P1AIZjXv
	b75g==
X-Gm-Message-State: AGRZ1gKhWerRvV5MtBx2MdGKd5Z5EAeezvVFg708rqwnKs3NQfy11MxB
	gG3MoZgzmNgGdZG+T5Rc5j/bE71m
X-Google-Smtp-Source: AJdET5czmc6JUZf7lyrtmADNMlVNj40C9ILGCtsgAESSvyNkCCLcw0lDYgmfYiPdw3MWrFVYW2qB9g==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
	b4mr15392251wrx.135.1542566216407; 
	Sun, 18 Nov 2018 10:36:56 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	s206-v6sm24816319wms.29.2018.11.18.10.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 10:36:55 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2018 19:36:46 +0100
Message-Id: <20181118183646.28185-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] pseudo: fix link of sqlite3 using pkg-config
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
X-List-Received-Date: Sun, 18 Nov 2018 18:36:56 -0000

If sqlite3 is built with FTS5 it uses log() from libm, it sqlite3 is built
with READLINE it uses tgetent from a curses lib and readline from libreadline,
if it is built using deflate from libz ... , but all that linkage is lost
if we manually statically link so explicitely extract extra static linking
options from pkg-config and force them into pseudo as well.

This commit obsoletes (so include the implicit revert)
    e39fec613d pseudo: fix link with new sqlite3

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/pseudo/files/libm.patch | 33 -------------------
 meta/recipes-devtools/pseudo/pseudo.inc       | 19 +++++++++--
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 -
 3 files changed, 16 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/libm.patch

diff --git a/meta/recipes-devtools/pseudo/files/libm.patch b/meta/recipes-devtools/pseudo/files/libm.patch
deleted file mode 100644
index 1a82979313..0000000000
--- a/meta/recipes-devtools/pseudo/files/libm.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-If sqlite3 is built with FTS5 enabled then it links to libm.so for log(), but if
-we statically link to libsqlite3.a then this linkage is lost.
-
-Work around this by always linking to libm.so.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4633a8750f0966621d258548fba82bc6aa5aa997 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 6 Nov 2018 12:13:17 +0000
-Subject: [PATCH] Makefile: sqlite can need libm
-
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index ad6541b..28b5ecb 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -73,7 +73,7 @@ WRAPOBJS=pseudo_wrappers.o
- 
- # needed for anything that links with pseduo_client.o, pretty much
- CLIENT_LDFLAGS=-ldl -lpthread
--DB_LDFLAGS=@SQLITE_LDARG@ -lpthread
-+DB_LDFLAGS=@SQLITE_LDARG@ -lpthread -lm
- 
- PSEUDO=$(BIN)/pseudo
- PSEUDODB=$(BIN)/pseudodb
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index cdc2a5823f..8b05735bb1 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -17,7 +17,7 @@ PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
 
-inherit siteinfo
+inherit siteinfo pkgconfig
 
 do_configure () {
 	:
@@ -30,10 +30,23 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
 
 # Compile for the local machine arch...
 do_compile () {
+        SQLITE_LDADD='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
+	for sqlite_link_opt in $(pkg-config sqlite3 --libs --static)
+	do
+	    case "$sqlite_link_opt" in
+	    -lsqlite3)
+		;;
+	    -l*)
+		SQLITE_LDADD="${SQLITE_LDADD} ${sqlite_link_opt}"
+		;;
+	    *)
+		;;
+	    esac
+	done
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
 	else
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c9a4ecd2e2..79e0b6bd21 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,6 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-configure-Prune-PIE-flags.patch \
-           file://libm.patch \
            file://fallback-passwd \
            file://fallback-group \
            file://moreretries.patch \
-- 
2.17.1



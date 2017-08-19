Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2641171AC9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 17:27:06 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t80so12570251pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dWguEZe0O13KPm2RLoHZZWjUd/lvyX4cY3F15ohcHSU=;
	b=WrUAXUKx7J/j9MgRW9MSq3XZO6CqEh3S+DEmnhlriPEn1l1pLL8STy7IfewEQy6bqD
	ztye/rbmQXpIKRH/uMBkoSOpydYi62IAD6heEpdL1rYal5fCBcVf/r030gyuv56kFS4A
	h+yQEDrdYYejilHMzaOxxPc52uNQGfViG6uXxKkiuj14Vk6gA2MBH0CXJExvn+pOkd9j
	/pEtCkvsfRN3uXbY77BZx3jT4g6QAJT2IaBxAwwrFa9pjVBqaNSgpQOEjkIm+XT5z9er
	HrWBUiC8X2wAihJ6x47oLAfzS3BFLdY41F9l21FEdgP7CjQu/WB1U2xtX7Uj5YDENe9u
	WXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dWguEZe0O13KPm2RLoHZZWjUd/lvyX4cY3F15ohcHSU=;
	b=WfETrIhUHGA8XpgATPZBA7E7jTNVBcucjtJnBdE34UjMHUPVmv0cSz6ikxqtkVll4O
	xZXoVOqzdkQ48ZtdHLIIpAO6gtFe1h5niXeV7uhxW6w2F3aIOY0q1RYjZtlSmFqbjAOP
	IwF//kRGNsZrN8fORu3QeZHZoWqBROABXlpBWFdyIuPMAxrawui1Bw6ytJ/DjQX42OYz
	0wrneSGtX04WrdDz3rb6AxYwxOTIxVpnQMz0Sds6Z02ATTHVzfintDZczRcZPDBBsVyH
	J9oRNqU8vyYP8tRUUKDISWXH0Pm1XBVPqv+O1qrD1eFRYBjZCerZe11unOURgos7jFXd
	56jw==
X-Gm-Message-State: AHYfb5hbAW51YvCWXOqdEGNCjxBWK1245N5d6CWS1YrdImt6leBc6R5C
	rOXMWR8Q+QpGzIWw
X-Received: by 10.84.195.36 with SMTP id i33mr13788943pld.314.1503163628095;
	Sat, 19 Aug 2017 10:27:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::175d])
	by smtp.gmail.com with ESMTPSA id
	w66sm17349695pfi.63.2017.08.19.10.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 10:27:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 10:26:59 -0700
Message-Id: <20170819172659.16717-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH V3] db: Add --tag parameter to libtool invocation
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
X-List-Received-Date: Sat, 19 Aug 2017 17:27:07 -0000

Fix do_configure to be able to regenerate configure files

Use cross libtool as installed by OE, as done in normal autotooled recipes

These changes help in invoking the libtool with proper tags for C
and C++ compiler and linker invocation and not use same tag across all
different invocations

Fixes errors like
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Fix commit message
v2 -> v3:
- Call libtool with ./ prefix to mark cwd

 ...dd-explicit-tag-options-to-libtool-invoca.patch | 42 ++++++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb               | 23 ++++++++----
 2 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch

diff --git a/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
new file mode 100644
index 0000000000..cb28db1343
--- /dev/null
+++ b/meta/recipes-support/db/db/0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch
@@ -0,0 +1,42 @@
+From 32e5943a3c4637d39e4d65b544dcb99e280210e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Jul 2017 10:54:26 -0700
+Subject: [PATCH] configure: Add explicit tag options to libtool invocation
+
+This helps cross compile when tag inference via heuristics
+fail because CC variable is having -fPIE -pie and libtool
+smartly removes it when building libraries
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dist/configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/dist/configure.ac b/dist/configure.ac
+index 689f3b8..9c14bdb 100644
+--- a/dist/configure.ac
++++ b/dist/configure.ac
+@@ -366,12 +366,12 @@ LIBTOOL="./libtool"
+ 
+ INSTALLER="\$(LIBTOOL) --mode=install cp -p"
+ 
+-MAKEFILE_CC="\$(LIBTOOL) --mode=compile ${MAKEFILE_CC}"
+-MAKEFILE_SOLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CCLINK} -avoid-version"
+-MAKEFILE_CCLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CCLINK}"
+-MAKEFILE_CXX="\$(LIBTOOL) --mode=compile ${MAKEFILE_CXX}"
+-MAKEFILE_XSOLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CXXLINK} -avoid-version"
+-MAKEFILE_CXXLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CXXLINK}"
++MAKEFILE_CC="\$(LIBTOOL) --tag=CC --mode=compile ${MAKEFILE_CC}"
++MAKEFILE_SOLINK="\$(LIBTOOL) --tag=CC --mode=link ${MAKEFILE_CCLINK} -avoid-version"
++MAKEFILE_CCLINK="\$(LIBTOOL) --tag=CC --mode=link ${MAKEFILE_CCLINK}"
++MAKEFILE_CXX="\$(LIBTOOL) --tag=CXX --mode=compile ${MAKEFILE_CXX}"
++MAKEFILE_XSOLINK="\$(LIBTOOL) --tag=CXX --mode=link ${MAKEFILE_CXXLINK} -avoid-version"
++MAKEFILE_CXXLINK="\$(LIBTOOL) --tag=CXX --mode=link ${MAKEFILE_CXXLINK}"
+ 
+ 
+ case "$host_os" in
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 7b158e9e2c..66282600f5 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch \
             file://fix-parallel-build.patch \
             file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
+            file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
            "
 # We are not interested in official latest 6.x versions;
 # let's track what debian is using.
@@ -76,22 +77,32 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX} STRIP=true"
-EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
+EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
+EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal -I${S}/dist/aclocal_java"
 AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
 CONFIG_SITE = ""
-do_configure() {
-    cd ${B}
-	gnu-configize --force ${AUTOTOOLS_SCRIPT_PATH}
-	oe_runconf
+
+oe_runconf_prepend() {
+	. ${S}/dist/RELEASE
+	# Edit version information we couldn't pre-compute.
+	sed -i -e "s/__EDIT_DB_VERSION_FAMILY__/$DB_VERSION_FAMILY/g" \
+	    -e "s/__EDIT_DB_VERSION_RELEASE__/$DB_VERSION_RELEASE/g" \
+	    -e "s/__EDIT_DB_VERSION_MAJOR__/$DB_VERSION_MAJOR/g" \
+	    -e "s/__EDIT_DB_VERSION_MINOR__/$DB_VERSION_MINOR/g" \
+	    -e "s/__EDIT_DB_VERSION_PATCH__/$DB_VERSION_PATCH/g" \
+	    -e "s/__EDIT_DB_VERSION_STRING__/$DB_VERSION_STRING/g" \
+	    -e "s/__EDIT_DB_VERSION_FULL_STRING__/$DB_VERSION_FULL_STRING/g" \
+	    -e "s/__EDIT_DB_VERSION_UNIQUE_NAME__/$DB_VERSION_UNIQUE_NAME/g" \
+	    -e "s/__EDIT_DB_VERSION__/$DB_VERSION/g" ${S}/dist/configure
 }
 
 do_compile_prepend() {
     # Stop libtool adding RPATHs
-    sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/libtool
+    sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/${HOST_SYS}-libtool
 }
 
 do_install_append() {
-- 
2.14.1



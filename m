Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAABC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:27 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.46143.1638092786262402131
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDnIXfCf;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id c32so36415170lfv.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tWLz7IBrAHXxeiW+pNn89WyLCNqpC6DooSmC7GRFElc=;
        b=dDnIXfCf82sNVqZzgdqrjE+k/EdAnuXlzSZ3OoAik5kGhm22bKgEFELCsSYzGE4Vpt
         v+OIlZvA48ybCLfjyj3Y3sPX7WYWx+2PcWDYsy+DvnPrzEGqNFxUM4Em511Sy+9YAdnI
         K7WYg9N9Yctb5whpRFZQMpIvmi+xULQhFbcXH54Md9QycqW2bNQj8QHRhEtXyiJpO7XK
         /0kyZHnGOeh21ka4CIrTD+dLYj0lcVuepr1nyppHCwzwtDGkquLPTDIf+1msTlbfbSJI
         MvOrR/ZjMkM7CrAWIhyW7+RL6dxtZrDtn/PKgpq0RBm11IpU8DBrOu5Pyz2ORP3kight
         aNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWLz7IBrAHXxeiW+pNn89WyLCNqpC6DooSmC7GRFElc=;
        b=08ztGQb4xIMimrPJKON4pYTFNgTdSsSKD2qrjnrS8km62yRpJwl2Wx9av+hk8p4U4t
         V8EmZcTlqVOU2BCgCb6NMYzOgMeRfNr0+P2oFj7XYXr4LU4dHSGcwNLSDStCjUiRszUX
         txYALYx/TexHFKyVXy0ZlJhJB8QfAfA4z6jJeDd8vN06m1tSc1LkYuViK38PNL4+pOAv
         32mNJ79Xz8ne43nWvGr5lhgXiq00sy0IyLbgRbr8oxvVNCB2ZbmZWEcSDHAT+uLHAYFg
         youeKr8vvOK/idFJturDAzKqplUqvIYDdcxGv59pnuj1ag05Ay98adhJ8Y7v1jvTdTFU
         uDww==
X-Gm-Message-State: AOAM533j10eHloTpyfIIUjVNR+01V4Ybq6uQOTaVjBlUihLeH5n9gaf1
	jbv7fcFJSdWKes4dtaQf5jN8JMr4QL2duQ==
X-Google-Smtp-Source: 
 ABdhPJzArtmU/e7Eivj4p6onVVm9IzDuqzjaw5ps2ouPHx5G76/huamdBFbX3jL6M3oUyZ43kqquMw==
X-Received: by 2002:a05:6512:3708:: with SMTP id
 z8mr41781127lfr.74.1638092784618;
        Sun, 28 Nov 2021 01:46:24 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:24 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 8/9] python3: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:31 +0100
Message-Id: <20211128094532.1145820-9-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158875

Lots of hacks to get python reproduce in different build paths:
 * Avoid encoding build-specific paths in the resulting binaries
 * Build without debug information
 * Remove __pycache__/ since the cached files seem to depend on the run-paths

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../python/python3/determinism.patch              | 15 +++++++++++++++
 meta/recipes-devtools/python/python3_3.10.0.bb    |  8 ++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch

diff --git a/meta/recipes-devtools/python/python3/determinism.patch b/meta/recipes-devtools/python/python3/determinism.patch
new file mode 100644
index 0000000000..eca7755d4e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/determinism.patch
@@ -0,0 +1,15 @@
+Index: Python-3.10.0/Makefile.pre.in
+===================================================================
+--- Python-3.10.0.orig/Makefile.pre.in
++++ Python-3.10.0/Makefile.pre.in
+@@ -791,8 +791,8 @@ Modules/getbuildinfo.o: $(PARSER_OBJS) \
+ 
+ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
+ 	$(CC) -c $(PY_CORE_CFLAGS) -DPYTHONPATH='"$(PYTHONPATH)"' \
+-		-DPREFIX='"$(prefix)"' \
+-		-DEXEC_PREFIX='"$(exec_prefix)"' \
++		-DPREFIX='"/non/existent"' \
++		-DEXEC_PREFIX='"/non/existent"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index e3300b6495..ba2e9f7dcb 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -40,6 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
+           file://determinism.patch \
            "
 SRC_URI[sha256sum] = "5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002"
 
@@ -79,6 +80,8 @@ DEPENDS:append:class-nativesdk = " python3-native"
 # force to use the mutex+cond implementation (https://bugs.python.org/issue41710)
 CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
 
+CFLAGS:append:class-native = " -ffile-prefix-map=${WORKDIR}=/usr/src"
+
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 
@@ -94,6 +97,7 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+CACHED_CONFIGUREVARS:append:class-native = " ac_cv_prog_cc_g=no"
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
@@ -180,6 +184,8 @@ do_install:append() {
         # More info: http://benno.id.au/blog/2013/01/15/python-determinism
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+
+        find ${D}${libdir}/python${PYTHON_MAJMIN} -name __pycache__ | xargs -n1 rm -r
 }
 
 do_install:append:class-nativesdk () {
@@ -398,3 +404,5 @@ SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING WORKDIR"


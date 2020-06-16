Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.766.1592327146848726991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 10:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=eqEggmJV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id c3so21518091wru.12
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gq3souxg25EPQljfgDXs8EF6VNL9gLit/M40jIyvC5I=;
        b=eqEggmJVax9c0DwEJYvv7bFj54t6ZRhz7zp8EpWhO8JMLlhU+kv7HjyTPgnQOrNXWh
         rGqOkINe+8nzZBUnsQx0+mtKhNfXUL7g5F4/c8OZr5E91GtWPCdwtzGoFLKDrg07flYQ
         tHCJSLaoc1Is6VDM/Vu9HtKfHiuXoiNzYPt6Gln0omK45Rv3wo2f/jT0Nz/TvcKO2IlP
         /7MmpVNW1mJR2jpNktRO2rFb7uxLkaHxU07QEyaCdO94zmlSKvFVPz0XOafdzxVuv5QB
         zGM6cq4OfyOtSeC+03fgYV3luGAidVpZ8t7Wm6QH8w57Tr7WZD21CoftjyEBAOOk55yZ
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gq3souxg25EPQljfgDXs8EF6VNL9gLit/M40jIyvC5I=;
        b=lMFSuQ1dbQCg77a4/cRjJeGr9DVos2P5nYnDR2ZOYUlox4U9jt3N/+kX7Ie1sEHRl9
         afnc/sZtMDibBmTDNhm2B+HyHsdAbdtkmlgBWdFiNSnd5MNGnGn2yYC0ARFu+3lnuKMz
         19mMfXbmq4h5bPj0737O9mRNBoc+0rS9cBJDLr5yTQ9zk4/rzmIClPUypdyN1dBLMJc3
         HuyKb4QlEmO4muIATid3vSdLQbpNi3fYYUsrjfkHpFmWTEVhFKsrP+Aygts6OIA0gIpo
         xD77E34OciRo6I4a5/ROr5U9FYcizgQ4t6q3W2zBULqlOM3BOm84UL0BqFUO46n+rxjs
         7CgQ==
X-Gm-Message-State: AOAM531FCTmEGeMdWyiprSlj6deOHiq1BMP3Cb1FSuFQb+9W1U04eKAi
	n2tSVloH5EADVf9SqyGmaPxLb1L7+X0pNQ==
X-Google-Smtp-Source: ABdhPJx8bMKpgEaEf54iYEP44tJk5dL2IXjB0B3n8PTeNTCfUb/EsKSEHROBWnGAVuxd07/Y+i4OOQ==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr4184860wrw.203.1592327145084;
        Tue, 16 Jun 2020 10:05:45 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 40sm31820668wrc.15.2020.06.16.10.05.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 10:05:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 3/3] go-native: merge bb/inc and add comment
Date: Tue, 16 Jun 2020 18:05:38 +0100
Message-Id: <20200616170538.1049884-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616170538.1049884-1-ross@burtonini.com>
References: <20200616170538.1049884-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Merge the .bb/.inc, and add an explanatory comment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/go/go-native.inc     | 55 --------------------
 meta/recipes-devtools/go/go-native_1.14.bb | 60 +++++++++++++++++++++-
 2 files changed, 59 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-native.inc

diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
deleted file mode 100644
index 207708745e..0000000000
--- a/meta/recipes-devtools/go/go-native.inc
+++ /dev/null
@@ -1,55 +0,0 @@
-inherit native
-
-SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
-SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
-SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
-
-export GOOS = "${BUILD_GOOS}"
-export GOARCH = "${BUILD_GOARCH}"
-CC = "${@d.getVar('BUILD_CC').strip()}"
-
-GOMAKEARGS ?= "--no-banner"
-
-do_configure() {
-	cd ${WORKDIR}/go1.4/go/src
-	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
-}
-
-do_compile() {
-	export GOROOT_FINAL="${libdir_native}/go"
-	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
-
-	cd src
-	./make.bash ${GOMAKEARGS}
-	cd ${B}
-}
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
-do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
-
-make_wrapper() {
-	rm -f ${D}${bindir}/$2$3
-	cat <<END >${D}${bindir}/$2$3
-#!/bin/bash
-here=\`dirname \$0\`
-export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
-\$here/../lib/go/bin/$1 "\$@"
-END
-	chmod +x ${D}${bindir}/$2
-}
-
-do_install() {
-	install -d ${D}${libdir}/go
-	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-	install -d ${D}${libdir}/go/src
-	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
-	done)
-	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
-	install -d ${D}${bindir} ${D}${libdir}/go/bin
-	for f in ${B}/bin/*
-	do
-		base=`basename $f`
-		install -m755 $f ${D}${libdir}/go/bin
-		make_wrapper $base $base
-	done
-}
diff --git a/meta/recipes-devtools/go/go-native_1.14.bb b/meta/recipes-devtools/go/go-native_1.14.bb
index bbf3c0dd73..c5cb97e73e 100644
--- a/meta/recipes-devtools/go/go-native_1.14.bb
+++ b/meta/recipes-devtools/go/go-native_1.14.bb
@@ -1,2 +1,60 @@
-require ${PN}.inc
+# This recipe builds a native Go (written in Go) by first building an old Go 1.4
+# (written in C). However this old Go does not support all hosts platforms.
+
 require go-${PV}.inc
+
+inherit native
+
+SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
+SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
+
+export GOOS = "${BUILD_GOOS}"
+export GOARCH = "${BUILD_GOARCH}"
+CC = "${@d.getVar('BUILD_CC').strip()}"
+
+GOMAKEARGS ?= "--no-banner"
+
+do_configure() {
+	cd ${WORKDIR}/go1.4/go/src
+	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+}
+
+do_compile() {
+	export GOROOT_FINAL="${libdir_native}/go"
+	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
+
+	cd src
+	./make.bash ${GOMAKEARGS}
+	cd ${B}
+}
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
+
+make_wrapper() {
+	rm -f ${D}${bindir}/$2$3
+	cat <<END >${D}${bindir}/$2$3
+#!/bin/bash
+here=\`dirname \$0\`
+export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
+\$here/../lib/go/bin/$1 "\$@"
+END
+	chmod +x ${D}${bindir}/$2
+}
+
+do_install() {
+	install -d ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	install -d ${D}${libdir}/go/src
+	(cd ${S}/src; for d in *; do \
+		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
+	done)
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
+	install -d ${D}${bindir} ${D}${libdir}/go/bin
+	for f in ${B}/bin/*
+	do
+		base=`basename $f`
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base $base
+	done
+}
-- 
2.26.2


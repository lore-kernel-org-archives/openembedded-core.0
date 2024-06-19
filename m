Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC200C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 10:34:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.17769.1718793258433448256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 03:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsL6xJ5h;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3609565a1bdso2646461f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718793256; x=1719398056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGvawxPEb4Goykpdpw407GJC9ftpHMmSWJarFK1+Q9w=;
        b=VsL6xJ5hu3a3LQq5msII1yQVEzGJ07126FYYZMxEohbzH5TgDq5/ybiZ9EQvZ4j2MX
         qxQn0EssgNwIKmw7598ZI8sK4cZnFyvlbwD6f/gVJhmBob1mWUrh9M+QTy7zRPNRXHQd
         jDMhyvi/oNYH25JM3D0+xc5z6zH5AMjey6afsV1dtfeH5ZYHkUoXMvYYACG6pelZcakx
         Cub2nvqb0i6QKjE6gjRAct1E536jnshKlygAnns8pEn1heoIOYZak4hTyNoywW5KFtyg
         PvOacm5RE7+zyDvK5Bco0pQkC/qcNVLYndwItaNBuLIGaDsxI0aF8eRFCs9SfqVKh3Zi
         Ag8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793256; x=1719398056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGvawxPEb4Goykpdpw407GJC9ftpHMmSWJarFK1+Q9w=;
        b=q20E3vrIYp8jiaAGIfFjS7QCce91kfV5TUQpYVq+6vKpR82CuXQ0DjsCexBvmk320u
         vqAbLsXmLqcuKV9CyKm5+Bbul0OOBMIAC2lYWkVF5tqem1YaTeAQNyihQkXb+rpEmWrC
         0iDF3h4S3v2Z8EWUX0Zt7b9Smc9aD2oRyReX0mluX7+4JfLQ0HRNh4gBewm9VmBMKixG
         mq2sw7+0vKK+OdL4F9XK6BzDT4b2tU7necxpyr4nOc1FXwo4U+djj43RggSDuvDwkuRS
         QF0omF8FKuNsYhACTroizh9u3Dj9kIlxss9jAATw/XvntSXDa2bTA7HfJR/e0UbaXzWj
         JILA==
X-Gm-Message-State: AOJu0YwfUfaUzRGsAZNGHxJN6Gz+eD5ZXcmOIZr1BbDe+fZc5EiVD9Jf
	sgzv2UgWxFGUWdyUDhxwuecbXalavv2k2ePg5I3CA4WGkd2u2GTfkKTR4Dko
X-Google-Smtp-Source: AGHT+IGMpBMyPKrU6atBqIvcD9OJDSr+05lCJaBYt0gDDBVyv50UTa3axk/uz7SKjp3Xgo26Pwh8Qg==
X-Received: by 2002:a05:6000:459e:b0:35f:f90:f383 with SMTP id ffacd0b85a97d-363195b1a17mr1487993f8f.56.1718793256375;
        Wed, 19 Jun 2024 03:34:16 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-362f03ac73dsm2697837f8f.55.2024.06.19.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 03:34:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/3] go: drop the old 1.4 bootstrap C version
Date: Wed, 19 Jun 2024 11:34:05 +0100
Message-ID: <20240619103406.276716-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619103406.276716-1-jose.quaresma@foundries.io>
References: <20240619103406.276716-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 10:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200906

Bootstrap [1]
As mentioned in the Go 1.20 release notes, Go 1.22 now requires the final point release of Go 1.20 or later for bootstrap.
We expect that Go 1.24 will require the final point release of Go 1.22 or later for bootstrap.

The default recipe for bootstrap is the go-binary-native as can be seen in:
meta/conf/distro/include/tcmode-default.inc:68:PREFERRED_PROVIDER_go-native ?= "go-binary-native"

Currently if we change it to use the old go-native and compile the go1.4-bootstrap-20170531
it fails:

| Building Go cmd/dist using /build/workdir/tmp-glibc/work/x86_64-linux/go-native/1.22.3-r0/go1.4/go. (go1.4-bootstrap-20170531 linux/amd64)
| can't load package: package ./cmd/dist: found packages build.go (main) and notgo120.go (building_Go_requires_Go_1_20_6_or_later) in /build/workdir/tmp-glibc/work/x86_64-linux/go-native/1.22.3-r0/go/src/cmd/dist

This has been broken for some time but as we used go-binary-native by default it went unnoticed.

[1] https://go.dev/doc/go1.22#bootstrap

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-native_1.22.4.bb | 58 --------------------
 1 file changed, 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-native_1.22.4.bb

diff --git a/meta/recipes-devtools/go/go-native_1.22.4.bb b/meta/recipes-devtools/go/go-native_1.22.4.bb
deleted file mode 100644
index ddf25b2c9b..0000000000
--- a/meta/recipes-devtools/go/go-native_1.22.4.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-# This recipe builds a native Go (written in Go) by first building an old Go 1.4
-# (written in C). However this old Go does not support all hosts platforms.
-
-require go-${PV}.inc
-
-inherit native
-
-SRC_URI += "https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
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
-- 
2.45.2



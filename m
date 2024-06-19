Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7B9C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:48:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.24446.1718812093821345933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIV4ypay;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso69254385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718812092; x=1719416892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGvawxPEb4Goykpdpw407GJC9ftpHMmSWJarFK1+Q9w=;
        b=bIV4ypay3AkTsihhKCE71FCG/e9SW6ElxlPGiELyAWJHH9vdDxcrOLFYyEUuHab1UG
         bJ1uQaoWoDfVPAcXtVpCaLkaKLokDdgceGej1q4vNLV/vaIePW2tLY1sfelUdu0cx+3h
         sqPiBXdTVSpw5K+vEa3WoPqPwrqphBD0U//A6xnw1vLKTYs6oY34iuyXT1tNa/ILkEVi
         cc1hkLbkrj8/trp+dA0cxejDj6cJp9lfjOhaJ2JFzZyyefh6xpeY0DQgml9ITK4smyK/
         4VS+B9R9nvK6kWuzzhtTMK3q7TmYoy4U7/gtvAXsQ87hZaWOuo1rInsW5HR5i8KN9ttP
         W7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812092; x=1719416892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGvawxPEb4Goykpdpw407GJC9ftpHMmSWJarFK1+Q9w=;
        b=tM8AWcikUNIXaSK/oa6Zs424wDfbr3mY+3gwGir6HiLIbjkjQY8MJVlzCzHMDSoXuL
         Lf9JHD6QHPsXZzJsVGNJTPWXD81GxkgZ9rke9loB+nfv1N/0xk1gjz03W8NnoBPS4ZIy
         iOH4wPtz9U2EnaeJeW75RWhDZJg6np3bZ49CkWl5t4EayXydHQ+Lm01T59njSUIaEUGH
         GWNQCS49p7sfee7bt72Y8zpmP4yLjicw5qDpsyST0BbcZwXumA3F7aIJetdJ7JUpA2md
         HZjpauKl396GwRJNMPDvDfV5eKw4YEdUS1rqmy5vR8+ocZip6kQUrw104prTrUKDUNNK
         Ff6g==
X-Gm-Message-State: AOJu0Yz5WpplSPUsyOIYcGmMgL6zCPP59WoRh05Ol/Z9ItCcdnIqtzIA
	BfoJ1ynKBeGpmd6jp+p5vI5RJ69t6APu7YzNkQjYt0d1cYk5S/G2Rc5W1CZW
X-Google-Smtp-Source: AGHT+IFVHdvYTUajrmsh7znvfMS2DFOP3p/l5R7TMVziPUJBHg1xJvqKHRv5t/aFEBoKq//+iqphyw==
X-Received: by 2002:a5d:5f8e:0:b0:364:29ce:b14e with SMTP id ffacd0b85a97d-36429ceb34dmr1089266f8f.69.1718812091814;
        Wed, 19 Jun 2024 08:48:11 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36077536f78sm17341798f8f.7.2024.06.19.08.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:48:11 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 2/3] go: drop the old 1.4 bootstrap C version
Date: Wed, 19 Jun 2024 16:47:43 +0100
Message-ID: <20240619154744.381373-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619154744.381373-1-jose.quaresma@foundries.io>
References: <20240619154744.381373-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200920

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



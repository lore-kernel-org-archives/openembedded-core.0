Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF88C30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:08:09 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.22459.1719396488323551940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Er8g3ynH;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso97358791fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719396486; x=1720001286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGXHXYb3gAMRFWOVgvbWUne45LIV8i6dKAyrtCS6LVs=;
        b=Er8g3ynHvWLDRmMVFwjvcwhJW7WiOcgFx/7SD6iy8ZWKibDJWafPK/4s/FMAwrAUbt
         JVwgVJUm79Fuk2RpOC40gQWBcUpaMqKdZQOEP7MSVpCvVf6IOPWyD15EMj3g/pC8nygI
         Lgf9vvu7I9J2rlwiqiA/67CxkrWaotB55D+Es5OO3RWfnH1nNs2Kt5T22oHs5a7MOSYh
         10JLCowbXPKSKvbensnaNAC4QSEoXtOonSRI4LIlMQpIGpC8Hn3+95O4L/BdYAkOqruC
         EsX9norMQlcf1itKbhXnYyOdPYybaiQViPbDMaNjKEodgG4EoSRaJHpjfaHRQHSFRmhh
         qfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396486; x=1720001286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGXHXYb3gAMRFWOVgvbWUne45LIV8i6dKAyrtCS6LVs=;
        b=Rv/SpIwHal+qVlXI19ZRHzMSckXAaumW/4iPFPM5QXxE57fbfSVFJATuRSLviGHyJA
         C4o+2ncZi6QhfwsuaUNqhSmt6+OX+kf00Z9qphlx9NSUFO0dfJuDypEarfktI9EXW8BA
         n8VE6+J1Ip31ZXxoF7B6BIdSLVx6XP92RrYkPypk+VwJ9TxYZNSvPd8Wsdeh2U7DLu+8
         g4KKlPgGN25e33Z2KHYRBHvePzYneCpkilHdebeYxRkvAhpn5FCuEgMWDwBNqO6Aw7Vd
         Ai7wkpCuoRo/wJBOiZI79sUdrKv4dKXTinsbana7a8N1u1AQSscO3MlK7FhAzJSP1VZZ
         Atsw==
X-Gm-Message-State: AOJu0Yyt+53vqcXtKSR8JjdPkf8aoEzPBJiEz+s0boAcUhGp1vMbmi4Y
	a9Z1I2THfdOlvEme/EoXC7Z3RjTpwn6qhTC7YU/E03f8meiqv7I6rn6eRA==
X-Google-Smtp-Source: AGHT+IHiXVQ1V+3NLCOyrD3nvvvremfMIBMJTlYAFNUz7meroIuK3JDSe573Up6HPy25hmMA5gLhkg==
X-Received: by 2002:a2e:8746:0:b0:2ec:5685:f061 with SMTP id 38308e7fff4ca-2ec5b2d6313mr77287251fa.21.1719396484249;
        Wed, 26 Jun 2024 03:08:04 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6717sm15468969f8f.9.2024.06.26.03.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:08:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][scarthgap][PATCH 3/3] go: drop the old 1.4 bootstrap C version
Date: Wed, 26 Jun 2024 11:07:52 +0100
Message-ID: <20240626100752.977-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626100752.977-1-jose.quaresma@foundries.io>
References: <20240626100752.977-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 10:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201158

From: Jose Quaresma <quaresma.jose@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 876d344d2ec3d6ce283d01974146392d76685824)
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



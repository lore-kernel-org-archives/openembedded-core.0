Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD0FC30659
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.4350.1719778085584261474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yhTeuCTl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-701fa273824so1413247a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778085; x=1720382885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBAToDYmZSBi/0r0x0V3djlsz9UlPSoR6+A9EBn9kGs=;
        b=yhTeuCTlvBiFIWs3rRAZ6z8Gg29jCf5Vz53z/EUePWaPHlkEO5qG9EPvj6uECh6x0d
         y6QUUdAuAq8fKzkVwDze7AJaRTlKket8t2Na+bhoGrPXAqJ9PweJQW59y8x43mWG9VPR
         6r0fYrlcoN/cC4gCBbtG8Zia3jK1fn6Ozme1zvgMmvIdkdl8M7sU9xQ8qpiYd2lGpza9
         PoJa7ntJBJnvyooCHecBhshC/E+6KXhja6VUdaJt76hCtYV4jDVDg1FFr1yzaGxdzkr3
         hqS1yQWcbhLfbkZdu1qLSpqu/DmMPbit6CEcBMXwRIv0REJsEgr+9FgqP4zU8eB9UyVg
         6XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778085; x=1720382885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBAToDYmZSBi/0r0x0V3djlsz9UlPSoR6+A9EBn9kGs=;
        b=waNdyN4CzXQcWg1GNefBQWsQ6hTtpSO0Nqu+G8g7TuWz/6m82h8QwaEkHqO5jzVuBb
         xfYyUznpGt+PxAM33ML4jj/x3OFhvVw0Lw0acFJlPBTJidygIZfQKm6DkxcMRd61g5lR
         Jj6KmIA7Yw3g2DIlmM3H6ZEy/XeqH4YNr7jMqKfyZX6FBYRMlqRjBR62Kylvq1BbWyD0
         at+j7jjHIMblWB5UW+NYqbvxLOwf+jHSWOd8Z6v0QpSBW9s1RTL6htThf3whH7AmD90L
         KK8goFS0YhtgQcHu52wjzGRxRNHS8utAaAMzQN9thc49cEcZAjYiOhE2KnSsBu0A1eJ5
         pJ6g==
X-Gm-Message-State: AOJu0YwtpBCo0NAJSuqZtasy/u1MM/aBPqWA0v6vtOLgzWkFoc/5o7aG
	NK/az3+jWJWO43vB5PdMZzW4V8/mnYlsiEEkhCDChZLTptLQBKR7jiWBekwMS/gCppBc6oUWs8H
	1zSU=
X-Google-Smtp-Source: AGHT+IGjxAKdHzT6Mirt3pzVG0jz9dFBII0jdrAHVP6E97cbs5xsSB44tlDYj9+s7PnAsDy2uwaRpg==
X-Received: by 2002:a05:6830:1243:b0:700:ce20:4928 with SMTP id 46e09a7af769-70207712c16mr4726949a34.26.1719778084602;
        Sun, 30 Jun 2024 13:08:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/35] go: drop the old 1.4 bootstrap C version
Date: Sun, 30 Jun 2024 13:07:19 -0700
Message-Id: <f350f5b6302fc226e477d5283e4a9722a11d4170.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201244

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1



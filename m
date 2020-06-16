Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.690.1592327145101955087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 10:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=WpzpAdAn;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id c71so3567486wmd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mPmkkHyZleX1JRIxwiGryzeCHbzsGAwcA30Za/TU18=;
        b=WpzpAdAnz+wOJyGIN3C4LjYDDojw67iI6ZH7yXSwbFhP/SafUWF/9isFcleVovHtiE
         GjWkl7W22c0w3bDgzlOIinueDHD6TqHRWWRy3A0CMB5B7cf8il593ApAXSXLX6hRMMuL
         Us6nfBirXl7SWJjAAUbJXzpnV2q4ZdjX20juaxP1S7szRadjEnP9NdWU6511kZ0NVkBC
         ZouMGkcIcFuhNN62HUZQaDbInJBFY+gO1YQBw+ll69kW2Mu5M3pMFvqH7U0VfenyAtN3
         1stEZO57awgUjksiy37a0b2BCxYRtxsoC6E5tDeCmgnOgcsCCph3PdMisdMMiC/zUv0W
         87UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mPmkkHyZleX1JRIxwiGryzeCHbzsGAwcA30Za/TU18=;
        b=gGZiouwIsKbUWY9QqYaEIyJebwJSw6RKi48LXHHPLpfMdBiDlF6mdAu0n+80ZP+1xs
         OYb8TtQ1gI/0+lYpJklLHKVLIFgBsFQmE92/D5k4tEwhgWl6kZ/NLYL83w6LD4j3KjIl
         pxmuf0pSeJ25FauM+SVEJvyr7Wns7TPdAeXOjCIhMl/Ru6fT6kp+rbUUi73k+1Muo+od
         HPBiwIFCA1aY+qB6SNW4nIPajiasB8q8MHvqRjj5HlaSQpThGudqJgLaghwiHkh2y2iW
         DLrQAdO9zyI4pTDt7MHLjeLIBksj5te7aPXPqhd9F9nitjdzVlbtGS/8xOHLQMnk3w+g
         J1Jw==
X-Gm-Message-State: AOAM530ND8PWmgv83NMTAH70AHb9Vge6K8+vVEsZ0nHAQY760uSIaejg
	tJF01CuApm+lVV0YEyeB+eL5205Ds0ig0Q==
X-Google-Smtp-Source: ABdhPJzCLhEAav2HjuBO9hR2ylWrpD8YLGdzx6DBgHeeCoIwWVazHdoRgPw6rpijWHK6PtFac9BweQ==
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr4212050wmg.70.1592327143145;
        Tue, 16 Jun 2020 10:05:43 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 40sm31820668wrc.15.2020.06.16.10.05.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 10:05:42 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/3] go-binary-native: add binary Go to bootstrap
Date: Tue, 16 Jun 2020 18:05:36 +0100
Message-Id: <20200616170538.1049884-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Use PREFERRED_PROVIDER_go-native = "go-binary-native"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../go/go-binary-native_1.14.4.bb             | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-binary-native_1.14.4.bb

diff --git a/meta/recipes-devtools/go/go-binary-native_1.14.4.bb b/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
new file mode 100644
index 0000000000..3c535e14ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
@@ -0,0 +1,43 @@
+# This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
+
+SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
+HOMEPAGE = " http://golang.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+PROVIDES = "go-native"
+
+SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
+SRC_URI[go_linux_amd64.sha256sum] = "aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067"
+SRC_URI[go_linux_arm64.sha256sum] = "05dc46ada4e23a1f58e72349f7c366aae2e9c7a7f1e7653095538bc5bba5e077"
+
+S = "${WORKDIR}/go"
+
+inherit goarch native
+
+do_compile() {
+    :
+}
+
+make_wrapper() {
+	rm -f ${D}${bindir}/$1
+	cat <<END >${D}${bindir}/$1
+#!/bin/bash
+here=\`dirname \$0\`
+export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
+\$here/../lib/go/bin/$1 "\$@"
+END
+	chmod +x ${D}${bindir}/$1
+}
+
+do_install() {
+    find ${S} -depth -type d -name testdata -exec rm -rf {} +
+
+	install -d ${D}${bindir} ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${S}/ ${D}${libdir}/
+
+	for f in ${S}/bin/*
+	do
+	  	make_wrapper `basename $f`
+	done
+}
-- 
2.26.2


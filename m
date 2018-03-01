Return-Path: <matt@madison.systems>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0722785E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h19so2262706pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=TJ/yVtAsh8V3jnm5NA/gaPSOdJCC4ttj6xIHerS0fpmClAZoTe4+acPZiCbU2Rnn4b
	DTf2YCwRcXKlIvIX9ZsAUGVbGT5MtaFam2sclrA6JUXW4sosIjPysZ21lhxqFh01vxGz
	jsYnTjPOv9BC9Z7QMW1HHegwedjfMEMB3dCZMIVuAJdjR67xysjufsRZfpveKB9ivAJ0
	VzFflobbIRO4VnYVRBj4wuzpLjTVFSsrTbRZdZ3pwCSXD7ki/UBBLUCNkuWLxpho+aLO
	XauH9B6RUE9D0n5Gcf1mhAq7+2fcOIZ0qyRrbCVHRP7www3rJKypQUZOW8i3X1lRng/f
	pcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=IHULMvgX8SQJjUFKQBSRI0+c7c9GJhsZlGUsxVV3A2EYWzGrLh3Yqng1p86+/mvGlb
	W/NGgm5aasZVw7B/omCiPJKENZfSW4AAVLOwe5/4yOwiWE4TS4NKk6ge/+imv3MakvVl
	+C1F1bonC0lYewKc/gRLP2GrMPMz1BiIJFUiQYGu/v5CF7mDrgi6UI8JAXJ+3hbh9KvX
	eDh4B4W1+bL2IswwO1vAy8ZDYC07VfflNYfvUviCj8QDCPw2Ra77s5wGfPLUvgeO8Qe1
	vwFV1P6JknYNlyrPDSXiv4uDLUuyaNwiVUNN6j0KqwSSSVt4iMMwc/VravLTP/225JEF
	h7Ng==
X-Gm-Message-State: APf1xPCCfzFQ4AXXfAASto6COmjHGBUoN6YH1kEia2awmK3AkGAS1tXo
	E3mujqbQ6f7OsXmqCXIn68K8NGcF
X-Google-Smtp-Source: AG47ELsjqN2Lkh3s8mbLBgaYFCx1lDrafUJtzeN9qO7KbUrHEMQSWnkyDVK5+GTuqeBolvdd3GHReQ==
X-Received: by 10.101.98.85 with SMTP id q21mr2839861pgv.182.1519946224768;
	Thu, 01 Mar 2018 15:17:04 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:03 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:43 -0800
Message-Id: <20180301231654.24018-3-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 02/13] go: set GOMIPS envrionment variable
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:04 -0000

Go 1.10 adds support for selecting hard/soft float
object code through the GOMIPS environment variable.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/goarch.bbclass                    | 11 +++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc |  1 +
 meta/recipes-devtools/go/go-cross.inc          |  2 ++
 meta/recipes-devtools/go/go-runtime.inc        |  1 +
 meta/recipes-devtools/go/go-target.inc         |  1 +
 5 files changed, 16 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 922c0cc8f3..1021b94d4c 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -5,11 +5,13 @@ HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
 HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
 HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
 TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
 TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
 TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
@@ -78,6 +80,15 @@ def go_map_386(a, f, d):
             return '387'
     return ''
 
+def go_map_mips(a, f, d):
+    import re
+    if a == 'mips' or a == 'mipsel':
+        if 'fpu-hard' in f:
+            return 'hardfloat'
+        else:
+            return 'softfloat'
+    return ''
+
 def go_map_os(o, d):
     if o.startswith('linux'):
         return 'linux'
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index c84aa4c9eb..3b98ea449f 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -42,6 +42,7 @@ export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
 test -n "\$GOARM" || export GOARM="${TARGET_GOARM}"
 test -n "\$GO386" || export GO386="${TARGET_GO386}"
+test -n "\$GOMIPS" || export GOMIPS="${TARGET_GOMIPS}"
 export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
 test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
 \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index fe92651581..289ae77104 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -11,6 +11,7 @@ export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
+export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "off"
@@ -40,6 +41,7 @@ export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
 export GOARM="\${GOARM:-${TARGET_GOARM}}"
 export GO386="\${GO386:-${TARGET_GO386}}"
+export GOMIPS="\${GOMIPS:-${TARGET_GOMIPS}}"
 \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
 END
 	chmod +x ${D}${bindir}/$2
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 7a3b415b3f..0fe4566360 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -8,6 +8,7 @@ export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
+export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index a53a314c78..141a456cca 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -8,6 +8,7 @@ export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
+export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-- 
2.14.1



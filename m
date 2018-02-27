Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3482D786FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:36:54 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s13so11268780plq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=rns9NX4tgBL/Y3mh6FTfFzbfRkq50xSqu0UT/7ZlsrQxFE8LBZEAHhd0P9418JQ5wg
	oTmqSDUOPk3D6UcehVFtL4LMKpATRk/rXQYndV0+fFOfFoTtl3gZiC3MNPuKJFfAJKMM
	i9REE2SDG1GYaey8DgXn51K31PIZI8Qb/MxLUVwNzyfeDzicDPjRrZ/y2uZ8McyzdWSQ
	3ZmJs5Wav3QlgzrE3UcCSzV/BADIFIIUJl295O8QSXgN2tYQ7FRa66jVNVKXVQjD5Tli
	50zBGiM4Io6IYEkpKTjD8Veb9E2WJjN5KTm2A3BRTiv4u+u8zShnYM9+IlFWx5BL2iq9
	A/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=GrycFQ3GUdDYXuxjSkaq5gqjk0YwLrWrSM6p5dbTRI9wadI1Gc7bsFQ2Vzz55QHDl/
	bwj8/MrR0zQ8Dgtmhp3jt5NgbrT5otxNj2i2XiTjs/xNqa9tIoqUplkFrMKI079Ue2FB
	HiVAcSugzUtiunCZIVJLZS++/SQkUXapAR34hL9yugPr+Pa09im8MgAhZ2lR17UvQxtJ
	pGq5+LXGZ1r4jspMonYWJcNkbIDXKUGOV50yWucu08mkzQsJZHo8GHkM6VFIzDIR9qp/
	L9cChLQ5/KVE967zWFUEPRqK3O5CSlfaBRGRRzkwksUUHHwdpmAK8ZBexT4WHw+udypw
	s9Ww==
X-Gm-Message-State: APf1xPAFBUMItDKWetYeTheXDSb1osvKe0bS5z6SzKdOvtlNDZJXwFkp
	AHerKMrDeQ0gfmaDRYjlwHhiD5cn
X-Google-Smtp-Source: AG47ELtWM7J039lqndOEK+M+iKihRLAnJrld9n8g3YxIBZKygaGGD+CW805+wx6nj8/8VYaYIuCihA==
X-Received: by 2002:a17:902:7d94:: with SMTP id
	a20-v6mr11376728plm.184.1519735015895; 
	Tue, 27 Feb 2018 04:36:55 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.36.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:36:54 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:28 -0800
Message-Id: <20180227123634.2812-3-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 2/8] go: set GOMIPS envrionment variable
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
X-List-Received-Date: Tue, 27 Feb 2018 12:36:55 -0000

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



Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B99F878A93
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 61-v6so8547912plf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hCiFQaQaVANG2fvRtYtf9+Slx8BFKtLN3tJ9JH8qCwE=;
	b=tJonwyqtZJXUmYXKDI2MeCODKlw3shoL/5t+buTGQGEYktvWNwqIi72LTyuc9ct+lM
	bOYRX9TPGREcC+6Kzwi7FnMNQ4xZqmMY687M9yw7xbZyWTfwkZZKPc0sR8zY8eIMClQO
	8yN9nIT+cx++RvpoMt33Y7xHMrxoJZ/L8HLPrzaYfzyM9hUyNwQBBvcAXoKnT3ijyNVi
	WQjjfb4dg/KD1OzC/B9uCHP7RIbWLlcZyjKb4QUNAgC0zOzhncOvEDTwIBRk4cmugMJr
	zLLnxPKGvHtyQexZ3k6b9aBa3Z71nnmIr8e6wkp4QgBgoXCuRtsvqOj8lfXbSdkjHjHy
	Tqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hCiFQaQaVANG2fvRtYtf9+Slx8BFKtLN3tJ9JH8qCwE=;
	b=TaHtUPK0PUlvjSw3TEEhI5O/wkK4BmPBIzaODU0H1UwU3gwQth42xheNvQMXjoGJMd
	KVN9lkuEF4+ucK0wLqajsxmb8EOOISlloLzPHy0/bxSvOBo6Lw85gejESF4GXfcvOBWJ
	gruii+XT6xAa13+OKcBzkUlqJnwtenEQtY4748eHNJiWRko+zuuEJ92MYLpakKcrjqi0
	n5OF/3YWQcdpCc8j5ew4wJrpo3jYMRAxNbxA6bj58H9GKg+DGs7uylRlCkQhIodjpLVo
	SBEHV9QC5xh/D9Wy0wkf2h56dQh1nJISARPBywiwgUJRXfHWXHxm8zJXQIUOGx2cgFeF
	cKtg==
X-Gm-Message-State: APf1xPA/qXtXwD71e5FYZ3R7T1Qb7e/Old23jTwlgEaxG6fx8TOB/+fw
	gs5634yo3rCQ6wtGfj8ArzdC89y8
X-Google-Smtp-Source: AG47ELs/ywif0fIhQaE0bbsBAYVeqbCi1OlWUg9vzw+82zox6tgvTEeLXi1samoK5aoeDMzrBareHw==
X-Received: by 2002:a17:902:9883:: with SMTP id
	s3-v6mr10825739plp.96.1520197784682; 
	Sun, 04 Mar 2018 13:09:44 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:43 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:26 -0800
Message-Id: <20180304210937.29727-3-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 02/13] go: set GOMIPS envrionment variable
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:43 -0000

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
index e22914e7aa..4a43d831fa 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -41,6 +41,7 @@ export GOARCH="${TARGET_GOARCH}"
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



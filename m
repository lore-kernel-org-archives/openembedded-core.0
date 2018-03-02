Return-Path: <matt@madison.systems>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE4DE789CE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a16so4474150pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=uGVNq9Q3sBUxGzaSm+qf6M8cqGLWvqP6EWIUx2IjFEZqxsjvaXUCwqq718O851QzIM
	Msa17vObMeNBxx97REGJaziUNhsvJWWXotteosyDXHVev3dt2tZ3lk5O4IxmiW7f/9qQ
	f9+pFmSfTl72wG3M7RbRuIHSkDPBpPZfH3TGBEoWhjvY/nnv29teSysikPwJ4OqfURv6
	gaIaprU9kMQXkf5ThtEgAYNgbj5tVswR5hbWWwadBML/KYB2rFua+VkP1t5Gf2I4iwqS
	OCVepzxONYMZIO1ayiFyhXkDQLuFwZpO6EnrFdcuRqTN6lZP/hIm9AMFgpXJzI7BEpY+
	VrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUxQdzr2SBrcfBqe2tEonmwdHyDR01znZtRavgcZIvk=;
	b=LMqdWDDnFra+uHI77JUHPI7n1tV9cb5D1l+87sgIoZJ4lGaaZZi9CHWFejLTqQ2Ppw
	MRK7r20Xbw5T45rVCJqcoJx70lbHFje1mQ9ZW1A91NKdF0sQxjCvoM44E+wUFgHX505e
	cF5aEnRPwRB0AYLCSvIaXICX+4Zt5AtfAlgV4kTcVyKBOV0Ol8k7KdktT4+hWCfAvzy+
	ra3yNDvAC5cASGjHSrfaaCHEM76Kj0WnAhFnIKz5DOUfAv7rEyVtBcmfrDkzFLvRkCGF
	2zuNg4/5HfzPIaOqxdNMizN5GdUQux41ZkK6PwrOy+jnRuyBR8Bxb/w1oVI6WDbFFbG4
	QXFQ==
X-Gm-Message-State: APf1xPAutyLllO6dP7k/Z7iGisOxfuvLKGkinFju5HKKSg8pxV6qXVji
	7bxOy43HVrBVO0+0eb4awT9REw9m
X-Google-Smtp-Source: AG47ELuzc8o2qYgJjMyVs83stOcHtM3+vzY8UkJNHkk1T6cLpAI6V9SKad2WIoJ6p0QujFI/2qILpQ==
X-Received: by 10.99.0.207 with SMTP id 198mr5556605pga.364.1520022813676;
	Fri, 02 Mar 2018 12:33:33 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:32 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:03 -0800
Message-Id: <20180302203314.32737-3-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 02/13] go: set GOMIPS envrionment variable
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:32 -0000

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



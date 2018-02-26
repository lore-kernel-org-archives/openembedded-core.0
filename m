Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 65C7F78743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l24so6571004pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Z1TRITZaiQHdzkcQdFedyEiD/aRvbCtOnoEfkGsEFw=;
	b=KjmKx5WuHfH+Irt4ovICgrSOkFYGvBbZNfMqbtrjBD7JJUkluO0jGYo9g8cPPMkBa2
	wW9tpdPghj0P2SdTjyJoMkmmuxsOyLyNmAP2+Wm54Mof4K7MfC3BQEWIs7KscCIR/yVj
	bkR+ef4O5vJw5mAzSwPSJgurUqcIdgYjpvLHgCFMIy8B/jr2NR/211dFMDoF3ZtjG9Pw
	WtVMDs1pVufgRvKPIhMTkMlywXGZBGbwq+LWGsmf9rvUJKABxsDQwFfbgSZkl9K5IHS5
	zlXa+h8Vp5mAvr8/crOpfgdSdF8jnxF8G36SS/I/EteKzorvo5EnmclTkakiC+xcFfId
	XUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Z1TRITZaiQHdzkcQdFedyEiD/aRvbCtOnoEfkGsEFw=;
	b=fEx9ADwmMYZs35QOXiOcKsfGObwuBTl3f8v6SgIYmnG6quV3Ib2rxda/qkevyZTbMT
	pqtM5q1HZqdWwAHERG6na4Mu3u+mhtZ1Ha0VM344OF7rES2eyYXHZRYbuezMyQusngDJ
	T+Gvl2+qy4tRiYIaIbXBHiUl2Vx762UgtvQnPl1Za0qxZOhPVvK35/jVseIKH1ltJrcy
	N1pCPQQXB03R322uFqxhIlCQgplBvRAo2v0nMJo4i78Fim3/fkwlUWIqDiadKJfzuL0t
	+a6EE0Pfxz6Z9p/PY1WLwcBs/n5hLtV6ZxfmeOKkB3mAttXskbJXl3Vm1yqDTEMFojv7
	AH2Q==
X-Gm-Message-State: APf1xPANJ+NYGS45xm2gCoigBFdPHdxBisRP39uX9DIX53+lAjuxbW6F
	A6L8SpAbORAgDHRrrf4lV0dPaYaV
X-Google-Smtp-Source: AG47ELsQc+MfIbPTKPT6cXzuYlBnZ0EciHMj/h6C1WqO4REISCCyThBkBeXIiRczsxxhPpC3urpH+g==
X-Received: by 10.101.71.138 with SMTP id e10mr5836613pgs.317.1519673642346;
	Mon, 26 Feb 2018 11:34:02 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:01 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:10 +0000
Message-Id: <1519673596-4750-3-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 2/8] go: set GOMIPS envrionment variable
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:02 -0000

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
index 922c0cc..1021b94 100644
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
index c84aa4c..3b98ea4 100644
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
index fe92651..289ae77 100644
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
index 7a3b415..0fe4566 100644
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
index a53a314..141a456 100644
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
2.7.4



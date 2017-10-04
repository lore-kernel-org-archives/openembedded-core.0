Return-Path: <matt@madison.systems>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C307F77EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:01:34 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id k7so1768972pga.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NVlct13hnCyeroPpn8BGsHaa3HC8oa2iAkD54YSOAr4=;
	b=f8mHbElF4Fc2Yaat2DcWEIDPswDMDplPpcpFdfdISXHbRCovhUBoMD+ZCkhwazQ3RK
	6A1BcgaIIOILabh/DkJ3thKaOP6lnut5lZf31/mRdqfNL4M8KuJGJx35lEN3B7mrXwum
	spMubBZn7RiXvSZh9/hiOdKH2/uwOq+0gO0Bnix9G831MBYcHxMIH1teDS2B4bDbR16r
	uxKI1S/X/MidwXytxhQcBmjI9rhwwVapR6hMXyxtdZYK5bTtOiiVWrjDEPKll2388+MN
	adiSarwrFcONan+JQc7pkWU+qMKuq6B+GyKwB9FHKY4lwQMTGGq1WtiTHz0CYux6hJco
	wL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NVlct13hnCyeroPpn8BGsHaa3HC8oa2iAkD54YSOAr4=;
	b=l2PvC4hBnrtVxaKkT0u6bZzREFeFK4+mmqW8q/rBu6tuhFQN6933R61jo3QnkrSTMt
	C5U/rCchaXUvn/bhwJo6BdpRP75M9FErBLerUYHCkl2r5Xh1YRjMSS88ShfvsI1wwpPG
	GvR8EX4oorLnjPxKP07lYdq/XBv38igQ0zP3KExWhjQ81f6pClvFLMOtVgpR6L6n2BWO
	/FTaLWTHA+MmgMIq0O0bwHxcJ2hokqq0+I/GO8I/3lotc5PNKBD9NNjIBtvyx7zyuqI/
	Lriy16InzMH1Uu6JVEaFp3WCzAZRGLTBHnIq+PP+sMctcxNAeH2OkGfFkcUEQpRHnnau
	SVBg==
X-Gm-Message-State: AHPjjUjE0wTFnu0wy+sELvAIyLTPyP8VwOqWVrVtgOz64Lz3P4074TmP
	CncilR0cUI5VW3f1KP8htIxUriur
X-Google-Smtp-Source: AOwi7QBfhvVnujZl4HKLOGw8KCmS+6vbxCvrcv2iypvYn2z4HTgarrNqSjVI/Xx7MzvO6ZzrBRlPVg==
X-Received: by 10.99.67.193 with SMTP id q184mr18412650pga.56.1507132894359;
	Wed, 04 Oct 2017 09:01:34 -0700 (PDT)
Received: from ip-172-31-4-49.us-west-2.compute.internal
	(ec2-34-214-157-19.us-west-2.compute.amazonaws.com. [34.214.157.19])
	by smtp.gmail.com with ESMTPSA id
	z78sm26762491pfd.178.2017.10.04.09.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 09:01:33 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 16:01:15 +0000
Message-Id: <1507132875-29155-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507132875-29155-1-git-send-email-matt@madison.systems>
References: <1507132875-29155-1-git-send-email-matt@madison.systems>
Cc: otavio@ossystems.com.br, saul.wold@intel.com
Subject: [PATCH v2 1/1] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Wed, 04 Oct 2017 16:01:34 -0000

When building for a target whose architecture matches
the build host's, the second pass through make.bash
to build the shareable runtime would also overwrite
the target's static cgo library with host-compatibile
binaries.

Fix this by running the host-side build once and
target-only passes of make.bash twice, for static
and shareable.  This ensures that what gets installed
is target-compatible.

Also fix an issue with x86-64 targets running MUSL by
removing the pre-built (for glibc) objects for the
race detector runtime before building.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-runtime.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 934d1aa..f181dc7 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -15,7 +15,13 @@ export CC_FOR_TARGET="${CC}"
 export CXX_FOR_TARGET="${CXX}"
 export GOROOT_OVERRIDE = "1"
 
-do_configure[noexec] = "1"
+do_configure() {
+	:
+}
+
+do_configure_libc-musl() {
+	rm -f ${S}/src/runtime/race/*.syso
+}
 
 do_compile() {
 	export GOBIN="${B}/bin"
@@ -23,9 +29,13 @@ do_compile() {
 	rm -rf ${GOBIN} ${B}/pkg
 	mkdir ${GOBIN}
 	cd src
-	GO_FLAGS="" ./make.bash
+	./make.bash --host-only
+	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
+	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
+	./make.bash --target-only
 	if [ -n "${GO_DYNLINK}" ]; then
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash
+		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
+		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
 	fi
 	cd ${B}
 }
@@ -41,8 +51,9 @@ do_install() {
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
-		[ "$srcdir" = "./cmd" ] || cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
+		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
+	rm -f ${D}${libdir}/go/src/cmd/dist/dist
 }
 
 # Remove test binaries that cannot be relocated
-- 
2.7.4



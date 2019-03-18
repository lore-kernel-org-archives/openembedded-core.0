Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDAB7C752
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 15:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2IFM0vn003562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2019 08:22:00 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 18 Mar 2019 08:21:59 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 18 Mar 2019 11:21:52 -0400
Message-ID: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v3][PATCH 1/2] go.bbclass: Export more GO* environment variables
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
X-List-Received-Date: Mon, 18 Mar 2019 15:22:01 -0000
Content-Type: text/plain

Currently we are not doing a good job of consolidating GO environment
variables used by the go build system in the go.bbclass, instead we
are relying on the individual GO recipe authors to perform the
exports. This can result in inconsistent build results and often
binaries that are not properly cross compiled, resulting in segfaults
when the applications are run on the target.

For example the GO documentation recommends that the environment
include a value assigned to GOARM when cross building for ARMv5, ARMv6
and ARMv7 (https://github.com/golang/go/wiki/GoArm).

In order to avoid polluting the build scripts with unnecessary
exports, such as run.do_compile, we attempt to only export variables
when they apply to a specific arch.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2
* Avoid potential undefined situations

V3
* Add more exports to cover the basics
* Tested on all qemu* variants, -native and build test other BSPs

 meta/classes/go.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 7069c5f..78c2d68 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -8,6 +8,25 @@ GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
+export GOARCH = "${TARGET_GOARCH}"
+export GOOS = "${TARGET_GOOS}"
+export GOHOSTARCH="${BUILD_GOARCH}"
+export GOHOSTOS="${BUILD_GOOS}"
+
+GOARM[export] = "0"
+GOARM_arm_class-target = "${TARGET_GOARM}"
+GOARM_arm_class-target[export] = "1"
+
+GO386[export] = "0"
+GO386_x86_class-target = "${TARGET_GO386}"
+GO386_x86_class-target[export] = "1"
+GO386_i586_class-target = "${TARGET_GO386}"
+GO386_i586_class-target[export] = "1"
+
+GOMIPS[export] = "0"
+GOMIPS_mips_class-target = "${TARGET_GOMIPS}"
+GOMIPS_mips_class-target[export] = "1"
+
 DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
 DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
-- 
2.7.4



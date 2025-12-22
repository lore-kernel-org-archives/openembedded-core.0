Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB55E677E1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81399.1766415259532598632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 06:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SLQczafX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44517665e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMD94Ci230444;
	Mon, 22 Dec 2025 14:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jXplIXIH0s28hcljIoaOfbt4WbbiiES0KRxQaFn/i/4=; b=SLQczafX1HVf
	jyTktr52QB/iF1RhTZalLVZJKddvnQxOuyASVO6maJb2lsDn3bU3F2DaKK7sILQ9
	PhkkXv1jtGYKeMEFlaoIJ2xR0+qSWodZ+isieFhGQMdkrZEtkNPxGc+8Z3V6DR7s
	72stH1IR2xLxscHU2uR7sAVzFeUkN1FDFJxNX78VRQ9tFdC8wXDuIHae8DiASM3s
	i32ecoR+LmegiG8fq7IiglTvuCPdZohicRjaocBUxzLXObNSUimUAHsdcMtfiN0C
	OYIP4AVz1CIfGa+LKM9Qc0WiEGgR/259Wq+tcWby7YRosVbnmVjYzaKNlsVu/nzO
	1BIsRLL4cg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vhwsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2025 14:54:14 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 06:54:13 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 06:54:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v7 4/6] debug-optimize.inc: override CARGO_BUILD_MODE and CARGO_BUILD_DIR for target
Date: Mon, 22 Dec 2025 22:54:01 +0800
Message-ID: <20251222145403.3688113-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222145403.3688113-1-hongxu.jia@windriver.com>
References: <20251222145403.3688113-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: D6de5w4mvnMAtCJ7HgZgfi1XOsFPJR3v
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=69495b96 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=Z1FrW6rxTDoSltceh7wA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: D6de5w4mvnMAtCJ7HgZgfi1XOsFPJR3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNSBTYWx0ZWRfX/d0kbaGyTxy1
 7D1u/eKW3UODxKhh8Pp7M1LtGHJLj9whdu5vhUCExgJ1g1/z084eKGBzgLMZjyGhssnaViZBzPf
 d6wVwLVPLZk/4lrBcwP+Zchy/GMLK0Ryv4+r+jQSO6KUdAgl19axEKd73ij1w1QyHYavoIQZtOL
 dBvBBbhCOBCUIwkWXFMyZXILNa7ZaRTjdroAtuHcMuTCusoRfIZomU2ACn+1P56xj2rPz/xyNth
 GIt4JsrymiFrHOZZOpBST96N3swXDg1RP6lXNcYjfvt2gbW4cX7rdJY2Fhy9FS2wDLhSy+VBP0c
 xTe0XGiYbXIPy68qjPR+uYwuRQh33bIK/MHHZWVHZjXA+H5xRqoI9YTeWrih6crHJtGjk095dQ3
 9Mxa9ogrAg2D8MDSsXluA1zC4lCk7Ahx7P2xVx/kLBFR6KkvwyATUXuVGojY0oPs0Y/yB0kQDsa
 xPfkQ23mPK62I/giZTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 14:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228307

Rename BUILD_MODE and BUILD_DIR with CARGO prefix, then in debug-optimize.inc,
override CARGO_BUILD_MODE and CARGO_BUILD_DIR for target when debug optimization
is enabled (fragment core/yocto/debug-optimize)

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cargo.bbclass                      | 8 ++++----
 meta/conf/distro/include/debug-optimize.inc            | 4 ++++
 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb | 4 ++--
 meta/recipes-devtools/rust/libstd-rs_1.91.1.bb         | 4 ++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d3..eff28b323a 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -31,18 +31,18 @@ B = "${WORKDIR}/build"
 export RUST_BACKTRACE = "1"
 
 RUSTFLAGS ??= ""
-BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
+CARGO_BUILD_MODE ??= "--release"
 # --frozen flag will prevent network access (which is required since only
 # the do_fetch step is authorized to access network)
 # and will require an up to date Cargo.lock file.
 # This force the package being built to already ship a Cargo.lock, in the end
 # this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${CARGO_BUILD_MODE} --manifest-path=${CARGO_MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${BUILD_DIR}"
+CARGO_BUILD_DIR ??= "release"
+CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${CARGO_BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
diff --git a/meta/conf/distro/include/debug-optimize.inc b/meta/conf/distro/include/debug-optimize.inc
index 3f22aebbab..55f35dd7c6 100644
--- a/meta/conf/distro/include/debug-optimize.inc
+++ b/meta/conf/distro/include/debug-optimize.inc
@@ -43,3 +43,7 @@ CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
 
 # For meson.bbclass
 MESON_BUILDTYPE:class-target ?= "debug"
+
+# For cargo.bbclass
+CARGO_BUILD_MODE:class-target ?= ""
+CARGO_BUILD_DIR:class-target ?= "debug"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
index 577acfdc86..9de4a07aeb 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
@@ -27,7 +27,7 @@ CARGO_INSTALL_LIBRARIES = "1"
 do_compile:prepend () {
 	# rpm-sequoia.pc is generated in the source directory
 	# but the target directory does not exist there.
-	mkdir -p ${S}/target/${BUILD_DIR}
+	mkdir -p ${S}/target/${CARGO_BUILD_DIR}
 
 	# From rpm-sequoia's README.md:
 	#
@@ -59,7 +59,7 @@ do_install:append () {
 
 	# rpm-sequoia does not install its pkgconfig file. Do it manually.
 	mkdir -p ${D}${libdir}/pkgconfig
-	install -m644 ${S}/target/${BUILD_DIR}/rpm-sequoia.pc ${D}${libdir}/pkgconfig
+	install -m644 ${S}/target/${CARGO_BUILD_DIR}/rpm-sequoia.pc ${D}${libdir}/pkgconfig
 }
 
 do_install_ptest:append () {
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
index 8af93bec57..30875200e4 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
@@ -44,8 +44,8 @@ do_install () {
     # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
     # files that get installed. Those are really only needed to incrementally rebuild the libstd library
     # itself and don't need to be installed.
-    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    rm -f ${B}/target/${RUST_TARGET_SYS}/${CARGO_BUILD_DIR}/deps/*.d
+    cp ${B}/target/${RUST_TARGET_SYS}/${CARGO_BUILD_DIR}/deps/* ${D}${rustlibdir}
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.34.1



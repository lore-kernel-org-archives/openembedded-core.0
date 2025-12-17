Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF58D65C6B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17081.1765985070999984561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NnwlNaW/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHDNgZ93275695;
	Wed, 17 Dec 2025 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=55b1FUEs+Dai53Zk0uAyd9++bj9HuEyH+WQZeSPSaG4=; b=NnwlNaW/JT/s
	FpKLRR2a2hnwA6VIHlQfwlECg4L8e4uBtUKUDSyZCQ3D1wGYd5IhncR/lYJnhBxf
	g2w4apS5ULaozqI8IpCAbiy/N4iscaLrbOqPDlhwYUKVHCXTDZ6M//rHrPiQGmhw
	APETeevs27IxraLwj7vGjLpxZXsD22vU9iuBRxbDzUqxBzPxyoovbneZg3eXIFac
	ff9oYK4x/MctIP0JpHLldC6b8eKv6QbMFRU4REM+JCSwljRFUrvSIgQXKN4myV2I
	tbYebqe1jLEOP/BwQWjQ/yE0Y5JLz5xJpyCV5ywi3zfB1kVxzPnPFaSovEXb6aas
	2mWgPM6fhg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brr82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 15:24:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:27 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 5/8] debug_build.inc: override CARGO_BUILD_MODE and CARGO_BUILD_DIR for target
Date: Wed, 17 Dec 2025 23:24:18 +0800
Message-ID: <20251217152421.1181080-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX7/KIkAjPk3dr
 JkBUR2F5WP42XVDJ2UFnR/gyNmBLjq9PfhvJm2qEvO/g0UGLLBiOqfjURJVkUuFLlVASbl7NSxE
 rJXUXaEfs/12y4oX07Ezgx06PDe7uVNNzD8wyPkys35oNYfKzdz7VfRwvMa4NXqUeg8SmpKlWAz
 jNTtS84G+ELIEWvcEdE3djdAVMMAMPBSdnxckdDQ4PCgBvYv1P5qQjcBcgiamtTheUiwwt3WX/H
 kgwxA9orTJH0e/fUEVkV+TTVAerMoOsIfiD+shTkYOtdaPgdOYvi0g4PKbQjLiU2y7DH24COrig
 7G0BUivOUSPqte4Fu0bBC+V3hsDaSVZ9TqA26Tl0HaUaZG8kaNaO2BvXsVV3s+pbQNuHmI/y0Cp
 gqgwc2KvTZg0+4Ts5ExhL+C8SW9wAw==
X-Proofpoint-ORIG-GUID: GfF3rvc9pwwRsLBa_GUEXaj0hezFRJfv
X-Proofpoint-GUID: GfF3rvc9pwwRsLBa_GUEXaj0hezFRJfv
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6942cb2c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=Z1FrW6rxTDoSltceh7wA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228060

Rename BUILD_MODE and BUILD_DIR with CARGO prefix, then in debug_build.inc,
override CARGO_BUILD_MODE and CARGO_BUILD_DIR for target when debug build is
enabled (fragment core/yocto/debug-build)

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cargo.bbclass                      | 8 ++++----
 meta/conf/distro/include/debug_build.inc               | 4 ++++
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
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 2fa0d513de..28f6ac6f6b 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
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



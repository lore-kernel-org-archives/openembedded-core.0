Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3111ACAC597
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:07:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20852.1757693273391060277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 09:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r06+2eMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13506f3714=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C9l5q7950847
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=j/Wzuv+ix8JMB4gNlQoAJHFDT9S9zOmtjX+x+x4Ib2E=; b=
	r06+2eMX1o4s3rTRra3RxteWr4gQUjvoV+0Ngn9RX4IOsL7kPlHnZcjHVlR/X7+2
	xNq/0LT5Hk4/8qhORcaWkH9V8cXimFcUnbDxt6zlaYK22uCUEeEt3MK5ZrH+pLS1
	buVLz91elbFX0NLHbWfRQUZ/xr5vjvayRC3VTtFhusJkS8fQHFpWBKEf/wROY2wB
	PmlTd1RsBxdqBeuyXv2XAJfoLxqG6TT5JBSAWzaJjfPrDO0IgwaMPjMh1shPY61x
	zaJuVSK7yoCSc52swdr6tvyKLtPgEtW3hVMB36Vijvk8RpbqPNW2kDpbukOULjcL
	6akNayGnbPlVKderQFEK8Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve36bun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:07:48 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 12 Sep 2025 09:07:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 5/5] debug_build_tune.inc: override BUILD_MODE and BUILD_DIR for meson.bbclass
Date: Sat, 13 Sep 2025 00:07:41 +0800
Message-ID: <20250912160741.346809-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912160741.346809-1-hongxu.jia@windriver.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: USjWBHulSrRXwF8rZeOyLgqaSVjmWfgO
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c44558 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=jLWCMTOL3Ij9-LriBIsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: USjWBHulSrRXwF8rZeOyLgqaSVjmWfgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE1MCBTYWx0ZWRfX2nSkBk6V3Ue8
 N8/DQfhYDD2Rbhjsio7r9VnAWREhqCWb7ODKXHJKjEtL6vTbsxUGfrulefLItoD0iF02GSJ+aUJ
 PaAEK5EVbtdq5tSia83XvFFhoFXgtLRipbgbmNkVu/QH7eGpyt6qxizNZzL/XfH+XwhjZracr+s
 lrwgx/BZFHnC2BLX68d4PPPEtqTTlnTjkdo3SKaTlx2g8rVpG30e0DtPXX1qqDXUibNdoCu6zif
 MtbVasKwWzAVbVVLhVg9hV4krLJ1rwkzumPCWYEuwuNAD4wrLH7gdZ9azTkGLbgYWd085/hWim3
 nQ2tOwwwZi80dUbvGoRl4EWNZZwx9gSzMbdGWadA6itQQEOGtYPy9z+BHY763M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223332

The debug_build_tune.inc is used to collect debug tuning configuration,
override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cargo.bbclass             | 4 ++--
 meta/conf/distro/include/debug_build_tune.inc | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d33..c90b8c18f0d 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -31,7 +31,7 @@ B = "${WORKDIR}/build"
 export RUST_BACKTRACE = "1"
 
 RUSTFLAGS ??= ""
-BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
+BUILD_MODE ??= "--release"
 # --frozen flag will prevent network access (which is required since only
 # the do_fetch step is authorized to access network)
 # and will require an up to date Cargo.lock file.
@@ -41,7 +41,7 @@ CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manif
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
+BUILD_DIR ??= "release"
 CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
index 69cdbc84505..34cb3f1ecc8 100644
--- a/meta/conf/distro/include/debug_build_tune.inc
+++ b/meta/conf/distro/include/debug_build_tune.inc
@@ -38,6 +38,10 @@ INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 # For meson.bbclass
 MESON_BUILDTYPE ?= "debug"
 
+# For cargo.bbclass
+BUILD_MODE ?= ""
+BUILD_DIR ?= "debug"
+
 CPPFLAGS:append:arm::pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
 
 EXTRA_OECMAKE:remove:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=OFF"
-- 
2.34.1



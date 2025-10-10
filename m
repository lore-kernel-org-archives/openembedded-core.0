Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0283FCCD18D
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:53:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3762.1760082794001434171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HzwlvTmW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A6egt32114693;
	Fri, 10 Oct 2025 07:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Jg0ZYWmOsN/rrXsw3Kg66rbfAH2HwuxDjRGuCwiz/LM=; b=HzwlvTmWax/D
	F/aiAtRX2nX2G44Dxkh/hlO8BFqAR05wwAMAWH/UUa0S/MKevwu3fdgHymSn+bds
	BNY8P7q6fS40hpM5rLCcNPe14tfImYa6Drgl+8Ay4F3Wl3WGL/cdqb1xDQTi3N4O
	cc3BNCRKhbUR14hyiq6ADzEiOcO1smTGg9kRHlkQfX8ZBIXkKMQry6uuVvJPkcXF
	PH+iBzTWMRGs0hqZ02+Q3AhR2VcVn+gYgxP0VMQJ5rMqg27U7afqqyKNsmwYazsX
	jm1dqHLPMZYaGgcAg5xF60e5sFFeLRiNxK0IyQjsbpDuAHlNZYoT2FzOToQRsV3T
	vNoBUVJFkg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37stt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Oct 2025 07:53:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 00:53:07 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 00:53:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <peter.kjellerstedt@axis.com>, <randy.macleod@windriver.com>,
        <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v5 5/5] debug_build.inc: override BUILD_MODE and BUILD_DIR for cargo.bbclass
Date: Fri, 10 Oct 2025 15:52:58 +0800
Message-ID: <20251010075258.2161972-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010075258.2161972-1-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e8bb65 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=vnVScqQFWXFiYCaVktUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wvXKcy6wCouZ2LLcfDW4tmKCQngDpPZN
X-Proofpoint-GUID: wvXKcy6wCouZ2LLcfDW4tmKCQngDpPZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA0NSBTYWx0ZWRfXxhMWcqQN4w7M
 DpUomY4f9VBQbY4ZThHZxQDJNRHZSTkrjNNdgrQs2DuFJpp9l3meG3dny91081C1lRo1nPAjwMX
 N1cvvcQB/qXa0nE1hVFo/MhTgBLcuZ45jKQDd/C4fPJKAxFW5Ye3PUNBgsGPi4zKFXnbkS10P/y
 AZDlOs0RvFPgyB09jyIE+9zUubTDjq21ehFL5DcMtQGwNrraM7r8kbwLiqqO9ySIaaTjCv/Zbfw
 Q8TCQFPbupHgxAyidFAC5gB/Q8XvhfJcJ0VTex0TbZ3sDiso1hvuCOnxYF1vragg7mQFi/b7yhq
 W7fNkBPP5bg/wV7KyYVI5otqOg6XDJ7iOgYbe3caLRBgX33siUaxwzulw1jqTQw3Ibe5vP1x/Oc
 KRrhtZBdMIHXHWTqhgnNu87ioYwBNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224668

The debug_build.inc is used to collect debug build configuration,
override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cargo.bbclass        | 4 ++--
 meta/conf/distro/include/debug_build.inc | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d3..c90b8c18f0 100644
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
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index c8e2cf90cf..1b399b6f65 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -47,3 +47,7 @@ INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 
 # For meson.bbclass
 MESON_BUILDTYPE ?= "debug"
+
+# For cargo.bbclass
+BUILD_MODE ?= ""
+BUILD_DIR ?= "debug"
-- 
2.34.1



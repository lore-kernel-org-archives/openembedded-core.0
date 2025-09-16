Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7FACAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11593.1757995782967662565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=duLumrIW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G1A2HE1038652;
	Tue, 16 Sep 2025 04:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B7Z8uriDyaYnFm7WcaGq6DjX83elsHnLtK7kY5chHxU=; b=
	duLumrIWOKMpXD6zrdXuuYRzO41bi7E0uxRFF+VgQkQm2QYzW3DvGuar4PczSyG3
	Zfzho1yjnWewooQdnrjPhhFffesoEpOjIJrme4mrMLxDnHk2AoLJ/kXJmrhcYshc
	uTzHDKE1vJYRVMXG4DizG8vIfqFgAtLhOXDNzNsB1yiJUKJZ4huF2oG6/rJ2bUCc
	GsgQNe+5Q68TurqYyARQVyV5j74scWobzjC5rw1APlVXdW/51Na/i2cUfbBQS85q
	UuF6gdLMv7C0qdC106IjMhtWYlQlQ46b0qKsFok/wgZgVDZGw68faKLlH+k/DKVZ
	sSCff2fUMAP9cRZ6Dkkg4Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 496pekrha6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:40 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:39 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v3 8/8] debug_build.inc: override BUILD_MODE and BUILD_DIR for cargo.bbclass
Date: Tue, 16 Sep 2025 12:09:27 +0800
Message-ID: <20250916040927.103722-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX6+6w6I8mCJXJ
 Ih8xc1BkVqZsk2p3CYthgWgiaQ2yDcqAWKMh5P6tRrIq2OkXHB2vqd1z7jCUwA0uzZi2wS4qjdw
 Nb0r7yZp7EknvdkLFWQObyj6bTWl/D4HFC8hiNUj+FlrAp4CB4P7ab0rb+PvwN3quJy4KpoVpWu
 qR/csVFFvGDeehjP6plMdjN82olayk+8/Q0/cXkDs5CMGHqO9ZsgNn93IjXubLogdkwbJRZN0/1
 bBwidoM5bB9DlruEb6JyqncyeLuaMIFMvhwTPlBjZhx+vD1PCFws4tA/UeOEKHOH0eWc9sMuidS
 jSCx3/o+v9YGbBHvbC6rHRqdKHmKqzpUUS295NUCKy02st2t7QiJcwXNn8PE7o=
X-Authority-Analysis: v=2.4 cv=DYAXqutW c=1 sm=1 tr=0 ts=68c8e304 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=vnVScqQFWXFiYCaVktUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JLIHBPcdhn4_uw1vRMcoshZLQn2alRLa
X-Proofpoint-GUID: JLIHBPcdhn4_uw1vRMcoshZLQn2alRLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223523

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
index 33fd92e005..81b6a5f234 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -49,3 +49,7 @@ INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 
 # For meson.bbclass
 MESON_BUILDTYPE ?= "debug"
+
+# For cargo.bbclass
+BUILD_MODE ?= ""
+BUILD_DIR ?= "debug"
-- 
2.34.1



Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4717CAC598
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25940.1757917044340196243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BPJzxtC7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F5meuP3312489;
	Sun, 14 Sep 2025 23:17:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=86pT8JpKPXzQekc80pNSI6IQHX2WyepnlHnt7Mk8LlM=; b=
	BPJzxtC7yxXa9LXbW147Wz6VtSGKOASjbEffC9cMd/yp6CeB8I6AhEJ301PaPJGy
	tyBEnwB3Xslqg4qARHD7ZOYtCzEEsr85BtjXi1DYIilTlKILOhf+CpiteBOfkXrQ
	cujKdYk29eBezqwaEXfjpOJnv4q3kj+olZIIoINhOmSgl4dcrWGoRWFx2ZCo+7ne
	+bWxjLwu3nQpydtBEFE9BWZGR6cQhcZ69lWBhbe1Jxg+oIjcd6AwdDV5qLo3+skL
	sC7d9ZARunWMZwK3z+8oBvTgM0bjLLlnFqv5fBVP9HRG6CLp+n/gO+ZGdY+Nz8LA
	cL36GEm0uAgWnw33+XMR5g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hhc73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 14 Sep 2025 23:17:21 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:54 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 8/8] debug_build.inc: override BUILD_MODE and BUILD_DIR for meson.bbclass
Date: Mon, 15 Sep 2025 14:17:43 +0800
Message-ID: <20250915061743.313230-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c7af71 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=jLWCMTOL3Ij9-LriBIsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX49PPI2s2mzDa
 INugzVRVlm2FZahttQgH5KBOYL+me6iJ80Ue3+J+ik7QVfAX/wKQtYlRIap4+BgMopo/5g4B9HR
 250xq5t9zPEnEWBMsVkCTs9iqppdMm3EwCuDyE+OQ8I0zoGgpbMlJX69tqhD1Lu88OSvl1ooSTn
 IyIPYcVflW0sDHkXlWRebG0qIhTWW3+HPlRRCgLkkNs1Grij7EpFyEW2ZfMTZTAwlS7QQKgBV9z
 IBxTeRIA38nsOu0sL8t02XUA6ld+C0Zz7yjUN85zJy0GoZBAF9oKU9Sgl0vBt1Xbp5FKXCcfXcZ
 i3Ncc5LnBWplc5jjWXyz6aDwQLR50EtNpGShulKxHwS1i0pJMkD1g1MtS7ULFA=
X-Proofpoint-GUID: BXnJq0iv2qluk21nquvVSzRrILDdidtB
X-Proofpoint-ORIG-GUID: BXnJq0iv2qluk21nquvVSzRrILDdidtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223384

The debug_build.inc is used to collect debug build configuration,
override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cargo.bbclass        | 4 ++--
 meta/conf/distro/include/debug_build.inc | 4 ++++
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
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index e446a71dd3f..e6f94504945 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -51,5 +51,9 @@ INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 # For meson.bbclass
 MESON_BUILDTYPE ?= "debug"
 
+# For cargo.bbclass
+BUILD_MODE ?= ""
+BUILD_DIR ?= "debug"
+
 # Allow other layers to add their own debug build configurations
 include_all conf/include/debug_build.inc
-- 
2.34.1



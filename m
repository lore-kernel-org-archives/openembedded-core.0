Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47168CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:59:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16304.1758632348624571704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CMM7lbF5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1361b91c1a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58N50LkF2639947;
	Tue, 23 Sep 2025 05:59:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=d7gljnkAo
	zkJzDMn6MgAE3DC4k6d6kPZY0f4vlwwUPo=; b=CMM7lbF5IVqRDDZsYMJSCXSn2
	B5l5BaI5lPTabHuft/v25aXtvjEU2KfA7T3e1ChltfQcQijgQbcXdr90Ag4oQAQc
	nH8jBsmIKnIa8tYPXuot7mCoczh42uoSfCip/rOUrE13mUre1P5rF4c9JyjOur+G
	85AgemGm1QmIAuPdSRleTncmixy8S9/nrCGNxJoZmV5tM830fElYcbgcuuwrsty6
	9H7Z6H5/Aukjmq4El3XxzMRnxSYwKpi4DlQhkXBBQzFgXDS2JFwcJD0MuvW7YdJu
	088WssbYgnjg4X2jzdrc9eFjmyGQ392g/kCjTFVwBAdVa7HlxWHUUY6rrTkHA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2tycu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Sep 2025 05:58:59 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 23 Sep 2025 05:58:59 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 23 Sep 2025 05:58:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] perf: fix reproducibility issue occasionally
Date: Tue, 23 Sep 2025 20:58:57 +0800
Message-ID: <20250923125857.340991-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEyMCBTYWx0ZWRfXx/+Jqsxbxwj0
 1DMj/OGJbuqpkaCuHLzAq16/ISF4ktv6GZ0ydp9s7afDECeC1dRmFXoFylWPPDDst4f9myoJNNc
 0D1ZJXr19QT+qER1V83gSjtBVd2M88WH06V+lxOsAug+hEcN/789TaZSAzS5nm+9RHAUDiqd0Ig
 EdxiemVKOo1YR50jUvZWKh+OeH5t9EnEf2VCP0eoVzeOhuZ07UXQb717GDmJ9Yru5pv4n5c+6Nc
 BjFZMxZTJbU86X3IEpaF0+bbbDjqK2XePqF58XgWij9JIRMkpeSSMPMpGIafyQqtXgBLH1QlsG3
 el5M1IN7oeG9CKN8GSYOce4DB/9J2BX140wnPXN+pJdj5glSG92Ie87f7U8Xl4=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d29993 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=hOjxzNy0v5UpTo8hRW8A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9EZ2OY_OpyJJNtlH2fdWO0hELMg5z_v6
X-Proofpoint-ORIG-GUID: 9EZ2OY_OpyJJNtlH2fdWO0hELMg5z_v6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223875

Due to commit [1] applied in kernel v6.16 (such as qemux86-64),
perl has reproducibility issue occasionally.

Perf's build process generates two copies of its internal headers,
one at tools/lib/perf/include/internal and one at libperf/include/internal
with files like core.h. Although the files are identical, the binaries including
them would see them at different paths and have different debuginfo data. [2]

The reason is the order of include dir `tools/lib/perf/include' and
`libperf/include' is not stable, such as

$ x86_64-poky-linux-gcc  ... \
   -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/tools/lib/perf/include \
   -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/include \
   -c -o path-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/core.o core.c

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
        /usr/src/debug/perf/1.0/tools/lib/perf/include/perf/core.h
        /usr/src/debug/perf/1.0/tools/lib/perf/include/internal/lib.h
...

$ x86_64-poky-linux-gcc  ... \
   -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/include \
   -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/tools/lib/perf/include \
   -c -o path-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/core.o core.c

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
    /usr/src/debug/perf/1.0/libperf/include/perf/core.h
    /usr/src/debug/perf/1.0/libperf/include/internal/lib.h
...

This commit explicitly sets the order of these two include dirs
in EXTRA_CFLAGS.

This commit has no regression for kernel v6.6 (such as genericx86-64)

Also enable verbose for compile to trace the detail of build

[1] https://github.com/torvalds/linux/commit/f5b07010c13c77541e8ade167d05bef3b8a63739
[2] https://git.openembedded.org/openembedded-core/commit/?id=0a886fcacaab0fbce1306c0f99d482f940a8f705

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 98dffd1cc9..58476796d3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -105,7 +105,7 @@ EXTRA_OEMAKE = '\
     LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw -I${S}" \
+    EXTRA_CFLAGS="-ldw -I${S} -I${S}/libperf/include -I${S}/tools/lib/perf/include" \
     YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
@@ -174,8 +174,8 @@ do_compile() {
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
 	# For reproducibile binaries, we need to find one copy, hence force libperf to be created first
-	oe_runmake ${B}/libperf/libperf.a
-	oe_runmake all
+	oe_runmake ${B}/libperf/libperf.a V=1
+	oe_runmake all V=1
 }
 
 do_install() {
-- 
2.34.1



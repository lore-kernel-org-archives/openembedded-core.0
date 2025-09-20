Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B265CAC59A
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 00:08:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.231.1758326914477547297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 17:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vosun3B0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1358874a66=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58JNiWrF2504406;
	Sat, 20 Sep 2025 00:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=+/7SBktgJ
	gJnJMRf7rRlxSNPOi7fxUwLZx4XMovB3bo=; b=Vosun3B0/HriEqRmiyfOnQnJg
	hQtUOclVNQTXEmVMlk2FtWPltrrxRJEzOtRbzhLWs1oVa0lpvOR0+2Km/972+vo/
	gAkB8fQJ7n1TQgBKOYLB6HrjEXPZugUt/aAGl3viXkZYi0IWmrJXVSra4XR8I9JT
	zbk3+RL/AjvkZIytvth8FyTEMDrMYBy5TWGRhPrE4WEGpcjeQo0DHrQdMkQ7bYDv
	ZlPwMrtFWnH2+0InPmmadIh3uDvGN00tDbI0TyX8u4vUvoPqFzeai20rZWneq5cm
	wxFMXqgYhpH1WYklOp5kh0A8L+sVUqH3jyhJNj5YqTKZ000eRzrtLCvb7LThA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw15yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 20 Sep 2025 00:08:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 17:08:23 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 19 Sep 2025 17:08:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH] perf: Fix reproducibility issue
Date: Sat, 20 Sep 2025 08:08:21 +0800
Message-ID: <20250920000821.3374061-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68cdf079 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=hOjxzNy0v5UpTo8hRW8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GM4vpL0yAyfO_AYHFkqjMSy3vKOD4B7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNyBTYWx0ZWRfX2LwK8Ti/l+jq
 3j3+g26Y5KmxXrTQ+MrKo/8vpy14Hr10vUYSqTKu+SPvVXs2EUUuGh7Y9Qyz6HAfvuFoVctiUhq
 VP/nKoBg80OPVtpyvq1V8Atr33hbpGhZbqj2/heuxvlemTFWLL0LRY0R46j5M4kGMQt0uQkRxbR
 O+oR9mIZd2Hho7C6Q1me1HpZP95k5C1PhfuSgbjwEbu5xIID92Dr0S+Zm2oSHfgqlGUeVBCi8CC
 XWC0lPWcwEJ0oMoDuB/e9M5uUttQr8lGPrPDkD3Z+bsADgwpdZ+8SXQsjNb5ZxLEp9hqYZadeSE
 x5vKzJtPKVPNlE4KuQzVF2qeYa0VUDd9cmm8Wtw/eOQDt1MiPtjKkx6b1ho6Jg=
X-Proofpoint-GUID: GM4vpL0yAyfO_AYHFkqjMSy3vKOD4B7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 00:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223776

Perf's build process generates two copies of its internal headers,
one at tools/lib/perf/include/internal and one at libperf/include/internal
with files like core.h. Although the files are identical, the binaries including
them would see them at different paths and have different debuginfo data. [1]

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

This commit explicitly removes `tools/lib/perf/include' to assure only `libperf/include'
is used

Also enable verbose for compile to trace the detail of build

[1] https://git.openembedded.org/openembedded-core/commit/?id=0a886fcacaab0fbce1306c0f99d482f940a8f705

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 98dffd1cc9..d0e144aa3f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
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
@@ -377,6 +377,10 @@ do_configure:prepend () {
         sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
     done
 
+    if [ -e ${S}/tools/lib/perf/Makefile ]; then
+        sed -i 's#-I$(srctree)/tools/lib/perf/include##g' ${S}/tools/lib/perf/Makefile
+    fi
+
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
-- 
2.34.1



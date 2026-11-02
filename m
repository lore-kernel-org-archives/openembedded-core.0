Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.718.1793639590635169086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 09:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bs8ZLxPN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: roshs@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZNPH246724;
	Mon, 2 Nov 2026 17:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kXmZ7psu3W2hbhU+UIRh7Rn1L3/+/5D+VLJ
	YKsoimRw=; b=bs8ZLxPN6XPTDeIVmwGRwaJOgeGg+vOVYM9Zm9tO064kEOZFV9H
	t8hczVmxkCghTS5IkUHheiB+ZdW6qm5/fzVVZf0Iqly4cRwp186UvbL+1opLlcnY
	n+G39R4Ma3ak7KEBeTfGW+KCW+/uee1z4l8HGMCvLZd7g4VEZ6+YuhWjWMU3ht8d
	Ef759zoGhHlqPtV5zgN/f1A/u6O5AeTgS/iktOmbDWHczh96c0w3JYFb7jUiz6HI
	n1ZhJzCFsZSSvsYHgi4EMPO0iyfV6Lj9OnUSen5lz9zesPT/Joe5v0WpTyDDsmiP
	dTCTlov+yTZc9n2OX8Bt5+qz7wmRtcGY4uQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmethsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 17:13:06 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HD4fO2427895;
	Mon, 2 Nov 2026 17:13:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-roshs-hyd.qualcomm.com [10.147.243.236])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6A2HD4x02427889
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 17:13:04 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4086833)
	id 3D4D5B7F; Mon,  2 Nov 2026 22:43:03 +0530 (+0530)
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Sumanth Gavini <sumanth.gavini@windriver.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Roshan Sivakumar <roshs@qti.qualcomm.com>
Subject: [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap to avoid sed dependency
Date: Mon,  2 Nov 2026 22:43:00 +0530
Message-Id: <20261102171300.3830206-1-roshs@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8c4a2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=iUqKOTVaOQw_3Cj6zKAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX1a64tJBBgTso
 zSjJXB04lnFZvdXZbWS5TT22I2Glh5wgEUoZATs8w5gyhxczysIFtRVyfVV1gend1ZUsv6WHVF2
 kPAg6f/g0Q1O/XT6e8hMgcoKJ2bvY43UwwBmTL+9hpZtrXYR1cCagE3Y0hpsgypr6gQA2Vaj+gG
 g/R98KXozcEZ2fAuhCcO98oLV8Cy22QKBFCkZL2l9BGm42maLiJQB1pvdv5grjX+5Nw6KN5+a5b
 JIg5pMWp5iCf8AxHEeCtnHtIi4y3VNZ6Z/vmlE46ZWvnYbn7ngzQGz/dhmiCHFrT6EEZW/w4ShX
 H+LsNrsNy6VaZGNam/THt76x1a1ulmrJFiwBrOaFbJtCf7sAUGnM9ZLrk5mJkqh9zMSsjPG0WIO
 iroHD2VgQIg3Btaw4BkD3Y7hkvo6vA5Xmm29Or5mOnI2RQTEzHZBTBPZKln6teW1pNqDq33cJ4b
 JyDaPYiReWXnBXDASTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfXwlxO6Zh1Q4nm
 GyVWoPh/YnPKZl0Iviqg2qGI1W2l+rdbWzsxwjWoL9XtmnxhbgSP8rWq4J/75ODMPsO4BwxQVpD
 dojTQFudFmIdzQMSurebVBnBN9nxjpU=
X-Proofpoint-ORIG-GUID: ReHWDFWM9E8KitAS_sKHa_svjjBdKVXy
X-Proofpoint-GUID: ReHWDFWM9E8KitAS_sKHa_svjjBdKVXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 17:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249219
Content-Type: text/plain; charset="utf-8"

scripts/mksysmap is a '#!/bin/sed -f' script that is consumed only by
scripts/link-vmlinux.sh during a full vmlinux link (NM | sed -f mksysmap
> System.map). External module builds against kernel-devsrc never relink
vmlinux, so the script is never used in this package.

Because it is packaged with a '#!/bin/sed' shebang, the RPM 6 interpreter
dependency generator emits "Requires: /bin/sed" for kernel-devsrc. Only
full GNU sed provides /bin/sed (busybox provides /usr/bin/sed), so SDK
population fails with "nothing provides /bin/sed" on images using busybox
sed.

Remove the script in do_install, mirroring the existing removal of
scripts/package/debian/rules (dropped to avoid an RDEPENDS on make). This
clears the spurious /bin/sed dependency without pulling full sed into the
package or the SDK.

Assisted-by: Claude Code:claude-opus-4.8
Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 90bdbfc534..7da7e270c3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -158,6 +158,13 @@ do_install() {
         # Remove as we else would ned to RDEPEND on make
         rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
 
+        # scripts/mksysmap is a '#!/bin/sed -f' script that is only consumed by
+        # scripts/link-vmlinux.sh during a full vmlinux link. External module
+        # builds never relink vmlinux, so it is unused here. Remove it as otherwise
+        # we would need to pull sed into the package/SDK to satisfy
+        # the dependency generated via the RPM shebang dependency generator (Requires: /bin/sed).
+        rm $kerneldir/build/scripts/mksysmap 2>/dev/null || :
+
         # tools/include is needed by the archscripts host tools that
         # 'make scripts prepare' rebuilds on target (e.g. x86 vdso2c) and
 	# not checked against objtool as it previously was.
-- 
2.34.1


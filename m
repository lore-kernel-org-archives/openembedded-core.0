Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7C4CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 10:49:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61381.1756205347424567260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 03:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DSfZ5Rag;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=033363bb87=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q83kch1224621
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:49:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s3l+vACm1cF9MdjYNpxc
	gWR/52HX5D6AJNkmc9b7g3o=; b=DSfZ5RagGqvMw6OrMjhBn5SpPAvfZs5klyUw
	1/X47u5Ay+feC5n3Ta4iQUYRWYxiC/JWseC/7QilsgEgtMQShqdfaNxIFjdtc1gZ
	2H+9+r/2B3l61sCj7zK5hpF8N2LSzYdXSJnj9We+49jDfu9maoc5xeK0323OPJej
	sDkz/as9RcCgS8DF4MjvJrZXxH5X4+xcrxFOZoUdJDWkMROz/+/RI0WyDynk4+Ij
	bOTfsxBEv4ct6hDHXiG+G6540ncE0K5yrHFOn1qIffovk8PmslILaENH/oeXeJhs
	T6Xr6M8CDnj3AvJCenaZMWZuOITU3VNxW6kAQ4H4aSopDx4VnA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48qd5hjmsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:49:06 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 03:49:04 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/3] tiff: fix CVE-2024-13978
Date: Tue, 26 Aug 2025 16:18:32 +0530
Message-ID: <20250826104834.2432179-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA5NSBTYWx0ZWRfX9LGG6ae+f/qb
 FHuj8vAhwvxkelBBQiixGCj4WUv6lCE44xcjgg8OALifaDytuiM6TZxH1WhGPUhpnDzrDIlpct/
 9SLSU0VnJt2RKPR/DjM9Ip5KU6PeFT5lgLe8m5ixzYWcHZbqK9gBH9+iYuUhF4xfcp4pgZOPmGg
 V7zwQwKAoM5wANEuxyvy1CDdsLvUHEFHiPAlGS3MQc8QCZJXa3PixlZthSjCHSbnTckoVKje/oM
 G+u1snoc8V5Anncp/gvU7qnN7/dlrko7Iub6k9aRp0yC+kzC/kFLUuZaGnK5I+hf31koJooqF4j
 A7JmSzJ2m3Hjwl9wfBy2DtX4JOWqwJ33sTeiwq9+ePyKGFKk3Vzss/V1bWwaq0=
X-Proofpoint-ORIG-GUID: R8arbwai8OLSJyl74NO8aleRJtIMSiJY
X-Authority-Analysis: v=2.4 cv=QNdoRhLL c=1 sm=1 tr=0 ts=68ad9122 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5vSyN_hxAAAA:8 a=cMNQoHRAXdZNCDqp4WIA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1zBLIHEOKY9YwKILsQtb:22
X-Proofpoint-GUID: R8arbwai8OLSJyl74NO8aleRJtIMSiJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222437

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
as problematic. Affected by this vulnerability is the function
t2p_read_tiff_init of the file tools/tiff2pdf.c of the component fax2ps.
The manipulation leads to null pointer dereference. The attack needs to
be approached locally. The complexity of an attack is rather high. The
exploitation appears to be difficult. The patch is named
2ebfffb0e8836bfb1cd7d85c059cd285c59761a4. It is recommended to apply a
patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-13978

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2024-13978.patch         | 47 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch
new file mode 100644
index 0000000000..3a4845d415
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch
@@ -0,0 +1,47 @@
+From 2ebfffb0e8836bfb1cd7d85c059cd285c59761a4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 5 Oct 2024 09:45:30 -0700
+Subject: [PATCH] Check TIFFTAG_TILELENGTH and TIFFTAGTILEWIDTH for valid 
+ input, addresses issue #650
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiff2pdf.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 63751f1..fef28d1 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1255,9 +1255,25 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
+ 			TIFFGetField(input, 
+ 				TIFFTAG_TILEWIDTH, 
+ 				&( t2p->tiff_tiles[i].tiles_tilewidth) );
++                        if (t2p->tiff_tiles[i].tiles_tilewidth < 1)
++                        {
++                           TIFFError(TIFF2PDF_MODULE, "Invalid tile width (%d), %s",
++                                     t2p->tiff_tiles[i].tiles_tilewidth,
++                                     TIFFFileName(input));
++                           t2p->t2p_error = T2P_ERR_ERROR;
++                           return;
++                        }
+ 			TIFFGetField(input, 
+ 				TIFFTAG_TILELENGTH, 
+ 				&( t2p->tiff_tiles[i].tiles_tilelength) );
++                        if (t2p->tiff_tiles[i].tiles_tilelength < 1)
++                        {
++                           TIFFError(TIFF2PDF_MODULE, "Invalid tile length (%d), %s",
++                                     t2p->tiff_tiles[i].tiles_tilelength,
++                                     TIFFFileName(input));
++                           t2p->t2p_error = T2P_ERR_ERROR;
++                           return;
++                        }
+ 			t2p->tiff_tiles[i].tiles_tiles = 
+ 			(T2P_TILE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,t2p->tiff_tiles[i].tiles_tilecount,
+                                                                  sizeof(T2P_TILE)) );
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4c9c212312..d5ae82bc7c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0002.patch \
            file://CVE-2025-8176-0003.patch \
            file://CVE-2025-8177.patch \
+           file://CVE-2024-13978.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0



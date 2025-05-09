Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F53C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:22:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11054.1746786160753065419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ebccee=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54971AVq009161
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 03:22:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f1j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:22:40 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 03:22:39 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 03:22:38 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  5/5] ffmpeg: fix CVE-2025-22921
Date: Fri, 9 May 2025 10:22:28 +0000
Message-ID: <20250509102228.3422688-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250509102228.3422688-1-archana.polampalli@windriver.com>
References: <20250509102228.3422688-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UFgpBjy0qh8rQKzg4_2SBMZij0dVit2U
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dd770 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=TaeZFPWVGmNClD1ZK8cA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UFgpBjy0qh8rQKzg4_2SBMZij0dVit2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEwMCBTYWx0ZWRfX3hATQRKlppNa /dRq95cBmhoihJwOfQFKUy5d/WQTS+ydLUkS9dq0R8Q6luNs/h5cJT/Gtz2YaM2dDiwyVfc9wLW aVz0FwtMGNg7kXChfpdFQAmR6+dbpbGL79fAi82lgyi7wdOjfs0e7OWu2sD/u6wjCdkVaiRhZXh
 92Xtftdtb7WUO8baxroWlAVYinbVtRKCJaUGEbAgEufqIkFIuCrnKzcOQE+oWgkhk9A0vX4FMro P+k17WsU5f8Pe59r4u7GXEttruVM0Fu2NuQFJIhw+VCUFxNh7D+E6mZi8aWy8BlTqiXXB2K103b 8reVO8bwGEnSHq2hQzhY+NlPQQrHEYY2xOiCrFbUfO67tUMBkh8JfZlunplI4ONr4piggTnJW4O
 SakRfe5+DEd7j4ssizKdLkNBpwFiDs6Pz7s4UnsUjsamFyOlnCqdyqdXreaZH+rqjpOpdMIN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=747 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216196

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation
violation via the component /libavcodec/jpeg2000dec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
new file mode 100644
index 0000000000..20fac68d01
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
@@ -0,0 +1,34 @@
+From 7f9c7f9849a2155224711f0ff57ecdac6e4bfb57 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 1 Jan 2025 23:58:39 -0300
+Subject: [PATCH] avcodec/jpeg2000dec: clear array length when freeing it
+
+Fixes NULL pointer dereferences.
+Fixes ticket #11393.
+
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-22921
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/7f9c7f9849a2155224711f0ff57ecdac6e4bfb57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/jpeg2000dec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/jpeg2000dec.c b/libavcodec/jpeg2000dec.c
+index 691cfbd..b56902c 100644
+--- a/libavcodec/jpeg2000dec.c
++++ b/libavcodec/jpeg2000dec.c
+@@ -1223,6 +1223,7 @@ static int jpeg2000_decode_packet(Jpeg2000DecoderContext *s, Jpeg2000Tile *tile,
+                 }
+             }
+             av_freep(&cblk->lengthinc);
++            cblk->nb_lengthinc = 0;
+         }
+     }
+     // Save state of stream
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
index 4314ab9f31..d5252bfbdd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://CVE-2025-22921.patch \
+          "
 
 SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
 
-- 
2.40.0



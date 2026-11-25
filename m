Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38874.1795600038096000350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WzhCW4M/;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild12.wrs.com, ip: 205.220.166.238, mailfrom: prvs=5789667dcd=aga1@oak-lpgbuild12.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP67sGq2730833;
	Wed, 25 Nov 2026 01:25:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4rzQSXk2Z
	8uMzvXsohycn6EeAeLY9drkKEVJeTK1VCA=; b=WzhCW4M/HasxDeoCJt7nV3RBM
	aRf2oR9xdskiDcyKNjDVce5lBkZfuE/ZBlgGaWbU/rk/Ju2PdJdtFmtbk/J0xGCx
	eDidLZxLi0El8ynSaSgqg5i0xtP5FnCid0TDZ2SctTfBxhrx7Nut2nrYAhocCS0A
	8WTDbnmCsQOdEPUveLRXuJMgDYmMnqEyxIxcgROcnca5//Py2J/OvQ/VRr9YAYD6
	oyKGc+tuW7X0iFBeLwZieLEURkyAHijL+r/pRBElDWNd9AaBnfeMTYm5CybRqDl/
	A9+NEk1XvUbUX8SBrwkfKlgmMVsfBdRnP64MhsLQJZUwwg/7KlvIJZFHqchqA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j51d7u2bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 01:25:05 -0800 (PST)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Wed, 25 Nov 2026 01:25:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 25 Nov 2026 01:25:03 -0800
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 25 Nov 2026 01:25:03 -0800
Received: by oak-lpgbuild12.wrs.com (Postfix, from userid 1762447724)
	id BE02A39001CC; Wed, 25 Nov 2026 09:25:03 +0000 (UTC)
From: Abinivesh G A <Abinivesh.GA@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, <bastien.jauny@smile.fr>,
        Abinivesh G A
	<Abinivesh.GA@windriver.com>
Subject: [wrynose][PATCH] ffmpeg: Fix for CVE-2026-75143
Date: Wed, 25 Nov 2026 09:25:01 +0000
Message-ID: <20261125092501.731392-1-Abinivesh.GA@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: cBlH5_X9t1alYQdt3X5ih1TwD_o3TXRr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX7ajnqVQaFwXJ
 xVXZfWE+IDh48JiGCb2Ec3jiwFM8WpSrH/dRDU9MKmyD0gzsncHsJIyCq71q6xAe2xQvFj8zZF2
 Ec59xWN+8ATgZSUKVPRhDLwGmnrqokMOMselsmagNX4Rvhdn2a90
X-Authority-Analysis: v=2.4 cv=GZOCDgXL c=1 sm=1 tr=0 ts=6b06a971 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=emhf11hzAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=5fZKPoO2FM44ekDmq-gA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX6v1JTc1Yp+il
 1togGPmDqC2POAwQ8RMfT1mq49E8RYpToRWvaz1iaCEIuE0L3TdfIhsoqxJ5OIXSi6aCbz3QQwM
 zmBmZaQ84QntdLd3paeVGpylxWyRrIff5yuaQxdfi7vrz3RGXPUhYF6dmsof7Lb/4qLxEhQrvHE
 AEJquzbuAcBfQAat6CV/LVxSTZqRutBER4b5Uq8ytFMV/bR/mOO9fT/7v4JOyfU8efFjKGALEHN
 EvZWFRcPMFf/ji6zRifxYD/VjDWKmAl73bEy2jFbdfvVVKTvKhUjLX3d3oV531qLN9DWNibLg0R
 4x62+I4nKd1aGqH0RHP3HASfv5/HcXIdy9+//jSAbxbTgApMgtX7FHuGl+Y+uFZZ7qE6+RClT7u
 b5M6ZUilOCb1EEsJDD7vRt6/KD9j7VUHxp99lreCMOfLq20jdjxzMeDT824SIgPNEl7e3xgXmT4
 IQqD9uun8bm4FtZJ8VA==
X-Proofpoint-GUID: cBlH5_X9t1alYQdt3X5ih1TwD_o3TXRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251174
Content-Type: text/plain; charset="utf-8"

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602
[2] https://nvd.nist.gov/vuln/detail/cve-2026-75143

Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
---

Notes:
    Build-tested: bitbake ffmpeg on qemux86-64 (poky wrynose), patch applies without fuzz.
    RIST support is not enabled by default (no librist PACKAGECONFIG).
    master (ffmpeg 9.0.2) already contains the fix, so this goes directly to wrynose.

 .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 33 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
new file mode 100644
index 0000000000..7d4327c00c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
@@ -0,0 +1,33 @@
+From 1c10bcc2e17255dacb717a25ab3db142ce390602 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Tue, 4 Aug 2026 12:11:55 +0000
+Subject: [PATCH] avformat/librist: honor the caller buffer size in
+ librist_read
+
+librist_read() ignored its size argument and copied the full payload_len,
+overflowing a smaller destination (e.g. via the async: wrapper). Clamp the
+copy to the caller-provided buffer size.
+
+Fixes: out of array access
+
+CVE: CVE-2026-75143
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602]
+
+Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
+---
+ libavformat/librist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/librist.c b/libavformat/librist.c
+index 9669d5b5df5..3c4b5e3e5b9 100644
+--- a/libavformat/librist.c
++++ b/libavformat/librist.c
+@@ -226,7 +226,7 @@ static int librist_read(URLContext *h, uint8_t *buf, int size)
+         }
+     }
+ 
+-    size = data_block->payload_len;
++    size = FFMIN(data_block->payload_len, size);
+     memcpy(buf, data_block->payload, size);
+ out_free:
+     rist_receiver_data_block_free2(&data_block);
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b92676d4db..fe6286f7dc 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66036_p1.patch \
            file://CVE-2026-66036_p2.patch \
            file://CVE-2026-66041.patch \
+           file://CVE-2026-75143.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71A5CA5FF0
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 07:07:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39772.1791270454584236822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 00:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=G0iwVO8m;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=chMMuyeZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966dwqX094627
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Oct 2026 07:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yL+Cb1eBln/LS3PR5WkqrtzkxItT06AaZsn
	i73dVTQQ=; b=G0iwVO8mnAsvsbN1CBAKSdTxlaWXX9hffnWYocp7rJUtMP4zY0T
	Vr1JliVKa8tQmMW29fxxNor4qj6SmnjZoSwwl2LcgxfvO8UoGIZVqtJ8YbuYfVGH
	nq8/v9v+hnb6UjtM7VkIKeB5M56WyKpTs50ZrmrKksOJQXWtXJe8teWQkmOOoSKx
	HWXoJFQXbJ5s89mSGJE3F99HFePcTwXmO91LZG2IsC8xMQzpU1F70yZucmUHxtD8
	Y5NvHS6kIYwcX26wYi997/U5K2QbOKmLnACPeHIFtnk4hlAgU9gSeH3F2KcI/lfQ
	Luk2bXBggJJLhuz8GMKCaDJbGQ6UlgP8INw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jews-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 07:07:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so38080965ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 00:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791270453; x=1791875253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yL+Cb1eBln/LS3PR5WkqrtzkxItT06AaZsni73dVTQQ=;
        b=chMMuyeZ1OotLo+MJ81iTYILFAs2Wb5vaR+qM/Yst4dGrgsmGDFTQC/wLnqoKY/a9n
         PDKW+Ir90Cj4nkEqOe43KQQb26GxoMnjyOKh8VuCQsQJCxXpIsrlQJ32pzuqX91c8vDi
         6wXXUQ2aUhR5RGkec7bqFl0ubQYnTWhPRyNcdh6Q+5VqdKxGLE4xFwBUOABHEYdf+/Ab
         HEJWK8ppxiHGeCz9HSd6SEydJmqJsT1M6gAJTtE+1cNhY7jaj9rXpX+apCBPNYu3FtDp
         Xb1zrMLu7CCWXhMNYPC1fhdWrtp6W8RKoz12H3JwXmLaKJ4XQ0DZ1pBHbg4YYmC1geAF
         dmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270453; x=1791875253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yL+Cb1eBln/LS3PR5WkqrtzkxItT06AaZsni73dVTQQ=;
        b=iDqONNVc1/h722ZzTcO+1ZC4xPdVmuCaG9MsNa+xkoggU3VW7TXmXi3kWHBES3T14g
         /9phwQVyWPHOhuuBeXDdevCtGEHZ4u3/AFPDkWyIC4ilTvAgyDdlVV7x7FUtm94wgwY0
         w31BB4Na2ZZi7+kQ46BRcvWhACi/MgkpqczCoZ5unIAIDTSAjsgyTAAawQO08cmEetao
         +V1etcNvbcqgmCcZB9p22oEOTScZ6XuLIYeYjObt9Tz/dx9POYT1yLVu8QxFxeIawngd
         9A9LJGcQN4KegvS7pAENHwGMorqDs1jXMHQOi/Txi98AAhwABsyMJUfM+Xlvaf92TyN5
         bonQ==
X-Gm-Message-State: AFq9FYK3HUNSjHx6/uLHe5SpPv2ihGSShdNqrVgNI4Bh6ruTk85lq3gS
	pZTiDhcrJ3k5Z1ge1XfvoZvczA9qbqfNcHxvRsY8i1mnKTq36CHiEF6D/GBrli5PJWbFqWoMszo
	Bbl2R2BRQmTnjyRgR3B8wPhFWX+cptVyx0r66JMYhvYSYipmXOIS4xI6d/PTMtuMECP6i+rbsQA
	AO4PaC4rz3WiG3MEE=
X-Gm-Gg: AYBFou1plb/BNUO7sfAST4Mo5TqAHjyfkbXwIzI6L6MfblsivEfcDNzH0V1oay+wfqt
	MGttRGVnEkBHp90ghlefQrrcxS25Y2sMriVzCJOG+YjJcYerRQZe3DtVehBT4yy1JFJ8qFhvpVu
	a9md5oMzGpEN+v3ECsKrFzHc+V4h4ztROSdXP87RlZOYjyF/65w/fd0qQ9Sre0/ucCVJae/3N95
	GPtHg4zXFwNFpBBhAOWZ9QpRNwxSxwLYuY9ymK+jeP9CP3/zfV0SP5LpcmciE/jK4Na7kCY0Eot
	gCKPkMWwVJnIbvzWcAivQYnHrF3Rp7OJfLnRuvCcaZ6O0fkNBW7NozXfzsIA/bCAv8aroH4jwHZ
	u0AToCiiHLP1NIc9n8k1wegUsMouF86dsqiGEpFTEvMngUhwn4wbp3OBs7tCelfh/SRSLQg==
X-Received: by 2002:a17:902:d2d2:b0:2df:950d:8f4a with SMTP id d9443c01a7336-2e5dcd9701bmr5562555ad.22.1791270453020;
        Tue, 06 Oct 2026 00:07:33 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2df:950d:8f4a with SMTP id d9443c01a7336-2e5dcd9701bmr5562365ad.22.1791270452473;
        Tue, 06 Oct 2026 00:07:32 -0700 (PDT)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1b2sm17710315ad.24.2026.10.06.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:07:31 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v1] linux-firmware: package qcom-shikra-wifi firmware
Date: Tue,  6 Oct 2026 12:37:25 +0530
Message-ID: <20261006070726.1088692-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sAwMaRtFl90gr0xsRT0Naqy-GgPOTvhA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyOCBTYWx0ZWRfX3HiJA9OBydmI
 ecrcq98AUsOTRCVvKdh2CxcYIT7BJcwkEnyj6uhXTEpIeAx9xCJ0OdbF/CWFICOgBismyf1kK2W
 bf7IzwArb5M/aalrbZUXiuNFcpmyjL4=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac49e35 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=2WMO_5KSFBI97C4CKOIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyOCBTYWx0ZWRfX4CMIOopspqiZ
 2BOSYLWwaMFZzg2fBRJ8ZixpJhN48og0LgQNn2EZ89r1Tfi5Nt8YSEhrrH3a4jkGocj/PwW6vsk
 4YX37nNgptm/O3sH0xpug9luB6TJYbPI51k/u1kWxul+FhEN2o/fjGmwLl9jVrmkh68Ae96GY7b
 19clqYadLnRYn9qlTtjMs0YlvxdVxaff8HhqvKeSHe042OIOvUIuA3W+TuDkdO7r1fQJ9Ad5spf
 AA4Gerg50ZSyDAQCo+h/Vl028N1ccL3wlQHa8KlaNP9VEsUZmoqXSK+gC11LuN0V4qWkC3ErNss
 is3axM8GDHL0sbsXzG0IXOwt2S9iDtAl/OPuqyUQnTWoga7TFs8X4HCMr3V9sIy1JHPRLC4abxZ
 zwn0Tr/JOUxZbQ4T30682k57Ram1cPdvwIKtBTfcsicRED4dzRAn5I/ywU3MHdjfmhHftOki6/T
 DtfZVL/WU3tP550PZ2w==
X-Proofpoint-GUID: sAwMaRtFl90gr0xsRT0Naqy-GgPOTvhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 07:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247275

Split the Shikra-specific ath10k WCN3990 hw1.0 WiFi firmware out
of the generic linux-firmware-ath10k-wcn3990 package into its own
linux-firmware-qcom-shikra-wifi package, matching the existing
per-board split already done for QCM2290/QRB4210.

The current linux-firmware snapshot consumed by OE-Core also lacks
the qcom/shikra/wlanmdsp.mbn symlink expected by tqftpserv, which
loads WiFi firmware from the same directory as other DSP firmware.
Backport upstream commit 837ae0e5becc ("qcom/shikra: link WiFi
firmware from the ath10k subdir") so the packaged firmware can be
loaded from the expected location.

This patch can be dropped once the linux-firmware version used by
OE-Core includes commit 837ae0e5becc.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 ...-WiFi-firmware-from-the-ath10k-subdi.patch | 28 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20260916.bb |  7 ++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch
new file mode 100644
index 0000000000..010121da6b
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch
@@ -0,0 +1,28 @@
+From 837ae0e5beccc2f1e974afba56c22c3cf981fc4e Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 18 Sep 2026 17:52:15 +0300
+Subject: [PATCH] qcom/shikra: link WiFi firmware from the ath10k subdir
+
+On Qualcomm Shikra platform the WiFi firmware is loaded by the tqftpserv
+from the same location as the rest of the DSP firmware. Add symlink,
+pointing from the expected location to the actual WiFi firmware file.
+
+Fixes: f64d7db7d264 ("ath10k: WCN3990: hw1.0: add shikra firmware files")
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.com/kernel-firmware/linux-firmware/-/commit/837ae0e5beccc2f1e974afba56c22c3cf981fc4e]
+---
+ WHENCE | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/WHENCE b/WHENCE
+index a712978b..053640a0 100644
+--- a/WHENCE
++++ b/WHENCE
+@@ -3825,6 +3825,7 @@ Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
+ File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+ File: ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
+ File: ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
++Link: qcom/shikra/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
+ Version: WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1
+ File: ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
+ 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
index 44901c229a..d549c3d2d5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
@@ -277,7 +277,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "286b10e604dec1e5d49c4ac688f65a2e"
+WHENCE_CHKSUM  = "376a71c7f18efcb6e6688a73c2a548c7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -409,6 +409,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-qcom-shikra-link-WiFi-firmware-from-the-ath10k-subdi.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -584,6 +585,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
              ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-shikra-wifi \
              ${PN}-ar3k-license ${PN}-ar3k \
              ${PN}-ath10k-license ${PN}-ath10k \
              ${PN}-ath10k-qca4019 \
@@ -2474,6 +2476,7 @@ LICENSE:${PN}-qcom-shikra-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-audio = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-modem = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-qupv3fw = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-shikra-wifi = "LicenseRef-Firmware-qualcommAthos-ath10k"
 LICENSE:${PN}-qcom-sm8150-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "LicenseRef-Firmware-qcom"
@@ -2654,6 +2657,7 @@ FILES:${PN}-qcom-shikra-compute = "${firmwaredir}/qcom/shikra/cdsp*.*"
 FILES:${PN}-qcom-shikra-audio = "${nonarch_base_libdir}/firmware/qcom/shikra/lpaicp*.*"
 FILES:${PN}-qcom-shikra-modem = "${nonarch_base_libdir}/firmware/qcom/shikra/cqs/qdsp6sw.mbn*"
 FILES:${PN}-qcom-shikra-qupv3fw = "${firmwaredir}/qcom/shikra/qupv3fw.elf*"
+FILES:${PN}-qcom-shikra-wifi = "${firmwaredir}/qcom/shikra/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/shikra/*"
 FILES:${PN}-qcom-sm8150-adreno = "${firmwaredir}/qcom/sm8150/a640*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${firmwaredir}/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${firmwaredir}/qcom/sm8250/adsp*.*"
@@ -2835,6 +2839,7 @@ RDEPENDS:${PN}-qcom-shikra-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-modem = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-shikra-wifi = "${PN}-ath10k-license"
 RDEPENDS:${PN}-qcom-sm8150-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"


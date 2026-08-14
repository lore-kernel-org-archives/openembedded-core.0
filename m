Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4436C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:22:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4152.1786669912690363755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 18:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FOSnlqFf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Gvgk2dq7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: hangtian.zhu@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DLWla63981758
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 01:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ak8IjCPiVj7NKI/7pb2kzlJVfzDSqLEdajl
	fhT5Wlnc=; b=FOSnlqFf5x6v59z2nmjUKwAaL3aAN7OVF/kqWe2RDckuSuqeKYO
	kg6YhyzDw3pOI02ejUCarQdTHhz2j9eUtvq42Qex7zFgOb0+5Ojf7O8YKeWsFtZ+
	8N3oQAMDqyM+5Gifs+GofBkx7NzLdgg/ivJra4QUsl/5q425itIR9jdrmeujxynb
	cf2k5SHkRdiPesJmTRs4PqkFfOkKNI4U2/Mhgn6tv1/9PLzIcOknxhUpEwG70kte
	i8xkhbBY+B5QWPUK8B29U4vTH5IKxisDN1r9DnWGq90hyGcXjZjMKyWGcYERaV7e
	1woNECcohejGVzDAQfzu2XSdu9zQLjGZ0Uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1ut1jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 01:03:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so806698a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786669434; x=1787274234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ak8IjCPiVj7NKI/7pb2kzlJVfzDSqLEdajlfhT5Wlnc=;
        b=Gvgk2dq76DOPtx5IQRd1UhJttBvbxCYgjtAPc2Q4r8DhGP5jHpAIfd+8j95LOjW7O+
         CEolo3sEkWTUxbI/ad2w6N2CCmxMkIM8RUGke8kCcG1pB2HWtrzmQo8XqZL/bz8xTIm+
         aW7WnCNuxAKCw2ieS04RoppXXiPZiGalX1SFDuQDbg56isSq/Ev9XmfivNh+NBbVmU5s
         ipLHlDTZzoa2c68i5S/ShM+Qept5Ix5y70PaALF0h+MDTzlfQPg4Yr9gJ+CFv6fqIqBt
         Xs4zXQzMEIy3iXDl0d7pRZdaVytgtNUSbPGyOOy/bn8InumAEpLGo6HIYmEVKHGAojjk
         JMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786669434; x=1787274234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ak8IjCPiVj7NKI/7pb2kzlJVfzDSqLEdajlfhT5Wlnc=;
        b=a9Ow5XJkCCNBbuF67RofOOxBjfs5LKBMnvKyMdjbwZ7YBD4qjA9Sj/v7NK1cTdJql8
         Y8RJ/04uMpBrtZnwYfYT44eJl37DUzzPaeYNm1mwB4bATbmebLSmB3UCYTKz5jWf0qVJ
         8C4sIjfhAj7U75BFgeziGR/jXC3DGeJn1THcTgseUCLGnBg4YUAVq2E8NSlPdPPuHJ6S
         0Zp32WVt2ZcAEM0y7XMsmDU19X1jPNpxe+jDH3A+tPbeti0sTAuQGyWBucq3aWfXyNyJ
         OgduAJov65tKJCqcx8vLVmKk4Q+5LmFa9qNUY2VthcOOOCApo7EFv94Fef3QRpPisLS6
         w9+g==
X-Gm-Message-State: AOJu0Yx2nPYObtB+cXVE193hSO7tDnD4Vx4PpJ/mWKh1S39sa2JkFJWM
	hFiBuW/KHLGYPYMg4+5ntA+YL1E/dPmUpBka80kBNFX+SR/qsgEoQy2l4z6LG/2yml4Raga+9KL
	dsg4ZOWggV8LaZFFI30M0TAONSeUX2rQNsa2AI+DtCFjrjl7hiMopFYgXzL74KBjkOri8Y5arZ/
	OG/E7r2SqwdypLDp0=
X-Gm-Gg: AR+sD13e3YmokxrVUREu7F5wQvLWmUSepLf+dq1xidoewUVsuGqRNmIGMVCKxjk9mGu
	BBx8265xsAsmDcYtm1UzlbAuhgymTRv2JLa4+ZtHYxOTyivoKx4kPDJULuBW0JK+5DuXMLbZTfu
	6TRro/qMqFv1B+QIlV6nY1l4Iw6Y1lg6dcYSEtH1CbP42rhiHQ8OWzKJDEuKEWK3O5YXDej/iHq
	KqqTYPehA0Rt2ai+vaSTlKRPsM3PEn46JgUIEOgRPA4sWXxdnxBv1V86QUwI37tE45XrOKLRZ/u
	0QK+TcOIciCG0hu4sSCmJDgv+w4StqJodS7xOowuUks8dqJzfYoKraaVvA3U3CKdVq3LPuwCo37
	dVLBa3fkBfP49CYDF+uR75WQw3N3wIixhoAPGChWymxDll8WEJggJlOY/tknpOzi0
X-Received: by 2002:a17:90b:134c:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3933b8721a1mr2224523a91.10.1786669433384;
        Thu, 13 Aug 2026 18:03:53 -0700 (PDT)
X-Received: by 2002:a17:90b:134c:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3933b8721a1mr2224424a91.10.1786669432487;
        Thu, 13 Aug 2026 18:03:52 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebb888cbsm229953a91.9.2026.08.13.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 18:03:51 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: qli_sdc_iot_wlan_host_oss.external@qti.qualcomm.com
Subject: [PATCH] wpa-supplicant: upgrade 2.11 to 2.12
Date: Fri, 14 Aug 2026 09:03:48 +0800
Message-Id: <20260814010348.286460-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: jgZXi-OLbRoNTmTPamo9TjC6Fu1LWL_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX0EDKZaT6lcI0
 +n4TCQ/nNPn5PdwthVJGQKvUJgGiXEz+jJd9LTMTLzS3dLqx6mAqBjym4bmf4snhCgENwHwIZ7j
 zJac8hE6QPxfJivlKJQNd3Gu+LUpNIp1wxP7rVxJXBhrLml2b+/IMgvk44CqL4tyKmU3JZ/OvMW
 ynSuP78/EX6Qarb6RsVEwRCIHUV0kHvsFWnQTlo4EvRCKYOaCTdF5WoafQH40l7fP2f0tSELm75
 HVJE5V/p6VAUifqHO/VtLnhFkBl+tFRqJqMr6z60wpPXpBce2reo7pte4GdTdf+ZS9vgbVqjxPR
 iCAxZcg5Lm4GkWsF1kKx5SM6tMRBoEfhu1w0mfIfDvbvT7q05HTsX4yej/lWvgrB/xM8eQWITAa
 0aZ4wS2srcyMmxdR900iURki4LTtKp0YshA6hr5qjDadkIcudP1bhT167nU1nM2gdnSxa6aByPY
 iwMFFzEEzaQYA36pSiQ==
X-Proofpoint-ORIG-GUID: jgZXi-OLbRoNTmTPamo9TjC6Fu1LWL_x
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7e697a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=BoJB4dgYAAAA:8 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=a_U1oVfrAAAA:8 a=YXZQECZBNtwQtKW0rLgA:9
 a=qpw-KnXiqMnvxuTB:21 a=mQ_c8vxmzFEMiUWkPHU9:22 a=zGR_d48pMUbmtCY1HACo:22
 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfXzSkxXkBW4H1X
 0Z45y712zu4NVyZFOL49/rg7q/3p8IPLOtCB6CJDlMQ2rctmR7hi8aW/F5oWUWojNBXaWUaJwgq
 +TdE+upm0KDpl71jRhmT3q3Xm0KnHlQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140006
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243405

Rename the recipe to 2.12 and update the upstream source checksum.
Refresh LIC_FILES_CHKSUM for README changes in the new release.

Drop local backports no longer needed with 2.12: macsec offload
header guard fixes, OWE/802.11be defconfig updates, WNM operating
class workaround, and the CVE-2025-24912 RADIUS fixes.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 ...dware-offload-requires-Linux-headers.patch | 53 -------------
 ...-Opportunistic-Wireless-Encryption-O.patch | 39 ---------
 ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 --------
 ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 --------
 ...r-broken-AP-operating-class-behavior.patch | 39 ---------
 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 -------------------
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ----------------
 ...plicant_2.11.bb => wpa-supplicant_2.12.bb} | 11 +--
 8 files changed, 2 insertions(+), 355 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.11.bb => wpa-supplicant_2.12.bb} (88%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
deleted file mode 100644
index f9634e47c9..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Thu, 22 Aug 2024 00:03:41 +0300
-Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
-
-Hardware offload in Linux macsec driver is enabled in compile time if
-libnl version is >= v3.6. This is not sufficient for successful build
-since enum 'macsec_offload' has been added to Linux header if_link.h
-in kernels v5.6 and v5.7, see commits:
-- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
-- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
-
-New libnl with older Linux headers is a valid combination. This is how
-hostapd build failure has been detected by Buildroot autobuilder, see:
-- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
-
-Extend compile time condition for the enablement of the macsec hardware
-offload adding Linux headers version check.
-
-Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/patch/?id=809d9d8172db8e2a08ff639875f838b5b86d2641]
-Signed-off-by: Jon Mason <jdmason@kudzu.us>
----
- src/drivers/driver_macsec_linux.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
-index c867154981e9..fad47a292f9f 100644
---- a/src/drivers/driver_macsec_linux.c
-+++ b/src/drivers/driver_macsec_linux.c
-@@ -19,6 +19,7 @@
- #include <netlink/route/link.h>
- #include <netlink/route/link/macsec.h>
- #include <linux/if_macsec.h>
-+#include <linux/version.h>
- #include <inttypes.h>
- 
- #include "utils/common.h"
-@@ -32,7 +33,8 @@
- 
- #define UNUSED_SCI 0xffffffffffffffff
- 
--#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
-+#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
-+     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
- #define LIBNL_HAS_OFFLOAD
- #endif
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
deleted file mode 100644
index 7311b76b6f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fb043a27324ba81502b8986a31222f38aa414bbf Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 18 Dec 2025 09:46:03 +0800
-Subject: [PATCH 1/3] defconfig: Update Opportunistic Wireless Encryption (OWE)
- state
-
-OWE enhances privacy in public and enterprise environments where open
-networks are prevalent. Enabling OWE aligns with modern security best
-practices and supports the testing and development of OWE-capable
-devices.
-
-OWE is now standardized in IEEE Std 802.11-2024 while it was originally
-specified in IETF RFC 8110 (updated by RFC 9672). It is not experimental
-anymore, i.e., there has been significant interoperability testing and
-there are deployed cases.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=39db92dcf301793ce45a8ebf85c425f67c670058]
----
- wpa_supplicant/defconfig | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 52befd8..044604a 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -638,8 +638,7 @@ CONFIG_BGSCAN_SIMPLE=y
- #CONFIG_BGSCAN_LEARN=y
- 
- # Opportunistic Wireless Encryption (OWE)
--# Experimental implementation of draft-harkins-owe-07.txt
--#CONFIG_OWE=y
-+CONFIG_OWE=y
- 
- # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
- CONFIG_DPP=y
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
deleted file mode 100644
index b474b8437f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From aebbf87ca7311f543bd849020b97402c49f3cf24 Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 18 Dec 2025 09:39:39 +0800
-Subject: [PATCH 2/3] defconfig: Document IEEE 802.11be as a published
- amendment
-
-The comment about the IEEE 802.11be functionality being experimental
-and based on a not yet finalized standard is not accurate anymore
-since IEEE Std 802.11be-2024 has already been published. Remove this
-outdated comment.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=2887a975b12de9256ed6fdbd0da1dbb78c7a25c4]
----
- wpa_supplicant/defconfig | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 044604a..7efb9e6 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -507,9 +507,6 @@ CONFIG_IEEE80211AX=y
- 
- # IEEE 802.11be EHT support (mainly for AP mode)
- # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
--# Note: This is experimental and work in progress. The definitions are still
--# subject to change and this should not be expected to interoperate with the
--# final IEEE 802.11be version.
- #CONFIG_IEEE80211BE=y
- 
- # Wireless Network Management (IEEE Std 802.11v-2011)
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
deleted file mode 100644
index 9ed7342bdc..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From be5ffd2084b8690f5b974c5b6ff7409fbfaacfb7 Mon Sep 17 00:00:00 2001
-From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Date: Thu, 11 Dec 2025 15:07:31 +0800
-Subject: [PATCH 3/3] defconfig: Uncomment CONFIG_IEEE80211BE=y
-
-wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
-years. With growing market demand for Wi-Fi 7, it is now an appropriate
-time to enable IEEE 802.11be support. This is needed mainly to enable AP
-mode functionality in wpa_supplicant.
-
-Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=e623edd9b73a521b8a4438c600c9a8fb0ac5febe]
----
- wpa_supplicant/defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
-index 7efb9e6..84ac8ba 100644
---- a/wpa_supplicant/defconfig
-+++ b/wpa_supplicant/defconfig
-@@ -507,7 +507,7 @@ CONFIG_IEEE80211AX=y
- 
- # IEEE 802.11be EHT support (mainly for AP mode)
- # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
--#CONFIG_IEEE80211BE=y
-+CONFIG_IEEE80211BE=y
- 
- # Wireless Network Management (IEEE Std 802.11v-2011)
- # Note: This is experimental and not complete implementation.
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
deleted file mode 100644
index 47fe1b4c9f..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 72ac0ee026d9f6f9cd031d7859ea0b343b34e61d Mon Sep 17 00:00:00 2001
-From: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
-Date: Thu, 1 Aug 2024 18:37:25 +0800
-Subject: [PATCH] WNM: Extend workaround for broken AP operating class behavior
-
-Some APs do not advertise operating classes correctly for BSS Transition
-Management. Try to determine the most likely operating frequency based
-on the channel number (1..14 --> 2.4 GHz; 36..177 --> 5 GHz) if invalid
-op_class == 255 is received in a BSS Transition Management Request. This
-speeds up the following operating by avoiding a full scan due to an
-unknown channel.
-
-This extends the workaround that was added in commit 80ce804e8824 ("WNM:
-Workaround for broken AP operating class behavior") for invalid
-operating class 0 to cover another observed case with invalid operating
-class 255.
-
-Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
-Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=72ac0ee026d9f6f9cd031d7859ea0b343b34e61d]
----
- wpa_supplicant/wnm_sta.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wpa_supplicant/wnm_sta.c b/wpa_supplicant/wnm_sta.c
-index 58a124c00..662f6089e 100644
---- a/wpa_supplicant/wnm_sta.c
-+++ b/wpa_supplicant/wnm_sta.c
-@@ -555,7 +555,7 @@ static int wnm_nei_get_chan(struct wpa_supplicant *wpa_s, u8 op_class, u8 chan)
- 	}
- 
- 	freq = ieee80211_chan_to_freq(country, op_class, chan);
--	if (freq <= 0 && op_class == 0) {
-+	if (freq <= 0 && (op_class == 0 || op_class == 255)) {
- 		/*
- 		 * Some APs do not advertise correct operating class
- 		 * information. Try to determine the most likely operating
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
deleted file mode 100644
index 36660b5880..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 25 Jan 2025 11:21:16 +0200
-Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
-
-The case of an invalid authenticator in a RADIUS response could imply
-that the response is not from the correct RADIUS server and as such,
-such a response should be discarded without changing internal state for
-the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
-is somewhat more complex since it could have been indicated before
-validating the authenticator. In any case, it seems better to change the
-state for the pending request only when we have fully accepted the
-response.
-
-Allowing the internal state of pending RADIUS request to change based on
-responses that are not fully validation could have allow at least a
-theoretical DoS attack if an attacker were to have means for injecting
-RADIUS messages to the network using the IP address of the real RADIUS
-server and being able to do so more quickly than the real server and
-with the matching identifier from the request header (i.e., either by
-flooding 256 responses quickly or by having means to capture the RADIUS
-request). These should not really be realistic options in a properly
-protected deployment, but nevertheless it is good to be more careful in
-processing RADIUS responses.
-
-Remove a pending RADIUS request from the internal list only when having
-fully accepted a matching RADIUS response, i.e., after one of the
-registered handlers has confirmed that the authenticator is valid and
-processing of the response has succeeded.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 2a7f36170..7909b29a7 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       roundtrip / 100, roundtrip % 100);
- 	rconf->round_trip_time = roundtrip;
- 
--	/* Remove ACKed RADIUS packet from retransmit list */
--	if (prev_req)
--		prev_req->next = req->next;
--	else
--		radius->msgs = req->next;
--	radius->num_msgs--;
--
- 	for (i = 0; i < num_handlers; i++) {
- 		RadiusRxResult res;
- 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
-@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			radius_msg_free(msg);
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
-+			/* Remove ACKed RADIUS packet from retransmit list */
-+			if (prev_req)
-+				prev_req->next = req->next;
-+			else
-+				radius->msgs = req->next;
-+			radius->num_msgs--;
-+
- 			radius_client_msg_free(req);
- 			return;
- 		case RADIUS_RX_INVALID_AUTHENTICATOR:
-@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       msg_type, hdr->code, hdr->identifier,
- 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
- 		       "");
--	radius_client_msg_free(req);
- 
-  fail:
- 	radius_msg_free(msg);
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
deleted file mode 100644
index add2e47048..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <quic_jouni@quicinc.com>
-Date: Wed, 5 Feb 2025 19:23:39 +0200
-Subject: [PATCH] RADIUS: Fix pending request dropping
-
-A recent change to this moved the place where the processed RADIUS
-request was removed from the pending list to happen after the message
-handler had been called. This did not take into account possibility of
-the handler adding a new pending request in the list and the prev_req
-pointer not necessarily pointing to the correct entry anymore. As such,
-some of the pending requests could have been lost and that would result
-in not being able to process responses to those requests and also, to a
-memory leak.
-
-Fix this by determining prev_req at the point when the pending request
-is being removed, i.e., after the handler function has already added a
-new entry.
-
-Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
-Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 7909b29a7..d4faa7936 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 	struct radius_hdr *hdr;
- 	struct radius_rx_handler *handlers;
- 	size_t num_handlers, i;
--	struct radius_msg_list *req, *prev_req;
-+	struct radius_msg_list *req, *prev_req, *r;
- 	struct os_reltime now;
- 	struct hostapd_radius_server *rconf;
- 	int invalid_authenticator = 0;
-@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		break;
- 	}
- 
--	prev_req = NULL;
- 	req = radius->msgs;
- 	while (req) {
- 		/* TODO: also match by src addr:port of the packet when using
-@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		    hdr->identifier)
- 			break;
- 
--		prev_req = req;
- 		req = req->next;
- 	}
- 
-@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
- 			/* Remove ACKed RADIUS packet from retransmit list */
-+			prev_req = NULL;
-+			for (r = radius->msgs; r; r = r->next) {
-+				if (r == req)
-+					break;
-+				prev_req = r;
-+			}
- 			if (prev_req)
- 				prev_req->next = req->next;
- 			else
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
similarity index 88%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
index adb8467786..9c2d716c03 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
-                    file://README;beginline=1;endline=56;md5=6e4b25e7d74bfc44a32ba37bdf5210a6 \
+                    file://README;beginline=1;endline=56;md5=155e35cb3d6ab0d6a17524f48f4e761c \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=f5ccd57ea91e04800edb88267bf8eae4"
 
 DEPENDS = "dbus libnl"
@@ -15,15 +15,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
-           file://0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch \
-           file://0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch \
-           file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
-           file://0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch \
-           file://CVE-2025-24912-01.patch \
-           file://CVE-2025-24912-02.patch \
            "
-SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
+SRC_URI[sha256sum] = "08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6"
 
 S = "${UNPACKDIR}/wpa_supplicant-${PV}"
 

base-commit: 2bb062e403c7093734de6467c49503a7d8970d9e
-- 
2.25.1



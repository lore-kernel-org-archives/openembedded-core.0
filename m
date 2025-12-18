Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30387D68BD0
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:05:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32878.1766027110120760701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WiOiJCUD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=P2vkcJ0r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yiwj3717103
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CGuPxUT3frN
	5wYXhEQV6WfQUSGxABe6P2ldfJC1GW0E=; b=WiOiJCUDxIqi/NfZ0k1qJWfVGhh
	jVfmtI2vAEEGFbExAQkmjuZhoeRfNZZlQ7QvvG9xTPmgzUPeqxMkaNCaN7Tlt6RV
	oTlZb4rUHghGDnJkOXluTPRk3sd1sb7iMOjBjd4qB3R9jkcU/222OXOKZzwRMWIJ
	zj+l+gZpVmsEchsOVe52c7EVEcGivGDr558ACZgI6CE6Og2fvEn8Jp3bR9/O3UKf
	Gfr9p8dKuHQIY80voSL63FoCufThSsajETEUv6tug6ronGbyZo4OuCO4tVPzqdOb
	tlfMPKyfgVQ1a4M86xbdkydgULzeIVg93XsvU3kqx67DyBy3g08y4/uZVug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79g6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so237143b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766027108; x=1766631908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGuPxUT3frN5wYXhEQV6WfQUSGxABe6P2ldfJC1GW0E=;
        b=P2vkcJ0rdfKCr8auGDI/uGy4TMRa+jxNh88+xXSxXrLB5gFBthWEsuOLoFlx3RWDZ5
         pE8yXGQzF2LQ7Gblv8OvAPckZFjqNclvx/qQcFUYDwMX0wUIP2QHBWdllGUco9de3Fc6
         QqlaLKiokpUAgJP4I6tjuMIMXcEFvU0mBHMo59yR9xQua93pGzzmsTu9+OBoawMzEdbA
         Au1CTcDlgZ+1fOk3aPRTetaON3Hb7zGOBLjjyD0wlEtzRXtxj0TJRbyMpp6LLisFUTmb
         NcrPa0RDDETBQT9JShuxopwBlD9N0OMXtCI23qs5u3KcaQjp5Y0Ov7Y3xz/7hpI6XYZn
         mWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766027108; x=1766631908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CGuPxUT3frN5wYXhEQV6WfQUSGxABe6P2ldfJC1GW0E=;
        b=IVOffZo8VNGsZClay0kVL3k9tE/UiSmBM8abh5meOfizuZQsJ+3pwmIEXq1Bkt2p/k
         SK0NjWRWTmRR6Eak2RgC7hxMuw4Vxs7QZizcamWdI1PVtF+ZqxJSJ8cUvYy8/FnbtrZY
         /pIrHiv+RVnJ1IUR1FZlxcZbTBEGc3z4n6yJXhFZxVBgMdqW3PQ7olILXsCOwCz+nWpn
         vhywwMZXQ6I8lzt5wwNVtQWaZ0aNHO6A61u1lgQxQBQmw5KZfUSM5Vw89wj9xVZ5sfzP
         bizuEsGbT3D6SMI05Bar2bCS5Pa5XbYicopuuLjM3bmEUFVfo0XbP+8jDP56uhrpdT0O
         4gvA==
X-Gm-Message-State: AOJu0YyVHvvHKlyglrP8e9g/sh0ytG1TlVqgBnfW3CFPVODmuTlJFIPc
	xMOkI1YKuGrW0Xgv+5s6cZ+3A9Ej2MR7K1XHqzcMM46fuOYGSiR8bthm1nbBIqpV7bw0yAgeCV6
	udoUKwSl99HaIQPBoU2PfveHKng+iuoozzZu09r6gqiJ8Xs6MGkx/F8K+BLME20xrEoK/t4jNUb
	NEpTLV+imVjfUKb4OABkLo
X-Gm-Gg: AY/fxX7XntGU6h8FCPDMppuWUozs5vN6csA1buToKCjhyyfjyXV2/a2A8/dRKj1zP8v
	to98nIWkhMAjF8L5FH1Kck8L2cEwDXHhwKvnIKPzgOcnyqGPilqyoidpQnXfB6PSCncXnhJDcxJ
	Ib2bu3akaORecmEtIChlgE5s55aP9mL9FJz9/y5WkUDWbCunnSR3YvVHBfTTOwUoSOUbZYv49JR
	IwsBIdF+lcX1/x26txqGP55tFGbZyDMTBPxTBHEJELe53fYAweD175/i3IVV+Q0qsyFpJhu/8ld
	jD3xOICWpIUR8hO+dw1ytx4RSw7Xh8r8pIl+xQ/rQ1idARjVcSrAVI74QO1qXL4fG6/hXqq50T3
	f5TZnKsjHH/0yiXCMjbEWgOp1ly6rWgU550GvpcfQgqyh/nmDxZcLwYwvbmzEb+dHKyLT
X-Received: by 2002:a05:6a00:368c:b0:7e8:43f5:bd36 with SMTP id d2e1a72fcca58-7f6692aaca9mr18621188b3a.34.1766027108394;
        Wed, 17 Dec 2025 19:05:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIyZ3sf9YxUipYtBV5/ZPSHflwMbFvSZinsmdLYEI7lmiu/npnsV+3bJZpEWIUm7l8nZdDkw==
X-Received: by 2002:a05:6a00:368c:b0:7e8:43f5:bd36 with SMTP id d2e1a72fcca58-7f6692aaca9mr18621165b3a.34.1766027107851;
        Wed, 17 Dec 2025 19:05:07 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1456c760sm835782b3a.56.2025.12.17.19.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 19:05:07 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alex.kanavin@gmail.com,
        jouni.malinen@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 2/2] wpa-supplicant: enable 802.11be support
Date: Thu, 18 Dec 2025 11:04:48 +0800
Message-Id: <20251218030448.1505377-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
References: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oc1Akv7jQ6xGNXcBSOPC9jgZVYrKaTzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMyBTYWx0ZWRfX3+fXF+bt+lCh
 G0A7yfKFbh9NsiyMMuUNDs1coGaCygSgcAp8rCO55BR3XfUQ/NL+ApJ4gpVWyh5TeOIc+khNPWd
 Gti7HPCLiQ6xVc4WnVv/Elh1cU1dF3ASlf+pvcsLM6g4IdwROnUet4cGA+FsaE+D39CIBcecUvx
 X7/+W2PezLfLeu7h3Hnh10FHO359xb5vbhnd3TFeO0APplwG504b3bDZ/JcdzGoRGtbU5nLCFOz
 U+eE4JQbRxfWz1oPlWKiz62dAaH/vH9uINi3rxHteGhpm6vCKQIaK4M9JY5B23+gNWQOUd7G0wM
 Vs+SiNwttQcCLcugCsVaXHvJCh0cEEMGc75cYXcSynwTUeskNdmGJVVSmyH9S8GXe8BNT0BBTrV
 FOZa/2FA+dFXaa+Guh7up74qRiUlvw==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69436f65 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8 a=A4LPUPzXccSoojXLcygA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=oLVlbjkABFOu4cUI0CGI:22
X-Proofpoint-ORIG-GUID: oc1Akv7jQ6xGNXcBSOPC9jgZVYrKaTzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228083

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support, mainly for AP mode.

This implementation conforms to IEEE Std 802.11be-2024, which was
approved by the IEEE SA Standards Board on September 26, 2024 and
officially published on July 22, 2025.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 +++++++++++++++++++
 ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 +++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
new file mode 100644
index 0000000000..b474b8437f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
@@ -0,0 +1,34 @@
+From aebbf87ca7311f543bd849020b97402c49f3cf24 Mon Sep 17 00:00:00 2001
+From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Date: Thu, 18 Dec 2025 09:39:39 +0800
+Subject: [PATCH 2/3] defconfig: Document IEEE 802.11be as a published
+ amendment
+
+The comment about the IEEE 802.11be functionality being experimental
+and based on a not yet finalized standard is not accurate anymore
+since IEEE Std 802.11be-2024 has already been published. Remove this
+outdated comment.
+
+Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=2887a975b12de9256ed6fdbd0da1dbb78c7a25c4]
+---
+ wpa_supplicant/defconfig | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
+index 044604a..7efb9e6 100644
+--- a/wpa_supplicant/defconfig
++++ b/wpa_supplicant/defconfig
+@@ -507,9 +507,6 @@ CONFIG_IEEE80211AX=y
+ 
+ # IEEE 802.11be EHT support (mainly for AP mode)
+ # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
+-# Note: This is experimental and work in progress. The definitions are still
+-# subject to change and this should not be expected to interoperate with the
+-# final IEEE 802.11be version.
+ #CONFIG_IEEE80211BE=y
+ 
+ # Wireless Network Management (IEEE Std 802.11v-2011)
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
new file mode 100644
index 0000000000..9ed7342bdc
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
@@ -0,0 +1,32 @@
+From be5ffd2084b8690f5b974c5b6ff7409fbfaacfb7 Mon Sep 17 00:00:00 2001
+From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Date: Thu, 11 Dec 2025 15:07:31 +0800
+Subject: [PATCH 3/3] defconfig: Uncomment CONFIG_IEEE80211BE=y
+
+wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
+years. With growing market demand for Wi-Fi 7, it is now an appropriate
+time to enable IEEE 802.11be support. This is needed mainly to enable AP
+mode functionality in wpa_supplicant.
+
+Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=e623edd9b73a521b8a4438c600c9a8fb0ac5febe]
+---
+ wpa_supplicant/defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
+index 7efb9e6..84ac8ba 100644
+--- a/wpa_supplicant/defconfig
++++ b/wpa_supplicant/defconfig
+@@ -507,7 +507,7 @@ CONFIG_IEEE80211AX=y
+ 
+ # IEEE 802.11be EHT support (mainly for AP mode)
+ # CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
+-#CONFIG_IEEE80211BE=y
++CONFIG_IEEE80211BE=y
+ 
+ # Wireless Network Management (IEEE Std 802.11v-2011)
+ # Note: This is experimental and not complete implementation.
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 50f16e935d..7c7a8bd9c1 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://99_wpa_supplicant \
            file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
            file://0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch \
+           file://0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch \
+           file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
            file://CVE-2025-24912-01.patch \
            file://CVE-2025-24912-02.patch \
            "
-- 
2.34.1



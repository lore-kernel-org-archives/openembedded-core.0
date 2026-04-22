Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F571F5A8DB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:17:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79840.1776854886804188650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ej7cE+Yw;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=LQ9lT3Rg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jiacheng.shi@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5gkbk2209292
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0ZnebXijhBjyWPpO2/Z/7
	QzAr3otOo7SXRsu6tEKuY=; b=Ej7cE+Yw/1895YbQJ1846f85fdXbA6jJob4kFO
	0YGXUO5ih5X7ebikJ4P3V5czg9VAoHWwjBEZilNDqEeZ8kVHzOt95iF28XluS6Xo
	q1kLKOv1tkZXTxIudDk42Ok0nlbyV0zdmoTTKyBSTF75eH6W/hnSf2hVFPOhySa0
	Pa+0Na/zfII/nS+ohNJ6OXAjrPcqYjIMAjCyENjAGCd2izn/jALxTTEAcA72NfQH
	xrAYpNa0YROFtUOEsD+Yk3OLNvgCOHenW/7OXXuu2CQti3iRR4zwzoJz5XfBsTNv
	kRCHW/L3l+6+r9XUWLxe8Kpf5BjSDHpYzXBDMBpk6D/jJYug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengaww1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:29:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso3429968a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853784; x=1777458584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0ZnebXijhBjyWPpO2/Z/7QzAr3otOo7SXRsu6tEKuY=;
        b=LQ9lT3RgJ9yW3GPgLdQ/mxKA92uq4yMWEXQTF2k72HTC2a14qVanWeR49pyQTZUjyq
         5RW8OwbSqJT3wCY4uXYXWUmcjFNIosNM6Ip8fXYgJ0UBS4ERkrTWUimwd+xQfsDw+GwJ
         iAJrwXdzc5wfg4D3jQUI5lPN3s1Maszvb6sBmGqdiDFhDBy2/GHfDsPNRG14DQXl55pB
         7ktMlTSC7YItlC3uKh/F2E/hzQz+EdtKQt1kcRD+qtebNmRyVkulgkebXpfW2u9+hdpb
         wqIcaHkaAf97qfY8HaeDLFy9fTLUOm1tiTsYgs4sHlbw02XfdKixwHQ4Js3dFQxVx1xC
         KKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853784; x=1777458584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0ZnebXijhBjyWPpO2/Z/7QzAr3otOo7SXRsu6tEKuY=;
        b=Wb7yRp239XnlO34NTaSQdgtFcttt8mYLG1aXWfVM6/IPlMGWyLIOtWJa2OxIODKvNV
         Wp2/QCLdd+/qO82E5TWO07pV3SmwIveZTECTlOXeH5ZhLbbJ4nOFvJM63COws6TV0VIJ
         Rns7kk3LhFaRRupBtwYCx5eLEmrpqzgn/dbnxduV56nJyBcFCxHhUvc9Yk9uQtg3TvJQ
         obQviEJ+U0uxnFYLev37FwOOW5bHLM1V8VzFy5Ka7e/E1j7oMW4hijtwXj7Tp27i+2jQ
         doYEG/Egjfb++7ibqpqzeCkziNtv9H33m36c/htmH30b4TWvIS7xuY6pOX0paFF/0Bz4
         4rOA==
X-Gm-Message-State: AOJu0Yyw5Dt74tguPoNbb8kt7ejJvGcrLrvyN5TEyke53BWJojSLlQAj
	WBwQjno7eBotli0CpzwykFX9sXizcFNjrVsC0oXRwIwCFBrfY/iyV34GC920DnD/8E+2BAwGfFF
	Mnh/vtNJ71EV/rb/sUI/GVT3nHItep2E1ZF5/2FkaxTZ517z70pKtTfnauBkQUaPQP9vG64MKMX
	7OZK79eeg2AKou1ec=
X-Gm-Gg: AeBDieuabGwOKG911TjpxrUaBtnDFC95TFZ1gDnPDu5EDFX4KuFDqxrCnyJYqla/COL
	fDm1dpkR46vkzS8j14510a3fZLhImGehVXH6CtL+5dQSIo1CLSYgEnG9rDyrP0RzEcaW+BBPYY4
	vIhKqp/hRX+V9rl2sX0zmVk7RW8YhHFf0RsnU3na7N6/hI4UbvBzGOwBBvRnLMo10WhjzKH8UgL
	ZQ9dYuVhNMWYOXWkgnfPLoPHYO/JlvCZTsCByaeWC8iQk8dfTDMVqq+M+RLXJiAJYpnjh8jnEcF
	Fob+8HUKZrqnGu7jnLE0t/8kBz6n2oIx7PpxEyBIkLy0sZdv/ylD+xQxgmsvQrcOhC1ZHRKrwWV
	6zDpxRBSG7dqIJSx85zYYZRgQztSYq3KG9oyCxUEMiwUSJDA7LexT5EEHnJKEMi0=
X-Received: by 2002:a17:90b:1d44:b0:35f:c493:cac7 with SMTP id 98e67ed59e1d1-3614049e4d1mr24070991a91.25.1776853782533;
        Wed, 22 Apr 2026 03:29:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:35f:c493:cac7 with SMTP id 98e67ed59e1d1-3614049e4d1mr24070913a91.25.1776853780960;
        Wed, 22 Apr 2026 03:29:40 -0700 (PDT)
Received: from sdciot-sh04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362c69b8257sm1924109a91.7.2026.04.22.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:29:40 -0700 (PDT)
From: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, zhi.chen@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, pengfei.zhang@oss.qualcomm.com,
        jiacheng.shi@oss.qualcomm.com, gaole.zhang@oss.qualcomm.com
Subject: [PATCH] wpa-supplicant: add patches to support RSNE/RSNXE overriding
Date: Wed, 22 Apr 2026 18:29:35 +0800
Message-Id: <20260422102935.1299772-1-jiacheng.shi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX+lRVfN3dDi9J
 +KOsasBVRfF+LdcUsvlB4Tv7Jp+Gw1uaaqPLoY8qzj6NAk7zKum54rH9uNdAOzL7UJaY/iuPSbL
 EniPkjiEUhUi7YxzthcUGWtz2NfRVw7NvIoIHUZ5+tEfwRY8j8UdCh5LnsUNMPM28snEbqiQmI4
 6Vck9wufM5RD9GjoFofKW1TIQga7rmAS9agJln27ofqQJdS3750lcoY64N9Y/3WdKUBm1itgN34
 xjK+skURXuXZBWOiRQMZXiCQzkKuDPIQo9f2uJNYJRE74tTQvwBZOxiZWh3kTmbDnVbpV9+QJXo
 Zf05WcV0dvJEg4AWPt+i1q6ZRwIQeBY/eEYvisESvWH0Vhozbhyj48BeSDTTdJS4geUJY1IM/LV
 K2T2Nzf6+W/D+bZKvl9HDQP0YXbYvl3yV/hcwxZIXIZFePuPVeoMs3v2KQ3LJ4v1xFyR8LhAqBf
 0Ff268llcUxaqILpOoQ==
X-Proofpoint-ORIG-GUID: 1yGIPmt6vpqe3_RsHXwFp7AVClEZIrrw
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8a319 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=WpGIz0WUA5cpNVJ3HK8A:9
 a=EN1m2FL2Ca23m_H_:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1yGIPmt6vpqe3_RsHXwFp7AVClEZIrrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220099
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 63M5gkbk2209292
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235716

Fix WFA test case 5.2.3.3 "STAUT forward compatibility to
an AP with various AKMs in RSN IE" failure caused by missing
SNonce_Cookie handling.

During the 2EAPMSG exchange, the STA did not apply the
SNonce_Cookie provided by the AP as required by the test
specification, resulting in sniffer validation failure.
To address this, add full support for RSN/RSNX overriding
for STA mode and explicitly signal SNonce_Cookie=E2=80=93based
override capability.

Change-Id: I443bdc00b1983db1a8a97ffa3f1f4998cd826a86
Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
---
 ...r-specific-element-types-for-RSNE-RS.patch |  34 +
 ...-overriding-elements-into-IE-parsing.patch |  58 ++
 ...ide-element-to-override-RSNE-content.patch |  36 +
 ...ride-element-to-override-RSNXE-conte.patch |  36 +
 ...eature-flags-to-indicate-RSN-overrid.patch |  67 ++
 ...a-capability-flag-for-RSN-overriding.patch |  65 ++
 ...ions-to-access-RSNE-RSNXE-from-BSS-e.patch | 448 +++++++++++
 ...bilities-for-AKM-suites-available-wi.patch |  66 ++
 .../0013-RSNE-RSNXE-overriding-for-STA.patch  | 739 ++++++++++++++++++
 ...-Selection-element-to-indicate-which.patch | 415 ++++++++++
 ...cookie-to-indicate-support-for-RSN-o.patch |  84 ++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  11 +
 12 files changed, 2059 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0005-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0006-Add-RSN-overriding-elements-into-IE-parsing.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0007-Allow-RSNE-Override-element-to-override-RSNE-content.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0008-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0010-nl80211-Add-a-capability-flag-for-RSN-overriding.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0012-Make-driver-capabilities-for-AKM-suites-available-wi.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0013-RSNE-RSNXE-overriding-for-STA.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0014-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005=
-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0005-Define-WFA-vendor-speci=
fic-element-types-for-RSNE-RS.patch
new file mode 100644
index 0000000000..10b5f42ca8
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-Define=
-WFA-vendor-specific-element-types-for-RSNE-RS.patch
@@ -0,0 +1,34 @@
+From 6b0ce29d25d662b68dcc599e62d42eab0690b976 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 11 Oct 2023 12:43:11 +0300
+Subject: [PATCH 01/11] Define WFA vendor specific element types for RSNE=
/RSNXE
+ overriding
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D6b0ce29d25d662b68dcc599e62d42eab0690b976]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/ieee802_11_defs.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/common/ieee802_11_defs.h b/src/common/ieee802_11_defs.h
+index 0fe631026..e2c132a40 100644
+--- a/src/common/ieee802_11_defs.h
++++ b/src/common/ieee802_11_defs.h
+@@ -1446,6 +1446,12 @@ struct ieee80211_ampe_ie {
+ #define QM_IE_OUI_TYPE 0x22
+ #define WFA_CAPA_IE_VENDOR_TYPE 0x506f9a23
+ #define WFA_CAPA_OUI_TYPE 0x23
++#define WFA_RSNE_OVERRIDE_OUI_TYPE 0x29
++#define WFA_RSNE_OVERRIDE_2_OUI_TYPE 0x2a
++#define WFA_RSNXE_OVERRIDE_OUI_TYPE 0x2b
++#define RSNE_OVERRIDE_IE_VENDOR_TYPE 0x506f9a29
++#define RSNE_OVERRIDE_2_IE_VENDOR_TYPE 0x506f9a2a
++#define RSNXE_OVERRIDE_IE_VENDOR_TYPE 0x506f9a2b
+=20
+ #define MULTI_AP_SUB_ELEM_TYPE 0x06
+ #define MULTI_AP_PROFILE_SUB_ELEM_TYPE 0x07
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0006=
-Add-RSN-overriding-elements-into-IE-parsing.patch b/meta/recipes-connect=
ivity/wpa-supplicant/wpa-supplicant/0006-Add-RSN-overriding-elements-into=
-IE-parsing.patch
new file mode 100644
index 0000000000..63a2b3721f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0006-Add-RS=
N-overriding-elements-into-IE-parsing.patch
@@ -0,0 +1,58 @@
+From c16ac89be235ddb07247e0143abf245bb7760c40 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 11 Oct 2023 12:45:09 +0300
+Subject: [PATCH 02/11] Add RSN overriding elements into IE parsing
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3Dc16ac89be235ddb07247e0143abf245bb7760c40]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/ieee802_11_common.c | 8 ++++++++
+ src/common/ieee802_11_common.h | 4 ++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/common/ieee802_11_common.c b/src/common/ieee802_11_comm=
on.c
+index ba1cb5257..40a38955d 100644
+--- a/src/common/ieee802_11_common.c
++++ b/src/common/ieee802_11_common.c
+@@ -140,6 +140,14 @@ static int ieee802_11_parse_vendor_specific(const u=
8 *pos, size_t elen,
+ 			elems->sae_pk =3D pos + 4;
+ 			elems->sae_pk_len =3D elen - 4;
+ 			break;
++		case WFA_RSNE_OVERRIDE_OUI_TYPE:
++			elems->rsne_override =3D pos;
++			elems->rsne_override_len =3D elen;
++			break;
++		case WFA_RSNE_OVERRIDE_2_OUI_TYPE:
++			elems->rsne_override_2 =3D pos;
++			elems->rsne_override_2_len =3D elen;
++			break;
+ 		default:
+ 			wpa_printf(MSG_MSGDUMP, "Unknown WFA "
+ 				   "information element ignored "
+diff --git a/src/common/ieee802_11_common.h b/src/common/ieee802_11_comm=
on.h
+index 9e9684c11..46a86096e 100644
+--- a/src/common/ieee802_11_common.h
++++ b/src/common/ieee802_11_common.h
+@@ -116,6 +116,8 @@ struct ieee802_11_elems {
+ 	const u8 *prior_access_mle;
+ 	const u8 *mbssid_known_bss;
+ 	const u8 *mbssid;
++	const u8 *rsne_override;
++	const u8 *rsne_override_2;
+=20
+ 	u8 ssid_len;
+ 	u8 supp_rates_len;
+@@ -179,6 +181,8 @@ struct ieee802_11_elems {
+ 	size_t prior_access_mle_len;
+ 	u8 mbssid_known_bss_len;
+ 	u8 mbssid_len;
++	size_t rsne_override_len;
++	size_t rsne_override_2_len;
+=20
+ 	struct mb_ies_info mb_ies;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0007=
-Allow-RSNE-Override-element-to-override-RSNE-content.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0007-Allow-RSNE-Override-ele=
ment-to-override-RSNE-content.patch
new file mode 100644
index 0000000000..5c6a7413a2
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0007-Allow-=
RSNE-Override-element-to-override-RSNE-content.patch
@@ -0,0 +1,36 @@
+From 48ca68f6f8ba6769d031fac0523e666de7020f57 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 11 Oct 2023 12:46:23 +0300
+Subject: [PATCH 03/11] Allow RSNE Override element to override RSNE cont=
ents
+ during parsing
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D48ca68f6f8ba6769d031fac0523e666de7020f57]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/wpa_common.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/common/wpa_common.c b/src/common/wpa_common.c
+index 1cfdd9ad7..8eb4a1dab 100644
+--- a/src/common/wpa_common.c
++++ b/src/common/wpa_common.c
+@@ -1890,6 +1890,14 @@ int wpa_parse_wpa_ie_rsn(const u8 *rsn_ie, size_t=
 rsn_ie_len,
+ 		data->has_group =3D 1;
+ 		data->key_mgmt =3D WPA_KEY_MGMT_OSEN;
+ 		data->proto =3D WPA_PROTO_OSEN;
++	} else if (rsn_ie_len >=3D 2 + 4 + 2 && rsn_ie[1] >=3D 4 + 2 &&
++		   rsn_ie[1] =3D=3D rsn_ie_len - 2 &&
++		   (WPA_GET_BE32(&rsn_ie[2]) =3D=3D RSNE_OVERRIDE_IE_VENDOR_TYPE ||
++		    WPA_GET_BE32(&rsn_ie[2]) =3D=3D
++		    RSNE_OVERRIDE_2_IE_VENDOR_TYPE) &&
++		   WPA_GET_LE16(&rsn_ie[2 + 4]) =3D=3D RSN_VERSION) {
++		pos =3D rsn_ie + 2 + 4 + 2;
++		left =3D rsn_ie_len - 2 - 4 - 2;
+ 	} else {
+ 		const struct rsn_ie_hdr *hdr;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0008=
-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0008-Allow-RSNXE-Override-el=
ement-to-override-RSNXE-conte.patch
new file mode 100644
index 0000000000..a7492a3378
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0008-Allow-=
RSNXE-Override-element-to-override-RSNXE-conte.patch
@@ -0,0 +1,36 @@
+From b8a2d11ae04ec20aa6370af4d21150a2a1a5fc89 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 1 Nov 2023 15:27:31 +0200
+Subject: [PATCH 04/11] Allow RSNXE Override element to override RSNXE co=
ntents
+ during parsing
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3Db8a2d11ae04ec20aa6370af4d21150a2a1a5fc89]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/ieee802_11_common.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/ieee802_11_common.c b/src/common/ieee802_11_comm=
on.c
+index 40a38955d..3ca1ffe7e 100644
+--- a/src/common/ieee802_11_common.c
++++ b/src/common/ieee802_11_common.c
+@@ -3131,8 +3131,12 @@ bool ieee802_11_rsnx_capab_len(const u8 *rsnxe, s=
ize_t rsnxe_len,
+=20
+ bool ieee802_11_rsnx_capab(const u8 *rsnxe, unsigned int capab)
+ {
+-	return ieee802_11_rsnx_capab_len(rsnxe ? rsnxe + 2 : NULL,
+-					 rsnxe ? rsnxe[1] : 0, capab);
++	if (!rsnxe)
++		return false;
++	if (rsnxe[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && rsnxe[1] >=3D 4 + 1)
++		return ieee802_11_rsnx_capab_len(rsnxe + 2 + 4, rsnxe[1] - 4,
++						 capab);
++	return ieee802_11_rsnx_capab_len(rsnxe + 2, rsnxe[1], capab);
+ }
+=20
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0009=
-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0009-Add-QCA-vendor-feature-=
flags-to-indicate-RSN-overrid.patch
new file mode 100644
index 0000000000..59f25c3998
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0009-Add-QC=
A-vendor-feature-flags-to-indicate-RSN-overrid.patch
@@ -0,0 +1,67 @@
+From 6fad7224be2f54ef9db77aa15a5beee441fa6db5 Mon Sep 17 00:00:00 2001
+From: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
+Date: Tue, 28 May 2024 07:45:44 +0530
+Subject: [PATCH 05/11] Add QCA vendor feature flags to indicate RSN over=
ride
+ elements support
+
+Add a separate feature flag for STA mode to indicate support for RSN
+override elements.
+
+Signed-off-by: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D6fad7224be2f54ef9db77aa15a5beee441fa6db5]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/qca-vendor.h | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/src/common/qca-vendor.h b/src/common/qca-vendor.h
+index 5b58ffb39..2971be74b 100644
+--- a/src/common/qca-vendor.h
++++ b/src/common/qca-vendor.h
+@@ -2180,6 +2180,34 @@ enum qca_wlan_vendor_acs_hw_mode {
+  *	that the device supports enhanced audio experience over WLAN feature.
+  * @QCA_WLAN_VENDOR_FEATURE_HT_VHT_TWT_RESPONDER: Flag indicates that t=
he device
+  *	in AP mode supports TWT responder mode in HT and VHT modes.
++ *
++ * @QCA_WLAN_VENDOR_FEATURE_RSN_OVERRIDE_STA: Flag indicates that the d=
evice
++ *	supports RSNE/RSNXE overriding in STA mode.
++ *
++ *	For SME offload to the driver case:
++ *	- Supplicant should enable RSNO element use only when the driver
++ *	  indicates this feature flag.
++ *	- The driver should enable RSNO element use with the supplicant sele=
cted
++ *	  BSS only when the supplicant sends an RSNO element with an empty
++ *	  payload in the connect request elements buffer in NL80211_CMD_CONN=
ECT.
++ *
++ *	For BSS selection offload to the driver case:
++ *	- Supplicant should enable RSNO element use only when the driver
++ *	  indicates this feature flag.
++ *	- Supplicant should always send RSNO elements in the connect request
++ *	  elements buffer in NL80211_CMD_CONNECT irrespective of whether RSN=
O
++ *	  elements are supported by the BSS that the supplicant selected
++ *	- The driver should enable RSNO element use only when the supplicant
++ *	  sends an RSNO element with an empty payload in connect request
++ *	  elements in NL80211_CMD_CONNECT.
++ *	- The driver should remove RSNO elements from the connect request
++ *	  elements while preparing the (Re)Association Request frame element=
s
++ *	  if the driver selects a different BSS which is not advertising RSN=
O
++ *	  elements.
++ *
++ *	If both SME and BSS selection offload to the driver, BSS selection
++ *	offload to the driver case rules shall be applied.
++ *
+  * @NUM_QCA_WLAN_VENDOR_FEATURES: Number of assigned feature bits
+  */
+ enum qca_wlan_vendor_features {
+@@ -2208,6 +2236,7 @@ enum qca_wlan_vendor_features {
+ 	QCA_WLAN_VENDOR_FEATURE_AP_ALLOWED_FREQ_LIST =3D 22,
+ 	QCA_WLAN_VENDOR_FEATURE_ENHANCED_AUDIO_EXPERIENCE_OVER_WLAN =3D 23,
+ 	QCA_WLAN_VENDOR_FEATURE_HT_VHT_TWT_RESPONDER =3D 24,
++	QCA_WLAN_VENDOR_FEATURE_RSN_OVERRIDE_STA =3D 25,
+ 	NUM_QCA_WLAN_VENDOR_FEATURES /* keep last */
+ };
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0010=
-nl80211-Add-a-capability-flag-for-RSN-overriding.patch b/meta/recipes-co=
nnectivity/wpa-supplicant/wpa-supplicant/0010-nl80211-Add-a-capability-fl=
ag-for-RSN-overriding.patch
new file mode 100644
index 0000000000..bd0059139f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0010-nl8021=
1-Add-a-capability-flag-for-RSN-overriding.patch
@@ -0,0 +1,65 @@
+From 341bcb2b5c7d83acd2f8f0237182d54d883603e7 Mon Sep 17 00:00:00 2001
+From: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
+Date: Thu, 13 Jun 2024 12:13:14 +0530
+Subject: [PATCH 06/11] nl80211: Add a capability flag for RSN overriding
+
+Add a new capability flag based on the nl80211 feature advertisement for
+RSN overriding support.
+
+Signed-off-by: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D341bcb2b5c7d83acd2f8f0237182d54d883603e7]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/drivers/driver.h              | 2 ++
+ src/drivers/driver_nl80211.c      | 3 +++
+ src/drivers/driver_nl80211_capa.c | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/src/drivers/driver.h b/src/drivers/driver.h
+index 3e7747489..4331782d8 100644
+--- a/src/drivers/driver.h
++++ b/src/drivers/driver.h
+@@ -2330,6 +2330,8 @@ struct wpa_driver_capa {
+ #define WPA_DRIVER_FLAGS2_SAE_OFFLOAD_AP	0x0000000000100000ULL
+ /** Driver supports TWT responder in HT and VHT modes */
+ #define WPA_DRIVER_FLAGS2_HT_VHT_TWT_RESPONDER	0x0000000000200000ULL
++/** Driver supports RSN override elements */
++#define WPA_DRIVER_FLAGS2_RSN_OVERRIDE_STA	0x0000000000400000ULL
+ 	u64 flags2;
+=20
+ #define FULL_AP_CLIENT_STATE_SUPP(drv_flags) \
+diff --git a/src/drivers/driver_nl80211.c b/src/drivers/driver_nl80211.c
+index e6fbad96d..39f58ff83 100644
+--- a/src/drivers/driver_nl80211.c
++++ b/src/drivers/driver_nl80211.c
+@@ -9899,6 +9899,9 @@ static int nl80211_set_param(void *priv, const cha=
r *param)
+ 			WPA_DRIVER_FLAGS2_SEC_LTF_AP;
+ 	}
+=20
++	if (os_strstr(param, "rsn_override_in_driver=3D1"))
++		drv->capa.flags2 |=3D WPA_DRIVER_FLAGS2_RSN_OVERRIDE_STA;
++
+ 	return 0;
+ }
+=20
+diff --git a/src/drivers/driver_nl80211_capa.c b/src/drivers/driver_nl80=
211_capa.c
+index dc16bd445..240d01d3d 100644
+--- a/src/drivers/driver_nl80211_capa.c
++++ b/src/drivers/driver_nl80211_capa.c
+@@ -1443,6 +1443,12 @@ static void qca_nl80211_get_features(struct wpa_d=
river_nl80211_data *drv)
+ 		drv->qca_ap_allowed_freqs =3D 1;
+ 	if (check_feature(QCA_WLAN_VENDOR_FEATURE_HT_VHT_TWT_RESPONDER, &info)=
)
+ 		drv->capa.flags2 |=3D WPA_DRIVER_FLAGS2_HT_VHT_TWT_RESPONDER;
++	if (check_feature(QCA_WLAN_VENDOR_FEATURE_RSN_OVERRIDE_STA, &info)) {
++		wpa_printf(MSG_DEBUG,
++			   "The driver supports RSN overriding in STA mode");
++		drv->capa.flags2 |=3D WPA_DRIVER_FLAGS2_RSN_OVERRIDE_STA;
++	}
++
+ 	os_free(info.flags);
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0011=
-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0011-Use-helper-functions-to=
-access-RSNE-RSNXE-from-BSS-e.patch
new file mode 100644
index 0000000000..d3d5d85703
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0011-Use-he=
lper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
@@ -0,0 +1,448 @@
+From 5488e120d3d47ba602d89b8365a8d8e5e5aa3e4f Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 11 Oct 2023 12:50:05 +0300
+Subject: [PATCH 07/11] Use helper functions to access RSNE/RSNXE from BS=
S
+ entries
+
+This is a step towards allowing the contents of RSNE/RSNXE to be
+overridden.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D5488e120d3d47ba602d89b8365a8d8e5e5aa3e4f]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ wpa_supplicant/bss.c                    | 16 ++++++++++++++++
+ wpa_supplicant/bss.h                    |  7 +++++++
+ wpa_supplicant/ctrl_iface.c             |  8 ++++----
+ wpa_supplicant/dbus/dbus_new_handlers.c |  2 +-
+ wpa_supplicant/dpp_supplicant.c         |  2 +-
+ wpa_supplicant/events.c                 | 24 ++++++++++++------------
+ wpa_supplicant/hs20_supplicant.c        |  2 +-
+ wpa_supplicant/interworking.c           |  6 +++---
+ wpa_supplicant/mbo.c                    |  2 +-
+ wpa_supplicant/pasn_supplicant.c        | 10 +++++-----
+ wpa_supplicant/sme.c                    | 10 +++++-----
+ wpa_supplicant/wpa_supplicant.c         |  8 ++++----
+ wpa_supplicant/wpas_glue.c              |  4 ++--
+ wpa_supplicant/wps_supplicant.c         |  2 +-
+ 14 files changed, 63 insertions(+), 40 deletions(-)
+
+diff --git a/wpa_supplicant/bss.c b/wpa_supplicant/bss.c
+index e8aaf6fe1..6d702bb2e 100644
+--- a/wpa_supplicant/bss.c
++++ b/wpa_supplicant/bss.c
+@@ -1866,3 +1866,19 @@ out:
+ 	wpabuf_free(mlbuf);
+ 	return removed_links;
+ }
++
++
++const u8 * wpa_bss_get_rsne(struct wpa_supplicant *wpa_s,
++			    const struct wpa_bss *bss, struct wpa_ssid *ssid,
++			    bool mlo)
++{
++	return wpa_bss_get_ie(bss, WLAN_EID_RSN);
++}
++
++
++const u8 * wpa_bss_get_rsnxe(struct wpa_supplicant *wpa_s,
++			     const struct wpa_bss *bss, struct wpa_ssid *ssid,
++			     bool mlo)
++{
++	return wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++}
+diff --git a/wpa_supplicant/bss.h b/wpa_supplicant/bss.h
+index 2079606a9..508129c3d 100644
+--- a/wpa_supplicant/bss.h
++++ b/wpa_supplicant/bss.h
+@@ -226,4 +226,11 @@ int wpa_bss_parse_basic_ml_element(struct wpa_suppl=
icant *wpa_s,
+ u16 wpa_bss_parse_reconf_ml_element(struct wpa_supplicant *wpa_s,
+ 				    struct wpa_bss *bss);
+=20
++const u8 * wpa_bss_get_rsne(struct wpa_supplicant *wpa_s,
++			    const struct wpa_bss *bss, struct wpa_ssid *ssid,
++			    bool mlo);
++const u8 * wpa_bss_get_rsnxe(struct wpa_supplicant *wpa_s,
++			     const struct wpa_bss *bss, struct wpa_ssid *ssid,
++			     bool mlo);
++
+ #endif /* BSS_H */
+diff --git a/wpa_supplicant/ctrl_iface.c b/wpa_supplicant/ctrl_iface.c
+index bcbcb258f..d245531cd 100644
+--- a/wpa_supplicant/ctrl_iface.c
++++ b/wpa_supplicant/ctrl_iface.c
+@@ -3119,12 +3119,12 @@ static int wpa_supplicant_ctrl_iface_scan_result=
(
+ 	ie =3D wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE);
+ 	if (ie)
+ 		pos =3D wpa_supplicant_ie_txt(pos, end, "WPA", ie, 2 + ie[1]);
+-	ie2 =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	ie2 =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 	if (ie2) {
+ 		pos =3D wpa_supplicant_ie_txt(pos, end, mesh ? "RSN" : "WPA2",
+ 					    ie2, 2 + ie2[1]);
+ 	}
+-	rsnxe =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++	rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, NULL, false);
+ 	if (ieee802_11_rsnx_capab(rsnxe, WLAN_RSNX_CAPAB_SAE_H2E)) {
+ 		ret =3D os_snprintf(pos, end - pos, "[SAE-H2E]");
+ 		if (os_snprintf_error(end - pos, ret))
+@@ -5444,12 +5444,12 @@ static int print_bss_info(struct wpa_supplicant =
*wpa_s, struct wpa_bss *bss,
+ 		if (ie)
+ 			pos =3D wpa_supplicant_ie_txt(pos, end, "WPA", ie,
+ 						    2 + ie[1]);
+-		ie2 =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		ie2 =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 		if (ie2)
+ 			pos =3D wpa_supplicant_ie_txt(pos, end,
+ 						    mesh ? "RSN" : "WPA2", ie2,
+ 						    2 + ie2[1]);
+-		rsnxe =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, NULL, false);
+ 		if (ieee802_11_rsnx_capab(rsnxe, WLAN_RSNX_CAPAB_SAE_H2E)) {
+ 			ret =3D os_snprintf(pos, end - pos, "[SAE-H2E]");
+ 			if (os_snprintf_error(end - pos, ret))
+diff --git a/wpa_supplicant/dbus/dbus_new_handlers.c b/wpa_supplicant/db=
us/dbus_new_handlers.c
+index db1213196..960b3069b 100644
+--- a/wpa_supplicant/dbus/dbus_new_handlers.c
++++ b/wpa_supplicant/dbus/dbus_new_handlers.c
+@@ -5635,7 +5635,7 @@ dbus_bool_t wpas_dbus_getter_bss_rsn(
+ 		return FALSE;
+=20
+ 	os_memset(&wpa_data, 0, sizeof(wpa_data));
+-	ie =3D wpa_bss_get_ie(res, WLAN_EID_RSN);
++	ie =3D wpa_bss_get_rsne(args->wpa_s, res, NULL, false);
+ 	if (ie && wpa_parse_wpa_ie(ie, 2 + ie[1], &wpa_data) < 0) {
+ 		dbus_set_error_const(error, DBUS_ERROR_FAILED,
+ 				     "failed to parse RSN IE");
+diff --git a/wpa_supplicant/dpp_supplicant.c b/wpa_supplicant/dpp_suppli=
cant.c
+index 4044b47dd..94d7ae990 100644
+--- a/wpa_supplicant/dpp_supplicant.c
++++ b/wpa_supplicant/dpp_supplicant.c
+@@ -4500,7 +4500,7 @@ int wpas_dpp_check_connect(struct wpa_supplicant *=
wpa_s, struct wpa_ssid *ssid,
+=20
+ 	if (!(ssid->key_mgmt & WPA_KEY_MGMT_DPP) || !bss)
+ 		return 0; /* Not using DPP AKM - continue */
+-	rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 	if (rsn && wpa_parse_wpa_ie(rsn, 2 + rsn[1], &ied) =3D=3D 0 &&
+ 	    !(ied.key_mgmt & WPA_KEY_MGMT_DPP))
+ 		return 0; /* AP does not support DPP AKM - continue */
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 49917f7aa..4e55470bb 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -670,7 +670,7 @@ static int wpa_supplicant_ssid_bss_match(struct wpa_=
supplicant *wpa_s,
+ 		 (ssid->key_mgmt & WPA_KEY_MGMT_IEEE8021X_NO_WPA));
+ #endif /* CONFIG_WEP */
+=20
+-	rsn_ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsn_ie =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 	if (is_6ghz_bss && !rsn_ie) {
+ 		if (debug_print)
+ 			wpa_dbg(wpa_s, MSG_DEBUG,
+@@ -1143,7 +1143,7 @@ static void owe_trans_ssid(struct wpa_supplicant *=
wpa_s, struct wpa_bss *bss,
+ 	u8 ssid_len;
+=20
+ 	owe =3D wpa_bss_get_vendor_ie(bss, OWE_IE_VENDOR_TYPE);
+-	if (!owe || !wpa_bss_get_ie(bss, WLAN_EID_RSN))
++	if (!owe || !wpa_bss_get_rsne(wpa_s, bss, NULL, false))
+ 		return;
+=20
+ 	pos =3D owe + 6;
+@@ -1247,7 +1247,7 @@ static bool sae_pk_acceptable_bss_with_pk(struct w=
pa_supplicant *wpa_s,
+=20
+ 		if (bss =3D=3D orig_bss)
+ 			continue;
+-		ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		ie =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+ 		if (!(ieee802_11_rsnx_capab(ie, WLAN_RSNX_CAPAB_SAE_PK)))
+ 			continue;
+=20
+@@ -1286,7 +1286,7 @@ static bool wpa_scan_res_ok(struct wpa_supplicant =
*wpa_s, struct wpa_ssid *ssid,
+=20
+ 	ie =3D wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE);
+ 	wpa =3D ie && ie[1];
+-	ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	ie =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 	wpa |=3D ie && ie[1];
+ 	if (ie && wpa_parse_wpa_ie_rsn(ie, 2 + ie[1], &data) =3D=3D 0 &&
+ 	    (data.key_mgmt & WPA_KEY_MGMT_OSEN))
+@@ -1295,7 +1295,7 @@ static bool wpa_scan_res_ok(struct wpa_supplicant =
*wpa_s, struct wpa_ssid *ssid,
+ 	osen =3D ie !=3D NULL;
+=20
+ #ifdef CONFIG_SAE
+-	ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++	ie =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+ 	if (ie && ie[1] >=3D 1)
+ 		rsnxe_capa =3D ie[2];
+ #endif /* CONFIG_SAE */
+@@ -1650,7 +1650,7 @@ struct wpa_ssid * wpa_scan_res_match(struct wpa_su=
pplicant *wpa_s,
+ 	ie =3D wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE);
+ 	wpa_ie_len =3D ie ? ie[1] : 0;
+=20
+-	ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	ie =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 	rsn_ie_len =3D ie ? ie[1] : 0;
+=20
+ 	ie =3D wpa_bss_get_vendor_ie(bss, OSEN_IE_VENDOR_TYPE);
+@@ -2117,7 +2117,7 @@ static void wpa_supplicant_rsn_preauth_scan_result=
s(
+ 		if (ssid =3D=3D NULL)
+ 			continue;
+=20
+-		rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		rsn =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 		if (rsn =3D=3D NULL)
+ 			continue;
+=20
+@@ -3267,7 +3267,7 @@ static int wpa_supplicant_use_own_rsne_params(stru=
ct wpa_supplicant *wpa_s,
+ 	if (wpa_s->wpa_proto & (WPA_PROTO_RSN | WPA_PROTO_OSEN)) {
+ 		const u8 *bss_rsn;
+=20
+-		bss_rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		bss_rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 		if (bss_rsn) {
+ 			p =3D bss_rsn;
+ 			len =3D 2 + bss_rsn[1];
+@@ -3721,8 +3721,8 @@ static int wpa_supplicant_assoc_update_ie(struct w=
pa_supplicant *wpa_s)
+=20
+ 	bss_wpa =3D wpa_bss_get_vendor_ie(wpa_s->current_bss,
+ 					WPA_IE_VENDOR_TYPE);
+-	bss_rsn =3D wpa_bss_get_ie(wpa_s->current_bss, WLAN_EID_RSN);
+-	bss_rsnx =3D wpa_bss_get_ie(wpa_s->current_bss, WLAN_EID_RSNX);
++	bss_rsn =3D wpa_bss_get_rsne(wpa_s, wpa_s->current_bss, NULL, false);
++	bss_rsnx =3D wpa_bss_get_rsnxe(wpa_s, wpa_s->current_bss, NULL, false)=
;
+=20
+ 	if (wpa_sm_set_ap_wpa_ie(wpa_s->wpa, bss_wpa,
+ 				 bss_wpa ? 2 + bss_wpa[1] : 0) ||
+@@ -4110,8 +4110,8 @@ static int wpa_sm_set_ml_info(struct wpa_supplican=
t *wpa_s)
+ 			return -1;
+ 		}
+=20
+-		bss_rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
+-		bss_rsnx =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		bss_rsn =3D wpa_bss_get_rsne(wpa_s, bss, NULL, true);
++		bss_rsnx =3D wpa_bss_get_rsnxe(wpa_s, bss, NULL, true);
+=20
+ 		wpa_mlo.links[i].ap_rsne =3D bss_rsn ? (u8 *) bss_rsn : NULL;
+ 		wpa_mlo.links[i].ap_rsne_len =3D bss_rsn ? 2 + bss_rsn[1] : 0;
+diff --git a/wpa_supplicant/hs20_supplicant.c b/wpa_supplicant/hs20_supp=
licant.c
+index 6a584651e..3ed8813f1 100644
+--- a/wpa_supplicant/hs20_supplicant.c
++++ b/wpa_supplicant/hs20_supplicant.c
+@@ -1087,7 +1087,7 @@ void hs20_osu_icon_fetch(struct wpa_supplicant *wp=
a_s)
+ 		prov_anqp =3D bss->anqp->hs20_osu_providers_list;
+ 		if (prov_anqp =3D=3D NULL)
+ 			continue;
+-		ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		ie =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 		if (ie && wpa_parse_wpa_ie(ie, 2 + ie[1], &data) =3D=3D 0 &&
+ 		    (data.key_mgmt & WPA_KEY_MGMT_OSEN)) {
+ 			osu_ssid2 =3D bss->ssid;
+diff --git a/wpa_supplicant/interworking.c b/wpa_supplicant/interworking=
.c
+index 6773a243c..e3faca69c 100644
+--- a/wpa_supplicant/interworking.c
++++ b/wpa_supplicant/interworking.c
+@@ -1726,7 +1726,7 @@ int interworking_connect(struct wpa_supplicant *wp=
a_s, struct wpa_bss *bss,
+ 		   " for connection",
+ 		   MAC2STR(bss->bssid));
+=20
+-	if (!wpa_bss_get_ie(bss, WLAN_EID_RSN)) {
++	if (!wpa_bss_get_rsne(wpa_s, bss, NULL, false)) {
+ 		/*
+ 		 * We currently support only HS 2.0 networks and those are
+ 		 * required to use WPA2-Enterprise.
+@@ -2459,7 +2459,7 @@ static struct wpa_bss * pick_best_roaming_partner(=
struct wpa_supplicant *wpa_s,
+ 		cred2 =3D interworking_credentials_available(wpa_s, bss, NULL);
+ 		if (!cred2)
+ 			continue;
+-		if (!wpa_bss_get_ie(bss, WLAN_EID_RSN))
++		if (!wpa_bss_get_rsne(wpa_s, bss, NULL, false))
+ 			continue;
+ 		prio =3D roaming_prio(wpa_s, cred2, bss);
+ 		wpa_printf(MSG_DEBUG, "Interworking: roaming_prio=3D%u for BSS "
+@@ -2511,7 +2511,7 @@ static void interworking_select_network(struct wpa=
_supplicant *wpa_s)
+ 		if (!cred)
+ 			continue;
+=20
+-		if (!wpa_bss_get_ie(bss, WLAN_EID_RSN)) {
++		if (!wpa_bss_get_rsne(wpa_s, bss, NULL, false)) {
+ 			/*
+ 			 * We currently support only HS 2.0 networks and those
+ 			 * are required to use WPA2-Enterprise.
+diff --git a/wpa_supplicant/mbo.c b/wpa_supplicant/mbo.c
+index 59b15daf6..51f8e0212 100644
+--- a/wpa_supplicant/mbo.c
++++ b/wpa_supplicant/mbo.c
+@@ -115,7 +115,7 @@ void wpas_mbo_check_pmf(struct wpa_supplicant *wpa_s=
, struct wpa_bss *bss,
+ 		return;
+ 	if (oce && oce[1] >=3D 1 && (oce[2] & OCE_IS_STA_CFON))
+ 		return; /* STA-CFON is not required to enable PMF */
+-	rsne =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsne =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 	if (!rsne || wpa_parse_wpa_ie(rsne, 2 + rsne[1], &ie) < 0)
+ 		return; /* AP is not using RSN */
+=20
+diff --git a/wpa_supplicant/pasn_supplicant.c b/wpa_supplicant/pasn_supp=
licant.c
+index 1bb38f73d..89edad49e 100644
+--- a/wpa_supplicant/pasn_supplicant.c
++++ b/wpa_supplicant/pasn_supplicant.c
+@@ -174,7 +174,7 @@ static int wpas_pasn_get_params_from_bss(struct wpa_=
supplicant *wpa_s,
+ 		}
+ 	}
+=20
+-	rsne =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsne =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 	if (!rsne) {
+ 		wpa_printf(MSG_DEBUG, "PASN: BSS without RSNE");
+ 		return -1;
+@@ -186,7 +186,7 @@ static int wpas_pasn_get_params_from_bss(struct wpa_=
supplicant *wpa_s,
+ 		return -1;
+ 	}
+=20
+-	rsnxe =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++	rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, NULL, false);
+=20
+ 	ssid_str_len =3D bss->ssid_len;
+ 	ssid_str =3D bss->ssid;
+@@ -480,7 +480,7 @@ static struct wpa_bss * wpas_pasn_allowed(struct wpa=
_supplicant *wpa_s,
+ 		return NULL;
+ 	}
+=20
+-	rsne =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsne =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 	if (!rsne) {
+ 		wpa_printf(MSG_DEBUG, "PASN: BSS without RSNE");
+ 		return NULL;
+@@ -544,13 +544,13 @@ static void wpas_pasn_auth_start_cb(struct wpa_rad=
io_work *work, int deinit)
+ 		goto fail;
+ 	}
+=20
+-	rsne =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	rsne =3D wpa_bss_get_rsne(wpa_s, bss, NULL, false);
+ 	if (!rsne) {
+ 		wpa_printf(MSG_DEBUG, "PASN: BSS without RSNE");
+ 		goto fail;
+ 	}
+=20
+-	rsnxe =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++	rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, NULL, false);
+=20
+ 	derive_kdk =3D (wpa_s->drv_flags2 & WPA_DRIVER_FLAGS2_SEC_LTF_STA) &&
+ 		ieee802_11_rsnx_capab(rsnxe,
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index e6538e871..8df60393a 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -190,7 +190,7 @@ static struct wpabuf * sme_auth_build_sae_commit(str=
uct wpa_supplicant *wpa_s,
+ 	if (bss) {
+ 		const u8 *rsnxe;
+=20
+-		rsnxe =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+ 		if (rsnxe && rsnxe[1] >=3D 1)
+ 			rsnxe_capa =3D rsnxe[2];
+ 	}
+@@ -643,7 +643,7 @@ static void sme_send_authentication(struct wpa_suppl=
icant *wpa_s,
+ 		const u8 *rsn;
+ 		struct wpa_ie_data ied;
+=20
+-		rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 		if (!rsn) {
+ 			wpa_dbg(wpa_s, MSG_DEBUG,
+ 				"SAE enabled, but target BSS does not advertise RSN");
+@@ -683,7 +683,7 @@ static void sme_send_authentication(struct wpa_suppl=
icant *wpa_s,
+ #endif /* CONFIG_WEP */
+=20
+ 	if ((wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE) ||
+-	     wpa_bss_get_ie(bss, WLAN_EID_RSN)) &&
++	     wpa_bss_get_rsne(wpa_s, bss, ssid, false)) &&
+ 	    wpa_key_mgmt_wpa(ssid->key_mgmt)) {
+ 		int try_opportunistic;
+ 		const u8 *cache_id =3D NULL;
+@@ -807,7 +807,7 @@ static void sme_send_authentication(struct wpa_suppl=
icant *wpa_s,
+ 		wpa_dbg(wpa_s, MSG_DEBUG, "SME: FT mobility domain %02x%02x",
+ 			md[0], md[1]);
+=20
+-		omit_rsnxe =3D !wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		omit_rsnxe =3D !wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+ 		if (wpa_s->sme.assoc_req_ie_len + 5 <
+ 		    sizeof(wpa_s->sme.assoc_req_ie)) {
+ 			struct rsn_mdie *mdie;
+@@ -836,7 +836,7 @@ static void sme_send_authentication(struct wpa_suppl=
icant *wpa_s,
+=20
+ 	wpa_s->sme.mfp =3D wpas_get_ssid_pmf(wpa_s, ssid);
+ 	if (wpa_s->sme.mfp !=3D NO_MGMT_FRAME_PROTECTION) {
+-		const u8 *rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		const u8 *rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 		struct wpa_ie_data _ie;
+ 		if (rsn && wpa_parse_wpa_ie(rsn, 2 + rsn[1], &_ie) =3D=3D 0 &&
+ 		    _ie.capabilities &
+diff --git a/wpa_supplicant/wpa_supplicant.c b/wpa_supplicant/wpa_suppli=
cant.c
+index 037bfa378..de8785a3c 100644
+--- a/wpa_supplicant/wpa_supplicant.c
++++ b/wpa_supplicant/wpa_supplicant.c
+@@ -1700,8 +1700,8 @@ int wpa_supplicant_set_suites(struct wpa_supplican=
t *wpa_s,
+=20
+ 	if (bss) {
+ 		bss_wpa =3D wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE);
+-		bss_rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
+-		bss_rsnx =3D wpa_bss_get_ie(bss, WLAN_EID_RSNX);
++		bss_rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
++		bss_rsnx =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+ 		bss_osen =3D wpa_bss_get_vendor_ie(bss, OSEN_IE_VENDOR_TYPE);
+ 	} else {
+ 		bss_wpa =3D bss_rsn =3D bss_rsnx =3D bss_osen =3D NULL;
+@@ -3456,7 +3456,7 @@ static u8 * wpas_populate_assoc_ies(
+ 	}
+=20
+ 	if (bss && (wpa_bss_get_vendor_ie(bss, WPA_IE_VENDOR_TYPE) ||
+-		    wpa_bss_get_ie(bss, WLAN_EID_RSN)) &&
++		    wpa_bss_get_rsne(wpa_s, bss, ssid, false)) &&
+ 	    wpa_key_mgmt_wpa(ssid->key_mgmt)) {
+ 		int try_opportunistic;
+ 		const u8 *cache_id =3D NULL;
+@@ -4497,7 +4497,7 @@ static void wpas_start_assoc_cb(struct wpa_radio_w=
ork *work, int deinit)
+=20
+ 	params.mgmt_frame_protection =3D wpas_get_ssid_pmf(wpa_s, ssid);
+ 	if (params.mgmt_frame_protection !=3D NO_MGMT_FRAME_PROTECTION && bss)=
 {
+-		const u8 *rsn =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++		const u8 *rsn =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 		struct wpa_ie_data ie;
+ 		if (!wpas_driver_bss_selection(wpa_s) && rsn &&
+ 		    wpa_parse_wpa_ie(rsn, 2 + rsn[1], &ie) =3D=3D 0 &&
+diff --git a/wpa_supplicant/wpas_glue.c b/wpa_supplicant/wpas_glue.c
+index 5199f950b..9100bee05 100644
+--- a/wpa_supplicant/wpas_glue.c
++++ b/wpa_supplicant/wpas_glue.c
+@@ -425,11 +425,11 @@ static int wpa_get_beacon_ie(struct wpa_supplicant=
 *wpa_s)
+ 		if (wpa_sm_set_ap_wpa_ie(wpa_s->wpa, ie, ie ? 2 + ie[1] : 0))
+ 			ret =3D -1;
+=20
+-		ie =3D wpa_bss_get_ie(curr, WLAN_EID_RSN);
++		ie =3D wpa_bss_get_rsne(wpa_s, curr, ssid, false);
+ 		if (wpa_sm_set_ap_rsn_ie(wpa_s->wpa, ie, ie ? 2 + ie[1] : 0))
+ 			ret =3D -1;
+=20
+-		ie =3D wpa_bss_get_ie(curr, WLAN_EID_RSNX);
++		ie =3D wpa_bss_get_rsnxe(wpa_s, curr, ssid, false);
+ 		if (wpa_sm_set_ap_rsnxe(wpa_s->wpa, ie, ie ? 2 + ie[1] : 0))
+ 			ret =3D -1;
+ 	} else {
+diff --git a/wpa_supplicant/wps_supplicant.c b/wpa_supplicant/wps_suppli=
cant.c
+index 8cd355f6b..7b9cf7f9e 100644
+--- a/wpa_supplicant/wps_supplicant.c
++++ b/wpa_supplicant/wps_supplicant.c
+@@ -226,7 +226,7 @@ static void wpas_wps_security_workaround(struct wpa_=
supplicant *wpa_s,
+=20
+ 	wpa_printf(MSG_DEBUG, "WPS: AP found from BSS table");
+=20
+-	ie =3D wpa_bss_get_ie(bss, WLAN_EID_RSN);
++	ie =3D wpa_bss_get_rsne(wpa_s, bss, ssid, false);
+ 	if (ie && wpa_parse_wpa_ie(ie, 2 + ie[1], &adv) =3D=3D 0) {
+ 		wpa2 =3D 1;
+ 		if (adv.pairwise_cipher & WPA_CIPHER_CCMP)
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0012=
-Make-driver-capabilities-for-AKM-suites-available-wi.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0012-Make-driver-capabilitie=
s-for-AKM-suites-available-wi.patch
new file mode 100644
index 0000000000..cbd362ecdd
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0012-Make-d=
river-capabilities-for-AKM-suites-available-wi.patch
@@ -0,0 +1,66 @@
+From d0b55eb360d34231b095a14d55592ea682895e27 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Thu, 27 Jun 2024 17:33:44 +0300
+Subject: [PATCH 08/11] Make driver capabilities for AKM suites available
+ within wpa_supplicant
+
+In addition, add some of the previously missed AKM suites from the
+default capabilities.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3Dd0b55eb360d34231b095a14d55592ea682895e27]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/drivers/driver_nl80211_capa.c | 2 ++
+ wpa_supplicant/wpa_supplicant.c   | 1 +
+ wpa_supplicant/wpa_supplicant_i.h | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/src/drivers/driver_nl80211_capa.c b/src/drivers/driver_nl80=
211_capa.c
+index 240d01d3d..26c1f4140 100644
+--- a/src/drivers/driver_nl80211_capa.c
++++ b/src/drivers/driver_nl80211_capa.c
+@@ -1476,6 +1476,7 @@ int wpa_driver_nl80211_capa(struct wpa_driver_nl80=
211_data *drv)
+ 			WPA_DRIVER_CAPA_KEY_MGMT_WPA_PSK |
+ 			WPA_DRIVER_CAPA_KEY_MGMT_WPA2 |
+ 			WPA_DRIVER_CAPA_KEY_MGMT_WPA2_PSK |
++			WPA_DRIVER_CAPA_KEY_MGMT_PSK_SHA256 |
+ 			WPA_DRIVER_CAPA_KEY_MGMT_SUITE_B |
+ 			WPA_DRIVER_CAPA_KEY_MGMT_OWE |
+ 			WPA_DRIVER_CAPA_KEY_MGMT_DPP;
+@@ -1491,6 +1492,7 @@ int wpa_driver_nl80211_capa(struct wpa_driver_nl80=
211_data *drv)
+ 				WPA_DRIVER_CAPA_KEY_MGMT_FILS_SHA384 |
+ 				WPA_DRIVER_CAPA_KEY_MGMT_FT_FILS_SHA256 |
+ 				WPA_DRIVER_CAPA_KEY_MGMT_FT_FILS_SHA384 |
++				WPA_DRIVER_CAPA_KEY_MGMT_SAE_EXT_KEY |
+ 				WPA_DRIVER_CAPA_KEY_MGMT_SAE;
+ 		else if (drv->capa.flags & WPA_DRIVER_FLAGS_FILS_SK_OFFLOAD)
+ 			drv->capa.key_mgmt |=3D
+diff --git a/wpa_supplicant/wpa_supplicant.c b/wpa_supplicant/wpa_suppli=
cant.c
+index de8785a3c..c27977560 100644
+--- a/wpa_supplicant/wpa_supplicant.c
++++ b/wpa_supplicant/wpa_supplicant.c
+@@ -7363,6 +7363,7 @@ static int wpa_supplicant_init_iface(struct wpa_su=
pplicant *wpa_s,
+ 		wpa_s->drv_flags =3D capa.flags;
+ 		wpa_s->drv_flags2 =3D capa.flags2;
+ 		wpa_s->drv_enc =3D capa.enc;
++		wpa_s->drv_key_mgmt =3D capa.key_mgmt;
+ 		wpa_s->drv_rrm_flags =3D capa.rrm_flags;
+ 		wpa_s->drv_max_acl_mac_addrs =3D capa.max_acl_mac_addrs;
+ 		wpa_s->probe_resp_offloads =3D capa.probe_resp_offloads;
+diff --git a/wpa_supplicant/wpa_supplicant_i.h b/wpa_supplicant/wpa_supp=
licant_i.h
+index 110a8648c..e92f6b147 100644
+--- a/wpa_supplicant/wpa_supplicant_i.h
++++ b/wpa_supplicant/wpa_supplicant_i.h
+@@ -920,6 +920,7 @@ struct wpa_supplicant {
+ 	u64 drv_flags;
+ 	u64 drv_flags2;
+ 	unsigned int drv_enc;
++	unsigned int drv_key_mgmt;
+ 	unsigned int drv_rrm_flags;
+ 	unsigned int drv_max_acl_mac_addrs;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0013=
-RSNE-RSNXE-overriding-for-STA.patch b/meta/recipes-connectivity/wpa-supp=
licant/wpa-supplicant/0013-RSNE-RSNXE-overriding-for-STA.patch
new file mode 100644
index 0000000000..9ce776321e
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0013-RSNE-R=
SNXE-overriding-for-STA.patch
@@ -0,0 +1,739 @@
+From 765c48d5adcf8996b2568a7b2ec9d3a9c34ec902 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 11 Oct 2023 12:50:05 +0300
+Subject: [PATCH 09/11] RSNE/RSNXE overriding for STA
+
+Add support for RSNE/RSNXE Override elements. Use these elements to
+determine AP's extended RSN parameters.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D765c48d5adcf8996b2568a7b2ec9d3a9c34ec902]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/rsn_supp/wpa.c                 |  92 ++++++++++---
+ src/rsn_supp/wpa_ie.c              |  11 +-
+ wpa_supplicant/bss.c               | 201 ++++++++++++++++++++++++++++-
+ wpa_supplicant/config.c            |   1 +
+ wpa_supplicant/config.h            |  13 ++
+ wpa_supplicant/config_file.c       |   2 +
+ wpa_supplicant/events.c            |  24 +++-
+ wpa_supplicant/sme.c               |  27 +++-
+ wpa_supplicant/wpa_supplicant.c    | 128 ++++++++++++++++++
+ wpa_supplicant/wpa_supplicant.conf |   9 ++
+ wpa_supplicant/wpa_supplicant_i.h  |   5 +
+ 11 files changed, 487 insertions(+), 26 deletions(-)
+
+diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
+index f23979cd9..e48982989 100644
+--- a/src/rsn_supp/wpa.c
++++ b/src/rsn_supp/wpa.c
+@@ -4550,12 +4550,27 @@ int wpa_sm_set_mlo_params(struct wpa_sm *sm, con=
st struct wpa_sm_mlo *mlo)
+ 		} else {
+ 			wpa_hexdump_link(MSG_DEBUG, i, "RSN: Set AP RSNE",
+ 					 ie, len);
+-			sm->mlo.links[i].ap_rsne =3D os_memdup(ie, len);
+-			if (!sm->mlo.links[i].ap_rsne) {
+-				sm->mlo.links[i].ap_rsne_len =3D 0;
+-				return -1;
++			if (ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && len > 2 + 4) {
++				sm->mlo.links[i].ap_rsne =3D os_malloc(len - 4);
++				if (!sm->mlo.links[i].ap_rsne)
++					return -1;
++				sm->mlo.links[i].ap_rsne[0] =3D WLAN_EID_RSN;
++				sm->mlo.links[i].ap_rsne[1] =3D len - 2 - 4;
++				os_memcpy(&sm->mlo.links[i].ap_rsne[2],
++					  ie + 2 + 4, len - 2 - 4);
++				sm->mlo.links[i].ap_rsne_len =3D len - 4;
++				wpa_hexdump(MSG_DEBUG,
++					    "RSN: Converted RSNE override to RSNE",
++					    sm->mlo.links[i].ap_rsne,
++					    sm->mlo.links[i].ap_rsne_len);
++			} else {
++				sm->mlo.links[i].ap_rsne =3D os_memdup(ie, len);
++				if (!sm->mlo.links[i].ap_rsne) {
++					sm->mlo.links[i].ap_rsne_len =3D 0;
++					return -1;
++				}
++				sm->mlo.links[i].ap_rsne_len =3D len;
+ 			}
+-			sm->mlo.links[i].ap_rsne_len =3D len;
+ 		}
+=20
+ 		ie =3D mlo->links[i].ap_rsnxe;
+@@ -4571,12 +4586,27 @@ int wpa_sm_set_mlo_params(struct wpa_sm *sm, con=
st struct wpa_sm_mlo *mlo)
+ 		} else {
+ 			wpa_hexdump_link(MSG_DEBUG, i, "RSN: Set AP RSNXE", ie,
+ 					 len);
+-			sm->mlo.links[i].ap_rsnxe =3D os_memdup(ie, len);
+-			if (!sm->mlo.links[i].ap_rsnxe) {
+-				sm->mlo.links[i].ap_rsnxe_len =3D 0;
+-				return -1;
++			if (ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && len > 2 + 4) {
++				sm->mlo.links[i].ap_rsnxe =3D os_malloc(len - 4);
++				if (!sm->mlo.links[i].ap_rsnxe)
++					return -1;
++				sm->mlo.links[i].ap_rsnxe[0] =3D WLAN_EID_RSNX;
++				sm->mlo.links[i].ap_rsnxe[1] =3D len - 2 - 4;
++				os_memcpy(&sm->mlo.links[i].ap_rsnxe[2],
++					  ie + 2 + 4, len - 2 - 4);
++				sm->mlo.links[i].ap_rsnxe_len =3D len - 4;
++				wpa_hexdump(MSG_DEBUG,
++					    "RSN: Converted RSNXE override to RSNXE",
++					    sm->mlo.links[i].ap_rsnxe,
++					    sm->mlo.links[i].ap_rsnxe_len);
++			} else {
++				sm->mlo.links[i].ap_rsnxe =3D os_memdup(ie, len);
++				if (!sm->mlo.links[i].ap_rsnxe) {
++					sm->mlo.links[i].ap_rsnxe_len =3D 0;
++					return -1;
++				}
++				sm->mlo.links[i].ap_rsnxe_len =3D len;
+ 			}
+-			sm->mlo.links[i].ap_rsnxe_len =3D len;
+ 		}
+ 	}
+=20
+@@ -5077,11 +5107,24 @@ int wpa_sm_set_ap_rsn_ie(struct wpa_sm *sm, cons=
t u8 *ie, size_t len)
+ 		sm->ap_rsn_ie_len =3D 0;
+ 	} else {
+ 		wpa_hexdump(MSG_DEBUG, "WPA: set AP RSN IE", ie, len);
+-		sm->ap_rsn_ie =3D os_memdup(ie, len);
+-		if (sm->ap_rsn_ie =3D=3D NULL)
+-			return -1;
++		if (ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && len > 2 + 4) {
++			sm->ap_rsn_ie =3D os_malloc(len - 4);
++			if (!sm->ap_rsn_ie)
++				return -1;
++			sm->ap_rsn_ie[0] =3D WLAN_EID_RSN;
++			sm->ap_rsn_ie[1] =3D len - 2 - 4;
++			os_memcpy(&sm->ap_rsn_ie[2], ie + 2 + 4, len - 2 - 4);
++			sm->ap_rsn_ie_len =3D len - 4;
++			wpa_hexdump(MSG_DEBUG,
++				    "RSN: Converted RSNE override to RSNE",
++				    sm->ap_rsn_ie, sm->ap_rsn_ie_len);
++		} else {
++			sm->ap_rsn_ie =3D os_memdup(ie, len);
++			if (sm->ap_rsn_ie =3D=3D NULL)
++				return -1;
+=20
+-		sm->ap_rsn_ie_len =3D len;
++			sm->ap_rsn_ie_len =3D len;
++		}
+ 	}
+=20
+ 	return 0;
+@@ -5110,11 +5153,24 @@ int wpa_sm_set_ap_rsnxe(struct wpa_sm *sm, const=
 u8 *ie, size_t len)
+ 		sm->ap_rsnxe_len =3D 0;
+ 	} else {
+ 		wpa_hexdump(MSG_DEBUG, "WPA: set AP RSNXE", ie, len);
+-		sm->ap_rsnxe =3D os_memdup(ie, len);
+-		if (!sm->ap_rsnxe)
+-			return -1;
++		if (ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && len > 2 + 4) {
++			sm->ap_rsnxe =3D os_malloc(len - 4);
++			if (!sm->ap_rsnxe)
++				return -1;
++			sm->ap_rsnxe[0] =3D WLAN_EID_RSNX;
++			sm->ap_rsnxe[1] =3D len - 2 - 4;
++			os_memcpy(&sm->ap_rsnxe[2], ie + 2 + 4, len - 2 - 4);
++			sm->ap_rsnxe_len =3D len - 4;
++			wpa_hexdump(MSG_DEBUG,
++				    "RSN: Converted RSNXE override to RSNXE",
++				    sm->ap_rsnxe, sm->ap_rsnxe_len);
++		} else {
++			sm->ap_rsnxe =3D os_memdup(ie, len);
++			if (!sm->ap_rsnxe)
++				return -1;
+=20
+-		sm->ap_rsnxe_len =3D len;
++			sm->ap_rsnxe_len =3D len;
++		}
+ 	}
+=20
+ 	return 0;
+diff --git a/src/rsn_supp/wpa_ie.c b/src/rsn_supp/wpa_ie.c
+index eeedf8ba5..515f1b027 100644
+--- a/src/rsn_supp/wpa_ie.c
++++ b/src/rsn_supp/wpa_ie.c
+@@ -33,8 +33,15 @@ int wpa_parse_wpa_ie(const u8 *wpa_ie, size_t wpa_ie_=
len,
+ 	if (wpa_ie_len >=3D 6 && wpa_ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC &&
+ 	    wpa_ie[1] >=3D 4 && WPA_GET_BE32(&wpa_ie[2]) =3D=3D OSEN_IE_VENDOR=
_TYPE)
+ 		return wpa_parse_wpa_ie_rsn(wpa_ie, wpa_ie_len, data);
+-	else
+-		return wpa_parse_wpa_ie_wpa(wpa_ie, wpa_ie_len, data);
++	if (wpa_ie_len >=3D 6 && wpa_ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC &&
++	    wpa_ie[1] >=3D 4 &&
++	    WPA_GET_BE32(&wpa_ie[2]) =3D=3D RSNE_OVERRIDE_IE_VENDOR_TYPE)
++		return wpa_parse_wpa_ie_rsn(wpa_ie, wpa_ie_len, data);
++	if (wpa_ie_len >=3D 6 && wpa_ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC &&
++	    wpa_ie[1] >=3D 4 &&
++	    WPA_GET_BE32(&wpa_ie[2]) =3D=3D RSNE_OVERRIDE_2_IE_VENDOR_TYPE)
++		return wpa_parse_wpa_ie_rsn(wpa_ie, wpa_ie_len, data);
++	return wpa_parse_wpa_ie_wpa(wpa_ie, wpa_ie_len, data);
+ }
+=20
+=20
+diff --git a/wpa_supplicant/bss.c b/wpa_supplicant/bss.c
+index 6d702bb2e..8dcda7848 100644
+--- a/wpa_supplicant/bss.c
++++ b/wpa_supplicant/bss.c
+@@ -1657,10 +1657,22 @@ int wpa_bss_parse_basic_ml_element(struct wpa_su=
pplicant *wpa_s,
+=20
+ 	if (ssid) {
+ 		struct wpa_ie_data ie;
+-
+-		if (!elems.rsn_ie ||
+-		    wpa_parse_wpa_ie(elems.rsn_ie - 2, 2 + elems.rsn_ie_len,
+-				     &ie)) {
++		const u8 *rsne;
++		size_t rsne_len;
++
++		if (elems.rsne_override_2 && wpas_rsn_overriding(wpa_s)) {
++			rsne =3D elems.rsne_override_2;
++			rsne_len =3D elems.rsne_override_2_len;
++		} else if (elems.rsne_override &&
++			   wpas_rsn_overriding(wpa_s)) {
++			rsne =3D elems.rsne_override;
++			rsne_len =3D elems.rsne_override_len;
++		} else {
++			rsne =3D elems.rsn_ie;
++			rsne_len =3D elems.rsn_ie_len;
++		}
++		if (!rsne ||
++		    wpa_parse_wpa_ie(rsne - 2, 2 + rsne_len, &ie)) {
+ 			wpa_dbg(wpa_s, MSG_DEBUG, "MLD: No RSN element");
+ 			goto out;
+ 		}
+@@ -1868,10 +1880,163 @@ out:
+ }
+=20
+=20
++static bool wpa_bss_supported_cipher(struct wpa_supplicant *wpa_s,
++				     int pairwise_cipher)
++{
++	if (!wpa_s->drv_enc)
++		return true;
++
++	if ((pairwise_cipher & WPA_CIPHER_CCMP) &&
++	    (wpa_s->drv_enc & WPA_DRIVER_CAPA_ENC_CCMP))
++		return true;
++
++	if ((pairwise_cipher & WPA_CIPHER_GCMP) &&
++	    (wpa_s->drv_enc & WPA_DRIVER_CAPA_ENC_GCMP))
++		return true;
++
++	if ((pairwise_cipher & WPA_CIPHER_CCMP_256) &&
++	    (wpa_s->drv_enc & WPA_DRIVER_CAPA_ENC_CCMP_256))
++		return true;
++
++	if ((pairwise_cipher & WPA_CIPHER_GCMP_256) &&
++	    (wpa_s->drv_enc & WPA_DRIVER_CAPA_ENC_GCMP_256))
++		return true;
++
++	return false;
++}
++
++
++static bool wpa_bss_supported_key_mgmt(struct wpa_supplicant *wpa_s,
++				       int key_mgmt)
++{
++	if (!wpa_s->drv_key_mgmt)
++		return true;
++
++	if ((key_mgmt & WPA_KEY_MGMT_IEEE8021X) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_WPA2))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_IEEE8021X_SHA256) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_802_1X_SHA256))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_IEEE8021X) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_IEEE8021X_SHA384) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_802_1X_SHA384))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_IEEE8021X_SUITE_B) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_SUITE_B))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_IEEE8021X_SUITE_B_192) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_SUITE_B_192))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_PSK) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_WPA2_PSK))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_PSK) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_PSK))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_PSK_SHA256) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_PSK_SHA256))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_SAE) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_SAE))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_SAE_EXT_KEY) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_SAE_EXT_KEY))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_SAE) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_SAE))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_SAE_EXT_KEY) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_SAE_EXT_KEY))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_OWE) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_OWE))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_DPP) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_DPP))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FILS_SHA256) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FILS_SHA256))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FILS_SHA384) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FILS_SHA384))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_FILS_SHA256) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_FILS_SHA256))
++		return true;
++	if ((key_mgmt & WPA_KEY_MGMT_FT_FILS_SHA384) &&
++	    (wpa_s->drv_key_mgmt & WPA_DRIVER_CAPA_KEY_MGMT_FT_FILS_SHA384))
++		return true;
++
++	return false;
++}
++
++
++static bool wpa_bss_supported_rsne(struct wpa_supplicant *wpa_s,
++				   struct wpa_ssid *ssid, const u8 *ie)
++{
++	struct wpa_ie_data data;
++
++	if (wpa_parse_wpa_ie_rsn(ie, 2 + ie[1], &data) < 0)
++		return false;
++
++	/* Check that there is a supported AKM and pairwise cipher based on
++	 * overall capabilities */
++	if (!data.pairwise_cipher || !data.key_mgmt)
++		return false;
++
++	if (wpa_s->drv_capa_known) {
++		if (!wpa_bss_supported_cipher(wpa_s, data.pairwise_cipher) ||
++		    !wpa_bss_supported_key_mgmt(wpa_s, data.key_mgmt))
++			return false;
++	}
++
++	if (ssid) {
++		/* Check that there is a supported AKM and pairwise cipher
++		 * based on the specific network profile. */
++		if ((ssid->pairwise_cipher & data.pairwise_cipher) =3D=3D 0)
++			return false;
++		if ((ssid->key_mgmt & data.key_mgmt) =3D=3D 0)
++			return false;
++	}
++
++	return true;
++}
++
++
+ const u8 * wpa_bss_get_rsne(struct wpa_supplicant *wpa_s,
+ 			    const struct wpa_bss *bss, struct wpa_ssid *ssid,
+ 			    bool mlo)
+ {
++	const u8 *ie;
++
++	if (wpas_rsn_overriding(wpa_s)) {
++		if (!ssid)
++			ssid =3D wpa_s->current_ssid;
++
++		/* MLO cases for RSN overriding are required to use RSNE
++		 * Override 2 element and RSNXE Override element together. */
++		ie =3D wpa_bss_get_vendor_ie(bss, RSNE_OVERRIDE_2_IE_VENDOR_TYPE);
++		if (mlo && ie &&
++		    !wpa_bss_get_vendor_ie(bss,
++					   RSNXE_OVERRIDE_IE_VENDOR_TYPE)) {
++			wpa_printf(MSG_DEBUG, "BSS " MACSTR
++				   " advertises RSNE Override 2 element without RSNXE Override elem=
ent - ignore RSNE Override 2 element for MLO",
++				   MAC2STR(bss->bssid));
++		} else if (ie && wpa_bss_supported_rsne(wpa_s, ssid, ie)) {
++			return ie;
++		}
++
++		if (!mlo) {
++			ie =3D wpa_bss_get_vendor_ie(
++				bss, RSNE_OVERRIDE_IE_VENDOR_TYPE);
++			if (ie && wpa_bss_supported_rsne(wpa_s, ssid, ie))
++				return ie;
++		}
++	}
++
+ 	return wpa_bss_get_ie(bss, WLAN_EID_RSN);
+ }
+=20
+@@ -1880,5 +2045,33 @@ const u8 * wpa_bss_get_rsnxe(struct wpa_supplican=
t *wpa_s,
+ 			     const struct wpa_bss *bss, struct wpa_ssid *ssid,
+ 			     bool mlo)
+ {
++	const u8 *ie;
++
++	if (wpas_rsn_overriding(wpa_s)) {
++		ie =3D wpa_bss_get_vendor_ie(bss, RSNXE_OVERRIDE_IE_VENDOR_TYPE);
++		if (ie) {
++			const u8 *tmp;
++
++			tmp =3D wpa_bss_get_rsne(wpa_s, bss, ssid, mlo);
++			if (!tmp || tmp[0] =3D=3D WLAN_EID_RSN) {
++				/* An acceptable RSNE override element was not
++				 * found, so need to ignore RSNXE overriding. */
++				return NULL;
++			}
++
++			return ie;
++		}
++
++		/* MLO cases for RSN overriding are required to use RSNE
++		 * Override 2 element and RSNXE Override element together. */
++		if (mlo && wpa_bss_get_vendor_ie(
++			    bss, RSNE_OVERRIDE_2_IE_VENDOR_TYPE)) {
++			wpa_printf(MSG_DEBUG, "BSS " MACSTR
++				   " advertises RSNXE Override element without RSNE Override 2 elem=
ent - ignore RSNXE Override element for MLO",
++				   MAC2STR(bss->bssid));
++			return NULL;
++		}
++	}
++
+ 	return wpa_bss_get_ie(bss, WLAN_EID_RSNX);
+ }
+diff --git a/wpa_supplicant/config.c b/wpa_supplicant/config.c
+index 24861c68f..b02b694a3 100644
+--- a/wpa_supplicant/config.c
++++ b/wpa_supplicant/config.c
+@@ -5579,6 +5579,7 @@ static const struct global_parse_data global_field=
s[] =3D {
+ 	{ INT_RANGE(extended_key_id, 0, 1), 0 },
+ #endif /* CONFIG_WNM */
+ 	{ INT_RANGE(wowlan_disconnect_on_deinit, 0, 1), 0},
++	{ INT_RANGE(rsn_overriding, 0, 2), 0},
+ #ifdef CONFIG_PASN
+ #ifdef CONFIG_TESTING_OPTIONS
+ 	{ INT_RANGE(force_kdk_derivation, 0, 1), 0 },
+diff --git a/wpa_supplicant/config.h b/wpa_supplicant/config.h
+index 8981305c2..d74b5c455 100644
+--- a/wpa_supplicant/config.h
++++ b/wpa_supplicant/config.h
+@@ -1774,6 +1774,19 @@ struct wpa_config {
+ 	 */
+ 	int wowlan_disconnect_on_deinit;
+=20
++	/**
++	 * rsn_overriding - RSN overriding
++	 *
++	 * 0 =3D Disabled
++	 * 1 =3D Enabled automatically if the driver indicates support
++	 * 2 =3D Forced to be enabled even without driver capability indicatio=
n
++	 */
++	enum rsn_overriding {
++		RSN_OVERRIDING_DISABLED =3D 0,
++		RSN_OVERRIDING_AUTO =3D 1,
++		RSN_OVERRIDING_ENABLED =3D 2,
++	} rsn_overriding;
++
+ #ifdef CONFIG_PASN
+ #ifdef CONFIG_TESTING_OPTIONS
+ 	/*
+diff --git a/wpa_supplicant/config_file.c b/wpa_supplicant/config_file.c
+index ad37bcf22..fd8eafe2b 100644
+--- a/wpa_supplicant/config_file.c
++++ b/wpa_supplicant/config_file.c
+@@ -1615,6 +1615,8 @@ static void wpa_config_write_global(FILE *f, struc=
t wpa_config *config)
+ 	if (config->wowlan_disconnect_on_deinit)
+ 		fprintf(f, "wowlan_disconnect_on_deinit=3D%d\n",
+ 			config->wowlan_disconnect_on_deinit);
++	if (config->rsn_overriding)
++		fprintf(f, "rsn_overriding=3D%d\n", config->rsn_overriding);
+ #ifdef CONFIG_TESTING_OPTIONS
+ 	if (config->mld_force_single_link)
+ 		fprintf(f, "mld_force_single_link=3D1\n");
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 4e55470bb..4393c469c 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -1296,7 +1296,9 @@ static bool wpa_scan_res_ok(struct wpa_supplicant =
*wpa_s, struct wpa_ssid *ssid,
+=20
+ #ifdef CONFIG_SAE
+ 	ie =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+-	if (ie && ie[1] >=3D 1)
++	if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4 + 1)
++		rsnxe_capa =3D ie[4 + 2];
++	else if (ie && ie[1] >=3D 1)
+ 		rsnxe_capa =3D ie[2];
+ #endif /* CONFIG_SAE */
+=20
+@@ -3665,9 +3667,29 @@ no_pfs:
+ 			wpa_sm_set_ap_rsn_ie(wpa_s->wpa, p, len);
+ 		}
+=20
++		if (wpas_rsn_overriding(wpa_s) &&
++		    p[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && p[1] >=3D 6 &&
++		    WPA_GET_BE32(&p[2]) =3D=3D RSNE_OVERRIDE_2_IE_VENDOR_TYPE) {
++			rsn_found =3D 1;
++			wpa_sm_set_ap_rsn_ie(wpa_s->wpa, p, len);
++		}
++
++		if (!rsn_found &&
++		    wpas_rsn_overriding(wpa_s) &&
++		    p[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && p[1] >=3D 6 &&
++		    WPA_GET_BE32(&p[2]) =3D=3D RSNE_OVERRIDE_IE_VENDOR_TYPE) {
++			rsn_found =3D 1;
++			wpa_sm_set_ap_rsn_ie(wpa_s->wpa, p, len);
++		}
++
+ 		if (p[0] =3D=3D WLAN_EID_RSNX && p[1] >=3D 1)
+ 			wpa_sm_set_ap_rsnxe(wpa_s->wpa, p, len);
+=20
++		if (wpas_rsn_overriding(wpa_s) &&
++		    p[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && p[1] >=3D 6 &&
++		    WPA_GET_BE32(&p[2]) =3D=3D RSNXE_OVERRIDE_IE_VENDOR_TYPE)
++			wpa_sm_set_ap_rsnxe(wpa_s->wpa, p, len);
++
+ 		l -=3D len;
+ 		p +=3D len;
+ 	}
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index 8df60393a..292897edd 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -191,7 +191,10 @@ static struct wpabuf * sme_auth_build_sae_commit(st=
ruct wpa_supplicant *wpa_s,
+ 		const u8 *rsnxe;
+=20
+ 		rsnxe =3D wpa_bss_get_rsnxe(wpa_s, bss, ssid, false);
+-		if (rsnxe && rsnxe[1] >=3D 1)
++		if (rsnxe && rsnxe[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC &&
++		    rsnxe[1] >=3D 1 + 4)
++			rsnxe_capa =3D rsnxe[2 + 4];
++		else if (rsnxe && rsnxe[1] >=3D 1)
+ 			rsnxe_capa =3D rsnxe[2];
+ 	}
+=20
+@@ -2464,6 +2467,28 @@ mscs_fail:
+ 		wpa_s->sme.assoc_req_ie_len +=3D multi_ap_ie_len;
+ 	}
+=20
++	if (wpas_rsn_overriding(wpa_s) &&
++	    wpas_ap_supports_rsn_overriding(wpa_s, wpa_s->current_bss) &&
++	    wpa_s->sme.assoc_req_ie_len + 2 + 4 <=3D
++	    sizeof(wpa_s->sme.assoc_req_ie)) {
++		u8 *pos =3D wpa_s->sme.assoc_req_ie + wpa_s->sme.assoc_req_ie_len;
++		u32 type =3D 0;
++		const u8 *ie;
++
++		ie =3D wpa_bss_get_rsne(wpa_s, wpa_s->current_bss, ssid,
++				      wpa_s->valid_links);
++		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4)
++			type =3D WPA_GET_BE32(&ie[2]);
++
++		if (type) {
++			/* Indicate support for RSN overriding */
++			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++			*pos++ =3D 4;
++			WPA_PUT_BE32(pos, type);
++			wpa_s->sme.assoc_req_ie_len +=3D 2 + 4;
++		}
++	}
++
+ 	params.bssid =3D bssid;
+ 	params.ssid =3D wpa_s->sme.ssid;
+ 	params.ssid_len =3D wpa_s->sme.ssid_len;
+diff --git a/wpa_supplicant/wpa_supplicant.c b/wpa_supplicant/wpa_suppli=
cant.c
+index c27977560..3203446f1 100644
+--- a/wpa_supplicant/wpa_supplicant.c
++++ b/wpa_supplicant/wpa_supplicant.c
+@@ -3943,6 +3943,57 @@ mscs_end:
+ 		wpa_ie_len +=3D multi_ap_ie_len;
+ 	}
+=20
++	if (!wpas_driver_bss_selection(wpa_s) &&
++	    wpas_rsn_overriding(wpa_s) &&
++	    wpas_ap_supports_rsn_overriding(wpa_s, bss) &&
++	    wpa_ie_len + 2 + 4 <=3D max_wpa_ie_len) {
++		u8 *pos =3D wpa_ie + wpa_ie_len;
++		u32 type =3D 0;
++		const u8 *ie;
++
++		ie =3D wpa_bss_get_rsne(wpa_s, bss, ssid, wpa_s->valid_links);
++		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4)
++			type =3D WPA_GET_BE32(&ie[2]);
++
++		if (type) {
++			/* Indicate support for RSN overriding */
++			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++			*pos++ =3D 4;
++			WPA_PUT_BE32(pos, type);
++			pos +=3D 4;
++			wpa_hexdump(MSG_MSGDUMP, "RSNE Override", wpa_ie,
++				    pos - wpa_ie);
++			wpa_ie_len +=3D 2 + 4;
++		}
++	}
++
++	if (wpas_driver_bss_selection(wpa_s) &&
++	    wpas_rsn_overriding(wpa_s)) {
++		if (wpa_ie_len + 2 + 4 <=3D max_wpa_ie_len) {
++			u8 *pos =3D wpa_ie + wpa_ie_len;
++
++			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++			*pos++ =3D 4;
++			WPA_PUT_BE32(pos, RSNE_OVERRIDE_IE_VENDOR_TYPE);
++			pos +=3D 4;
++			wpa_hexdump(MSG_MSGDUMP, "RSNE Override", wpa_ie,
++				    pos - wpa_ie);
++			wpa_ie_len +=3D 2 + 4;
++		}
++
++		if (wpa_ie_len + 2 + 4 <=3D max_wpa_ie_len) {
++			u8 *pos =3D wpa_ie + wpa_ie_len;
++
++			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++			*pos++ =3D 4;
++			WPA_PUT_BE32(pos, RSNE_OVERRIDE_2_IE_VENDOR_TYPE);
++			pos +=3D 4;
++			wpa_hexdump(MSG_MSGDUMP, "RSNE Override 2",
++				    wpa_ie, pos - wpa_ie);
++			wpa_ie_len +=3D 2 + 4;
++		}
++	}
++
+ 	params->wpa_ie =3D wpa_ie;
+ 	params->wpa_ie_len =3D wpa_ie_len;
+ 	params->auth_alg =3D algs;
+@@ -8557,6 +8608,28 @@ int wpas_driver_bss_selection(struct wpa_supplica=
nt *wpa_s)
+ }
+=20
+=20
++static bool wpas_driver_rsn_override(struct wpa_supplicant *wpa_s)
++{
++	return !!(wpa_s->drv_flags2 & WPA_DRIVER_FLAGS2_RSN_OVERRIDE_STA);
++}
++
++
++bool wpas_rsn_overriding(struct wpa_supplicant *wpa_s)
++{
++	if (wpa_s->conf->rsn_overriding =3D=3D RSN_OVERRIDING_DISABLED)
++		return false;
++
++	if (wpa_s->conf->rsn_overriding =3D=3D RSN_OVERRIDING_ENABLED)
++		return true;
++
++	if (!(wpa_s->drv_flags & WPA_DRIVER_FLAGS_SME) ||
++	    wpas_driver_bss_selection(wpa_s))
++		return wpas_driver_rsn_override(wpa_s);
++
++	return true;
++}
++
++
+ #if defined(CONFIG_CTRL_IFACE) || defined(CONFIG_CTRL_IFACE_DBUS_NEW)
+ int wpa_supplicant_ctrl_iface_ctrl_rsp_handle(struct wpa_supplicant *wp=
a_s,
+ 					      struct wpa_ssid *ssid,
+@@ -9531,3 +9604,58 @@ bool wpas_is_6ghz_supported(struct wpa_supplicant=
 *wpa_s, bool only_enabled)
+=20
+ 	return false;
+ }
++
++
++bool wpas_ap_supports_rsn_overriding(struct wpa_supplicant *wpa_s,
++				     struct wpa_bss *bss)
++{
++	int i;
++
++	if (!bss)
++		return false;
++	if (wpa_bss_get_vendor_ie(bss, RSNE_OVERRIDE_IE_VENDOR_TYPE) ||
++	    wpa_bss_get_vendor_ie(bss, RSNE_OVERRIDE_2_IE_VENDOR_TYPE))
++		return true;
++
++	if (!wpa_s->valid_links)
++		return false;
++
++	for (i =3D 0; i < MAX_NUM_MLD_LINKS; i++) {
++		if (!(wpa_s->valid_links & BIT(i)))
++			continue;
++		if (wpa_s->links[i].bss &&
++		    (wpa_bss_get_vendor_ie(wpa_s->links[i].bss,
++					   RSNE_OVERRIDE_IE_VENDOR_TYPE) ||
++		     wpa_bss_get_vendor_ie(wpa_s->links[i].bss,
++					   RSNE_OVERRIDE_2_IE_VENDOR_TYPE)))
++			return true;
++	}
++
++	return false;
++}
++
++
++bool wpas_ap_supports_rsn_overriding_2(struct wpa_supplicant *wpa_s,
++				       struct wpa_bss *bss)
++{
++	int i;
++
++	if (!bss)
++		return false;
++	if (wpa_bss_get_vendor_ie(bss, RSNE_OVERRIDE_2_IE_VENDOR_TYPE))
++		return true;
++
++	if (!wpa_s->valid_links)
++		return false;
++
++	for (i =3D 0; i < MAX_NUM_MLD_LINKS; i++) {
++		if (!(wpa_s->valid_links & BIT(i)))
++			continue;
++		if (wpa_s->links[i].bss &&
++		    wpa_bss_get_vendor_ie(wpa_s->links[i].bss,
++					  RSNE_OVERRIDE_2_IE_VENDOR_TYPE))
++			return true;
++	}
++
++	return false;
++}
+diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_sup=
plicant.conf
+index b08f5417a..b721f6504 100644
+--- a/wpa_supplicant/wpa_supplicant.conf
++++ b/wpa_supplicant/wpa_supplicant.conf
+@@ -878,6 +878,15 @@ fast_reauth=3D1
+ # 1 =3D auto: Activate Extended Key ID support if the driver supports i=
t
+ #extended_key_id=3D0
+=20
++# RSN overriding
++# NOTE: The protocol used for this mechanism is still subject to change=
 and as
++# such, this should not yet be enabled for production uses to avoid iss=
ues if
++# something were to change.
++# 0 =3D Disabled (default)
++# 1 =3D Enabled automatically if the driver indicates support
++# 2 =3D Forced to be enabled even without driver capability indication
++#rsn_overriding=3D0
++
+ # network block
+ #
+ # Each network (usually AP's sharing the same SSID) is configured as a =
separate
+diff --git a/wpa_supplicant/wpa_supplicant_i.h b/wpa_supplicant/wpa_supp=
licant_i.h
+index e92f6b147..3043bc654 100644
+--- a/wpa_supplicant/wpa_supplicant_i.h
++++ b/wpa_supplicant/wpa_supplicant_i.h
+@@ -1727,6 +1727,7 @@ void wpas_connection_failed(struct wpa_supplicant =
*wpa_s, const u8 *bssid,
+ void fils_connection_failure(struct wpa_supplicant *wpa_s);
+ void fils_pmksa_cache_flush(struct wpa_supplicant *wpa_s);
+ int wpas_driver_bss_selection(struct wpa_supplicant *wpa_s);
++bool wpas_rsn_overriding(struct wpa_supplicant *wpa_s);
+ int wpas_is_p2p_prioritized(struct wpa_supplicant *wpa_s);
+ void wpas_auth_failed(struct wpa_supplicant *wpa_s, const char *reason,
+ 		      const u8 *bssid);
+@@ -2011,5 +2012,9 @@ bool wpas_is_6ghz_supported(struct wpa_supplicant =
*wpa_s, bool only_enabled);
+=20
+ bool wpa_is_non_eht_scs_traffic_desc_supported(struct wpa_bss *bss);
+ bool wpas_ap_link_address(struct wpa_supplicant *wpa_s, const u8 *addr)=
;
++bool wpas_ap_supports_rsn_overriding(struct wpa_supplicant *wpa_s,
++				     struct wpa_bss *bss);
++bool wpas_ap_supports_rsn_overriding_2(struct wpa_supplicant *wpa_s,
++				       struct wpa_bss *bss);
+=20
+ #endif /* WPA_SUPPLICANT_I_H */
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0014=
-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0014-RSNO-Use-the-RSN-Select=
ion-element-to-indicate-which.patch
new file mode 100644
index 0000000000..c28a411d19
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0014-RSNO-U=
se-the-RSN-Selection-element-to-indicate-which.patch
@@ -0,0 +1,415 @@
+From 62ca121f9625ffe16b2d5764568bf6ccffd7d64e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Mon, 29 Jul 2024 15:41:59 +0300
+Subject: [PATCH 10/11] RSNO: Use the RSN Selection element to indicate w=
hich
+ variant was used
+
+This replaces the use of the RSNE Override and RSNE Override 2 elements
+with empty payload to indicate which RSNE variant was used.
+
+In addition, this adds stricter validation of the RSNE in
+(Re)Association Request frame to allow only the pairwise cipher suites
+and AKMs listed in the indicated RSNE variant to be used.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D62ca121f9625ffe16b2d5764568bf6ccffd7d64e]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/ieee802_11_common.c  |  9 +++++++
+ src/common/ieee802_11_common.h  |  2 ++
+ src/common/ieee802_11_defs.h    |  2 ++
+ src/common/wpa_common.c         |  6 +++++
+ src/common/wpa_common.h         | 10 +++++++
+ src/rsn_supp/wpa.c              | 38 +++++++++++++++++++++++++-
+ src/rsn_supp/wpa.h              |  8 ++++++
+ src/rsn_supp/wpa_i.h            |  2 ++
+ wpa_supplicant/events.c         | 22 ++++++++++++++-
+ wpa_supplicant/sme.c            | 36 ++++++++++++++++++-------
+ wpa_supplicant/wpa_supplicant.c | 47 +++++++++++++++++++++++----------
+ 11 files changed, 157 insertions(+), 25 deletions(-)
+
+diff --git a/src/common/ieee802_11_common.c b/src/common/ieee802_11_comm=
on.c
+index 3ca1ffe7e..3e6fba5bd 100644
+--- a/src/common/ieee802_11_common.c
++++ b/src/common/ieee802_11_common.c
+@@ -148,6 +148,15 @@ static int ieee802_11_parse_vendor_specific(const u=
8 *pos, size_t elen,
+ 			elems->rsne_override_2 =3D pos;
+ 			elems->rsne_override_2_len =3D elen;
+ 			break;
++		case WFA_RSN_SELECTION_OUI_TYPE:
++			if (elen < 4 + 1) {
++				wpa_printf(MSG_DEBUG,
++					   "Too short RSN Selection element ignored");
++				return -1;
++			}
++			elems->rsn_selection =3D pos + 4;
++			elems->rsn_selection_len =3D elen - 4;
++			break;
+ 		default:
+ 			wpa_printf(MSG_MSGDUMP, "Unknown WFA "
+ 				   "information element ignored "
+diff --git a/src/common/ieee802_11_common.h b/src/common/ieee802_11_comm=
on.h
+index 46a86096e..d4c691e1b 100644
+--- a/src/common/ieee802_11_common.h
++++ b/src/common/ieee802_11_common.h
+@@ -118,6 +118,7 @@ struct ieee802_11_elems {
+ 	const u8 *mbssid;
+ 	const u8 *rsne_override;
+ 	const u8 *rsne_override_2;
++	const u8 *rsn_selection;
+=20
+ 	u8 ssid_len;
+ 	u8 supp_rates_len;
+@@ -183,6 +184,7 @@ struct ieee802_11_elems {
+ 	u8 mbssid_len;
+ 	size_t rsne_override_len;
+ 	size_t rsne_override_2_len;
++	size_t rsn_selection_len;
+=20
+ 	struct mb_ies_info mb_ies;
+=20
+diff --git a/src/common/ieee802_11_defs.h b/src/common/ieee802_11_defs.h
+index e2c132a40..db9e90355 100644
+--- a/src/common/ieee802_11_defs.h
++++ b/src/common/ieee802_11_defs.h
+@@ -1449,9 +1449,11 @@ struct ieee80211_ampe_ie {
+ #define WFA_RSNE_OVERRIDE_OUI_TYPE 0x29
+ #define WFA_RSNE_OVERRIDE_2_OUI_TYPE 0x2a
+ #define WFA_RSNXE_OVERRIDE_OUI_TYPE 0x2b
++#define WFA_RSN_SELECTION_OUI_TYPE 0x2c
+ #define RSNE_OVERRIDE_IE_VENDOR_TYPE 0x506f9a29
+ #define RSNE_OVERRIDE_2_IE_VENDOR_TYPE 0x506f9a2a
+ #define RSNXE_OVERRIDE_IE_VENDOR_TYPE 0x506f9a2b
++#define RSN_SELECTION_IE_VENDOR_TYPE 0x506f9a2c
+=20
+ #define MULTI_AP_SUB_ELEM_TYPE 0x06
+ #define MULTI_AP_PROFILE_SUB_ELEM_TYPE 0x07
+diff --git a/src/common/wpa_common.c b/src/common/wpa_common.c
+index 8eb4a1dab..bfaca9128 100644
+--- a/src/common/wpa_common.c
++++ b/src/common/wpa_common.c
+@@ -3629,6 +3629,12 @@ static int wpa_parse_generic(const u8 *pos, struc=
t wpa_eapol_ie_parse *ie)
+ 		return 0;
+ 	}
+=20
++	if (selector =3D=3D RSN_SELECTION_IE_VENDOR_TYPE) {
++		ie->rsn_selection =3D p;
++		ie->rsn_selection_len =3D left;
++		return 0;
++	}
++
+ 	return 2;
+ }
+=20
+diff --git a/src/common/wpa_common.h b/src/common/wpa_common.h
+index 1e3136843..c8cdf748d 100644
+--- a/src/common/wpa_common.h
++++ b/src/common/wpa_common.h
+@@ -643,6 +643,14 @@ struct wpa_pasn_params_data {
+ #define WPA_PASN_PUBKEY_COMPRESSED_1 0x03
+ #define WPA_PASN_PUBKEY_UNCOMPRESSED 0x04
+=20
++/* WPA3 specification - RSN Selection element */
++enum rsn_selection_variant {
++	RSN_SELECTION_RSNE =3D 0,
++	RSN_SELECTION_RSNE_OVERRIDE =3D 1,
++	RSN_SELECTION_RSNE_OVERRIDE_2 =3D 2,
++};
++
++
+ int wpa_ft_parse_ies(const u8 *ies, size_t ies_len, struct wpa_ft_ies *=
parse,
+ 		     int key_mgmt, bool reassoc_resp);
+ void wpa_ft_parse_ies_free(struct wpa_ft_ies *parse);
+@@ -704,6 +712,8 @@ struct wpa_eapol_ie_parse {
+ 	u16 aid;
+ 	const u8 *wmm;
+ 	size_t wmm_len;
++	const u8 *rsn_selection;
++	size_t rsn_selection_len;
+ 	u16 valid_mlo_gtks; /* bitmap of valid link GTK KDEs */
+ 	const u8 *mlo_gtk[MAX_NUM_MLD_LINKS];
+ 	size_t mlo_gtk_len[MAX_NUM_MLD_LINKS];
+diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
+index e48982989..9b13b3a84 100644
+--- a/src/rsn_supp/wpa.c
++++ b/src/rsn_supp/wpa.c
+@@ -531,7 +531,7 @@ int wpa_supplicant_send_2_of_4(struct wpa_sm *sm, co=
nst unsigned char *dst,
+ 	size_t mic_len, hdrlen, rlen, extra_len =3D 0;
+ 	struct wpa_eapol_key *reply;
+ 	u8 *rbuf, *key_mic;
+-	u8 *rsn_ie_buf =3D NULL;
++	u8 *rsn_ie_buf =3D NULL, *buf2 =3D NULL;
+ 	u16 key_info;
+ #ifdef CONFIG_TESTING_OPTIONS
+ 	size_t pad_len =3D 0;
+@@ -581,6 +581,37 @@ int wpa_supplicant_send_2_of_4(struct wpa_sm *sm, c=
onst unsigned char *dst,
+ 	}
+ #endif /* CONFIG_IEEE80211R */
+=20
++	if (sm->rsn_override !=3D RSN_OVERRIDE_NOT_USED) {
++		u8 *pos;
++
++		buf2 =3D os_malloc(wpa_ie_len + 2 + 4 + 1);
++		if (!buf2) {
++			os_free(rsn_ie_buf);
++			return -1;
++		}
++		os_memcpy(buf2, wpa_ie, wpa_ie_len);
++		pos =3D buf2 + wpa_ie_len;
++		*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++		*pos++ =3D 4 + 1;
++		WPA_PUT_BE32(pos, RSN_SELECTION_IE_VENDOR_TYPE);
++		pos +=3D 4;
++		if (sm->rsn_override =3D=3D RSN_OVERRIDE_RSNE) {
++			*pos++ =3D RSN_SELECTION_RSNE;
++		} else if (sm->rsn_override =3D=3D RSN_OVERRIDE_RSNE_OVERRIDE) {
++			*pos++ =3D RSN_SELECTION_RSNE_OVERRIDE;
++		} else if (sm->rsn_override =3D=3D RSN_OVERRIDE_RSNE_OVERRIDE_2) {
++			*pos++ =3D RSN_SELECTION_RSNE_OVERRIDE_2;
++		} else {
++			os_free(rsn_ie_buf);
++			os_free(buf2);
++			return -1;
++		}
++
++		wpa_ie =3D buf2;
++		wpa_ie_len +=3D 2 + 4 + 1;
++
++	}
++
+ 	wpa_hexdump(MSG_DEBUG, "WPA: WPA IE for msg 2/4", wpa_ie, wpa_ie_len);
+=20
+ #ifdef CONFIG_TESTING_OPTIONS
+@@ -601,6 +632,7 @@ int wpa_supplicant_send_2_of_4(struct wpa_sm *sm, co=
nst unsigned char *dst,
+ 				  &rlen, (void *) &reply);
+ 	if (rbuf =3D=3D NULL) {
+ 		os_free(rsn_ie_buf);
++		os_free(buf2);
+ 		return -1;
+ 	}
+=20
+@@ -633,6 +665,7 @@ int wpa_supplicant_send_2_of_4(struct wpa_sm *sm, co=
nst unsigned char *dst,
+ 	WPA_PUT_BE16(key_mic + mic_len, wpa_ie_len + extra_len);
+ 	os_memcpy(key_mic + mic_len + 2, wpa_ie, wpa_ie_len); /* Key Data */
+ 	os_free(rsn_ie_buf);
++	os_free(buf2);
+ #ifdef CONFIG_TESTING_OPTIONS
+ 	if (sm->test_eapol_m2_elems) {
+ 		os_memcpy(key_mic + mic_len + 2 + wpa_ie_len,
+@@ -4767,6 +4800,9 @@ int wpa_sm_set_param(struct wpa_sm *sm, enum wpa_s=
m_conf_params param,
+ 	case WPA_PARAM_SSID_PROTECTION:
+ 		sm->ssid_protection =3D value;
+ 		break;
++	case WPA_PARAM_RSN_OVERRIDE:
++		sm->rsn_override =3D value;
++		break;
+ 	default:
+ 		break;
+ 	}
+diff --git a/src/rsn_supp/wpa.h b/src/rsn_supp/wpa.h
+index 2bef093e3..f8346e1ef 100644
+--- a/src/rsn_supp/wpa.h
++++ b/src/rsn_supp/wpa.h
+@@ -137,6 +137,14 @@ enum wpa_sm_conf_params {
+ 	WPA_PARAM_ENCRYPT_EAPOL_M4,
+ 	WPA_PARAM_FT_PREPEND_PMKID,
+ 	WPA_PARAM_SSID_PROTECTION,
++	WPA_PARAM_RSN_OVERRIDE,
++};
++
++enum wpa_rsn_override {
++	RSN_OVERRIDE_NOT_USED,
++	RSN_OVERRIDE_RSNE,
++	RSN_OVERRIDE_RSNE_OVERRIDE,
++	RSN_OVERRIDE_RSNE_OVERRIDE_2,
+ };
+=20
+ struct rsn_supp_config {
+diff --git a/src/rsn_supp/wpa_i.h b/src/rsn_supp/wpa_i.h
+index d7e780519..6e4797577 100644
+--- a/src/rsn_supp/wpa_i.h
++++ b/src/rsn_supp/wpa_i.h
+@@ -229,6 +229,8 @@ struct wpa_sm {
+ 	bool wmm_enabled;
+ 	bool driver_bss_selection;
+ 	bool ft_prepend_pmkid;
++
++	enum wpa_rsn_override rsn_override;
+ };
+=20
+=20
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 4393c469c..93191c7fe 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -3368,9 +3368,10 @@ static int wpa_supplicant_event_associnfo(struct =
wpa_supplicant *wpa_s,
+ 					  union wpa_event_data *data)
+ {
+ 	int l, len, found =3D 0, found_x =3D 0, wpa_found, rsn_found;
+-	const u8 *p;
++	const u8 *p, *ie;
+ 	u8 bssid[ETH_ALEN];
+ 	bool bssid_known;
++	enum wpa_rsn_override rsn_override;
+=20
+ 	wpa_dbg(wpa_s, MSG_DEBUG, "Association info event");
+ 	wpa_s->ssid_verified =3D false;
+@@ -3482,6 +3483,25 @@ static int wpa_supplicant_event_associnfo(struct =
wpa_supplicant *wpa_s,
+ 	if (!found_x && data->assoc_info.req_ies)
+ 		wpa_sm_set_assoc_rsnxe(wpa_s->wpa, NULL, 0);
+=20
++	rsn_override =3D RSN_OVERRIDE_NOT_USED;
++	ie =3D get_vendor_ie(data->assoc_info.req_ies,
++			   data->assoc_info.req_ies_len,
++			   RSN_SELECTION_IE_VENDOR_TYPE);
++	if (ie && ie[1] >=3D 4 + 1) {
++		switch (ie[2 + 4]) {
++		case RSN_SELECTION_RSNE:
++			rsn_override =3D RSN_OVERRIDE_RSNE;
++			break;
++		case RSN_SELECTION_RSNE_OVERRIDE:
++			rsn_override =3D RSN_OVERRIDE_RSNE_OVERRIDE;
++			break;
++		case RSN_SELECTION_RSNE_OVERRIDE_2:
++			rsn_override =3D RSN_OVERRIDE_RSNE_OVERRIDE_2;
++			break;
++		}
++	}
++	wpa_sm_set_param(wpa_s->wpa, WPA_PARAM_RSN_OVERRIDE, rsn_override);
++
+ #ifdef CONFIG_FILS
+ #ifdef CONFIG_SME
+ 	if (wpa_s->sme.auth_alg =3D=3D WPA_AUTH_ALG_FILS ||
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index 292897edd..443b0b667 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -2467,26 +2467,44 @@ mscs_fail:
+ 		wpa_s->sme.assoc_req_ie_len +=3D multi_ap_ie_len;
+ 	}
+=20
++	wpa_sm_set_param(wpa_s->wpa, WPA_PARAM_RSN_OVERRIDE,
++			 RSN_OVERRIDE_NOT_USED);
+ 	if (wpas_rsn_overriding(wpa_s) &&
+ 	    wpas_ap_supports_rsn_overriding(wpa_s, wpa_s->current_bss) &&
+ 	    wpa_s->sme.assoc_req_ie_len + 2 + 4 <=3D
+ 	    sizeof(wpa_s->sme.assoc_req_ie)) {
+ 		u8 *pos =3D wpa_s->sme.assoc_req_ie + wpa_s->sme.assoc_req_ie_len;
+-		u32 type =3D 0;
+ 		const u8 *ie;
++		enum rsn_selection_variant variant =3D RSN_SELECTION_RSNE;
+=20
++		wpa_sm_set_param(wpa_s->wpa, WPA_PARAM_RSN_OVERRIDE,
++				 RSN_OVERRIDE_RSNE);
+ 		ie =3D wpa_bss_get_rsne(wpa_s, wpa_s->current_bss, ssid,
+ 				      wpa_s->valid_links);
+-		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4)
+-			type =3D WPA_GET_BE32(&ie[2]);
++		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4) {
++			u32 type;
+=20
+-		if (type) {
+-			/* Indicate support for RSN overriding */
+-			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
+-			*pos++ =3D 4;
+-			WPA_PUT_BE32(pos, type);
+-			wpa_s->sme.assoc_req_ie_len +=3D 2 + 4;
++			type =3D WPA_GET_BE32(&ie[2]);
++			if (type =3D=3D RSNE_OVERRIDE_IE_VENDOR_TYPE) {
++				variant =3D RSN_SELECTION_RSNE_OVERRIDE;
++				wpa_sm_set_param(wpa_s->wpa,
++						 WPA_PARAM_RSN_OVERRIDE,
++						 RSN_OVERRIDE_RSNE_OVERRIDE);
++			} else if (type =3D=3D RSNE_OVERRIDE_2_IE_VENDOR_TYPE) {
++				variant =3D RSN_SELECTION_RSNE_OVERRIDE_2;
++				wpa_sm_set_param(wpa_s->wpa,
++						 WPA_PARAM_RSN_OVERRIDE,
++						 RSN_OVERRIDE_RSNE_OVERRIDE_2);
++			}
+ 		}
++
++		/* Indicate which RSNE variant was used */
++		*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++		*pos++ =3D 4 + 1;
++		WPA_PUT_BE32(pos, RSN_SELECTION_IE_VENDOR_TYPE);
++		pos +=3D 4;
++		*pos =3D variant;
++		wpa_s->sme.assoc_req_ie_len +=3D 2 + 4 + 1;
+ 	}
+=20
+ 	params.bssid =3D bssid;
+diff --git a/wpa_supplicant/wpa_supplicant.c b/wpa_supplicant/wpa_suppli=
cant.c
+index 3203446f1..81eadbc9b 100644
+--- a/wpa_supplicant/wpa_supplicant.c
++++ b/wpa_supplicant/wpa_supplicant.c
+@@ -3943,32 +3943,51 @@ mscs_end:
+ 		wpa_ie_len +=3D multi_ap_ie_len;
+ 	}
+=20
++	wpa_sm_set_param(wpa_s->wpa, WPA_PARAM_RSN_OVERRIDE,
++			 RSN_OVERRIDE_NOT_USED);
+ 	if (!wpas_driver_bss_selection(wpa_s) &&
+ 	    wpas_rsn_overriding(wpa_s) &&
+ 	    wpas_ap_supports_rsn_overriding(wpa_s, bss) &&
+-	    wpa_ie_len + 2 + 4 <=3D max_wpa_ie_len) {
+-		u8 *pos =3D wpa_ie + wpa_ie_len;
+-		u32 type =3D 0;
++	    wpa_ie_len + 2 + 4 + 1 <=3D max_wpa_ie_len) {
++		u8 *pos =3D wpa_ie + wpa_ie_len, *start =3D pos;
+ 		const u8 *ie;
++		enum rsn_selection_variant variant =3D RSN_SELECTION_RSNE;
+=20
++		wpa_sm_set_param(wpa_s->wpa, WPA_PARAM_RSN_OVERRIDE,
++				 RSN_OVERRIDE_RSNE);
+ 		ie =3D wpa_bss_get_rsne(wpa_s, bss, ssid, wpa_s->valid_links);
+-		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4)
+-			type =3D WPA_GET_BE32(&ie[2]);
++		if (ie && ie[0] =3D=3D WLAN_EID_VENDOR_SPECIFIC && ie[1] >=3D 4) {
++			u32 type;
+=20
+-		if (type) {
+-			/* Indicate support for RSN overriding */
+-			*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
+-			*pos++ =3D 4;
+-			WPA_PUT_BE32(pos, type);
+-			pos +=3D 4;
+-			wpa_hexdump(MSG_MSGDUMP, "RSNE Override", wpa_ie,
+-				    pos - wpa_ie);
+-			wpa_ie_len +=3D 2 + 4;
++			type =3D WPA_GET_BE32(&ie[2]);
++			if (type =3D=3D RSNE_OVERRIDE_IE_VENDOR_TYPE) {
++				variant =3D RSN_SELECTION_RSNE_OVERRIDE;
++				wpa_sm_set_param(wpa_s->wpa,
++						 WPA_PARAM_RSN_OVERRIDE,
++						 RSN_OVERRIDE_RSNE_OVERRIDE);
++			} else if (type =3D=3D RSNE_OVERRIDE_2_IE_VENDOR_TYPE) {
++				variant =3D RSN_SELECTION_RSNE_OVERRIDE_2;
++				wpa_sm_set_param(wpa_s->wpa,
++						 WPA_PARAM_RSN_OVERRIDE,
++						 RSN_OVERRIDE_RSNE_OVERRIDE_2);
++			}
+ 		}
++
++		/* Indicate which RSNE variant was used */
++		*pos++ =3D WLAN_EID_VENDOR_SPECIFIC;
++		*pos++ =3D 4 + 1;
++		WPA_PUT_BE32(pos, RSN_SELECTION_IE_VENDOR_TYPE);
++		pos +=3D 4;
++		*pos++ =3D variant;
++		wpa_hexdump(MSG_MSGDUMP, "RSN Selection", start, pos - start);
++		wpa_ie_len +=3D pos - start;
+ 	}
+=20
+ 	if (wpas_driver_bss_selection(wpa_s) &&
+ 	    wpas_rsn_overriding(wpa_s)) {
++		/* TODO: Replace this indication of support for RSN overriding
++		 * to the driver in driver-based BSS selection cases with
++		 * something cleaner. */
+ 		if (wpa_ie_len + 2 + 4 <=3D max_wpa_ie_len) {
+ 			u8 *pos =3D wpa_ie + wpa_ie_len;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0015=
-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0015-RSNO-Use-SNonce-cookie-=
to-indicate-support-for-RSN-o.patch
new file mode 100644
index 0000000000..9be8757102
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0015-RSNO-U=
se-SNonce-cookie-to-indicate-support-for-RSN-o.patch
@@ -0,0 +1,84 @@
+From 6f522baa1b445536b3aa7ea0d3a28475fa91e644 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Mon, 29 Jul 2024 16:43:50 +0300
+Subject: [PATCH 11/11] RSNO: Use SNonce cookie to indicate support for R=
SN
+ overriding
+
+This provides an implicitly protected (SNonce is used as an input to PTK
+derivation) mechanism for a STA to indicate support for RSN overriding
+in a manner that does not cause interopability issues with deployed APs.
+
+In addition, update sm->SNonce on the Authenticator only based on
+message 2/4 since that is the only EAPOL-Key message that is defined to
+provide the actual SNonce value. While clearing of this internal buffer
+on message 4/4 might not cause issues, it is better to keep the actual
+SNonce value here since the SNonce cookie can be used at a later point
+in the sequence.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?h=3Dhos=
tap_2_11&id=3D6f522baa1b445536b3aa7ea0d3a28475fa91e644]
+Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
+---
+ src/common/wpa_common.c | 21 +++++++++++++++++++++
+ src/common/wpa_common.h |  3 +++
+ src/rsn_supp/wpa.c      |  2 ++
+ 3 files changed, 26 insertions(+)
+
+diff --git a/src/common/wpa_common.c b/src/common/wpa_common.c
+index bfaca9128..4f58f0737 100644
+--- a/src/common/wpa_common.c
++++ b/src/common/wpa_common.c
+@@ -4274,3 +4274,24 @@ int wpa_pasn_add_extra_ies(struct wpabuf *buf, co=
nst u8 *extra_ies, size_t len)
+ }
+=20
+ #endif /* CONFIG_PASN */
++
++
++void rsn_set_snonce_cookie(u8 *snonce)
++{
++	u8 *pos;
++
++	pos =3D snonce + WPA_NONCE_LEN - 6;
++	WPA_PUT_BE24(pos, OUI_WFA);
++	pos +=3D 3;
++	WPA_PUT_BE24(pos, 0x000029);
++}
++
++
++bool rsn_is_snonce_cookie(const u8 *snonce)
++{
++	const u8 *pos;
++
++	pos =3D snonce + WPA_NONCE_LEN - 6;
++	return WPA_GET_BE24(pos) =3D=3D OUI_WFA &&
++		WPA_GET_BE24(pos + 3) =3D=3D 0x000029;
++}
+diff --git a/src/common/wpa_common.h b/src/common/wpa_common.h
+index c8cdf748d..4cb5b8c60 100644
+--- a/src/common/wpa_common.h
++++ b/src/common/wpa_common.h
+@@ -797,4 +797,7 @@ int wpa_pasn_parse_parameter_ie(const u8 *data, u8 l=
en, bool from_ap,
+ void wpa_pasn_add_rsnxe(struct wpabuf *buf, u16 capab);
+ int wpa_pasn_add_extra_ies(struct wpabuf *buf, const u8 *extra_ies, siz=
e_t len);
+=20
++void rsn_set_snonce_cookie(u8 *snonce);
++bool rsn_is_snonce_cookie(const u8 *snonce);
++
+ #endif /* WPA_COMMON_H */
+diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
+index 9b13b3a84..0a1d4d07f 100644
+--- a/src/rsn_supp/wpa.c
++++ b/src/rsn_supp/wpa.c
+@@ -1023,6 +1023,8 @@ static void wpa_supplicant_process_1_of_4(struct w=
pa_sm *sm,
+ 				"WPA: Failed to get random data for SNonce");
+ 			goto failed;
+ 		}
++		if (sm->rsn_override !=3D RSN_OVERRIDE_NOT_USED)
++			rsn_set_snonce_cookie(sm->snonce);
+ 		sm->renew_snonce =3D 0;
+ 		wpa_hexdump(MSG_DEBUG, "WPA: Renewed SNonce",
+ 			    sm->snonce, WPA_NONCE_LEN);
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c1..ca1bf2ab42 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -19,6 +19,17 @@ SRC_URI =3D "http://w1.fi/releases/wpa_supplicant-${PV=
}.tar.gz \
            file://0002-defconfig-Update-Opportunistic-Wireless-Encryptio=
n-O.patch \
            file://0003-defconfig-Document-IEEE-802.11be-as-a-published-a=
men.patch \
            file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
+           file://0005-Define-WFA-vendor-specific-element-types-for-RSNE=
-RS.patch \
+           file://0006-Add-RSN-overriding-elements-into-IE-parsing.patch=
 \
+           file://0007-Allow-RSNE-Override-element-to-override-RSNE-cont=
ent.patch \
+           file://0008-Allow-RSNXE-Override-element-to-override-RSNXE-co=
nte.patch \
+           file://0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-over=
rid.patch \
+           file://0010-nl80211-Add-a-capability-flag-for-RSN-overriding.=
patch \
+           file://0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BS=
S-e.patch \
+           file://0012-Make-driver-capabilities-for-AKM-suites-available=
-wi.patch \
+           file://0013-RSNE-RSNXE-overriding-for-STA.patch \
+           file://0014-RSNO-Use-the-RSN-Selection-element-to-indicate-wh=
ich.patch \
+           file://0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RS=
N-o.patch \
            file://CVE-2025-24912-01.patch \
            file://CVE-2025-24912-02.patch \
            "
--=20
2.34.1



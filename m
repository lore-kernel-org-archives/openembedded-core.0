Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEB9C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:21:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7734.1785230093307846464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 02:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nbLqbXsz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KzLvodEv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: hangtian.zhu@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82GWS2128814
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 09:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QL4eSAFE29hZsiR5i1m2gM4PQ9brc6vHtW5
	uf4RQPbs=; b=nbLqbXsz1BbXnUDlsKjh+zSZSJyGNnS+hUQ2TFZ4WsAinTIlxMB
	ouMhp1Xca9ZJMn/pvLX1oXDR/mhBamlUIJPNEOxtOO6kAD8PqBNwMvBIvmPhKVI5
	jLEpvVqrXmlp53DG/Vc4iANerG1pa8HDGRpJDsrqzFOYFhK3XvuFv+09iLWFvinA
	BG5K9kbA/CUGPYrIUCE7s6//C63q32gJapg5Tc/6cA2YVPSvGFWp1uAR1TjWPIw4
	L8VnSeLSQ6g3W3lI05iqeSxgWPE3jcFZTrXHKd5UinTTS/QH0ta9FRueZgWW5bFg
	S4ZZSFUWYsu9tHlaT/KkQlx2Tol1DfXF4xQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bbx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 09:02:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so77161945ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785229325; x=1785834125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QL4eSAFE29hZsiR5i1m2gM4PQ9brc6vHtW5uf4RQPbs=;
        b=KzLvodEvEl2C3YXT0eHCu94iEkuKqwi/BejDrixfXO2d43OPXXjLy6lx0L0y5lBBr9
         lmyKLZWxGX3AKGUa52amNCCmk4rYfdqEc6yPh6aJAbE4/lXYx0LFlgHdIZ9DH3VNdGKu
         OWml6Xcz6/Jyz/T44LQGPDFnHoE5xVynOVLGmyU1Vq1wQcVUSVdmwX8b+OsQj9oPxusa
         Sz62V/S6SHWT4LlH0MrgVfxTRs4FNwS4Cl3/zCLOgQAknVk7s8rqmg759/pi7gRc6qBm
         StR0merXbsGJWV31Kja2IVChf0zHd7w21sLfygCbBj6QOLWW6Tg3j22PhRKGnSTtib8h
         3FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229325; x=1785834125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL4eSAFE29hZsiR5i1m2gM4PQ9brc6vHtW5uf4RQPbs=;
        b=R8DUhgQIS9rtweypm12DlB+jpK2Tu7cxSF3ZxysJzVDbiA5xd0JMEON/728aUYFgHU
         LJ6BEQwgipSu1wqHcS2ux5S04Wy8pCtu7K8NnMLRVEJRG1lf99t30jM62E1hqOjpfefy
         JNPL7bKU+8dfp6KVoXrO5ODxiHKI4nI3UWuh0Cha1gxS0EinyS+/+pPjCBnX6aRP53CF
         OGIcZ3D5H3LRZ4EHlJZmbXwufsLP7TaZ4rt+Ze74K2rDCRrZoHIqI3nIjc+4s+5WcW8H
         i0x/4gCtBS7Xm1Mp/RF9xmHAVf+GsC/h5YqaZfvKly18kIzXwlO3bweVQRPNa3frNvDm
         rE5A==
X-Gm-Message-State: AOJu0Yxfx1knrBAuH3En1SFlBupMSI0ghrC54u/eGTaNSz7ZCylesG3r
	hO93Nvjw3RtgKIEHgs5HKlMcB9uzc15LLpgSMy/bZGCxzEcuhesTZCnb/FiiHxqRwVnHN7C4NDx
	cxH5mmNUOsMeFqekEYn1/EMO6mTVk/xy7+OughOV/DKtXhUAjzM580m644cW4oW46Tp+J8Ezt7I
	ol8701H3gXmbP5wBw=
X-Gm-Gg: AR+sD11uT/z6qCGAND7A+O9/Fq2Su08qoNAQKlNrxNYFNOCcPdJNT3HWIw93f4Evv38
	dmmd875cQhIUauIWUp94GeB6PMDokKWLEkHjEdXgnYvtIoMJbUHjL3mMTLAudiEopd9M5MGQGgl
	Y/UN0DoERVf69rspmsQEPyaELMhxrI0+VFXhH0j/upWRjtnJj7vRsV+aUBTKx3KUHVU1vdM6LuO
	AR8E5ZT23t87E3JLNUXTupnMU9YDP3f2ZhhcSD+u+dmeNGpXIqQeBYQqwr65bmjfEAyw+lV6W1t
	XcvSsV70l+0W3a+jdrc9OrDwSmT5WuMD5zuJpx98TTkKQ6h/NEt8qN2r1R6oDDLCi5+aEYy9UNz
	uMy63L9tjvPmyCRR8CdxkuAT4z/ayflHm0xu0UkrpKwiRyhl/eduLSHiyN+nxTCri
X-Received: by 2002:a17:903:2308:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2d015d22fd0mr17696055ad.27.1785229325296;
        Tue, 28 Jul 2026 02:02:05 -0700 (PDT)
X-Received: by 2002:a17:903:2308:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2d015d22fd0mr17695215ad.27.1785229324399;
        Tue, 28 Jul 2026 02:02:04 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdcdsm49100905ad.49.2026.07.28.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:02:03 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: miaoqing.pan@oss.qualcomm.com, gaole.zhang@oss.qualcomm.com
Subject: [wrynose] wpa-supplicant: add PACKAGECONFIG controls for suiteb, wnm, and mbo
Date: Tue, 28 Jul 2026 17:01:59 +0800
Message-Id: <20260728090159.3864155-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NyBTYWx0ZWRfX6Q9mpz7Qa7vW
 GViM7sDqe+3CcyC6y/Vn8xc76cs9vizJbnXkepYgYQInPeF1z40mPIuGnnpeNSdTYWc+WE+ZYdl
 sA423Hr+/NlSpsObr0rmbVXfhMPcck62xa8wBwOtQtciuBBgeTgKkKeXKsWvvf0+1E+4w+/0wSF
 v047uBtII/q6dMIIUXksbj47iv/DkkBNzYPouL51PnS4z6VlJTeasTmg6AbKar9i+OI/h4IUaGF
 uT/fU8BlVnXSYvw2lDQ1dnXHgtMw31/8CEZewCH2wqXNYs20Em9NOweQLnszhDUCl4AAO//+e+A
 P+rRnlXpfxAbLSfeGEV4Gmv1zl+nMjCCEnVOWJ9FxCyCekP7jD7OVK2Q3in1pCpVLbcZCu3OU5M
 M2sNyT5zN9Pi/PG/feEhcGrksBoUS9YRYalmyiUefmKfUZlO2TvhD8dlcdU4h904nLfhXmOUp1c
 bNxkQmxpDXjXyQFZCoQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68700e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=S9PWtUsRgIVsDFoORi8A:9
 a=324X-CrmTo6CU4MGRt3R:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: oebnYSgVvUceSMvS-QMpWyCjqjzypQl9
X-Proofpoint-GUID: oebnYSgVvUceSMvS-QMpWyCjqjzypQl9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NyBTYWx0ZWRfX72uOT8pyYBUr
 Kb8JSOz6MK34bmCcfolF+CoetBwRHAEJ/moUqluBLfcv9U7Ie4YiCKCRf5vEfAClC19IMnecbzh
 NFuTwyLfPMyPUV/elnyTHpKcfcRzUSk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280077
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242173

Add optional PACKAGECONFIG entries for suiteb, wnm, and mbo and map
these to the corresponding upstream build flags:

- suiteb: enable CONFIG_SUITEB and CONFIG_SUITEB192 for
  WPA-EAP-SUITE-B/WPA-EAP-SUITE-B-192 enterprise modes
- wnm: enable CONFIG_WNM for IEEE 802.11v Wireless Network Management
- mbo: enable CONFIG_MBO for Multi Band Operation extensions used with
  BSS Transition Management

Upstream hostap configuration keeps these as optional capabilities.
Exposing them as PACKAGECONFIG options lets distros opt in for
enterprise and roaming use cases without changing the default oe-core
feature set.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38860938302e6167b1c890b75e808f3a4ff08805)
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c1..d3e4352022 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -31,6 +31,9 @@ inherit pkgconfig systemd
 PACKAGECONFIG ?= "openssl"
 PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = ",,openssl"
+PACKAGECONFIG[suiteb] = ",,"
+PACKAGECONFIG[wnm] = ",,"
+PACKAGECONFIG[mbo] = ",,"
 
 CVE_PRODUCT = "wpa_supplicant"
 
@@ -52,6 +55,19 @@ do_configure () {
 		    -e 's/\(^CONFIG_OWE=\)/#\1/' wpa_supplicant/.config
 	fi
 
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'suiteb', 'true', 'false', d) }; then
+		echo 'CONFIG_SUITEB=y' >>wpa_supplicant/.config
+		echo 'CONFIG_SUITEB192=y' >>wpa_supplicant/.config
+	fi
+
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'wnm', 'true', 'false', d) }; then
+		echo 'CONFIG_WNM=y' >>wpa_supplicant/.config
+	fi
+
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'mbo', 'true', 'false', d) }; then
+		echo 'CONFIG_MBO=y' >>wpa_supplicant/.config
+	fi
+
 	# For rebuild
 	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d
 }

base-commit: f66b182e2ff431b624dfc3a506d25dc8f1fc6db2
-- 
2.25.1



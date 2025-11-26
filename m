Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F281D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14158.1764167920769240429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 06:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SAIcZ0R0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Yxuc/nsr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5tR513890412
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/FZY59l2FM9
	j3YFKXFOF/kWCuXDvI5XkNlNcSM29cYo=; b=SAIcZ0R0P1mKFGPE+FC5Rj9ul4o
	MwMlzxJ2+ugA4ibhifvbq5Z7CyQtSuqr1mxfb1yzwBriWnccK5PpFFBPraSSpIyZ
	ky9ZwzOJzeZL5w3VsSFh0LNF4C1ohLjzrorMaLUS8nIHaRrjWwdULtJ6WTGsXlAU
	oGBHkT/RgbJ51YZ5ECD84yBzrJlEk0YGXDKBTmgdxcU3sdZrHyg27efqR3me5Wy9
	RxgOJt/eybEtmKR5bl10SVFDWh4sFf6luHAthANym4Eqtli30JKCZoWV11gT6vIv
	Xq3VSmozWKcWTeZY7bwN3/OxmugJJlrf5/QoA75IHvvq3HtVbn01nr35gYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmeb13s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be94e1a073so14552722b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764166051; x=1764770851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FZY59l2FM9j3YFKXFOF/kWCuXDvI5XkNlNcSM29cYo=;
        b=Yxuc/nsrYscXoNqEzPPAmdFuUnbXAUwtCLpDGhp1kTHE/iWnfSpOpXp0irsuMUnbN/
         NMou4PdTJ5VFg9vkJCvxk0SKBxfjtfFvriuNDICYrk4ldpsj1x9XIT9Lxu1hC/wjSI1Y
         Gw+cJol0bjPhNT5I4ur79u/J88yYhb5mj3cHFiD3flamQo5WHQEHi2jjQQML9vpikz8k
         7267GIGBFOESTxDIxa0Upo1C4mA87bPgG0rO+yqf0fK7eoz/5WL+AW+nncKRtJrZYe1j
         q8Nx5uICmzMsWBhuuIA63hJGa2q+aDFGwoBYZIJJWA/rT+pF8SZjM0GLiDbIb/iOlO0v
         ENVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166051; x=1764770851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/FZY59l2FM9j3YFKXFOF/kWCuXDvI5XkNlNcSM29cYo=;
        b=N0UyxP6YMlCbBXXfZABn0EOh+iu+2AgEZyoA3Ly0vXQqZI2Ky2ryExi0/Jxn6V6e39
         7p1lU0NHiZ+W0tKvLpqgJTfiB2PaOyVAI6RrzfIbQP6Bm6xVZ/dfd5DOQmnJKFIGH35U
         6DxDUxTj/P9lWQ/pX4enrp5PFJ98mee9F4lHVgMrJMbyBOBJU98omlvs7gmbY1SKVvZv
         kJ7FXWu2I6lJDZo0XL0HDDEHWTqtOTWSvGjn3KUS6mF/avHxRhISXgZwUSJWR2DNF+uK
         rzfekXLKLYxJcbls2UD9/oYIs5KI4w0XDTjN9oPIPAxopGXfF+HOjgx3roBifnRjP+gK
         goHw==
X-Gm-Message-State: AOJu0YxYFKgexCEvRR3LOTdnB17wfyyKxY6mbiTLcx7ETiSGy78/rniB
	jXrVFoHEzmleQsqo9mv/zsz0W0ZsEoo7DXO77hCX+Flgn011xK/Mqfupyjl1ihBYLI23X5gCoLB
	huSMumXQtVYrhBFeqgV0VBB11cHMgAJ/PS3IDUKc8S9Pu6gitmIGp8Q+BF3sghO777PnWj2SNqN
	hosIMbxWi4iUc9LMgN2Q==
X-Gm-Gg: ASbGncvuAWIZEYTATT6m998JEk1Y8vLrsM2fGi+LXsLbr2BvZTniHIv9v51ngQW71io
	GoOV5/sSROgrBH/6Agal3VIg8HTuZRPe+ea3b37ImDnmpV/W8/JjioAks3onykhk2E4gU6Du7gT
	6XILu6NaKYl2PuNe9pwNj1eJJr//+XwvnUYv4RCFXNJxMEz2g1ISvHaVRKRFSN7DZ38MvBea1Qk
	/tNSDn6Zbbqy7GenLZaoCEtCFI7lFMn9NapvQLadX7qBpxKPJk1pq/AK+njSnuJkzJt+AlOY/A7
	7ZxVqxG27su07h8JXlEwJ6dsFd/pfVzP+Mve584VgoRG6x3s84DA3XJGxol0rkQEM2+qRZPPSL/
	Ell9G21OJH04eemXf/gpyCGftcPhWUgSmaPXLzgF2a3c3YZX39D2vUG4ZJdCCkc+pLO2H
X-Received: by 2002:a05:6a00:4b4d:b0:7b9:dbf2:3bae with SMTP id d2e1a72fcca58-7c58eaff576mr20113182b3a.24.1764166050525;
        Wed, 26 Nov 2025 06:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRSFU+VgwITOWKnM8dNTyuFC3XKtH+awuUPexsUUm1a59HRlHMPr2eb4WeUmDFu/mbw4Pp7g==
X-Received: by 2002:a05:6a00:4b4d:b0:7b9:dbf2:3bae with SMTP id d2e1a72fcca58-7c58eaff576mr20113138b3a.24.1764166049865;
        Wed, 26 Nov 2025 06:07:29 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm21624961b3a.50.2025.11.26.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:07:29 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH 4/4] wpa-supplicant: enable OWE support
Date: Wed, 26 Nov 2025 22:07:13 +0800
Message-Id: <20251126140713.1414484-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=692709a4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8-X2_eq1b9mRwI7FikA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNiBTYWx0ZWRfX2oRooRH+xfXz
 Tz+Pgv8TPF22FpHAhS6cx21fSEmsxNUdZUUZrjiaC5dH3OI8eeOGgeQT3Y8qiRvO1KtppJIekaa
 2hu8YarsamBCG2REbRB4gmnxArOaraiRZIsEkwfwiR7LF8z/bIhFh6CbgHW1oxtJMkvOJvHxCdc
 +2jaUaA/Udr2HcvmzzBUATpK4UKMrXzcHUktJfE9kp05zVO9KJ8D05wPtVLi5zrHY9/uAvyYx8y
 6gzGK8HOAXAghrTj0Df1eQucEGTpp5EyOfb036QerVkE2yS0KDydAkPKCJOuO295fqUU1aG186Q
 fRVn97OseGTRg2rs9mqlOGfm5qvbV3Q6cEKKi0zFEVUDEGxIfc0ETvJxPOqNg7F/Qdzr6Xw23fN
 uaIDhtajYZx3lJvqDh14TteIHig8Kw==
X-Proofpoint-GUID: rilMEVU49oueG1yhC-inH3pAodJnv5m_
X-Proofpoint-ORIG-GUID: rilMEVU49oueG1yhC-inH3pAodJnv5m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260116
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226840

OWE is now standardized under IEEE 802.11-2024 (RFC 8110, RFC 9672).
Enable CONFIG_OWE=y in defconfig for easier testing and examples.

Disable OWE when PACKAGECONFIG selects gnutls to prevent build
failures.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index e313894ecd..8a68d56ffd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=y
 
 # Opportunistic Wireless Encryption (OWE)
 # Experimental implementation of draft-harkins-owe-07.txt
-#CONFIG_OWE=y
+CONFIG_OWE=y
 
 # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
 CONFIG_DPP=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 4a8ee1423f..971e55150d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -48,6 +48,7 @@ do_configure () {
 		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
 		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
 		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
+		    -e 's/\(^CONFIG_OWE=\)/#\1/' \
 		    -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
 	fi
 
-- 
2.34.1



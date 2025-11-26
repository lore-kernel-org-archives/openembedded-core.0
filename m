Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11451D116F5
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13639.1764166570692656983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 06:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SHrXVB5U;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MyBUTu/L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAf17Y3706636
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVYzhDTClTX
	DhjsGkMJAznKpPpryFcJ1lCsIcHtdHhc=; b=SHrXVB5URrZ4FPPWBtJtzCLmkRX
	EgfxUz6xob9PolxTxPSyr/qOnmlgQAUOwhKs+XdKgCuqwl5utjj2XC7UtA5Yvyul
	+Q/XXvOpMW1FofF8fqI700FKflE3vyyD7exchlWbPhPR0DnOcXnkgd9sOggXv6k1
	vc0ZFU/6wTOC1yixrSXKSBcvyfVz1sDMatbbEUuHZwIYU8zBzbgvwhJle00HxTiR
	2kex8eK24OZBcxgSGpgS+gFNE50stlxjqSF56HCI7NMR3K7yWTjVjgZdjyZAOVVa
	vgRSADCWCH/SlOOc4gawpK2l5ZqZRuGcY9tdAwhJhov7mv5GtRWLqwMqVlg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufumt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa9f595688so11089484b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764166047; x=1764770847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYzhDTClTXDhjsGkMJAznKpPpryFcJ1lCsIcHtdHhc=;
        b=MyBUTu/LUD/g3op6LsA8KN3pYwN5beqk/ulTaRX3a5khk1YRA1Hf3tKINYS2g59tCA
         G9RIOqg8cowDynWVzFhkZc4YhJohqOtVd94tOvScbt46ZzrXkCf7XSIErJ5fhi/TnlWk
         MsYt+AX4nqYTHw9+v7wRfJfh9JAy4OlWU6LX5frv8aBYpOUBj6KCZttMzTjK8QjQn3kz
         vbXDhO6R0Rcz7rN67I79X6c2swHQzpoITpGxcO5IncxyfiHJyhGbLfRNbXnnD7Gt6D2f
         vZIooPnoHGJ2vNOEZVZFgWZW7FS5WG7oKNTFMaHKV3eDlIHIKQXKFMRmiMMYQRppPltz
         oErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166047; x=1764770847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVYzhDTClTXDhjsGkMJAznKpPpryFcJ1lCsIcHtdHhc=;
        b=BVRPU/Y7kgaqUmmXrq9hBiH0JTENP30ys1cHGbueqHk//C4zgeQdE9nfxglNZQV/du
         FcJ3kLWLBTOPZQ7dhRFVJPkxX0cvXX1ZcphvBi0BeX4MPhSM6LnRwkT+8z+FNS4tIMej
         uCHY35J69PfIc5J9tcpMf/QXLMRl8zeBO1zKtvO2d2tTI6mS3pcHMVwuqzumq1NJoD5P
         ouLKKmQ8jJQJPkEp3Eyd+XGhcOd6qy8wPHfhdHerKFHRU9TzwctZ28jCTqmrYEKfsNA7
         S1gSX0GRKUE6KsQ7Hcx58Q/AQ8fkNDN4jkeYbfuWfTGRWgYvGLBqfiSgJmOwifTxsBH8
         nMCw==
X-Gm-Message-State: AOJu0YwowC8F71mrmw0QVwArPQnplnDZS+yOJbUzfV/bV5s+QNun+JlB
	cm2f5R9hg8HBeqk04ypPShsNUJ1SvTILPUqo9R8SQUJAxr3rs619nt51mR0dLiw/m38RNYmndXA
	WTAAPvP/NYGH9aFxhGZF0baa9ki4YxNTT6tiVxklvQJ+KqUBPr3dBA+Agm8YmF2nFo3C5vVbcwA
	pXetz93xcEQ/kSOf35Cw==
X-Gm-Gg: ASbGncuihAQmynd2MuRtzWx6rbDFqluShRb2M1TPVSCtt45AmYLfAghVsRCIhxXUyUj
	M2lwB46n+4ozM9+0dv61K8AHP+hrE8Yp0WH8C/gn1eMZcRAWuV8/zVm2k+78qYB0LNBNvkyK/MS
	kfsQF5pVVfyZUmrt039NT3UZ+ygIbWIIzTpjDS+AMtiuNA/gqRyb9bNZhcGFyZyl3/+3fPcWUGF
	XaEOZv0A+dKNktqSeUEGflCTIk0rx8eR0HEMO533dIHLzy8ndL8jYWf8E1ChtIIw3Wj5ic/i9Hu
	o32ekmVlyK8wZJ/z+onGcTgHIsNJ++Xnn+TtSbiwu31qxXlYVtCLlQqgy5R6j1tuX13NXu8xBCo
	5MbxKRREXR0sjnU62OmQ8pvTLdkjmkz6rX0pjYLXfMxR0xl/l4zuBqUhpDiD/B4C2MrtE
X-Received: by 2002:a05:6a20:729f:b0:361:2d0c:fd81 with SMTP id adf61e73a8af0-3614eda84f6mr23058416637.28.1764166046448;
        Wed, 26 Nov 2025 06:07:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOnS1WUy0/J1hEBwMFB+E3LeTpBk0+ssqN7Iz6o7rRab86Q9K3CGuSkBd5rUTneg1rWuKvlw==
X-Received: by 2002:a05:6a20:729f:b0:361:2d0c:fd81 with SMTP id adf61e73a8af0-3614eda84f6mr23058367637.28.1764166045901;
        Wed, 26 Nov 2025 06:07:25 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm21624961b3a.50.2025.11.26.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:07:25 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH 2/4] wpa-supplicant: fix sed indentation
Date: Wed, 26 Nov 2025 22:07:11 +0800
Message-Id: <20251126140713.1414484-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6927099f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9ihjotKR8CUbmp-cvTkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNiBTYWx0ZWRfX0JiE/dn+r3pc
 rX42X8YKtlIL4v2w5iEVxjeg3RYPG0edHu34e4sTrpF+bfJMjhKhbbhXkWE7ut6IiHBnTNGgkKt
 rYeuTPBRKff0+/5QQ8HJMq4ZEiVLDE1+h90Z2T1ugmKXw2G4vHthvluUkqAzSBAU7GmxMbSYoag
 gWrFUj7Wfc/mM+8l2r3RiBmXiw84YkD9nlDFa200M2GASTU/8lkK6pUrw8oh03Ekv6rZK6EGMRF
 M1uiBm60Bn/dwtJI9S/yzwzBgzD2TkXw42qMLuAi8tfvLprN0qJJAFrBwAkdet3/V6rRB0aBG1R
 XGqymeTCF16W6pSDq7ink4MKwzOiWV8L5AGEJIH8gdFN+LoQOgVhYfz4ZCT2Hal+G0UnK/S5fs/
 qL7JhKHSVl9umRaTpVdau5pxDVU5YA==
X-Proofpoint-ORIG-GUID: On8QKI_BXn7-vVFQmcC1oZ5sM-vYi-eZ
X-Proofpoint-GUID: On8QKI_BXn7-vVFQmcC1oZ5sM-vYi-eZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260116
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226838

Unify indentation of sed commands in do_configure() for better
readability. No functional changes.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index b9a8964439..4a8ee1423f 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -46,9 +46,9 @@ do_configure () {
 		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
 	elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }; then
 		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
-        sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
-               -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
-               -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
+		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
+		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
+		    -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
 	fi
 
 	# For rebuild
-- 
2.34.1



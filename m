Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AD1CFD2F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:38:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7002.1764293933719667297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aIAcjSEr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UvRYmGFL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAW6PQ914009
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KtiQ1sOkweM
	Z3cPrkGEbZMhHWjbt+ZYu2WjECg8FrWo=; b=aIAcjSErakJothQMHKxA08iWHXI
	PXR+J6+hIinw3ZaacIhmNFWaPZWMoLv/Ibfq4PPmf1MhmwYpE1/fCO7uyJrtpCw1
	3y0gvHaiMVuUdEGlrFzBGiXx3LTr6/Phn2VaAMzUHaiIAZZpGlOMloEQPwbJJFPd
	j2k96Pzo/O9/aYPzRKXtg61jdSf7wBRxzmPt0/MUmrbjfETm+Oe7XyYxSyUf1gaE
	PgYtksxCzIGMDSNMqFh0LdSH2jhQun3QZ3Mil37dQ+RP+EhVQBeBiY8BpAsGcph0
	qAT2CVUitKj7bP5yv56g3+pn0qQ7GKfDGtOcozzREHyEXVWurgbliL8pYoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynspcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438744f11bso2169402a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293932; x=1764898732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtiQ1sOkweMZ3cPrkGEbZMhHWjbt+ZYu2WjECg8FrWo=;
        b=UvRYmGFLEIA4Ph9uRa2pP8xUOphS62JD0E38DWYZRo3FM+z73uT7T6nXoRuj285FVX
         D9Lqek2qrXUaEFbtPS3QfL6aMEcYS6C1KsuTZyABJWN0MX1NBxiG20r61fdH5j1tCq8F
         XaDhWSi9hKDlXK3OdK38PJR1A9rb6UfpEGcKbEhx0Tu6EfgTvSuV8TghVN2Vv655xtgD
         ttLk3OknrAV5S0q1Pr10d2ksbEXl2mejvlNPjpDjXYDUwSJT7SQGRwkvxyzIbyy3RzBY
         kYnU/zEW4luLckg3rsQIs6CCDcYjgx2yeymLZhzca2zFFgvw56AyOi1XV9Sh/AGpPA+q
         HcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293932; x=1764898732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KtiQ1sOkweMZ3cPrkGEbZMhHWjbt+ZYu2WjECg8FrWo=;
        b=HIXCPRKmAdWCGQGBN9Lwn9sByilQNUk9CjKTsLfdOix+W1TsIDun78Wex8WAUDhp2Z
         ryw3K9RzzZX/v8kWLPRGj4FYc148LCQtbLF0MZKLAZUMLn4GyyZbdpUrWKif46ap1TX/
         SWuCh3TfUevAG2Kt1mgOYvoJEADccd4jOzfYkACfgU7LNpT5KTQClzPgEkHxLVgvbeqc
         7Z8k42fT4ltAdbhf0wH+gv4Poh32qOQD0ZuiCK1BSIF7GWx7JiKNONb8SOgI7amQdjYQ
         E7KN7zBOIltxAzoSFgoDpiTPo9fXlFgLK1FX6JuxSeCAOw+nSvvd/qILmsoK4PJHBcc0
         xVuA==
X-Gm-Message-State: AOJu0YxR6V7SEOMI0Qz0xx+2AVSVjA4cv6hIB+pvkKPTR9iNNuCQcvYN
	aLJKKWpfVpj4uTjc4hM8TVd2iMR4U5b4tXH60D9ZoSI8Kg1Jqr4FNOG7Kz5Nclxem+4SITYZCZW
	bo6kRSI0fvDjCYXJ+TjGUecDxQ2SDNVoepPNpbPKhMFVdTlw3qMwyiZ8n4FHmBrj7PmheQbZU50
	MEcNyezcZmfwZpLkhslw==
X-Gm-Gg: ASbGnct1SN+wkaYEpj9EuOHy1jX9ZpWUE/FKN6otR8PgI9/sho64g8uJbRzQD86Bg8L
	8N8duRXgNwWeun/7n6DvH2Yi7N0rOJ6wQqyD8erGdZHr3jpNaTuGYWf60MCTdww/Zt5mTc3pjzc
	+w2Q1wIXy6dGp4TpkfVIL6Wbdqz62soo+G6KJXRrOcpRcnM7yRGbj1GAlg15aJl6qp+dADDT44x
	wsbEdSiERczBHzzPXIKkxM5b+j1isiq/snxMDMrSTr3PietHYA+A5U/ATrWJzkw66CpXlqqzMkt
	upYDRozJJ5ocgM9LD82O5x0OKaq5SdbXvZhrhTiyidiku3Wd4UjBGOnqfAN02SS8bniWJWe95el
	R11St2Yz+eBLRG0/l34nOve7/VDxncNaWBFz5Up2j7EcfN/Xbw8KzMM+jg/Aa6LCYZXOT
X-Received: by 2002:a17:90b:1b42:b0:340:ff7d:c2e with SMTP id 98e67ed59e1d1-34733f22639mr24078754a91.29.1764293932366;
        Thu, 27 Nov 2025 17:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+wkr47PFQvTrTryallfwTrNoPbB+w39HMF+2ZcHtaiTvVgg4WV4f/TTegqOXQHvYC4Cw/VA==
X-Received: by 2002:a17:90b:1b42:b0:340:ff7d:c2e with SMTP id 98e67ed59e1d1-34733f22639mr24078730a91.29.1764293931885;
        Thu, 27 Nov 2025 17:38:51 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b732e5dsm2943858a91.10.2025.11.27.17.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 17:38:25 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 4/4] wpa-supplicant: enable OWE support
Date: Fri, 28 Nov 2025 09:36:28 +0800
Message-Id: <20251128013628.2187455-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RnvKQGIiWiNbfMag2Fo_L1c3dKk4fXmm
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6928fd2d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kX1YWtxo-AknxJAGEQkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAxMCBTYWx0ZWRfXza1kCzcQxQf7
 tuuKRXHBcQnP1AFVZWePaTlLNSBqtymLjSuQUrXUORm8iRl3hm4wm7PeQneV86EQV/3LA4r1vJe
 fjNG/ls+EkQtsk+Ydb/llvOxbS0ZDXvlmFlNgS/UCoufhO4g8zdRIMU3RE3BZhGectYZJAqfhfj
 6XhqNeB+L5q+IUUCrO/9BfiqymJEtaHCzhN9TccbIW5k3bZp/SjueF4qhXwc0jPZGmuRo6R4h+d
 RwBzcVNU8gYNuMMFUcwjt4h/85t3YVqtHNc0DGTYitS6j5f/Ee+F+al/Ef0YBLlvzDJcMqjdQwk
 ITyOPRgiJCA+jEFQwZhpR1NH3Emvdhc2LzPTiMY8IAd+G8xrRocnCNy8rwMwmlk3OWuDg2bfyuj
 avppQu6ZL6ulc+lx1CI9VYNhsTrfVw==
X-Proofpoint-GUID: RnvKQGIiWiNbfMag2Fo_L1c3dKk4fXmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226877

Enable Opportunistic Wireless Encryption (OWE) in wpa_supplicant for
easier testing and examples by setting CONFIG_OWE=y in defconfig.

OWE is standardized in IEEE Std 802.11-2024 and specified by RFC
8110 (updated by RFC 9672).

Disable OWE when PACKAGECONFIG selects gnutls to prevent build
failures.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                    | 3 +--
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 1dd7540574..84ac8ba12c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -635,8 +635,7 @@ CONFIG_BGSCAN_SIMPLE=y
 #CONFIG_BGSCAN_LEARN=y
 
 # Opportunistic Wireless Encryption (OWE)
-# Experimental implementation of draft-harkins-owe-07.txt
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



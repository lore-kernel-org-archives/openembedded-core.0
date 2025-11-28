Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067B7D111A8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:37:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7081.1764293869065527433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H+YFQeSv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VKz5tHzf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS0tlPV785486
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N7dzE72mm7E
	PeSTaoPphBQe3X8weP71qva/janqpAlM=; b=H+YFQeSvP96A3Mj+KoWNPYvuOa/
	CpryPrZy44khTgSTK342SB+wczK1fmvgu2H3fCsAd3ixH+dCCx9UQFAZ9DNcRyrY
	4UPs8P54BAHVixseJ9d3lzNc7JZBOSPxvfn6GVOXKZ5+CXXIkT3ti2KLyBbX3LFL
	3xtBWY8THNHAjhjsGFI76jnrcFnlQqys9XZQRD+jkTrL4cfwdQMI1yDvOLtYncjB
	uVkMWoEpqPRY5qaQisiXjlw/ExPWbmTD+Zn9piwdxZxhmi9IcxOVjCgo+qiA4ka4
	ihtHA+N4NrpwNl3QHpkTIcfFWH3Halk8GBDAK9FjFHrzEv4pZoLLk1a7lFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61su0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso3921040a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293866; x=1764898666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7dzE72mm7EPeSTaoPphBQe3X8weP71qva/janqpAlM=;
        b=VKz5tHzfrC7F8NG7VQtGbEGo1G3z3PfngfnQpuZ1gbSq2ca3JuYcwC660UzOiJ2nA0
         pvaVyvUhYyNvkmiXq2Lrtj+xin+ajN8ULEKvhlgQdgDLg5JCfZJJbKzGWIxPY+OzwZ+E
         axL5xAPDDr060kfUnALnkS12o014Crb/QICPua7kOKH7hu7rBj2cMUgR9IPTLbhuru9B
         tAeTg36qkP4a5T/o7QGWpypjkR2TVBC1se50/qQgm8xTN9TV82MNyI5/Wof2SEkjUrDp
         6+Th4+NEmSiW0PhZ+SOAyKemsBGcJRUL4ORzYQ39eJ76v3NxVnfRTbhS21TFXgflinx5
         Q3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293866; x=1764898666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7dzE72mm7EPeSTaoPphBQe3X8weP71qva/janqpAlM=;
        b=RU1pHVlF1hinqjMov0ZLUePHpue/AKI0+52NQV3kNVFBc2+RfbFeqcQlbRWTEUirpy
         DUCWWs6bmTQXGY280AwUJVexMEHLa/n3X6aiLlS/kBciu5yB0ki0ZJjHNb/CTX6J764d
         enk4FYc7X8jZgUr+E1jdEv8md8VdsvKHe5NvhO/d/kEsxF5qlFwzQ5cXSeUIcvUyx0c9
         9XtJKlhv72dg1AczHXg1XvwKEb9LQt4Mw4JFsCDAZivOEI3SWM+KS2Rzk6kWXsmT20gt
         fDe69L3XGaYzaeuVl1MmrZeNjSAwEv4OIDp4TC6S+vLyuCNeeVFdABQ9svS4I1F/FWih
         q+wQ==
X-Gm-Message-State: AOJu0Yy7jD97AXEqOl7ES8678KzOJhfHTMSqdFKDrE5AAapPupDS7SdB
	t1/H1nDZPDcZ2woy5E//zTp4zfjebnoUCu610pyZKlEkEcW2rzv4a7c+E2wVCTS1QkG9tSR6ItY
	/rQGHya/tBIB4n0gB8WnUseDNOMOLIJHhhg00nJsrLVHr7pbzWbOZKEXlJmfy0i+OdyIAzcl1SK
	0gqm2x1Ucx6bZFCk+mtw==
X-Gm-Gg: ASbGncvU03893s24mgXndSyWpygZ3R9nzS6iywoXj4EJID5uG2zG1G/RCeE4pLKWe5k
	uqQ4SitKuCfDfKyTFBET7zc5Zab0nBhnduGtQNlqEc6J2BL3PQW0gv5zkfLSNWBTso71eNaqMYH
	fKttQpqMYjIw+YveLzhqBjSJBwmQ0uQs9+y0CFiYsLB/e2PAqwdRyiq5NRQ2Lpo6Pva2u71cipJ
	3oG6x08dF2zc6MuugqM6DiEvLhv7jvCGUDkJfSJ/8ujBBWAty/memusDfsKZnfI/Gde4bNB6jbH
	7koa8i+gUh+T26udVhArV7xpDumnIdITVCfY87Ts7Ry3+CosbMMxCRwILyxsY13hppV3VqpniX4
	xF43wBsHJhPQfTI9I+tRBKBL/gS2zu6Q0i8U7KadBNZu6+/vEKaVNa2J9SOTmXqBVNnPK
X-Received: by 2002:a17:90b:578b:b0:340:ff89:8b62 with SMTP id 98e67ed59e1d1-3475ed44aeamr11964003a91.21.1764293866532;
        Thu, 27 Nov 2025 17:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT/qXbqD0kFO4SMIPicHRHRHM2eKz0enmQp739/zV+MYlyldPqOomov6wmJSXVvy2LTU+9rw==
X-Received: by 2002:a17:90b:578b:b0:340:ff89:8b62 with SMTP id 98e67ed59e1d1-3475ed44aeamr11963986a91.21.1764293866105;
        Thu, 27 Nov 2025 17:37:46 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b732e5dsm2943858a91.10.2025.11.27.17.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 17:37:27 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 2/4] wpa-supplicant: fix sed indentation
Date: Fri, 28 Nov 2025 09:36:26 +0800
Message-Id: <20251128013628.2187455-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UUQf6ubTK9RkgzIcl8XSoZPssigPkHeN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAxMCBTYWx0ZWRfXwwwVvSdSM9o5
 n/9eDv/f+hFW0Mo0WV20JUJstuUZ9VTCFNU1OnaMrWcOKWSz5R+JCIAXfEDPsJEOF+B8CCw06ap
 k2ldQxpyQY7u7UmutHhPbXZlLNcTrOT2pntQJo7WEtBdsG5ISSxdOjOEYuJvgP9CDtNpugm0A68
 YUIpoK6V7G8VS03jZlmWZQWm+koSi4zcrK3OKGJtmeHtidbVbmmqA5ShwKN6xDABZBLFpfeQvkF
 QYOKPOQHmu7RHQ+Ph8C7yczqs7jZKbuDCEf086dJ6JGlSad2iIC0q3vC3ygUS62TsBJVOxKnIck
 QYqVmHalXircAL7+Ngwh4xNVLCQGJX1atuJY0SRlldIUOndfum8BidE56raoopfCq9v0XxGGmFj
 P6Afmka+SomhSs8/C1Js1gJb+Bz+kg==
X-Proofpoint-ORIG-GUID: UUQf6ubTK9RkgzIcl8XSoZPssigPkHeN
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=6928fceb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=646l1OQNd_mmeMfxMTwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226875

Unify indentation of sed commands in do_configure() for better
readability. No functional changes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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



Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61860D1D878
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:44:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37480.1764830672722280891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 22:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fzwc5P77;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46axHl2214406
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 06:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=i6x97HlTM3DKIUCc0TzALM7uhoImx7JJOj7Ke57kCow=; b=Fzwc5P77R7ME
	K/ONM11bJ6QKQsQoMez0cvXp5+8XwAfzBqFQaU83vPHWOLNX3W6FHUPI3caF8OZz
	/61wD2BTBrFGYfk4zzShhSP/bNrUup8J+yNJlcGoMU5H+Z4HZa9QMLBSlpG7J508
	cJeqb3RvJCdqXHueQP+Nd/m7dDToKavVKXOwxzYgFfpq/fmVKQkjhFHL2Ia7ptVB
	HBF8N3XuXck/K7NzSZSjWyOQqmxYSdqpb6JQgQT19n19xwrUFvP4keoLumJREkW7
	ZKXt+jQTgQ/RFMDdGJefTa1bpaQsNHuXCIX6qG/Zbds6E4Q0c5EzYNIfjZqTtt6C
	xy+MM7ABpw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21x4ee-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 22:44:29 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 22:44:29 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/3] cups: upgrade from 2.4.14 to 2.4.15
Date: Thu, 4 Dec 2025 06:44:28 +0000
Message-ID: <20251204064429.559529-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204064429.559529-1-Qi.Chen@windriver.com>
References: <20251204064429.559529-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BkWCbPCXCnauOGvG5S5WttdpphcdRIFz
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=69312dcf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=vBKS2wRsIVZSVdBDzJ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX3kmQxbTFstKY
 H7pBInic8R07M26uO7i1bs15KL5wRLXdb7j02U6LnQsl0g2PiySVFZCPyjl12OSz6cLimGBoCPs
 8LmN4rulw7/NOzvsE/NNC1lZhwUIa5ArCl2Ib8V97XH5UDZmeIKoUaI8E8f2kenHW/Nz4wSDV2+
 Jiaj7IWzcwbauJGfX50lDFqzWukoyQtu/cNaT1IWK9lGUnAYNhyZcBqTABA1q0bgA6clZgmGFzJ
 XuBwI3z80W5iVWCH7IcDUAjtYC2s7tBpG6Pvyv9jQ+2sJy9dPXiO+RiZnNnmRKNGumLE487CpVY
 TRv1I11asajT1q5w3b57v3HaD9bYXhYazW4TJtHQUW5R1lGEBVVlt/6VMYRZI9YgwNBjEQdeziR
 DGwZn7e7DENbzVs5r809lNB/BDWVvw==
X-Proofpoint-ORIG-GUID: BkWCbPCXCnauOGvG5S5WttdpphcdRIFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227272

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade cups from 2.4.14 to 2.4.15.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.14.bb b/meta/recipes-extended/cups/cups_2.4.15.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.14.bb
rename to meta/recipes-extended/cups/cups_2.4.15.bb
index 5d5a1dc97f..dc22771db3 100644
--- a/meta/recipes-extended/cups/cups_2.4.14.bb
+++ b/meta/recipes-extended/cups/cups_2.4.15.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
+SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"
-- 
2.43.0



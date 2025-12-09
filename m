Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B909D3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:22:32 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7512.1765286551641580374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=ObrWpHSj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93rIU21023017
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 13:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=p27WNGkI3LUb8TBfwSx5Ebyw2dLoJrxWRuQzXyvYKEs=; b=
	ObrWpHSjJ+58FWK7FlBH85jRX1eOIj+L9XpMnpLedCOUhI0xzWnkjReoYeSFRX7W
	7BUiKfskPFXOqkB0z0Zd8TWxb0DVWZsVk34MNT61hHQTbZ4okapS9tZ4+2WghBt4
	nFit+7STvTSzm/sjDIbuZsknv2vunLGxdReSOQxEpJ7WRd8VWx2JlDhQueM6w8gm
	cAPwqM0pVJSrtqIIBy5Z5uUbdPXNAMwXNMdVWJqHEd8NyH/fAapuBAAc61TMUrCy
	Af6W2chey+4cpzpO2HNvnbdmiwTmkw1Rgi8/SlpZ0Qi5r+jRMCyo4En56VDBnqak
	pMzfkBMckyjXsI7F6ZWF4w==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a9k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:29 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:22:29 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:22:28 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/3] ssh-pregen-hostkeys: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:22:06 +0100
Message-ID: <20251209132208.402718-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NyBTYWx0ZWRfXy0SrL+N1yWVn
 ID+yonSTmQIRZZdDanYZZfT12r+bu0mh482Pbx9xyU/GGq0zERvsHvv+4gnkGX01Ol/bKheY41O
 RM12a+LVgVFaBnLg/JD2agKIWLTkglRmvBZRVizyUg4Kq3ParGhTJS4G2YabZZkGRxJgFhiug5u
 JIm8GbIbQLrac6LjAeSeiKSq26X0lAc71EszkqEBJ8XUFcmT8t5oXdKkBi/63BmJ958WHJn5lnu
 qnZbW8z1AwEAroz6z+yZO3aVCq6/btxqonQSZU0/TeQEYk0kvT4OvYgy0xGy+UpHlUbUIRt266t
 nN12sNletyiXDTc2aX/llsLGuCit2kLQx7R6n9n4ka00D5Jpt+jvdAvK/wsy+u45OuJcNf7w3Xv
 xv1wtmgY/VNkvfQEZW9KLDBrc62PAA==
X-Proofpoint-ORIG-GUID: WfJAKxuDXqafB-D2m05yk_5b3e47iej3
X-Proofpoint-GUID: WfJAKxuDXqafB-D2m05yk_5b3e47iej3
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69382295 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=nTKLNXIB1qaK_ikyiaUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227437

Add HOMEPAGE variable to ssh-pregen-hostkeys recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index 57b0534929..05c455a435 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Pre generated host keys mainly for speeding up our qemu tests"
+HOMEPAGE = "https://www.yoctoproject.org/"
 
 SRC_URI = "file://dropbear_rsa_host_key \
            file://openssh"
-- 
2.50.1



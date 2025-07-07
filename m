Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88EBC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:55:56 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.55420.1751878548359551398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 01:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=SAnZQ4v2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5673ocsc022365
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 08:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=UwXqgeR4OAAalTRlHpapg/jVlV4td6W4elGblhAZH0Y=; b=
	SAnZQ4v2uP/h5tsy9XtMK5ybDOk08HF38yj0PMir4f+0mrduoHJc9cKIePMinf3M
	jjeyh6ll+sJOipXqtEJ6KszZ5eecilneriBJTEsnPFtYcLxd5ru2VMIAKLogPJ6a
	NxtXkf5rOEigttZUz58wuL7TsDsxsA67/qmyXTdRM6IwJj5UB1uRZ90IftOmGnHZ
	4Ds+lNCtdAwiErMwoU3egWk+jIedncBTq+/8XL60xi/F9mdds+SqDM0Rz1MAQ/aa
	W1VgH4X47N0SdP1wdKKR1j8el8Wo1lbcwWPUtK7Y75jmSsOmnTTUypcuaNOGqrQK
	b+WwBr8ao5RfT76UDvzAzw==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47ptygkm72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:55:45 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 7 Jul
 2025 10:55:44 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 7 Jul 2025 10:55:44 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v2 1/1] systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG
Date: Mon, 7 Jul 2025 10:55:30 +0200
Message-ID: <20250707085530.614280-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707085530.614280-1-pascal.weisser.ext@karlstorz.com>
References: <20250707085530.614280-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2wGxJh78p6nq6PuUyDcq68Y9lRRxQYjE
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=686b8b91 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=n9SCklZpAAAA:8 a=PjnejnpYgsQfPOXbsL4A:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MSBTYWx0ZWRfX+r4aV71HMiC1
 901+TDR7Py4ZpjcDglqW0217dRBSBCHNECRmwS8usLrUDdOrTTWAxCBCG2/KUUL+3EcfwAw/zpF
 1DrFwat138X3l7/Hi4stJHUO+7XrIavx0AntlHl76C4URpakUc8Vg4kRIqIk86Twg/faf+pjwp4
 zlJIJWYMEpsTP+V7nuWs1oXh5Hx43Ip5IM2s+lE8XWlv+qVuZIOKoCXVsdsW+yzfhtGeIlZXifw
 FuimaXtmxF6R8PqwDxeIIb9iKiHxPdb6lluHPDVMNR80AnAv1UII8sq87DG0MRWWjB10OMvOo4m
 hzD8eEnMVqejVe1f4zyCI2rLaMkKJ/hYsBOtFROWCSryoGQI/GfciDZvOrpz9Csg4jq+hwP1mhY
 fEdadVzH5rpnAL4laTxAUeMkkKUH2no0DccQsOubIfUWUl4lWapy9jj+QAXWaNI3et/zmnsz
X-Proofpoint-ORIG-GUID: 2wGxJh78p6nq6PuUyDcq68Y9lRRxQYjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219987

Add a runtime dependency on libnss-resolve to nss-resolve PACKAGECONFIG in
systemd recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index 5f7f20c434..9092d02c51 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -189,7 +189,7 @@ PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
 PACKAGECONFIG[no-ntp-fallback] = "-Dntp-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=enabled,-Dnss-mymachines=disabled"
-PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled"
+PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled,,libnss-resolve"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=enabled,-Dp11kit=disabled,p11-kit"
-- 
2.49.0



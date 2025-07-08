Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08A2C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 15:30:44 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.21721.1751988641129288887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=bGyBNUU+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5683cKSS029144
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 15:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=OG0SFmrFknh0SKexVJ0wvx9J5PTqQITQYSICXri1qG0=; b=
	bGyBNUU+ge/4j2+MptISg3sQf/aZcpiPz67dS5BP576VBkPORzUa441PeGpCIaXo
	ne2Ul9WnQI5HL4zZRENf9lTuqB4J+DbFIQVohTjEoAv6QMu4g9GuaoytHSrhjmya
	DxjxfcuAOgHh7joyjiRh0r9omX0Sjyn0grz6N2U4U1YCRAutxhONNMAooXVN4FsU
	vD+Olvi3JZQz4wsXlLWZyKYBFnLbcLZg8AAk38/Q5PaqlN83BAkveqoYFWYfzYJk
	CFcIhST0xarMvT5mpzK9V/OxsyInRWUXb4bq0Xm07hd5yIa7X9sSLcb5SPOmJe1I
	2+VOC2O8xDVFuuh4gVpehg==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47ptygsa81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:30:39 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 8 Jul
 2025 17:30:38 +0200
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 8 Jul
 2025 17:30:38 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Tue, 8 Jul 2025 17:30:38 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v3 1/1] systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG
Date: Tue, 8 Jul 2025 17:30:30 +0200
Message-ID: <20250708153030.3324742-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708153030.3324742-1-pascal.weisser.ext@karlstorz.com>
References: <20250708153030.3324742-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6gmP0HQSiCkJ1HksVkWiYYydOVDnPw_F
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=686d399f cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=GcyzOjIWAAAA:8 a=n9SCklZpAAAA:8 a=adb9N4KarFJGMRSJB1UA:9
 a=iA7kMwzbImwA:10 a=hQL3dl6oAZ8NdCsdz28n:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzMCBTYWx0ZWRfX5qUdwnBS2e0q
 I9yrfMSzL82TWtiU/ETnw/dGcn4YYxk3KhMbEyXkhpi1jb7jRvxhmaSRCcsfe5CyH2Q07vEYK7d
 GTNaWucUKA7xkXK3b17t5t2IeO2kDSrBcGu73oT8z+x7oopQ0eXDehm9kRiVhOvIV06IEBxMkQT
 Gucy/Fjrl/1Ni1qgkISlVTVyN0uuQ3aQFCv10/M7XOEdZyF1yD/yG6omtF9FXwQKrvSrcVgvLu0
 i2ifwLQl3AK8ThhCGeAmu5t3MF4WeQmJwdUgf5VEN9S1VJNVvqSTrGfOPVvVjb4leyr1H3m0x1q
 QfttPknJFQzam9IA2lKa9VhHJAfC/pKmcud0msbIVVKTAhOFJGATnYlgDbvFto3LX4VFxelcOmO
 zKr25Feka6eMpW48OLvQC/S2VDsryYK0OJs4VcdNPK6MSxROIXxz0QAkIwVxziyonW4fc/Rb
X-Proofpoint-ORIG-GUID: 6gmP0HQSiCkJ1HksVkWiYYydOVDnPw_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220049

Add a runtime dependency on libnss-resolve to nss-resolve PACKAGECONFIG in
systemd recipe. libnss-resolve provides nss-resolve which is a plug-in
module for the GNU Name Service Switch (NSS) functionality of the GNU C
Library (glibc) enabling it to resolve hostnames via the systemd-resolved
local network name resolution service.

See https://man7.org/linux/man-pages/man8/nss-resolve.8.html.

Runtime dependencies on other NSS plug-in modules are provided via other
PACKAGECONFIG entries in a similar way (myhostname - libnss-myhostname,
nss - libnss-resolve).

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



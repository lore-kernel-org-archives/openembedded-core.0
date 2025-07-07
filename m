Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D687CC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:29:16 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.55083.1751876951158449992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 01:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=fQueMdR0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5677ZhUQ014334
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 08:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=9/YmS
	W7vInFGgVGAfSZTGBB93UTrA+J8Sv1BhVt+YZ8=; b=fQueMdR0Z+FvE3Oi6xsST
	p5U6ba/4DGAgdPKqa3JbcIggAmw/IK47ZZJr4u9f1ajyTFZlEyQtwXoF9dAYmSOq
	dP3Dv1PGn2j9mlMbcThXZqZSTxo5A/M2q+6eTXMzaFkWYiOKJzHNybj9QFkQOo5w
	lwIJusD9Rv6L8YdEp5hBLDnfHAuCqpc1Ph62ucEl+soRK29wm3kgH8/sZVSkQG6w
	+Zln/cm1N2r3DM64ZPq51K7xvTTsLiQicgo4kHKDY7zcvM9IaacUR9f9MtmTO90+
	fRzdgYX6bXOpPiVeDcGnHZxs7qpyZ/ilpz0m1ODxE6Fn5F8ywp/10z1oCFRpj9iW
	Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47r9ynr4vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:29:08 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 7 Jul
 2025 10:29:08 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 7 Jul 2025 10:29:07 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/1] systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG
Date: Mon, 7 Jul 2025 10:28:49 +0200
Message-ID: <20250707082850.600964-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PZT/hjhd c=1 sm=1 tr=0 ts=686b8554 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=5shIuoPJFnzS0fhVv8wA:9
X-Proofpoint-GUID: sZ9qTGSnRwGU6pL06b3EM2PJPv7wGU8M
X-Proofpoint-ORIG-GUID: sZ9qTGSnRwGU6pL06b3EM2PJPv7wGU8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0OCBTYWx0ZWRfX1PeE9xXka6vl
 pbnc+X5bolDT5enVBw5l9oEnfh+wESgyUrxyLCSrYfoy5ReYfsLnNdJUH/A3HyseMhzJpJXecEn
 u0l6WX5vTFKmm/tTmUTUZ1shLnQ0eONJNJTULZw152KRWM4XrqbTWJ/i8W9vKQDgv0fYZyhg8iq
 tRhcQbeTbXXedChZ87YFyy6dJNoxNnaMdgjzxHbxbAq6OPeEZZLW7CqmP3W6NToJG5ZlGg+ltC5
 p7nxSkbUCzYRr/4vCK67CSLzDwz02znqdz5nlVygciNZn3b6Qq4qk+mNWqfPgf6ETQdz64xJi6/
 kEOWR54N8+QMEdkOAG/OKpC3iaf5dc0IDmwKn6VlVonUX4uWakeNVjGfOtOFt0S3I/SNbp/+IeN
 KLafPfPs9BkLxd6xYB/268LByS/faTA7YfX7jZhhM0ak0iC3sWcmlbJIov/pTvdYC1iFCtI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 08:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219981


Weisser, Pascal (1):
  systemd: add rdepends on libnss-resolve to nss-resolve PACKAGECONFIG

 meta/recipes-core/systemd/systemd_257.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0



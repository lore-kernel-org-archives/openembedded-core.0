Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B757FCD0A6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 10:10:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10744.1773828632231500139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sgXaN7vV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7537156b97=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7l9mK3982637;
	Wed, 18 Mar 2026 03:10:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MVs/ddoAQ
	1sCyA932f0w3xIhmXbnEMX6R25jcRtcJjM=; b=sgXaN7vV+TYqYcVQ1cVHMNgju
	I/nsey+5J1HHsBmg5QPk50v8DoEk/T1CPvUA5Qolue6LEHDKvLl2AGtmR5mRcxBN
	njWIVUn9JfQKIiixZdStOE50L7+QkClOqswu8FNqt6vZJEt+BgusqXhNBMh5NKvw
	+RDSM3jSSVNxWh0l8Avsz7TY7bsELwEZyoYQyRhAgsGC+OQzIJTr+6SUqcsHDTUN
	IwErx1ptg2n2SwzzH2MHLlYYarzkx/9KZ09I+aEMDuua0F1wDGs9K5y5ui8OOYz9
	x1lKqhFRi0RveHBBZxumQC59RMLhCjW25DhxlD2uKZYMfNvqqAW8MO81VTqEw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y14h98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Mar 2026 03:10:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Mar 2026 03:10:27 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Mar 2026 03:10:26 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/2] lttng-tools: not rrecommend on lttng-modules
Date: Wed, 18 Mar 2026 18:10:23 +0800
Message-ID: <20260318101025.2718647-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69ba7a14 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=gKF4PNXzlp1Qzw3bzWwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NSBTYWx0ZWRfX8Hj68SSm5ng9
 +R41/MKJtw8khBD5AOC8weJcRGnjAupGHJRjHOEonsTyEOUtXxrLbOrUfOAS6Nhi81nwcRGC4Sn
 leZw0bfM+o6zJ8pS30vElVlviD1DcD8sY9W0WhBpL1ZWkNAeAglwl4/VF9yIW6F9nU9495GfaJA
 khIwlmKI2EevfVPOsBDhdfXT6RK1WIe/08P/vb6D7P2d6+/KvBMMMfh+9/cCsuEyq+EllYu+w7O
 HcvgYppJPSN/OfkQXFm1OCmZ6xsqONy8pSh1qQGc77FkGywB0AqKo0FfAC49+Ca1mF5/dBt2xi8
 QUO79ta2sTx7MXfHNWV0dMD4Oq2TYQ8mO8MZbdFZEmz2DyFe4N7EoHG23E98blsp5sr80CDDWYq
 9EAjf/ehmNRIUj0+iwJggi5lKhfAZP5hiHxImIDXc888TAVDydlnUDwsWwEqzEpb9xwUl6RxJKy
 ZfTYnwFEAiSgj+HomFA==
X-Proofpoint-GUID: r6qBawE-2JoiJmZYNsTrbd8GMaLCoTol
X-Proofpoint-ORIG-GUID: r6qBawE-2JoiJmZYNsTrbd8GMaLCoTol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233374

From: Kai Kang <kai.kang@windriver.com>

v2:
* udpate packagegroup-core-tools-profile.bb accordingly

Test without DISTRO_FEATURE 'ptest',

$ bitbake -g packagegroup-core-tools-profile

Files pn-buildlist does not change with these 2 patches.


Kai Kang (2):
  lttng-tools: not rrecommend on lttng-modules
  packagegroup-core-tools-profile: add lttng-modules to LTTNGTOOLS

 .../packagegroups/packagegroup-core-tools-profile.bb            | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb                 | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.34.1



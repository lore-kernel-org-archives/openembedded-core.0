Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F4C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23264.1786337588514560190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nv0HLGgn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4MfDJ755820
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	nv0HLGgnP+17H+w5OwMR6LMiP6/2l9TTSAVP4OZQKCpJkRbINRkZjzdRpB8gOLLj
	9Wjvsj47RPfCZwc8WsZe8xIo+eqFMSkjoQy5UJ/vPi+d+ljA7Vr6wtNAb11zELiV
	pJI2rRiuqUaOOL8Us++RBPIJJ2q7+ASDC5OATod0I1Knfd88hluDr+o3B5+9rkNN
	EMIbz/bjTCKzs3zs/XJvBdtiaT+bH29pIPw548XLe6xnpqao/177QFwYGXtTnDxX
	raj4mf1IcVPP2LZS3++h1qN7vDs2hiENawas36v8CvSMwHt1WvX7QcA+hH74ZIi7
	Lbyyt2OrGSnpIbccUpQGEw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue81s4j-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 04:53:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhw6g7aZ8dHhHb/MBqCU4wXM15g2SiYxIRraZiSU4aDsez19iS0pWG3nyma7c8l60l7wuRDGcDZ+SUq4yrDtbtJAtMjnFNL9t4l0yVx/fcCys5UH3D/nYd2a+OXXa2QUvJ0j3+ofhbEx3NsO/eSN/+f1i5TjwGmgcmVdCM6R5ySvXW8Cf0ZKfrTgwLywH4Krw+Qsb2YK+nqwYz7EHYcK8/5rcdTrKDWFDn79Un32Bu5+i8vgW6QnhnmLy7wHNiZ73Hiu+yK3Dj6DPNj5gZaf7wvc0MAUid5RuvZVcaOLmpqJxaot9ovr3R6ixCGzPnfs0lfjTCNR08NNXsXYEvNcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=K+ZCGU1t2o9ZqWJRrIo26lnGq94KA2a7r/KlUEzpOa13mfCcE/aai8l+SMiVxyn5ifQkNIGYU+gznaKzcsK2VVIELf70uCSDPtiPsjcnIeKQFqp/DjiYO7k16cAo7ML/xaZeePcbiSonyev8m6xrRSuXnuTUzt+wL/lMhDsRw/xtKPwWER4xD9gqkXxo1/oW+uTMp4VY1yutIDzP0zO7QT+kkVuMg+Jes3C8a28kth4ZXN6NkLhHiPokm85ueQKZp6nz/t+rWZ8ol8+X8PS9MbW5wz/qh8RjIi07uXm9zkFGfT0bRWljSLCai+OkhdrA6/UdAuMNsGW4aIOZ+2owKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:03 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:03 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 01/10] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Sun,  9 Aug 2026 21:52:41 -0700
Message-ID: <20260810045250.3903576-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b866a0-ccb4-419d-8b7b-08def69b42ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Tb0ilu4J+rKtJGD7jGh8QyHkvSD/STJuuZtEra/gsntBcBLiaNP2bIP0zB88ur0bZeREyoQQRPh8plN2+/5e+jxAu4DFWUc7BcZ2e+hZodZ76eDB+OZzyW9oSMkoUDK0BqeilbAzxZAXbyTI+cFLtK65ODbVW2DYaK74BgaiLYeGRiX5xPMcr/s/Ba79foSlwlX+hUMuYzOzxEc5eLw8XCimtyApZ0RaEBVwHLxno18abZfdk3WkZlhlZ+n2nGD66SuJOdmUs+nYHlk6SdR70GTQbMmNeM/qlE8fKsLNHIvUiisQMG3skW/yzgF+sphrpYLCVdXRzMet/syYSJbCDZ1ta9UWeOzzJEJFgIHjTJI3WLSjPYZ1BHdzBWN3WjpMKJ0bnAWrCQEZCVlDtQJr4oS4bBtlacKE7ZNIf/4mreW8YgwXB2GQvDIebKYeogdTWNSGWdBTOxmt3LqnA49ICk/vyzZWIj9QxIKTGhdn2AXq8TLwLPWn1+xcDILWTLVF0pnbLTNFRMhdRwRMsZ2vWa5xM4Mlz8Ld0q4sdyUiEJAJMD6QpAFpKj+k6+vQFZpsnPJU8p0SUohqzoM8jxu6oa6G6hFIsMbhNmCH5JfNkVw9Ba8fZSc4LgDFYPxJVcux96cXqvAGxP0w97lqJLlIcOkO+VaBaCrtBbxLS40xFThtlc2f4gcOBYggkx4ZcBmBaG36xiXdL4sx4jApIvJhKDUd16skBWH6OzTcgMkG7/Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6E5Xf3myxuRzjkbw7OOe83Jx1zUsY/NLr6UikSEra6EA4pu14kyWeiUIgB5l?=
 =?us-ascii?Q?7u73L9wWa1piy/FfZPaC3lC/LKyEvUNO0LFBPv4XxS6F83uwITRlHutQPgl0?=
 =?us-ascii?Q?sQxgpCKc6xgr5hrmyDEulU9OyHS367Tt0ycD+OtGeS+Rgclhe17Lavphr+dR?=
 =?us-ascii?Q?u4+HE6MMQ6TVTDHqGSA5IoO0+ti4Lf/kyt/RGCHqy8zUzP+OCnC/HuQ9zYz6?=
 =?us-ascii?Q?f8kybudwZvY0yNAmnzSJtZnVz5YDCpqJlEAcTyhvDuqKoKAEeNladm+7Bno1?=
 =?us-ascii?Q?AknCT3xXoAiDPoRxzzt8IgNi3uzIv+XdbHH8MeL1Qk50Mgv+IwOS+V2nHx+d?=
 =?us-ascii?Q?kTe72q8gSQ+RhXvlu6UhgyHIEShzVJIIEK0WeA4mfeA6lhrpJEdZTQPGnmPC?=
 =?us-ascii?Q?35eHrjD9HSlEpX/vvXKNfyFTsenu6PRocMsjq+x4kLji8vNPZ0nwNCppPI1K?=
 =?us-ascii?Q?lQJ7q1898yefVNyuGhrfTZuWnP6Ny0P1x75FouHkEgbozmBnGJ4av0b0luX3?=
 =?us-ascii?Q?i4pjkMRbMoJtHzmaZY3rfDL1HLwlLkVmm9eTAKf+K4ZOWadOTaNEOFQulikz?=
 =?us-ascii?Q?oweGBZmFZojUgHmWO+cyITXjsTcC4KvvFzv14awyBZbVlTs/ncZ6J4kn0OZ7?=
 =?us-ascii?Q?A2bdPanL54VPWbDIFjkUYloVSuK1xfJdeFG+rIlhPNaHbBByE2k9q2Jae5jn?=
 =?us-ascii?Q?jNUm60sKSkCpGJpiIUT5COSzFTXt9KHZVzyhxCIn+TOHJaorVEPw2ffkHC1i?=
 =?us-ascii?Q?PFP4qmZmhtf1S4NbwckTKTUljZItpzIxlP9tL/EiuENNXb3LNouxRm5a/+JV?=
 =?us-ascii?Q?fk3HMRBfBkj1BDN5QtGj5p23S6pj906xHclhO0pNjFgExWZDMVbWQdAXvmOC?=
 =?us-ascii?Q?lLFKVj5ocKQuOsPvBqlNiKZqaziLzffo6Nmf+rC1lAY/PtaTYYrh6WRIciPp?=
 =?us-ascii?Q?un0KkVqvxZRqqx6Gqq5jRh71tkQihFK4BNIKydTkt9aaMb+YvJrjRINac3vL?=
 =?us-ascii?Q?adKBk7fGnpKkDeBI3zQONTOAfPpZrn+Xvk0UMiXsOc4s0UwLhzaX0sVHSIw/?=
 =?us-ascii?Q?TFxEiu6pxwi54qdG8FJSvpPfGmII1I4M73Y8YCOfwqB+qPztYA0Z1oRE+pUp?=
 =?us-ascii?Q?zC5kZ3Rj8LaiHvT6SgdlfuImJ8k3QT1HTXeurSQ74owPp7uSrwJwE+AZO6Jp?=
 =?us-ascii?Q?CFNigskaFmDNP5iPVg0574aDdGUgkTk9FX92MTYXxn8FcumaFtaxjKQGRo3e?=
 =?us-ascii?Q?e8eDbacQXA9+oBOWiDBuSfFrfYFc7oG1ZSnwT/FhOvWJrlgj3TBOAGWSZYsw?=
 =?us-ascii?Q?HKbL8x6OL5rLTCLor6eEyclcbjl+bKG3SOx0YA1EVLJKo9iMY5NCj5RLA0LH?=
 =?us-ascii?Q?lxWVIbqZ5WWoJbNWkIk6DVMOVnhU2y+shhd+Vab34z9S1nXOt+T4ypFHt1g6?=
 =?us-ascii?Q?J803mpk5/bl1YhquXBDFIDU2HtROo7dGqjdkqj7XFN/hCKzybps/CT5NtNVr?=
 =?us-ascii?Q?BBT96qpn6H/JjVdXJFjH9iQULz/fRO7vV34XHgPZRBkGw7TdNx29Oir63jao?=
 =?us-ascii?Q?/s4fgmcJn9aoQZGGqJ18vggk/VJUOAcCALWLkHqXehJCF+OGv3nHrT0N/lWR?=
 =?us-ascii?Q?253Riig81wb4sVVfkRvkeg/ZJ8v0v9QSuQAI65rz5DgOvWGaMozGdVVvkcuo?=
 =?us-ascii?Q?Rv+RfuLDNeCPHIsL5KqfHgSOsNsGG1Kd2a0wdQAsCnWz7L5HbUhPYuH7Px6K?=
 =?us-ascii?Q?JrCCuGXJRBjga9+Y3dtlfdFshEBxqqc=3D?=
X-Exchange-RoutingPolicyChecked: 
	FF6Dt9+2kVhc8I8XK+nNABgnCc5Wa1RuCtvCA9tc+0Gr9vZJSJQwdcvQCWfZhl4d5mV3qPLt7uhpdw2WWeqSLNpGnBvU0/uTTlRNhLmIuOXGIBDYwqNI+zZyt+RTOfC6cWXu8nOCDEb0pxGTDgdam4aQlH6snkJLcfXOfMx5BSxDKqZD5bAII/YJb14/8LpSx8o7hRA8Sjdz1jlSgTcKU+FGkx6AkU5MJyGmF6Ag/Tz9/jzfT8/F7vUIWbCJMU702MWyUNkt4CPn9PDRdMw/o73lPV6dmxtrvY/qFEIt3G3YgWSX2792+91qee7fzqDyCNu6zglR67ukKkxqsPjonQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b866a0-ccb4-419d-8b7b-08def69b42ca
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:03.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2MxW0M0N3hc0aGLoRUgzhBqK1/1/QGg3WOrXwx7ycKO9gy7ydtgZYmXZuChc8AS2+w3QJvFaxL74Ox0wcGpRuoelHG7ZREr0bRApZG1K9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a795932 cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX4daw7IF5CU1b
 /ud/ol50u0wh5Zp0fMls0NA+334l1rgtQmUOLzAkRGSkmtOHyDPLeP/7xLFU3pBIWokESIntV8Y
 3U0imfB+PcqVOoEXH+bMbvfPKBfKhMsayx214KCOhM2PXKfDqCr0
X-Proofpoint-GUID: tMxTjY2Y15DNjQaMpBA6BxXee9DyuwnH
X-Proofpoint-ORIG-GUID: FYPRv6u_ozfTy9FiURih-EllKe4RYHZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfXx2uSJcee8RB8
 sbHBUfAGnDXDUaOWW/dYfiQz1NNHPsXKKiHuKcMkMfDY0TpWaPSQiWP3Z5Rwww6BC9LydETFKtN
 Bw4La2Ts6y7CXl66SxoHm42GNNATkoSwDUDjo7JcGQ2ebnJ+K8ck02fjjdrDVq/32aPgNNVJfd2
 8gBpjGtDgetmM/IPqa1DOhlygFgriT3WtvqZ2jhxf/RLnYpo8sJhuOEV2918EtQhLbc8zii3ZId
 vcxw56/oMYyWHnRV3vBvTWmEcJ15ad/ZQgMFPDuHwmGwxlMBU4uuz6xfeqg4nUdY0uXQeMZLjrp
 NjV5DJDMU7Yc9wM39btitDnpg0rV7s7M2fKm0hfS4vWvBrCMeK10bRJ1sAiZ91VPLMMNLFPO8i0
 McJR/7fwnmqsOrLfh0GIlFN8fzeZO+1kmKtd2uxPYZourogaMzSbm9R2E+RdktWlW4tb8SUAxm3
 nTvQYLkALeNy2+x90IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243093

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"


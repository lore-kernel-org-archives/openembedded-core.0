Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8033CFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7613.1777454965922440572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hka9iMBx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=957907c96c=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5lZ2R3646770
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=O3BMv/7Jx
	kljbqY/f8qfyKyb09m4aqmGnAz5La/dwi0=; b=hka9iMBx1ikqZdsjz1UIOnDf3
	75NIREANb+8DB0yyqU+fdUCwz2VGJ/S+2AtMsgDIK35lGCV3EDOt6rzSy43CABN+
	8ecXKKcal6ZFbbT+DFNAnLhuo5KZW6bu74iuTiYXxgeSuXZkGPJJZOlZLMKhf8qV
	wYk2Hg/cCbv+KfbYNSQLF1nRwc4d0Ugglg50UymQGR9B8Z699RzFPh+FjCynNyAl
	xL9yWDTpuNFTKgVp9mEg4OPGildzwLHs+VMTTcmi23p7INhhLmqCnKQSAn+V1XOq
	dpSwpszlXfZiwSQqam5Whgl/K4ZR3SukvgS+m6fptS8wOR55/AHfVTx2V4UfQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju0csan-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 09:29:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7s/UvQK/DOZzEq5nWhWqW/YeWEiKu2GI76oBFC3G9XySviOdok52ZiK8Xseo4VTLk5GZ0TuS/67AKBCw0XNixeG4+Nvml29Sw/cvnbuAJlzCUM+ulLLSJFhnitfcrLRgUtiYPirHZrOKkWVBchjLIzN+FZteBLvVaftvDhxjDZQZmAgwH9t4Iv9zmBTyToC3Y9Fj4uDmPbEP6iU3KY/SqTz2Pu2b4ND/VLMR1dLsEHu6e6yC8y3LcydBBsjEFX88mbSa5Jp7PnZiOybWAKWfYtu/cQ/zSTnnB28HVEk0SGZK+4ODCzWcwmlGH2ClMgvPCySG5zEoy23aKhy1dRikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3BMv/7JxkljbqY/f8qfyKyb09m4aqmGnAz5La/dwi0=;
 b=Ib6CHd3LqdBt87riTv5Cg5flaoAoS0JOv5p9Dc1l7D4rnpxHPd++9l20Ok2xlH23XqP8H5NgVai+IkzBTqVvVQWem2//4bdJEUsQUwETtN/SrYztq1O0PAT1LFAD6hs5x8/CkVZyFKp/w4A/h3DkMQUZ/5nH2XoQ9wLy4T3xUw72J+jaQUA93E+xC1/2/+GUNdpRUSPjMvRJbANfWy/B9mN+JR5IjBtF1w5c5AcwY+FSsP9WSWrJ4GAS5m+N2h+s4E6wBaCfjweUe2lCCE2zliS+mjhxXFotY9LdtZl2pnHcjqf/2Q2OOpgMxP/qeMtXFMogWWde7BP0Aaz0i5GX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Wed, 29 Apr
 2026 09:29:20 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 09:29:19 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, saul.wold@windriver.com, hongxu.jia@windriver.com,
        Qi.Chen@windriver.com, Randy.MacLeod@windriver.com,
        Maganuru.Jayasurya@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v5 0/2] eSDK installation fix for SPDX 3.0
Date: Wed, 29 Apr 2026 02:28:58 -0700
Message-ID: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc5ce9a-2d09-4a4a-a4f2-08dea5d1ca5d
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	S34EmoqVN5Fd4VfkfMivGO+UgOCyqxp48pyRkpY2WBT6chTqIwHllDvzhjAZwn5kf1aEApnHVdBYHghZc5/Kh7QFEOkcuBSCHRdQ+C979IQwbYN9PlC43JTiXANYViyFJ4jYHxa/4na9yCg/1p++ZvBxeZZGP5vMQ1ddSqZGYCWNscjRYa3E9uDwZHs4QyY8ESw0+vIlVM7KwdXju5CtuzWkiMwppdqnKN+FGGw9To43iM6ar8G2C/0cUuDirdIM0XNQ5L+ztZwvE5rTJdnKZ66Aisc3McF/CuGPhVZkqdHxuJFAgeGKU/9tbQao4bYnsKy/S6AjiyovL4p1QUqCnZFn2hiUig3FxbOlRLD1wl1KX64AXc//XUkbsCqtGEFadwgNlyVJW8y5NxPaDxNS1tX+ghCltPRNi7Gf4jyfHQ63TgU/VK53vWVXkeqnB3HIsmxYMFmNiqiiDfAtYN/xnwkn/eLk+nFFpi8Na89Thc4CQeZ2jLoJx0IK0djve/JA/5rWxwL31UIlDlk/spBSt4T0ayIEil7jjt3QT3kgo1AG6cGlDHeTMv5EAIO7si/pyNXHA0rayDJOQQ/6/Q37eK8VV6A5y3gdzU37KBqfNrQM7ZIsOmOb80r/w/fBa4Xxo3f8t9DvuIeIPlsoT5xKfMGH0BRbGymvkK1znaabbCOqFOsyuim71xBGKqM1Qvl7efbOVc/v9H+8rUlVdI31BV5G3XW5fPvXwoSlY5n183jxXVB3tC3YdlUHRyRvCdjKwAsHjmP9cEpViE5Xohls+7oX3QSGpDXf8x7Y+593r6Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5l6oKdmgjd5NdAxSIKrhzkefC0UMl85TJB7r3Yi8JXDQ5hd399otDq205F+v?=
 =?us-ascii?Q?7ztggrDoqUL33p1liNbc+g4o4jvofsCrqrszDIZufcKxXgRqUNMd/YMM8cBx?=
 =?us-ascii?Q?WH7TTJ95ja30YyuCVvhxxJtkgVTerB4c0KsKOEkq6mEh8fQsF4i4T673rbR6?=
 =?us-ascii?Q?4K93nhDBTeKlfyXGYa3U+lwlrun43qaKVO8aNT81/TKKUzC+qldMS+pytHhu?=
 =?us-ascii?Q?Tf9prZgmCwWB5tbbe7XsmAnrKnS93mOKBlmFP37bPfGO2blZpy9a0TXO44Qj?=
 =?us-ascii?Q?yVScgP+4yjL9DJXDMLR3U3POfEcalKiz8A5vJ7sqs9qK5zT5pEPm1X9nu1oS?=
 =?us-ascii?Q?Xv1xZku2bU2AJJ2fHsMEbhcArjZfmos91zqzsmMCkiQI7nfvza/TNzP5e5M3?=
 =?us-ascii?Q?NeJ/K+7uachQLTwGYiy0VM4HksrBei4MXN5TPOvZZtsl9yLORK58Uu/azjux?=
 =?us-ascii?Q?gdTTdgLP+J+0w+ah7dYwL5Tn6LZEOEAkJtcxw5XsKPPD+UWCo4MjPU1l9sD/?=
 =?us-ascii?Q?TZBbyKpGcpKEay27xH1kfIzF6OA/8L4yHBSbaTGSTs51C7peEmCHXhLhJjHO?=
 =?us-ascii?Q?5KwOC/zz/NQAvI1mWfYRn9/Sfbgv7bGmG4oX8RTUCiJS4ietUo6IlbWdeese?=
 =?us-ascii?Q?RZUoW1C4BDs6LcNWAE1/PCX3WyvoSQz+iYiUrORFoatfj93Ahx1X1c29WRDU?=
 =?us-ascii?Q?NU+AF5vpSkKBilW1zCQmop3nzcwXE+P69HUrLK5Z2VxCU1Ccq5v8IrCrzx53?=
 =?us-ascii?Q?J2MgUTWft5iF6N+h8HQ9z3tqYMEY7daxgqImbncZ+pqTa1Bj7NGieWeBwvq7?=
 =?us-ascii?Q?rZ8fQtvT1jARJUESQumRp2Gui04UkuXEV/tvRwcjMmr40RKKukAcCxUEJBSw?=
 =?us-ascii?Q?7LqPKWa7qAdLmagobCkczSkzLLPlvX1hXineJNrt853Yqh+1NBaKdujp8OzS?=
 =?us-ascii?Q?v1lC+xqwG787CYxiGV6G9LcPhPavTfkAYStMI1bWzo+xOj6yHmwjg/SoytV3?=
 =?us-ascii?Q?BVp9pSRIlYV/NzErGa1y1pCeZe0ggVTI+T5MC8fZEs784Gifz+GsQzOMwqyT?=
 =?us-ascii?Q?+yACmkkoIrnJRnX6eeIZGc8l68Q4ZuGS8BRVtsCPIdG0IvJma0Bv438XqBMi?=
 =?us-ascii?Q?TQ9ULTgyhgo+yox4Wts1Ww8hMIo2u3hT7F0FAzcjyrPjocgS9Q0uaiqg9Gui?=
 =?us-ascii?Q?j0H0KO1/w6H7XP924mHGL/pH6NZoo6JbeZW3KLJyxWfLCxGcNpy0uq6N9323?=
 =?us-ascii?Q?CNuEm2YM1/fGslx8TBqozH2iQGrwu8f7r+g6KPbI0CEq0mqwSys+y0sdB5lI?=
 =?us-ascii?Q?pxvmI1lADv+14kP8AenCYNTdq+BOBPYfLsUkWhI1gX+t337zUufyRyOBogLm?=
 =?us-ascii?Q?L8rah3GQHEzv+Vailh816n9sQyeNIoi8JuCAc3oVcfvVqpmqLLiHzyqpgC4H?=
 =?us-ascii?Q?iiQJaSxgbQ9LZ0EDDQPHUTsxEl7LKOop2BWdHPelIs8OfCzWt9iJ3i0g/TsQ?=
 =?us-ascii?Q?HCpeuhQbPrBzkGX4Msg+Hah3EC0VIwhib9w/OxHdIx6u+YwjxUPAZ7ML6S5s?=
 =?us-ascii?Q?CaKrYX3rdC054pMh9LahZm+GRgD5SVA6GZoq2k66tdtOAPrBUB5xm5cq1DgO?=
 =?us-ascii?Q?lTqP0mCCltD4GxHTd8sHp6aOJ68Pt/ZjSyZZVoicXYgrxK9alECjmSqCW0UT?=
 =?us-ascii?Q?72l6PFXxoRBmoG7TYm8IQwe2kVyCkyfWu2wq77Qsz/jl2Wfm0u9VEio5B1N6?=
 =?us-ascii?Q?71Mzkr7Q3pyv4zC+jCg2IX1nwr1nU+k=3D?=
X-Exchange-RoutingPolicyChecked: 
	jPpo4b0e9aWcJfljHEnsn9jBNWekJAXwwWAhz5tEW+HsdWzM4r3OVY10jRLNTr/nx76rLh82i4PfMH6C/AkQFB+kSryjQV8HGeGwNCZP1lI1HzRtnvLm5HghL1SwFGmqlT78wfbSBf4Hq6sTRVVGZU1SUjmyAApMD5k0W7WAg2IcoOWZpSTA4lVh6tHwKC9rS3Y4C5+YL8suQn5xtCHdtR6A4ybBuYMEI4kaYqIi1ssJq+9TdYYnGlJBQ+orpFQSnevcNexYfkG0FTEScRNhrC7vLjIja7bD1YGqxjaQMfbARXGEyisRVt9KC/dmXRN+tGWYYKNFgeW1sdmUCEwizg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc5ce9a-2d09-4a4a-a4f2-08dea5d1ca5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:19.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKOt5Twn+bUGQAT5DSs8qlJU6QkpagslrTFRvEeuEE5BWJWzzTVeWoffRjWsbC/sil22AuQaFXre9wXqp3cgmW0fYyg+lzR8NhTIBid9LY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69f1cf74 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=oBelrDsAZAV4_zrlAYQA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DHRQyoHzFvgzTgCqReSCu9i9TuWtd0xB
X-Proofpoint-ORIG-GUID: CbqX2vxLRooRHjvxYTkowlK6qn5mC1ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NCBTYWx0ZWRfX58t7zkuQ+8gW
 STv8bXFpLg+KMKJyC5jyvRNCRsdQQmtwHWmT22VMQ6LWoyMgcylJWj5SAzfKq6QrLkroac8TZwB
 JavsfrjWYolJaTLQKZi60CEINg4WobEk8nn7/udfHSoJEFzGTTZEz557Th35rhPI0VrcLsaxDY9
 D+iP4LJjcKkKwdMTJ3Xoee52uffxqH3TiKOn4nYBW1D1p2oh2kEC8c//VQJ4em2W2uHkHkSNrPB
 Fzz6kXAgDymwAGbS+/oIAObOlwf+YunutA0Ihol8hH+IcPcNWB254SkmZLrTJZU27iz4zGauzFZ
 kPbM7sJ0TDz8Bbg/QvGUvsBSR5HyLmoJUo0Wd/lw7zT6TVAcdzZEGWb1a0Ltz92dd1VN++YfaG2
 dNjNNC878i0kBdJ9Ot41gAI86nIrzBQP/mIuNzurspDtyahxS2jceW4JWkKIgxLJAxUU2ACczrE
 R5CYpgdMbJEA1A3cV1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236092

From: Sunil Dora <sunilkumar.dora@windriver.com>

Reposting Jayasurya's v4 series, rebased on current master.
The bug is still reproducible on clean master.

History:
  v1 (Oct 10): single patch in populate_sdk_ext.bbclass
  v2 (Oct 29): moved addtask to create-spdx-sdk-3.0.bbclass per Joshua's
               review feedback
  v3 (Nov 5):  moved addtask to create-spdx-image-3.0.bbclass per Joshua's
               feedback to avoid addtask in multiple locations
  v4 (Dec 15): split into two patches and addressed shortlog length
               warning per Randy's review
  v5:          rebased on current master.

Jayasurya Maganuru (2):
  create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK
    installation
  populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked
    sigs

 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass      | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.49.0



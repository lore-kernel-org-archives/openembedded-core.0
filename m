Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836BDC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4.1715962489636763524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=586761ae34=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HBxMuC026661
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:14:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4ehrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:14:48 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44HGCCmp015505
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:14:48 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4ehrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 16:14:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCC00jD3P5Ji4aQPwwcvqQJQLC0rz8dhz5CM//RMxca0C8aQiajinCSakrVbFuDUYSjXav8ex8hvrT+wHEyFNipr3Vs6g1NU83KzfKHPApZgRI3p9WtQECq+MSuV2cBuV3VFfEMGcg21nPIrVN+F1SIBZsIE3dKvOygILVhQ+SVcx6XtFGXf32/iBihpCmccpY66D0pUiChbRKv+wYFfw5GN+ac7e0ByVswSvJin+V4wIcH+wNCyLZhsd8kvdjnL55PJiwjzMch2cIUqoyXrEzphDcIBHJK3vASz6ry2+a3c7FRVJ+7iBnT90sP4zoWuoqNb/95yhRVAjy7hLPPDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0cBqH4ZuWXzx52cl7R7TeLKbFf0m9GdZx8wmVej7oY=;
 b=anEXXgTOHyDuRsHHfJY9I9Cp44NB5b82T2JRd/urLfhukQpucasDgf++NFaYLTJYt0sNWtrCwnhNRhMR75dKVP5Y5iB/vwIanqQHJzGa+npYiez7qUqwXVZMzfMAGQHnFiZ1NdJD0NaNcBopS4mXrZnr5rF4hzJp0PO3F9fGPuNBzBxVucEAnPIrVra8C1+c6sU3aJfu5kxUT8/KL7zxduFngdpc55gGO5oroNI+VSOSuzM9JkHTa0pHvCD8bNJtLnFCf4R53J+5Fwx0Nn5iXQtFj1jg9dMZzKJdwuqhful/tOH0PyhrhDe7FY2lbQ1wGV0AtdyCiUlvFFTJ7b8hYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 16:14:43 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 16:14:41 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com, raj.khem@gmail.com
Subject: [PATCH] binutils: stable 2.42 branch updates.
Date: Fri, 17 May 2024 09:14:14 -0700
Message-ID: <20240517161414.3929890-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|MN0PR11MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ebe9e8-bbab-4c18-e6c2-08dc768c74dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|41320700004|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?msQEV+qSXuU9/2uVlFp7BRktse8u+9yYDo1CTLp564SSroCliTSKXRlbtTxc?=
 =?us-ascii?Q?zAhXNf4PN6OCSXPyIw2k8R7v0vmkG6rH1XRSsZyF3dHwBuohU1+yHAUtSLVU?=
 =?us-ascii?Q?W402I1rRDcmwCBQ6fmd92wc636tG5UhHkwZBdpUiee7QMkpqpWQTPyvzcQYJ?=
 =?us-ascii?Q?dX0QRP7Y3ZObwRyplmTK+FlTqLPLgB1+CpGBZGp7wYBF+0AxvVbp79xR3GeX?=
 =?us-ascii?Q?XXVNGghkY8rwctWb3x+ZKX/tcEei0qFHBEIf4UOSKwkq9MK9SZ+G+XBIn462?=
 =?us-ascii?Q?Wx3OLH4UTZPGbSutOZzREA3iK7U4R/SU7FAcO6z0qAB/LvMbUCnudstXerDH?=
 =?us-ascii?Q?+wcDVy+OvQn2sazVrVJMMBjejpe5qGsgEsUZ+j1EASa0mnJxMEeTDKaW6J/W?=
 =?us-ascii?Q?P4QJNA3gY2IWTAg6EodqR4bfVvufy9fM6tlyYmUf7lV2nDnTzZtLYr8BqoO9?=
 =?us-ascii?Q?s21G722lNNbgE1x5wYuwU9hLQv3FHd3oVT2P9X2GXNV+vdu1Op9BClXcfIa4?=
 =?us-ascii?Q?5x3MRnRK/p3oTjKsByLnNf6OzG/rG0FtM36mFcHHWJTjqnlrC06zyNpHAj02?=
 =?us-ascii?Q?cqbOncfk5arDjv+06RzogBDBcncUGhO5Q1wTNQ1MCmnVV0ObajYRWMqNgy8h?=
 =?us-ascii?Q?/gEYyELQv/SM0iKyAM4z1ML/EyePEdi/oZbJkZdwv2TEkPADoxkVjyQKtu49?=
 =?us-ascii?Q?pY80p7MZv15RF0dZeb+Gwj7C3k01+yAjCWCYGIXJszujXvIkZt+3bifH0Hz+?=
 =?us-ascii?Q?HD1rSBgJ42Rj8WjnwapM0JHU8zJ9qjttZZV1k4OvRQu0+R06sr0hTHxJg6XT?=
 =?us-ascii?Q?Vl5/Ga79U28Fsq4vOeOL85FXICTlfcJeDWvOAKZ6SsXuTb1K13tOoBL8/sq9?=
 =?us-ascii?Q?Xtylwosc0nfyrXYre/CZueulUhNtGUrm+2/vi46GymJXkPPB5B+GcrNL9ZG8?=
 =?us-ascii?Q?88tHxfcASlZOZMahlJznO5V9/DH127Q91QP4mLyicEI1mieb5CE8XWtLC+3k?=
 =?us-ascii?Q?gDaDJBOaGCdYzr2gVzzHXvRmIBZmcRHzJan8UJsJu4rWEwCD/MdVqbpfvFQH?=
 =?us-ascii?Q?ZpXeCmGjwI5EKwrLdgGU/OQNsRur2WlJ/6TZVXtymi382PdtRLRxaqoELfMv?=
 =?us-ascii?Q?DzwUTu6VHkdwuwZPWIGTTZWOsFcBGITpnKbI8xm7Km4rNPMClTFZlkh+ZR5Q?=
 =?us-ascii?Q?2x5wDZ1eZjcTBCYQiuoSvZ8ZNjxXUaBQ0Dun+EZ7lZSYOvUg1qn8aUEWh5oT?=
 =?us-ascii?Q?zQd1N9LkeYKiIJs+ANMRHXgM7AuOTxnpPwcegmEmG4djnOzdN6SNLoMBWk8q?=
 =?us-ascii?Q?dlR94w1W0SMQ3zb1M0di2V2EaaC69sqh10oQFX50gKl5Lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cpNNAOMOJjrLe71TG74rip13Ro59ZuiP98YXABmnxcXu+5njUZ6oIqJmMxR4?=
 =?us-ascii?Q?FxblmZaVwiyWgySQNUevATzySONQ92V0GmB7Bpx1pWdLD/EBmIPTK2i1dcyD?=
 =?us-ascii?Q?QR3YFu18NgmAvSC4u8oBjTVSl96f2O3klTRsDDkOFSR+5zfQcKzxQPxWdO9F?=
 =?us-ascii?Q?uEvv4m1UE5KWs5eWTf8vDr+zL+Dl3PJEE/pxAbgSiOrqjZKOEjqSoYZJiQ+Q?=
 =?us-ascii?Q?6wvmip0uiT2VpobjjXmtgiG7qvoBspEiuJsnsfP5i7k0CQ2IaW7CiWMclTXK?=
 =?us-ascii?Q?4ch8WI+gupmuavd0ipFI4UByYp99zmWYFdydGltlUpOKovpnfq1XWBF8/UZn?=
 =?us-ascii?Q?LPqyL6f8v3TWWGUmSXK6AoMobt/2OdlPYJ1ZIW8vSUWuHyMtCuYcKckDOrfK?=
 =?us-ascii?Q?s/JIJYqVOyQ6GNFr+sajIyuv6r+DtLzuTRksbJb6c6+yjN/CV78RiEg2vSuQ?=
 =?us-ascii?Q?YIOLsIXY6ZdAylVNmK7j/u9Zh03qs0qCqDNUN8sMI2qUMe2euZGwS85zddF0?=
 =?us-ascii?Q?MjOg7g5DNp2GNn1DwdEkf1w0R8U4uh4dKruxlQLGLNx8bfrKmp0MKW7owV3x?=
 =?us-ascii?Q?CS4iRXVD5mHTnhXnDkA7pjPLn9wYJIq1RfXgdKCH3xYQ5pVfWPKsT0/v8gAY?=
 =?us-ascii?Q?VmRvwE9ANpRHDXZAcwjqIkTbYtFgDJ394Va90bQ/ueKIZ9M0MC4A36/GOPOC?=
 =?us-ascii?Q?3AYzISTnrDtQL/uDnvyMJiDFA99mk0iUG8TM7hqPT6jJxRZY2JwEP7DPiJrQ?=
 =?us-ascii?Q?hbOvIv+s5L7qlFk8E2iJcGuYMzaZAIrrEnIcNMuuj4fU3Xw2bfi6HUKICSAR?=
 =?us-ascii?Q?vNWz3vNpT2q+KuY6z4Ek6qiNm0u3H3gzdBNCqAX2fhc1TbOMxZsHnAJ3zI8q?=
 =?us-ascii?Q?2N2yAshAqcanL99HNhM7Y7cfmIjJNspUoOnuQZwc2XBaz2yE7XUBMRV2/8Di?=
 =?us-ascii?Q?ta0uTfLr3f5T3XBwhyTT7KIEXMbM4jnyxNcsJ3o0H07t6jJcdlr7HD0UUXYx?=
 =?us-ascii?Q?lwBhFSGPXichYP7v2OlGFJF3gufIsw4K26XPcJJOOt3imzwxN0QWt4q2KrGR?=
 =?us-ascii?Q?LehufjUKXZLdoSHVRpL5KoMw/Yx6N+RjcudN0udiZKlGBOkJW2rn/eM5H0NN?=
 =?us-ascii?Q?u6xdJ0Q+wItWK4Lyj3y/5WpJroBF9o7ysKaDVQfHC4cK+wIEMEw5D9wasRpj?=
 =?us-ascii?Q?QuoXiT8CCGXxzEfy82eWa6HauBwWlsOibJtBdL7Qj+aDm6yTJd+oqzxXrAP4?=
 =?us-ascii?Q?6DKZFuCU51WHcP43qNKA+xx8k40PyHAE7N04mpW85GY51bZrI6gLAUrZ4lHH?=
 =?us-ascii?Q?cdHe6M1cjzRUffT8SfhXpu2t4+uF04zn7r7a9v9XwrrE2UI92pXNxuLB8QRI?=
 =?us-ascii?Q?mqWZCslLG79h/DnD/C0ICO0ZW3cKC4LtgeOBry/1sB8jmyZitvMjCoIu50rM?=
 =?us-ascii?Q?Emb6U0VfomoO1z0pT8ohvVq5OViriCdpzjdZ2WRNlrXzYgtFBRabyvgIjUoc?=
 =?us-ascii?Q?2ujomzaK1rOHpdFG6ay9oEdMnr6NcO/oXsKxwyf9ar9Nfx6qv4s67CbATlnS?=
 =?us-ascii?Q?QS6sA2pmCuAU7f5IEGhq8Z2LIj5Momq/qhV9Laky/LJzspDqnggw2yVZ+1ji?=
 =?us-ascii?Q?AP/rshFF7dx8AZtLYFIY5M4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ebe9e8-bbab-4c18-e6c2-08dc768c74dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:14:40.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw+KNnFaDFB7hdiOhMXWkSc3F34gUo3ZOOJNCq+pgMq4MRwYC0Kzmh1m/YktApRpwrA+6rBj0uOp2NzdKT8Lh9PTSowj3WbTcezKAQtcZZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
X-Proofpoint-GUID: G2V0yDtEviDUNvPs7GsbvparJ91ThJdm
X-Proofpoint-ORIG-GUID: hDWeciSW_w9NsDzlkKiUeKnH4LRP-e5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=632
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199515

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
6224493e457 Re: PR26978, Inconsistency for strong foo@v1 and weak foo@@v1
d125f967537 hppa: Implement PA 2.0 symbolic relocations for long displacements
884fb5373a1 x86/APX: Remove KEYLOCKER and SHA promotions from EVEX MAP4
d816fda3cbd aarch64: Remove B16B16, SVE2p1 and SME2p1
cb11047e34a Re: Move bfd_init to bfd.c
818bcf40efb print cached error messages using _bfd_error_handler
831be495ef1 aarch64: Fix the 2nd operand in gcsstr and gcssttr instructions.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3b6f47d4ce..b4d273c9c3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
+SRCREV ?= "73b22b4481e85635eb978585f405c4433bcc0174"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0



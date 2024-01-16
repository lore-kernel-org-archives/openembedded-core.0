Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E871AC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 16:56:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21564.1705424175480391648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 08:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UkO3MpAM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17456644bb=william.lyu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GEU514029112
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:56:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=hLan1ufK6eat868QYMLpiIVMhvgm/D5ayXpl4Y+vs6A=; b=
	UkO3MpAMvUYUigyQeH2+SZqx/sPHi0wtGc4FYJsmXHSXBmdWPN9qj4NOnyHtR/7r
	/k/culTWT4TiR0Iz4e8hT6whSjp3Js7sGdzD12oG23ZBCQ+z/Z4dkrRsi/2YACcz
	b0vxhm9M2kwookxNMSpVX8U0cARh4ISGLyXgyOkXgbCiebSSoYE0AtkYWubpL1Kb
	DJfeufwyRzArEHpwBRl9vqzmdepyrCMjClzLoXHJDDzfoaoeZKnS7tPmdcEIYBYl
	BVgNpI/Dc/xSBV/rZcRlIYgIDW+UdHixEu07A6jiELg9eyI6qLGZVUYA9WWfGY+G
	aXjzKBjq9EiW99kUfX9GzA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkk34t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVirbFvl8u5x41fgbrKICYWuBlK43Pl5X/Td+8EKVUspdVrf6zXa54l+oABJXSVVwxFSvPCxbwHQ2Hw4VEncosRwGVJsouuepWgtNYApnUp2RLfbT5YnwbqCTlSN+SiCNixezXMjYHHZNLS/6DiOo0ecLlYDkn+HikXH9SdOe0vSPJmCp3uMBhAwZyzNHeJQhXSi14cekwGs6y0p5U0CXw0aVx9NxaTJQNz4/FSeUr1ANdQGYsC/tefDZfO17IdKJoj4ug0+JOTt/Px+SSXheGYgukcQJtckqc7r+t5UdY1Llm+ragYkH9Gz8sI+oOUd1tgvHV3yp6NIXL2WQggW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLan1ufK6eat868QYMLpiIVMhvgm/D5ayXpl4Y+vs6A=;
 b=KN+t3XKlYr/Ts1bnzdCgNuBRLhOybLotbd7zAM7YOJG6pYNwZeimLct1V3doVJM/ymc7TRsrMxap0OpeFSZ6OlrCD3SqIzOfx1EmD2TWcnabOAuD4S9TEwN7TXHoi6P7Y4eHoar7faj6aOwommyJr8nZkaCZs1ioFTpnJdh7oGsq5P6+bVeOqJS2bNE5SQVOlrHv9HMUb+C3hAzWPgc8Q4bxnE2seHsEFShbs686uG9mAr2HRYRYLITyISq8Cnq04eKcFd93nyW5AW2y216NVQtGoAjKTRlxeDibg6IGqKhD3QRgF3ITXZos5IPBkZdmL5CjGZ5b6DNzOzN28QzQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 16 Jan 2024 16:56:11 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 16:56:11 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] openssl: Fix ptest dependencies on perl-module-* being ignored by COMPLEMENTARY_GLOB
Date: Tue, 16 Jan 2024 08:56:02 -0800
Message-ID: <20240116165602.2053194-2-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116165602.2053194-1-William.Lyu@windriver.com>
References: <20240116165602.2053194-1-William.Lyu@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: aa892747-b11e-4ec5-8361-08dc16b40af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zcBCjay/x24ao8nrFvGK5Xsvs4MHREFGowQ8ZyiyQtP/lSSqcElHZEJH0zxcPNuZvrF6HuNBA+eme8YFqpd3yHfYcjfMgDTo81W02J8gWuuKIhzrtUGqGk7hRIbB64BaTN2j9K737+vDGNqCy73cE8pBLlsQD0irOmRuuDw6DqqQZFzDhRPuM54aKLI3ai4rwNHvVFtxSLDRyBtYMKuR5HObCSuN0mweVeTF0wLvMjqLa5DC83/Pb1mhPw7VOmbXfePXl52b8koZci0aJdVJkHwz06Qampup0bH0aGLXpmRl6z95uNft50Wt+dNTuUP6cSjpHPzXxZky1x5A4TRCPvKNHpVRAdc0WPco/HhGcPTZBTUR/t8mRnp96OD8b1l8YxhY26NJB6Oo+tXpfBobkrDJw6CKLsv3PfUHYrZeVGhyJbpFFAVWDrfQ+OM0cbUNG83/a5sZK9EmAKisZdNiHLeh4sCWxcR8E179jDy9YGzk6sNEPgct5wMrI+qpnxUJAW7B7+HHXAvqJTxCo90VVJCSV+1LrsUnhLzZ+02+iwg0OzIe7hkL4dHxUs91HyzyC6PqYzk8PTRQqHJ/LXpe+Y8wuFZcyz0TeQPHaXYFjBcppxFxEpGEscUL27S6O57k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39850400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(478600001)(6512007)(5660300002)(9686003)(41300700001)(86362001)(8676002)(6506007)(52116002)(2616005)(8936002)(6486002)(66476007)(66556008)(316002)(38100700002)(1076003)(26005)(66946007)(83380400001)(36756003)(38350700005)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SfUJd2eagOfZexhUfCJ2FPkc2PfA/icOfZYYtGSrrPN4y2NFmsXsRFCYpAqa?=
 =?us-ascii?Q?IF5+t298OKl8N4qRqnB4JkrK4RpmP3mI77EuDuhUi05WBY9BmLKpzEQAFy+7?=
 =?us-ascii?Q?8CDDyQchl17cL6x3NilF6pxruDjZiiV2MTfs5dk8VJSt8ms1+7Kgn9MNHmDi?=
 =?us-ascii?Q?7JhmU2qDuaS6cC083x1uZNNoQf171MElUhiMTOk7Mk1THU4EoveiA0HFezfR?=
 =?us-ascii?Q?CoNlQZN+TOx+POOTrbc3HNE5LErYsosaDv5Sgkl70l8W5AC02CJqxh5I735j?=
 =?us-ascii?Q?q6hsVTKn0oQ7mqkgzyz6TkLne7N7bXg3CMoNypIU+GVEihXR78sUpvsxjjaJ?=
 =?us-ascii?Q?BVrPoFZCN95L49LnvudQ/jzPMqlrnlPlRDwteCK1B702gVDa9svIcpyUptle?=
 =?us-ascii?Q?IKFg62wtE59ezAeLHsoUtxaxjyg4Mnef+VrL4cUlYTEYdYFTM2hGfs00ya8N?=
 =?us-ascii?Q?FWnIkpHBgCA2BpcwfDohvXrHsEFNzOJN84fEyd1pZSrws/X0W2JFr84Ci6XM?=
 =?us-ascii?Q?/juEjsqLkFAtQby+oi753X5a7e/dwnGvy2TxZP+WJzq/lhXvgRP792+TyrFg?=
 =?us-ascii?Q?ChknJzJjP5Xq2UnG5ZYHtIGc7SyH0sWlooxhYe1XzPWJA8ZKRZBfXP/hZlGZ?=
 =?us-ascii?Q?OsywEykw7x8L1ckpZyPUeJrtAZPeRDr8xCkPHKcL/+48WGNfPJltRAztLkLd?=
 =?us-ascii?Q?wJZw1/z2igdBjUiW88epF5Ksjerd5BUvJYVwGHXqXv4sb/TDfWqxQJq8QQlZ?=
 =?us-ascii?Q?tB4Z8OvWmNNi3Vr4RifPBLwQ+FXNJPApgmFGMLjtKeBC3SRlBBykjZoy7XFK?=
 =?us-ascii?Q?r52n6Vr2/RuRqI61XMuMcYyOj2htTT+ZNOv5ugvZg7AMHlkKeJRQ3Ds4bFDh?=
 =?us-ascii?Q?u6+ankoTrLk/FjNNywuqReIkLN8tmfxxPV3F3bBX/4vmvuvRV1+mITCoHliA?=
 =?us-ascii?Q?+3A3xxkWbZjViFVWXkHLquecREo+3MkGmEozVStMBxxPhfzeiPMgARlqgfI8?=
 =?us-ascii?Q?G/+Wq6qSeFC/pcnjx+wePLJcO8LITZos99wl4JDhaOxl/ZOpVz35CKMciVg0?=
 =?us-ascii?Q?ujsEX6iZ5F9zvouQX0yaWaW2W1UE6yTfLMB7KEfnQ5hP+bAcj5KR6qcVVNGF?=
 =?us-ascii?Q?/2eIns7m4ZMDvb/+zJhr9FCTnGW6HEAiJNMETLFdoDk8XPN06EnT2cnrJUPm?=
 =?us-ascii?Q?nTzXxcQ8mVh9Q7Xoprv+8yajzDDfde4kgyW+ESB9z+gcZkGYhN58ZmbS/vsj?=
 =?us-ascii?Q?KLI1TixlgFARPv6PkXObdjl+/ocBNEFTHb5ozmXvJYvBWC3ZDn2C6X+qmlwR?=
 =?us-ascii?Q?S23a6HoI2TFPJYfttT/U1A8/1uZnbQo63xcmv4dBjwiuPGwADjRd/UvwxgCH?=
 =?us-ascii?Q?911wXzaGpXJBCUzEZsnzQ3arE5yO+oOEo1zwpvvZ5mywr4EmGVCPPeld9Chx?=
 =?us-ascii?Q?wFUPP2+tAPxhgHg35pb/GmbOf+/tixQTSFXxEOv5yAo14Urf5Iyp7AUTg6Sk?=
 =?us-ascii?Q?ESpMhfjd15FMXRC8krxrlJ1oxAFs/ikmawUOGBRxj0CrsVn7b6tNzOJRz1XO?=
 =?us-ascii?Q?xVR35ZYyLRLRjpUEI5RKXb7X6r/mtjbKPa0R5ydqq62ZayxZJjbJJOmp6Z0m?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa892747-b11e-4ec5-8361-08dc16b40af4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 16:56:11.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xe4Clr6DM9BkM2OEMukRQ31TWmeWQCRsbZM4n7B9r0zZwp01NyrbV6M/5I7pROkDaSteDNVaHSyZTQtGpxTbR1D5m9ATO2h717UC6HLP4v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-Proofpoint-ORIG-GUID: WTH1ut4oSYfxzzpejGQq_DyeBksAyyu7
X-Proofpoint-GUID: WTH1ut4oSYfxzzpejGQq_DyeBksAyyu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=825 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401160134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 16:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193866

From: William Lyu <William.Lyu@windriver.com>

Change the openssl-ptest RDEPENDS from perl-modules to
perl-modules-force-all which RDEPENDS on the same set of packages
perl-module-* recommended by perl-modules. So, when openssl-ptest is
added via COMPLEMENTARY_GLOB "ptest-pkgs", its dependencies on these
perl-module-* packages still get added.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
index d041d2d214..7076bd3a7b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
@@ -247,7 +247,7 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
+RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules-force-all bash sed"
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.43.0



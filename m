Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EFDCED630
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 08:57:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11815.1728464224595194780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001212afd4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49951UTu030868
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Oct 2024 01:57:04 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r4c0nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 01:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWEX+/pZGUws8qlzfjsg0O6tpyaR2KdCkcsAXl6GUTJo7ni5cd4uZNqXWrHWd0WvGic/YUqyf7aVbyRvPsKvMKB7T+kAEDevsh8hj3duspeISwM2SNpD/X7QKUrhhNuRM0zrULS6KkuZ2BRFi3nCVlBvalajeYYMnhQjkPeYrhFhBX4eLEWLLueTMpacy38Gss5usB9S3Xt4ld/SNn2Nika+BA2/pariYvVuqaWE8AR3X5gd9cVATg4vOnFuzJPuG6WwLKVO1SVxUezLM0kAAIIY+RluhaASRmemvxkR9iX4RgPa0UnWhhpgmT9O3WkNUXgvqSG7J1DGUqpd4vKZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPS49xccUT9YUwrhnrZkr4qXwZxGXNz56cmlF9YFdxc=;
 b=xHx8KfjcJYXyxAoDel0GLbL07FOYrfwv5m8BeRtF5zgfN2MO/cm1gqYfELBZO3/yHWuoc1kJUW8DXF3iCLMmogAxi2nzojdsfndLjEMxHCFMeOMJdUwCYECi2AALtk5z14Y+Ja8kvFOX8/+qfD3aBYQNIg4Ct/xU10RenvRC3p19gy5mIZzyQlxwbVMyjld4TRXABEdbc/Eee3yUbcygjMrHYd1ZsA08BLNAKUZdRdk93PHTuBW4tX+/D10FWFVulSmOPR3XkW9TttYo8BJgx2FNscsKE2Uh5nujfpHnzQFqgyTRLefVia8LH620f/JwGj3f+G26M0/y3DxKf2/AvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 08:57:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 08:56:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails
Date: Wed,  9 Oct 2024 01:56:47 -0700
Message-Id: <20241009085647.3123520-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR18CA0028.namprd18.prod.outlook.com
 (2603:10b6:930:5::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: be150a0f-c674-41f3-6702-08dce84055eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uSOTSonzS8Cr3sZeU2FjBIxnnFed59zm/tnFdBLyHxWO8znEfTfGNZ4cNPCH?=
 =?us-ascii?Q?fIXbmi2EIRCIXBfBrqcmIb9pCzHrG4NmUlZ7vdPVSn8VsBIBxcfRnvcsgOks?=
 =?us-ascii?Q?DfAO/pN7nVPjGo5CKU+g2mvXXOx5qVZnI4o1/LH1W9Dt20ul/v0FBEADEHaw?=
 =?us-ascii?Q?6kSLT+npbrHYSQYaM79/7Wmj3XiDniUg9LfvIZnC5FlXAZqm3upRJegRAYsd?=
 =?us-ascii?Q?MS5s43qjdRAJ8fo1Y6NkUnMpDGN2J6W4s+dfS4JX11XPbNIySXpjzkfSdlm0?=
 =?us-ascii?Q?jQWTnevWSVdeiBAfTx1PMqkixeo3wYeU3aQzvMdS1jYD0qcAitDxF+Z7Dp5H?=
 =?us-ascii?Q?qFUx4mHI04jQ1A9fM2ThrYlxyIPqVIpD0zUnlbjrPWsiKMEKKDFv686Su+Ix?=
 =?us-ascii?Q?Rysmw8GhaN1hdMEqNcP8yM0Ag+liFfngMOxWpuwUJbkfV7Xb1UmO/XvXI/T+?=
 =?us-ascii?Q?6P+tDAPRWPhq1wTohJ8VrnesqZofw8mppto3odCvI9SxZ4vR4egvWjt+KBzX?=
 =?us-ascii?Q?sU9I0URvC6gYVQDLeDEVxcMly7KfmgEa1WZIafGTHPRVoo0o454YU0Xeu20K?=
 =?us-ascii?Q?jtbHb5sKsu7WGl9UwG6lY8jSDRYGRfNrtwyIQIBmY+Fdj3RULNi2dk+ojOUD?=
 =?us-ascii?Q?T/p/0TWpaOgodgRFaCo4wBkcjwLf/vc4+Lir6GzGKM9bb5GLCqhFtNDPkyU/?=
 =?us-ascii?Q?G1ChcWXMpTUhvYOB85NiYB3HU6sjkRcrkpAMY8sZvk+2DYf+ZTf4oz7SFGME?=
 =?us-ascii?Q?cyap9FYqS2vTjJZpA15qUEU2UEURCw2LIqKp6SZQl8+CgMKDKe9fLvfw95ni?=
 =?us-ascii?Q?OPkb1TsR7KOITtHJFfrpbHSf5ZnDOHSApRLYdmeSoRxXT961LFUK/mAAA9pD?=
 =?us-ascii?Q?BSZD7mN5j9bmEAvRBRSuaeTXnCvK10SUJ7B7VA1kppUVSRdRHRTTsSQB1nCn?=
 =?us-ascii?Q?TV6lV0WeXGRzN1KJP3QC2878+bFQr2uDkyfg/dHmp9GEkAiFu78aspaGeVX8?=
 =?us-ascii?Q?XmadHlmi3szNzu4QDkhtRd4hwE+kWjLqYd81Cbe/+S+N1TKPiZQsHYCAd0i4?=
 =?us-ascii?Q?xO9nDNbQBiKvhLWimhkzUxVZlB9DzW3QOYCoRu0df+LUMwwMl6khy2TbzoXf?=
 =?us-ascii?Q?Pv5WMMZsPlUVABuwflduWqEyCx02otSzR6EXhxDM4bt2MCxkvn3OfyJ7cl10?=
 =?us-ascii?Q?XANCQvDRJ9ZDKXafospqpASKwy2n3xBNVxuGAmeurGWQ94bGISl6YGNB0wjM?=
 =?us-ascii?Q?962vh8cqlUqFEOWNPpGuoJ6XxDIzQVEVG9PbSslfl2NJkgIOiG/nBsceNzo4?=
 =?us-ascii?Q?Cmk9+3KzshSajsUHuhS2CY3YVIbER0BpTwETJJVvKypaVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CCZwvZA9Lua/xbgq3Lo0JVCe+V1nw/lcwQaNrGTpwitKIQFQfGijfjFHM38s?=
 =?us-ascii?Q?uAEFegCbarwJc3DX4zmb74hL4wRRxEpG28Nh/dLBkDkgR1gLbjosBrd9tjC2?=
 =?us-ascii?Q?GPPzevzujUJRGon4VxAMBR8zmU4btriO1e4kMX6ANfMY1kZhPunsuUbDmXoX?=
 =?us-ascii?Q?qSk6nqKbn90ANpTdtxgrOQsbMXVbOJZS+7FY6tvTXP1ammh0Foph1u/q7wgz?=
 =?us-ascii?Q?70KpSjKCyjIBV4QAxCOpsfzmz8XwExak1p5fKejUv4ZbJgerRvB7097akD5Z?=
 =?us-ascii?Q?7R4wrtwryVaMT0Z5U9ll/nGm6KyIt5dD+kGK4MDxZQIAf/icMfhW28tk+kZc?=
 =?us-ascii?Q?meE/M5MtelWAUel9lPRtIR5he7ynonw579gUZDS8zqMCvO8/uTF2pXUaVW3r?=
 =?us-ascii?Q?byw3sbc1kuQjxSvJY4DtiiB8b9aHrosVrGo+ryVKyFtJzCbgr2/kYdnsY1DF?=
 =?us-ascii?Q?lFo9663wco9xc83R0SKDM+gdMeQNI6DqSf/7rvH/Nx0+0tzlHlUSyj+ZTROu?=
 =?us-ascii?Q?TYCzj61K90yBjqWZZvozVEbVLuV3Sz4snU3F3n9YKOB5lOS9wt2g1qvw5PGH?=
 =?us-ascii?Q?WFxe7CDJKoaQnAHY+UCWBK1DyfJVloWas3+W/HTyI1Uzo8vK72EXmD0QN60w?=
 =?us-ascii?Q?0BpJ3Hn7zDobyBDXcpmJzNhBV4JTyJpvsFDBLoXIsOHJEwHvAxKd1migDZsZ?=
 =?us-ascii?Q?ZPG3HcGY7BBUq9yAqQ1McLvr5x3VIMT6LY7jcpRyr3scnJBlxuZ9ANdsc8JH?=
 =?us-ascii?Q?Kc6dbNGC3ZLGokYuhEFhjzhmmSe3g+8nDwOO2Zoo8NBgZxXnjW+D6pD4laJA?=
 =?us-ascii?Q?JFW401BMbP/AD/p9jUJe/CvAoEs9mUg2Dg1yEgh5YMAvCVx98ucQ05uOtRFS?=
 =?us-ascii?Q?YY+/10TrtW3Y+AgoZJcF+KfpmjrZ26liCLzw2nYrrRjuYgaZqs+joa9sSp7L?=
 =?us-ascii?Q?aDuAazq5j0juB5G5rVq0FvWhurnbd1eRfRj4B/qHvNqyG3adjTjCkqSPwtMU?=
 =?us-ascii?Q?Uu9/7kgiCTimJMEbLL4DYG+HSIRFF39/LUPIKmcje3dZ0tREaeeDPSAWuNPH?=
 =?us-ascii?Q?xinqKLFEX2EC6BuT8I/47gkJdyU5wMJUJZ650eZYgQGbHLLBoP/PCVPJkiZI?=
 =?us-ascii?Q?EAKzJp7QbXeg5LTMq8rhMRkE9k2cmu8pEshSiTZYnQRa2xhqwlr5gzgoeFJX?=
 =?us-ascii?Q?LfeGdoyJO628MWu2WJaqXkWbiUJPUNDOZn2Avs2+TpWYmOu0T/+4bsCmsFQn?=
 =?us-ascii?Q?PCAxmfi4kQ1ed+ygjc7mc/cICtMgg9zmnjmPv1WuUlNCTalxbSafFs2BdrCd?=
 =?us-ascii?Q?S6A776yEF0BQ4n42mhJLJLPRMNe40c6E6npRJ+cmdESrj0sgUlB2z3//OWvW?=
 =?us-ascii?Q?RHhkz9dHGYegmN+BJlsUDor+WSbDOYRvKxri7ENaw82r9goVAun3K9VlR8bf?=
 =?us-ascii?Q?enkUVDh5VyRCk/+qgDcFGjq2PfenlE9XzKALLX96QMxqhPkLSWS6sMAONOEx?=
 =?us-ascii?Q?O8TE9Y9T0M250kTvJKdZJzuc2OTLWqbJjXc30uWUxKk7KGtrd5BIkaTpr8xt?=
 =?us-ascii?Q?9L9jarRlXWE58NyiDJXltX/D8/bTLQoOymWpeqjY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be150a0f-c674-41f3-6702-08dce84055eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 08:56:59.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43pd9AFHHtZH4KWsTdJZJ4XQbWXhvfYTdi0nguJOI28k3nvksraRVozWOOi2n7PZbIzYbb091KleUxVrzEpRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-Proofpoint-ORIG-GUID: Lqa1N9gecD-6qXaDq4BW9s0wc2hAcG2z
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=67064560 cx=c_pps a=PdgAl9AEy1hEU2ikvxmBtw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=S2GJ-aCw900JSPmBEHsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Lqa1N9gecD-6qXaDq4BW9s0wc2hAcG2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_07,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410090058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 08:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205342

From: Chen Qi <Qi.Chen@windriver.com>

When LD_LIBRARY_PATH is set, post-relocate-setup.sh will fail and
exit properly. But such failure is ignored and the SDK installation
will continue and tell user that things succeed. This is misleading.
So exit immediately if post-relocate-setup.sh fails.

Fixes [Yocto #15586]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/toolchain-shar-extract.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 89d30005fd..3b4647fca7 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -286,6 +286,10 @@ post_relocate="$target_sdk_dir/post-relocate-setup.sh"
 if [ -e "$post_relocate" ]; then
 	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $post_relocate
 	$SUDO_EXEC /bin/sh $post_relocate "$target_sdk_dir" "@SDKPATH@"
+	if [ $? -ne 0 ]; then
+		echo "Executing $post_relocate failed"
+		exit 1
+	fi
 	$SUDO_EXEC rm -f $post_relocate
 fi
 
-- 
2.25.1



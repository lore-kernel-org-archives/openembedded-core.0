Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D85FC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 10:11:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9700.1711102274472382983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 03:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZiER1b4Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M9Neu2004991
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=PGOlvFmwE1i7cbCrcz
	lbyDLKJuVgP9YLuIkfWkMTVm8=; b=ZiER1b4Q1oQkmxQtVnXwaXBQNOhfYOZN3y
	ywDd7oe9GnxjSVrpEcMO7kH4gNQLbWR0oXnxsjPEvy/4uQjLFl26/1MsHNJYLB/J
	LdHjBMYfOyHVrhiEEke56sFTMPnbEaTwjyO1Pn4pQDGanXhEcLcD2Tg9fhow8iS9
	E8sfudDKKWMedljT3nmUqWelvfnsoJwcrw/xh1rlNLmPdPEx9eR628XkA12ePst6
	1VDCP+3gv+823Rij4zMi2jqqp5NqQFpSAllqTCL0DvEL8Z3XskwDu66LVNSDqqkj
	WadCOWTefQ2XRVLrsc/1JIhe/PuFbJObaKJq9/87XJu7CtBI+kXQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x100xrddj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXrd0aoFV4koHQhtouUH3Z4P8rBfxAp1iRNl0UgdRFJNd7fD0jKkUZQq8VCRsY1+DNdF0aqTdfQpmrZVWwWXsOCqOL0f1vjujegDnFVu3KbApmc436S18w0d3IPzoi0zcODARt2XFYfcOYYtYor6eTTtI4UnVYggxzVaUU6wixjU8M8IqmzxyHqGMrKfy/24Y6qGLEra/TfuD8wd6AiGQiG6Tq92TdD31Mq0y77ntIjQ8Os3MN0IpKmFirGNt8yZxoD2eONxhpEMEK4Nr/VkLMCSmK9h3hjl1lk9Y7CBrbet4RWocdWdxyB2u81s1zArlzntm0TtfrSK9b2gHQ+ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGOlvFmwE1i7cbCrczlbyDLKJuVgP9YLuIkfWkMTVm8=;
 b=UFmWU+QQwY/5qKR6vEKq98wG1/hgXAit2Oke06V+DZeacO4AqZ9zRFXCPfUPsC5sRqDCyRgd3wpU5qzkfpiJvoZyF8j8WW5ll1wtUpE12vm98n7vkim3da692VUE4mBhY7GihMC1Nb818a89keB2Fh4SyKxE7tCOm6rl42vnAfnWYBH7jsuA0o3SHtn1kF/L3VDYEMFZyhNvm1egZcqJwPuQNvA/13a67fILy25FxLtCpK5TG7z8tUXqJSnPugtWL++QA0N1oMhGtCjX6zYWD/pb5fUajR4k8Q+EVETu+357Eb9KGrRcYg6M11+7/0ZTrMKA5cqmeUoImslS3iURyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 10:11:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 10:11:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/3] nativesdk-packagegroup-sdk-host: add gprofng package to RDEPENDS
Date: Fri, 22 Mar 2024 03:10:51 -0700
Message-ID: <20240322101053.1397030-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f0b513-ac00-4f2a-932c-08dc4a586679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8+gioZKX7Cg7MAat5yNjB60lLfGcWrI/WsiPZEAPmMonyKAC/hLrax06ROMoIdV6SHU/DPp1HmahGmMnNQvmU7o17rUHXgvoKQ8UU/z12UnkefjOfV14eXhNMFlmS7Fa0UcLRsX2cPzIlYkGlRtlzSgD7YWUacdnDR6SyvvrSo1yW1QNRazPjzZ5igIck2yvWUy3Bsvmod6dVIu2zOMtCUW7DNetgtJpku0TiRhYKUDTR6E9ekSUdn08b52kbRsgUPe0S7aXgAjRJ2qsBiBsPbhTuCiCcDp2uyKp0ffBJiS4Bb5nQP6GK6pR9rEWIVpVmAfnPXlRd3F2xQWCFO/iDqZPn1h93UflJjeJtFI1MlEdaQNFWwldzw2HFbxT1OjjVtZ9ocLjIeAvmZ3kNf7h1+Xw8BkS4GbP4A+DUIclc+xEoAMJxn3BHbOW4wGT0WcP0JuQrSxZpAj7eF5MNuYCpgPB2FEgFkac+MDCYB0d+Gefm9i6PK6BVl6dRuitNso8C/MYhdNXOMlOYGUFzU5zpZ20teA68EpmrTzjzswGc80xXXUk6X6Gxv3b9bF5HXSHVV/IeOnF5zJHguR8zosuf9oHQl0GsNVxuftjaq4GymdSZ2brX4kriQwvszB3Mb5uAMhrXwTwnnVfASNAVjP1VZtmhgpDzGf3W0ZdQcepw03DI6QblkS7zfFmUO4ZLjjwfkHduxsry8G66z6uvER2S359XAf8LeJWKnmx/VRcX9s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?18wpen6mPElogDj/LHKYaEIgt9U2V19u20IEKY5cilCch5PW3Nxw+awjQMVJ?=
 =?us-ascii?Q?Ak/Jv1xek6CmlJr8CV1ORaeg1EHzFFU8gvWHIl0JUOE9DHkPSK/wkJs2uXSz?=
 =?us-ascii?Q?ONDGzK4XYtVMwpSDvobqMWPBBsZZpvevy0boeKwkmGLI93Q8mfQeLx5W0AD/?=
 =?us-ascii?Q?U8b57KXJAARJAF/pMSxMXqndLLHXUuZr3exkELOzXbTyZ9QN47Saz0TW8cpG?=
 =?us-ascii?Q?X2MPIPdtSVITHgCDjzcTgBm/ZuuWR9W+WVY8Z7/6TXHx7/ET1xb2ZK16M6uw?=
 =?us-ascii?Q?qoAXEYqjXPModsoLl/S0qkO+ISusRmr3JYYhFExugOuq4p2JpvgT4U+gSgIF?=
 =?us-ascii?Q?g6kwV3IvjAqp47Zvy0rJT8Tm4KIvCsf+HVOtJOo33zH3nw4mzh5OkAIjBH+1?=
 =?us-ascii?Q?WRIqz+5D8yjCI6CCGXl8t8Am+W9HpPKmi04iNdXuOv+oOWvIe5b+skPsimTc?=
 =?us-ascii?Q?62z/6kn3J4wpmnySsGQq06QnguLgP1bmZFW/BA5CQnUCfVZv2l00y4E0Y625?=
 =?us-ascii?Q?rpjR/Up5+jUA/MK37BxPQ5A9Q9Z2wC8dkOEwGkl+6Bnp7CEPpAkWSGcEscda?=
 =?us-ascii?Q?5RjXvLlolu1Xp/Y/CqIfVkytS7TloBDDBvCbdOVMuPuaUpuPFS6w4sRPZ//o?=
 =?us-ascii?Q?5n0Hm6Rtu/+WbhDqBonauRB3ejf2YoG/ckXcWaUYW2Jdm/1J2Rws/p3KFVq9?=
 =?us-ascii?Q?XWH7m7DB3H0Zhv3MrRGCdkDQ0SByP5BwRp/f9SZwE1vi5hTdXRzNCaymMp4y?=
 =?us-ascii?Q?SKs6ilonq2TIaO7jkYYf2mjhbaIoNdnGzW7dp49x/2xL/E0EVWdgPAOv9/Pw?=
 =?us-ascii?Q?dGO2ksX4QNDhKNhJW3/k0C19Gh2MgRET2Cfa9AWLmmV2jWDqBiF3aoMb8lTf?=
 =?us-ascii?Q?VHVqxp/wuHQDCVuCzq3qbzkhMHSf/9/9dUdWoQKL1XLjtxpKv1XuCSrVBzyY?=
 =?us-ascii?Q?uDrAQeNeW1U72EUN1u/365usPADSydPosn/3SK3jtCK09qujjmkj1u1RRAFd?=
 =?us-ascii?Q?//0G05qyJAnbU6UiHnzRMDIc2m3BD2iFGQ+7vL9YGUh/RMYTjEWqknJhL241?=
 =?us-ascii?Q?Dw+KVkiKtJgUfZEhutbOqDApG/iWgOfumWjNL5A1uDdPp0tmkqYnoKI+ROnr?=
 =?us-ascii?Q?putWcSpysIR9eJ8fW9MFg19J95wVD+8DSlnaVBtR10VImdybHKkwPRh2mztq?=
 =?us-ascii?Q?q41rxI8oLVurOa/91555CQKF8srMez0Wmn6JwtZwIqhrNTshuhD2f0P0+c8I?=
 =?us-ascii?Q?BYG122dAtAx5Yu0ZldGx2/o9SBlFzd0KMDnZP/yUu84N1SQNdHpNtufBRl6h?=
 =?us-ascii?Q?ljDjaBW1Vrza7afSVWs8SUK6VG5+J8AHr71u7N0TUg92QqvN/JZ2b/77QfVH?=
 =?us-ascii?Q?wdTPGB66ejsjtcBQ9wgq1pUbGxHMaWjg7896MylAZKYZ6OPzqVIWABIgzyus?=
 =?us-ascii?Q?Ld9y9WMy/S5XIwFdXb8fWjvN7+EVOI9p4cCP0g7vdCrV/TqHbBhpTZv9875z?=
 =?us-ascii?Q?YOQwb4M3ZaHD+/GaUuFZe7dLZfKXtpHLLQtl1JxnBOWZrCgBmy73+g8Xu3F9?=
 =?us-ascii?Q?tLasx2P1qIUprxxffCHH/g/6cptplkuQhrh9ipMtkzY217atEY7DDLAz8tlW?=
 =?us-ascii?Q?mLGuYaIsA/Xcj0xVxsTW0co=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f0b513-ac00-4f2a-932c-08dc4a586679
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:11:11.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0NlcqEHWi072Gu8nv8Z+A7PiyxYxQLxFz/qnTCyK1liOxxiWe+2TZ9Z4KGxWIjSPgHDjAriAPx+HLq4/RmiLSHUKn0pcMAL2d1BVZHzrTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-Proofpoint-ORIG-GUID: ZgFjgrlirxAYS9VjRqeoU29JaSMgxvGx
X-Proofpoint-GUID: ZgFjgrlirxAYS9VjRqeoU29JaSMgxvGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197439

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, while running "x86_64-poky-linux-gp-collect-app ./exe" fails to create 'test.1.er' due to missing gprofng configure file in sysconfdir and aborting with below error while generating the profiling data.
- configuration error: can not find libgp-collector.so. run aborted

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c1d3c25060..5374067bab 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    nativesdk-gprofng \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.43.0



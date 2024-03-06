Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2567FC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 06:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6649.1709708083056190818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 22:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CP5kJDM7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37950e620f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4266ZMEV013833
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Mar 2024 22:54:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ANwjeHJzpEs9i6YqeP
	9hmfBdTEfFDQ41XD5jL1qQE9k=; b=CP5kJDM7RM7H/ir45lZZWRxpYPoF/HAhnM
	cJJuiiD2Ay6rBNWfacTHKm2jqssGD2YWLckTKoDk/wYB4u5Ke+Bcdh88ezZ/++mT
	9lwWbRW9ffhtI8n66mr1v6dIE3DIvFUPSbAsiKs3sbi5ZHDpGKy76f3YhvV06E6J
	+rIZ/UOLy2GdEaTGHEgtr+uRQcnzFA/zd6p3acrwXzG27MaIzmdyGBzqMQSubjNn
	5OPymiyycpglYoR9hNzvvEK0TO83a8/ih2nCnEU3wxWD0A9MOcVXu6LltlEHXopE
	vK0VTuYKytUe5FfwPAf3lTeCsQA7HwcleLBNuXUPGvEWOOpwrQHw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm3b1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 22:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyNDVzvmKiicuJVzbf/evWdhxSTpY108pQPeZ3CdljozxOS8A+lJ6Hm39o14wGdt6ViYW6rfS2NAbjxzI9bhah1kfQeYD38JL1zTY3Wdfy9GHkk355NyxMDhUEjNAmv7TWsBckIXVxWuanCgbnz3l7nwgSlK/9tfRdrro6Zsv5hvsI0INtwmVO6JeNeBkciDsB7FYlPz63FV4oESvu5aQXo4kRew1g8H5Tne9zzQKUcFbf93JauxPARihCh0lXCc499blpxbxKdcCCkuFpCG8T4fkAVb6kn3wzzEivlKqFEfzcbhFx7X9rlLy1uj60l9kxRTI7K8Btz6ZGYwo8i8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANwjeHJzpEs9i6YqeP9hmfBdTEfFDQ41XD5jL1qQE9k=;
 b=TC39lZxPGyl9mBaoFGFXsdEsusMGYJRrY0IWTrgr4ehU96QfSysmeBTOgxxXzYXKaYKYmB7LjzXgfM07pRdFJjJ1he6aZ9mSm1XTOMl+27y8xRjZuH8pWFq6/5MKygL0gJ+o8hgJzEH8xlQAGJ3HRkI//Itv9lFh3JaRu+npHFpDKux7QYSS4U4w3z2gkv81pXSzh6/NwVTZuVCRdq9NCbIL0CxVYBlZghGTqpyx0da/3zluHuzbLO2nObrZJMP1LFykXouBeKdtKeaRX3sKPIvGnCXhKosPJOteehvWUoONTLXG6d8hUa44roFBT1njBpJnzuYzA86rcW2/YqmhDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 06:54:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Wed, 6 Mar 2024
 06:54:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] ovmf: set CVE_PRODUCT and CVE_VERSION
Date: Wed,  6 Mar 2024 14:54:21 +0800
Message-Id: <20240306065421.1015219-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d65f95-cb10-4a25-1725-08dc3daa4ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NF6KRc0xAufmDO1ib1anuscjA07TvgVRqr1LTEVjknDbCncMEzEKNJVjqlRZLku6d+tjXVnOGJCEXQoa5kwvlqq6JJ/o+29KbipbQTxJKX7nCeT6Gz0/jYHsiuvHJy6nqX7PVwEQbVO4jelL8m58htom20sCsytaFhitR3dwL6l18gsU86vw+82TjcZrBmDNVqcaSua19kGnObYg/lu1oV2vLeBFMR33AR3Xy2rwNFRqtw6t5BuE/XYaQ7VV2euMHeqe/CGdGf1+zegALwucOKyRNJny7CEyOTg9TdFJE3sksU6rJrW0GYJcfJ4mg7Cp+GesKKupBLfIFquDfw0HsKIVqlEg2lcAhwCXYm8ZlZuNQuL8RRLoYto2ZyW5ddv0muwYBx5E8axL0wH/RwO9IgBHZ1AOHM3/BN0zyfGhHJRdVQMVRR5h2bKX9pxaqdYVoYxsrz6QKASAzoBTB/11QHZ9MKQxHcIjctuks9xxf4mxH21aXadn4fOIk3VNsSbHNhtSzO6lFMYFhT/ccD2jL4s6TpvScVHxW13O5b2Eylx9LFU75Sbjrs3JmLc4sStaOG85EtH7kThuhJ9LSrT6lSwteem6eKhIPaUYsN1nYYOpa1qcoO8PQFqsV2mKG0r79P7AV5ZXbe5HFgTD13Cvp1gcsh1W8jMxedD6XboKRkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XmiuVH7Te0KLfIZHLcIqVsQIMaN9ukEzm3C4s6RAEjHaQtCerxH4sEwxvCcd?=
 =?us-ascii?Q?c0ywSlEluT1wzZMZP6Abz6KQQ+5AQr/1CBoX7dU6PK8s4mhYO8KdAfcrK4QW?=
 =?us-ascii?Q?6Rz/jzaqWMxfu0sb33kS1ATY/qAifh4ZO/VBi7Kejf9+IM9L+ivjKcFTMcSe?=
 =?us-ascii?Q?/xh2ybFIvcVYy/IoVjpWsBHsKa/p3PoJ+KU3E15hitdba/XJASqpm6TyNodn?=
 =?us-ascii?Q?D23CjBrYNezFjxykraRV0TaBUPOYwmGyDMaSVJAy0VZcfjEb4pIVzqwyQxui?=
 =?us-ascii?Q?XFcADhibGjAlZYhEQV4bQQSwTDuwcsOmK5t57Z5DZ0Lcc4hXC2pJMylr5qQ7?=
 =?us-ascii?Q?pvJX6ejkbtsQrgv/rBCv/JrnT15aDszvrng55PHiU1T0kkCCdzLgYOTLWdpe?=
 =?us-ascii?Q?aJjMYeCALL7BJsBaQC3bStbIiCgytvsVuE5uDXXZLHcmSheSrlY6nXgxJUV3?=
 =?us-ascii?Q?u++bHTzCqeX13SWEwEXbGyrhO3wS7Eds5FmDF5y17CeGFa3KJ7hgqlxVgeVP?=
 =?us-ascii?Q?H2ztfq1an/g/xC3M28i4k9+H0XJ5P6G7MrPHw06CYk+SdjObIpLNXkSpqxlv?=
 =?us-ascii?Q?TWceBZ2DTdTXUTu/PpVu5dY/e6ndCDL4pjBPNB2mqV/jM3qeBmIo9uYoppgL?=
 =?us-ascii?Q?ySRUMsHZb2rXGuS1Rx0VRbenzR5sUdj3/pN/U/RPIJTQqtGbgkkS40qgwQvf?=
 =?us-ascii?Q?ppGrJFGAxK237piTjjFfQ8Aen9nsiZGzWZkm/0ig8uvCP8zBwh76+0f77pyN?=
 =?us-ascii?Q?BcaNsy01YygHZKuNQ1fKpoRlJBsnWwHcw5iL85F38SvXzde1TzQxyethIPuT?=
 =?us-ascii?Q?zEEElFDA0X4vFXemWAnMyKoNXOaSDd627kPrMXJfrXqL6kQPVxmTbtSxw62P?=
 =?us-ascii?Q?C1GOumgG0yuGxc6VEKTkUhH5U25cBldNji44hwny37NNnypjxSpg+04UP9r+?=
 =?us-ascii?Q?FjZlq1RRLVXwzJaDrWEcDIUc00bPCwG9iHimJGNOSHhjujDK8MSaZ7xYjHey?=
 =?us-ascii?Q?pxWm7FY2YvRGsfCx+wMeVrx2RfPlAQEVbYoH8zPo9Yll8m7/TLduqQLT3o0t?=
 =?us-ascii?Q?ufL+7Q0op84blEYtLMOsMTGxuRu5d5lhLfmEl8bX258T+UuQDgySR8h8XqXR?=
 =?us-ascii?Q?nnw+J+Drxosgrzj4ulIwNlSvnRnuTRNghOfTnIpGtZYkYkiIXVR8WVwocItw?=
 =?us-ascii?Q?2CCx9/TtjsGwtLnDLK/qSWSbMKK0so6o4sR0ceZ8dwJUPyp9nl3d/758GOYp?=
 =?us-ascii?Q?cohh3mv8pWgjxoO1gWzvetpYk0oTpwJyiTiWSs1KUxRrae29fI4IxE3yCvNr?=
 =?us-ascii?Q?wUpPTAJXfCki1if1y9igLFvifJEAiu5qWW4b0w7MH0TCdvMn+ViGYNKOIR4E?=
 =?us-ascii?Q?vHhgpKH+ByZ1uHzm6jAS+GMhZfqIZi+eP0IAodzJO42NBfIyAv5GKpYPwu+1?=
 =?us-ascii?Q?/u2EogC/HKakTUHfqZB2YHbh3gCIpPDm9eatkHeswxbZXmkewIw7GaFD7NhX?=
 =?us-ascii?Q?hHifvyp5vyy7uLciruMlkOX+k6oLrl1OAi2Hc82eFCK2VBwBEyTOHulg68en?=
 =?us-ascii?Q?gfBuZlEzMKq8/mtNYLp811Ps74xNU3RQcSH/ZOfR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d65f95-cb10-4a25-1725-08dc3daa4ac1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 06:54:39.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pidZeuFYC7evr9pg5JFm7zYM26fv4XzrMJL7zi+XAf0gnUvx6qyJYjG/wuK4PDPDv0BAE4X6I65KLQJTH2WVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-ORIG-GUID: KpK-91pnPWsYlsZYHM5i7nICYdE5pK5D
X-Proofpoint-GUID: KpK-91pnPWsYlsZYHM5i7nICYdE5pK5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=786 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 06:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196659

From: Chen Qi <Qi.Chen@windriver.com>

Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
version should be the date only. Here's an example:
https://nvd.nist.gov/vuln/detail/CVE-2023-45232

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..5b1353b8e8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -30,6 +30,9 @@ PV = "edk2-stable202308"
 SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
+CVE_PRODUCT = "edk2"
+CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
+
 inherit deploy
 
 PARALLEL_MAKE = ""
-- 
2.34.1



Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B7DC54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 02:27:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14036.1709778455003850841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 18:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g/c5Q5Zy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=379604a212=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H4PZ6016198
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 02:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Lbl7CCcsGYTDLkbUR7
	1U3hcpcTgkfmh5Z/H+8GuXPuI=; b=g/c5Q5ZyAOQmXkirLrQwlrWoGQOmcSvpdO
	1hC17QpGclUbfLODLQ2WVD1CARj0r8HTdDKWyZYY5mrd6tCn20eu6tbqDI29MyZd
	zBYvoOASeafz2McfNjYLhb2wL1DdkFSNMVuBt8bHSwo5FfYIo/JiOitDNkffTgpb
	C/NBd6EziGxFUHDLmQCbqes6NF2SZ+KWH6HGq0f2Pbh3y+4w65q+Kpwsw/aTNstG
	tyyRu5yOwy0HL1rDfv0yNx6Aqm0LJflUdT0iJutObTJffcjMUiLLv1fI6pcQG8jS
	L3130UhExGWgeGRAv77ip6zlGtw2UZU0INKPu6KFkOP4DzJn0fxA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawvpk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:27:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEfMbB2bEt9XFGIRiYos8T8gkHGQLlUV8BrHAx5iH4c0BeCN6TZVthzdUYR3fez6xOCIp/4M05dm8Gqu9jTCkBFI3gC/A2/3ASx+xObz2PnYtiyR5PeUMmsy7EwwCgcN0CBtwHF8NL+X1aa7+J3MZlSQ6EeYyKsI6UfcJBbNGD0hJK1jVm3SPYNK8nuMBzNuWX2J7uwlRWSeqtPLmCET7a8HoRvtdODTaFMXoT9dL5M+uEV4kfVtbphi/LzZHX05mEzuCrqMkI9FvT5Di5vOhq2h41YlRLyhSHL0MCauQijJIBQ3/SK5lGmj16NFr0crDy+L31ykN9mJAMbAEkYcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lbl7CCcsGYTDLkbUR71U3hcpcTgkfmh5Z/H+8GuXPuI=;
 b=ARrJh5lJxIk1C+5ZbzJj8tpcy8Zla/9WVcz0IfImaPQURuduZhQxFqGPOPJjahUUfveRY7qkwZHoXEAzXrNI+TEJqdYoDF4Mm/BjarFj2wZTjuPWQ5UD0awG/05KL//4wEE+d8mOi1h0zujTxuemazJK+L8eoWcXOp+ObN/0mxONdr0GE7p77K2gCqtrJe7CZT41wNr6fvQ6meSnHf9YxpyF8r1yC1rwGyVAPG/TSkdpDKNLmmJBoJ2OUN/9qx4HhkXG+trGEOw43Jv2qLa2G/Jp9UoVR60XMvZqeHqkjKa/dHwer2L21jeYdWNfq15bUlOsiNZeKb1cCBZ3ecLORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 02:27:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Thu, 7 Mar 2024
 02:27:27 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] systemd: use RDEPENDS for systemd-vconsole-setup
Date: Wed,  6 Mar 2024 18:27:07 -0800
Message-ID: <20240307022708.2061916-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e6bb68-6632-44f5-e759-08dc3e4e2079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sfQPe4pw8q4QmennHZpn+AsQ72P7kVIERz9kKpvVv3iw/o9cE40UdwHEvTmTai+uJz4/vWtVRcoEMrW7QkAG+p4ZzhczopC5BM12XBKb7xYvP4vZ1Uw8xbspEgnrVX3K57Y9HaQvMzZ3tUNfVnTEGkms61o5bee3JbM3VmwU02+oBthXDw37GvZhSgPztN+/9638HB33xPJTFwEWDUWxm/u0NT5jHqt6z6lFte+dunrfQ0mmlp/IPa7+rkFH61tu2GcVwsvTEanuNvYwWC8QzSMArJSoLANCA8uWbfDHMJJnyVTiqGQG+BxwNEThYOtM/Szwi0iFQAYp4i4pTzUFVNf5vc7qtWHgUTxXRe90TbmR7fl9bJMjJLy1SRtB4PxQ18z3+sYSFp4TpknHmtBsOMAmQ/D/foBSqaOlkk8e5l4fe3W5WrHHKYHWLXhdLELWC8uvpd8akMKBNWn47B62RWUDAbb4Z8cGlL6yfymsowaytJIvyyTVxA9LzaFtppmQxxqj9bgg/rC6YbdkcqqULYFkenK/FjylPam/9XSNuI/7Qf1IW89rwZzKYz9wHn/I4jGgxB8yoZyqtLPie7o9QiFaAz0tJJKr2QAx03S1a70atVtgi4CUvFw+7pFw4GJHsaP6L//IXYTJMLojYOy0MaVmf27lzwH8om0BbK5rC/a7iDf+xZV8VrUkjlPmxwcdDlY6Sn5zEQhurT8SIE7PGQpD880LeuuUxnr90CAm7dE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BXBb28PZgwsn2L1QoMbzXjeFW2BXiPl6J77mFjPFbcz8rRdpvPJnfHomS4FH?=
 =?us-ascii?Q?Us13RoiAhYB6oaz5WZrpCBr6ojJfss0Hmk6KPFyYXHFb8UMyIjC1WgVLLVYK?=
 =?us-ascii?Q?vqHWNQJkHsjYpc1DSoXljsYT6hKDJuZuL594UpTP8mKH+v5xanPaA4Os7Oci?=
 =?us-ascii?Q?qjC1yMu0lodKuxJaiyy4Cm08Pr5heWRqEF21Pu0Z4Zm1Am6nG5Y/AG1lXgn3?=
 =?us-ascii?Q?SuDRm8tihvEyZG/C2YIQASYKKs01PGGcKoJMl7qx53gVBBXLuvU8IZHJKJAb?=
 =?us-ascii?Q?uSzlRoal6F+uIt0pieMvg6AANbacZU6EU6LhW2v2ldQtj1pusiiYooR17fEa?=
 =?us-ascii?Q?m+t8f03JY9xVOckQWc8qcHtYRXqHzhLuvGh/eWTdtGIwejzYmW8PJssMQ6gY?=
 =?us-ascii?Q?cOIGHBKnHZ4xBi6F6goVYsUlH778u75Z4YuAvaSFshvYTvzS39oJZm+csdzb?=
 =?us-ascii?Q?xTVBVI7FS4nT/wnSNYSR6i/OkPok8I+NuRwZ+A0fPtY48ZOanP2rKS1Hsa4f?=
 =?us-ascii?Q?m3uHxHA6puAgaNGJKVP9K5TbE3KykRnCIB/+NjC+sYf9O5tpKOEpEiND4P6Z?=
 =?us-ascii?Q?yc0QcpTGsBnHxizymhrNHfG5RY0AfrhQ1ck0LMWzUpnnDWRRWL9AYakrSQMZ?=
 =?us-ascii?Q?3qJvkMQVP7MRen3CsSp03MalykVr3y+CIefNdyRpw0oZaWJjucNwLUeaTDTW?=
 =?us-ascii?Q?mk/qrEL6V8HchVNWkF880GjosTT9Vh3LQZROcJLxtQVSd39yhNjuGxxMj5ie?=
 =?us-ascii?Q?ViVaaYFAS9l6J+EQOrwh0cpL+8LaDJZPQ0IVctZscsj/tycc3rogpetuIy93?=
 =?us-ascii?Q?D2Cln2YAF2/sHd9hlfbLcn5qQP0kZGtYB3Gk3NoEto8q8Y0a/HcxXYmwN1h4?=
 =?us-ascii?Q?i/Zo0Ei244UJ24UzaxXbhu0/zLI0irmW/RLzcjcu+tK5mvAHZmCaegN27a9t?=
 =?us-ascii?Q?V02RpSAO4pGhGOkpRKt+7aOcHHEabDCdKSubkee3NLQT3BnkfpGI3L0zx+g7?=
 =?us-ascii?Q?A3RLsMGKUdIncKj8UWHpREwGWA+9LvR+tJ5MOTpjk6qBrt3MYYvgKWyfWbKA?=
 =?us-ascii?Q?3ouh7EiChvN2n9HQhXrk6m1uvNXfs/HIC5NZ/RhRydDtbMBKJDMRYUJJNTPl?=
 =?us-ascii?Q?tnML6bFF3fjDWTYhsDJJGe7NJqqM70oGZJqCYWRC1zk/xHbh/HYloEX6wXmn?=
 =?us-ascii?Q?ZXQSC6fLHX/tYj+ONFzkJTlUsBvZM8tbC4YTFcg0gpWDfJWmql6fYPYTVfb8?=
 =?us-ascii?Q?xV/z3AyaxnLaT+46sdT4JnTHQGp6WbbMMonbouOvbhaIBXlwN6O8FDM9MJpn?=
 =?us-ascii?Q?BoK+8XU3w/vXjyMIO8TNc4V5nfv+YyF/zO/OalwgOK6lQcExt0jtRiWEfQiy?=
 =?us-ascii?Q?SBiRodckcZMHt4qr5j9xBhuCRV6Vg6QAnYpMMYaln00+cIuByzy6UwG0KMgi?=
 =?us-ascii?Q?lME9Z20CYdwZsxcbSQ9ebQUqDbyQIPhDD8hg1yywQNgKN2zFdMebXVVPZNXV?=
 =?us-ascii?Q?qHUTll+gVJeGEnYtivHLKrV9FOLFyPxNVFiQDW1Y7XIMDqxqFJrWouJv+mq7?=
 =?us-ascii?Q?JklAOPt/EVKH/QBtfsX/T11t7u4NadN0ZVQIijcR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e6bb68-6632-44f5-e759-08dc3e4e2079
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 02:27:27.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFKZr/RV6imMzG5FsdeD8jVfm3huF1/wNkng0tvvX/KFuino/v0K4cdocF9sQDzwYNYY4RjTj6GZg/dN7CnKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
X-Proofpoint-ORIG-GUID: xLKE19c6mAFeMlSmd8elmz_tno_keMT5
X-Proofpoint-GUID: xLKE19c6mAFeMlSmd8elmz_tno_keMT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=966
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196761

From: Chen Qi <Qi.Chen@windriver.com>

With NO_RECOMMENDATIONS set to "1", systemd-vonsole-setup.service
will fail because it invokes /usr/bin/loadkeys, which is from kbd.

The RRECOMMENDATION should be changed to RDEPENDS, because it's not
a recommenation, instead it's necessary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index a907d60e84..d6fa99a5f8 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -490,7 +490,7 @@ FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${systemd_system_unitdir}/systemd-binfmt.service"
 RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
 
-RRECOMMENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
+RDEPENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
 
 FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
-- 
2.42.0



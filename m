Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C98CD37B2
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:31:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6879.1778304662968358325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A0vl9lZK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6495O7G34045468
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 22:31:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BMOMYGffJ3XiD1qe5c0VP2hxASV+NdkzGqPbYWSH5Ck=; b=
	A0vl9lZKuT1HH8zSJAXLqzD14tQ5G1wY4UIcv20+sKMV0oDGwKaZM20hvETGDkwN
	FEbEoSuNAK78RTjTe+w2sAc3IzkaKArGIOXwDZlA1CLeHmBU66bY0/X6nDBgZwsh
	zlDfu6kzF0U4JeJW0GqrzSOoAKianPju2THx3xBLMKNFH/gpsstZCVQ89CtnxKpw
	4hGeF0W5EMvUR8QwFReJgWTcn42P7yk8/a3P1tY1+fHXzCt7LkIYdka9F6J0ItTL
	ow/UWLN2DcJKF4aSyhShUzZ9xp15kF9ZXOKlflwb3qKKBgY9ZwgomlY4nSdMaSbW
	TbBCCpW8Bpkdq/roShmnig==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hmn0sn3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 22:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7acq0sfhNCOvFBO5LKVVymEQ21BxeyPSiCyfUW/PJzsAsr+TEWo8NUAOvQ4j253XqPGiVz9tsZ8U5okm38YJKZ+YaATmOe0Kpf/DLvBxUO6tZi8XexrirBYLfnBWDWjeWzpU6If/c9hcTN4nxbS5wib6WJQ4by55ny2awcTSiXz7daGiuaqgcY8q5S55ctj7s9ET0R1Xf6XEQEWFcaburTwalC9Ba2m0R8RP28TaKkhOJlf1R45cnfMw57z4YwqpxeZ0Zxdnc4z5VMtEIGT4/HI791PCvMYs3iRKoFPu+K/057abPsUbYxhzk+20hAUPeCMzPnJT42/qp20CVG7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMOMYGffJ3XiD1qe5c0VP2hxASV+NdkzGqPbYWSH5Ck=;
 b=nlrwRW0S9/NkUHn0q74r39PAlzWBzoqik/FMvJaiTgIdtT09lEgpaiZhf4cJA6ApMV4gDYysKlK1U0x4D3hv5N9/o0Dtxtau+qOAWWyK3gFbjIv9LBJ+y228ldcvk7gOpjCRIIyA372nMuZMJGjlpefeL5mk/QeFRD2BooqzY8Ij9t1jY+eZl+/1nZmba1MsrRJ5EQGtdjiEKnX6KY/Rj8s1mVQ07EQHeKYAWUhx/8XacZ+nsJzppRifioHlH4NU0lMDiLz9YRpaEf+gcIRudbCKCNPeJJa/C/2ag2E5tKvQfqwJHjFqZyvmMKEzdzMEKBjFocpa1tTIfSaLsyZgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:31:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 6/6] util-linux: inherit upstream-stable-release-point
Date: Sat,  9 May 2026 13:30:33 +0800
Message-Id: <20260509053033.1565462-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509053033.1565462-1-Qi.Chen@windriver.com>
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dd407c-f7e2-41bb-986c-08dead8c2711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DHh7mhf+aRLnRQ4Bb/UUyS2H8+jbWrlHyH74FUt2yqAQavf40umvrI5VJolHGgPOh78cdeYAOnW4Qb1E2L+BH+xg/ycF6FgE6JFS0iX9IkQ/WKiswFFDnf/TvgmFB64QEb9LwCKGfRwo9uYKV7AsHCjrPAA5I6UbvVJ6UNsaUJ5rlnniOURdmpvM8aVOLp6AUNH3dtrj2/SVxVNXr8XUeIm4LHQY7WE2hPUTAKy0rPTLvYwOV7XG5VvPFGrqKurbkgJVbPoxjW+Aadt3kSwC/rH2eANIairhkMLidNfLI37jxNpbpU/9GFhMP5VKjpYr5pzhgkGM8Fflnm9ekNxVTc6P/5FlnNV2405b6rSEm9NDg11CvySSGPbHRng2p4/cBjXpocoSlI2/i2soLORh+C4gC/KD0Kpju9Jj0vwSUFeWlFIMcmfrabV/vpbNK5wDEWpHr76+34aUCcO2rhSJxHDxbWKp/9Hieihxqe2CfQA69AEn6Mye4Lk7e1iqvBunSRYr4A73AQxPuEjelAbcHtBOY0ZUleN0CsSsSv66EzBJYLQcezF/JppyyfjIWggqvWBgjeS1J/v284cuMWQoh+DFfmS88X251VkINrobxP4z0HxpzM+Mqpg3JJ/QuaAQdvZ0ZEfEUZ2qcWKIZfsHH1zdlaSykwxT07HPq8LBkHjbfoUyHu7WLTW2OuIkFjGZgPcIIStRkT+fNQaXFThKGgwOh/6nhs++ADi4lbDnjPvkXD8+LGJl4lE+oG3b1CY3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EStEsIs2lQLkr2WphZS83yRm7sSiCWXg7uWcQJGnUjcgRFkl5miTMQl/sBFk?=
 =?us-ascii?Q?/6sNOlcU+wJ69Ec7HLXJ3N/li3X4Sy514ZptJhQAQEplhoSON8BWsUY6luBt?=
 =?us-ascii?Q?44I+y7RdyiwAXIWZCaIfhMxKHtfZ6xOVpD3u4R0ax8Aa+a+PYkSKVi4twnP5?=
 =?us-ascii?Q?xlsTr8CV+rs1/F6PKlKD55F6IwqHm/3ExWrU6B4YtZwKM5Js+XcovI20JUSr?=
 =?us-ascii?Q?b5FJOOZYkhW5uZIp5IL1TQfn55UfgtEgnGdPHgcqlOUZGLk+sAw3sewg6mLf?=
 =?us-ascii?Q?GYTJLfup8XBwUU/8CvEFhtyCKuq+6O3IK4XfgOH7NgqZKkiJKmTCV7U9Crkv?=
 =?us-ascii?Q?j6UTszqM5ykXUmU70nShKRAMZ1f8yfm23ubhPIRC5KZmEC8gFqFOrxQAI4j+?=
 =?us-ascii?Q?3Lx9u7nC+ojEdMA7T/ycZ/h9Hza4Q7ZdNsNzkiNASysC4keFUPBxaZoodQiZ?=
 =?us-ascii?Q?xKCC+BJnETWCKGg40S46DeSVnFzVITWbxDsR5BnatnUnSubfDareshwGT/pE?=
 =?us-ascii?Q?AtJYvHLCOPXIJT9ElKCRaH6nCQDKKnT1u+c0ZMXn8XNN79WZSnhYxaai+vQA?=
 =?us-ascii?Q?FKDPBPGp2xQBlfSPeytFkj4vGmBO9oKhgYyqW9RHVr0CHzswLYwI5VFw0ljH?=
 =?us-ascii?Q?c1oiYaGH39QaaDV3p8xrXfKut7RMgF0nfDmwANbqMrJryF1IVeOpVkGEtsF8?=
 =?us-ascii?Q?wXyYjKL6TKzMwLPB/QtlKMzuBz07nsTk3NcgSzmyVYhqB3NNis83cAugHdaH?=
 =?us-ascii?Q?HsnxlHcHo3KDKc/QvhcCLhGEAcV9GeMU5MCbkqFhaQ4qtYEvZaH5EKh6qquT?=
 =?us-ascii?Q?CADGUTJdixjaYayEFEZzStYHjKjAG/650ag6DApM5EFc1a0uc1Q4ekKa0JtE?=
 =?us-ascii?Q?B08tAMpci9HfsO860CkyV/lc3CjrDSwaJQKBkOo/YmrVZwk0/d01iE1Rn+nJ?=
 =?us-ascii?Q?auRar7c/DR66oJTGphog2eVlck2NKdNknqCII51LTzZ21jqS/vB0jzAdIxkz?=
 =?us-ascii?Q?DgeGZ1igKiSkqWjNwVXZnPW3fUEYgl4OzAk3eqlMUMiI9Al7ZC121xJJCXub?=
 =?us-ascii?Q?yClnFBd7vsp7uLdp/kg88WwgRQROuBBEp9QaWjyrT2YvrT9GxboozoCLFcWY?=
 =?us-ascii?Q?U7jf4IyEffw/5Si75JiR5aA6BbR65LP75y+Om+1+o81HKx3HXW1ZrDXzWzG3?=
 =?us-ascii?Q?KKF/59Fyjf2DGHzsJNITeKO+ThKejAflX2y4LY3KML2iAgvcPbWTjEt16v8x?=
 =?us-ascii?Q?kWatMXBK9TGSfhu5HiIcQUs2tdNnTtzpquDPieoYNyeAhQW8OgmoXpn+6cGo?=
 =?us-ascii?Q?X5iGe9i7F2Ay4xa7TnjZsZ95ojskauGQmcat8mDrJxDhxgJzKvLh7nXpG7Ok?=
 =?us-ascii?Q?ecX/VE4vcnn6TglGaWDUPcY0rBn2jLdP/kUeGUN6hJ4jpn9WU9PVPw9u+hIE?=
 =?us-ascii?Q?VQeFNk8ubWPY+p9CVt/77BdyDDx6VtNb3FDkhzbxJSt7bbDYSuFukSTYmo3F?=
 =?us-ascii?Q?eVTDjkfSi2Y0n1qbfWm90YPB7pAr43vzTSKdexpsRE/nFo4COKY2hfbf4l9g?=
 =?us-ascii?Q?bBN6duNjm94pUjOcklLAIMaceQkp1Wq7WZ9fij1RZzbmJZdxnpt0CQzNugLe?=
 =?us-ascii?Q?VtdxBYL+tmFZOZi0vXXF4eDtz1URuVfy6NBjuVQqecjW3w02Rs2IW1T25qZ/?=
 =?us-ascii?Q?bnuZFEXRX5BRNcuYretQ2wRtwgz3zVCY9ZpC+BZpUMQqtgAjeI92hfaPBRrf?=
 =?us-ascii?Q?7rMO+ruD4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	AIh0itAo3BpnNA8Vu9ogM82gUWTdpepb0d6fgRlJq/TOtxJLN/bSMEvO5yVOrnsM4L0mIzdIHIinXHMtroYCMfRxgm95dgAvEvEyY8qLvOAoNPsU+2yHc27JZBzEfuPV35FOn2xj/h+aAPCxaP4/75ROchf6OijRH8k4+derl92t85vbNiCcufoHt7ytZjjQMHkvDUHe3yyRK1qvZu5pEPwNTiEp/i1sUd8x4VMU/IRE+A16oCnX0S31M04TlUOCavcuZFntjoYUZJkVzJnBbpF0yFkpPnnHW7aqWAOlIp5KodpQNEMWK169VdnQUddc5F0N3c4VHON34LFZDj/Jfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dd407c-f7e2-41bb-986c-08dead8c2711
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:59.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QpcUU3+D9GAUMQ3iAXaCzbCSdP4Gf3WwVvtW/uXVALNRv2lqdhvFcjugLyjQaFhw9dhj4Oj4/fz5UZDoO9H0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfX0LgDRNc82fR3
 /VSFQcd3FgJH6UhHilUMtENP4HEmBc7RsykRY4Z8MOchiIbGSafcRjCKv5cvYnHuuvKR6uHolbi
 hO5el80EMPtzgVQ75DuUeAUMu+R55u7H7NkWytgYddrPCXmkhyadfxnhce9JFH/2jvHC/rE3MSk
 RkrUBbYS2+oglSHdDoGNi+Gd6Zp3THrypAaa2hZ+OOQHP6cSLZS1Qwgb63J5uvCn1kNcTCh+kzc
 za1XA0KGNK81l9nEKT8eeCD7SwkSVg2h2YMxbxrGcpXFK6An27WdLqbDbKO6qqvceb0es1b8ypt
 hjNpOeDbJGhi6/KFn3FvP2GbwR5mfvkqn5XWmWU1dwT96xQrwq5Vo/I2ANMVUZUyFMvOW4KqEHU
 Yqe/nUyycSElRyfh6EXemEzq4WhLIt1rZZqnkqwIFczIFQuFoL4bI5l8xX60vmD9NsklcgehVFe
 QhqKhKzKlyFxwzBgVmA==
X-Authority-Analysis: v=2.4 cv=DsVmPm/+ c=1 sm=1 tr=0 ts=69fec696 cx=c_pps
 a=FRwzarAYk3lDJRtuO2pFeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=cgaqtAmjuy87PsC7WHwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ef-4eVqtizEc2I9bZAM0-Of2FUfWVnBU
X-Proofpoint-ORIG-GUID: 1zxteDg-fjYWO_nxegoKSNdpTbT9uH_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236759

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] contains branches like:
    origin/stable/v2.39
    origin/stable/v2.40
    origin/stable/v2.41

[1] https://github.com/util-linux/util-linux.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..1068e24b76 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,4 +25,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "util-linux"
-- 
2.34.1



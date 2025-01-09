Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA949E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:25:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44210.1736414742653905913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098iIPt026697
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 09:25:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkhjh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:25:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIt2av+xzX5ONtoUbKw6wxH0k1W6nOjDqsqi4Ln4U6nhiyUMlhBVfQyriSGIw0Wf24/H2U1B7gDqF8wf5fqalaIZjw30SY6NudZ5IZVmF9+b55uREzCJ73UI/0R0oWVojglO0Kl7ZqAuo6XYqqCDSDLCU56fK/hzFFTbQeICs1IoAyuaHSi5rO0ytXzbeMqPx9iI6nERPTvdXE4yrS9dHp3o7MIEgEa4EylGOlDrH7cAy4XNdR3Ng36ZJN0/UKdbRZJXaXm+hELq9SmmWgqzXBJSD+9R6fmWE/PXJajzbwSImBa2t+yJyCLrwVxJg/QRn9exmD6JsAmISjrEAoBtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs6hVeT3gjRgity5D0/MHf8cLofUqpo7jBvt8QbdBAo=;
 b=RBxkyx9KEr5q0XhgKcaTxDEtrfvErA2g8+gG7UW8X56WdB655vL3Xb4ZZQV8a+4frJgsPixn48CpB3VhMdMCcF5TogZoSFAXO5R50e+lOtWQ2zgRz0p/Cv12ufq2ocPpVh0cLD+s+ysoWrWndPhWOD/xwgzedT4yg1RLTKMHgcz6k09e9MUiWDBsK1qK9ZBcDa/eRJYFEdkwaHKkUhbyyw8IBxT3uPZwOqfBZwOU+JIIUkWIGIIe9PFeLwjpawZr5OufrcpvH1wknxAc2r/v772cyzfluRlSDAuboTi94SdRGkKAX4ko4omwCwBDwdopv37W8hHTEHRWsVPzkYrOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 09:25:38 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:25:38 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 1/3] rust-target-config: Update the data layout for x86 and ppc targets.
Date: Thu,  9 Jan 2025 01:25:19 -0800
Message-ID: <20250109092521.3921275-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 578ed102-d7a8-4128-adff-08dd308f9481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/cfgqpj5rBh/E/IgNYwyENo80SI6OHVIhhESC6+fxK1jhP1DjXxlycu0pjzj?=
 =?us-ascii?Q?t/aGwiklqO8CUGGvg9AFQi1x//H4TFr1wSkfvUnQ5Q+DUuYtoTAlKLuGRcR1?=
 =?us-ascii?Q?wREntyT6qVJCvAS4emC1jOOm6ZFwd9KWIUiwA8q7I5y9U/D8MUuo/T3GxPyC?=
 =?us-ascii?Q?GiGeORkKBwc2B5X+hWBEpCXZzaLXvZtOzeTI7BteiQFJfjae3ymPZv0jk+oo?=
 =?us-ascii?Q?42kb4N6Li4+W7SqNyn3M4M/hlyBbRRefrOgBPQcBS6TNB4t1WBCqosJh+bBS?=
 =?us-ascii?Q?djaJ7nUvt2OzGi2O2uRp8KrK2V6jTkxRfXVr1Pe19l1NCezqbhnTL10CnAMM?=
 =?us-ascii?Q?fUg6GUIGipXGW1MliFEJ8WECybTRT00n9e6oKy0UM90Tw09E9SfJHXL3xRsn?=
 =?us-ascii?Q?qh28YLMTvW3jNcCd+n9A3mMbYPKkyxlRQ/IysjJwsxYXQgnn2HpgpPqKFyRM?=
 =?us-ascii?Q?EjbgBM+XEuQtpktl69TUxdoYqYQNdjgbTktqjzvjdl2gMx6wOPSeUz5qeTWZ?=
 =?us-ascii?Q?AKGGTcFZpUQYj1uq+Bs0Z9uZc6yUQpNBTNgZP2rEmTB2qTJbhfi9JagZfnMr?=
 =?us-ascii?Q?DTBQzwrQ+8jtGqeaG4Y0/SPjOhG24S646X4cau6CvdmZJS42wLzwDiUH+oFH?=
 =?us-ascii?Q?6aqR/VOXfe6b6O9HKYffYM7QH5eS3rR3/JS6e4oWDmGj69+70ZElF87Ct60q?=
 =?us-ascii?Q?dPhMdIbHveGu3uzuATrwI/263c2SO1tj2FYtNR4ThYiUNZmm5ZnEI1SAeYbM?=
 =?us-ascii?Q?OASjNYg2sfJCNQK/8pb35jqMQAM+2nUW8w0RZWK7CrReLlyZDdYlERgOdpe1?=
 =?us-ascii?Q?XQBNh+a/CDY3o5e3EHQ6SDgJRu5Vn4gyykZB1r20E30joYlkENYwNBycus8q?=
 =?us-ascii?Q?sDoALVs6sExGl7z90pSo0+bpjfWQGsE+QA6CylbvK+b+p5QYE3fcQrCw8Wti?=
 =?us-ascii?Q?OOp1UmSN1ZHB/5gKGko0IHGVrjF19A+1i2hnjrToE37lMggCbKpC0kZg1byp?=
 =?us-ascii?Q?90Z0hwSlSJDSHVu4hjoyhxmgrUAsCrFGnwaomp4ySDZabup0oKl8ssstZ4s7?=
 =?us-ascii?Q?j3DSwx/eO/WwesmbBDoq3vfVDLuWdwtwqgdJVJ/PVG2qQx9ePVNXffqZiWR0?=
 =?us-ascii?Q?lTqT7SNiD45Yks8V7plRHulo11doDDqOqykNkQ7feds0lsPn0o5Cac/ZaFzV?=
 =?us-ascii?Q?OYChotdMcRmg6sg7vOHBnVGkxcx6wWQ7w7l25HdUR9KMyQEHMlhmoSrSNwzc?=
 =?us-ascii?Q?ZJQDI+41MYO0ekktzmKkQ4vkedp4Cs7K1v0N0XdmHOuMMnMfTDw8jSpvZg9t?=
 =?us-ascii?Q?+YI8SpCrMtC8YTbDtztCiZ0k6fEVK5E3mjSeowJ0M+CjJirWlhnHAeRD9OeI?=
 =?us-ascii?Q?3mfySbnuTUubYf8/MUSO3r2Gy95T7uTCDant91HoUzJOncIoaA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wkc3QtOv8w5MRKjkcOhUvlK50pURvI0lYh3X9mifPF9Jo+669nIhd9MOg6WT?=
 =?us-ascii?Q?Io+pKScoPL5Mou4l+mNE4Er5MhwEYVq1Kv+n18qDvrrbo85PHCsNEoUIoq0L?=
 =?us-ascii?Q?NgWqL5d+Rvs/iFCQcTRWp4hQdXHgUGBU+hzNgX+GjIE4l6BAOLglesEEGtCy?=
 =?us-ascii?Q?TO8q+wxfkJthA7BKumrlOHGyYlRNIeJTp4rSVgj7yWA7RnNQxGylyheTOdFV?=
 =?us-ascii?Q?JMGjGZxTzGQwPL9NBWtyBdxAojXEcDfUCvRfVAV/Pk0vsWGMT0lVe7wUnVN8?=
 =?us-ascii?Q?vmnM2tydR/G3L8F6IDWLnVSjFem62/HRNzEDd8oF4p0pOiM1eQzxA6Ekks8j?=
 =?us-ascii?Q?Lr76OVulC5RJ76APdHeNA9N2VEpxFrSxMbKaJPmWUl5oe37n08ipiGi73l9F?=
 =?us-ascii?Q?IMOJ3CLGTV5AoLTUKeNvinp5iUbKz4gfnfMfDEzl5xU+czNJsUma/aHXBhZF?=
 =?us-ascii?Q?ClQU2prf9M7KW8/NDKAwTta0GyMGYuwO409qjpqYbTD3eFqQeNYFfYNf4U0R?=
 =?us-ascii?Q?rDXAbFa/SMkn9L6WuybCXv240jRiHg/97TUMz1p4vw6zo2xxzleUvbFNimxJ?=
 =?us-ascii?Q?yqnmuI67C0E5AOxTc9SCLpDezkG521Jh+R+j2wJBoaeOWx6xKiEjyiSNYZen?=
 =?us-ascii?Q?lxrTMKc6FEllM+6GxvnGxMfnrQloC+G0cTdwWDNqJK458Rgo9zmDKtUXK43l?=
 =?us-ascii?Q?5aJ68HYSnw03ugAFGF0ZHIgdYQ2vqR0Us8Of2sygZQnE2P/AFcPkL3ouXaCX?=
 =?us-ascii?Q?JELuevXDBrVECjMfye4TDA7si/InUvt4HOefoptVPz4QO9+tv07jHphqP/1B?=
 =?us-ascii?Q?WC4UG8KW4E1s61iSefMpcm5S1+hoQPQjDSKY0/yZ8RuYQrulycL936Xd2bqq?=
 =?us-ascii?Q?E41rGwSO2DgrulUZIeIgU/Yv4gFwknrLZHgQZo66Z6wIAgccy/suJF7Ur+AR?=
 =?us-ascii?Q?Li00hhSKEqxD1Blh+2XdwOFNZkf5mNtiB957YEvTBpLZhYM/dz/2ylosEi4y?=
 =?us-ascii?Q?zba1NfeT6nZ7nxPNbpOuYPD83oWMHQV0DRPxB4cza1ITLEEjo15JGaB132IK?=
 =?us-ascii?Q?EQT5F5eO5Fzltys9OW2ApJokRO23cN6W4sZPk59wL83pDLWtZA1V6Uf3OPkt?=
 =?us-ascii?Q?OZrXefDftqrF6Uh+h2T23fIVtK4SnmB5I4Qwo76NGG6rrWfjN8qIvmtu3LSK?=
 =?us-ascii?Q?oChnDXz0pLD1fnHE/3Sx4aSIg6/4k41gJ6gYuUslBj+Bf5jO37xO9zkWU7sh?=
 =?us-ascii?Q?sOcG4S4v5bu2oqsEIZjzaDTWrNxuYBoYewnnId6rZrsWcI6s3Y8SE2FA70RQ?=
 =?us-ascii?Q?gSZaPh7EF78N9Q47mLtybcKU3me4gX4/flLa22LEUZENB6EtAu6xunZdqcnu?=
 =?us-ascii?Q?3SvnJgBo/OF2Io052vw+smbTlNPr5xmVc+BY5fJ2CxpFifym4pjG6vThvOmh?=
 =?us-ascii?Q?yA/jrTde8T7wbOY3Q8Bm6R31hBZUW+2jJJ9CapOKrKc1g9GTvxHAZXOONHfA?=
 =?us-ascii?Q?AmX09BRBPZNnbYi75cqnnFaeK08o/6mzWLY07XMJzKgHXTiyDPwfNCFzrMm2?=
 =?us-ascii?Q?1QoyYFjj44UX3LbG5Ir2UR2+3NhC3nc77AKVHiueNY2Y5+FPE6kt7cuhZToo?=
 =?us-ascii?Q?0cdpgKhwvzG1QANiRvznZxk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578ed102-d7a8-4128-adff-08dd308f9481
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:25:38.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCR/T7w/DLtf1aUn6BhO6UhJ1mNGr6Mb6I3WCVpkciw1d5ZLi6pwNuTg6Z/ht951CX14vHWcMK/y8F+lXMEircRqs3uBgJVEXhRaVhVsconwuLcy8i/OVquPzpmGMBgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-Proofpoint-GUID: QU4MYL21CSv6G-cpI0KjYvflfyruTB6w
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677f9615 cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=6mtmzNMZVtx1r3RMtMcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QU4MYL21CSv6G-cpI0KjYvflfyruTB6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=768
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209616

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The data layout for x86 and ppc targets were different in rust from llvm.

-----------------------------------------------------------------------------------------
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
differs from LLVM target's `i686-unknown-linux-gnu` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`

error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
`E-m:e-p:32:32-Fn32-i64:64-n32`
-------------------------------------------------------------------------------------------

Rust commits for updating the data layouts:

x86: https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
ppc: https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019

Hence, the data layout for x86 and ppc are modified as per the llvm sources which fixes the issue.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 399c13db26..7518e5bc01 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -167,7 +167,7 @@ TARGET_C_INT_WIDTH[x86_64-x32] = "32"
 MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
 
 ## i686-unknown-linux-{gnu, musl}
-DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i686] = "little"
 TARGET_POINTER_WIDTH[i686] = "32"
 TARGET_C_INT_WIDTH[i686] = "32"
@@ -216,7 +216,7 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
+DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
 TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
-- 
2.43.0



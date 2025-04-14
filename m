Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765B9C369B5
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43222.1744608917318403648
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5K7tc015814
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hkvj-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdoHwKNkxsKBZk09ZXJJOVzAObi91CeYv2KdBr3wSrPQV20FivMMbHonUTWMnQeH0Foxvg5naeOL5CvL2VynNMJ6ToWxwM2nImOVojsj5IgIUqqEcwgQOsySJuT3V5wGcGOKz30vtMhtdYNLVS3SnslfS1PrHELmk9yWl9gqtzidJpxy+8iKmgz5kNprr9wYWpAt1V3yFUJlmuzKSXzmNmr4UW+iFtxNkDO03mjMahrwGjCyhoaqR2IxeSHT3nwsoox1Ra/ZEhnlRcgdG4kuDzVEFiuySHO8k5zS9+yX1HACqlaPrz65hJ/e0Br1ZGXsr9b04SfB3Js7WHHhpZSniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGdYfzPUKsc8jzEn3J/UMDA+8Y8oif3arGkXt/Hh9G4=;
 b=F1nbOeOyC6qVsmZsD+IIKqwKA/1raO63/4CrMI1twfDC48NMa9UWh4oppt66hEyvogx8hhsHABzEhGLD0UxgvP5EGfT6pL2Si/AWxxfLtBlZuwTsc2c550FRMTSgg6eN7IpkkoWQutxHXdoNINhcfVl2Wg9YVGIXbbXRel3nMKPvC0m5u3ATR29hcrIALj9NMyhhE5Y2X9qwAMc5j4bgSgjmrBAyyKhsEdcpEa0ykUQSRxkixncVzYVhLISSrVrDXjL2Bf0putIIqBIu8KKoe/vZ2hS3+5yM7wRA3fFO9DKt67es2zTY9BmGrm2FWiPR4iSJyhnqPca4C/V/q+rezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 05:35:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 05:35:11 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 4/5] image/populate_sdk.bbclass: drop qemuwrapper-cross from DEPENDS
Date: Sun, 13 Apr 2025 22:35:02 -0700
Message-ID: <20250414053503.1180029-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414053503.1180029-1-Qi.Chen@windriver.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF066A3CD44:EE_
X-MS-Office365-Filtering-Correlation-Id: be62e653-f489-461a-ae3f-08dd7b161fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9LZAOxEknlH/TVDk56eb9t2CC4LsPLTgRzhMGfFEZJl+QrhiAtGEb5kHPqGT?=
 =?us-ascii?Q?yA6XeaPtbpjkyiBoY4t6J0SA9a8B94sVXpbvPB6qV+uF/TOcybHKk77OLR8W?=
 =?us-ascii?Q?L5px3JcywPdTFTS+SfWXRH5fSaTBNcxGTxtEeEyVvad7UxiVEDk2Z8EiFnJV?=
 =?us-ascii?Q?u8/UkHm47HN0+6oNZW/gubqR3c5UYXlHltLyq5qeiOJnJW4ShcWJe2qDpjj8?=
 =?us-ascii?Q?IkcCe/pnZjOx28x3PR9EntnMBTe3AV5d+b8AdqAfukYoMweZdF/voOLFZyvu?=
 =?us-ascii?Q?KRGmk45sHxRJCQVwWSkkj0Ys+7A7275zyk3/aHzYme20+yrneb6z61x88eJE?=
 =?us-ascii?Q?EV06+hEFSTVpo9UjyNtipaSoRsQ6rybxg+S/2ojLzn+QXXVo3caUBpzW4rjr?=
 =?us-ascii?Q?6EQpyQokF3wxCwKDyxeqnRLrVBABEiBy8iQpuwijyWbkh93hVAKyE10h3vBH?=
 =?us-ascii?Q?agwJrMoBpQ9zY8hqxluygp9h8c3VsdiPKNvsrcg/z7Gj1s4jlj2+tHsU3d4Y?=
 =?us-ascii?Q?3ZTERLOpfRQi7LBtXlNFtxbs+0dPnCiTh3CcLInRNLpTdvhap8QwGVZSNdgG?=
 =?us-ascii?Q?+oImk15BUVRqceW/6X8td7nMpF1AwUClqOGz6teGioH7pHcD/KyS6d34HBFa?=
 =?us-ascii?Q?emuo3i3euyZfuHCxam99Bn9QPQKM7KRIbspRAPx71qRLotZu4SPNjyPRGQ+C?=
 =?us-ascii?Q?DC++IHiC/HCgF7V5ln0PPDwu4YNtwNryE91hw3pYzB3Zheg0D3UNqkeioNew?=
 =?us-ascii?Q?odkX/JwKxnuz3a8ypsD9qXeiCYhfWFQIgtfVySXQk4cU8iVF22RkyvNjivCd?=
 =?us-ascii?Q?+OWCDtDmWL0PamlUxeEF886DZ550F8sQ/MP+nYPHlRx6oD4T5iXhum/kNgVI?=
 =?us-ascii?Q?g6oi/0Pjo+RZck0Df7PpVWOBLNmvAuseUtm3LQ82Nop3rSt0QzQ4mlDMS60X?=
 =?us-ascii?Q?EQ58fxeObrqfiAA4mQKzNSIzy2nnTl9zV7T/I2jZnZHDmv8y1UqZzptSds30?=
 =?us-ascii?Q?GJ6CJWI7gBIW8L/AHjxBVhAtUNjCCicfBbUj2BKodXFkGhX8jAFDR0EJILtv?=
 =?us-ascii?Q?+GJQuW9fKsBAr3DSC9Ux5mW5IojG1sWd4lchNbBOvihcOUgRe3asAMee+lZ+?=
 =?us-ascii?Q?k7IxcchD8Pq5WUOq0cQ0+vq2laZcG1mlyorTjghtPU70jL18xbo546l999+I?=
 =?us-ascii?Q?TVrPuer58uGEoNCtIi2F/glRzLU2IfyWx3AvS0qA3vDeNux/91FvO/8mBXLY?=
 =?us-ascii?Q?gyNKQyBwfzZtVEcw1s+4ym+CrJsatqWUTAINg+O7IpP7IzAIHE/dx5c6EbTY?=
 =?us-ascii?Q?2FY9LxOwSjMYASPKD9bm/tkVR5qQ4KAZ+FFwuSC8aFSmLKcZ29zJYQhfPCAu?=
 =?us-ascii?Q?DmLRPFC+US0NcYAMaf3n2lR1E9Zhn76WoWyFCjo/N4XTT/iPX89ess2BhczC?=
 =?us-ascii?Q?Z7FLhVgzIqPJIP6n6xPuOyvMvMejJv2OQM+AkyiONEDvjQS8k86sxw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y8qqzdYL4Vh6U0ikwd2434UV+EUhYxgQ3Q49axPHgh0ppvn9aMjJjqTuk3wq?=
 =?us-ascii?Q?A0p6Z/tdY5lPLaPtOtSR9qaKnDsG10s2cV7vCPcri7NHOHQdq+7a8eQHG47O?=
 =?us-ascii?Q?ajwX78mtzQdtfRwNSMkQGVbmt3i2NLqa0Nwq5Ld+EU8t1SBTCNEjPX5FLh1A?=
 =?us-ascii?Q?EgI5ipk5UqcR7+KVXQU2EPILXUp6Y/4utlQI5niOnCdMLKvKBTHkBxFUZKrH?=
 =?us-ascii?Q?OEeLYei7F6UIqoOBtsHsRIEZuwe/jzaiiX5Rns6toge3TANl+dku0IvFoQ4g?=
 =?us-ascii?Q?7Mv3yn8iUfjBMj8WPU+j3rkVfoNUtJ0Kfd/IL49UXkHi8PbfiQCs5XloAcs1?=
 =?us-ascii?Q?ZZ5s3dyU//0UPA16WibZZJsfvyEWLx8HuFjr8mZ5r3igo8I6cFbvon0STDgL?=
 =?us-ascii?Q?YH7qwjgvEjKpK8n+K+8/DmgvJpwhbdCsKsGnOOkAnEK4a2x+raZBjhi+xWvy?=
 =?us-ascii?Q?AXgvrK4eCyUnl3KRVg9zU1kSygqbe7CifWvdSveb0c2LqIC8MS+Up/rE/xSb?=
 =?us-ascii?Q?LPCYencHNiYrtoRXONDSH10RMLLWI+FnjU1fCiiAluIIX4eaQTq3Ef5+20kn?=
 =?us-ascii?Q?eSIlLXSrdQ+Ad9qETyLzAuX2xdyT7QzEMYyCubzFby4n/OXcSpu8a3gHyl1f?=
 =?us-ascii?Q?RSSHptRmqgy1vTrbjTwA3buVmudPxoN96jPG033LQe3WyD6TlR29N7tDvhJm?=
 =?us-ascii?Q?c63egHx9/2VDU7IT0gAMCFAFplCtil7PYq8UF3lRv3Fmp0vwedYpCuTmV+eh?=
 =?us-ascii?Q?hqSbHzFquzKQ8LNSJHRai1iEHiPbTraGHuGenrjWIQbMWIBBsDDWPJSZiohv?=
 =?us-ascii?Q?2JR0YlGIYzr86vns90l/5Hmbi9poXAHMcJpfX1m2oMf5lcbpEHcSVqYva1+b?=
 =?us-ascii?Q?0wzT4HTJZtDcLvWH/G1O+ef18ruuyCsxWBp9fFBPv7Cla0TpH44svSrlhQme?=
 =?us-ascii?Q?c19FmZY8MT5nLd8gQ2R6VTV6ouVRuOCcDzIfDFIBAq2bG9orloxhC7qYh7k4?=
 =?us-ascii?Q?WrpzOE7hMXE63XTG/EWSU/Rd9fgjFxQ+dGKFAfNcWkMURrBT59Wr6He+41JF?=
 =?us-ascii?Q?Uab4u/1lA8bknE6TsSUGEYw+4HledBA2vntIjHlTn/EUC5vuzZ3msWaYYfTT?=
 =?us-ascii?Q?UiCkxlJmkEM3zi/gnIG9FEn/nmCdz1tgm8ez9VZKbbSqG2h5NYgaDhwgEykV?=
 =?us-ascii?Q?An12wIslewb6zAvAtRwwu5mA3qzA5b/IkNw+QE8O5+HnasKqeni1C77j/eOr?=
 =?us-ascii?Q?VsEHoWoZ3UGt8hpCf6RlVhUu1FD6Ge4+JkGNQ0wN8rJAQTz5WvSLFjxHVKfQ?=
 =?us-ascii?Q?qH/LPwfJNEuzuaRgDkBsNUaqIaxeyvIID/nG2HlxM/7BI550HhXltuGGa+p5?=
 =?us-ascii?Q?uUzAI3nOwag512sjvVNyFU9yrrbiPGmUFlfpyouy4Wc8fr7y2VCgA2RZipTz?=
 =?us-ascii?Q?yCmjnoZUEDrG/U9zGENzzurSaj4+/1IrsPqKfhbh30SYVb3LulzVssLEpAFh?=
 =?us-ascii?Q?PwSFQGjpDGtsF++dbUecCTZO0Ljjtb6MQ0j3BsnZmT5cDzjear1Znyn/ZnEg?=
 =?us-ascii?Q?UOb+JpVQrAgRqjnojrf10tPwf3psTmJ+iAr5dOrIW6eMBWBlqEeuNG0axY/I?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be62e653-f489-461a-ae3f-08dd7b161fdd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 05:35:11.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M30nyYWgw+DrDXy5BwdIC+sL+fta7of37RN5FZWAYc9ByGYlHJITNTNqk/KlSv2M7SDjJkNDR5bGC9GEpPcyqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc9e94 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=20Y_Kt9r-2Gad0TaIGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t02p4blFMvodjTic1gUboZ2d6XiWHzxZ
X-Proofpoint-ORIG-GUID: t02p4blFMvodjTic1gUboZ2d6XiWHzxZ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=997 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214795

From: Chen Qi <Qi.Chen@windriver.com>

For packages that need qemuwrapper-cross, they should have it
in PAKAGE_WRITE_DEPS.

Now that we've used 'qemuwrapper-cross' to replace 'qemu-native'
for recipes that need qemu-native for their postinsts, and we've
now mapped PACKAGE_WRITE_DEPS for nativesdk recipes, these
qemuwrapper-cross dependencies can be dropped from image.bbclass
and populate_sdk.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/image.bbclass             | 2 +-
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 378d3bd0d4..dc4ce5c0a9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -30,7 +30,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks"
 
 LICENSE ?= "MIT"
 PACKAGES = ""
-DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
+DEPENDS += "depmodwrapper-cross cross-localedef-native"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL} ${IMAGE_INSTALL_DEBUGFS}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 PATH:prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index f111466b4c..238cb1ee6e 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -109,7 +109,7 @@ python () {
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native"
 PATH:prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
-- 
2.49.0



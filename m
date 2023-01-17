Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED49C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 04:07:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.189263.1673928411294259697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 20:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ozZuXnPs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0381132260=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H3rkkZ020362
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 04:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=PPS06212021;
 bh=sFLhI1GWuXoShtkN78DERdC1Ia6J4R73lLYOkbXXw3Q=;
 b=ozZuXnPs72De1+CNwNaCeQA925GY+HVjDohU9qo762ABambl5AikjapvP01dWCxvetJZ
 rjfTGJ5eTrTtMJ4H8dm6QqDHF9qTfuMCpXDjoK5ZpqQHhcBnUSVBtrH9GbdA2iuwJm8W
 J8bI0U4i2Fa1O6Vns11QuT6M3SLJftPk/BynAk/0oO1Lu9WDnLifls59xOQ1ZIrVZmNn
 kyYgksVMG5cNEVJaWA92FcyUL5ZAYBxisKTLl5R5DtUeWDHrkLDMeBnl+E1hGMV5VurS
 tGTEnYzqa0VgTE7fzpEYLJ7gLtrpoMPTeLV2o+qPyAQwScKSR/h+UVCo+zx9F/rrI8mk Ew== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6jka4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 04:06:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGww84TMx12HDs+EHaQHgg/ua6iqCtV/JFt7OP7rO96naOcH+rmTuTygnW5mBLq6TOuY0YW5jpeTH6tS2z4ugisqHN4fRhgC1aur06hpFzHOCQ1KajE8H+NXdLNPUmVaeNpw79fDDh57tcceBGqpvdYDXik7Y0GV+59FKBLrEYLBq0PK2eABnXpPKR+ZeDbuHJ5u1JuVE5VCpx80ZkmmSJfmp4lBslbQ+YNsZ3WX9PZuJlM5sn2EMbfvUBDmpeILHH1ytm05CUV8A20poTKOANxQJckSqxlDaxFbElsI2c0YlFPN9WOSiLd/tOrU1hz+QgFMcqpufkG5zEhOBWHYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFLhI1GWuXoShtkN78DERdC1Ia6J4R73lLYOkbXXw3Q=;
 b=GxQX9/q0Gmhw0KzQMFgkE19zQlcwsW759ShVbcG4hbSP4nC+KyHCjn/r1mvy3e0UCbgpWyJ3KB5ICGldjVV+AwqjKzPSARqj7ynXs7GTN7uBOY4XDbgJuGrTRZCKtF5KleZa/SAVO9MD9IlhuE/NiPa3KwiUoibIlIrZWmwakCQhQrI2MhoS7I4t8y0pluuneaNcHbG1TVMkVoPHo6QAxdlVJLda6jQeJVuhTnSF8FxrGcHh5ztoflepp/pHWQEPVLb0lQoPe49zklHt8WRvR270hPQ8nMRdcGwqa0yno6EBwU411+k+Z5t+1y+CUOfjDHtzKzMo6zU3cCa5jyDr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 04:06:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 04:06:48 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] rpm: do not export MAGIC in SDK
Date: Tue, 17 Jan 2023 12:06:31 +0800
Message-Id: <20230117040631.34966-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117040631.34966-1-Qi.Chen@windriver.com>
References: <20230117040631.34966-1-Qi.Chen@windriver.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2c0a39-bc1f-4310-e6f7-08daf84040f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oTDYhNRIdxGPj6CyePtR/PKlabZiOpjEV1RoMaFPuZBqeYqEtk60wgL3W9AhUqDnXrlD+qgGSp9YzzG1Pmw0hdoWfehL9oOWaB34Hwf3N3jKj3F9lZOgC6I2qbU/7mRlvXCBk6VJ3CH/OxN80aoryD1qXAwwPPtzecDuMQJVx9yRAgHyGsVYbd5iNJQZiFuU5wURxL/MUz9WJFgAFYkmJJwyUKfv6Ejguh2pjk2ODYXC0L93bbXuLglzLXXyNoLAgNQnuhFevWXXGGF8xp8oU/LaeUIkZpyT9dLwe37mdh1A19mOMCcE9xAg0Jk75n0lcpSoBYy+eRftSaOZ1REod0n5+STy2FxsxWGrkNdicRYn0V4RD3lACTv4eTColtQVjwO63piXpvQm2xl2X3NMWiLCOZLyX5pEDfQtdIukeowufckQ0/bbE1fpoTtl6ZR4PzCNOGYnkf+G6LwmIZD1dqdOtYbwot0upwWynQ/fDL+JSwA/6FaTiFwehjLa/a8rwyYiUukElr2CfS+GazpENCO1NZ3B9O3sk174m1g1lonpWA2PWsIDpccZezcU9UN02b2LGxE2jCsSUvhvVTT42GuFNsSwS2s0xiyzU1qw2DEM63r6NIVyCY4G7a3mLynVGeIEgkXazhpVlvkCv7rksGP0TVCWk6uVhAYdf0ZdqmDNQd6Mkz6KcTmj82scQlNATqTPJdwPY5DtsakB4K636w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(451199015)(83380400001)(36756003)(86362001)(38350700002)(316002)(38100700002)(8676002)(66946007)(66476007)(6916009)(8936002)(66556008)(5660300002)(41300700001)(2906002)(6512007)(6666004)(6506007)(26005)(186003)(2616005)(1076003)(478600001)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1zqOqYYmogOOKroEY6IqWfpYkJpVeDEF5R7zXEbVYw+4ewu/ZBuCL4bZ96EV?=
 =?us-ascii?Q?6OqSO4sOFnVjQ0fZPpBpQ8GHG8fNJDKVhn62PNCU04SikuviCZPzHw6BNy+e?=
 =?us-ascii?Q?Xt7nQQ/ESj/SDqv7sMxB4kCsyS+vykYPnv+WFCi26GgOMaHbWPMAgUz4+6t4?=
 =?us-ascii?Q?lgesh7W+WbitPqAX7Ty6s6X5eb4At4bJjNAiBT62Q7wkYQWbHaRRhBI9nYbH?=
 =?us-ascii?Q?EyruU29z0YARS5P8ftD5rlbk3/uFMjBiv+66fDhqymZML0ZU05uxx1R1krre?=
 =?us-ascii?Q?8D2LyutQzo/pKy67Z3PaFPoOfRg4YnXDNL/R2kvPm5Xu11iRUFFuV2iBRZQT?=
 =?us-ascii?Q?nQKplDOCTMwozLbOWB4ccb6NENz3gzYQCub7f6MzkaMVoGb2alLz/BfWnniF?=
 =?us-ascii?Q?s/NgjYcJDIqACvhnWXgmVG7q+PgJciUo3bLaLzL8G4fKuXHUQW6hAPGY1Nua?=
 =?us-ascii?Q?T402O45PupFf2dxj07hubno5Gf4t2bFB1qOWe2kAuttf46BVAMMSsF8BA/GY?=
 =?us-ascii?Q?yUme0urqZqwe/d8Z23VSt6IaFCqooB0YxBpkliE1p7KIw01jZokBK421k4Cg?=
 =?us-ascii?Q?N71XlyAIw5v2UV4HypzJEpm+hrk92pIY3TX345OnQeO2kEhox+RR+dmJPOfu?=
 =?us-ascii?Q?8XIcefIBKLliOPh5ruSoKMhZ8cgu+IeYDfPSA88k76E0fiWs7UfGm6RBXzTs?=
 =?us-ascii?Q?3x8s9x1lqcFFy7TV33It7Gq4CKbtczxtcu6mQYXpygWLev6/rhc+PKsUpbCf?=
 =?us-ascii?Q?uuUZ09Bjd3cb0iYJTOmdSO1qrKS8eCq41S2rNonlVTEZpN8xeAcK4Q5y3TEL?=
 =?us-ascii?Q?ZwcgTq7qSju2AFvcz6jbMTNXvlOPZkZLX0S3dESWu7/UiV64Y3YrlW9EbItW?=
 =?us-ascii?Q?14A0uHtSriM98S2Y8mWme7dEDCE8Q8ssvXUKEVmVH2R9nBaguAiuUFjtlYd4?=
 =?us-ascii?Q?Oy5Sf94PFfrDAzxcq7AE6a+uW12grGOc9VwVZ13Y3i286dLMoeo4L8btsWwk?=
 =?us-ascii?Q?FOxfFePv6UrPB2wX/+wC0gBQaEJuma05i4q0MZaAKD850D7DEa9NQAexvGwW?=
 =?us-ascii?Q?FXB/kfQl7530dSIN6JMqS1oRnSSXasF4mH/5Nl6TFOF74qh9ek4TIdrfKsEj?=
 =?us-ascii?Q?PnryR981fnYbqX1FzLasN3NX2PVytEgrdDsMymdtjTGPnm9g0C6GGQN463wZ?=
 =?us-ascii?Q?AHW5srJ+Wpi+QvdCZH7Tv+Xo1UpcrXhMwdyY9z8CqpJUBZP1vAeF/gy5JAv2?=
 =?us-ascii?Q?BwLIPLx8AYnNbEfoNc+k6N/JQV3Wa0Fb3sNLSqrQeCdgzYRy4vONiGBRcLmY?=
 =?us-ascii?Q?/Z8btz+0tZV/IV2rS8/Zl2krjPixuZxyfrjPpSeW+VuFBpGaDj7ilfycPKaw?=
 =?us-ascii?Q?RSyeuUhv1u+qhJY1/xlrEltC8C/LjrWMdM9VtOHRn+Pw0vm6pXmbmrD13ENZ?=
 =?us-ascii?Q?BwFE0WUtSiIXI8Pyxhd1UkrPrnJS2fePs6XsrRhWoE66DFCv4WtQHL/B//Gb?=
 =?us-ascii?Q?LidK3pQ/pWeMiOaaIjW/F1qzbutwz//ImInYaIyK7c1gsO/8eTicwVpszXfe?=
 =?us-ascii?Q?Yaw0YkxhQV22ikG8yQFkaf1b9Fj42aZgHdmR6aWwzW0Z99aEj5CqfMgaOR8E?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2c0a39-bc1f-4310-e6f7-08daf84040f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 04:06:48.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BtvaHghkDrAKHmlBl0eJqKTlizH6nk8+EvJoqfAwH+Yl6G/aIEnJyZfyFeDnuWnvCr0hiTN2HwCCUCsypVqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
X-Proofpoint-GUID: hWXfgvU-CLK7Fm8VtsevsTl0ZqSnAfnB
X-Proofpoint-ORIG-GUID: hWXfgvU-CLK7Fm8VtsevsTl0ZqSnAfnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=650 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 04:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176028

This MAGIC variable is used by libmagic (file), and should
be exported by the file recipe.

As the rpm recipe has 'file' in its DEPENDS, its sub-packages
which links to libmagic will be automatically added the 'file'
runtime dependency. More specifically, it's the rpm-build package.
So in case components in nativesdk-rpm-build package uses libmagic,
the nativesdk-file package will be installed and the MAGIC var
will be exported.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 8eb0ab207e..61e395a9d0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -123,7 +123,6 @@ do_install:append:class-nativesdk() {
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
 		export RPM_CONFIGDIR="$OECORE_NATIVE_SYSROOT${libdir}/rpm"
 		export RPM_ETCCONFIGDIR="$OECORE_NATIVE_SYSROOT${sysconfdir}"
-		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
 		export RPM_NO_CHROOT_FOR_SCRIPTS=1
 	EOF
 }
-- 
2.17.1



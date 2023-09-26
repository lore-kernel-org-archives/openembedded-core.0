Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A33CE7D277
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 10:15:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15702.1695723342015472314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 03:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NWrpxaC7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7633c6df23=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38Q8xr4C020271
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/e0sa3sj/qZT5OjNDK
	E49zoJMlBPRfRkswkkE+3cH18=; b=NWrpxaC7l81PmZa7XXcIa7/UzTSHuRIKkE
	+EmTSorDt0EfQlELR2GJJeKL/I+juWijd7ppo6YvKgqqS7raIKXTTwubR6l5RZu2
	hVXJo75suv106xOxa1XTsgSRFBLbo7MohUYthkHkVCEPPBRwNaIkoNIbsURZ770Q
	MlZ2iaTz6CuCK49UNIB0OLrXHA+RxlmVZwQOhXlj1DyNzC9pg+xzVkxWk1IXq8Nh
	mRvzKo5lRlcep6anyXcym0d1qD0Shd7Q36q+2brwIUx1w7hkzDNH/m15lIKJNV58
	BbEy0Sx1tUnuOIM70bdbkdtmNPlIlP4EZtQbIcwUwTxy6Nk3gRAg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06ak92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:15:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKye5WGUhKpTL96gYECvI2VPDr6u9Jne+MCLklXYQ3f5CmVBGgXg8lbCKcLpjuj2OmI2iEik4D50MtMctWZjv+L2B9iLPDeJog29AZnYNEl81sdzhlYglZDsdVMDiyTU/Ag7M8eMqFJAKlK4Ab1+VNhha2v0Z0q9z1rQWF/JpOH2e3oXJsuYVOorbShm98RtpAxYquNtHGZZirjy1slqbeR+MlTfrCMWgnxjmwWelQ2PQb4JZQkp2yhBH/QgzpSo6y2CwX08R5HI5gwrFCXp6DVyKvuuruRiDTLK6WxKr8kyJ87lpeweWfZc0jVbQeQOS/K8wc2/cDlnHIT9SFU19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e0sa3sj/qZT5OjNDKE49zoJMlBPRfRkswkkE+3cH18=;
 b=LW6JdiPKH2T+65LH/2fs9yCOroFJ/H0NMu35+YWwVy2X8ahfhLLTPj5z6HmTrFASvD/9X2spgTglY9kWgziC0j5HCvNqEO9p6bQfAp2b5nCKIamY1833lhwtgH93d8XfODDGWc7M7IkL+rVZQa+KVNJeQrmgiMu3AIIwkeuT3a3Z2AxYnQW8g0WuhH2pebwAlASs2Gm/fbDJ8CokxvroaC7NG/fokKLTl0foPCLUApkwu56t3RXhLPylDrAm2pvOa07hhfnoRO+XPg4vsdliD3V/ARUe5Zf4w5EyzMY9kAPhJ6Er5r18biqVJBizDaDqku1NuV8avZpuR8zsLLfcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 10:15:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 10:15:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-find-native-sysroot: avoid warning message messing things up
Date: Tue, 26 Sep 2023 03:15:29 -0700
Message-Id: <20230926101529.3610385-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd54f23-19b8-4b48-474b-08dbbe798892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BRfgbtApppb/4z2RSPo3r5Xy48YtERl57E7cZEGvKyNqc/RdBNmd1PN+ABPcAiJkEXU8UXzUXTVbmUtLRX2UPyV+SatJTmbpaS154DSPrNcWlRH6ICxskNWb5IugYXSesJldEbAB4bOKPIxtAQild+i5D27RAtfL8RZYwUSbG84Jo3dKd/zZ/P5zX68JnLiq+ZcC70FN4V/CdBeBamTt1CYDxakhurL/Y/AJ1kl4BxldaOf0j8sWIgGW3Vbe++Dmq6wbJhyZ3rYMcXbZYGD0IELu0HuxuJYNoLVwx50LvzaCt9UFhgnqAE9Hs8lWQ+9vWUs8Mg9VbdgqFS1/NYAXr39ObE/WSTqKYN4R5i2xJ2tIeQCpRQR//Mwyt99O01GJsAC5gF6WmyBnH//yfEDPvrDuO9eo7tU09T0AxPGR+WveXq8Pfzo85RuWzeY45Jmc1OrF7BJiw4kmUdzBLPbRcu7Di73d6p21X+igB1byZ8rj6Q+leKWrbq/ZU+j2+iJLElIBoJ+mr7+L2EDJxPbDCuWkzycdJeJDOn96z7Sdwx3h1GV3B6T5WwsKDDfZEdFkOqLB5EvR86QEuT/RaRJ3DV3N2aruGxNPtTAnD0Zc23Sw2Hqv6JbYSstKeVNhpp+H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(83380400001)(86362001)(36756003)(41300700001)(66946007)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(66476007)(6666004)(9686003)(52116002)(6512007)(6506007)(6486002)(478600001)(38100700002)(38350700002)(1076003)(2906002)(15650500001)(26005)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iehsDV7TnXzs6JnEsTK2w1jxDT8/GxVwiPMNqeJqxUXLnkmcenZ+caJz2t8d?=
 =?us-ascii?Q?E/6Kehkd7sNAkp+RZllv+kvXtQZghDL/p+bxDFtKlB2RANIXji5G+RNNOe71?=
 =?us-ascii?Q?uKH7djxAez/RuApLyTrgDY97ts6fxaNud0KqV4t4kHljfGjFhYPdc9PHn30h?=
 =?us-ascii?Q?hqFYRwJlq83SfXmwEodf03zTSq4I7xB6YqF5iJvw2Pow2fe8a2Lbl0e58kMu?=
 =?us-ascii?Q?AgJ5mHvuVSTaYaUKIWQR5D54qDdGCiG2c/2qnILdXAvgL52e7H3of9JH+Q9i?=
 =?us-ascii?Q?2+Vx1HUlmijp0KZJuFncM9RbUWGy/N7prMwyyy/8M4PcaKQwSaIfjpYTK/tb?=
 =?us-ascii?Q?F9nxjL7lu8i6FqJqWMuhr80+0RyFv9jsy25GywFhIDrR3QaIchW6HBPMEwjc?=
 =?us-ascii?Q?29pA2TC4hsjKQLF7hylSaKPwDc8AbpNnHjn6JOl7RfC0Qcnrl+MjT9jW0eR6?=
 =?us-ascii?Q?1cvCS2c+a6bfyVxI9Ra+Y/QZ8yrrob2JvjTl0DtUAmuEc/NsVk4PtwjeKGqV?=
 =?us-ascii?Q?w2Lh73+9BCBP/SQFnUZmSNorQXd7bmK0DDjfSrqviV3rqCnmo4LughbtVo9G?=
 =?us-ascii?Q?+7p/W6jfv9JaPSnozoOl8WYmeytf5FjWTpen72BaXMuuCT0685c41iwtjyQd?=
 =?us-ascii?Q?bG6xtVE8qYV/vOMYidC1uuzkMc10+3Ydx7woIeWQzJYhsxARA4YQ1l75ElVG?=
 =?us-ascii?Q?pspWww6BBROTmMt1pfnbkq4PLBeAbW9J8F3J/bCPG3wxJZqPdetNOo4SYu1I?=
 =?us-ascii?Q?T3EfXj7GTueL/XS1hQF+eCBlaVURu9MSKIG+FP+aqa7qQ+mx4IBu964/HNz0?=
 =?us-ascii?Q?kl3Uol1uxhwa+bP8GhbPRTKrJGo5bZLxJ+LBRgf0VdLrQxEjZSPP3vt0zU03?=
 =?us-ascii?Q?m/6pLajhLCwmDcNpkvZZOGWWdP6LDPcIk5rN3jW81+Qwd6f5vgBuONFryrDZ?=
 =?us-ascii?Q?BtRNBSMvGlWwapJu9TokeiKejbkMJDMKONHYIKyVQB7HUHG6ks57EUKUCnrF?=
 =?us-ascii?Q?bxdhqFE8VuJsdlJdHlyJVbwzX3dMEViPIK6xj5vxojMIk/GsMXLCmFfOKVtQ?=
 =?us-ascii?Q?mSnr8QKGAx69p/16KiJABF5EsMlOJSgtCmMfpijV8YkCLLqn8iyIid+gL1LT?=
 =?us-ascii?Q?C5x3PdzhWdza314oO7Ck4sBJ4c6mpuXQY/Q5TsT3YVX00YmeyftMZAlG3qoe?=
 =?us-ascii?Q?t8n+c3QErc63i04FnhG+JHgujco8we4/ngSOD2AQPe7j6YfcEuDG6laOEqAi?=
 =?us-ascii?Q?UdWMScBUzKggmv+yLbTVTNVyzOxvSR6EDkaBuTZlNSOSkTr6bzU5TITe/MEm?=
 =?us-ascii?Q?SfExnzsIWF+ItQDIFp18rM8pxbAN3vG71CWB/QbWkn2CxJMDU2Gv+RLifc5X?=
 =?us-ascii?Q?QbfSeMO/aJQ5ThkVAVicSBrE8lGSFQh1ZxCO0ooyUhGfu9lmz5VSIRPnl9qM?=
 =?us-ascii?Q?uZGn1+HRyHYI2TcX8IQLWSKFOV30VWTDBi2sl+16bg3KRJC2/wKX+4KX+A6F?=
 =?us-ascii?Q?5tFbsHFsBVxz7U/G60jD9/UA461arDMWFaeZ9NRE8PGyk86q9xOT12hlj+uK?=
 =?us-ascii?Q?gMZnFBm7G5ovgpy4eSVl9cTFwHlYbGua3CkWPaNaWu1nZ+Xcofi3zmLuCrt8?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd54f23-19b8-4b48-474b-08dbbe798892
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 10:15:39.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOnTcoWUvFvp9DMhGHuweCALHe7J+kWDRFdOYh2oiS0IA9+WjPpl+Q0mUapvmg0H/08e+8FM40d6YGHdC5ipuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-GUID: WPYlAJfSJJENcAx_A5_KLO1iCcGOFRih
X-Proofpoint-ORIG-GUID: WPYlAJfSJJENcAx_A5_KLO1iCcGOFRih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=628 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309260090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188242

From: Chen Qi <Qi.Chen@windriver.com>

Add '-q' option to bitbake-getvar to avoid warning messages contaminating
the actual result.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-find-native-sysroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 6228efcbee..541318b461 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -38,7 +38,7 @@ fi
 # Global vars
 set_oe_native_sysroot(){
     echo "Getting sysroot..."
-    OECORE_NATIVE_SYSROOT=$(bitbake-getvar -r $1 --value STAGING_DIR_NATIVE)
+    OECORE_NATIVE_SYSROOT=$(bitbake-getvar -q -r $1 --value STAGING_DIR_NATIVE)
 }
 
 if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
-- 
2.40.0



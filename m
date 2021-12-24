Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF243C433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 10:07:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.43826.1640340470567039910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 02:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GUzlMz8L;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79929afc47=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BOA7nJ2028535
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UKI4rXtxLSWjudgnaIhJW9doeYUjWwX44ovzJ58TnZ4=;
 b=GUzlMz8LAJ22GTjeE3G6TDzayo3OwMGahTX9UJQGp6jnO0CXzug+QySlXUc2cCutPjM/
 NVJSJoJ+KXdgrVWtZtMV6QMm3EEEDsmOyyBoyfrhqwy+sWrA43XXuVE+7UisYx8He6NX
 CSPwvvHM3Sg+XlWO5lIeITfmMKDWKy+DY/qkoZ0g3j6NJJXSoYg4eR/xuYqQU/R9rmfu
 yexqaf0beisgEXfVTLrz7fF8irEX3FLBQR8UN9NsExrrt2R3b1t3xNmxjiSB+vNXCAFv
 rI0D2xPkn3VcGNZJ5rfl9fegDlFqtisxb+u7RSXKMkCAGJRT311Re4lDtdKn5hTzcSzR /g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d55mh06mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 10:07:49 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BOA7n40028522
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d55mh06mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Dec 2021 10:07:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icBVj5j37OYEUNzQRRgO8uIoy9b4T78fC+Uppdc1rh5A7PWZGJf/9gbwKIri/Dg7+NDC64ld7eq62GvNOP+l5sXQ/egklnI/UjT9onUdD9V5fkxR4tVKG6ZUylMLOqDWPP49AyX9kA0JC7GEESaO8lkNfMkIYYS7ASDAr5yGxta9/5xV5b4IeihqZOifhUsb0r6QmhKy/OrOgqELI/AZA2mvOTKzIN6LQjPUTq/CFBep961T6/4YcsgYzQCMqMR8JU2A2OqOTc/8w+52haMaBkd2ry2cezBL/w6EsUVs8JHg0edFVFXafrIVoGQBfH3b97tDRmuLel6k/GvHkt9bkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKI4rXtxLSWjudgnaIhJW9doeYUjWwX44ovzJ58TnZ4=;
 b=NVxDr27BSf299h36EC8OOD7kR2ac+a1iXGsNnuEKzvKrGteBIZxVBBRHls3c15mC8ffz0z04SOUTr5Xg02UQWIi2c8EVPIkZs/xR+ghveTmkxr1XhYY3TPuJjhIQzn2cfCDdmXRqKK5jUZXvSB0PLlHU1aBQc/J8ZXF27cy9nRTTIKki0ne9X1lFuEsgWtaPfptWTGFlon8QXQQgJn9wZl8Zy2/yDSLtw7EfVL+p5bq95+pRVbWh1El52cX54hD5PlHuwIUYxOb9fpFI4zw6ijHO06eiu0WVdbZ2rKsaf3Bh8P+BIrShQYLwbNuIaqtkEOo+Fq76wwRSeojh4YT6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:07:47 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::75f6:fec6:8c13:2cff]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::75f6:fec6:8c13:2cff%5]) with mapi id 15.20.4778.016; Fri, 24 Dec 2021
 10:07:47 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2] arch-armv8-5a.inc: Add tune include for armv8.5a
Date: Fri, 24 Dec 2021 18:05:17 +0800
Message-Id: <20211224100518.3561765-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbebab1a-283b-464f-cb40-08d9c6c53c1d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3245:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3245900AF112316CC028693DE27F9@SN6PR11MB3245.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LDMSyhLXtVMuhXyXMRsmOyfJrho6Gi3MX8+Z4L1EpLDZX28QUuzPNKvwHtrEDjgwQKzhO4oIRav3JaXK9Xhsv2EeqSSi/yfCdycToVKPmMbtpINK8tjL0iSdVIat2iDJ9SBas88Sqvq5dEVY7F9nJdya12NI5I7wa/nY7WidNPpC23XtwZsvzHmCbamIF9EMAiC4kj9BVlMlCX85/f2d99nO3yd6jrE+ypr2tfX+iCfwybXLodMElMsHfg9h9iL3oKCU7RNdqMOgA4XrZSw5EVn9e9XE3/+L1zjlNxQZEiHad8OR6GQll8UltkcczkVNQwGSj23KDG0k2nL2lULAUOFLmW7nuhehZA93N4A3WIOXbaLHqKmL48XF0woy/MnJP2HNNr3iFNGQn6lmSYO3DOBYFlW2jzxDtND4iJ1dDH3Klp14172YHIc2HlqidcjSS9DIV95bPBBY0tlAKiZCBImDtHTgQGsa+7Inooma/OqDHVjC4wLqd3/p9vt29MN/m40zOHl/K9mSQ+3IzIY/hWGtgecDHaDQkrRQR8Fu0valdegch2w/qq2Ac3wjaMKu6mpa6DoU2paZ6N5xEVVzVZ3EkGjexXEIP2/xXenXToRUtdDVWCvSq76sTlhFJUMCH2sOPVdsP7cEwLHAF04H3N+816XXK0LatgwkdszhTa7vHx93U/R+OtbAaRf005dyIFTDt/Yk3eg5c80WZS30aA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(6512007)(66946007)(6506007)(8936002)(6486002)(66556008)(1076003)(26005)(508600001)(66476007)(4326008)(52116002)(316002)(5660300002)(8676002)(36756003)(186003)(2906002)(6916009)(2616005)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OlTvdvMEIEWpU2Oxuwwb+kic1BUMarxVjTptWC5g/OQNtSZQFYLlcVdseJ3b?=
 =?us-ascii?Q?2U/NMU/xCdUUrpTh4/aIkIMxkbZbItt90DsH14OJS/s5mIV0FumQRBcGqECE?=
 =?us-ascii?Q?7vvsBlMCrCDtudNcC9y7NzIqJPB3Dai2lyufXD6dvBZZJsi/MLXPEuMIQUGQ?=
 =?us-ascii?Q?GX+evPi6iCj7yXaguF8y14MleObYZgOX95Gm3BWuhkwMiZGG5MQbmutY3aE8?=
 =?us-ascii?Q?s/7nGiKGo6Qi1LhoIp4rrucnnwuJyGPkbc4vCNmjuQ+KzJ8g9UvaBP2+p3nn?=
 =?us-ascii?Q?INxC4NoDxMuZTVhmxax9TMVLlv2E0ZMbgy6KEjoOhtCfVfvTCCGoQERpPHqL?=
 =?us-ascii?Q?+D9ZEJqEmbHlSNXLExC2HsJttEEcsSv0A5UfdnSbCLql6p+ImuLRpH3aMHXx?=
 =?us-ascii?Q?pMoJBWLRhRTdreYe1unBVrVxfJNM4v1jFSsbjkQQ+G1hTF+3+r/55dRDiiR/?=
 =?us-ascii?Q?BXvi/nRQfGLw4WzjZJ8EjatEBwHMgd/tx8bS4v30TFyFC/wXPf0ptDAQN3hF?=
 =?us-ascii?Q?82H/V80tEtgp+Kc3mmDm0iFYoJKNawXfrSDqcJt7Jppifab5wQwD9krw3to+?=
 =?us-ascii?Q?2eF+QnTwo2yQkCMlfNm/sl3NB2BWLbXqZBNeCTJN0bARfa2yw9vQFh84rvtY?=
 =?us-ascii?Q?dFfjClGS2gRq6/g1arEHg7pXrn0vWx7MRj1rIChZL1YDBsp33TcCmY0UNHMI?=
 =?us-ascii?Q?9IY0axMF3ec1rhlemR3J5BDeU0uQuca5X1yLAPEpcGQM1yJaFvhCmz+5W64t?=
 =?us-ascii?Q?0T+MAVWZs8JvzgqHccXAdMpzfgxBgdjwF20Ox8rebNHsX/oLyeKmPPwH60jC?=
 =?us-ascii?Q?7etGDHWT2iVdZgSe2DsNILuwd72Y14gSJkgBaX8TmRmDMytcClmeURsobwEV?=
 =?us-ascii?Q?ACCDNFTSNxx4RI4gY/CV2ZA7owXLQo+KbGq+GikLRRWx+9I/DJTCY/pJ+Hv3?=
 =?us-ascii?Q?N0YjbubTL7d/AfcvVwkkvUudwOHwONGqRxeV4cdzre243OMbGBIYD839EFWk?=
 =?us-ascii?Q?xXTtsutVIFoH47yKekELNF3oPunhLx5cBKg/FTbwh2rMeEc9vEYyPJyOsu58?=
 =?us-ascii?Q?2lRZ1aN+4ZthL9v+dGJeUf5A4EcQaBHfHe4iml5+G/qR10EkwiSMLGDiaAeN?=
 =?us-ascii?Q?sZLW+R22/AqhV1AC57CmZ7AXQX7YPJxARUP8ldyW/dGo9UioyPih/8/7+d6I?=
 =?us-ascii?Q?yk3FCVdnkFezlDMeidQBgQhWpuCSLD5ADDdZ7ZMV+vg8mqV8Qa4xv4vxnTu3?=
 =?us-ascii?Q?7v47VwBbWtKIukf1gEsLsbnnD1WSgSzDt+UQOR+LMF2tBKVfl70jfB6emW3Q?=
 =?us-ascii?Q?E60/UVKv/F/u3OG84xcW9a5yx+KmbSf+cJ0kpn34zt2xYp7uxIUxLrqx0TTK?=
 =?us-ascii?Q?qPQxXM+38IWt6mElb/Cj+LPKTejj0jojKQO6EgN68KlhUaQhD1CFrZ6+1sxp?=
 =?us-ascii?Q?NMZPlgHLc1ct1tJJnGKKbvwLt7owX/sMnOG5+SOOzxix7WA22MZh+JBOS0OI?=
 =?us-ascii?Q?BLrTlkCyhN10LWAYdYuI/Y6taDHywlbyC7cT75ASry0aXg1XNBb0NHfKSL+X?=
 =?us-ascii?Q?gw7mJCi8cStWmSB3NC6rAINHqJXF7HmI4Qeh2KZhs/IgOrRlc5bEg+xpNU82?=
 =?us-ascii?Q?nYaVKXHUZUok2l8FGt2I+6s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dbebab1a-283b-464f-cb40-08d9c6c53c1d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:07:47.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BE54h261VQo/FJH6SlrW3iERHn7fNyZOSj1CMuy7DDcgtaP+csR/a/8lunCrhuB20P2+VRlRgZXPEPvbcLp9fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3245
X-Proofpoint-ORIG-GUID: hD_guHoYJ6eFNnKhH-7fSHscFDOFf4id
X-Proofpoint-GUID: GU7khoLN-86Q3CVtkdL1BXdFxsKBHuRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_03,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=437 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112240049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159997

This adds support for the armv8.5a architecture and the crypto
extension.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../machine/include/arm/arch-armv8-5a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-5a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-5a.inc b/meta/conf/machine/include/arm/arch-armv8-5a.inc
new file mode 100644
index 000000000000..a1bcb7fb9a16
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-5a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-5a"
+
+TUNEVALID[armv8-5a] = "Enable instructions for ARMv8.5-a"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', ' -march=armv8.5-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', 'armv8-5a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-5a armv8-5a-crypto"
+ARMPKGARCH:tune-armv8-5a                    ?= "armv8-5a"
+ARMPKGARCH:tune-armv8-5a-crypto             ?= "armv8-5a"
+TUNE_FEATURES:tune-armv8-5a                  = "aarch64 armv8-5a"
+TUNE_FEATURES:tune-armv8-5a-crypto           = "${TUNE_FEATURES:tune-armv8-5a} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-5a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-5a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} armv8-5a-crypto"
+BASE_LIB:tune-armv8-5a                       = "lib64"
+BASE_LIB:tune-armv8-5a-crypto                = "lib64"
-- 
2.31.1



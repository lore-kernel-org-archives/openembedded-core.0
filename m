Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31761C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8362.1786578564165100360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O537ITtO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNj2bI4005569
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=c3e9YLRB7
	vz52hO0iJ+DJS3xoFNhhkGCFriW4eazjLU=; b=O537ITtODOkmpOdCd2lxdzSIV
	+YvjeDF2HdNFO7sjz2P4rjwrErbFADpC2s98yZ6Bw+49D6HOrrvLb3VlwtOb5CzW
	b1KXx01TBvHnnlXPcDZOo6YDzQmXy9rrFyJhnIfAQXhzNzJjlJFnLBfet0IEOCqn
	VBRCBHr2s0u6cgC6r0rjzAa2vxwNGu0FJkcMkkzzpt0vMz6JkNanvSgZdUqava+l
	nnmlyOsLMLFySmUjQuw06/F+ahcJxQEMuCwkYehyzlBPLau2jtcttkvsDaJthff4
	d3+eEeiJoRNVKsrmhwCkOgfizQc6RQs2BwKYbbGaVCKe9qp2ooJNmEDRN7XRA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021138.outbound.protection.outlook.com [52.101.57.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwv4n0-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:49:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVKs2Rs6JD8IfSyL+qxdfAkRgrB0odbU4kSecCx/qAp5cvLm2H8LE4bu4QixA+eGxxp5FD7WyivnhjrvgFuW0Ot81iI1FRPhcVsrUiMj7WzWXI01ky9T09XZNHu0d5WDOJ7/f8+G1vQGAw9cyZ20fCs9Ge2KHSGaUfbbkzlOE1CtT25GP523ci7liO+rf/FpjPi3y8NpN0a0uJVw0JyzXDH2WRvL8xQgO7o+REr9AeHM3nZuACznry3igMMOa5rhbx1RphKNOMzJjtGbzBojTHCEJbd1+I5rVHG3GFv7F4vmsM01koDwI+fiLKTLF/ZGvbtQieT098+s4ZugPYNSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3e9YLRB7vz52hO0iJ+DJS3xoFNhhkGCFriW4eazjLU=;
 b=GOSh291vIpzSYfzfnMETnNY2D8A+moocCrtxRWt8axHQwXqbfaKxr+oRixGJwNwayj1uP/wuWyZoZIv7TVLwwPCpY5CQKzncKI43JKjJcImdHRd168VtR7sUmPm7ELcGMz+9NMXsx904Wao+7Vwp4k6GTz3CIOp8a0M6pv0IGWejhYJMTqoPiZmnUK2znkhbmaWV6GlKZrlzo8RkUdlocHB10qTaVSKqsZaP9uCF/NbLzpmehHEfkRmg9lreTkvUpI1RwGyeETi1O2132CwEVfoRvX2bHedtl6nd2BocIQceHuUaJTbH/m4tHFa3inVEAEX7PNCrEx4sxE6p8YgXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:18 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:17 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Date: Wed, 12 Aug 2026 16:48:50 -0700
Message-ID: <20260812234900.866436-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: e263538f-f974-4ecc-c50f-08def8cc527f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|5023799004|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	DQXJ3vop3sYa1yHqp+wOtutu09jhIdi9oE85zsL7+OlrleSB4645RRjMK6zvujbUz60+oSRDdnhlWHmBpZ/k6xZ4Ju46yDG6byq5H5Ux/IYkf8ymBMuXYbdRo+55elFBBCgD5ywJBh3vg412NeWThEX35qr2nkCIHno7yrl4UvCyWoOxiQynL5RGSOk3ux73BrQnDQVCq1IMnVgAj+2PjqQLEUntR9kTF0tTFeotPHl8jWKsIcfYDHDVVIBy+NabVbpCBafdg0aEIdiOM5Pq3YUT1XxRO4+Aw7dsZRospyRZQWrNEguTb8K+BsaZY9rJVRBAxZKdUST3K+NET//RjJ6X1JcdqDpOwN9EhCzpKVekt7wwgx988Ydxx8ueu4bOqy9HyYcXs8je4ofdvNZIOva5igTAKdV1GU2SdTlV5Ssu1haLMhGtu0azagoOmuyN2B2AxqBoOdmve8CxGCWmOsn/aSIzgrNDfrkGC4n9MoslIkfJaRysWuEnNg3hkBQIv4QTy2+XNcLkg7+vdfLYPo3eKqNSfUp1X+8bDImg6ObyLRbR13NyBZaIA6pG4NEENJQEMPNL97q6N5ZVyiyxVBJivSipGCE30bp3zsNgly68u8XcgWwQf28JGkmSLtU4l9D1S5Pcx0j24MN4H1CA5MRmXRJ2af5KyRNdPfkA/G48Waq8LgLYcMADquX78os4HFg/Fbh41yt7nNoM1tXioZ9qEl+RQSbv7LhQBQDhaY8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y3H/aBxXESUo0ea5Jae1vzSQiemOuXnbB4yPZEOV+o/ChmV2zXop/pT5UGDx?=
 =?us-ascii?Q?CtYjQISiI2+8fet4IWME5QgKqSGm2DHm/HGcyEAR3EVwqmLevIg1nUSEtbwC?=
 =?us-ascii?Q?GmPIxLYOp+SCBwv5YtPlkk5zXnjDgek+LMOtn3HSvLnckp6OR0/DG1DFLbdF?=
 =?us-ascii?Q?hF3VORWCdLCI9enHq1mysfJp7ZeO5qgXBknWCnV2XcI9K00EwllDeuzc4P4z?=
 =?us-ascii?Q?VBL4kfW19oGIv7tYxW3wJDHw6Tehf6BtrUlNKbBzOfdAU6htNzG5nidXTlia?=
 =?us-ascii?Q?CblTfJwyxMOAd0JWvagEljJxEYa4H6WWh5n/vZEBPrg2Cl/sMZLXepWGitP/?=
 =?us-ascii?Q?EBmCdY3YQIIrJyDBuXR3rK1eCBsmFnLwZnH1DK4LnheKi82c0R6aY2wijgNZ?=
 =?us-ascii?Q?LqBvJRUH2SmUHJI4BP0YggaIvwfa/Qpy0XkHHpcaqBtxhTg0x9rPMKoHbtpA?=
 =?us-ascii?Q?8EKH8XEu+JinaMcRHvuLluIBLL3Yo/9sSRKR8HmuRUxb4IwyzkYWPOwmO/BG?=
 =?us-ascii?Q?eXT/bB7fbz69z68w4oApTePiwnHrVkUB4Oi7WmxtpBRJ6uLkGfZBOAA7DPLa?=
 =?us-ascii?Q?+sb0hq8QeWz+FsJR0qEOY0k+ZSMLNaD0JEd5oGEOF5ckP+xmr48ymERYLR9K?=
 =?us-ascii?Q?h+D4pH1kcK/1INtFoCDh0JRPALKr7box61xPOiU9XHboufN3pWn15/b7YioE?=
 =?us-ascii?Q?+gsatMkK/+34Hm1Wk307pQdDsaN1Ea13QxlFRZLT9p0TK+6+kfWMn1hk5RLS?=
 =?us-ascii?Q?prM7BR2ROBjRMbALPMmvh4cCoPWP9fz7B9KRUbIpgkMCKajgcUUOnVvRI3AJ?=
 =?us-ascii?Q?T66kw2dKG18hWXrNjgTwhpEuOEDJl72Qkb3dt0IZJUaU6scWCqamyZgMuRUZ?=
 =?us-ascii?Q?zWhybpKOiPzaHL+XSddH7LCaD9x2ZKL444+g56rTsiZS+8YUNq+Q0O3J/OaP?=
 =?us-ascii?Q?xbWyXQ4QFCxaLrLep0YqOqZro1JjSnQN6IU7b9QSbUj1t4insEPf/6AeXCvg?=
 =?us-ascii?Q?07qUCtZl+votC8TyD/zaCiGgJPPLeEFXGfDQsk//btyN76h+vpgsZVbX54qR?=
 =?us-ascii?Q?uSzWqD4/ltEHsvNARVQj3Z4pFK0GUM512Ou1E//rjjuKBgvXy13Bvwb8FcoB?=
 =?us-ascii?Q?bYXUvq/ZGsCPjLeW82LPUQIJXeL7QgsZbb/VDGCIE0FhRq9YW30Sj4/Vh2Lf?=
 =?us-ascii?Q?Z1ioEoqU76sSGc+LIDqtV3wCeQ9GGA27fGmH1FIEz4ih0zS7r4rnt5Fw2dbC?=
 =?us-ascii?Q?p6+SPZcSX1X1tzf6ordxfWWBjbx5/xW98fXAa/ennkr5bSZOiC3hgT+9B8gF?=
 =?us-ascii?Q?zYvvqZNLXt0XoSq67fXsH1aGBcua8spZ81Od2JxQ1vanwW2jYCQAyUV+aeuR?=
 =?us-ascii?Q?lOnh5Fe4SK2L4bQm87126IgB0n5sWQHvoIK+7C3v0ZZ+wQYLitwxOxOZ4WZ8?=
 =?us-ascii?Q?BbguzX4mL9e3zojT5iPnSeearUInGliS2G28fxFQpsxW4ougnpGTndYQyz4u?=
 =?us-ascii?Q?81p+XP4jph23HVjXZmt6Vl8CHaaDhyR/XY9ba6F6cDkNO1+fGHmMKgPIF9hU?=
 =?us-ascii?Q?pF646+/2ytlCakQhgGSsEYwxu1xnVv4LMigJtUydsM3lFt64I+YINvu0rbiI?=
 =?us-ascii?Q?QJ+YUYq/2SIzoEK1CI4tT8aJzZqnPiQdfMiIqSP3LtolftKCQ7S2Y4WpyZ3R?=
 =?us-ascii?Q?JgMVCt9y0+miFfbywILaHVbPCg9ILjw28KfEbsMdLOqKvPYGl4821N9iDm87?=
 =?us-ascii?Q?eYc8av96lzUN4ebighsVi4kGLogFjZE=3D?=
X-Exchange-RoutingPolicyChecked: 
	NwJ+IVzwSCPGQbEvJRLSIi9IbSYVi16aO2V9tAoFcZobtEdk6q1prpKzcdd5vplGIxD9HsJEnYrduHSw3CMuV695zK1sCGyKNJsnu8lYZitbg8pgfL6kKZnOnyeZHUMR8y/zcTvaLk4vOzT3NXdUrTLMwn7A14pyykrlUI5cmyfmbcrDIEGwnOemuAk57LCFZTVqzO++ES5+dz1+LYths5QPVdUo6Yo4Za3RY1kHndCxFeWKnBia0cXnQqBnVjook1oE7lDiU0+Y18XR8DeBHvhTjKlfeYatla+I70VmcRZ3DjwneEC9bLOHO7Nmhta6AH46BwXZlUIIDocuoWvlGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e263538f-f974-4ecc-c50f-08def8cc527f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:17.7873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goxEpEz70rWV5Rco3msmY9vVEbSDbB3a0sVbedXXX5y7cJ0VsJ51CFSIV+Cqe1k8pHzSA3Lx4F+vubMGGyC/7mbz73shhOOyNlkTClFeluc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7d0682 cx=c_pps
 a=i28SWj9gb4XoQK1xikdYvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=KET-q-R6hpJHq7B5zCgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXzFUlKfWA3G3P
 gtB4BU1i9asD/NF4A526bU3MJ3XxAoSBrGxg0NXtVnC0u+wJW0PLZ93jNrSEb3HQCr7jmyH4TK+
 DpB8JWFw7NN0LjWWC7f0BSwm/JfImb2xRi3wGJd/ssE3zzK7gwcO
X-Proofpoint-GUID: g77BS7Mse4J9PTP3oUJYw1wFROVvCMPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX9DI7Fmp03BJE
 c625pIOeiCaC/Oo/4N6h8gDQPFFJ0KTDx4AQJewvFS/fW3A29qmpe8oW+JduKhqCxtZX2J1uDkV
 qlFi4c3Zs9aU4E0ZChDVp9pGB4D0cY60MYO3Kj+rrnokj9tO0VLJJd+3za265Rk3J+izqDAspR4
 dInf4FFfnpsY3ngmdnLrgnja3K7LiG+Ybj8Y0DJgvkbyRRAylYC2+PiJBp6l9EjdSebYEE+7/Oy
 KmPLRWpT6meiCmXKr7qxZSLF2qfTfKD1kTpujfT+odGBF8fCQfEzywAOc2+nPY/40QgbZ4832SX
 1SZC5sQvfX3+/ap11/lwYY5XX3j9iDYYG39PCXKkBsDfC8eIhpSOQS1arrNoAJ4Fg3Cuil7FBJy
 vPxrxVnFazJwWScRhGu3/NsMae4HgSq7QXDfzf9gcDx37eECD0q9GxBX//YovrMrB9Xvw1VDXnH
 wZR5XwTygtyLgV5GWzA==
X-Proofpoint-ORIG-GUID: rmMJGbhMYNctFXVsUrhcCrCNtGnV7-fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243311

* V14:
    - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires"
    (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppressing
    the /usr/bin/pkg-config emission, added:
      RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
    to the pkgconf recipe so it satisfies the auto-generated Requires without
    modifying the upstream rpm script.

   - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
     RPM 6's internal dependency generator auto-detects file-level Provides
     from installed files, so nativesdk-pkgconf already provides
     /usr/bin/pkg-config via the wrapper script it installs. Keeping the
     dummy entry caused a DNF conflict during do_populate_sdk:
       nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
       provided by nativesdk-pkgconf

   - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
     With both the RPM filter and RPM format reader registered, the filter
     intercepted RPM files first and failed to parse RPM 6 packages
     (debuginfod scanning still failed after the 0004 patch). Disabling the
     filter's automatic bidding lets the format reader handle RPM files,
     while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
     explicitly, keeping test_read_append_rpm_filter passing.

   - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to include
     the test_read_format_huge_rpm.c changes from upstream PR #2846. This
     test now correctly exercises the format reader instead of the filter.
 
   - Updated patches 7,9 and 10 for the latest master changes; no code 
     changes; removed upstream modifications   

   Tests verified:
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
     - oe-selftest -r sdk.SDKTests.test_sdk_manifests
     - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
     - bitbake core-image-ptest-libarchive:do_testimage
     - bitbake core-image-sato -c populate_sdk
     - bitbake core-image-sato-sdk:do_rootfs

* V13:
  - Added "rpm: Fix pkgconfig() Provides missing in cross-built RPMs"
    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh
    so pkgconfig() Provides/Requires are correctly generated during
    rpmbuild.

  - Added "libarchive: Add RPM format reader to support rpm 6"
    PR #3346 from v12 was insufficient alone. Added PR #2846 patch that
    converts RPM into a proper format reader for RPM 6 packages.
    Existing RPM filter kept for API compatibility.
    test_read_format_huge_rpm.c excluded (filter intercepts before
    format reader).

    Tests verified:
    - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
    - bitbake core-image-ptest-libarchive:do_testimage (libarchive_test PASS)
    - bitbake core-image-sato:do_populate_sdk 
    - bitbake core-image-sato-sdk: do_rootfs 

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (10):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6
  libarchive: Disable RPM filter auto-bidding and update huge_rpm test

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 .../recipes-devtools/pkgconf/pkgconf_3.0.5.bb |    2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...-Verify-that-bidder-and-filter-match.patch |  103 ++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1440 +++++++++++++++++
 ...0005-Disable-RPM-filter-auto-bidding.patch |   73 +
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 28 files changed, 2168 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch



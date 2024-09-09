Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C66FECE57A
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 13:56:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53575.1725890202727342506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 06:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99828bad0f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489ApeKM015164
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Sep 2024 13:56:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc211ver-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 13:56:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gX9wXHH7utIZBgs+wo/mIcj3s50mEp64AdIZfKnI4fy7pZIzdIn3D13QsDZJlUcn6PKE9ETFBuRJx2dW769Egwje1BHFP+gt2AZDH+d/Xb/ZtiPLUN3YrPlfJpUXg4ggLxkaMhZRIEexQCrLVGHDjIV12nzSQ3zQvAIr6iLkvXnM5EqWWi9lj28lm30HMySajvdrQH8KzlGHJ2vtpgWK8ia6sgAfaWybfhgQRUjSJM3suhq11TfxN6zw477Z3ksCae9Y2KJqzvSMqI/fguErBEJDZ07VvRXAm764xHA0fc+O2lQK0uBnpLfH8sOM/LufIb7fU025FXdpu2R/lhjSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmqhJ8YeMMuNVaGyIbVtOPvSB1Sx5OJoMjPvP1g5Tog=;
 b=qTbT5GtsCi4dmPX0IqyoD7rcHQ0yAMt4HUi5pA/roo4MA07SivsMBR3jD1AAkwjw41xnw/M8ZKmaYJ1RUSQklvMdIQvbkhdE4iX2PAt12QM2ZWeFIaYPfW+0DYFRgbqW+V/8RIhPosIBNA61P+Z+OcIPtjwRtL/sqLkb5IN2jurr3bq2LEyupKMEWy7UzajKV6kbeJufauQEYg5yefyv55FnGUvOvGFsnvdMUeDiYMUoU2+lq/+2Sl4az7BAwCwWHwzDB+iGKgwFzH2S8Sl6b2wQl9RjKNV7ldLOCuh3In/FB65eOiQGsJi0Ky2vqcWyCJbQ6JD4NT+gIPJAQh/2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 9 Sep
 2024 13:56:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 13:56:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: upgrade 2.30.6 -> 2.30.7
Date: Mon,  9 Sep 2024 21:56:27 +0800
Message-Id: <20240909135628.658942-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 51df4fac-9b33-42d7-d901-08dcd0d738f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RrO0OcXt5t/Ch6zTQH4X4v8ScBasguayhQcCTgLD8ZdNj5FUGXIqQn+bflrZ?=
 =?us-ascii?Q?l2SioBBdG/iu5fALAGCYQCoA8w+5cRpp0njSJKTAaHjOXMRV9xq7cC4KA2VE?=
 =?us-ascii?Q?rt7VGTxowNhyuGVleCjdK616KsP35Q0PchGy1ore1k+W2BBkPX5ZcIJkg3zd?=
 =?us-ascii?Q?QqSAn2kd6Vx88A/o2T8UxovwxjYgtsyfsXSfrIzWqKqnqiWly8HMNZ2tY9zd?=
 =?us-ascii?Q?CFp8OPvGCzfjIqGt46Dg209m5xHWLk0lNJCBk7AQfBtXjaL2LysiUzbHN5mQ?=
 =?us-ascii?Q?sPSMe0EpQ5VjBjC0FnkaaRrlDZXGdjEZMSH11lU4jyC3T4Y9D9OAplEhDkvm?=
 =?us-ascii?Q?+6zQ7bFyIXNrlbNeowNl8yNJ6wsUqvkh8mZ1a8MUgvglYpnhFVTlTHhAkYZi?=
 =?us-ascii?Q?jIHDF/VUAQglyM8NJDlkdNP5KZPTFIGnLSJyfRH6ayw9GADVvSBjcZ9u8sFh?=
 =?us-ascii?Q?ly0wMlAIgP01lpvgj6GNl9LlcsgjCYKpgGAYdndfTYm/OniBcRKyb9OuNmrM?=
 =?us-ascii?Q?31ojmEAan97f8HmxxONLCbnEjyD+wo3oK/ReCjQ0UOyOPrBh2iNDFAPIMwDg?=
 =?us-ascii?Q?N4P5M7BYN/rCQiLHlx1luOm7Dki+Vef1xoqmYAZpeNN3xjD3SewLVSBq/eYt?=
 =?us-ascii?Q?YuYYfSuDea/eDCUs1tEp5tL0NZJhmgAvsNFMiXPdt8e85hu7gt7mSZuJaU1r?=
 =?us-ascii?Q?Rmr+v0ap6n1oZtA/CI+D5AcpEXCvykrkJIacME9zGZ0gDfBK4Tc7yXomNSwQ?=
 =?us-ascii?Q?tHkQ4pEhSPBIoi0yf25al5HB7RKSCEkiYgL6jEwLAqE5ymqhXgme6vtUWRQR?=
 =?us-ascii?Q?mYXy0EpMqW0OKuCDzgeeuQ5WGGiKYg6VpF1bnwIWzBihlLsOaDBNFN7rAoFe?=
 =?us-ascii?Q?YPr0phPrG4VAYG6fsc7m5uZDhglitC3KeqoOZcpFhDfpcNECHfn1rN1ELycW?=
 =?us-ascii?Q?o+Lzs3FKjeXOcI3rgPOlZI/UcjqIVo2zfNKzUXCJTchzq/jpgRTBTPPUaZ8o?=
 =?us-ascii?Q?pBGs9iqbayEWYMiJGTBTueSyS8hX6wQ2slVahD2w743STuRFfQTFjXxS2rEk?=
 =?us-ascii?Q?gSAmB9meYytay/R+L3qhS7MnrhZSpSOPz9/K4J+LW2bA+o3gDscovcKeNBsO?=
 =?us-ascii?Q?6Z7hpLqFoAQoSrjYIpbVWWqYhxCnGMlT9QLUet2DbjK3ENx3bAypR0wiWgE5?=
 =?us-ascii?Q?rYbh3PIb2h0Aw3SISwCynwalMw8vDSccjsbWWAdKRuw2ry0rOMfZRCyN5G2U?=
 =?us-ascii?Q?nvg9pnM+wa3sO17HnfG+l4BU4ZAIIMVzwZEv/QCWj81XXBqmV1+Oi5sVYQTU?=
 =?us-ascii?Q?E3ql6ycxWhkhcsaYuHqEdvDDwTKs9HRV0t0ISz6HzpJV0LMXCozlZOPrLIf+?=
 =?us-ascii?Q?1/QHTYrbidMj/Uf5KXgT5Kb7oyq8kB1ROwW4w6B2Lp1qKUkLzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WlFAKMRoR6lSnxhER4J3IbcZOJcmI6qGT5IeemuMeaVdKsTs+8mPgJb2yU7M?=
 =?us-ascii?Q?u9viAyE7tzhuAWsXk3rg5h7kf66gAANCbwOIJ3FoW11PmJPvtb8Y9xDgPXhz?=
 =?us-ascii?Q?YnlQIpFSa7uMPjyIFbePVvtp3F4Kjng/Ru7720MkkVwC4L/98orodgaGp8rA?=
 =?us-ascii?Q?1v9ICOS4TQMmV7uxoO9z3R8SJ13QwypcauLMUEiJj/kW5U1hh53ch4F57AVz?=
 =?us-ascii?Q?IH4rNP1vLfuzJ5QDCotu1YlpkF02js7HE/wQRZV/H2+4q2A5fluOEKLu8KE8?=
 =?us-ascii?Q?XXNkRy+xnf2s6tpFYGcM6UZGWZ741yFy1lC6QbhuHjIYpwMy32SuM+7YNytu?=
 =?us-ascii?Q?vJEHpLOqN781u9h4dpi9k3sNfC4LU6jqhEmsJ0qXpJTvKjhVhyfsdCQ1wIpE?=
 =?us-ascii?Q?tYPoNx1uimwa/y+qX9VnU0GLk/XgraLVbSQRpKtmimQIi5qspjtps/ucpNtH?=
 =?us-ascii?Q?krFJ3bXCPW2jgqkYIh+KJ//ibB5MWZB/uTDmDZhnoVbuP+RfGCyGPKH59k4u?=
 =?us-ascii?Q?cG792LPUS8gipdtoBX4xFKkc5aHVl3gz3gwnK5AEJBzRCTAPIyD+//Tk/j02?=
 =?us-ascii?Q?pYqTdBBQZWKOC8HEfrGbj9da/RCSWv2hzqrMzwmnkd470krLTs1mKFLbW4xN?=
 =?us-ascii?Q?XA8hik0+dkoO3rKIxNRGwiVufVEgT9mpZv1gK20SKkEBSQw4jVxFLclwFtqN?=
 =?us-ascii?Q?FZPsx3z/ki2jII4839aCn7Gg3tI6xaHM+nF2XDOCWyRBt51Wrf3zQUsx2gh3?=
 =?us-ascii?Q?y/tOJlPWGPQTiHSpPYYSaerdXtasxOh+3VFVUMLqBfPqgMzd+mt/3cCZU+NO?=
 =?us-ascii?Q?OaYdufuKbWH/yF9/5KsYYBrHlBTFQWWFB87tAfULcLKPOx5hwE5Ix5tYw2Rc?=
 =?us-ascii?Q?CY4qid/cp3Y9LGNgR22Fy+z4U4ldDhETF037NDel12SR3JxqY+TelJ5kIiCY?=
 =?us-ascii?Q?qA9VmpY3plu3+g0tfHakSuON6w71e2RyTT/pCGKt5EMSI55sAKdMGZrggNUH?=
 =?us-ascii?Q?2JUYDct75XF2BdrJ5Ci8OG9Jx1ZNkqtxaondJwfELXxYDWg0QPu+Hy8hLbKl?=
 =?us-ascii?Q?aTPD963xczfp0MAgmxpcXeOwkV8w2/4lfjvwnyo7xgspCjbE5nk4P36VaMGC?=
 =?us-ascii?Q?xqsWucvkDItAzxrTTnWGQ3gJIBQqBB4NC15ZwhHibre1ENbq8+WwijbhZQXZ?=
 =?us-ascii?Q?6mLrPFE0NVhQHyWXtz8snIdcQeXQJbUk8gY1sefirfyKcTkadykyPW6xnn2P?=
 =?us-ascii?Q?Sgfo8tC8j56tf6Otw418q1erougJv5IATurji3cUFZT90fPww7VlGJ87G0m1?=
 =?us-ascii?Q?Df4xDKfhKp7sOULpTfUi9Onlo/ZOJhyU2Xzir7PAQm9/gsU6FGeSopFY71di?=
 =?us-ascii?Q?xQcQyvTVHjjiHcses88D7h6g7kCDVhJ+CcvdhDkmfiksadHgHAKWhtUJ464Y?=
 =?us-ascii?Q?iIuZ1+cdqa4IqkSZfErUl4hkyp8gfnRa5Wa1UiOsbRZZpNZzccSsaHVgo/AA?=
 =?us-ascii?Q?NXxVP/P6SJFGYWZzlAlOxXjwVxxKrEt2a/6pa2WhOFL7Ykb7qU0rhFwta4ZC?=
 =?us-ascii?Q?doH/ijLhEtTh8LeXR57UitAyhmpCBGNZLMxtnKJ4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51df4fac-9b33-42d7-d901-08dcd0d738f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 13:56:37.4848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kctMAW4f3ZqUeNFEl/ZQGFdX6yBaqJ94B1cRSU+wJb60rESaNU9dqE4dXTG4Dq/L3RwVA0Usz/ukANHVItAVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Proofpoint-ORIG-GUID: gMsKI9aHBQOpIma6qf4TlMpKtyZhDL2m
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66defe99 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=rApI4zH3AAAA:8
 a=ZYulueTwGVEiKxLrCzUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nY6XeQbCzfSyNvKqsd4y:22
X-Proofpoint-GUID: gMsKI9aHBQOpIma6qf4TlMpKtyZhDL2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_06,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409090112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 13:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204324

ChangeLog:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.7

* Added support for the Retro-bit Controller in PS3 mode
* Fixed the cursor becoming visible when using relative mode under
  XWayland
* Fixed DRM initialization failure on some Linux systems
* Fixed a crash when the current mouse capture window is destroyed

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.30.6.bb => libsdl2_2.30.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.6.bb => libsdl2_2.30.7.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
index 9d1f79f662..f3c78a31e2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "c6ef64ca18a19d13df6eb22df9aff19fb0db65610a74cc81dae33a82235cacd4"
+SRC_URI[sha256sum] = "2508c80438cd5ff3bbeb8fe36b8f3ce7805018ff30303010b61b03bb83ab9694"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1



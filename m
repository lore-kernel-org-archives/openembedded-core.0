Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C78C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:08:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8006.1787234919350475382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pM0Qkve2;
 spf=pass (domain: est.tech, ip: 52.101.72.69, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnTb7YAOWqaP/0P4n4/cqGYuUYyhmnW/jiuLZD0/MDiEdUravII7tSWUJ7LNJS3EMQYCWwLF9lpMuGeMw9ksAehazKtn/EbMvonI8sDhdJC+v+TS/QdUsADEvWrQ8FoKTvKoV0FH/ItDCA0V/3c5J2xzsqTCUcxG/fWw9y5QMz6jQaMEb4LQbXc0snD5KdtmeVFwqtQ+8S4330CBvrdbyk9bWvyIjuUnweKtJYO96SYUdHE3bqyLKKlVCOh8S8XYbJyDkFgpIk03hdAvTNfkV54RfrHU5n1FPyXdZNdXsPPZoHRTukmFtE/XZ4SVzP6/tV1VkHr8SyqTapwhPNZe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FthFK6zRTcIovK2b0VSlgs//SY1c/uyDxvVOvebtAyU=;
 b=i0rdwm5FRvBg8FDTKdh4PXV+3gsU61++uYbkXLQCEi5XUIaKNRy16Hx8gWRDIt6ZNLUA2h4/4ztvUhd4uGMw9Gk1u7FlHJ43c7gPcSBdEaZ3X6WjDY1nMzTucdEmIwCV+/+G0Pu0WEMsqzoqdnByaNFAqFztOgz4yS5+ICk8ZNHzEAOLjV6OrCFAk/aAC2MXmWBBBwFCLXNd0clzRt20daaHM1Zpo5Bcrkugu1QTKsjN3U9QDaAWUIDcNo5cXaFAwxotTgqgOkVrhQIpEkXKKflEYAC2AjzzBaDgiWCKblfqADkjuOC6OSCeM9hHO/Wq8dMCs/90vvjI7kFsrQOvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FthFK6zRTcIovK2b0VSlgs//SY1c/uyDxvVOvebtAyU=;
 b=pM0Qkve29iuPPzy4rt6vdbVhSrppR4+Jyc1w0g1NEPpcfCgqN0p/N9BNq+deAo/XC+Sjms4N0vLUWSHPOwnUyROSm9E3Au0j3iMR9WgMG6dvM0+ZA3Op2pB82iosMBYwel9irO5nP5DjzQ/0W7uMeSlnZo57Bdc1MsN+fLIWf3R4zvEuFhPBkuX0qQ9xa7XfDsUKjXMvq8KBIIQspQ/xcVqIbuAyXKF2OjcNYkAGq+GXoUCIHbmOCl2EnAhwToFw9kO5y+3q04XIhBE7W1oeBb7jdHwSFqNSFPsU+NzpfAk1p++E9F0EIo4AGO00ToGRIyqgLOu8b9D7rwhOmmclbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV2P189MB2405.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 14:08:34 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 14:08:34 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] bind: upgrade 9.20.26 -> 9.20.27
Date: Thu, 20 Aug 2026 16:08:31 +0200
Message-ID: <20260820140831.34712-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::10) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV2P189MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c10adb2-9900-4894-bb12-08defec485cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|10067099003|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	IvHf4JZZHX10+nxa429E9br6mDJIOFDqdb2NzVGdvL+9f50ThiDYC2rirvJ/0Qg29ldHmfEg4+lKW73apc6zaL3jkOyQAaIXO2Y3/Q+uEwcrjthlU0PKSFghEuDee8GLMIkRX+956UIFUliyrTgB11VL1ukCQswIIXRwAyvS23zhE/K+IsrnoogbKFxOzFzIwQOxEtBx46LppxETsCi526TmwgFGW9/upgp/ypi+Gc6Mn22PI4RX2zrjGFnUTAJ42i9KzBBWYv5l86rmOazUX2p2zlNkpjBKu3nZS78DgfH2Aqz0W4Z3WF2cg4WqAPmkIX59r6mAWdR025BaO/C68diEHbvkDbuBhAvLHrW3B86kDit9bEwndit3wg8sXpfIeN511shNfAnp4gbQOELyOwF0ivXyREJVKSbvp0/hH6Qp39ZrcrI+B5DzD//g1ZvrsZIDTQWu7Ly0TLZ2ryEGoj/4Hc80zpXEH9R/H9O9ZiO2/uQnJoDg8d8iRKyXxK4zl6uQAOVrcNH3J5kFnGl83/dtKyJ8GKfTZg03akMPwimBsx5eTdBKEz2T6hnEiKJv8PesIyU2I9+dD6m6/ccpNJ3DBWlJxHMElAqj3u2g+wN0D5hLJ4hiHAm/jifMyAS/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6lJXBpxGKq+nmy0UFv8OTclIQiUzA35yPGCPD6qUqSuCzKxt+MeSi6STDuTT?=
 =?us-ascii?Q?EZ/y58G2649t/Jzj7+99Q4h3E/jQ40P/ay1RP91UzfNEw+CMbL+nlqyAVHef?=
 =?us-ascii?Q?tMCpGM/VXaz3CER8h3GdDAwLnBrKbfeZU0rx4Gyev+tAnRSDmGUwSBUJHaE3?=
 =?us-ascii?Q?bqp8d3CzbrNtIL39Q468atWggOdC3Qj8H794RzDZr/oHlaCAABNA50loYbnq?=
 =?us-ascii?Q?IOa049i9G/I1iaBVOeKRshRenCUZxWM/WQDpSIhuzezBPWBwg5aYlnMyjcBd?=
 =?us-ascii?Q?7ViPPzj9c3quI0mAkF2kj2c1tBmTiMQdYZc04f93QRiL/w5xo5CANRikXVE0?=
 =?us-ascii?Q?kMwr9PK/rpPuVnjzIBE5CmmxfXZosgKCOEOJSVcwjTUVL8lvp8qG43mhwX93?=
 =?us-ascii?Q?qPSTMZBM3GkzfeyuC5g3eXG3hR81h/IHiLjuzT01u0vsfPu6f7GLpA5RqP3o?=
 =?us-ascii?Q?nG57HHqeglp8Z2DvP78T9mqe+xJwAgfnLBASetqi1+IQ/hgXzNweG9eMxBw2?=
 =?us-ascii?Q?Q3cr2vuoBNuN6sMNQaUSId4S9noUnJADB9g0EmbAombNpRGlBHu9nk2mxzbg?=
 =?us-ascii?Q?k3geIR67dbXV4jI6pNGR01vJ/AJTYP2ggIMH4SaNnNJUNOFz1ns44diUmk1p?=
 =?us-ascii?Q?GdA5z3uXt2+Cl0JS3PVfBs20rnO/U5Fe+1622PxS7DqsCmj7djzi0DDJMJNP?=
 =?us-ascii?Q?vU37nWuMJJKAMFpyClv3GU/O6uXIKSUupRvMZdldhv90GLr0XEa7QSG6SQH7?=
 =?us-ascii?Q?pHZYWPcCDJJaz+Hpy1DKk29fphuc4jlMYE74yCpNrjvOlHx6+8un2S+GexSO?=
 =?us-ascii?Q?rsCeD1aYDNSfm80Yw/72qe8XL4ZFc+w+uFAQ6x6JfstZVKnjsgcI3WAQjVM8?=
 =?us-ascii?Q?d6lHFB5Ys3LFAblEsDH3JZccl5WbtJqgKBg6ZCu+paeHWv1qKI+exfq3oIUy?=
 =?us-ascii?Q?HiCAKf0KdRl9sBnOs/S2CuLzqGcpYaJjPQ9XfY1tor8LVJBr3H3FHgsj/N1v?=
 =?us-ascii?Q?K0Rss/XtW4TEF1OWhxEgnlLhiTnq+6QFLCPsIpoCSH7s9escgtIJVX0pnGyn?=
 =?us-ascii?Q?H3j5wWcJbtB170zi0+21qSnlbyIjs/iId5MsRAs4jJLAechf1Ng+apA4FMNU?=
 =?us-ascii?Q?awV80Gjp2v+Lm17xJE6ZBcPQWMvJC3aqDHKi2RO12pL5cqc2P5Kh0OqXX5Mu?=
 =?us-ascii?Q?+y1wCl9vc2kkMJ544Mjx2Iwru/wYY+ZeOkq1Xmnvxy3bvUvMBlNlGZ2hWmnr?=
 =?us-ascii?Q?f0rH4wzZWGPWzXwcZOtcbu29Dn/m3Ew5XmKVYkTr0VW4lxVBnych09NPXXwS?=
 =?us-ascii?Q?yIXJTYCgoDBJVzE8RB/lQnbQiJlPZcRpV8bvlHmiMgnzmznaTeE3svu2g42H?=
 =?us-ascii?Q?jM5eyQg57Nt91tMF++9SFhZEoh7WVMyet2DeXx6AeVfiYxfFCYsVbQryPra5?=
 =?us-ascii?Q?NGLImTuCp22UBKmDg6cmmkMfeKb3UJwE4XuAoecJ+enpG1WT1TA24yar6At1?=
 =?us-ascii?Q?/RyeasW4of8haWutXmWHnwDDvIHMHvAmWNLUgQWKhQ5MyaX0IX+Lp0onoefI?=
 =?us-ascii?Q?zu8lA2qTJtdtSAqEew0zws1ltsi2SsT+sV2gLkJdLOOeSbS00U9pN0Dd1sDN?=
 =?us-ascii?Q?WMTrBHKsKMQXKNd76Vpv2S6pS15qJ8Sh0gtNB8Mz5rBlU61rEXXJ5tVnnaz8?=
 =?us-ascii?Q?pIlu1jM3ktZq7Xg2mqsAndlmFGfy0JBRwi8ji+acESkmjzeTdjsN6f0ijh9s?=
 =?us-ascii?Q?k+R+m2H8bQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c10adb2-9900-4894-bb12-08defec485cc
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 14:08:34.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKciU5Mqc2nMB/j+CAm1/HwXNP0VaoRMamAoDlFdYDXoEe4w4tJc3x6x7bpNhRQ9vPQBGxLSTj2DYdvxc9jxDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243865

Release: https://ftp.isc.org/isc/bind9/9.20.27/
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../bind/{bind_9.20.26.bb =3D> bind_9.20.27.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb =3D> bind_9.20.27.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-=
connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index 21ffad7bad..e915161d8c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "55248def0f870c4c46b3de72978ea972615131516663188a45=
64dca1d20bf350"
+SRC_URI[sha256sum] =3D "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5d=
c7e238b080e4a0"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
--=20
2.43.0



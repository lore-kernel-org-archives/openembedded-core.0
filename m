Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070C3FCEE8A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 11:29:32 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42088.1772012517946353983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=JSYsbVxH;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.35, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiOBsO2YzU7aQjnIBucd1Vk3qnwhFdRmiw10TgqE03x9OiC0Cd7ZeOonUpcQmjWmgG3em9vPqWxHQGgzGkmhxi8MA3GUdS8mP8Czrew2mchUJxo9aU4hQV/5Z7ngsJ+Fz8QH5O1wmNtOFumCCo1bRV9OSpvV/rk/hX4wmhHbUem2AenhGGpp4c22+tUhtxXl8hU+vQjo0mstNrKoZjlKVNu/YJy3nXvPX1UHeh5VuYeOnAGO4e8l0VrCYjAuTJ2Hrb11pS6ZGJjr7w4FTQFQUrou0Uhdyejlck+CzjPpYghK1SzFIUlN0qLPRRoXFLqmSN1/a6EwvKwTMgMMcWQGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VviGmwGo5izbbOXGqgyWSAfG6MWDs5OVGlKFfWETjr0=;
 b=r1KIMsSnjSn6jvtHeJT+/QjnCI3oZ/qyfi0+6D63RKFVAtE24duHkxr7ipyK4H6so2gubApiN0AyUWGY2nmE7Vke2BZkBzP5Wp8TFunR8AXpsHVkScYZmXsaMwr1UHmRwCvruuiWtNyauSCZtLqfzQcaQOCQOwbxr4zWKf6tnkAYOjsh++UVdAlCqSfJg5rYOHwB61/4f3FvriXYqbVb8sL1/p7vxj3U64oNLCJZRwvleWOA/SuL4VXws+28zHZzcr6cR/hcA5QiA8VNLiZ7d+kYU5L065grsDfC1m+dWWzIJpwc1yFjvxF5JmN6GuVQ7wJh8yci4KYUKfvgry5Uog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VviGmwGo5izbbOXGqgyWSAfG6MWDs5OVGlKFfWETjr0=;
 b=JSYsbVxHs3cNOb3wzqazcNooJvUl/fuRDCVquhUHG6q2QKeuk8aiRijopopgSeFhPHx/WkIO4TG0934lEzpuS/zUCDddDohAmA+byzDPPxR+x0oPN9GEFSU1Qv9tC9UzhD0L448TW3cem1UtsSCETcsOUb8rKvzEQ1WgQv9iHmGiLDg0BJyA3vZD5nHE8PoV9+JjAw77mQsuU90NmzRleMfDZHZzQ1GDz45gtS+LMYbVIV0rYMM1bTclTvzIUW4iuZMzBQkq9W1HCBL+bVFGTljG+J2gx0VAuhHRimcTQZDXpBK0jVoRyamqcUsPgnvCg5Y9zEvudlnLDjm9Lcj+wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by MA5P287MB4396.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:169::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 09:41:51 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 09:41:51 +0000
From: Nikhil R <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@bmwtechworks.in
Subject: [OE-core][master][PATCH] libseccomp: add diffutils to ptest RDEPENDS
Date: Wed, 25 Feb 2026 15:11:14 +0530
Message-ID: <20260225094114.44082-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN3PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::10) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|MA5P287MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 203914b1-166e-453f-d285-08de74521a6e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	i5I6AkWxsRUlH6eYJ8+q2Vu6kbkXKKF6uOY3iO08DcD5qbpgmczpmwM3ayFnjnhIYPzqWVBUDcqnWFOK7kosLo24BjoswpYBCaApZXARNxadR98+98qEddtdlycePmg7++/gAU/N+wLUvlGAoyuMBYTF9WsGMruDabS9+3PCTCaRA2NA5lwVm8YmXq8Srj8Yj+BIpVjJszkUMlJD6bbOSMJ7OssstdUUxxyd+G36U1YRhQSapV75DtpZA4TH4OcQml5HaTZQ/ytVgTTCzE32fQKR+IODTPcGASwAussUvVkTzH6jMhhxwKw55yrlfWV94GV6B4Ebu9LoOXc18veHe/ipZruwRjWkmQn6/Gqem5vPhwQkJfQvhhbzX+XIv+hpX4ayUdcKly4C6SrnFWaAWN+TpOVY2G2NE1MKgWRcap4T9ulP6AJYuaI4gfZ+wx8TZ0FJ6vovMZnnr4SF/NRmRjYP/Twsq5uOzsdricwcrorkpXJZVQz45WfyPze7hkiG8Sm+BPwNKr1so8ySgU7CdzxD+w8YMjkV6g15iYX5C5BuusM5iaD5ipVMqtfGxy9oeGB6vUwx0Mt6ahjxPIeJKFonzzxUbwxdSwn4uKHRd0pY7Wxabzbit9uoJR92zWjSOcH2lMgFh0waheczO41H4rL2nM4c6LscKEUPvXEgJ7iJn559zGQ4SWrX+kkaWz3HCkeHnoI6tOqtKSJ7uWnP/mWYg34Cb0Tce9OLa6VCZE+/c4hm23WfNxrAUVaXKy7tP/JkO6H2RAYNtzfgEKgEYhbLxjkSR0c3Jai+RqbB0/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kqmctP/QDCthFJpFeQS8Lglomm346QwUG6qBuYWYDy7nNYq6Zx+WiF7WJEp1?=
 =?us-ascii?Q?Zg7ZykhHe7DK9wCXLJ4ZSYgOalcvYR3jiFu2LI7Gh172HN1vTUMgbnrSE5n3?=
 =?us-ascii?Q?Zbr46B2P45MtXZwQJO/BxXBnYPGeFNk6x/hELgfCztXvS7id6loV8JTpm/S4?=
 =?us-ascii?Q?jD4vte5/GzDrZw8JkoLhEzPYeMDf+sZMIsxyjcEIgcH38V4gKJZ9xBYLyfeX?=
 =?us-ascii?Q?v7VHPhCVSX8yyA9+Ij5LoKekSl4nT2Hgvl3GCMwmOzpED7RDmPwsppUGQXm0?=
 =?us-ascii?Q?0ZGgYvChJt+zWdh11m+03PTv1cLTNLbFgxEg0PSrpn+9CLENa5UDJ7xp4+oA?=
 =?us-ascii?Q?sLlB5RAP0GHkPaU3EYArs3bumQdHfLWgxipgwCy9aTmnQepVxARqyz+bY+Bz?=
 =?us-ascii?Q?hqhp4FeMiahezuvsYPlc5rObiu4gmEmzZvMipWsFrb6STp9AK0LHl8vn+8N7?=
 =?us-ascii?Q?yyP0BZcJ+j1pDpAHOwfa5eC+G6Tv7Txk8ACAgURp6/qQWhyMfW16dJ/e6emt?=
 =?us-ascii?Q?hgpxP4cFDahyDTrJ0D6sLKLV+S/Qf2UXf/A/fqcBnxiIWRKa0GskGWyarmZD?=
 =?us-ascii?Q?btQBv/guJbuVkNQAR0Bt4vyEOJhgOTY+MqbYMaVkhqlJD6PINkNHJHcK4Ce0?=
 =?us-ascii?Q?D6TLJYWvuNwJOPI6cjNwrODDDgnm3Zdeegv+OMwLUrqzSjrncFuXJZazK6M8?=
 =?us-ascii?Q?n3LbKkg+o1u0iCeWXQeJENjbsxkuCoPltzrIASX6fTS3xQJ/zxE3FO5h9jMS?=
 =?us-ascii?Q?7JdcHZRm6wOzXY/hjr4qQipGpePdaTKEo1peuPxG68ZnFGz8tVa6MXdthkmI?=
 =?us-ascii?Q?5dq/6Oh9tBapjw9xNr5rPXofFF0wOGpkkqKcRw2t8UntV9azt17R2u1JphoP?=
 =?us-ascii?Q?OhObKZmgbG03ZQlitKUrlQuv7OiuWb+M7eysaN929GaWvnpyO3SWv3G5cJ91?=
 =?us-ascii?Q?iISyjFLTc1kYKrQXzjP/1CfOuA7uDgNbmmMo3hwUss6+NIIU7eNC2gBCg9Fd?=
 =?us-ascii?Q?Wc1Vnma7uUxkK5snft3dg6LHUPiaJolsx67mluf/LCP5XITAVziVh8EaEyYQ?=
 =?us-ascii?Q?o70qfIsHDEVEE48m/782ebEQnl5cLDlxMVWyQ3WKwt0glCIC3fPwiJ+7Key2?=
 =?us-ascii?Q?m1zVCz3pPSLajFzOLZhs6/vcs29ZmY9WFogX8OHdg8dO7ACWKWxn1FhYksHe?=
 =?us-ascii?Q?9I0T+O972SCRn9RrUw13TK5qBZUwHyyjGkjg4L1ocEQZPDstT28JsYV8D+bK?=
 =?us-ascii?Q?QF4B6uSZr9JN9NxbhBtlJ8sr5ARaFErHKFJZJjgFYhwhng0WlSrH/eklljA6?=
 =?us-ascii?Q?x+B4DPmAyujj7JRqm/b4r01g2tJc/8yPM81dinYjjTi9ndlHa+7trSqlVipJ?=
 =?us-ascii?Q?x0cz81bAAfZDWEHIc17I4RXjY+F3E6FmpJ8wcINHl2Yt75r7uZEzbNEvOrT9?=
 =?us-ascii?Q?ynzw3w8IzBt15G+lccSYd0jJ+JrwFgZlD0oblgiSkbg2DnyB4nAq2tQKcsI/?=
 =?us-ascii?Q?PFzjH99OTJtbTZNbKObKOwCgOhN/pl59hQWp+Zok46AWiJooO2NVIsCuXXRY?=
 =?us-ascii?Q?CeSilsV4C8QXeFSJhhg9X9TASILqdiHaZk6jN3UjH5k66MlOrx88Sx2M0NbW?=
 =?us-ascii?Q?IvWyHpbg87O48Up4M1bVDdRXffpt54ghuVyAdaMvhOgrDtrs0IXlCRtRP7tI?=
 =?us-ascii?Q?M9yud+ugL35tp9C5WoJ6eneuqZnNFHHzXo6wb2JcvnUVVhdL2UlSRTQRs0Bo?=
 =?us-ascii?Q?OL3QnpkhrhwYNA3cnpufR7tY84yuHDc=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 203914b1-166e-453f-d285-08de74521a6e
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:41:51.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic3PSG6qK3GlUrMxRfZX/kP8QCmjxLd/InFsb+fUSDGNmhYeopOz89lDL9r0HbTPWwPn/1G2jAqkpEA4wm6NmmTRiog6H4xdlolwdXrxLtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4396
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231951

From: Nikhil R <nikhil.r@bmwtechworks.in>

libseccomp ptest needs diff during test execution,
add diffutils to the runtime ptest deps.

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/rec=
ipes-support/libseccomp/libseccomp_2.5.5.bb
index 478e5f4289..dd253a7826 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
@@ -59,4 +59,4 @@ FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHON_=
SITEPACKAGES_DIR}/"
 FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools=
/.debug"
=20
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyth=
on3', '', d)}"
-RDEPENDS:${PN}-ptest =3D "coreutils bash"
+RDEPENDS:${PN}-ptest =3D "coreutils bash diffutils"
--=20
2.34.1



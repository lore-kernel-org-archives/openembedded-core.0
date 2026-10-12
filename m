Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1261ECA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3967.1791836854279821221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vHmhU41j;
 spf=pass (domain: est.tech, ip: 52.101.84.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9uwIbs7dSBbZ/YmcVuHfIBcermJ3AntXX65JMBbAuPbchxIhYodCMvdyQr2Nw7vPRzPXsdQMrJGaNbhLy7VZn4hk4DgaT8WOqOOb/vCm+vhpz4KdpRSoX5bl1uYpCCHjUMPLJrzhRVQZN82ZvfCD3Y2HnY2r+NkNGqQGzS4kcwLhVLaE1KCRuM9clITHKV9KwVrLWEmEwkReX0mim2ijwX6XVVNIO8FRDpSAzTXE+G56uWaCqtU096G6OQDJvrp5pokpdHnPTRziL7VS0Vc41YP/nLhPk9FnsFAu1tHUcTgWz2ZiLiKqGZ8+DsZbVYaeccecHNjghPg+5fkbeDEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FGBSLA/rJaS53k9zCih2fShO9BT+wrpEhZK02mAoL8=;
 b=tSi2HLGB0OfXV4hDCkHheKHN0527sVHz1uWjtBMImczLoY5OPJLW6cpdEdGfN60iP8S5g9eHoYq2HJD3Y6fAXtZKn4ZavGjPFcRDrgnZgkULzcIhXK3fQwEhZWkgHZye2gVnKbZwuMBvg1Chp56VaCgS1DalFM25c31KtYdfCw3N+UCjl0Q4DdtDgQXgTYeA7FaGLBJO091msqBoZIOs01zJlpzE+owKjHzclArEuU+xKK2SWpL2SYgVxg+AtK7sCJ+pN/0sLKbigRRJsTCyehFAf0TL2BQFAR1NFTL7Qsaq7vH40h4lYIcemZ9mBuaML7LqMKB+EppAISj5QjHIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FGBSLA/rJaS53k9zCih2fShO9BT+wrpEhZK02mAoL8=;
 b=vHmhU41jM2IJb82xHqgVtPnDTjbAatMKGsnjhPuVmEXJlEoxNaCOmNhi9mqrtlM8FNkhZ4A3D+X6dwubY/MXv57CxhrvX/De75CzBDSFm3y23OktNZBd6+wSXa3nGDeUfdr8CPjru+M14gfCZL+sO9ILRXANeMh482eLTTUmfuiwSa/CnwAoMSdys2tajpmq8gewwsJmQAZPpfg3jM25It+rRYORPRb+c4SUZnMOmO0iE8s+wC09Bwf3oE9YSv0wf7MpYXXXOmsytT4tgom+LhD1BnLbRD6znTQVZTu3Guph6m3FX6IU33Qr/RPmE95gHn5du04A1Hg4T7E8lBfeOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:32 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:32 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/10] gstreamer1.0-plugins-ugly: Upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:15 +0200
Message-ID: <20261012202716.38597-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 9672ce6e-5f97-4fdc-01fe-08df289f3e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EUkG0PNoaBFqFjhkrCVZv4tA8D0fm2Psyt1IvRKSf2+vBHrOIjPGXFAjO3KlS0Ll9BelJLy1iEecZsuUScSwJ86RhM7bFHPBdToqZvdU3W99pU15LldUNoKDJaPapDos+fP+0Npl9l7mhycTpqdSRDsJpgWyjh45lrZ4ZNvz6CbML/S2L77fbB+Y5qc5lZy4ekWXrCUbatVvmIfTo1smVtnmHf+FUYwaDd4Bi7i1LqAMHeNa2u0J7D2geA9VxLZTFqXgagTuJCPxkXE38yCRtV/Aw+/Ary0VAa4Ma8tS3Zxk/oBE/IBdA2fmwblBhNQ6Iho/eCEZICxB/VYBgF+RVymQXaJo1Qe7z5m4+JYyRJDclTIaW3hH03r7l62RalC+QlIX8+PtCISEgZhE2m85+/BMUro7wW224/UD4npoojDtyas8qO8XZeuff1d8UDOqK0OISnA7j4PVioPR2ipZElfsb5sEdgAAReMzi4ced6f0NjF2K44vH60LXphPytwNsPAkHYVri1gbBfzfD+mVhVOWM5rfiVfgzJmcxc5ovV+znbj5vymegYn99O2L5WZddZX8PilihqxvvFrdULE/f7olTRaF+QEm7+jYZEJ2YbQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hV+Ka/AzWDuwHFzOX7njkFHUU7Sllsf+yz4i3nWzfcPqJUsid5EIC2CB3OQh?=
 =?us-ascii?Q?bcNNuAy2Ue3OBH7KoHeENhOgDIypNZzKdDZOORuOCdkWuUKiQcfXH6nbxapp?=
 =?us-ascii?Q?Pmbh/pjrtUqIu5ZKwOJINwCLMZO0ot2vsNhUHPwZPm5rY+2v9f/lTf51FNAM?=
 =?us-ascii?Q?vcoN2vCObYq4Mv/fezOybPt09XAEaWXw5OuOh7Hyfiuxj34bATgH5O2g+aeF?=
 =?us-ascii?Q?FM/KqfLP9ihQ2nZN5kBxqSfp2gy9Krlg64+PiHDI+eU7IIQJ66o5XmwHHBpY?=
 =?us-ascii?Q?LHNGJGrFubJTM8FiqkaJzk4aEomEMncgnu7S7ygK0aiUhurJ5sEgysuZiUFM?=
 =?us-ascii?Q?EzoUexh3YKHTg/s1dZp9U5e4dBVmA4WQ2yNt+HOR1H1pw2cTcVEv7QKHSzCB?=
 =?us-ascii?Q?Vqa8KaRzbNqBqJLa0Xw2kYkI9BKS+EdBmCLjkuDIscIUCk1ktpGrBXikJyoK?=
 =?us-ascii?Q?f9uyR+0FtJDjFGumnmAvFmT9tpZQKLWGrX5XF/7gfIlwT9dl2nfpF6jdb+eW?=
 =?us-ascii?Q?8GT2Y96t5qjI2yVsVnVHp8l3InYySK0ADdeba42cUs5cScPaxEEGO6qqgHgY?=
 =?us-ascii?Q?HOjMJeC/778SZROjF7z0kyCENqRRv0utAp+OKosEDNtBju4C+nM3k6Kjno8Y?=
 =?us-ascii?Q?GXSzEiUANXZxbK3krhKlFoxnqoVFJrjczFRRetTDoAgz3XEGZrAcqAZ2IjJp?=
 =?us-ascii?Q?21JhMO4Xa3U02cWDlTqFa+5lQqYTUSdiQXcfhyVlzWSAgzldXZpVy98CY+0j?=
 =?us-ascii?Q?FDJntkflCk8aV7j/zbIVuWDMLEAIg24YTT7Z0bkUh88Tuy2OEs9ikQLopyk+?=
 =?us-ascii?Q?+ckDS8q/xWPHXcRF4vBfUh5xc8g8QKyCQRqK3qt9rp2KZ36gS7qsqkFWcnam?=
 =?us-ascii?Q?75s3AlnmfcJPed2QyX4egtFtpG60ShRTiEqH3Y9AbG5RkKUaUBXxQRr+oqYz?=
 =?us-ascii?Q?aOpuTNIHSJT2G8W8hEWDlw6PU8dEyLDOpdm+uoGBSjeG96DV+m1zNuyxQ+le?=
 =?us-ascii?Q?UD5Q8uPUDP8CIvycrbPHrgn1PszX+BBBU8IH8vKdjVKQu5HOJWXmAFGjSu8A?=
 =?us-ascii?Q?jyd0o9cPRbqNLmto8ApbDTHgCYhEczBIrK2CA6fliDD4dSzlJR8Wyagczgr6?=
 =?us-ascii?Q?AywJejTrjD/jA3SQwzp5H1btyn1MgtgbWBOw+NWCxHDVG/YxQSFeUMj6wHHg?=
 =?us-ascii?Q?YJNubU8ufz6RYKoc0cpqMhsauqGwOK5cHK4d1cpE1iiCfXaI4qP6sSI7lxOS?=
 =?us-ascii?Q?8qcP+5FgEKGowJFjFTqzx+/PNpbP6yuMFH5cqiBQXrPFXPFeYL5yTx5jqWSN?=
 =?us-ascii?Q?xr9Z2z3I1T+Tg1PILJFDrvtW9LWvgKyEAtTuXWn5Xc3eMHhJrrUyRQ0ftQmv?=
 =?us-ascii?Q?wzUa8EHJjclviwn10w/7OQcj363QphmFLSdgk58wLMLAweGJFAJZf11UHK8q?=
 =?us-ascii?Q?qU8LkNdqBmmywUZ+GQ5P+nRuAK4ziJ5jqimesyTQYwK+Y/dtNKpXn0kxbZIu?=
 =?us-ascii?Q?9BzEjj4FHKepYCW5Zmk6NkRnJRH0fMRTvT3ZD8wFgd5aZZcPH9SjQpuS7jBd?=
 =?us-ascii?Q?tSMZYqhTOGAy0630yJRbX/g+gMdvQwsIXUK06W6/sCx5iU0C7kxDmW76WMRS?=
 =?us-ascii?Q?vrinPzez9PmvkvwOui3wCtlN2f/d1f10v8Oa0yZN90/f82q3hm9nixzIY/Jo?=
 =?us-ascii?Q?qt/tuQFtQlY/V8NSpfj3FZZV8tiXJqgLMdKkXGfr+W0zN+fydLK769tOIEOs?=
 =?us-ascii?Q?8bA3sN5wlA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672ce6e-5f97-4fdc-01fe-08df289f3e31
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:31.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3HRMP7JaZwrgRN6r9E8Pe8V+3UwSnRzvtwf1aHnEK3IQRIsi4cHcF7C50wgMANkhfnkmlBUIYZFL8rDvJHBXFOk4MgrZkGgzkfJQkHBFfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247684

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ugins-ugly_1.28.7.bb =3D> gstreamer1.0-plugins-ugly_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.7=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.8.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.=
28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
8.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
8.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
8.bb
index 15962c14e8..33eb4c13aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.8.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plu=
gins-ugly-${PV}.tar.xz \
             "
=20
-SRC_URI[sha256sum] =3D "2b681170ddc22b6b283cafeed48f427c30a17056974a6a9ed1=
37c354e0f7730c"
+SRC_URI[sha256sum] =3D "51ae53002e3bbe9ed0f2215020c5a248bf0ed41b9d9a2a4e10=
2b8583fedab61c"
=20
 S =3D "${UNPACKDIR}/gst-plugins-ugly-${PV}"
=20


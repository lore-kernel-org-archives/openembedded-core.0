Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D57CC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:13:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14290.1786608821934982202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 01:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=x2XiWc0p;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF9oJ8vthreBkCrOzTQO6pUEU1rpvLd7Op0eq51wcdwqSFj9VgTT6PgfugOvaEfOtE99GU9128/8Uvo/7EWuqf/9bgjkkLVc5RtcFGbJm25i0YuqbYLYrP4KkTBSQEbT2GSUJkDAu4082Gxp+w5+t/2rlgP1jhXN6CbwoLPT6jdoVJvlalcgmsLNcwAo2k9oa3dtpGHAMKJRPHyHYIkyW91tvOaDck+bzjyFFJbuID/ELvkmPWRxbl9RWzAImqNTV5s2HRDlTvrj109wnB7m34Ii7i77dOhR8JIbpMY/NK7pLNBbZVZPEYdyWk224byyfrE4oZK4AyG2JgIdsfYyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68Ssm+cvld+MXMOkWuJujFyCX0+BFn7UUjyO8mzaf5A=;
 b=jdem8jkZPzLTZYfWtFbmNxFaAILQWYx1T889nHFLIk2L94/TMNUtWDHUNCZO295kaBs2llK6apZ802Y/CuEcm9bTNaMYAyRwU1+JitPQHXTHmFplgF0OEjVDmtDJRT/3830j8AGEHskg2Q4t8dBBPhFUIHpNYGUQG5uNaceR7TpoPhgtsxIqYksEZe29Uww2Ggf9VQI5MTqqpIjeL4iluHNov8uARF1/ZpLFnoDfzYzLkjbRgPVEGlfmPVld731mPEsrAK5L2UlVrHOdfPZhMk2rOdStN3rskbJU97cEv5LG6Mw6+chpH0/2TZbSoA65lScBPfslBhH1HxlG6K7DYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68Ssm+cvld+MXMOkWuJujFyCX0+BFn7UUjyO8mzaf5A=;
 b=x2XiWc0pQPpwd6JK2vA6HahBajzpqNYS0E+CU7WDQ3Fw0ATjyK3E5UwAMCsZIu6rsm/OikQcjGvilCnLIo0xL2WtrAlrJ11F/WWWdBN2/ia0PsJsRojXaFQvQ8NqcfTgeLuvuaQdcCFCOClX76eSqMWyE01K1qHZyaj+VRxeEyfmnJpA3oaSro5iRqa4GYD/JE0+wHP+Yd5bQxuSOOTiWWIgVTJRnOBafLKHGZPmBzQVLO+F/pFkoHkdYkY1CLz+tGmnhly1mCvjBd95EdVlyaJB6UvuibtbVUVSf8qZQcgUygCjy+hjyeGhLAwAO2/hP6DUNTMitKJlPOi/9HeSjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM0P189MB0628.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.4; Thu, 13 Aug
 2026 08:13:37 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 08:13:37 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] glib-2.0: fix Upstream-Status in skip-monotonic-time-similar.patch
Date: Thu, 13 Aug 2026 10:13:29 +0200
Message-ID: <20260813081329.8521-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812072101.10905-1-pratik.farkase@est.tech>
References: <20260812072101.10905-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM0P189MB0628:EE_
X-MS-Office365-Filtering-Correlation-Id: a30cbb47-e91a-4aa3-a790-08def912c6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	qaFu9PYoEDW3Mw9+IZHPk3nM5PpKZPKAkxnCnWMAWJdtRDgx8/3WKpF02SclzGbAm9NhbchgdOHdgPMCNgPH13GkOQrfzXWQa5TpK3JNkPwRhIuqSFMMptP927gtLf/axTvXDdpSXEotmvOHJrQtZ0WzX01TCsIxp7gnmSIHzqYPlrSQm9Mrh33CZCJxA8/dRvg4pBGpWng3O/os791TmwSCMBTksteobuN0CgtgS6kVyeDakT2FuUl+ZnC6RG8HQx6N4ixFjgQD2HtWNpvwLZTsLFAyaANEhw7zU4uIjQ768ncLHPIrk6Jx0Kp/94ZDIf/Z/4lB22RoY+E10a3cI1/TIPRiFiNtRf6AD6RKemIURhSqkcAcUauSY6FIie0rBmAD8bHBkoxp86QnzPVz5pUJkCLqNph1gqS8qvkqlVrDrPU1JIHXICpojKkjW4rY3sCbKsSJs0yr+NpqhdME9Sh+rykRSFAdl2RlMhiVm+Q8Bv42fZYKeTrxSBAg90VQjCY0a6BAQDrSoaYrp8pjf9l8Z5t9K7rs4DvjzhzwwZlg2NVnYkdRGCa9rP+sJz4Lo8WFp9vcHAtAAAGB5bynDbrW+/BxDnRaTBzSxQtO9PjK4I6wtpwHUV9PstedRDRSTMIHwn6C+gUTwMLcWTrL0xFaPj7OUeWZ3Sr46jD6s3o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eH6UGPgFnOBwdYcogujX70hXBtPjYVsO6M8ORkhDAuW32oBOhpu6GJeT/eb/?=
 =?us-ascii?Q?bekMBFJ+mL8ezc0GxozGAVnn3tjniBJMz7Y51DcitEp4Slqk7dI5PP8HAtAE?=
 =?us-ascii?Q?SCtC9sXYPbabUaYwmZAsx/EfRQsLKZbkuVitsh9IQ7Q6pMf6QBYGElTrqJuV?=
 =?us-ascii?Q?sMaqyGFf0EsxKEPLgCXQDREMCk1BlTB4RgbXjV0fLMP6eYNUXpB2xKy537GL?=
 =?us-ascii?Q?SlLP/DaD3yIhOt+91jjWG9c9dFENzv2yDJNm1jz0wRvC7BdSDz6bpfNR1wJ2?=
 =?us-ascii?Q?JhbLlcL9cblh4n9qBkPlL5nyCCsnfBIwUwil5HphUCXPyRB6EfyJlk+vqFAy?=
 =?us-ascii?Q?zPIDgh3mCHipLiKKLe2m3F7f8o01fnA8MDPHQROPSgeULoP0S2dmo9GMFz+T?=
 =?us-ascii?Q?AJMcGb4CIRugGf+anxFzb/KyVsdEWEc+iB0CemfB+Kit44vCR6+sza10X4JZ?=
 =?us-ascii?Q?f0GAzAKEEWZbV9BR5Zoq+KvfqRTh77ixCtPE25VSjU7H5n9RwYRyz5wxxns+?=
 =?us-ascii?Q?VY5k5VowcBMv/38d71PBfJ5Mv3xMh+5e3Tom/oPkbbzOvIORq8O8SEubMghJ?=
 =?us-ascii?Q?XRgI7xZ3gHuX0YuHmB/n/XeZeqegBlk2Z5KPU4TwsNzyXntsN47JqaWOXUZV?=
 =?us-ascii?Q?ipBfMM7mKYptwp6fCI4nHoRJDAw2EEqZ0dnr3jxaplr8ZWCWG2vCvd3yqG3T?=
 =?us-ascii?Q?kuTgCD3CU/ligDJrR/tRKUQtkj8/tTrHRSOmuawbPx3F9mAzuzHrNM/7f4vj?=
 =?us-ascii?Q?YkcUDMd1q9vQeI6eei/oSF35OuIaaWkmmwVZub2oYNgBgB0MjbeFUnpzCmZR?=
 =?us-ascii?Q?WAwSEk2N7WUfgnbDvHlMTzkW7xDQxx+NWiQDmQei4gGgxwK8RAEKRACgCMCB?=
 =?us-ascii?Q?VW32fuwJXN55hYDWQ++gfhSdNgKCB/cmJNumE6DL5eDrx6yFfGHVIWMwqd9G?=
 =?us-ascii?Q?iquhOyv+M8+QhQT/xf/0fpCxzQEPuLa/K/8dK70gO7X5f7/zG/FHIeI7r27Y?=
 =?us-ascii?Q?iyD/8clDqtZmqMhtIxS9Qe0MnBpfRClZTT6STUOwGFONBig2CrL9NsJrzmzQ?=
 =?us-ascii?Q?OBLW3pzgcQsadVFfYwtKUQfW5C/yebG1a2wU9ZsnC4WJfNbJOXBmFtAdtUzO?=
 =?us-ascii?Q?uG7Mvn6iGJu8JY4aYyT59q36IqOw55v8JxYPzTbjLk6Nt43+AU+aWUCtHfpe?=
 =?us-ascii?Q?3BgUOJcWF2njq8Nbd/OaXnhIL1qZHoAGVfgwTB0h2LBkhgqU2ayQozX1xegL?=
 =?us-ascii?Q?qrolk03qPnRou2SIsXvH/cUciJiO0dGgwgcfFXJYF0imTm5lKT8Tl2uL9jm4?=
 =?us-ascii?Q?5QA9Sc3apjNW0VOaGaGEZzqXHdsamA8+aHNFpSjY2wc/WfCW0sTCvQrtcbGV?=
 =?us-ascii?Q?wDMDx+Juoz8HG+ovKimLnl7Mvo8me3Vl24yNi0DLtaor6fM4pxBUf3abizja?=
 =?us-ascii?Q?EX2yR/Kz+eJ2Noi5P/H8TO0d8KIJvVUhv5SqdMUyCbY0iZ0cewoGQ+g29Z4Q?=
 =?us-ascii?Q?hBehwY71nS7zj2SjBXILboMAya06YibaqG1ppq5+EykASivtRmm5JnfX3+a/?=
 =?us-ascii?Q?AgjAUF7+Wq67+T4mn5YC0jlAOk5Ztlbc0vyNvfVC7ScZMXbUP4V4NqhpwQi8?=
 =?us-ascii?Q?1/FnWsOa4CiZ/HJGiwgy9K345OWFXxxWRIUOpQtFtsArqIjP403ovWEcpltZ?=
 =?us-ascii?Q?6L1J7nGPHt2YeP8G6FMsccLCbRuJWQ9dBZWaOFMm284L1wzTZs61iQ99Rp+6?=
 =?us-ascii?Q?IJjI7qaadA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a30cbb47-e91a-4aa3-a790-08def912c6ac
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:13:37.1663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUO1TwyHEshVILPMNJTXEwYSXpwuH5oT4haOpaPm23dVCexG9JA+vGfsqqtqKlvWkVZwSD6bBF3Xjlu+84X6Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243337

Update Upstream-Status from 'Inappropriate [OE-specific]' to
'Inappropriate [upstream ticket: ...]' with a link to the upstream
issue filed at GNOME GitLab.

[YOCTO #16230]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../glib-2.0/files/skip-monotonic-time-similar.patch            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
index 75eda15c98..2ccefb6f3f 100644
--- a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -12,7 +12,7 @@ assertion "50 * ns_elapsed > 1000 * us_elapsed" to fail.
=20
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230
=20
-Upstream-Status: Inappropriate [OE-specific]
+Upstream-Status: Inappropriate [upstream ticket: https://gitlab.gnome.org/=
GNOME/glib/-/work_items/4025]
 Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
 ---
  glib/tests/monotonic-time.c | 1 -
--=20
2.43.0



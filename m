Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8288EC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:21:33 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2527.1786519286647596011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uDpfPJgl;
 spf=pass (domain: est.tech, ip: 52.101.66.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYXQ3AKKAtHkWpMklrawgburkcIsQyMFtnh/8PoZINeatqpS3JSz3mqjDW2xx5jLcEQI6OtqbxJiWGiD+A5IHsNwNXbZzhGVeMLtWDaQ/dkgLoJpXswT6AWdYcuGEfAFkaT+CEc8+fTSvKklpqf5CGmaBcOw4g+8ByVicpugrGNnQuDXr2KNrmzstRc3Z+TNiQ2Ul9w+I9SG+JOZb40sVyRqOxWktfHL9oMZYkSDYVexxeMX/MrWACDcEHpXQMr3i6EPiJOAjzunFUN7Q96reO65Q58QIQ1JHWZvzuJkaStcdLPz/sag+JXNdgzxyNQT3iMuO+q67uxxd4S3mcXHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66l/fvB+VzoVZOgjwn3M81F9X0djREJ6TbzBqPvq6oQ=;
 b=ym0h65Qhvbf2apIb4aA+3J3zEvhXcyRCKA35ReIglPfwSHv1hVerWF6TypQXPk8OGHHCs3ckNTLUok9WH5lymeDkYTSfZR2aVVECHP7G615f8RWg1sZEDiDcgFKWnbROUYaWDm38V4dWQw52WO5K88ZTd1cUh3UzAjpsbr9UxJwgQA7v2K8F7zoY5eo2apwUibpgS6IjqMFEn8+ylAxx3HoaHtgtIP0BaXJaDskVncRnsVYH3Bh0hUCy9Wn/ZIiejubyQA/0VzX21Pa6lGvAWeX2NQOMfIUZSIY5zkSQjdkRnH8GQu4tj+zidDCc4xstDt1h0LWK7rq34IItGn/0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66l/fvB+VzoVZOgjwn3M81F9X0djREJ6TbzBqPvq6oQ=;
 b=uDpfPJgl1MV5NGMjPxCZR1f255CXvtp3yaaMe6THWnGGZg5qJAkJWu8vFtZlnfOdktrC/WrIrjU7O2P//ddkTdrrhHhipp/iefCW/ls9pBTeMFIjAnf6Pa1ejwxCZ3VFv2UELnubr+fetONokPaU20Pb0+Ik2Tfpx5FW1GsyAZumsAWMyuXzAP0TjVu7QybB+xMLTEcy7CQogXhTh5rD0bX+3rLIBDN7EmZC3+11YuXxVwC236g5HzC0SFILjqzA//PTD79byhNyEim1dSRIH3tXfVTyzhTuyO1H6i7ARnIgpfFoAefnLcLC/G6o3uee5UDrPu638pYZq6E9MFkquQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ae::10)
 by PAXP189MB1832.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:21:21 +0000
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6]) by AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6%3]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 07:21:21 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] glib-2.0: skip a timing sensitive monotonic-time ptest
Date: Wed, 12 Aug 2026 09:21:01 +0200
Message-ID: <20260812072101.10905-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805131657.35726-1-pratik.farkase@est.tech>
References: <20260805131657.35726-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ae::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3248:EE_|PAXP189MB1832:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bb5275-7100-4fe1-5b9e-08def8424f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FjE6dIZYn2nc1Rc6RgkgzsGgMfsiLCzZ2ks6fAuiqo85GG65WhWDffMD0Y4HLHh3M/D+rcUiG4S+v85G4eM0ftI48+UzdE3ZhTmcbkW9kzHRHuJ9jaxEBCZvn6ucOKcgrrmsV8sjh7zIA9HD2YJInzWUtO7KQqyqpe/+WgfhsBth5hcOKJc8KtlPTCtxkVBSS8m9nYkSoW3KhcnStlUH0SIKTZh7psnEwAhcA34WLByZFdsFmr/WA85cUwitnLDhxXIif4b4BcV7mCqYYLS8Cd3Wu9SCTm4L4x2dO1tNHQVnzkB8OLyCmtqiIKhA9785d1uhYflkNl955K0bl0XCBMxwGt2VBdRA6EL3Y6oSAhKOuoeV9P1Icv2pT7/3Tl+FEYxE99XwWzK23KS6RmDGMAEcu1LjX3KaOkR/Q32KbCERqE8WqaTl/EHzitTC8bK3+jOilTJoRpTfyAQ3vY3VWZ3SMTICAE3X8ssFdTfFU6v+ToyJXXAQxglldJijfwDEFYUGylG4LiS6lAYU9NjVha6TQ20eerZVoHv7ix5yi8eLI8O4La3sPtfiR7mkarOPV8h4Aak7nM0lAT+JJQdP+XViRl/PwqoTbOmQUdsMUJHzlcvI1fzDsxYRZErxMJxWTXteKegxTzjQnrU0Cqc5Fz87SDiRtLg41vOLfhJ1fag=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3248.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vp7A7NJMI+dRKokgfB/bGy3PvRUgcAlO3c39TfM6CJqyUiH1LIROru+kRMa/?=
 =?us-ascii?Q?yLyZ1eRwDJp13lwpgjpk4VOV/cfT1azJMURCnJMjCCY58dp6a5qpVCg5M49z?=
 =?us-ascii?Q?CTJS1U44zCGHxFISsWWK+UugWYXsg+VHfBovgErUtdKiVu0am8wPnl5agQja?=
 =?us-ascii?Q?pKTszhMg2TqIaJb3gJAf9kM6ViAOFAY4EXtGWn7DSrlrL0uPLC0XGTmr+LnB?=
 =?us-ascii?Q?awpFbNme/Efw2WwOM8loQk4mGumwd5xtkhhqDepJxOTkp9WjDybQcJBakkvN?=
 =?us-ascii?Q?z8bFOCD5qInMo3UI9ge3PgRtHABJs0R8exYyq+ZfQqc9H+QkdWKkht/9Esz0?=
 =?us-ascii?Q?ULnZVdn19wJDVHzmqyDgzjPsxhb02X8HVZpLh17g3huDrqH1wRxzmT1cHLnZ?=
 =?us-ascii?Q?H7fZFyXl44nJqZl4P1OVhjQ4I0sKfBL9gQ2pFzrO60IdbhHXoWc47f4E8l6U?=
 =?us-ascii?Q?6FACj6ggxSuxGLaC4YP306A3gz7qGaU5UHuKH72aCIkHvBq+qg5lt/G0X7vc?=
 =?us-ascii?Q?YPk27qtEWrjCMRY/zEu2x9Kwf4Fl4ftOgxHGcU8cW+jVma/auJv5tm+GMuJX?=
 =?us-ascii?Q?Qrv6jjtLIeK5rW/aCmvgd1WYCmkPVmPCHOEpScJVRXF3vxp3kenWiL2/jJYc?=
 =?us-ascii?Q?85Xz3mcCD6oapQhbkiBCd/7K6y/0nslYQUVETl/6XbjLJUO3cmadeXi938VD?=
 =?us-ascii?Q?DmciLYLWXlk2KQwXJo5VMUpmG1tukn/ZwAGs3d4qXrwNwV3Qp7y9oUfxea38?=
 =?us-ascii?Q?K8kUtI46Tw0Chp44DdnXgr8R4MWdKYwGiB/gw6wbt2qFIEEVDxQY8cwe7LMU?=
 =?us-ascii?Q?A4dH0GPfqfkpp6e8j8VRcz1GDwMjiR71Sls5lkIKlU9HZo3st0o/TGCWK0ew?=
 =?us-ascii?Q?oNniDCG49DbCVJQo2YbbW0SAHBh/RXzhdqV2fZKFyn4+eQ27zDuYTJRO77If?=
 =?us-ascii?Q?t2MadszjMcM0UiF/EQ3kr3CNR1s2cidKiS/dW6VFSGeATsvS/WGCqH6Ol0+E?=
 =?us-ascii?Q?O+QFGXIZTblRF/rhYlC2rsRVqqZO0rsyD81C4q+z1F4gjFLG69uWNUU6KWbs?=
 =?us-ascii?Q?7mtFbtSKU4z5X35osZv3pHLjckQq/HcQywSMKIqan+uD5aldkzYtsWQZZup3?=
 =?us-ascii?Q?/7rOtCseaYzuD+oO0Bdq9LE0xd+3E/dQUWhDayC4lKACOGLAdH4Wu/7B9GoB?=
 =?us-ascii?Q?Z+wWZc+pDHBhie/uhkoZTvYGBtfgGYBPRnLOTqIEGKVGMqnUhy1D59KZ5b/k?=
 =?us-ascii?Q?HXXczBN+IzPJaJWWP7aNojsd9WERtgZn6IcF8EaIrsqbQ2NpmqNh8AU4BNPc?=
 =?us-ascii?Q?/VMa20+yvQ+lbG1zQo+Z+ORsUZHW1Xi0A5wtS4au25x6pxThozzr5hTK8H8e?=
 =?us-ascii?Q?QDlmFI7avHBFPr/tVqU2tIGHVJy8BNhMzxk1R+sjVpCH+XgxYLc6/7JIHmVV?=
 =?us-ascii?Q?/5PgeyPdkbPLOyCGmASIgFMEOpdYm1fLlFHeGPpZUvHgBlxlTqH1/zJ7Igu/?=
 =?us-ascii?Q?qbG1ZtMxIpoqy5xhwuNnasHg6A/rv5htHAxJv86yiiprNpx8gpz21nYITUSi?=
 =?us-ascii?Q?uBn3g6GsmkvDYF/8CbX8PyTwMWUvGS+ZLakF6lmT+kcA26kJHpfmg1Dpb3w6?=
 =?us-ascii?Q?MKkEsNcYqrnkf9fPJQVlh6ZH7JA62UyRVO7CvbUma9dP7VJel+wJ8X9wwNzI?=
 =?us-ascii?Q?2/+4LmwAeeVtYytIuXiA8hDv3JBlPgcshJgeduYIWe1R2fNE0SqYmeZrBVFx?=
 =?us-ascii?Q?NKZE8wIHkw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bb5275-7100-4fe1-5b9e-08def8424f76
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:21:21.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzk9WDegalgJdF8nZfiJuKXHjXs+b0Fpb0VGp9lI5QC2O+aImLxGmi4H6TD9tu1lC10wNjiGy3Mt086xJnkjlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243246

The /monotonic-time-ns/similar test compares g_get_monotonic_time() and
g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
and asserting the two clocks haven't diverged. This is inherently racy
under QEMU emulation on loaded hosts, as the process can be preempted
between the clock reads.

[YOCTO #16230]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../files/skip-monotonic-time-similar.patch   | 32 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/skip-monotonic-time-si=
milar.patch

diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
new file mode 100644
index 0000000000..86087d3008
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -0,0 +1,32 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Tue, 5 Aug 2026 08:00:00 +0000
+Subject: [PATCH] Skip /monotonic-time-ns/similar test
+
+The test_similar test compares g_get_monotonic_time() and
+g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
+and then asserting the two clocks haven't diverged beyond a factor of
+50. This is inherently racy under QEMU emulation on loaded hosts: the
+process can be preempted between the two clock reads, causing the
+assertion "50 * ns_elapsed > 1000 * us_elapsed" to fail.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230
+
+Upstream-Status: Inappropriate [upstream ticket: https://gitlab.gnome.org/=
GNOME/glib/-/work_items/4025]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ glib/tests/monotonic-time.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/glib/tests/monotonic-time.c b/glib/tests/monotonic-time.c
+index 04ff898..dae0533 100644
+--- a/glib/tests/monotonic-time.c
++++ b/glib/tests/monotonic-time.c
+@@ -153,7 +153,6 @@ main (int argc, char *argv[])
+   g_test_add_func ("/monotonic-time-ns/increasing", test_increasing_ns);
+   g_test_add_func ("/monotonic-time/usleep", test_usleep);
+   g_test_add_func ("/monotonic-time-ns/usleep", test_usleep_ns);
+-  g_test_add_func ("/monotonic-time-ns/similar", test_similar);
+=20
+   return g_test_run ();
+ }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index f554145bb0..903d56e05f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,6 +235,7 @@ SRC_URI +=3D "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only=
-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patc=
h \
            file://skip-timeout.patch \
+           file://skip-monotonic-time-similar.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
            file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
--=20
2.43.0



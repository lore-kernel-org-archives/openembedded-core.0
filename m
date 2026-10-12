Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203DECA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jd5LYaX9;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0eq7SV5GXBsqbSXuhKZg9NBZQnkgBd1NbQ/DP5m8JBExFF/WR0hSp4CWjMtMK7Aj6kVLcrSbqdIqxVy8p/k5SQ6QYSWFKFVeF8aAH4Dx1bkegIQmNCWwI37gOE0YJpEojsg2VG8OHxzj7tZqDlb//TPUEWQy6VFC7SyHrr75kP2umf2eaHgQHoxxOZqQtiOzhY8xZMRabujl3dC83oIPNEBiuQHj6e6P7G9JCAUtRSAfXbqISUvLymeHtA4HV/Or+gnS0DzNMxOCIc7RQ7j4VTN572E1XPlzwCUgbdxGkXfNw1D4ZPzVCAQnaOM/HWqtnxaEGxLrOHui/LKEaYirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwlcXgYowNSIsPOiUfCpM9MH0iRZNHzNYSguzfVh2gY=;
 b=MrosCbgGFWHUHpLAPm2wNxF9S0YVVD81BO71tUj5CXaCjYg7bNKUiCPPUSNGcsOZpuE7zoD4H14vHn7MAu4lGeuPAY6GeErwE/nwcnTqYRbZwDNuzs18CsiQxEUGpBLNA5IDGi5+ZRVemYCxf7vVDYjfSRhV7oOx5h/AYTViqMy6chqFTLnFVpo8CZ6UN5fzPmCFGZIMVJWcYdwTgG7WUBSMVpXRNbqYfNwUUe3MSRSRhrmMnjkooyWf1iLVVrRb6S7+hlUuiehmB1Yci8F64NNhYs3E2cuuNFXU0omLt7ZDq56z+wfHXjPO+h5E8PuVb7JW5dhuP+0gwIbH85i6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwlcXgYowNSIsPOiUfCpM9MH0iRZNHzNYSguzfVh2gY=;
 b=jd5LYaX9stsiQuBM323eCPAFveq1WfyYodIHr2X9pv1OPfdwQ+A2lI9sUco/U435w0zwVUsJ0kFTloFyC5pPmAFJYm+sMz66snF/CXmbmEvuehvus7aqvcpFJ9o+hipA2TYvfy8wmjsWY3BKOfjR2OdB+cbAexsAqpJ6bEm1C6MLEO2KJrsexjkQNl1E2RcbHbjl7B0yI6MXqT1huyuVCFJXStoT/5EzCoFlkPXjFKSnTuVTovdZ2wFNvnitYJF2Lji8FrimDCN+kvaI+3myGOWQSm6MEJ74je3PVDqJUCu+t3hlrJJJhdAPkeLOHvdWlbiq0VOQoATDkXj/eN6HZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 00/10] gstreamer, gst-examples and gst-devtools upgrades
Date: Mon, 12 Oct 2026 22:27:06 +0200
Message-ID: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fb72f4-8545-47bb-6014-08df289f364d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|11063799006|261009223027099003|261009220027099003|261009221227099003|261009221727099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	xwYNQ1CQf8Ea6LE/jGI6wIjPgoG+C7WDwJ0kDYqnB0kLXdDiLNpWc4hKWu5skXUawIZsKuvX52mjNBFVvgV4YiN9kGDG2PFJ3+rV0JyLX0orD1qnOq9w9KFEVzL4seWRKd6yILtDvvSdVgjurk0k0OLOfmShhBO8lOCOmZKoegblD765swdaJCoQHGLPUv9vyf7pQPw/2+nlDfsTYETlJfk922tfT7QdgyQpwuS7Qnzo3wzLoZ+MoUxEgJU2sfOuzzUgKfrV47+BLRv2rE7TdDaownuZWawkKYws9tIGhwenN+Q8HlFH2xN1lW36kQntvkeuayIB+90YNa9TkwRRc+YbdTiP+HGQ42pccVVYXGCz6Mhg+1+20CCvPzkv4xCmr0uQxvKPrMIBXIJCPqmqXzEvvNK1l7uzDV3lM6sUyMV6qZ7wwYfvdxW3WXebMWJC4GHDnld+LJro2AsGqvFlMgWpWC7nPRIoj2DmwdfykmFgRehSvVnYWUchFFu6xQf7LMPuBIQTFDRLTtuA9bMXdCJrQAIMRTvW8eUVern13Tj4oR75xc2IJE18HIB+OKgzwvUIDLMtyz1vLqr865r+F+4nppqjVv/DybryXqyY1myEclF3sK/jIx36PdEafzBwODDUMfZ3ewmXrKuvkuQ3sVEchDEZG0DlaYN9+bYv/MM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V56TBYUBr4bWSya7/s14pN/Rg4B9vFr6K81Ou8DBnBbJ6YSfGu9MuYYUNduz?=
 =?us-ascii?Q?PZ2Uj06584SGwWIPMVIL/TnapCIxkPF8jLnExhrQG8TQqrNqSbiVN+sUd3Ef?=
 =?us-ascii?Q?HUY7ExxeCUsD6sLS2JMIE1kORqqFQeWZX9j1rWjF9UcjX7g72faC18dUe0qU?=
 =?us-ascii?Q?+UT8mAv9weN3FeUkgTK4gcIyslfRqOA4agco+R4XDPEN2HqFWfX1CIP/YIgn?=
 =?us-ascii?Q?iNgRy36+1y0MAIZET26uix4S7BNrjX55GC5iSzYZt24cdY9ZdYGA9Kym05HI?=
 =?us-ascii?Q?VqK8bnFK9q/eLYOjgN8LhPOAvNoXFh1SUpHq1Tt8SnbhnQsfkap5MHE6JdKz?=
 =?us-ascii?Q?Eaez4TmHJEvZr95aeD3Q++0kWL2aYJ+qtxigfgjIvwNwwlMvcJbGCQh85usJ?=
 =?us-ascii?Q?x2IxEwOba7NT7YgS5VDDznvx1ycTMB8ruYh+DSQF6zMo0dIAznIsUJ29S8yO?=
 =?us-ascii?Q?jRyNpacs+1i8Z1OqNQr4ajvs39bzzNlJodHHZqVwC7F4luwMmYXn1Hh0QWOX?=
 =?us-ascii?Q?OcGjj/urva2EsVMOuZ1ES7+jT3I1Eny6AdS55CAiTefvpnUtb8pOxVen+gdR?=
 =?us-ascii?Q?GDI1bIpoHZ8Y72mzXiIOCizmublBKKc1lCXeO/hodbpJN5OOm+9BGc18YV28?=
 =?us-ascii?Q?w++YHsWejrLTWKrFEqV9k1HzHn+eWrRtV+qNsio8SB6pRZ20/VSQnfvt9EHP?=
 =?us-ascii?Q?tF+P9MiEQ2cf1+effh+Gh5RNfwTrKxo70aPaGgA0n5dOLyUHOemaljh5JDHj?=
 =?us-ascii?Q?DjNBn7sXn8xPjdmiL5WxrmMLPN7cVnoz6qFPhXqYQ4YJ5yuBS5ZuK/XdbSxZ?=
 =?us-ascii?Q?Ok/PSY/NeLw0XW+ksrqJrrB2qATz/TzJ87BdS8v0vmTSCTN29cL037AKYLBI?=
 =?us-ascii?Q?0z8uKpv5JAuWQvS1PjlVqF7jQgL9x0KGFNxkJiUQPZugWmrIuXlb6XxudMtP?=
 =?us-ascii?Q?DY5VTTauy5n625f9jPYhbyxQJYGqgZf5OhjwNztIzzdpxcaYzznPeb1J1OyJ?=
 =?us-ascii?Q?KdykisMME6TjmBjQGbPci/au6EVBbeoy+0T0QuQWYwWdGS/InyxtaLgdgsOU?=
 =?us-ascii?Q?nN0CFPgLLiZHIcwLWdvtDRmlrCPSRxaxScq5XmIYlizCOG/FRAnte+61hLqQ?=
 =?us-ascii?Q?a7Ntgl6kaTXIU+ObhIvsLLb85Wn0diNzwgPPuH6ixnttkn44Mzxs8/5F/Mq+?=
 =?us-ascii?Q?gNEKwlbTI9xYINqm+G3pmpHa6xBhU8u3YVIFSUgkA1vC3r8xMROSRSdnLWJm?=
 =?us-ascii?Q?z+M1Ob59YZN7EX/+0StQh21o6/EFUJOH9BE+KQaKQ6gROw/EYS6eZKlYRLuI?=
 =?us-ascii?Q?EaKJkck/KHwjBUYaqoBOOlkeezrWTlprYvpQeUFUH10NhfqCQHeOsED/Q4mn?=
 =?us-ascii?Q?Zqkrh5+wC6mAHYptadSTZ78nN7Gzl83UR5YCOOU9G6mOKFk1meFP2/Mf3H33?=
 =?us-ascii?Q?PRR/d/M0cfk22KBiGA0SFE96/kL02x8fxPGcvoFNFHUJgoTRbFZxkOXZ56ks?=
 =?us-ascii?Q?fCmvX5RSm6u598MOhuoIeBK0sKuRrACAZSkeOUMxoAkrZLda/ppXcSl/bxBN?=
 =?us-ascii?Q?ggejYk4ch1h7KDqczwO1CCj7xnPq9N6HScvyw89IQvhkTApmzrOdNuoZ1sQ5?=
 =?us-ascii?Q?1En+yl1gWSj4UMMqwzSDYeCbSE62gAFItTuKA96KUU6dQgxYXAKJexCnlx6H?=
 =?us-ascii?Q?80XFQERnknru/KjP0iPxH2E83Y5O/z4+FRu10k2dqpMzA8ruRP3K4cRJnnZQ?=
 =?us-ascii?Q?wxI+Pe2zVmdo8WKCVwg2ZeBtFCKins8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fb72f4-8545-47bb-6014-08df289f364d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:18.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttdKl57qK3voh0i1aaoBgn94boDlq00+aOFAdyQ+Dm497uoKliU+VcHd/CsYb8QTn3ZtTDAk081YXIvArfgGXtBgRdwUHOqyL9kY8cUnTHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247675

Jaipaul Cheernam (10):
  gstreamer1.0: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-python: upgrade 1.28.7 -> 1.28.8
  gst-examples: upgrade 1.28.7 -> 1.28.8
  gst-devtools: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-libav: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-plugins-bad: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-plugins-base: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-plugins-good: Upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-plugins-ugly: Upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-rtsp-server: Upgrade 1.28.7 -> 1.28.8

 ...1-connect-has-a-different-signature-on-musl.patch |  2 +-
 ...gst-devtools_1.28.7.bb =3D> gst-devtools_1.28.8.bb} |  2 +-
 .../0001-Make-player-examples-installable.patch      |  6 +++---
 ...es-gtk-show-player-warnings-in-a-dialog-box.patch |  4 ++--
 ...gst-examples_1.28.7.bb =3D> gst-examples_1.28.8.bb} |  2 +-
 ...-libav_1.28.7.bb =3D> gstreamer1.0-libav_1.28.8.bb} |  2 +-
 ...-uninitialized-warnings-when-compiling-with.patch |  4 ++--
 .../0002-avoid-including-sys-poll.h-directly.patch   |  4 ++--
 ...solve-missing-opencv-data-dir-in-yocto-buil.patch |  4 ++--
 ...andle-padded-buffers-in-wl_shm-buffer-creat.patch | 12 ++++++------
 ..._1.28.7.bb =3D> gstreamer1.0-plugins-bad_1.28.8.bb} |  2 +-
 ...12515-get-caps-from-src-pad-when-query-caps.patch |  4 ++--
 ...002-ssaparse-enhance-SSA-text-lines-parsing.patch |  4 ++--
 .../0003-viv-fb-Make-sure-config.h-is-included.patch |  4 ++--
 ...1.28.7.bb =3D> gstreamer1.0-plugins-base_1.28.8.bb} |  2 +-
 ...1.28.7.bb =3D> gstreamer1.0-plugins-good_1.28.8.bb} |  2 +-
 ...1.28.7.bb =3D> gstreamer1.0-plugins-ugly_1.28.8.bb} |  2 +-
 ...ython_1.28.7.bb =3D> gstreamer1.0-python_1.28.8.bb} |  2 +-
 ..._1.28.7.bb =3D> gstreamer1.0-rtsp-server_1.28.8.bb} |  2 +-
 ...ests-respect-the-idententaion-used-in-meson.patch |  2 +-
 ...002-tests-add-support-for-install-the-tests.patch |  4 ++--
 ...03-tests-use-a-dictionaries-for-environment.patch |  2 +-
 ...dd-helper-script-to-run-the-installed_tests.patch |  2 +-
 ...gstreamer1.0_1.28.7.bb =3D> gstreamer1.0_1.28.8.bb} |  2 +-
 24 files changed, 39 insertions(+), 39 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.7.bb =3D> gst-=
devtools_1.28.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.7.bb =3D> gst-=
examples_1.28.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.7.bb =3D=
> gstreamer1.0-libav_1.28.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.7.=
bb =3D> gstreamer1.0-plugins-bad_1.28.8.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.7=
.bb =3D> gstreamer1.0-plugins-base_1.28.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.7=
.bb =3D> gstreamer1.0-plugins-good_1.28.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.7=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.8.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.7.bb =
=3D> gstreamer1.0-python_1.28.8.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.7.=
bb =3D> gstreamer1.0-rtsp-server_1.28.8.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb =3D> gstr=
eamer1.0_1.28.8.bb} (97%)



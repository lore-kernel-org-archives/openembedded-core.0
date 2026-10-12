Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81139CC6B00
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13141.1791811218138366613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q4r1z7to;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOelYCl2BwAGVKtUStF4gKI5Ek0XExhj6Dh+IlHwu6IQ3lLI6Z5aE1TW+Vc4Vw1RLu0TLeTLsUdz6iV338KIBLrZt2fmNkjBDSwsFV1sVWHVZAaAQ64EM2uQTNGqYMw/DMCm/8LeMDY44TZww5t5m+j8QYhPgEI8H+3Pryaw06rb9YSdpMLuPQig7XI3NQVC71hTQg/V46JDS1fTLQ+bsDldDgo8xxXmbjWKWrcZ0FZN09WgGePe6LJhXyHm/u0IC9x2jLVhKkL89kCh2OMp7YhX7j1HPXrBQ76dQp2/FMWr0w2/tJbm2ImNpeJkxrl5eJ/5M/dr+cna+ms0I8vRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpZS0RK8LvdwZ9jQdS47KaRtGSJ+I0UfoNOBf5ssyTE=;
 b=czHqFReXAgxAHHGqCASRRMxnWBI6sqRdk/z/j+3dCkrISEWEuApyMiYgRzfs4FoxKm2rF4jPCgG/ROL969CORH7AJxBmipDNqg6x/c+QG07EvhCirqK+FjYQl/2CB97lkzdXof/hmgc8544uBW/OGB7EbOH+IJm+9II1EeD6Z8MB5JuBxdCaPnX3IP5ADqpnbP008JsdCcP6u5gX+FaowoOuguZcNvRCrN3AQT2JwczwGR8Y2Ky4aNIJaYeroYZeyWGwaZGeSdwJADjbiJB22RT6gwGUAwfyGvxlVXcce4ubdh7LBNLw4+vv2+a8lh/KFEo3qytAjwTNn6ehr9y8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpZS0RK8LvdwZ9jQdS47KaRtGSJ+I0UfoNOBf5ssyTE=;
 b=Q4r1z7toe5GjOyYgY1fteD32b6xMN1q/QSnPZnaSuMP6ODsTLF+FlPoNsMdIGfApU5Am7LDGmnAn71mPYilSdQ2e1dO2zon5Y/d6v9PQIXE9gxHUSJZr++beY17jNqWNRcDdTtp1/4WSRKX1GDrV+3gMcHPMAolZI4oQm72b36bi5gni4/rMTvjXpiTfHo+qz1IKVSOpvCvhCnmTbGCIG+h0OdD+61eWKhX3ODyNvds5t8cvcyqes1Kge5lI1s6Dmivdr/DWxvyK2iSlexf3nwnsfIFFpWG3QiZw+qL0y+mpOlrn0e4s99vZ0T+9FhIAb6QaIxVpeeJwlAfTqZxwkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/18] gstreamer1.0-libav: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 15:19:55 +0200
Message-ID: <20261012132005.23909-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 954d85fb-f3cf-471f-c532-08df28639042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|11063799006|12006099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	2x9RCq0DpzMvzI5Ge3Lp2HbS8ZA3aJYe9s5pqUqiJOnO6mZzy2bwEh73leEKSiHpaM9kLbVhlWkwCZERxlG2yDaQGEmx+/BXt27qv+v0qcaSNhNxuUlM94X0siftKAROfvib0HHm8vtftGCYGCtRnlNXstlBcdNMu3z/ABJhrTp9ATWR9gXxyX9lY2ksklD1eEzyQPz7CaJNVjlOBGif1zJ2WpmGAGB5Vb90O8AZpY+bfOq9qU6RaKVDoqiBiQ5Kz1bXIpkyDpuE3iAPMSlcKYErb7PbNkoge9wdiTN4/UHKxPX6X/Xv+g+ysx2BcYAgitO6iBjfNZmGeQVbgnpK8senhpcCj7kWpEMbkl3jPb3bXr8sG1F4V5ldkiJmlwQsiwxU4OhBJzRQNONiwBWZ1VI4wXP+UyCiR8rX9T4buJhixoVhTsj2SsNh183jdhEpblrhZj/8oNPupHtPbY0iVq1OMJ7lJmQ7/PwDWNLXLgSrR46zbTwi9+uMA6V8RMFBH2ZtNlMTF3VHzpGq27jhsx11r2tJGNmzYrkEjyyN46ZB7DrQdvvpPmPf2khpeNQAySG8HYltQb2lv01dwb+UZu49wsriGMyxS3BzsTAKny4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(11063799006)(12006099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4EPIa0UkRhDmDDHCTU1pYhE3I+d2CFqbtCjhFEfozzWcDzmG4l3N5alLXbPL?=
 =?us-ascii?Q?QpJytKC6emLyu63PhE8u4yc6iU3JoW8ZAM5OsqdciXL9kJvdceu4bo4sRWai?=
 =?us-ascii?Q?Wt/AMDYn9M/cu2R6gOze9bkvY9jCJmXssQXTRcF1LXjq+u6JKdUKuICxb9ev?=
 =?us-ascii?Q?6kj665MZ0M6lb9OK1ttYa2ri8GeimobSo7pxTpgxxRMjGJ9uoZZSMllQmhon?=
 =?us-ascii?Q?BtzNYDoMRryyDt7L+I3SI2NyhV9CZ3dq7YTyR3lr36s1NdzZvJJVmfJpnHe9?=
 =?us-ascii?Q?9LeE5PtBkkf5hhLr0qMpD9ds5URA1EsVxzYg24ZODQOzm9SHeyOMSnw6VKE0?=
 =?us-ascii?Q?rSZdMp1A1BnOAAC0CEc6axs0anmFeXaciFl37SOKqc7gSi+ikyfLBJFEi/Ro?=
 =?us-ascii?Q?BITnbjA8XO9pLrQ+gc/k7LDlAqTwuKXP56dDgpF231Zwcb6UdPrASSgzGLkq?=
 =?us-ascii?Q?zkikdZAv0AeNzTwCDo9ZxDZQr+D3ankyRKdg7aDoJnnqOc4TooLIeGtg8mOt?=
 =?us-ascii?Q?itgw6GsAUoUlTI15QKcz+i9E0C6JXWXCyIxSn2LNp4OrjcZUG827hSeiFrI2?=
 =?us-ascii?Q?da7tZc5DLrqmdFf7NAn+xPN3Jam6G1/BBTLkHklxn4ZLmcqmtx459NsevEmg?=
 =?us-ascii?Q?m9zI6ABxAkRrmrruzeuNrsB/2g9QCxsE7lSEyVQTMnJOmtDlrv+qzaD6p53S?=
 =?us-ascii?Q?J9Q6Uuxkh/HQ6Um+UBAcCufGuSSIao/yiLIvV9d47Lu97DM8Q/f+DOg1ssBT?=
 =?us-ascii?Q?bdzzm40W8J3hoxkSRF9gzl4JA7ln6rZEmugmUJJ28zLug2I6q1p1acRVxreV?=
 =?us-ascii?Q?zdP7TDKN4fi/kLkXbdIqyVX+EyYix+fr8kC2r/TrWfwBIpI285oTuaxKK22x?=
 =?us-ascii?Q?P0f64af/W/x7YrTd5lBZ6+Hl4LfR820vP/+CAdwnfOzOLP7T4c8v6T3q5B3c?=
 =?us-ascii?Q?QRsIj62WjvrxWfkVnQi4uYVGWEZuVQ+Am5dOxu93EPzELzr0V+bHK44pkd0l?=
 =?us-ascii?Q?RuYVf0NB4XinVoy652SxjCPrPVk3JVftL4WWvr1ELYGAcxTp85vpBQYXWMon?=
 =?us-ascii?Q?kkAybYxgJ7O3Wh9ldwmM7B2qcuk668SBZvn78qFNhdIIfVah3Z62sUoOAW2Q?=
 =?us-ascii?Q?we0iRbyQJ5JYE9wom9SYegvcJK8IeUApJ4hJWcNap+KP5uTnTcyxy0SB70Uo?=
 =?us-ascii?Q?tAdQsZBZiBxVm6gZcd/tdARBPI5ZrOH9wcgqnnHWEgVOpeXPKePbf+7Qz02X?=
 =?us-ascii?Q?2xzSh31MUBhGJ1hTnFf60Dtw5ftTUL40XWt97uKmGqt/qTWUpe6TMTaPkn/p?=
 =?us-ascii?Q?CPi0uPnH6Jc2pt8Y28mHFT6g1YDMgxpNd74VHTtSXsPuyzHR/r5/7VI3GUh4?=
 =?us-ascii?Q?zTS2Hb+PQBOXzTUoy6Ocl6lzRSTyjLW84zJEE1Cm3AUJDlxLWDmNsxk2dqbx?=
 =?us-ascii?Q?4kTeroeWVFEpm4zo+ToqJxt7ygY+RxCnEFuc/Wj6LfY/sYX5bqlmMO89N138?=
 =?us-ascii?Q?SDX3mePiTUEjGaLu0T+0bQnQaEQ8U7X5TK8pBhfFnWadxXnONawwLOS0o4cW?=
 =?us-ascii?Q?YTLaI70qZeHPwcyqQWkpH4z2QCk9/jnJGNtqVne75kDgNKfItTRQSfBpAu4A?=
 =?us-ascii?Q?Ckv3rps2Xd+kVuvZoir/Sso+nVaKcFn/965HEpULEGLa3T8kohPaCCGt0Md7?=
 =?us-ascii?Q?OPoxPdm4cgmMvkTuq/wWvqnCEWgugFPboVwhr0i0GCJV1N/dZ/SR7OugfcKg?=
 =?us-ascii?Q?2wDBrISW5w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 954d85fb-f3cf-471f-c532-08df28639042
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:19.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uOwXvZ4XiCyEWHWJSQVVwMsFRWze3ptZG1t4R8tAhseAIN7aVmX/WSqD2ipBNDQjvkm6i2PhjFDJn8qYDrpn6XZXHKaDMGiTr721AMuyPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247652

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

  - Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...streamer1.0-libav_1.28.7.bb =3D> gstreamer1.0-libav_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.7.bb =3D=
> gstreamer1.0-libav_1.28.8.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
index 0eb98da021..22f071b17c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb7=
7e486cc36129f7a770 \
                     "
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "58da51dd39ecf1cf6faade34cc6412001be2e2e145bca8ae0f=
45336f60a36ab2"
+SRC_URI[sha256sum] =3D "98ad3d7f8932c495e268708903f1c3388d5f26a0db34727a9f=
861ee23b724177"
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20


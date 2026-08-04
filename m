Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E0BC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:10:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15910.1785849007969022635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xt59y5fX;
 spf=pass (domain: est.tech, ip: 52.101.65.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM7ra/JkWVoBl3h1+M3v27RJqLzSCx3bSmX+rosct6q9VvtAnu2wZD4gBM4BqlGPyuafNBTbS2rpqvB9V4ZiUCZyXO6AcESJmVpgS+2qfTs8NbzTIDRyQ7EzBYJW9WKrd9pxUYQrH6mGG0+0u2v5ehVhMs+8zlwhAlwokg2aaGPLNSQOX8V7iD85Xd66jl/SIU0EmoirxN8mkHS3UzEtOA31PhbNW4Ceq4mSkd4YNeQcfucm5R3x5hPr4pLQOMpHKdNg250dq1XU/qY9+cDjGI8A5ZdIhmAcJPWcE1z53A4fdP8JoddB3rp/zPBXk4KK26iariVSTDKSMSQC2Q1PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7czfEmrKo+c3X6QHKInz4mqjLvAd6hFrzUtOuwQUiLs=;
 b=FRAqM1l3I5o7ILTUKaYQ+v/rdww8BlZ9UX301xasQC0one1QG3dy0nZbXweWlka06xpHSB7icribL144XsPaAZVSEHEaWojojlTdefUZBpzY0frbpIJB5RrZb/mq+A3yaURwgce++WG30emJbJ9IourtXmEFHvX2HzRH9XAwbBmzOR/vU+KfMh/N/Usp9NXQLXW/TIjWAyf4NVLu4xEMoQ8OZqouB7tkmWe5173PTXbJ34WURATYxzAL8AY3woFBZ054KFNvHGZTLfsWUtuzSXkRQxWHix2fFDvTyOWezVGqgMtGDyQeogvbualVBXej52iC8FO4GSx6vFGlPAOhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7czfEmrKo+c3X6QHKInz4mqjLvAd6hFrzUtOuwQUiLs=;
 b=xt59y5fX2emvUvyHqGSxIE8h15Y8F80BqrCC/kjp/77IQ8qk22OztO2/GS/KBt4VfZX4MZQBq8kpoYUm3lVsdh1mhf9V6ltiKMo7DruHRsMF7YWka35hjfHPFJG6vmStantA3hoXMvhkU55BqhPZIifS52iG1U7cBReUtlMBuw4olYfr3h5/1S1tlGxqTnt4fZv5kOYTypgxYa3LTIuZfdXJtEZ6PYPMkiHoHUgN9VG06wxkrVvgox+gGxkDyuM5QJZC3DicwbmxMRyx6oXDEj0r4wy59kt/tLiunhfFcnHtwFWQzVy4jEZZNSE3s97PSdbwR9QwzlPs+Yv53NK0aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFB2DB17625.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:10:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:10:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 1/4] libssh2: fix CVE-2026-66032
Date: Tue,  4 Aug 2026 15:09:43 +0200
Message-ID: <20260804130946.3539-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804130946.3539-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
 <20260804130946.3539-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFB2DB17625:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d834be0-f348-4abe-f212-08def229b2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|12006099003|22082099003|18002099003|4143699003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	bzOJ52oGkvt4p3xgzbE+/E9c/i0cOXkmnMutX7/17u/M5mxIEJu/NrCaL8GECv3y2qrkYsDTfd55RtmLZnyraRHlH6KpLFeGGiVDeu3rHiBO3Ckke4AYJrtnaXtg8bIUrjsnyTsasYoL7ug7xRo6+2t/Wmn4vaQbdPvbRBBlAoVhxiHux2XlFX+jStDZUTorSo3j3Z3ozqdWNweIuVEpGR5zSqRPoaBE8QoEPVPykK6XM4VwP6rTsaajhzh8s0JXbd6PhQ3WBQkC8yI1SgvrMDQr5zDYfRf8vMDaY7oDTttgGRbWwn/Fxof+mYxzjydS9f+gPLWFZNiS4syg3gs2yruDhqWT2FHAtd4ckOzX4Et6Z9dLFLnivlPMA6DTL/t7couWUoJGSW8frBVscuVp9L8ZE+yhtZwU5uR5wSyVyTC298025lgL3/idSBw7Dbe9vizM49YCCRBDj2E0mcGEvyFY6zH6S9MP2TruHYxKpA93XBZXV5UwZ9P9HvMYHKibyGud81Cih5jh9mghmUsnXY9+iLkMkPLchOkZnMexwmoWYzYDiNgPo7tIQM4XMchF8PSkjNC/snf+4tJLY7E2DcZaiQ09A2J3l/tA2Nu983hcr3hJlp8Ec0YIzM3yd6WH/hk5rxEuIn8zeLzcOtcbMamCJ1+ZsqYiKcyOo836h/I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(12006099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?03KdL5HxyWr/PBj3UGzQNQUOuwVfDIP+mz2sO5xjE+g1jad9RuAihV0t7xyP?=
 =?us-ascii?Q?Kbxe6/wmkjzrCB6QGLqIs7ldLxjF/JY0MTL7tSRxllO7z/0xdunh5/1mTVl0?=
 =?us-ascii?Q?kESKEZjSqoJsekTJdftl+LEJGs8HDxeso4RA6AVei5NGKMr2WY/b5x+IQYfc?=
 =?us-ascii?Q?QTkvfTUBVOdxPgFhddl45vFLruXrsVFI9e4cuS+aL1TBCOpSNpqWRG1Xg0oI?=
 =?us-ascii?Q?WroJtxsOXh4GMg9xvZmyl/feoxPC+OF3psJcrt1kqbwMAh9zGoznO/LoI65K?=
 =?us-ascii?Q?MHi5e7ckdEQzSFuy0gaBjUsJSoWdTxaduwCg5mO2/VJX4JhKk+5YNaMKTK2v?=
 =?us-ascii?Q?AgkOEJAuAB4yt2qqhliJ8Cimr5GnXaVElsLDa9Mek0DZbYOJqx6GK79NsGzn?=
 =?us-ascii?Q?tWsH7wCO2S/rN9JdcBGBBXzsTX8BZozg83eE/MpNBKppuXX1S47twqGmec8V?=
 =?us-ascii?Q?PiB8/xK7gX842B5u13D7mS21JnhuOT/vAAYxCR2MtObtu4hTX7lNZ2RFQWpA?=
 =?us-ascii?Q?Gwy3jB8tICyMYOplIRhRDAZHRRKbSzMpH+jeulcz5Nnj9TLS5PmjwuPcDQpa?=
 =?us-ascii?Q?3ZU9WLCbVv8FlCXZck+wo1OIasFbyJOa2JHZl12pd0Hu9JJLN7kXAdMHerGW?=
 =?us-ascii?Q?qh0kO/6Qd/W4ANYx0QkZD3eUOuoZUPpO4aZZi0H794gki/64EmXIOhqRXK+r?=
 =?us-ascii?Q?ndX8u+I4Sz04LpMfF79dwqLGS3kMmOf0HXiLTF72sndHeZYDzmxU3mwX3KKO?=
 =?us-ascii?Q?b47mN4fembQFwfYSt2E33IbSOaABE00G2gyBKjqDqihypMrsmPDwI2rftDX4?=
 =?us-ascii?Q?iwON+qSY1wHwRhwrjAsdA/LlUC9DCDloHy8StZl3bdANarUtodWkbV70gXnw?=
 =?us-ascii?Q?cFn2jAikuPCYVmnJnxs4+zpmQ7uJHZH8j4jcc+LjgjfVUCJ/WD31IqOwAbXd?=
 =?us-ascii?Q?ow6H9iVhwJj4qmedvXbLQr20uEjxU+LD8IAZJruXYqzVxdqMgoeCTob4zIMj?=
 =?us-ascii?Q?q9Kj/VDzj6uXg/exToSgHq3tC62DIZxYCZ5NpsD99UWo2vhCt5NXKZPuf6xF?=
 =?us-ascii?Q?N5riTDo3s8fGxRMhEye1MFvkODKmfoTGfTA3idPWB7IGT6FxNz9XrsWFdhuJ?=
 =?us-ascii?Q?+9dbRphUACedTVYMEW69QBBa238/qAn5NAOESy/8LEBHcnwKW4QgTe3/QgNf?=
 =?us-ascii?Q?gezSO/Q7ni+cvneQgcf9NnzdKg7pkaRf+1cHH2lACQb/NXecJ9pyKki4cKph?=
 =?us-ascii?Q?ArS+bRMTXWR7nSn672lEUw9NEoQTdlCyfDmgQoSP69PyUvBciG6dsVAwLCho?=
 =?us-ascii?Q?N0W4lMp5x+4qKgNhSXY6Y2OLrtqZonrtxrQZg0aFgJtPXFLjTmreIakWvdx4?=
 =?us-ascii?Q?dn4yMTLytQeQvBLINBAP+sQG2Ke94sNkogXxAZfCLFTFEhbv/eiPixV8IE9X?=
 =?us-ascii?Q?ScmoIY+LJJnVutNFtxjgoEHAYnCJfXJnRGZ0ivNT0zDxk2fO6EDvzuSlXlNj?=
 =?us-ascii?Q?pXqqa0gpoWZvcqc9famt1IozbmgvQw1TeJK0JqInw5jIMgue72PxdRNSPe2A?=
 =?us-ascii?Q?isgO+gWE47B8edfQKKfSWxAVLanyWUX03Pnq6V3kbLZlczPX82+00Yivc1JS?=
 =?us-ascii?Q?PLowR5vfFTO5+snsDQl7y3FU79YKcBDvayN8jouwAgDHPmLRyfMusyHvLSDP?=
 =?us-ascii?Q?PKfX6QagOH+FQkmdzUPBZcPK1oOodhp5gsZKbMZ56vugfqSDZSwPWlrYpW72?=
 =?us-ascii?Q?uoAT8TzBoxTPha3HQ4K/t6lZQuJlyco=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d834be0-f348-4abe-f212-08def229b2e6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:10:04.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoVhZcF/NIU/4BbzWOq1UIyMhE19mA6cae+PFGA7iE//LiZ3rkFQn9R1sz0g9N88G51+7kSBXb4EyBCS4/rjbjVlLnsr660pRiPkmr1x8JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFB2DB17625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242754

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66032
https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa=
8dc92d0

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66032.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
new file mode 100644
index 0000000000..15a5266485
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
@@ -0,0 +1,36 @@
+From 352341aaebcf91ab16e7fcff158fef4a3b8c32f6 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 4 Aug 2026 12:32:31 +0000
+Subject: [PATCH] Prevent dangling pointer by nullifying data (#2180)
+
+Set data to NULL after freeing it to avoid dangling pointer. fixes
+GHSA-px3w-7g75-hg7w.
+
+Credit: VladimirEliTokarev
+
+CVE: CVE-2026-66032
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/5e477=
6146552d898b9c0e1b313cd093fa8dc92d0]
+
+Backport adaptations:
+- The upstream fix uses SSH2_FREE() which was renamed from
+  LIBSSH2_FREE() in newer libssh2. Context adjusted to match
+  the 1.11.1 codebase (different line numbers and surrounding
+  function/macro names).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/sftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 6ede3111..793f267c 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1279,6 +1279,7 @@ sftp_open(LIBSSH2_SFTP *sftp, const char *filename,
+                                "got HANDLE FXOK"));
+=20
+                 LIBSSH2_FREE(session, data);
++                data =3D NULL;
+=20
+                 /* silly situation, but check for a HANDLE */
+                 rc =3D sftp_packet_require(sftp, SSH_FXP_HANDLE,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 960ff71df2..32cb3898dd 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2026-66032.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"


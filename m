Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729D4C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:53:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15665.1785848000173469328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YblDOEDR;
 spf=pass (domain: est.tech, ip: 52.101.84.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKPyk9/seLxevDrRDGWQB5HGfqPnCLYuN0PF9IxXBUZ2LRVDc/IYxZy3HyvrhxcLJXlthejI3xH5T58DU/ZHlzP2BODUPKsi2EAUU4/5sMP/Z4oWNFJJt56oP56TM4ScWpPSi6V2QMzHXCizYxH18bogtszfXxg8YTx2nw1v8ablLZzvqdJKRC1Zgo+QlKwrEGuzVH6kvLYwiP5DIoQXOPd9FGBB3SaG/KSZ5ZL2APe3E34GvKgISAS0UlhpKf2G2AMxJA+S3wrK3WevI8P61waJUN98jcBs3xMVmKHZO2GXAeYJa341cScI8amSclV8KTZ9H/1ol3eNhvKRBo1XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IKXhC7O8P1LKk1OEV9QvUIudOLjcTpa8iAKskFX/tI=;
 b=dh+3gJjs4WDO8nko0Z/fwz9d33ROixXPoUVcW1P16cjPK2K4qnfmup5+Cm90GC2WT8BWEff3M2IRi9L5TapGLiLt+epvI9P0Je2BYJIcEbVzGsP1GgR6Rzi6pJeMc9bJxBReetc9gVMbEHf9FyG2zirCsb9hRcN2at5vIM73wzcNdXuUJzuiMBptaCi8PEIE06xkGFhKfGnAGX4VekP2HGJ/jlyPMYWyxyFhtGWUwEmDLpW1eL3sdsPmAiDr9TByYe1Y6Haq7iCtUqB3VTQJvyW7RtwA+8oiMxt7U0SlqO88HWvcwEyuz45JS89cqM7w0K0ViY2VGGtIfOx6HSUnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IKXhC7O8P1LKk1OEV9QvUIudOLjcTpa8iAKskFX/tI=;
 b=YblDOEDRgRelVhwRy9a29/T63h2pd1z5IS29lt1+2nG4neJxeApM1b2aiqsWLFvj9yoGzaL1k0Wjj1hgeTJfMQFIS6tl1HpcuPB9SEA27QC7ehNlk5CWJCu/CJJTqAHjBp9J72LmKnwJlKKMC3u+Liq9Zq6t0fpWer8H4BCLzGKmzEDswYTIxK1XMz9WqUpQWrGboCBIB9IEuHeD1tqyiUBZG2P40GZpgJFSeXnsAHuzXK5ndq48FeFniIZOW70mTAv7v98//OYkaTjbS0UO8GgikMwxFmvNOxC9vo6egtdz1JPRlCBsAjJ7KaR7hKIIwAko7Ii0IxSt40Hb5k9MCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PRAP189MB1851.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:279::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:53:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:53:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] libssh2: fix CVE-2026-66032
Date: Tue,  4 Aug 2026 14:53:10 +0200
Message-ID: <20260804125310.3364-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PRAP189MB1851:EE_
X-MS-Office365-Filtering-Correlation-Id: e330d55b-1f37-439a-df92-08def2275898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	yR11ojU6xGZcs8a2AJuYbEakWr7E9TaEQBdExCBVfFttOv+C67KvpBFbZkKu4u4W0Kif8QYqE2YchU0NaxSWl6//BpnHsnuxCamzRAbr+CyHPeF9N2FXAzD2VNlmTW9kUSAyQcY6zbq1GVAtiM/cY0QGDUJd+pdAtAvJ00NkNS3imwhvzK6S5ZvUWTW7JnbPJViAxIbXx0cEJ2jOyi+3pBXoejhHl6mA4tNXmcSv9mI8RqwyYXg6VDfXv1fqRCAGZkYSQDddsBcwiqLMNCBJJvkVo1XKJD5yR9bn6zFA61K+dPbIioHBKbswM1ku/zXFVG+0HUE27AHvGGKHIR0QzC0PyN4080VDrkjP+/zdg8EJZW9YxuE9Uw/bmFJDkXpGuh4kNveE89ezDqgO8NshmBk15E0BT/V1l5PDoUd/gr2VhJzY+atTuxSY0YjdDHBLkKhTinqslae92SkHsnZm3IA1JN3uLrjF5TQV1F9y4LhPzSUXz4Gk1I0ySKP/g66b7XoZxsLkuf4fXcvLv+VoyKkciRlL8VCSZmNvkYENoPWwe2vqdVEWRwdVXs7w3fIsTNf6kjP0GLpLHb6uixlPtNmQzSP1IGWFKjEwIRy5GLNY1OH5AYAcSGNBzcczzPG+H0n9ibREUhuKTOUdvm/BkHUD9hqhAI4gPZ3p+xymup4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ureyoKnH0tbyMy2WjfF5qjVxNsdtozf1WBgMKlgJWqivdANh/tYCdLmYjaMc?=
 =?us-ascii?Q?DCnroKqf+cpY/tprYow3DaiiuwZpAMpSbFhlwdgXcN1m7VxClo1gXOE1bA68?=
 =?us-ascii?Q?dqmFf2FgN8Cvn+jqfUuWEcnUh2gC1lZqkTOchioSseWaiG5t4rEUp28iemNt?=
 =?us-ascii?Q?fUE4pWrmeihDcsn0J5EgbWI6QCDYK4gPGjTQSm/Dhi28uCf+yAU8wceTQR1W?=
 =?us-ascii?Q?UdUqGDEMgflyCx5LkD1z/hjHsOYllpoSWvraaovyG85XclKpJ/uOt5ewX9ZL?=
 =?us-ascii?Q?1Nqtt1V6CxeOCIF//IJDraQXcr9ZKVK8VlPYyAvR+a3MwWbja5qNy1YtcDTH?=
 =?us-ascii?Q?mFAerJOJHOFwTMxO/QZOkG74KU5bMXFJX9Jl/LpOlhHYbzjy2GieRuLOPMsl?=
 =?us-ascii?Q?W4MT65GSwWxF+bThvJ8ariFNLkNsTTYTBmLQivAFCIs6POi2T1O+UR6oRHgV?=
 =?us-ascii?Q?oCpoGR3cITTCdRvLeIfPevBnSsCf+6CRdewqTlJh+9H7A34ukf9EM55/61yW?=
 =?us-ascii?Q?W6BbdSnTbarB/ipTiva4RzJxtjl1y1Wyhd3LHT4ha6EKpMmASy9+Ii291SgA?=
 =?us-ascii?Q?SApa69X7eDvHNZ3IzLml7qtiP64hlBNAOWSmqkhY5X14NOGiYivLJYawz2FV?=
 =?us-ascii?Q?oH4b6ZXY9GBhq8frK23Q2ozyXBwIvklPC4yXvQj1rwnFaLGmRzJegemjDNKr?=
 =?us-ascii?Q?qkaw17jBpwO4Rg5ZJrOpnJqfHMVtVB1Va5j2Bv+A1HfT193Ft+Qi5sV0xI4M?=
 =?us-ascii?Q?cLcFpNxrHr+siaB4jfBMeA/m8K6mZLWd4JyHEIlkESt9B1BIEF4hmQ6T+T0+?=
 =?us-ascii?Q?xl/HfKY79Ji2tWbFykSq65xwKBYq9P3zeMOkM+EmSq4dPJieErPjZlth/yn8?=
 =?us-ascii?Q?QYJ8oTEIpoHfbocIXDWsZos7GAknAVJ+X6RLXYt3RKl3mwG16EK4MAecfeSp?=
 =?us-ascii?Q?yYGmSEQGYAliuMbLzdiJas7KnN7TNUtgP6dLb38pMUtkyKN5DrHjHQ+omlOR?=
 =?us-ascii?Q?k5paAc8q9UuVmVeBBB4zuRRnevYCJGRZHbs1nmo0kJ7sIysVWgCZnSqjHTze?=
 =?us-ascii?Q?SgwX2Z65rgij0eBEsrUTNil0M0fdcA7m5NtdMrrUB+ALkIZYlxXZnBl0u0om?=
 =?us-ascii?Q?8oZXPM2NEzLO8GpniZdA1vHZWwWRP0xHh+sFHULJc+SV4PPhd40qvwMEE2EG?=
 =?us-ascii?Q?DstPBPt29NGUH1q9H1WoxwRKxngfC/Tk5uk7VLJmo01EgOblTPO7f4i+FT+4?=
 =?us-ascii?Q?NWYSBbUVtnaOAfrv5Zpc/AwJJouSi+lM/zGm8jpwD5y3c3UMLEt9anQ9n9uh?=
 =?us-ascii?Q?2j/kU+YIrgBAbfiF7HwcK2rn1jWrTVYXQWjJZQqeCuWLDu6p4LKJe964SEwn?=
 =?us-ascii?Q?BEWgqn/fGj8tQR430YCCVcl684jWbIE+fj+6mYEl5+GzGril/J0sdp7zrM2y?=
 =?us-ascii?Q?R1rbFERc6s26qbPXnAwzL6wfC531oEnyBa8SI3VOHQruNq/IN1O19mY5POK8?=
 =?us-ascii?Q?zunHs1n2lqor+SNZHoy3AKAa0HyC1eEooQ3/RQi6+V/Cw6Mpg/9qTGrHjr/p?=
 =?us-ascii?Q?ikBfQg3xY+6mq1wlVTNfMoEYz0pUcx6Cz/Rzg3H26AhuSCFbMwsA8dzZOGjy?=
 =?us-ascii?Q?HDEWKQR+MIcwD1H2bgnPXsvFN7fdjshgw7XNpC6407qLDQ8Xg64U/FeUSX5s?=
 =?us-ascii?Q?r8FCtuiYC6xjqb029FQiAE3cZKxUkTmCldSUuiPVPEOYH5TORZ4UGFUFRixo?=
 =?us-ascii?Q?NudPBhs/g0udgtz9zO3KizZ8b8lvYwY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e330d55b-1f37-439a-df92-08def2275898
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:53:13.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPAk5Yfp3yegqJSmyPOVekl8b2w1JWecXQiZ14DOfyZ/lgln/fgk3GU1yusYjFIQ/lHRmopcxciXbC87rYa7oTf1FT+firKLIWKfngvtrsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242752

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
index 87352df1ab..f9c15ea977 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \	  =20
+           file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \


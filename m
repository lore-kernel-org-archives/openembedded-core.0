Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBFEC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:11:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16080.1785849084080459144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YKCkDU7d;
 spf=pass (domain: est.tech, ip: 52.101.65.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXs4+g7NHeM+hnpGVtGfW5G50XyJwl2sxkObTSBe3whHxv9Mw+akTkLhe06w7YivTuaCSvGH/GIk5eJ9Bo1ZisE1gbcyXaXpq9eFl7OimLukk5nA0ZHegCPD5TV6MFRmPpdXHRIyQ5PQVF6Bp8YoDuhvvopg6IpmBsmKRutuQsPF2ZsDpS22KEGIg4wzVgDwgY/YCWv558s0qEhvVx+QIYXdAANF5iFyNP3JHadIKATYkl0wGt6zt5nbBDxdIFR5yqtB3NjNjPad5+aO1dS167FjEPtupyc1ImlqCKmLHYUuEFP3748wrjuDR7xC0adtBA/hX7999OvkQLUGZIzXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAbQHnFuwhbcGCVWm+YIa7RktnCDaX09C4/0xsYxvdo=;
 b=CMOpp548A6rvUmGVZxP//5iwgNt5sNsWD0eoM54ttBT5PYx49YiLv2N9ybro9GdcaHOwxkkZPhP6Mm8VeaQAfNlLTZuOUaBTXQ1038HXQzKEiqiJ7l84MwBh6tzSRnXgrhOfX1eteP7SBQkCIwdO6DPiyJv8ZtIuNH9kZkE9tnDiFzzz9Oqqvq51Y8WDNvPVrdSIiwP9u3QU+fLn17wvYyj8+lFtbTX1J1l+iUPtADdpqFhSEbvK04+QHJUm+0h7Ufh1PAfh0OlzBgkHAHbOqI9Ng4IROsL3Rdewo5fcU7cr6j6BtiJIQTQxGHsMUqMxgQDHiGielzFOYFr7Z5+vjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAbQHnFuwhbcGCVWm+YIa7RktnCDaX09C4/0xsYxvdo=;
 b=YKCkDU7dmDlLjE/NMyOhYsnZAjRpFl7yWzBowbX4fRnpUEujyIIBJdtLCPZhYqkxlyvDHyrG6UEADfud4J6lY92W6PJDgcmctCRUcK3kc1xQyOvgtHGxbJlyZM04sYVpegpodbK+gJIBgxjR3/yf2FnkNfHlCH0fcM+F1EqepAT1UnUBvCd2xCN9ymn1vRuncFu2PYj/6f8nS77ZfBQlv7I4dFdFcirxz2PanSMCaRTF849YXJYpfvv3jk817u1CmNRf2PgbVo25M2qdif+oa1DPtxG5WygsyejL/4PXyuqjcx+C/HkVssU1v6UzdgUZKkKlOhd7ulzWyCTQSok/FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0858.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:11:21 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:11:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 1/4] libssh2: fix CVE-2026-66032
Date: Tue,  4 Aug 2026 15:11:10 +0200
Message-ID: <20260804131113.3588-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804131113.3588-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
 <20260804131113.3588-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0858:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fbd944-6241-4223-e43b-08def229e08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|12006099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	niCU3wlwzJTrgaZSFDACN8UTAI3FnNBQXbpC6zH71p/8KH5eyArTN1C7hlU+SGTapm7lzctpaHthmtKP8sVSK/pZYW28eI5qwFehTMCwNGrWq08E2emYxO8u9/mjuRfGB8FMA8NTv2okXRTQqZy5Jz8/g5aCFVsKeNX4IHMfVk+wGOtbWWBEK9AHUNovW0qODgS5AvtzxnbkvNTwPj74fVweabbrNHd9s/Oew58wJwioK74uJqVU5OGp8DUl48TkZlq/yoSCt4kSwLHBrB1XShDEX8FCVcJ9BPyxpLG90SBaGYqHKtj9hibbRnXrr0rwzXAW8JCtS6DHEprf5vPGygBvJ35BRm1xzvb2vFNwOHyeAoHcCsfZAWAFTatE4XO+FXX3/AQ690fGTvEl72VOK46R+gVxdJy8VOidra2cjTBJlfDp7sTyLYVZIVhl/L+pgV+MLVkVzJaW4507g/Nydjwg47M7FW0CH2mT/POv82XIKvvnXd9ZazCDKzxwC/URn4hMNwr7wYrB/PkjbnAkPHOvJC/CHu5IvFazBI6yC2Op4Arag3hxGUusg2HA6pzHVC2/6mH9IWVNrhADiy47nt/jKrIHvcDV5R1/vVaMKf4FSFEi5/6KYl4c0UzR3I19mlZq1v4POFRv499kYFPP9YnWlbVMd3Xp+j/BwuxEgsQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(12006099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ULPqeQYNEGe4BEIObsyieEDDncjnmiEY+tb7BIcGNOkjVqsbd3hQLrVYpze/?=
 =?us-ascii?Q?agOMSepUW6mHC7XQCFkH6BGJIaw3z/BUVEJJSSGzy/rL3f3fXEfvdspZ5+9e?=
 =?us-ascii?Q?ySMhTcclBVEMvTa3MTY7dLS2qBBpMH2RHXXQikpskXp5RBj/SKEIkmYU+Jah?=
 =?us-ascii?Q?D0owNCAha1e6tJ0SpxfsZcVuOyaM/UxEeTWr2/B7RT368oAtMRBC1vhiOD6g?=
 =?us-ascii?Q?HMQ6dOmsnM3XScxxAayQYNQwu7X8OYUZkAK4QvgIHfUbrT3tMHzTJDBBYkyv?=
 =?us-ascii?Q?06rOIbW6drVNiyqhpNq1WaMYdCqcQqZCJu2AW6V4z8OuF/gXzEVBRDcBn965?=
 =?us-ascii?Q?dgzgwqt9ne3YO/BsHCafSaRdu9cKJMEWlLg4z1wE53/cpS1/MC+6rbAfO3Ex?=
 =?us-ascii?Q?LC7sZJfqTzBmgEU0XPixdL1QFqRFCQ7QNSYuB98cQdkyUSzxdnww3/mAGD8S?=
 =?us-ascii?Q?r7+iwnmYGn7ryOD9IwjM1yMHsHjc3zQbiS57iU83y9RG1/NbWelUvuErNlVe?=
 =?us-ascii?Q?U6wlcQZeZIFsH8OOd4NeqV+MOR2jcWqne6BQgOxq6PcES2agH/8dcxMACy/j?=
 =?us-ascii?Q?wnfw+yioG1F922WV5kXZh3JT23mwnfvQ5eCAUhfnAhCU2gxVqKtW8e/48JHR?=
 =?us-ascii?Q?fMSHPxPhU3ZvAvqb4QZb2GZM0HoYsaDChVLpX+PbWVwDiGqKp9dezFyKEl4g?=
 =?us-ascii?Q?EJfHR0iO13RCvlcwgmwsMRA8oa6748q4hDsFKTaAbl5Dh720F+lG+gjbuvoy?=
 =?us-ascii?Q?boMs7A1DqewdQ9Ak2j5nFKHwlNExrPwwl6XNxs6S3QaIPpS33sYlcNkxy2OV?=
 =?us-ascii?Q?re6dSxyG/Cs1jaN87OqzinW6XFtA1KRRR6VqVu7W0GEtjJke6g8WDPa119zg?=
 =?us-ascii?Q?9XqEhDTdxOU5yGR7qbDMqVoQXT6PadsHV4RcarxZGgvIJb+pj6JHPbB2o64f?=
 =?us-ascii?Q?XaanoJxHTfzWeR9gwz0t6g5VA0U8BI6LBnV8d3ZsWOyBqQ3lMK1MjAUwPQVx?=
 =?us-ascii?Q?ri9FnJ0b9BE2XDg6TaYND2YVndbgDx6khVP8LSgXjqMYD6TJG9Y8RqEaFFBm?=
 =?us-ascii?Q?wdsex6ZhXIb9kN6QDZDWEEVfgGzO+2TdUaiPvChQTJIwMkNa+5bBUskClyrk?=
 =?us-ascii?Q?+GP16B+HFBJJQBQFjF9M+X24ApEiWaL2IgYyXrRolasSFn5hWJoDkH4NlQZa?=
 =?us-ascii?Q?qbW6K0GiGh15eaTyGSVutt0NTnB7q9SB3kwyPvAO+2Bb3q9VFjw+SKvDutNH?=
 =?us-ascii?Q?jHj6S6HDhcqFXmnBMNmUnIruO5QvUcZV2GANW1QwxG4aAWrvwKaM8LPkRmbw?=
 =?us-ascii?Q?mDDH6sXkKFDNx7TBG8b/qeltdfV6e+za3ky9ViLRZ7op2BR/q87zeJHoiyqK?=
 =?us-ascii?Q?Fft+6+HE3LfxPjWW1B+z4WutHtf+CynXqSiM/e9mMtH+6evmk+Wrfdyhe9fP?=
 =?us-ascii?Q?326Bq2IzuxmJNUDeI/yVa+688V0ZMl+PdIjnwlhUdmtB+1Y4BbygNvb4L/xH?=
 =?us-ascii?Q?Slert20o1xiGjo3hokOGIgWrB7n+ZprOm/mmRddLl2nU4QJMFN3eePR+dppv?=
 =?us-ascii?Q?WPNqQFDDgbcAfVBzDiVGgWFrognmIX+uLOPVDF5WpfbZhcqNWwqluykcKXhn?=
 =?us-ascii?Q?/tizczbe0RfrMMZxdNdKxnnc1sd7EGqVqDHDcbCU0XB+LlIm2w94tETFe5rT?=
 =?us-ascii?Q?EU754wA6J3BtwpmNY2OZhkm4VKV0s9aqpvhTxAiv8NMUpuNniNiXtITqvnDu?=
 =?us-ascii?Q?JMgvn0l3VOWHEVwYMNoY9AWnU6zSSa0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fbd944-6241-4223-e43b-08def229e08b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:11:20.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G78XSbVWW7ZYiiQBvVVu7tD2Zp58JseuyqwXOc/h1xv8A84W1rLwayAVrlobFJ1VDf/r46HOGpiABn0JuAYJpRMS8kBXMcLuVkqm0giCpfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242759

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
index 32e1ad6c16..bd7d1f7b1d 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-66032.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"


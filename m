Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40097ED7B87
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 08:06:33 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13745.1776153267920859742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0gHKmb+r;
 spf=pass (domain: est.tech, ip: 52.101.72.60, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/CPjYOGRyNkGYCAejjKLslKiRHRAvJ9KqQrTPxZE7vcQ20UHN1OQwOf2ndSpY3WKX3+Vubffa5XJuQPHvJGYGa+WQAxZ6PuN0PvQG4DWJ4WS7lxJZ3sVDTczRaoL+Fp4vEY5EDCtWePbXl8er/aEs0USU/Jo/yJhXMK33vabHhD3pjjmmuQIbvotmwDkMK8pA/wAzgsYytQd6aI9I0phsacAF4YBY2tv91Gmarb5AzYgqe98GObot+NHpx/9wI5FblT7LzaRsGKjP3gm0lZHqANCxPcwfG+lYJCe5C4nYRR4QXuFFpEUPapUOOrB2/7enCeGSupW8g4TsrISvf7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR3isDuJXyqfx7YlJoIZ6ZQsoIxRRc70TtAzYe6Xd+w=;
 b=M/Bya1UWXu8EIoeZBOotBiTjGXunBdC17FsIX5G2vvTKMD0gryGxP7bEkt614bmsdQoZQrt6Pr+k0ie7Bp6ZrL02hPN13C8SCh+C/hnm/3DVIFPQ+cUX5N9GkvaQpzkDIIe3iOvY2LWmpQw1oxBDRRl17J3gH+yB2nTdFyF6qRZw/AaUBow6oTs6VVgDFSs6ogMyhQPMlkHetX6B+Y309u/XLU+GgEH6Yw+82jlQ6hY8cuIV7CeUEGDjkWajMoOS+LStHmH9JZ/XhrqdLNKoUZamrHsPIbV4xKZ/eiUI6pWFrZ+fZlZNdIwLoMAPRJVkdysA7hJto/LQ/tPiNvdz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR3isDuJXyqfx7YlJoIZ6ZQsoIxRRc70TtAzYe6Xd+w=;
 b=0gHKmb+rvRYpgMIM4DiIwFOCnDormFE6E8dZLxd3bjE7qOXHZRhsb27ONj2WkfwwjQAP8RAyh98yyVJhEO4UImPTEu5nAhf9VS06AueaRFFoYUA6o3CLLFj/0Tnt4nDw8W3BBHHgOqpOsnm91sh1/IojCVrQIV9tiToZi6jUhDIgOY1q7bDd82AnDZNdug/4da9kn23CMP2FnrQKtC7DsSiUfOTy0sZwE1dR4OKrNCYUYbXJMN+iX0fZCKMciW3i/yNTgRI4eN/sx8/MydDlqDJxgOn8UnyifCFadkucbQZBBbchHBZqNoDSEo8mrD0sgxDZt4VmTmcDdHHizF/tfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AMBP189MB3361.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 07:54:24 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 07:54:24 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] vim: minor update to 9.2.0340 to fix CVEs
Date: Tue, 14 Apr 2026 09:54:17 +0200
Message-ID: <20260414075421.604401-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AMBP189MB3361:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fd0b09-6674-4229-e70f-08de99fb0b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	3I4N6G6cXTNShm7yL03qi2iNGsn3XhMyEOohB79bw3g3t+0IGpe9sc5f60uy6yZCg0nUIHLeLQ+47y63YOMnmD3wSTfGyOHjTWoJVQqdGBq7LAYwiEp7+Tp5JNp6ZPR6zq4ie0snLfP7qKj31EFe8nqg3jO8nS6Fj8gBeAoXRHquVN4W2Ad2gv6EWKCRhU8DdJhzZn/b4TBXeM2y1Pgw/WMnAb8F6u5kLkHqyxDyGTn7QV1leGQWj5M8poi4DFDi5jniAo+i+Lpm6V1C+7Mjd18w2DpkiVJO9lGgyU+JeojzhkeP+b/4pEJDDqZuOZ6YTn/by12ky9WcV7YwMicI68d4SScE0FUixe68wtpkmPnf6sMRC3IsZph4K2lrwmv86WwTUQYKQfTou0cLykF5MBq6Mf/4M63sqRy3p6CigsGppEsY4SGzSzM/oNW+M62VcnSIiomuFufMdhWnDhGsiFQoW8OQOwz1TgOTQDrOeTSWT4cL6nsZFlkHnDiqBaV35twp4fKONUPvpTkLhpudvorw2r4r50TatL2KHM9mfS9UNO3TzUOYZ2ksi4NDVoWOXtpwvHdqsUx414/9b2j8xGl7z5oLyIRxg/xH/hnLo5jtHW3Gc+Rxcetxi55Q6dSgM+NW+GSLmOxKgYGAHW2YbcdAbwy60RlZmfEYwJhplZJQohIIowXgG/ZEUe0kF1eS1pRNNsON+RDUOGW/4v//h/I3MmeJCSP88CJ+givGM2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EWIHXAHH8daJxj2QrEPiGjnsZmhxs58PT4rbxMlhmbYm+2kYXmPae4Z6HxXK?=
 =?us-ascii?Q?Qn0YgKtouT4542hRhyqqphf5jVblR+JjPRWDPWGN41weLFgQ3sKJiTV95bFv?=
 =?us-ascii?Q?QwvWVadxq55iL3wsJt5QpGvIoQ5A+htu2DEkNpBnGyucn3SPNhRPYm9Kazyi?=
 =?us-ascii?Q?qkLI3YlxAQD1xAR/FpNAlJgScpYdNzLDHm0ikefoGfc+dmj//tmd5fxdJcd1?=
 =?us-ascii?Q?ecZ9/XGdw1xcVsy8e8cUotZbZIO0qT0MUjm+FYVsxjTx58DCihfN7y00DbXB?=
 =?us-ascii?Q?2LXhMy3Z/DyY6eiLE0GwqG+oxMS0OE3/ZRnpYAAIV/QgG5udY8hkItf4SrxW?=
 =?us-ascii?Q?qLcPgEHHAI2Yu7ldCzZf76ejO5yqwC0u5md+9VvmHPJdmU05qMWLjX2swahb?=
 =?us-ascii?Q?cU2deN5eOFIbA9A7OXCa3gw4E24Km8coxurgKO7QKYPnrbutZ/PyHY22Vqb0?=
 =?us-ascii?Q?JRpUJ6YPPJIGd4YSi2lqRA3Z3cWSjbAJML8Jf4TNNs1nUSkDEVqqTQIqcImv?=
 =?us-ascii?Q?XHmNmUsfKY+iv27scCZX9UdrCbClBqxG8PTgL9ppkU/LBsnT8+u7fJJ/q9QK?=
 =?us-ascii?Q?xgoHwqCsCLb6z6nthaTt/LESBepB0uBZRc/TtscTJ6k7aSE15dB6LOHynyqM?=
 =?us-ascii?Q?abuidv89cdlDzjtUGBOO64wCnEiBLex3iqVoYCTsO8tnKCUoS7YA7viHABNW?=
 =?us-ascii?Q?IcuY+xHrU/30a72CYnP7n5YzgVwesdI84yMWVKGrQOEKGxyL9SC6ymMssJOv?=
 =?us-ascii?Q?5pUdHaODTRFaDzHGxOCJrKuUBLUYCS804czru83o+YtXmVIj+cbvrKOfQDeu?=
 =?us-ascii?Q?60PKN8OpSMsISB0XLk8j867QacCLq+vPOPI48Vn6tWBU29rPrhoBh3X+ndCB?=
 =?us-ascii?Q?QnaoliHzcOjcKB3n1kqygfQj+RBr1NQm+W/DtQO9DG9ovA3lTLhiXnu2w4c1?=
 =?us-ascii?Q?OJR62Nqv6KLp+HxpQCMuGw2Y+Nhu7XOTkXSKNHz+PFZ5iF+nSkIuMc4ZQhUY?=
 =?us-ascii?Q?dcih1vRsjxRgWwtg0W1YHrX2Pe3TQZcNAk/ZlRdSjycad6fydZYuYARF7E/a?=
 =?us-ascii?Q?eyy0KMgb8wiqLmoJfMdhnqpLILE6BWSUkgagIHXM54pBAvkcZ/7WRNi+GQVz?=
 =?us-ascii?Q?DxkRz1AZfwWAsPLaGJV0o8FG6BVlvHBjn12XQBkiBvmTxPidokxfK7Pi+EEU?=
 =?us-ascii?Q?9zgGmC7MiKi1PWhTC2P7MGXEuE/9aE5q8Em17taJMUtLIYH8C5KwOjC0EQhX?=
 =?us-ascii?Q?BUEDIlCSefAocaElWTbBJu0FeQj/ThxoG0MpKR5qBY54Z3vCN5MFSJIp0QEX?=
 =?us-ascii?Q?ELED6HdlpVyLHp5UE2mWbMMH5CtlBtMGH2oztg8kcllvV/73tXBBIKtcgfaS?=
 =?us-ascii?Q?EpBqe2pqnedP1AoB0qtYnXZcAE9Bf+R8saoneIRpxNc36pODPw8f06HhRX1U?=
 =?us-ascii?Q?O5WnJoNGJcBaCyqhQDl4rtFk5V/naKva+H5qbP8X58+yJUzZZoeHnuPrvWxU?=
 =?us-ascii?Q?jxahKp3ompM8i3bCOqksz8HQQbp+Sv6vAF4qJA7PBQ+PYRdP/+2yEZQ5QQm+?=
 =?us-ascii?Q?M/+mxt2N7l+ttf47ZZfyMWN7O2K9ROhqGdmvfv4M0tN+9p98UKlzdkfZ3umC?=
 =?us-ascii?Q?zINhFmRn7sqhmqiRpn3LCqPUw/e+ODnPOdXgq5IHdL2YSNg5PTNjpjTtKwUT?=
 =?us-ascii?Q?R4T8/mdkQuRSooKHSYAyar8g1/4TdwnWwOsHA3vXcWUB3vjmR35evt9SePWt?=
 =?us-ascii?Q?ccQfIbVwMo4/HSXz0JIBkKA56ilHMr0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fd0b09-6674-4229-e70f-08de99fb0b7f
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:54:24.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlkBbwSDiSL3sFwx9kcGYFlbM3EMRMPPnE2SpJc1NY18EWnM9Qm3mCzt77OjSj4wXJk08nLWxSV4VL75pKUAGkhl/W42EmP6RJ31P4OxC9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3361
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235145

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVEs fixed: CVE-2026-34714 and CVE-2026-33412
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index 9a5ec9652f..6f9b31d868 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster=
;protocol=3Dhttps;tag=3Dv${PV}
            file://no-path-adjust.patch \
            "
=20
-PV .=3D ".0110"
-SRCREV =3D "7ba60f17c22ef81680f25f8c3225b4edb55ddd7c"
+PV .=3D ".0340"
+SRCREV =3D "6addd6c101117706bc9b3609d3a418e26e92618f"
=20
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
--=20
2.34.1



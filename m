Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA656C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 07:33:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32385.1737358416093203320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 23:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3115ac49a9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6QNUx027608
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 23:33:35 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4488f71bht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 23:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLe9tx4SUe47bGtjEEFsqXACSJloUAuToGga6pPPK5/e8PWn0H8umWuGB7c/aC71rmvRpngtla9zRs+52LzKqP8em6XJq33LhTHSYcDzIhQH+N3y5O7jIGWqnW3PGkxyrud2tGp/JZt6CSUNaoA9Sgg42p00l2FKcRnX1HRkPYytDPwVGh20Wo7PlocNeWM7s5QZh16d9NpzPSnNmldIuvhh2kteuswjOGSUQLM1w1GCYwCQYIDrXC8r+BRNW/thrN+Ioi9Zeq3i88qGazpXjDk2GVEafm1i5ehf9UDPMWHgGav7HKL56MX/txP/LkRtiMeMu/vlpjYBMNKvFvdZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZsVTwACC8IzEOBWIWoytxhvksdp7vfnl2j49QeSGiY=;
 b=srWx8RgHPQrjJUeV/tCnDN0nEbAE0H5ZcUkYcCT9DiKUoVzOmP+zDciLjI6J8a16SiURQNBTnmU5SdQ9jgZCvnjPu72DI0d133WgVm9fzzQVYbj3jDa7vt8lZPWMfjk1Cw0MVmqeHI2mT78dwJydeStTcjkmMJIjO0vu7Xr83hkGxAn8aIRnirLbitlhG8UKphzwfS8yGlSt7zgVK4ypSOO2dF61iwUBIKUe/bFAIsspZHdB213WMnUufrgwHZP92nhX2tFPeg3dYfdv5aBprn/bzkFFD+RR1D+CqRPaRUURaDJWhYTdWA1xbrdhIYQHQvQbEbpwI2qU8VUJFfGyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 CY8PR11MB7081.namprd11.prod.outlook.com (2603:10b6:930:53::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.20; Mon, 20 Jan 2025 07:33:32 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:33:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] debugedit: fix build failure when enabling DEBUG_BUILD
Date: Sun, 19 Jan 2025 23:33:21 -0800
Message-Id: <20250120073321.3859875-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|CY8PR11MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaef2ce-c424-4e49-ac12-08dd3924bde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?57wDnKJwsMx5lYJmZixw0fFssfXlGXV83eWeyuoUT/Zhptz1g3RwRW0QAhZe?=
 =?us-ascii?Q?MRReDWQJLUK0ZzUlxiUmkpGbvziXgsEe6plO46qRVDuqT7o2VaFxfRR3vIeJ?=
 =?us-ascii?Q?HBm9c19MRQajpPDNSCf6wdo2J5zLpG2BVkJfNUs9gQZysLgHwZbJPF5eqqpt?=
 =?us-ascii?Q?B1GteyP+Q8ofG0HOmk52ZOpS44Axvab8N7GKXvGaBsvLYIBwth/mcL+uMo8O?=
 =?us-ascii?Q?ULqMaoTUpd+me7GsK4maGBPXeTiIy0LrmYU1xJKlR300FWW4t4cGnCfhk5LN?=
 =?us-ascii?Q?Nonn+/pMSWeeFj8CGyKh8GINsYTSfz014r+6pMWyfypJm96wjvZpzxht0Aq1?=
 =?us-ascii?Q?d0jcJdv1sbwKTFW2yD2/Rzoa0me+cKxn4iZVL36IQYqZamcmWZiZ2maxYFHG?=
 =?us-ascii?Q?wjEsU29eQNRY2mbveYPz1WudN1i1mGHunGN2cav+IPO9/ZbHfHePEm2vGPwn?=
 =?us-ascii?Q?Oge1C4rQKcZwq+CoxrKY+it4jtHAp+KgQBgUx+sgI9ZARvyFKdWSbraHclcI?=
 =?us-ascii?Q?lzeQn2YJhDgJi5Y2Hbdox+Cerp631joDWErFJu08gnBqF9y9NcgrycgmuWcE?=
 =?us-ascii?Q?i78FPUyAzcAmXac2LgSFNk/Ngb08XLqKuzEncMDvZVskZ78CF+Z2lGnw64Ib?=
 =?us-ascii?Q?dU2zNoRZHlgeqednncI0WpOMohE9QJN27zASqpo0woSu9d3zV4u0SzQ/M9KE?=
 =?us-ascii?Q?8mtsoLqceZziWx4qNDoipkI5zkXQtvBTBgfLs/AKaxMSNe3rZjT3a8a+n65h?=
 =?us-ascii?Q?OjKSvUuzSYVa3P4Og4DuoOOBHg/cvFejoellXdu4o2zG60PPThk7NdXb3vF6?=
 =?us-ascii?Q?NgSkx8VxQaqkDh/zRwxAMve63a+1/VVwzVP/ZVjbjc8yvp8m2EJ94gH1DDG7?=
 =?us-ascii?Q?slD/6xCPKWvCfLwtUxXHVRPC30Kn28hNZr3cW+yyjo0sceP8ghQOOkH5kooS?=
 =?us-ascii?Q?tw0TMhKM2omeVjkRTPXiIoaPuFZ9gM/5sXkZ5516cGO2qnWJCt+X/dNw3Dko?=
 =?us-ascii?Q?Ch+h+jsVSmde58KC2OMDBIkQrDwmWvlZ2ePNfvQYMdomnjKW0I/Zc4zUgNu5?=
 =?us-ascii?Q?t7D203SOoNWTB+lwB4iudZWPSpKQ620sSHNPgdjnrB2dUcmIv7UzoS9eq/87?=
 =?us-ascii?Q?CE+z+znyot9sy9a4Py7MA95SFMLpEEXfb+FqZbh2P7KaenLvxlF9iOQS6d2f?=
 =?us-ascii?Q?2pJbkyVCei1qxwBOcZjwlLb/kJDpK83AlTL6U+Bdad/swWl89r0if9hgLf5y?=
 =?us-ascii?Q?Ml6ht89AK8W/judZ4PwRYEm3cX3/eIBEUXDWv7st2P3uIQ82eqm2+sowdjHU?=
 =?us-ascii?Q?lk4a2eEs4zJ5GD+yEjuyIvaUfcdzm8YfFIHIABDUlhIU2EPdVfElRfAlNFcq?=
 =?us-ascii?Q?mucQeFaB8Qs3Aqu3Xzn0cQHUyw1R5XrHHkl1rp+zROqBaTcRmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HHCYhsdSYpeG+hOZMOgqlyCp9xIld+VzLSgOx22VzWvLo7vLHAL0WAhiPRz/?=
 =?us-ascii?Q?sGPMdpAgLV+OXVGYjCb8FR4CjJkiyvvSM4hkBzj1Jc6n/AnJ9cq+Gz2qWqjH?=
 =?us-ascii?Q?qEDze8sryeXmxlFTW+FVjCifZQSZRHSVaDjX1QpkB5RjBBYxrga+Bglb9k7c?=
 =?us-ascii?Q?a8Cy0BMH27f95TqfxMmTKCCwI104Dt6fxiVHeVuN2qokYpxPrTYSY87NXxna?=
 =?us-ascii?Q?Al7YJXyD3h33qKCZfC7uk7JjFn1TC2xeMUItZx8jcqHEjeSwynf8D+9pvu/T?=
 =?us-ascii?Q?q66FtiOXTigpRghP+EpNrG5NqzDZw8GF6mhnfeZxSrkV9ePGAQCMZWZEUXCX?=
 =?us-ascii?Q?YhjekU8PAwfjOpnOonk7/bPf+RqRhgdZLkyjH5dz6bEZuu5Gy/PnQbSvRsP+?=
 =?us-ascii?Q?SOdoCDryJOiRpoPyqbQV9lJ4CnsSXvf/MHEAd/mReJuodd7FFvq3E2I81PZf?=
 =?us-ascii?Q?isMmks0P3kIV114Wh2qldPF/jPN5hsznt1DlM00zXZ+8yFzhRjvXWnosgqvZ?=
 =?us-ascii?Q?XLeOhLalB7f6TPBuBRJED9lSwjKtAKqr3Z3Lqs63byJgy1Qqpk7Q00sKQKNK?=
 =?us-ascii?Q?6Mw3691nI2CypkCEscNzJsH1K7fZFgn9gWKBGFtTbVY7YUOkCTTuKvoa292Y?=
 =?us-ascii?Q?sLzC48Z1iJ8D2SpvksP+QPrHvJ/tlHqQqZsb7fOB7wlYv++J33KyfGaBdiFX?=
 =?us-ascii?Q?W9jIwbrZDsWTPU6HczwlF3ZfZvjPI9//VfE7JcazxhUHhkkZqeRoov1I+Awr?=
 =?us-ascii?Q?zgddvaONvHSMJIXe43nNKM4+fNe/QOe6EVh0WToP13gGtGWv7RodUjwmlsCW?=
 =?us-ascii?Q?UMgu0rd+EA/suOzYRWkudfnG3w/EKMw4JSgpwKhijMl6SPFeI9G/sii4yjDG?=
 =?us-ascii?Q?nEOCPxbQCiRFSDwpvCkF0oLd4JDxrtzeaNa+KxILj7iwTPKYIQoeIixG4JRH?=
 =?us-ascii?Q?tSerXXlK9FYv5Ak7fr4wV9OfMcwAoy7TPYmHxgnik+Rikh/Kn+cKS26SjWAO?=
 =?us-ascii?Q?soaxNvcYwwSG12OPAapHCgk89xAR6TxcGJq0qstIQ6IAzSKj7TUDDZQAh3r8?=
 =?us-ascii?Q?t+sX7HA0gnwmOuwANPrdHhhqtI7rxjLH5kQvNulxSauggI4KbQlmDhLpOD7t?=
 =?us-ascii?Q?g/vpTdWFBHAcKjRwTR/vnNK6GS18iMqTJtX74NbI+Bx2MC2WJeyH3r3WXako?=
 =?us-ascii?Q?tGefRHv+yWq7BvXoYJm6S9tOZwSqAsDRpHyVaQocI4AEBTH8hFIZucRtluPr?=
 =?us-ascii?Q?h6/HsHwmd9MhdDN469OhE3/w20v87SyjjJPf8jyUO85yzKo7KO088NLUdaT2?=
 =?us-ascii?Q?yqbFcxY0Sem7iUVXAwbDywQ0uhaSap0QKjI7jTsSjtdjx06z41+rEhaIJi/m?=
 =?us-ascii?Q?46KXlET8MwtNQVWfn3uwDuwTCKxbj6Lhhj0SHqe/UDhktE+1mzjACcvT0U8R?=
 =?us-ascii?Q?on5xxyJlVKfcv/5cf4dblixPGXhSmP+AHeyos5hSPMZEI6849oRZk7iLqk/X?=
 =?us-ascii?Q?3tu6oSt6h4MQDhGxE/tpcEWnXXbbc1/25dOFnj29htce6dggReKfcOg1lcrF?=
 =?us-ascii?Q?lSIOUpuVzfGUpd53eHXhgPnmGEmjXpKQY5bmNbc8w2CfAGrMCcjOkjgSIUt7?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaef2ce-c424-4e49-ac12-08dd3924bde4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:33:32.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZwcCrKoXUtW2fnAruYMsTH/XCix7NJy6/IMRYyMiF+e3zjJff+Xm+Ml9DFnjI9G0/L6yL/NLIpgDeVWFtaKrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7081
X-Proofpoint-GUID: sVG5L-P1YJAPJLhncOTswRBB9NJG3oXG
X-Authority-Analysis: v=2.4 cv=GqG4+l1C c=1 sm=1 tr=0 ts=678dfc4f cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=wYilSqUOdzvxOsFCO2YA:9 a=jQjflG0nazAA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sVG5L-P1YJAPJLhncOTswRBB9NJG3oXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501200062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 07:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210023

From: Chen Qi <Qi.Chen@windriver.com>

When DEBUG_BUILD is enabled, we use "-Og -g" gcc options. In such
case, the xxhash functions are considered not inline, yet debugedit.c
defined XXH_INLINE_ALL to force inline, thus causing build failure.

This patch fixes this issue by not assuming those are always inline and
instead link the xxhash library.

The 0003-Makefile.am-do-not-update-manual.patch is moved from musl
specific patch to SRC_URI, because we now have a patch to modify debugedit.c
and this will cause manual to be generated again. This is unnecessary and
will report help2man missing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../debugedit/debugedit_5.1.bb                |  4 +-
 ...-not-assume-xxhash-can-always-inline.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 00c40473c4..02429afcda 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -10,9 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           "
-
-SRC_URI:append:libc-musl = "\
+           file://0001-Do-not-assume-xxhash-can-always-inline.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
diff --git a/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch b/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch
new file mode 100644
index 0000000000..8e9256ec01
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch
@@ -0,0 +1,48 @@
+From 76eb6ce69349a05d0ff069062182550ebd88f146 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 19 Jan 2025 22:56:36 -0800
+Subject: [PATCH] Do not assume xxhash can always inline
+
+When building with "-Og -g", we'll get errors like below:
+
+  include/xxhash.h:5210:1: error: inlining failed in call to
+  'always_inline' 'XXH3_scrambleAcc_sse2': function not considered for inlining
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/debugedit/2025-January/000359.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am       | 4 ++--
+ tools/debugedit.c | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c590edf..35fd947 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
+ 
+ debugedit_SOURCES = tools/debugedit.c \
+ 		    tools/hashtab.c 
+-debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
+-debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
++debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
++debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
+ 
+ sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
+ sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index beefd65..43f9cee 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
+ 
+ #include "tools/hashtab.h"
+ 
+-#define XXH_INLINE_ALL
+ #include "xxhash.h"
+ 
+ #define DW_TAG_partial_unit 0x3c
+-- 
+2.25.1
+
-- 
2.25.1



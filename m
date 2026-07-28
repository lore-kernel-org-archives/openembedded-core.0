Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DE0C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:18:58 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9077.1785237529059328262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZmZ3cpmm;
 spf=pass (domain: est.tech, ip: 40.107.130.67, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAZhsvNPC08GtUCmHrETDgAjmO2Qk41PdwrBX1oyfYxGvMiuUH22nR97s74QiRNEnx7u39FY3qDKliW2oNb5T3oaJJHknhm7OkyEOlDkRRx42EgxekwbvnZ4EpfyqWX0E3vstOK1A7KRliAmDvQtJ2wSTmPVsqBJF12fKbdTeIGl/qGm/UhdFjyEGWWTThbAjj6j9mpPeOFHqronnqBJ43JWr/p15oESSaOBYXqarO+JewNgJ8Esf8jKyQ348+m0qAmDm2MI29W+ATxvgynA7M7V7Yx4iCYCR4Kv12UUrvMryBlff8a40qNWJtjICupFNpKSWNd+cw4+iCYARdcRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR0lgzibUVMT3VPQ8DlU8NYd0qGNv1SZWpv0ePRHgcc=;
 b=I4WFVNertcVkFWKlgUXxswSnKQXNswVxFWkl9dZchuyPyRprq/10SQ2ZtLXepjYk68rA0vTvCAatt9IsSxYQVbq4cGsuoLEVj6f2eIisO5wPa1MuzoF4FkpHUXuRjnl2KvFHYiPhxOezoXRn+W+o4By+PKhoiuCprmTWkOoBwAnLNmJUtDBRiSrYQvgiUu+h+SZwWRBBkUG5wMI38PvOCPKxhaAww0baR26Ob431jmhyfLETdmO4Y8qLTaGpdDUuYP8IBbEdkFgPN9PuqyDjhyl/LdK9w/yU5uU6iVSPwU7DEkdUFD8YnkCflloFHwwBN9BKut73vkeMHGESKtnsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR0lgzibUVMT3VPQ8DlU8NYd0qGNv1SZWpv0ePRHgcc=;
 b=ZmZ3cpmm/pRFIAFagCeKtjMcvN0xrx6lhh26NUSiHkDId11fxuvQuXP82lH1HfT0R/fGmv6JxDjRgBohRPg//5kYxXpSufb2DjIZ0OGFjQTkhlp21HHIA/YG1rLSU8HsTsVk6FLgCWXRkqFXDiSWbnFs2FRcwLbYzKcgMWcZ3qGDmWFyEateluC8ashMcdmE4z+M0wJRYiQimg/lLGeh9Pe+MrQii9bnFaORpQCOWA0rAgSS+QsEDU/4hb6c8QsGOfIYs+LCTQ/JELMCT6vX5fGrT1PCw7aJPqh4UhG50t7ELh8fSDK1ikt6vxOpea3rEgJXCsuw0jM7uQQLO6+DOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GVXP189MB2658.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 11:18:42 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 11:18:42 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libarchive: ptest: run tests from tmpfs to avoid inode overflow failures
Date: Tue, 28 Jul 2026 13:18:35 +0200
Message-ID: <20260728111835.29648-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720122619.34696-1-pratik.farkase@est.tech>
References: <20260720122619.34696-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GVXP189MB2658:EE_
X-MS-Office365-Filtering-Correlation-Id: 44616cb1-0b81-4706-57dc-08deec99fb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	dyNY4suH78qjWMPBXuh6o/oTRWapuOqRZsTpblLt34dW1c73mkSYb67LTfDcyyjbyZ1HVZEGpScexxuRdMELAZEP/AhjBLTPXRnkKCQua8VPSoHuIWpRamrd5edPiXpNpp0qykJz3U842dx6TDrM4/SqREY6Sz7T2kXWCC8PGdjQD9c9dGRXM01vIP4useIG/RlUZQ6KP3ZCvKC/SjGH99iWq8esu6N9NiW2xuspN6xHptLoDTSBGPrMihBQUBzgYQ6NoNdEYNzFZT4v9uf+UNbEjbsPfRspIT58oAS6kZNFqWHwaj3rD9990N1vdoUuy85Xq6oOaBoOoqTBwNsMLTIFGrRlweG0TuKp/pR+q/Ju+KJYO4YN0azUY+kSXbHVDUGSt+Vs8GRci1yOZn4FibMVOayNMdojdDmoff9eFoOzuqTzetPUyuhaH+Ndpo2P8JM/HDNUKMXmGTU4YtkGXosh6oejeA8nkIcKxLHRX6EWrl8g+6eZl/p23EQC3YJmamc7I7foHNSyReMtgx6dHc6jQ9ffz2Ze4gF7/E5rfpWL3fANQ56qIoAG9rJaBtOo6HifNYQW5cVkXTXUz2xwACCzpBaNfUJtREccm5hfl2c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jWYMsxYFNdHre2VRP0eWTo+ZhGKJlApRnTOonH6gLLuDgjGgQOcbVrtgMWZm?=
 =?us-ascii?Q?DD69Uw1tbFqpqFKB3oMcAh3rJm8eq5wCq86lOlDVDlzy3SFfIxjY5lsT9RC/?=
 =?us-ascii?Q?hkFm4PaU1QXiTdU0+WrUJMfZQ93q8pvYv5c0JFJofOlLPKy1FWiQiFrG42Si?=
 =?us-ascii?Q?hOKZjggKol0cSIJ9MN9upJ60HLH9vNm/FxO/LHH6RquJK5sVEpSucCkEpIkn?=
 =?us-ascii?Q?FlNKHVqO1jm1dLF3KgjCptSbUMdbFYb4cX06YUj7o+IgrGOwM0MyL8fQ3JoI?=
 =?us-ascii?Q?IQy/FgzVaePq8TKyLlpJMCWoWW9Pd+WOTyiKtETu3t+j7qXzkNIOOrIEeMjd?=
 =?us-ascii?Q?BkT/R9JIZ2kTD16SozowsYgPiVsiI9rFt654P0Y0VDHtnOfWFYrNZVz6z7OD?=
 =?us-ascii?Q?/+YYprud54kthxwMYzuX8+DMZykiVnGxNZEBpIRH8Ra4c991/mqb0U4Yxwq6?=
 =?us-ascii?Q?zJvZoXEZsFnu4+387XH0G1f8jg9D2Yr1lQWJG0UtG3QkDdQVNGrbbJiYcpO0?=
 =?us-ascii?Q?LJ5mIFMNvO0QyVfY1ttaTiBokreigT4+axrIkx859HSRaKR3lFYWvopa0drt?=
 =?us-ascii?Q?iIovgdyhad+5A6KFi/soZOsgQb+uxoGjrjbIcYY46/ukDgeL9l2jzCqUWq/U?=
 =?us-ascii?Q?b/hisOt1LjHUA1JDDhet1IBJ2GoNhH399D1RUuHOXlvqbnhnDPUPZeY2O/4i?=
 =?us-ascii?Q?rqjfCKDdiK7B4ON+Qi7Pva6Gk+NoKyDU4YBpErgip0a8UVpg7vNyMY0+1pDQ?=
 =?us-ascii?Q?pGgyPb9N94RZ1Fp/w1tlWw1q6apJW9raUnE5pdaL3vOabkRSVS9I62iEaE1J?=
 =?us-ascii?Q?+FQlpiU5F75g3hM1FvCqEQo+FSW9hEvAheqHdOBr6eAgQLVyGNRT4pHX8aKU?=
 =?us-ascii?Q?Gub6d05sV+WcvG1TZeJYvGs0AQ3Sc5jgxUpfaj84bEyuqoCQXt3ZAw33u4ET?=
 =?us-ascii?Q?EF+ZvwoUrA197pSmWnThCc+rc/YzuZ08DOou/+vAZEfo+wRhfAXxa2P4D0wG?=
 =?us-ascii?Q?C+88tsaUGU8btR32574FwrcYHUBjsiJmtHyVQsvUqoiTQGwDz9XEVFQK8zJl?=
 =?us-ascii?Q?mAsaBAZ5Ff+xv8iLSQCSSpPWhbWh9BVfALLj5EdRnlnCgiga6NZQ7b6FGGur?=
 =?us-ascii?Q?ScEo4AKNA2iBxzb7IA7rbOW86Mp942d1L3B2X6HxLq9qLtAbwKyyM4KqMNhE?=
 =?us-ascii?Q?n0dqpd2cgX8rNslPNa5GeaHuUw4qDA6Ii9gLMhfo07zsr7LK1Jvw4vIGfEeT?=
 =?us-ascii?Q?3vFjKbRnC0nbPj6iwksXyjhPRS7vgkovdpm8twIIpPtUOTdAQCp/OIDaC0yJ?=
 =?us-ascii?Q?gPkCDVbcTM8EAkgruw6CYsJgzRpDGrmxkTOFFwznxRC9mokDO6jBBZKiCV/X?=
 =?us-ascii?Q?ckzdcTtHgLRJhjpQxCVMHI0hd+jbu/Bam0t5jXWd64tEmet30Ys692SQNrEt?=
 =?us-ascii?Q?8QEIaBQfuiV0pKbA2Z/yAuDKlnbcU3KINcHLLHt0eyXQoR2404RZHOL4+xRw?=
 =?us-ascii?Q?6NAwD7jm7bHv9ID+Bey4bKgSsFlWmXnpiFyFcYggRdgfliea6+R8BoLp1f1k?=
 =?us-ascii?Q?Ce99IHHUwL+eymhjFgdKJwJ3ty9isRcAwHZ0BeQz2jBAeaoqNQziM/UBq6ZB?=
 =?us-ascii?Q?ModoTO5RyTtftLkBEDhHBe8ULlZeknepHOIwRe0iu0/7+I9Mhpezb1NKiZp4?=
 =?us-ascii?Q?ZjaI9R5NbUKPhKNo+8Y7iy0ngTRRwG0c2VUkt0XHO8OxU3n41TXusdhEbYuE?=
 =?us-ascii?Q?lENcwZiPSg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 44616cb1-0b81-4706-57dc-08deec99fb39
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:18:42.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPdv/3Qz+TswSVoS7FRAR47H0F0pxpZPhNwEMNtmRLR4RsJapzvl/VNVEGBP54e0XHy8xYud+ZHlsjSAETpjvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2658
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 11:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242183

The bsdcpio_test odc/newc format tests verify archive headers byte-by-byte
including inode and device numbers. On ext4 root filesystems (particularly
qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
or newc 8-hex-digit field widths, causing intermittent assertion failures
in test_format_newc and test_option_c.

Set TMPDIR to a tmpfs mount so the test framework creates its working
directories there, where inode numbers always start small.

[YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16231

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Use export TMPDIR instead of changing CWD (v2 broke test binary's
  ability to find reference data files)

Changes in v2:
- Use cd "$PTEST_DIR" instead of cd
---
 .../libarchive/libarchive/run-ptest                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
index d6b4c3f934..f5f2ef490c 100755
--- a/meta/recipes-extended/libarchive/libarchive/run-ptest
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -1,11 +1,23 @@
 #!/bin/sh
=20
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+cd "$PTEST_DIR"
+
 # The fuzz tests run 1000 randomised iterations per archive format and are
 # meant for dedicated fuzzing infrastructure, not routine ptest runs. They
 # regularly time out in the time/memory constrained autobuilder QEMU targe=
ts
 # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
 export SKIP_TEST_FUZZ=3D1
=20
+# The bsdcpio odc/newc format tests verify archive headers byte-by-byte
+# including inode and device numbers. On ext4 root filesystems inode numbe=
rs
+# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (429496729=
5)
+# field widths, causing intermittent assertion failures. Set TMPDIR to a
+# tmpfs so test-created files get small inode numbers.
+WORKDIR=3D$(mktemp -d)
+mount -t tmpfs tmpfs "$WORKDIR"
+export TMPDIR=3D"$WORKDIR"
+
 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
     ./$t
     if [ $? -eq 0 ]; then
@@ -15,3 +27,5 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_=
test bsdunzip_test; do
     fi
 done
=20
+umount "$WORKDIR"
+rmdir "$WORKDIR"
--=20
2.34.1



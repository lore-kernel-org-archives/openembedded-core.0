Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FB0CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:19:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14114.1781767156114625589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AbhSOuWi;
 spf=pass (domain: est.tech, ip: 52.101.70.65, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeyQdKoUip3xEHWo0OghxIVzyTuztKWvF7HH91DFENSJCotflk91ByHyIPvnhuci/2drMeEKJ00eyfAUv9f+Kmj88mD7Yox8+H4brpVeMbSyl5IqDkLeKE19aB3Hr4LsgP8lqRzG5en6GlDLbCc98L1PdlkBTgayA+cyF/pUYKuDT2uqS615dil5QRrgapjziB1IHV+hvrN3WP5BZ1cvKyChsY/++Rt3naIuRetf+O3EwyrgByJF0Q/EOx0JVJgTeC+G5L7I/3v6LqT8ygPVLzyMIyAty33t9QlQ2Y+VYIaYES8fOotLtOfa2rgsR0mzhZyuUWqSZ1FGNbKtWLIGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3qpF6QIv89A+SRPhfPQGzP/UOlJ1OuYWN/yOw2uV0w=;
 b=XlonVtFmyXU+p4ZlhSY349GKL4TS+1FUBM8ANQlBOYJRtHjJT3wbpb8FEgsUCpUkwAo0uOQ6VJNtJidHpYqYYPzcDQ/YHYVLXk7+14POqRoZG1tCnp90u5sD0RP8qMZTSHSbuZ6wd5XQNSu0J6EBUOnTPYrF3mbkt/3h5Nj0jVG0hX+gNT9XoGkdz+Dgb1ZADv7qL+Q1wNe18U7u+xYOKBP9Zs7q3xpa7yvMZyBbMJQC2jdnmG2REmg3M4htGOZPofMd0zWfoXIPiOWUfMomKPcfWa9zNNxQ4Fwka+OOgmb5Tzm449rm+rM6J8dQGdAxjD6IC4mqPlj07hdvY06cNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3qpF6QIv89A+SRPhfPQGzP/UOlJ1OuYWN/yOw2uV0w=;
 b=AbhSOuWiNIvk2l/HYgXBvK83fDw3GyrBzyqYNMePX3/22aZfihatLKrMtJTLFNA0QtiI+Ai6OEtLgf1eaJANMhS+JKKR6luH1asnvjm8Nu5q6VNUQZE9nxky16NeqKr8bhF1Kai8Korhd3ppSI3tQkCgtW9MvkYjyyhHYr4yppaODv/QB5JZqreZ5a9jDdUnJEKmyKkOaVuIexioyMIdZaJHhlpC8w7VxGHlBfwun7S5lDH1Q5NST7YLxRUHD9qkgCAluxo+xAZQePE6xuXuLrdpHKqluOC2cjufcK5zrtggWeUgT8wSEV8nXNqFS0G5NK6MaihhNgGGwO+2DdUCmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB2776.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:254::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Thu, 18 Jun 2026 07:19:11 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 07:19:11 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v2 0/2] package: replace copydebugsources shell pipelines
Date: Thu, 18 Jun 2026 09:19:06 +0200
Message-ID: <cover.1781766061.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB2776:EE_
X-MS-Office365-Filtering-Correlation-Id: 837b72de-6487-4da2-ef85-08decd09e4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/AhlmJ07yAkFzlBv8Ynmvzbbd1lcYSUPy0YsjW6K8URJOUFLBDRY6UYLSmJnGKIoJ+GPYJc9D+abHzyKI/k86kfgUSTBjGwMRNUooJ/JjEmz1RSuqQ4Gzq/noXw4mVmpkNZE2fpxbMm0nG4ikideVRxNtjZQ1G7Q8lF7WCBFIadck8EOz6XBNhK37BD1T0PBXnK670A70hAEo48YJQuqXXq2tHOv0Gl8pzucfJ4WVnPRC5zy4HRK3HenyVHLwk0XBmuSFD2eo6l1UwY4TFs7FrzTJyY0GQxaTC2V6AR8g0vsr+NYChhPvWw/GxtppK2SUjddeRv+Lrjc0D8+MC9tBviRG8+x9RPInIVuG3VHw7fO98TsSOvoM9bfyrsOmE2jO0igm2HM8pyS+c8RJnOA8kuDml1Cx5RuDM3e0Ir7I7ZoOhDi4frt+wnPGnSEHcfL+PbMEU4YJzL53p0xCnQaHEr514t8xiFaVLQCzRXvm0rbSO0LSEhm2shn9aAEjBeFQlF/ngOhjN+5o8diSw5uR/o8ofIei7ydxnqdL5WUeA1+CpeGUFTiKK3PrL8j8o8xcEni1IpO+OhEHEcxWegvC0xrE6HTnj0MLuthmOi5axeRPQ6Gi86SZ6qb3BA7sBKOsmXIcTAw8JRF33dTD6YgygoMJUNO3b4b5/piZC0bmpZJB86lcDMjVN1HpOY3i/yW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NKwMALDK3ErRrVoyItZVP8IAFJvjjNsh+k4DczeQwyVtranTyKJ1PQbweAzG?=
 =?us-ascii?Q?BMYQlkIgvU1j/PhBrvVNt2OZEXn4zV6+xlajkzqSyDMDXI9vr/Ccr1j8QbG3?=
 =?us-ascii?Q?sr2PyiJW4P1GIlBK2GJdtMByzEOmQVVXa7PlqHFNgldNtjeszkoG5HD5odSG?=
 =?us-ascii?Q?EmftogUKASdeex94VzS0FYde5Mt3qqevcLdJ04Kwu8m+o7cfOluH92sb6qF0?=
 =?us-ascii?Q?e81kFcylpUBTSemNf4RXYBNK9EgmvLZRjkklB8Uy6/mhqjktTVRImbQW9PD9?=
 =?us-ascii?Q?W/NYTZRQVFnnpfoh+Mc9wQeN8dPdiSYkBbNeVFSb1BAiI1NZ52U9VjDZPGjR?=
 =?us-ascii?Q?Aw3kt0CmGVb3F4x3IjXyOfqhuwPKhJ0ZKB64+ACDeVNsBHeaNMCcoYj9yH/h?=
 =?us-ascii?Q?IwRfT+A+6XLzAvnGzDEHVOpGtFULrFren2yOO2x1v07+XikztzzywLvv9ccl?=
 =?us-ascii?Q?vYR4nDSJuZT5Uc+tNQjiWY2I3n3jX720g0zATzUwE1plqSsRJ+Mo/yUo/8Bv?=
 =?us-ascii?Q?/Oc2NbWWNlgTx8mw+spGBNV+kq839Ih3/Na4X2uIJTBqZsnFu96+In8ChjxO?=
 =?us-ascii?Q?oKMyPhGuaUOEK7onc3MAAR9CPDR19j4Sbx6W+2o0zyUDMZLfRrQhyNeHyqjl?=
 =?us-ascii?Q?R1b1J3Au+65J3GDcUs8BLPQxFoEpXhPyo+fqSpqT8vmp5OIl/LtlOCpUJ9mO?=
 =?us-ascii?Q?iSCXFTCNW0uT3dNocxagY2fm/Rgym9BgfeBpUvfe7ZTIXvMG1+OXReAzEtr/?=
 =?us-ascii?Q?LrZ7xNxus4ZT0xIHhhOCrDY6zfnYelW4N7lRWHqqg7FgS5pTwhSy9+hXQ8Gi?=
 =?us-ascii?Q?N1l7CRVhAsSWLqwpJ8aTPL6qjEEUphn7IZWasuoJxIcNfxhVlnJ8czTpJ/0v?=
 =?us-ascii?Q?QBSsqArv96ILPZCZQj4JbGC6eEa6mAU4IDnLfwK1QMSyUTTrEew7DRIh7taK?=
 =?us-ascii?Q?BqerU6IXM15RBoJ2cX8LzRY5YeOIdCHhzLJDGlQLl9QG795vzt9cUKx24key?=
 =?us-ascii?Q?364k2vXH/ayW9NJT2he3altnQZj2pEB8wsl7JYd29jchALZZWuTomwq4bSdR?=
 =?us-ascii?Q?7MLGBiRSxtf+QsxmW5EL0uit7LpcSBQ/EbhLFd7RANFUrEyfqgKmlSur2qy9?=
 =?us-ascii?Q?GPDT2Haq12RuAi/EePwwJx9gIbXhTEP+FJJ6BPOt9rlsH0+FjcgsBH+SXwQc?=
 =?us-ascii?Q?wlY63RZHt5Mo05o/sYpu8oyXKST67JPXbxO9edUPaO5vUKfAQiBkAh79PKPx?=
 =?us-ascii?Q?jpBgRO5T/E9S5YG/qX2TGTK8s4IivSoNV69BMkchbOCuGLjc7V9a+YOQYHDz?=
 =?us-ascii?Q?YXvePg2kmslBNaUmihzrNFVhpk5N02G5BisQxhLcNabCZRc+RCmPYNCgdjuh?=
 =?us-ascii?Q?FwXd9KNGdKVWujxFeZMKIsV4SQafOyB5hBfYU2AWtxkK0Vzt43qWWvdt3AWg?=
 =?us-ascii?Q?TTiRVCTIkcwDVBi0dZcYCfoXGKZH9yj/lsdKEeBsMMV/QZ7f4x2FEpmobenX?=
 =?us-ascii?Q?9btfcrHqtbFls7QJOzU1GuDVeEQ6qjpVQTG8dSf6yio42PV1fXyCfoz6R0nm?=
 =?us-ascii?Q?8s/BnmM+HUpWKpCvefeNsF4xSL1lfNM6OAC/dTCrC/3RFoPi1BJD9/umRFLC?=
 =?us-ascii?Q?HJW5y6L2LGfvQ5wmMvs3qkvpthe5dBrff+PQke7xyRzSdSDI8OXQ1cp4Glww?=
 =?us-ascii?Q?pbobnFe6Bi7QaB0hBsjoAzAgte+7mq7nyAQvlVXkJJ47TwAfnll6YBhOaT+F?=
 =?us-ascii?Q?poYNgNZG2A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 837b72de-6487-4da2-ef85-08decd09e4c5
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:19:11.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC+IHp6451ZoWOu1bQ+b6Ljq1rO0VyC6U+jKSEDs2uPZwo7cg2TWw0TUw4OeZozqS0urim+T9Jx0BsX8MOkpUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2776
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239061

Replace the copydebugsources() sort/grep/sed shell pipeline with Python
filtering over the NUL-separated source list while keeping cpio for the
copy pass. Use an explicit prefix + "/" match before stripping the mapped
debug source prefix, replace the symlink fixup pipeline with os.walk()
plus cpio, use an argv-list mv for externalsrc relocation, and pass the
empty-directory find command as an argv list.

The externalsrc relocation keeps mv, but now with an argv list and
glob.glob(glob.escape(...)). This preserves the old shell "*" and mv
overwrite semantics.

The first cpio copy pass keeps the previous failure-tolerant behavior,
while the symlink fixup copy still reports cpio failures.

Benchmarks did not indicate regression.

Changes in v2:
  - Replace sort/grep/sed filtering with Python filtering while keeping cpi=
o.
  - Preserve externalsrc mv behavior using argv-list mv.
  - Add test coverage for filtering, copy failures, symlinks, and relocatio=
n.

Anders Heimer (2):
  package: replace copydebugsources shell pipelines
  oeqa/selftest: add copydebugsources tests

 meta/lib/oe/package.py                        |  70 +++--
 meta/lib/oeqa/selftest/cases/oelib/package.py | 274 ++++++++++++++++++
 2 files changed, 322 insertions(+), 22 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py



Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C547CC5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:55:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.5065.1700135707865706721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=qX7tS+NL;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGTAevdrpdjQwnGMFxcVTgoJpiN9DpzXkmBAVcAHR2CoQb34AG/G+xrNa5nf+ZEaXBDRwUp2WZL1nDdUT76KMFvyfO93YIuGRjl7Pp0D38FDPzQGWTAKc91hTVmssK30oF1JFlOv99CGHjT4pdZAIkSEnZH2vlQf5NEVKXTHMdzCshKl8lU6xCOx3+ZMcqzs2YvKka6sKaVC+uGevC2vjzCNRToFbgJ9J3I1iL6voeJ3W5ZaGJ+UZOSMpWFEh4Od9njY2TvokQm+ZkdIctNm0tNBeskDB/9o+Y73Xj3IQ19gZEt/8T3RKJWx+1dYGDYqSl91EckEZnW5TLtqPVclCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjupGGSK+VTqBqBKyByZf8yLCH+D2D6kbdJCfvn+LOg=;
 b=RB1Y44B0c0jpVcbZhiY13BzSchPya1wpGF9hNIi6h1ZxgjixaIOePtUQkPmaYuFBPeT+lBs0dh+VmmITy6T9c0jDmX5mI+nFOBOyTY+eFRV82wFsRGTBNTWv9P5aVTz314cN+9jZiYPwKl5Cm4subCoHrukgBSxYwr85e4JPR/nRxUsgHI+q1q0ar1USPWPN/rGRY1awM5cNPU260d6+Ck0PwZzg2Y3oRUIdEcAeMh5Ti4Fy6A4gLxv0NUiQO0jzJXkaVzl8OtG5eyaIA/imCv8HTLhr1xJhiFqIKc+TMGwtIbYrRT2kYmIC7/S/Xf04HuK21d0UsODdCoNF17U/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjupGGSK+VTqBqBKyByZf8yLCH+D2D6kbdJCfvn+LOg=;
 b=qX7tS+NLZmZm2FkLD/o2pu4tkdP+dc6zLnJD8lgxaExvq45IUPBsNEfTNCL1gbBOJ4zJ0t5ZKZxQYeJbctYqciszQZqG1OdfbVJ1Xe12LUOv2P+TjmJfcb805sfegXI/YKwl1a7qPSb7bh/X10QDAumBQhO5YSe/S48Qo+rxCNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10581.eurprd08.prod.outlook.com (2603:10a6:800:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 11:55:03 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 11:55:03 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 0/4] tmpfiles.d: use nonarch libdir
Date: Thu, 16 Nov 2023 12:54:53 +0100
Message-ID: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: 548925a6-4e77-44d0-d5db-08dbe69ade8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ut4e+xCXsrr1BUiv3qEInFuLWvxUmtXHLFLdiooAdcd/pNI4CGKtQ8FTelM6Z/dSzQjcLnhK3+D70u6X/79901YB+ivX91Coz3cBz3z5kD1nHKxEaRJOmspHc9EeBtw40zAdWkSGzKUkdHpSqXoH1JXQuehh3227bnPz+vyZydT+ygTVAdDzCKCN1cMHaL3uZMUwbJf2WOq/Y7myxgYduZ72QtH7Zgldu+q4aebky0HNH/nY7dyNHfU9Dkr/Vwv8u8bA1xVxeUJNx9yhsiFZkK/mBAV6mdPrHnflC6mqLso6TkUe79No4okC+8koL6c2NBs4Zxaojnh+/ILL2pE8Y5Gt9aFJDHX4j9CePxuCofLfC+z+tWUQsTmnH+U81fPkoMHF3vLeHHrQsSk3SuaxL/6R+IignLoJM8Je5iQsrIpSmSGu+TUQnCIWq1Sy9wTyiLnKwAkgeqSw18obCdva/vdGjDp3MhWC7dVC6gaGJmHyEonGJrE7L5yeQzsT+U6UnpXKDaNl0lko/VWhbx02JHJ3+IYn1Wa5O3x0cuG5rmMBoag85r3N0IHOHhbcyWIJy7NT/lNQcw83Ho5trihKKHrlGm3RIqWrUnghd8lpM/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(478600001)(6512007)(1076003)(9686003)(2616005)(6506007)(6486002)(107886003)(966005)(6666004)(26005)(316002)(54906003)(66946007)(41300700001)(4326008)(83380400001)(2906002)(5660300002)(66476007)(6916009)(8676002)(8936002)(38100700002)(36756003)(38350700005)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lCw+sjqXmISjNzQV1/iI0Au2FX0S9rYwUHvjH8X0X4sr3VUWomrbq3juORse?=
 =?us-ascii?Q?bRrmTn9jcR4bt+lLvEANDYz+2317MZR4dYK7fd2N07W295wIXNrpPEEp0VK5?=
 =?us-ascii?Q?dW6tM/jIdTrfIZ0PvKuVj/qXBWY3XUmTfuJfygsE7mduPXS3LALZzszgt2vJ?=
 =?us-ascii?Q?X8QDf0NmQf4KpD/DEA6kAKm4Meoj2nwjyeUjUuQ1FpAthHUhm26MKfIuqKnw?=
 =?us-ascii?Q?C0jPDj5tvhJ0PNQtwz+W3FPhaIkiCYKxqE7ph92MeJbZ5X2uRvQiPAMFs4bq?=
 =?us-ascii?Q?31HWkzjD3g4agNWwyIAPAqhrlS0k7olUywID15GHlxcVjFF2kc/MQGvbj3tQ?=
 =?us-ascii?Q?e1SwWDI23NqlnWipKx99AU3dWbhSDub5y1BEXbrtgg5U1wEo3XH6hyLkVBUU?=
 =?us-ascii?Q?hdJatQaTXfq/i+9rRrmGUT2cTca2yPTaM4F+SEyRQcRAMJv34dubetdk8Joj?=
 =?us-ascii?Q?fbAML6zj9csEJkMDT32mvOcMVmZPyop2Pj65RdHQrGz1+jgVbEMBk48s9V7o?=
 =?us-ascii?Q?HelUA+P9UezxZE+6paToWRlAwYDkuSX51whEDDNUdDshKsm/w9g2vQte8psV?=
 =?us-ascii?Q?sWruIK+C3lk61VUWM41/LeVSAHfIoy375e5BFCXrBO0xIdC7tim3RxZFek7s?=
 =?us-ascii?Q?8gpLf0Ep7m3PZNhx6zXyiCK/nbCryYvhMFVI7UoI9lmdJvJoRTR4LnFK2O/E?=
 =?us-ascii?Q?AjpyvvDZB7MsFCOX33UChmKxZbfz0Dc1rzPzfv02YXty+SfLSEZgO/65OuZN?=
 =?us-ascii?Q?QP+xNIjztT6E0iDkArVCwWiBbzWWgNOpASy4E6Qv+FQA3aDc/Wl93+waK6zF?=
 =?us-ascii?Q?5brb8rZ43u1evJHdgJJCgApO4ai9o3IQioSCy7hUPIPcFwoKVslpDuS7Opcb?=
 =?us-ascii?Q?6iTPyGTFEO7W8Nx496h1BfgBg9IB7246Kt/HfXfuf3vBS6PiZslNaOAiv57N?=
 =?us-ascii?Q?aEdXeAQeO+xp0hgDi0K66eQ+L2KoNK2YP0drccqlBkwDxyOJZvC7UMS9MwB4?=
 =?us-ascii?Q?jJ9WLTdisNG3RthTRIBd5nsW2THFqh8CmXXKbRZAqswov1YctgwYAr/PxNm1?=
 =?us-ascii?Q?rCCrAAVHYuPQwLSIjA6fsgP0kRnGKChnCWddTTYUZiHu427zhBScN6s/RlDb?=
 =?us-ascii?Q?ekae/Ge5Sh5Pz6QjDBSZzxJ/CDwPMesTAr1fxObxB4L/9zOlnxuE7xwp97ZK?=
 =?us-ascii?Q?mrurp3GDj7N3//CgsMAmdZ9w2t9/eDCUglidb8LCkViRVQOoslGQLGxNBFEU?=
 =?us-ascii?Q?0aSrZT/h5YJJm4d01bxP1qqfSJiJsN83S2h3wPiISn0Gb2eIf4DO3yirfDg/?=
 =?us-ascii?Q?UEBohHBpqbayr8tInf3Uf/AfkB95ARe2pc/ILhmnJTsNdfxaSiO0qWFOZdtN?=
 =?us-ascii?Q?WWVX2h73wzAiARnhb4/1XXXEopBzC/p07GNaDEL8ogGZGa4+FHUjmc/wdGC0?=
 =?us-ascii?Q?Y+4/D1hbgkmWKMuCwdAm6ofz7IZvx/xJi3jgqKyV49bBNLuSoIfkORhrsbJ+?=
 =?us-ascii?Q?c030ZShpMQZdETr6pEI7kh60GNLnFlxbceUZglB5A4TS2xEro+4oExQbZoyd?=
 =?us-ascii?Q?tigFSlEUBVjvgLCBJHbzMn8ybkS4JMyfsXQc03XZvPL2+Mh0BeFKn1aG4ylU?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548925a6-4e77-44d0-d5db-08dbe69ade8e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 11:55:03.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iq5i7MNAvb30au3l1enzGe/D2qyapovE7V2X4+qMZCYwajHjR9J6LUtDNEVOsxL8rWtdgdLIfu1CfMbeTVlQvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190786

From: Lukas Funke <lukas.funke@weidmueller.com>

The series intents to move tmpfiles.d configurations from /etc to
/usr/lib.

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>

---
Changes in v2:
 - Added Sign-off-by to commit messages
 - Use ${nonarch_libdir} in systemd recipe

Malte Schmidt (3):
  systemd: use nonarch libdir for tmpfiles.d
  pam: use nonarch libdir for tmpfiles.d
  sysstat: use nonarch libdir for tmpfiles.d

Stefan Herbrechtsmeier (1):
  glibc: use nonarch libdir for tmpfiles.d

 meta/recipes-core/glibc/glibc-package.inc       |  8 ++++----
 meta/recipes-core/systemd/systemd_254.4.bb      |  4 ++--
 meta/recipes-extended/pam/libpam_1.5.3.bb       |  9 ++++++---
 meta/recipes-extended/sysstat/sysstat_12.7.4.bb | 10 +++++++---
 4 files changed, 19 insertions(+), 12 deletions(-)

--=20
2.30.2



Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBA0CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20962.1782221729473356181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sXjsWfj8;
 spf=pass (domain: est.tech, ip: 40.107.162.45, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEUqx6i2pP46rhvsggPkdbdrTK3WZA8QnIGXhZdOHnYnuK01WQENKjzcwmvk8tO0otnP6fFm0N5dbO00mm7Y05r+wdkZaEvcmWgtiPVI3/z3NXUkO2MMRGEE8VBTE8XUXKA9z+r1C8nwjusbMIBylH4mnSFCC5EpuFnsXFIGEMxNvLJAgGZQrk/jGCh20zbFDN8f6eHj+HSQMDdRXJ2qzF3EZ+H3Q41zpQWhbsQ65IWsCOIRvnD2dSKfpfXPToRwJiFTrecMTjEqGuBlBKcZzhj/3H3D9yzqSdhLcmoGhbduKXJ79DKKLhmdDRsoYdkwqww5BTYBElWrhczkh44ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0ewO0A+ZMV28mnLj0UdRwlb1K9IKtcHrtuXICDG8dI=;
 b=c7Db31cEQQV6XJqnowUFggxPRzzt6E2WsoJAhQ9eeT3q4LpPk/uMXt8rOpoddhH8OfaazrQ2Of4rIs0TcanyfGJ86rqAFSs6pTJ9dKf31kSjhP1CBmjnd14y06OonbZ9FG/IsQ5dNnSQ0ib1XHrOu26m64tuUtepoA8QHS2DClKw3Ji2EP3Mf/qfEcszSspcVriXrcmQfYYnSh9j7CInag+anNqYwz08bqI+Ky5+Zfpq2UDbEQiLbblrSLoSDBSUPtgLhYElBMsNTPMjuw/vzDTcT/H7yfbhxisLJKfQ+wsZybkC61DD642ENICR+S9ivVnf9hnHawrxeUmM/DZHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0ewO0A+ZMV28mnLj0UdRwlb1K9IKtcHrtuXICDG8dI=;
 b=sXjsWfj85uzeZFTHeCVhrA9C3eTawgmAM5jq6qsYDmkFNmkakuvdnfk3FIsPKN7RXRAE9b3bgaB/bfV30dEz7bl6wFOAuNxVrk2sVNevXY04IPOcDqANf9nlxaMrWAbJQWM0eZc9MSvQ0AJ9uCHP4kTL0CNtrjCSzO2NDpLCsZyaIrMdFSnCif40/pmJ2f6bdtff4ENMm6KbYF5rovJYO1VwaTwf2Kzj++a5nt5543CoDFvD4LsT2T3Xj4EaP67VJcSbMYoRIKQGB1dhwXVD2ztqaEFeU49W5FrBrciEb30SVI3OPS+SgYonaK+U1QbliphRMSREjKavChZLb2aUVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:26 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:26 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH 0/9] oe/patch: execute patch commands without an implicit shell
Date: Tue, 23 Jun 2026 15:35:12 +0200
Message-ID: <20260623133521.17053-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f2428f-a8f9-4915-b522-08ded12c489e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|56012099006|5023799004|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	WYYFK6nmpG8tckUi3gzgbbCNH4QkI08HRwI4cuosyOTmCgcVNV05BtXh84dcVQeIAi1Vanl7mPkTfLjy2c8d6/GqKJqHcQwhqYlZd7fDIG9lGiKiu2A3TgkgYPkgT4cRS70cD3cOtY6EI3Xb7hxa5w7HnkBokGVXyFrep3V9AVjIzAQCibGsJwl/9Q7m0xH3OMyrrUzdf8/XsXec1oVtFuiZA/gQEqQiiu6M3RM5WMjsmv8l61eHw10YixexQccut7mcJg4RpWj7tcJD/YS9XalX08nze3bgSBBf2Qm9+bWeHj9SjnDFBHUcqIqiW1bMHripspXa0C5skPcZv2EaJ1uTDpflKrR4z6XgSS0p7TWFkO9BKFO8RYBTpPLFisUyEMb3H1Mkm4FN53nYpepRnDJDwzPmVCMrh2gtGxzch+wfAAKRMqrVI47bZVJ/cNQ0pkzWeGnvC02/bWqHtIe8/8m+nUAaaRB1GklmkDkCNnrHfdpLzoL5Uz2qU7P8NYUbxxzm4Eq4S+HDa7FZkvBaBL/BHlKp9EPF8y1Exi5TsqTsHzTnELZRmADgwjlQ1bhdAEr0ruZBxUK1/qcuT04ZrWpgUUwM49PD//8r1lxslugNuGQ7E3pSLmMt5ynIqDF/v3NiQrKbj0ifOaAub4Uivce9y5dzJ9OP8DJRelMYgQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Um3C19AufhzUeTUbmTF5PK9JIGrxSQzYkb6FPGE4QwcqcFXd/LMm0NA7Y1+?=
 =?us-ascii?Q?UCdUwzdnfp9zIndUYV0S4/lJtQ4MVAzf9kloICgrY1Qs7DyCq4IEX+g34NrL?=
 =?us-ascii?Q?k37sPkEPrc+LUvrNvQcOqLiX/p1YIDWiNd4Vf1UFFwslisYChocSXy8NwPZB?=
 =?us-ascii?Q?6JYS8pLOl+uQ9De4two/qBkUGcobotJvy/Vw9yK4FLrQ2zMN6+p1sB+bW0Vr?=
 =?us-ascii?Q?5tIzgeh2TxrSVRs6P4HFP8iHUznCmW1M2YBRMa1D11eY1bCi8ImW0IEH6Cm7?=
 =?us-ascii?Q?tnpQmPWsbhux4UJSS7aN2gJRSae5swXH1yBvGpggqY1Gemy4iBIT96j2ZFj7?=
 =?us-ascii?Q?tz1gW/xhEas1lECHx1n+svkevw2LaD85EtSych1/VygQPimv4c1ip0l60lrZ?=
 =?us-ascii?Q?HS3r+/Ovsqx/Nv/L32kyyST3BbUumWdlyhSr5tKTsrCYzteySwTtVLwCAu2o?=
 =?us-ascii?Q?i+bf19tmBzmHyf3GrqtvQwzsCi/xSpRZjybetlrtiKiEPAPLZqxYyyO5xF5G?=
 =?us-ascii?Q?gxPsMTd4Xy9rYH56Dj5i54dcgn9gYh5pDT73ftW9IXEaHMZXNr83POhn/OH/?=
 =?us-ascii?Q?ic0tFuvzMI8gu+rAOsRvNmVyBixvXox37Z/SoJ25tWfo19edjrB5atVvTij8?=
 =?us-ascii?Q?MJCE3PbaoA18+GeQUjARKfSwtfFFxXir+2rSYAhYScU5WEr2hU87eS84Q5mj?=
 =?us-ascii?Q?RODd3SVxm3p9hinl+EWWIXQxCiDDI0vFCndAKnJPwkYASnPPgk/UjNCI1usj?=
 =?us-ascii?Q?oM4LOuDurhDf2q9b8o5sKHhPF00ltDWcyBehPzUrrfAn5lfM/WGnyCmvfE8m?=
 =?us-ascii?Q?pnC9fqdY3iB1/wJQ+F2dO8GLBdEvYw+NIWVDx/DHFQwZTyPtJEQCksC1IL/j?=
 =?us-ascii?Q?ZC4968sfBExKTs+EMpvZi+WvQdLdzKYsVdfn7Il4AHXbrYlwGZRuNLbpsNCM?=
 =?us-ascii?Q?8d2Jwkr8FMCF7A6Tf8ZqTeu/aEYG8aCXIyOo0Nhz7zdKy9IzIial+kQXQ0vc?=
 =?us-ascii?Q?EFatkW7n+ij5g+cdpdioxvF4/qA4z3n9vtJAhyRz2b0O5Iq+Et9WHIFTrEd3?=
 =?us-ascii?Q?hdf1T/0xB+JmngsUqlSUcjDbOEvy7dZy8s/BqSw4eAOXlRM4ubox+TgOjNj9?=
 =?us-ascii?Q?jwV1AvagW2rwohwD3DXR43r0xwK2lrGEBMiGRxmPAbtIYcVULn/EbpOAgXah?=
 =?us-ascii?Q?J7vmEk2KFAGhA7JeLrNbRBt/4XiLQiYXMAV1KGaHk1QH81nUs/AFQ/zXgFKW?=
 =?us-ascii?Q?NuQawC9xiaQ7CCFHkLeWd5585P3UI98g3Wu51ItBZjRmN5D9JhdKKF19B8Ox?=
 =?us-ascii?Q?riaXZfvSaqedGTDpCNzw7SX64EHhe8H/8vGq3ud3lc5jFxD1dyXjwYhEXkbb?=
 =?us-ascii?Q?ZLxktdP8sfbXHd6ag8KbwTD3i9eFXluiDZFPwAMc5XlysC6PhICG77ZSfUd3?=
 =?us-ascii?Q?F9a0LCoVVIzS88GKPfj/8nFweRhhTw2i2Tw9yLgP0P91zc2sUdcjlb43sUoM?=
 =?us-ascii?Q?2TE0B3HZLbl07a9JhNL8T3p/GqFXq6r1RzRgY5oR8j8fx5GeH9b3r64HLpt8?=
 =?us-ascii?Q?bhclrGsjFJnUuJRHuTCL7H3nhpNyB9kcmN/AGYgnjTITvjiFc3uH8vS7JvhL?=
 =?us-ascii?Q?CbGoxoRH+HIlRG8l9CDolIDVC7DIBB0MlqZvYkckigJSzZfDjt3kw6EyDVyy?=
 =?us-ascii?Q?5zk5kjDPi6xu9SRZeWF3mQ1w0W9yyuy7ay0gq2MfbRMfBlz5dp+xNat45tjm?=
 =?us-ascii?Q?GEACT0QGmw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f2428f-a8f9-4915-b522-08ded12c489e
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:26.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLDvoldpyuU9j6l5rhbrUVepGJ48D4tlTVbLgdh0yKecCl+e717gJW02Btlf9gdkJr8lC+0XaLAKTcBT8axPKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239393

Continue the shell=3DTrue cleanup in oe.patch.

Run runcmd() argument lists directly instead of joining them into an
implicit shell command string.

This series converts the non test runcmd() callers that invoked it with
-sh.

The series also replaces the cat-to-patch pipeline with patch -i,
removes the obsolete PATCHFILE assignment, converts GitApplyTree
commands to argv lists, and keeps manual-resolution commands as argv
lists.

oelib tests cover argv handling and error reporting, GitApplyTree
patch-name preservation, fallback commit metadata, and run=3DFalse
command generation without repository side effects.

Anders Heimer (9):
  oe/patch: drop shell=3DTrue from runcmd
  oeqa/oelib: add runcmd tests
  oe/patch: convert simple runcmd shell callers
  oe/patch: avoid shell pipeline in _applypatch
  oe/patch: remove obsolete PATCHFILE assignment
  oeqa/oelib: test GitApplyTree patch names
  oe/patch: pass GitApplyTree commands as argv lists
  oe/patch: return manual-resolution commands as argv lists
  oeqa/oelib: test patch command argv handling

 meta/lib/oe/patch.py                        | 131 ++++-----
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 279 ++++++++++++++++++++
 scripts/lib/devtool/upgrade.py              |   2 +-
 3 files changed, 352 insertions(+), 60 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/patch.py



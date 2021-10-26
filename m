Return-Path: <Ahmed.Hossam@opensynergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D954EC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:57:48 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.137])
 by mx.groups.io with SMTP id smtpd.web08.982.1635274666868491828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@opensynergy.com header.s=selector1 header.b=mmc3jdwe;
 spf=pass (domain: opensynergy.com, ip: 40.107.5.137,
 mailfrom: ahmed.hossam@opensynergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeK/bv80gjQXOpuULYkwl+jDsWEQACCxY/w26wdOwZsKRGHpEZ537v7RArc+4LpN5pUQ47ddS+Bo/vDTWYMWWftH6BilHckZHY/N+u1HBWZ2jwwMHNHvQvGTqHS/OfBsTcwWhQOvZC6TcXEyHzcdSFy0E3tUA4pglD36/nl/4K4Hn2U4TufjTYlo9g9Rms9iqN7mOaiRR1BqhN4YkAmwCMrXEZzazCR5IDRPaGi1d0RlSOtL9LABUKX7XpiQKPGAhltIuZ9J2FdW48k4sh4sbTVDwJorrxG6VHIFM+Rr41G4VVxVNDejH1khWMnKI7cHdFalOhI1GIEpKDKPbX9QPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZFkllUuHA/Z7EB2zqUmt+NFT7Wug75Q2MotYeiqYTo=;
 b=d/P7FDzlONAxTp1VlWpl9Qk8MgFcqf+xI6U2NknCVofnv1Qn+/jiImLrmGZgDvZ5VscOlvqYofkgyFQrxHFiCsC1cGwFaVTMV5fX7uHNynoqZaoVNRn+xn/FIPgl2vxZqAjD/aP8kt8Tj2S0M7BVa5jEDq+We8WrM4tryTPjqyWdqEK13argYXFvbz7n0CRGDOzJ+ZU3cVQA5JvisPezjINBLHBYmp+3UaWFmU53A++bherrB1M+zVXrVpcy2mJsAOMQImr3s693lhGchCw0ItwlyUfKsCO/E/RVybcbLdvgmWrul90oWJWC/N8FW2dzrdMRga02Uyld4qBxW6mkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZFkllUuHA/Z7EB2zqUmt+NFT7Wug75Q2MotYeiqYTo=;
 b=mmc3jdweDFNmZg4U3EYjJBx75GubPHxhBM+pnPqJmStgw7Q0OwP1D9EcuNz0H81ijY6PK2QAOtN3E+hQTitlUjZBNISA+FRFXVMn68fyqvqjSSiXTvN82U+naJp2f/qDW1dN96oEdIHjJXqlz1nMbuCWRcNai1Al6XiXHOabL6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
From: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
To: openembedded-core@lists.openembedded.org
Cc: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
Subject: [PATCH] go.bbclass: Allow adding parameters to go ldflags
Date: Tue, 26 Oct 2021 20:56:42 +0200
Message-Id: <20211026185642.13747-1-Ahmed.Hossam@opensynergy.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::37) To PAXPR04MB8349.eurprd04.prod.outlook.com
 (2603:10a6:102:1bd::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f741c098-a46a-48bf-1450-08d998b27e48
X-MS-TrafficTypeDiagnostic: PA4PR04MB7535:
X-Microsoft-Antispam-PRVS: 
	<PA4PR04MB7535106A3298CF88B45C0B7C8C849@PA4PR04MB7535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fmnt5czYlGP1Dlxg+DBTfKTxR9wBzeFz9IMfbnQ7T5yMLhUwdy+6cKCXN/HFunillDJBc8CtyLe6/zJqecfALpvPsbFpQmdU71BWHLE1LAtjbtGusYVzqemNWbUDtM9wn/ysVnHZnlLIPiF67vVu8K4CrcHL5T3T4tAaUcBGx6JGWB7+5ZWEWhSbZ/3uaC8GnQHNtUhPXO84moHO1yCJ5VAPc6kFEoXt7qxLJ9dZN4/XxQ6xchjLtcs5CVaJLEcxmvCcg8S5ANiZmxReiBzosKtAZZvSCX2r6hxZTQez1kg+G911ohu1XuLdPCnKju213ZnRJkgx2vovzqaZ1LAeOt1L+koX8Bkei/RpaoFaHqNuv8K8FZTAX/Ub0zaZg2hrWXQwSGIlIi7gLEmDDOYqkwel0MA2FGcJqGUSuo5rbERxDzwRgue3pKI9EW9LLzJjo7tuxPg+3dZy4+VblpMfqSF1FmsaCmAemBk8KITzI2hWvEfDS4ayX73eLD32N0uaQtWqhIj29vwkcOzNmF09qpFcjPCDSlFSZfDUGsYDa1t7CCnjf7apzhYytEPDuHKSrWNqXXL15Dv7+cx0yfcmYlGhQg77LcKOx5H9UWM/x9eONRtehciW82O0AzVCPvlxM5UCNbqlUVF8ElS/rbOZVQSFBR/oJPz4t7aWDQp046/lCRu8JrT3nXSU/cWfZ2Ta1UWEWTm+Wvv9eJVx9EoMUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8349.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(39830400003)(136003)(376002)(6916009)(26005)(86362001)(8936002)(2616005)(36756003)(83380400001)(38100700002)(55236004)(52116002)(38350700002)(2906002)(4326008)(1076003)(5660300002)(66946007)(8676002)(316002)(42186006)(508600001)(107886003)(186003)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cb+v9OFcNduddYs2flgdP8xydeZtPzRAdnse8bRz3qsNe+Uz0MEsmb5wIwU2?=
 =?us-ascii?Q?y8Deex6OKF5MJV4MA/ZCZNuHo4G5KCzTW7g7FOAugf5lzOo1VrQylxIzbxt9?=
 =?us-ascii?Q?iCSCm4DfGlub6ABjfFFxEeZf4axkhr1EYvKNLFDwzThecwS2RdRx8RS0gh+b?=
 =?us-ascii?Q?Y+cvy06QS93WtwaMv4HAZK2UA13n23mswZ6LBbLYVhpvFP3OFSfrfbpcm+dS?=
 =?us-ascii?Q?htmD9zt27xVyapaWh6wHZjqd2NKK2fJGNPojzt1WiNA1gaSAWFvw7uA7C4gp?=
 =?us-ascii?Q?wK5R6LeuO7QyqQoE/HxBntbIKtiWJBLTlXRVRpYmW5SSI1Wffnm1lKwnOFJR?=
 =?us-ascii?Q?d5pzTlvBD1s03kj7yXatjuz5P+qoasRPwfvrWffz4tie8e83rm8ixTTYreGv?=
 =?us-ascii?Q?YkTQDHKZprrYt1NyorvoPkAHpGmIxC/MKe5Qva2TmnvAve26/B4EQi2R86nb?=
 =?us-ascii?Q?Xd8jModHYVUnx0oJkL6zwA7LB0uGC59WihdlWRt5t4n7I72TReVxk4XCXqDG?=
 =?us-ascii?Q?sDTWOwbMLmnN64mMfZNN1rRR2Em/B9PROBk8Y0GyajVgFxelrLwQUvoZC8K4?=
 =?us-ascii?Q?z+AzUDffUGu84uwJKqdcsuKgT97xQq8ydweqCzK7VDI0R5pfc0hSBfPiUGUy?=
 =?us-ascii?Q?WSnrnwX/Au199u0DLH/l5hcTaBs1d3uJwfEVUipcqlVuz8Df4TGYZTc8VKOp?=
 =?us-ascii?Q?MUnTS425NKEuNW+udbphzetMn09V1RokuwsGNiAtjgQ16IUq7sRzVIeuiWJJ?=
 =?us-ascii?Q?v+PIngho7/lqWIyag5atqtHIDXsSFvkhRCi2XMfTGABYBa1OT1CzSiWir0Zn?=
 =?us-ascii?Q?ZgyXxJms9Lo9myx5EyyEDG864uxl2OSideBQw9DMOq3b43r7kewF8U1SK6Te?=
 =?us-ascii?Q?wNcTkV2TxzxVV3W6rErJ+W3SSbjJBj7Y0DG7p3imGMbHZI0c+ubLg0cT1faJ?=
 =?us-ascii?Q?4n2aU+XJV0beQYUw5zt5WAeBkfXn9kwzhJPbpuS0FbTUeRCdLn634+nIPj5t?=
 =?us-ascii?Q?x228JNOieKmW/mLVhaolo5Hh7KVgCmzoBV0Mqb+voUyyt8LDv22QhCbx5hP9?=
 =?us-ascii?Q?vXRuVSvGox2+jTA7mMcbGbnzQN9zYxcKg1ysLxEiUvZVxHn7bQubULMJEkjD?=
 =?us-ascii?Q?otwi1Bb19fErhV9Yl48QbT2WrVuYZ7v0ZAZJlMD+nmDID3M7Fo2gnLf4N8OI?=
 =?us-ascii?Q?GiSpoQ8N1Ts9kXsrUzxmJyO/h7mE0zM4QMS8uIO04UBCcqd3xT5JdYLsUl4/?=
 =?us-ascii?Q?oeJGHb42yc9jNnK0HznD30utWcCRTvcMC98NulNKZOUt7SxsedRDkkMFo/qr?=
 =?us-ascii?Q?4PTlxTTFcpUBlp8Xx2AD6r723dc5bVDpUp6lZmrBv8WTdOhhUiG3wrG99nCc?=
 =?us-ascii?Q?72whWw3kU8oG/FP8N64lFnlQ+soAODbBbuI+7Rx04aZAfo4XFDWSaU//A2FZ?=
 =?us-ascii?Q?XMnUJ3sixPChU+Y4w8c+xE40ovf+vrV1q4ZkUH44FkTvjTgag2epaW+oI1sn?=
 =?us-ascii?Q?k9C/PpfozD8twLdU+WLQ8Zcrc68jgRhs/qx3lrkpYGhfBHRQRradWXnND2Tf?=
 =?us-ascii?Q?fJHRF7yV4Sg+7nSlpbD13HkOROQzfJHu2GBzxeADTjsVKSX0/ihFTrM6VG7P?=
 =?us-ascii?Q?NtUWpHXxPIWwNDkdVTtwOlM=3D?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f741c098-a46a-48bf-1450-08d998b27e48
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8349.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:57:44.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +Jn/l10/YNaiGaqYjP9vjjkhh+x8gCMWWuhxVuJF/OKWFtD9VOUs6upsbvezvIocZXJRDVJs3tUWi3ilbiby3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:57:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157449

Currently, there is no clean way to pass extra parameters to the go tool li=
nk,
which is passed by the go build ldflags flag, the append needs to happen in=
side
the quotes of the ldflags parameter

See [YOCTO #14554].

Add a variable to allow adding extra parameters to -ldflags in the GO_LDFLA=
GS
variable, one of the main usecases is setting the application version.

For example, adding to the recipe something like
GO_EXTRA_LDFLAGS=3D"-X main.Version=3Dv1.0.0"
or
GO_EXTRA_LDFLAGS=3D"-X main.Version=3D${PV}"

Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 0dd0c5f1d2..aa54b4a08c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -41,7 +41,8 @@ GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} $=
{GO_RPATH_LINK} ${LDFLAGS
 GO_LINKMODE ?=3D ""
 GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
 GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
-GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_=
EXTLDFLAGS}'"'
+GO_EXTRA_LDFLAGS ?=3D ""
+GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLAGS=
} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
 export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
--
2.33.1


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>


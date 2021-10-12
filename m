Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BF1C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:12:57 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.11712.1634033575621632806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=L3T3XZtz;
 spf=pass (domain: synaptics.com, ip: 40.107.223.43,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy7VpGRFQIBWNDM6GF9H6ATPTchdQo2fajLNEWd5hV8+9gHfzw7uI54w6lMs5adVIFvIgQLHgw+1o9PPIBARBDV9Nq7srqAvORINz7WxHMxZHnOvKluMuLP8nRHhRRfeURMPB98c7WHC2dhAnOR7ursAj+X9RRkmXsji4ig2gMoFqLHagHggzSo4CFkZbPlbnJJ1VzJRQzZp+WTOnn2tBE6WPLVbYWvZ8SIeIMM6dbvS2K1wMQOREBEhtt7y+olUj0XCu/MNIeHaeKjOpzzPSjxqRrduBIUevY9sfq8XAulGFgzJyMX0kD2yZ3jiwS9PuUUD6gvr4mCp7XbB3Ll2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T29zkxXqPRUVTheLKt9qSs50zKrv9kfrTULAZEDT/0=;
 b=gZX+2eJ022Mp8fjXBeTM+7BS8Lw/ixZAGM2ng41q+Hh1QN7xsF/SMoOXBqIY0N8eT8UbmSNq692NMF684zQi7fxAdqdtO2KBA0Uv1zRcbfKanQKkhE1WIp5bG6zlFYlwYr4P8TznQRgJhXzzmTneQgv4/Vkcdjmx9XdaGhZ8c0HpCKCTDdqD+C8yj41Xmfpb8KpZAsUX1e3c+PDtYtQAFJagcUHJfRE5b2dYIa0Qap6713X0RoYUFO+xg7+MFAaBvywXxWvAnB6F2y/aWmdeqfYEEe1ujY1M8UQCx9e9jc+zqMdVGPIxlbvdx/VFOMJdIoParVo8hfnJbvQBoQM7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T29zkxXqPRUVTheLKt9qSs50zKrv9kfrTULAZEDT/0=;
 b=L3T3XZtzePBoYobMAoLfU1rNpNDyTpXm6YJEnzx2/1VEDStgGx2f3dfETXkP0WyB915x4SHcy3OoIUUxGYr/RjuV8WfVZW2hx4g008ol/W6Xa6Ftt6WpXcdnV2RgC/pNpK3WwCJH9M1Bw5M4713DkXGnIz5GogGqO0MN4sVkfFA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4025.namprd03.prod.outlook.com (2603:10b6:5:56::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:12:53 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:12:53 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: alex.kanavin@gmail.com,
	"Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 0/2] meson: fix environmemt files in SDK
Date: Tue, 12 Oct 2021 18:12:31 +0800
Message-ID: <20211012101233.49978-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR13CA0048.namprd13.prod.outlook.com (2603:10b6:a03:2c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Tue, 12 Oct 2021 10:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6fe1b41-472a-4375-e9db-08d98d68da78
X-MS-TrafficTypeDiagnostic: DM6PR03MB4025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB402570CCCD02A262043A9C2386B69@DM6PR03MB4025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EeSn0r6uewNopDf5I0ISe1uYkONAU5l2SfkEYttVnrAG7y/MtHLqNJuChEHpw+U3Ms/Q1DNsoZsV/scEy7m0xPsODIpkh/xtrB2O1mHrenziLNj5580Fwdq6JY0M5/3TGPzbesFAUbkbzU4qTgYkMf9/D8f/kA+SsH9uklN8ovIn80+vcuAjNDmgiGEBZulAl+p0H3iScPcl4CQKyDvO7Lib686xMIDaPpCI1jhKI0pO3oNaL96Ydk/d+PbU6bJNDitCxU7NvuUZMzRvSs9GVcFxCIBXcC/NaEjr9qP4wRJLo2K0afP4vSpKTVKV4hfmqPg1W7TDjZ6pKmddvTsM9g7ZU4NAQ8EM+qfJqM+9gfrssvvxxZDbALkOrayQ37FjbMeMufPidrVVo4lE25mVQIMJdXaV6pBelr9JiSXiG89wwnKK8hTeaaWP0t/XOebA1Z0a28ATQuR+uC6ZhFSoxUsj8Q6G9L/hQgLFThUbDPGq8UiKjdXnK7QSeyvLlRaYc8LN2YVS2bAE34yhd3yC4uDBsMTnKyKMgHY6uJYX6q0JQIytLdgVJuxs4i1GliggbOgRpPTREX3B9GBML4CT/ypJXCFVxmNhLAnjVs+HV+qz1SKhY3XkAbGIVFFIPrfLhU0jB+IqPYI5gKZn4dkaZQ8iLEaRte8dMu9ce2ZTcd6q7LH4TBQriYD0ZS1poCY0O64QOpQKPdN0dh4eGv/T+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(6666004)(66476007)(107886003)(6486002)(1076003)(66946007)(38350700002)(38100700002)(4744005)(2906002)(8676002)(83380400001)(7696005)(508600001)(8936002)(4326008)(86362001)(186003)(26005)(2616005)(316002)(6916009)(36756003)(52116002)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8J+2EGgc1NkcMKHcmYIa7rSwoFR8blnsKGCeuSS2VLXSaDUoh0nxSKl5rIdV?=
 =?us-ascii?Q?rxv4IeSyDhEOgOAeWBo9wsSB/nV3+UhRYTvxQ77gIwYNhbOi6ApIfri8Y9h6?=
 =?us-ascii?Q?dqSYg1ynulsZFS3svl1YgcyfGiXkzhu97/x27UVVKzBXAcltKvRcVH55ukFe?=
 =?us-ascii?Q?qK3Uri3Y3XnAn8rqaThtRMvCRszkl7YHMi+zIueivFGFaCaT8PGip4PUdlvn?=
 =?us-ascii?Q?LmewpuUUzUyd44o8DsE6pQNmU+HVb4mfqesyjYM5C1zsMk3XUmY9Aez7Lw07?=
 =?us-ascii?Q?Wu5Fx3/WuWlO0I90e1/tm/K/tFvQK4+7rmgl1FonrwxVQu40TU4ONIj3dDAb?=
 =?us-ascii?Q?LtRfFWc2B1lKTxTOD+DrN2pb6g56+9uOTHONM/p1GnrMIE/kVxfRwKZUQnlD?=
 =?us-ascii?Q?WA7EZd07R0mTpAMGJaIOcFIf1Iz6W3yYunl6wQrV+zyTzuA9474QS71Km+tB?=
 =?us-ascii?Q?VIgha86hK9RNa4dILo9IdPgWghsAxKOkSs9W7cHHnh/1lbp13JqkcB7ut4ld?=
 =?us-ascii?Q?1nRLhDt8eLlSVLYm78uL5vMnjZd3zDgvais7athR6AC98FSssz48NZmSXduZ?=
 =?us-ascii?Q?OoTltm3aR6/4c3veWdDgky/1YcPha8wT69MTqhbxZC3Vm5JieX57+9nYDh5P?=
 =?us-ascii?Q?tbo0WGQnKVICkry5JGMFWOyhVa+6QRll3XNTylB/p1gEUX3KgVqr2yYeOQ9P?=
 =?us-ascii?Q?JkL5D/lDrlPgn9tux+wUbqfRyMPmUN9QtyyZpcFPvCEOkIrQXeQp0NgNHfQd?=
 =?us-ascii?Q?2of0higJ0h727BorH34s61MsQzjgA78kJCU+uMEyRB1RPdxnZvuyKq5YxVlU?=
 =?us-ascii?Q?VeF1Axhyy0s1ee0LQcETrwDch274ZGKtiJlqtOYqpezryTLb5TmTT8xGu3sM?=
 =?us-ascii?Q?LIHx6+o3Kdlg20hPsZK9/KuHF97JwfBLW34KpEQq43qpDsowSxifB8X1ynj6?=
 =?us-ascii?Q?I2p9o3IQBeqjzTYiw4hhvRcGYxcymSb5mkDw0F7JJzw56BQQdm+fSHTmIPmS?=
 =?us-ascii?Q?PPeLK7mbRb1c0CSOdLh/q9GCIv6W1aINHxZBnmtR7dnr3WBiynJPPf8zxKLc?=
 =?us-ascii?Q?Uaz+EFi3HUEOZPkA/HvEVIRDmnm70bzh4RknAjLR5iBf9u5jrgOb7cgKD+JK?=
 =?us-ascii?Q?ywkxjn5qeJyW2Ci9nkccD2uz7wtSo1E+KiSLu5LffZP1ZKHlbzJaCkpkS5xn?=
 =?us-ascii?Q?/FNnUxuQq68oMGpzZnHOP4hWsAihZx9NfwxI4D8i9l41x9KaVOxh1o9QeukR?=
 =?us-ascii?Q?bMSv0YU0hrGCcDNC3Ws4C+llSbS6NHzoOAhp+R8OdgKdnlWNjf09sUaaLIny?=
 =?us-ascii?Q?jyW8OkqA81I+yhGDSC4MZ5Xs?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6fe1b41-472a-4375-e9db-08d98d68da78
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:12:53.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uQWd78cleCmSf7glmLS+HP+J9OwIVp7CaxJCq5BwZdAzx9oOAaQ/Trl8F2bt0opQktPZ8z9EfHVkAbT1vx/XKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:12:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156864

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

I have not verified the second patch yet because I don't
have cable network at home. And I don't really like the
way to compose that native file, I wish there is a
better way to do that.

Hsia-Jun(Randy) Li (1):
  [WIP]: meson: install native file in sdk

Randy Li (1):
  meson: move lang args to the right section

 meta/classes/meson-routines.bbclass           |  4 ++
 .../meson/meson/meson-setup.py                |  2 +
 .../meson/meson/meson-wrapper                 |  1 +
 .../meson/nativesdk-meson_0.59.1.bb           | 44 ++++++++++++++++++-
 4 files changed, 49 insertions(+), 2 deletions(-)

--=20
2.17.1



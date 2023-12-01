Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D54C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 14:19:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web11.308.1701440361976712695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 06:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=pYYAbhxP;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.53, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9E32YvmAQwU147gqptQIYf76x0QRU7FtUG6g7ewpJs27nAjML7G2FgfRZDLZpf3EBnaot5Znp28okKy/8Il3H1sD0me6qs6/HRoHW3MQ6CgiqHVtWSWF/17ZrQKuvbZQmEYe29ZDqb8iCFvykWdQ8mYodgL3ZuxAjRrPUz6iAFY6ugXMhKV99YBJIFHpe5RCkivDRdBRs9fJvr3tPayvGsdNYrA9gkBl/nUH9poATu6yvbGt4he88cJBIEzo4AVxhVgT92Pm8JCCdl9Un2apGCy3aNAFaapoFtHqKJN/ylvz4Isw2zI7NyAMQzZPrT1pyAvIy1EL6f0erSPg+y/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK6k7UpJigzvY4URl8BUIY0Il3B7OpMaMw2cUf50vR0=;
 b=HqFqb/p7FCc61ki+kV66Pd4F3ZgzawU5jc6vYYwN9XFSRYzfEuy0/MBXtcMYy2cpWSpLn9t1g9rz80URxPYy91YmAJ0TxgaN3d3mF3198aWnTaGVB/sWN4SlbE4uTkzQ1F6ufucroMiL1WwziruQaSvrInyWmPuSd6Cjre++GZr0HNXHTkar9xUZrHrMYospS7VnIPrHn78K67MceOofDQN5DtP9UKkIvq2TAw33I76hWRBvFYaAvclTOcXb9YPp/+vwq4RaAqLFZInD9fY7HlVyRdXF0TIAENXAzzBueUCIDUYgpaWKwD8H6oYgOy7KAG/rQNdvnqzRKGfQQtw3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK6k7UpJigzvY4URl8BUIY0Il3B7OpMaMw2cUf50vR0=;
 b=pYYAbhxPyeizDflSRdC45x1qKfOdzWQ4f8Vgvjl95zlZ/VnZiGEGUQSY5Qey9DSluFOxpszxxVYXo9b1EpC6fahulm6rwr9YWjbTVDUtzjahkrVdssHgryxUveEqmoPTE74JAITVWT3AyvxuW95p/EyC0O8+pz2iVUzKSXScmic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 by PAXPR08MB6397.eurprd08.prod.outlook.com (2603:10a6:102:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 14:03:45 +0000
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5]) by AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5%3]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 14:03:45 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH v1 0/2] wic: bootimg-efi: Make kernel image installation configurable
Date: Fri,  1 Dec 2023 15:03:30 +0100
Message-ID: <20231201140332.2145367-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To AM0PR08MB4946.eurprd08.prod.outlook.com
 (2603:10a6:208:165::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB4946:EE_|PAXPR08MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b51f21-b7b5-46ca-6600-08dbf2765522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bAmAZZaezToDUxdCguMluuR1bszPwXIQoBe//wu5vuHf5wwFV1x5+M7y5EtErVCCrr4uC441lg2HXSGSREVrWzb7dzc8vr7+gYkUnghzYLk0Nchhk0LeEhK221H93dDZPOW3OHSn8yl5ZlJrgfXcAq1nmgvDlr/GFlmfNKeeSkJVHVffvD9MZd1OMGsw2FAu2U4/dO80kMFkQEUctzCj5YVfOuqkXa9RmqapYo+EODsbdJZft87BRAzd/DVmofaaPS3jhwr59WVuKe+n2BF1VNyVdrYnq0vr3L6p/Y8gE7gb+7Q3XIUr8Zj2OIfSmgSeJWMcPLQ2/1+3v5PPkCL84DOBtZ3jGbksQf4XfFurr+MZlhWNalueIB4eNpLJW4eg+aen58D0/sgxjXI8MC0J+P6IpxfZeddxzNXycnUmaTGsWmIxZR7ZYN430JzZTzrpSsgJcfdu1fHleZIlUAv0vsWo4aLx/Xo355ywbaS2yQxRA+YrEfhyGfI3b2jyuYhdSOfHlj1j0oASaMPTx6hhdsKJGj5nn3t+R/r+Koc6YSp09kSZztodRjgyE7KysALSnphVdrAOT1vl/SDajLGh32dznuatVO/6uGzMDfjOd+4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4946.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(9686003)(1076003)(107886003)(26005)(2616005)(478600001)(6666004)(6506007)(6486002)(52116002)(966005)(55236004)(83380400001)(2906002)(66946007)(5660300002)(41300700001)(66476007)(316002)(8936002)(4326008)(6916009)(66556008)(8676002)(38100700002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wu9DmsV+Gqrd4SLF4WK35HhzOu1/X5lRRVIX8Rqri9MWoejF4S0IxzJzlx4C?=
 =?us-ascii?Q?W4SIoUpF/BkvIo6Zw/AmbQfEoNPOju0jxBZmyM1umutX0zWXbpCgEhNCsanU?=
 =?us-ascii?Q?oQEVOthp9jv9SEGeSzl/tgvJ14Z2swivVsdp7tWTmEwv+SjBKqrhbfhZrKAI?=
 =?us-ascii?Q?n/+37xQVz2tjq3FdJVtYAmsJGlP2m//BiDEPJqAeBwiXUZnQswJEBijYyOt1?=
 =?us-ascii?Q?DzPwXo34ecURSA+c0K2+7stVtlUKjarqguBkj23Vd3Qsd5UidvM8lo9oHa1V?=
 =?us-ascii?Q?LX1cOEL/RCrtrtaFSIHydSFhEuMbqF3PwBdahyeDYaZ5dvUGcyUqM8ZrWv77?=
 =?us-ascii?Q?oOxvLyCC3aKWfeMQ8fuRqiu4MO0yy+LhYWLhlHWiV5iWNscFCI61eLJn06rr?=
 =?us-ascii?Q?JGxZwHDS7qZSkJ7RYNo3AoDijHtmQKook6A9oCdED/ZYJSsrrR+ayUz1IqSM?=
 =?us-ascii?Q?4qBbFfeREHd1z8J+bktkXCU9zL1aQnGcfPPBcN8LZrKccm0eauZUeYJV0mGI?=
 =?us-ascii?Q?JQu12C/x7vUg416Jxmiy8XuRpbOV+8oBkRmDWFY87fnhdVj7Ial38DDNcrmE?=
 =?us-ascii?Q?rc2Fz7MSjsoL6NxVP00QW3T84Mmqg53nQBCCi0wRlTJaAxSKVP8veEs6m/VI?=
 =?us-ascii?Q?lB5sFoP5ppIlCONaQ/jsB0XahOLn51f1uDoEz1k5cQgKdKJXVLuDopPRXm9W?=
 =?us-ascii?Q?Xx06kO9Xfb9GbSkOkR9RNRIDjp170+iivgmmEHQrRkI2kxY1vJEjUKxBCPrT?=
 =?us-ascii?Q?E5tLr7z+epLcdjOOqYjp/ln+BKb1PQ5wH7t0MmKWqBgY9VIEXU4xc8Bkrb09?=
 =?us-ascii?Q?FKNWBPesZLCL2LXSzhce1/BWIhWNPGuO2npD5IY9DSY+j5QbMYd/lMEnXW3s?=
 =?us-ascii?Q?EFfHKxsJQ9OUiq9ty6DefKgOVAeUsKS8ixI0hKYLfpTvD9YCV6W2pLtZqxGT?=
 =?us-ascii?Q?hxHeUsXXkhlPz2xivzSf8P3VvBDU9d5MnVAdLhrxW8f2L8241hwWmidcblv3?=
 =?us-ascii?Q?epWk6or5z6NNd1aZXgtUV9GKHONEGR3Bt3XmtRnq2gStm3fTUdJsL6082k5E?=
 =?us-ascii?Q?ZkxytXPXZ+Kj7/dMUoTqntShgbsLIcRgvK4dGha8r+MMF4BQ75qoD1fJloE6?=
 =?us-ascii?Q?+CPEGAIspUpGtS6iVhFJnbelUag9ddevGthi1Jly8yhrG8eIiKQLOta/1ZN8?=
 =?us-ascii?Q?kbWi2tDDnbzXS+sDUGcAcdkw4mm97kgvNPauTbaKmVorJRV7UT6eejr7Mi+Q?=
 =?us-ascii?Q?uYOTOUnZk/8k/J9sVFXmzde/kwkL4hWP1yjUsl/SBEdxCkiVYxZvFIT+dgcj?=
 =?us-ascii?Q?H9TIl8jECG1/zrBTwlxrpN4KMWszb0MnlD6LJbmVX6X16Zdu65cta7EE83Vv?=
 =?us-ascii?Q?pOxr1dYztQFAVrj1uQJDMqbui6/7uSCVGjhjSCEd4KuipnUPhNeIWj7qFoE9?=
 =?us-ascii?Q?l8QZuo49d6z6oZkkpQuNmrKUfYq2zl89AlUxAoOAgxAmFGHLifa/RHaCzfyn?=
 =?us-ascii?Q?3I+wuAp5ms1/VHMynnWprpMneMNA/QVFYLQN22BZ5Ple9WoxJ06BKvrlpEbx?=
 =?us-ascii?Q?GZXJH4LsfWT3fs20KEIVqYzfVpJgjYqxu0jDCCB0zDAvfkA6m19DYgq/w7e3?=
 =?us-ascii?Q?QNCmt3a8UBg0upf2UhxLJsdb1XQBQJE5ocxXORm8RPCI?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b51f21-b7b5-46ca-6600-08dbf2765522
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 14:03:45.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt6ZVoiLHYoDvgXthRrNVaNDB2OHjH4Gv5D5r80vBkDkk4+XmXMJTJqCxEBhp7V9/kPjQom6V33zk6bknrCYiH+QDy5bP48r7XLZ49eMbdmSFrldt45AdIH9QSPiMUkp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191668

From: Christian Taedcke <christian.taedcke@weidmueller.com>


A new parameter is added to the boot-efi wic plugin to be able to
prevent installing the kernel image into the boot partition.

This series contains the functionality itself and the required
tests.

This series joins to previous patch series into one and contains minor
improvements. Previous series:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D11008
and
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D11009


Changes in v1:
- joined two patch series 11008 and 11009 into one
- added my own Signed-off-by to the commits
- changed the commit messages slighly
- fixed test by providing native sysroot to wic

Kareem Zarka (2):
  wic: bootimg-efi: Make kernel image installation configurable
  oeqa/selftest/wic: Add tests for kernel image installation

 meta/lib/oeqa/selftest/cases/wic.py           | 68 +++++++++++++++++++
 scripts/lib/wic/plugins/source/bootimg-efi.py |  7 +-
 2 files changed, 72 insertions(+), 3 deletions(-)

--=20
2.34.1



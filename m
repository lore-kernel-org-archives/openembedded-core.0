Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B32C38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=zENDp2ij;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0DdEmUHsIfWUXJ4Rek8FbotYVPKm3HBSuOdpDmkJFiJN/iitvzqKShjehq84o0Y48u0dI/AKMx3+UkL+/jh+BM80IxHhbVYxSD6ER8G9pjfKxe33Mft+1N731+3Rn9cFpvk7ay9yBxX+KfGgTeDV/bA1lz86jyK4SzpPUVhcV/QG9fSB0eIb2POExyUwtAQAjAash64cDTrU+L84nv1cA7f3wR0w+71/qS7RtxLky0fQlHITAGqYPbd6N4CopPrLXTnxh8ZHPsWi7FZt4l+kFT6OiCuRYse2IgFZlyPRDIyIYeR0IvnSgc/LVE7lFXRybzP8F4uKqzclg2WTcuVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSbzZdPhoum/E8uvMZ/Ua4rL7oNSxhff0Rfc9ttmq20=;
 b=nUjTRUDvDA2K8hphBrguHBkqGs0ZWpvjeRvc5Yu6CKYhGpyg62F4O9UJNWth9LbrubzubE6Ld2JBzZ60bSmrLOVWHjiJzY5wQW9kRLNS8up2yRmLoHLHC7uKPBfFkFNA0VFgM7zPjSWbTfuEWQa3TfcDhHIoE52CZftYIEPA46QgpCNZXFnJquqgmBXLiLe1Sea10xzxmfF+OpEsqcmpjSNHR5we8bXuOBveiPpXvVXXFXY6NDtIVUOcD23LAmLgjDgqi5PkuAyJM46qoyupN0wiJ+FVV5jNoAQ7B61iR5A6yViCcpHK4y3IcStCbQUPl9PbfTqVmpw80mbJ9wYtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSbzZdPhoum/E8uvMZ/Ua4rL7oNSxhff0Rfc9ttmq20=;
 b=zENDp2ijI6jFY1t9kPo/CF5We+gvNRSr34DqXL9e1AGyVqP+HxRddmjNdvjlma+C9IDpajPVN8XpDXM5WZ3lpqW8RUfhymBZvEI/dGImJHCc+AcHbhLbjSQCt9QgHZp3zRsXqtiRC3s6Ai/3RslXe1l/fd3DqdIVIfAoNULcZS2aK4EvOXsYdndaIpLmNzvYOwkDazhhFOxQPAIl8+8TqFho35KkuRtqe/VkyGyWRI8uUUvllIx0ThVy5Nk1vz6Yx7tfMMRULCGs7sjZYjqe9/dAYHd2DMSjb2ngK8yUaMqXfQu0kqmud0BdbMV1nEbOafHYFXKyfnBlEUY16PIW1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:46 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:46 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 0/6] u-boot: Rework signing process to remove interdependencies
Date: Fri, 21 Oct 2022 19:37:20 -0400
Message-ID: <20221021233726.1751124-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 78208671-4f51-4a94-73f0-08dab3bd41c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5VcraE1NmHzq9Ijtj88cvdMQgEAZhROJqnktIhWzX9VmENre4iNx7YOeEfXN6BTd1sseZIfMhq7KyQeXNDWcReOfWa1Ysr/fIloQRXq2FwmsswguZkVLMzKZD0CZTjCCit0T9gdCDX7EzgCdLAVgCvVoeI7+duLt3cNsFrIaJgmYxTpHWQ56L3soHHdMidd5pILmFPWH9Fna/ForbWSJPltyG/yHJBZFbR8VHfQtpIxIMnWQ1L79g1XYfv4saM9AHZXu0biA92btEALodO32BXKbD7e8a5w28ilYM5egVpSa2AYKSWnMJ3Rla1P2nUVxPX5lUj3SUJv8YRvOcPjjUpM8S08rl5160HcBp0EGRBOP/tdikJ6TmuyE++HHmMx6Fd7FpFUUNtqoYuMUiruzM7u5fCclOXp9QO+IlwMr/8pj1BRTivNZDufWc2FlWmy+8fsbFSEEfUUt+l65aLh5xi2Oi0YJswnqFir0yNXsRvBJz2/aXMrm5a6tlchNJf3jOg8bedWKfEQ9Qm3XNUBqWh5k8lub8Zm/F4i9sda2eRKljtQ3YRlcI88QhPTzFDSXa2STA0yskpfO9rBfBACcBquyIgCTfn38q02I3sfKTF/oiigYXt3HOqvXHXQySVmSGYh317j7HnYSL4KcZGdH41B+z2dBdEgbLBQVpNjQ5QP1o/gCYO93Q4EHIyZg8XLzZJrUrrwVN3ECYM5Y00yvRzovHC89voDCtLqNDGXwq2XcVom3239j5GcHnJYEArWxCEBE9qKWHpt+Gh9me9uj4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EBivd2ymf9qTgn0SEx+tIOxt2SbrydMOSP3C9U7A6hYnEyCaxCLvLmB+xr/P?=
 =?us-ascii?Q?MhJU2xf8KzFnfQ3uLEidLR+pRg/CoPzs/kjQf9PpcYMjTHgzc4aqSHS6W6mR?=
 =?us-ascii?Q?xvzhhX4kZIfOBD7cIFioO0CSZqd/dsV308y8inI2hj63QiVSK32NFmA7qDQ7?=
 =?us-ascii?Q?UP+Ac0as2alVD75qIfPYV6Kgc3vDvz0+gVkyaPTu06ElJ0+OGiJEcfxmh8rD?=
 =?us-ascii?Q?9FABZM+RmbD1/V+9zNsoFZQPOTEuTd++kW+mDss0ltazr8U39QgBMwzJZwjW?=
 =?us-ascii?Q?yT0ZAGd80sFeBYOhNl/YQFQCaR/ZtOvvJ5w1iDseTlo1MMULCPB3kKzSRGvW?=
 =?us-ascii?Q?D5fGMRlC9YG8AsCzOjavc0REKOYIw7ny8oOc3+y94/iWxXP41NxLpIeoSwtz?=
 =?us-ascii?Q?gnFlc8l0UMXXce82jY5tFYzWemWABkkuk7xp203UQb2G911K36TjjGZA3zpF?=
 =?us-ascii?Q?NnkrFNclL7QetVdoHg5/4nsHQ2GiCphFnf/nglonWTgHYCLh59YC768unuTP?=
 =?us-ascii?Q?rAAvjLqjuxKOh0y+1EVzOLXjuAxAq4L783KH9jbkmj6Rvlt1z/aim7fmlujb?=
 =?us-ascii?Q?16TLVie2wzJCqFXfstcyy2jXFqGvXnRatOs4VPbO4mWp6/cNDl8Z4+tuCHHb?=
 =?us-ascii?Q?M4KWQ82uQwWQ4meCGNKQ/oqpHqoXwDaypGFa/ANpel7Z7ytz/gYwpFZkoM8/?=
 =?us-ascii?Q?sRKR0IQQnZniqrUFwi9L9hv0/TgW1YcJWNktw6pKhCG5F8frPb+jgwC5K3xa?=
 =?us-ascii?Q?09nkh4gGiCvdonoQxPdx8nAH0MGTcov6gXkCSH2uw/NiULNj63YIJfSohF1v?=
 =?us-ascii?Q?CftWtCCrSFkOZWYoZwN8dx7cOOtywz4pHlnbOqL6EtU+eSbZFJxaIzHExCcC?=
 =?us-ascii?Q?vSJ55j0t4MWSTQCRLouWW0BiWEMGnK5+yoNbtmFUOq/NSD6aY6YwSS23oFV6?=
 =?us-ascii?Q?wAvn70RiAtl0j3io2F995aQPUKc+CPpWxBPx2hyoTj272LWbKz/lIbSqno6d?=
 =?us-ascii?Q?o685yiZ62q0LDi2S7+QiHe2MZSJLvP5kCUCqofTOBrRid7nVy4nWsQZzGTFz?=
 =?us-ascii?Q?Enm6pFcIDJJPB2MrDpiBfYsQ8Bgm0BCjsFReHwwIIyO/IWIfQEPupfsu3RyP?=
 =?us-ascii?Q?k6C8iY/0ZORLJeu6ebqFWev6Xgna6FZsDPGCFKxAfmBllKnoK64NO+7KBb/v?=
 =?us-ascii?Q?rhbYYUjmZcV+MboimcR2I9LfPc8npCyQmNz1xQLwiunbnSj0dbreDiiXb7bs?=
 =?us-ascii?Q?Rr6l8QsonWNe4rQ39Udm72dLWq5CNyDyW8L5E6hCGOOaO/it/XwKOEd3OyXk?=
 =?us-ascii?Q?GVPvqn2lnrHt6bmSlcQwC+lhVEajHj2CPPuhZ3UBx+2qEjLnxWKQXqcD+2Tr?=
 =?us-ascii?Q?ysRNAsQmWO7bfi/H28naJfH0DnUhAPO4EcONFk396kPVrAaAebHtG3QzB/XP?=
 =?us-ascii?Q?396xwR/402tWUGI/eUV5YMRPxl2Qr/7VFTnNqqZQljIE1spffDgjcoFotiKD?=
 =?us-ascii?Q?f4hD4ZS7zLkwi4A8pL0asUHGCQ7JBZl6sjeBFtYih7vW4o3px/vD2xnvOiEa?=
 =?us-ascii?Q?UFDUhgt9kmXGqo3kWmPQfSCmzLv1zt0/c5VAL+m6ZaEzrviUSy3kabTrzhly?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78208671-4f51-4a94-73f0-08dab3bd41c3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:46.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlTH1Nfk76yz10EBSB0lt2lMYl0zIsE/aAjb28D/biJgx26vw2WogggBPhC2HO9gHJG587HEh1Lt/M8+302VyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172049

This series reworks the uboot-sign and kernel-fitimage classes to cut their
intertwining web of dependencies. We do this by signing the kernel image
twice: once for real, and once to embed the keys into U-Boot's dtb. This
cuts two of the dependencies between U-Boot and Linux's recipes, and
moves the deployment and signing of U-Boot back into its own recipe.

I tested this series by running

	oe-selftest -r fitimage.FitImageTests


Sean Anderson (6):
  uboot-sign: Fix using wrong KEY_REQ_ARGS
  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
  kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate
  uboot-sign: Use bitbake variables directly
  uboot-sign: Split off kernel-fitimage variables
  u-boot: Rework signing to remove interdependencies

 meta/classes-recipe/kernel-fitimage.bbclass | 109 +++--
 meta/classes-recipe/kernel.bbclass          |   4 +-
 meta/classes-recipe/uboot-config.bbclass    |   6 +
 meta/classes-recipe/uboot-sign.bbclass      | 462 +++++++++-----------
 meta/lib/oeqa/selftest/cases/fitimage.py    |  29 +-
 meta/recipes-bsp/u-boot/u-boot.inc          |   3 -
 6 files changed, 273 insertions(+), 340 deletions(-)

--=20
2.35.1.1320.gc452695387.dirty



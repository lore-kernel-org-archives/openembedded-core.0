Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEDEC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:33:06 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.49])
 by mx.groups.io with SMTP id smtpd.web10.8879.1648459981999094035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=g4t2KZNy;
 spf=pass (domain: weidmueller.com, ip: 40.107.4.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4FkCIcidLlPfYNMBNlDifrYjqZEA2wvK9fur/xNCgLh0oNwZmlZuqYz7lyXsrEboe3ajPlLgTGa8VKCHex+9zzjjLPNAiiNufX5u9xO2p8mCof7uRn2/PHFXqKy1/AnGoKsTb/1i+6RyCxQnKU8PFo6Kwn4hyIjaVMTAIUCGV5BcqYfpenRgtG07hJBJ5Wfcwmlf/o/kXWIx/9EtJgsPSV17RwPumXwiW1GsOA5v9nd6EV8jimTedWCOphg42ls9vUrhf9YD80EgXl6IgpHtBDPZE8v1D610kmswVHke5qMyio1M2aKX8K7j9DXVYknBNTpvsxX9S8GjrALPMf+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zUmnb720hMT3J/cOed8XL2aMFdiHfGDmXRRwT6SCMM=;
 b=bgidp+3TzoVLEw8Rb5TIlGRduotIPE+GfJUiNYzWQlB3VyL8xWaleOdlFznhK6d3oeByMsHHDDkTA/uLQNbxOkJdGdA/X90hR6MnziLfys5rs9oB/T0cq5a2+TlJ8tYiqWovpsi0kgkNr3xkXB2hx1aCSk/D/kjPk8HH7JOymq/FpZEAdnNAkJ4A+F+QtuMkYPb+3X6rCoeuXGYvMs+xX3/ES3Rexno98jD+2BfNSDnJbkOvxMdO+S2hLFnTR7wQuw+SVDmf22D1KsAE/mOxUa+25FGYlQkIjus5Xt2yISPRTn3i9z0O7qMuuWqz6YqqgEzL47pglKFx2UB2XAGrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zUmnb720hMT3J/cOed8XL2aMFdiHfGDmXRRwT6SCMM=;
 b=g4t2KZNyXfg6HIJZHfIqmrUK2Z1eGQOY4kygr3/AiJFG2dyKwwZWZZgHUSve3TeTV8QtS2vnsFoWnao0KdokL79UHvWnm4iBTCz4i69hFNUX/jzWg5zm17WtlZO42kpWVRIvJzYxkC+YnUE189+gMCwAYxkRsDOzfqpCImrT+6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB4177.eurprd08.prod.outlook.com (2603:10a6:208:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 09:32:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:32:58 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3] zstd: add libzstd package
Date: Mon, 28 Mar 2022 11:32:39 +0200
Message-ID: 
 <20220328093239.10264-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::22) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80ae14c-7629-42bf-2d8c-08da109df1e3
X-MS-TrafficTypeDiagnostic: AM0PR08MB4177:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB41778C413B1FB56C947352FBD71D9@AM0PR08MB4177.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FvFOa4CNHZBeMVDpXpj222tGmSlRmDV8rQ/FCweTbqanAAU/mjPKkkjd9G7R7FeU7yzmlcSKb82Cqgiep9P8Iyx+0kzqhgUfHBXkFfriN4I+ZBKv1RxMWLy8TzIH0v/AV88215OBDOFNDlofMOXMawn0IB2PMlIlYxeKewn+U93V85BXkb7qz/PPITexryyOe1vbouRxVnBfTyk7fYSlw3loIlXfiWiubOUw0RBYRyW8ZPudZ/KVZNC+WRlStVkVRvpQzvXNQPBkWb/lFavxzomFAX1qEmOeZ/h6Jwfx8Km/zWFHXu4cX9gMX2HEqaazsXM9mNWJTlyObHuUca9h1IcIggabWlCODSpDVXq61Z7y6zwFHi0tmlhLUue9llVFacIw6t+go9SbDxg+ahDnqfvvXjLP/0mb1q1OupWjoNcwH/wnPpN4wKC0F0OblLe7IclFxKjVpCT5XSHnHpPT0wPR2inHnHwn47TTBEavL94czNiPok7+MlCtEA+uft6feRYPaXoyKnBwhtgUAdkwVU6LwSz8Qx2Qgn/qMXVCl0f76m+5WTwclmgd1Br2c+tfkNWbaITZiPlHe7TtlOe8eZI/b9Sbj4SgCFLHnO1EQFzHV8yl0g4zTm51bDhu3j/CQpbjAYLj9p2lKwk34FJ5L5EJcSKhaANLUyWrbeT7oX9v/NC+qemBSYaD7ozW7l4Ry8xaoTEUhj6OePkBBGQ19g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66556008)(2616005)(2906002)(6506007)(6486002)(508600001)(36756003)(66476007)(66946007)(6666004)(38350700002)(38100700002)(6512007)(52116002)(8936002)(186003)(316002)(26005)(5660300002)(86362001)(1076003)(6916009)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X+XjdomCU1ExYg5YevksvdF7Wa6zeornODkTjuTOuVqf4zX19SnWVv5h8bcW?=
 =?us-ascii?Q?6khMsPJPk23ueyTIQviy8v612XnwT8HQH3ZgYEpun2vKW1mvKAXfgvvmMX2J?=
 =?us-ascii?Q?Ti5YXPTfOpONDOraf8MjG+YjIy8K67/t5e858WPlBm6nAC83aDASYAsrvOKc?=
 =?us-ascii?Q?+WqAt/+H+E9b4yePR2Fna3CbT4GKO/bThbBu9tL2vsVwFLSgVs8Dxzv5XrLR?=
 =?us-ascii?Q?IiUoBTzlP34gG7enfHAycM1BWd7GM3eAY+tBhrokLdmFwG8msNdeZ0ounx0w?=
 =?us-ascii?Q?shU59LlaTIMWSW5N0LPvXukZr+Hc4VRQJ8EQaZ5nXmA5R5wBjTmifXdR0xeN?=
 =?us-ascii?Q?xVpNj1QhYJjoGNUKEPUEzMXsDP9DNNAsAtRqEGr/gznYqVu68hjwXXE7MpIs?=
 =?us-ascii?Q?hpPvgPYy22666RSbZFxGIG79k/ybMUnqtY1But/xyvzT0y+u6VqxE97dR4S1?=
 =?us-ascii?Q?vKmIkbCt8+9dM10VcbdhOqW/AI0qwycSpMdPlqstRtQO+u/0pR5LDFlX22+S?=
 =?us-ascii?Q?1PxYNUvEF4/TwH/SRqxPRonHk/EecRlM6jQ86Rl017SqbRZV6Zw6FJKDK9FF?=
 =?us-ascii?Q?5dTu8GLO5TsibAY9n8kKWZdEC+VYRoecVSE2z0iipZCvL0/0rmCypFBcLv4c?=
 =?us-ascii?Q?UjyLFpa345Ymq9wXf/YtNzSuDdP0I1ztUJ39AsJYTFQWpuUgC8VIoSh2KZ8b?=
 =?us-ascii?Q?WCJd9Yuq4+FGwJ5Wy7XJcVb40e4FQUxW3syloynPnlViiyZ02NhKWHSYtnvZ?=
 =?us-ascii?Q?7MC8G5rCg+GraQus0YcKEKTnVEbsCbhY+vrzj5ce8/MwDt1l96iw10aG4dGD?=
 =?us-ascii?Q?3qyGPNGjcXXDGyj0uJEg0CDHUmokkSClHHqy7kabXr0G+jADMbPU7IPT+5yY?=
 =?us-ascii?Q?c8hXdCr/z4JFJej2jNlVdFD9+4DaYE/K706T/idwq9ce8g11Iv02oignJ1yu?=
 =?us-ascii?Q?n3fd/1mZkZw71tTaj2tQPUH7f+wgQN2LAGEb493jr/EGrJrrzP2Uw46VpRQz?=
 =?us-ascii?Q?6FVuFrqtmBbdeUh9SNzcaqygkex5mvWNAHgorRV1ftcmwLII+ZZJzJEJ5ERa?=
 =?us-ascii?Q?N0OCkkNSHarPkzjADivkuCN7TCgG8uilTC/ih5AIv7jkdlI2U/7mCZEE81ex?=
 =?us-ascii?Q?z1kaRhAdBEOOv+VcQB6ZtCGjZmYzf0w01gBkKrp/ospwyV0trntZu5eqVYZ7?=
 =?us-ascii?Q?Q3bcbNEa4afI/XFKKoyJ72t5ORGVc0ssketr60lMKKly5hAA1eTZ6mVMKvca?=
 =?us-ascii?Q?NI/TOjrl6xe8AlikAl+L2IMLaWzjCnqB4WemIvjNsUzGEa771OgDSFRSUUCP?=
 =?us-ascii?Q?BG6b/t34z+X9vOGuWkfnYgFZ0PUuWwNLZ9L3gcO+twXAye9t63Ulz9koGs3v?=
 =?us-ascii?Q?g1E3EiqTuLuy89O0eNiaiFInJULomwrsEY6XAPo3o4hdmBaZXcnfn/UYWbBD?=
 =?us-ascii?Q?oEvUWVgVn2ckzWDUkmjb1N0lZ+FSxsCY6Yebo5Fa9gm/LP9uDD2gTNcMniOV?=
 =?us-ascii?Q?duzRyklJohjqI7YzCw8D++7+Q018efQQGP3rwjJOnnMb+EtzFKRuc9AifWl1?=
 =?us-ascii?Q?zM3WmuTv8aAruV1R/lNdixzUOJFjuDQiQVA60hIO/EYe3XUnP3EnysiUhqB/?=
 =?us-ascii?Q?2/hNkbcpE7k9tcyJLoICWUclVYWwnuPUt1A56gqZQp2nN26yoF4yXfPsrqfj?=
 =?us-ascii?Q?3dHGkUIrnyenpILRn/ISp2iff1f06eZmfGxTkRMp1K8MvoOTt/pn07shy9sf?=
 =?us-ascii?Q?l65JvIl45SM2rUbQDlY+f8a8FnUlVRQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b80ae14c-7629-42bf-2d8c-08da109df1e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 09:32:58.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 72DAgZ0fduk8Yqx4pALYOqhI8M7CnJdPviMYDmO6LGBz8DonIudK4bluPfBEdb7Ntu98ETPKXU7GohJ9HDiHEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:33:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163689

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a libzstd package to remove libstdc++ runtime dependency from
library users and reduce the dependencies and size of the library
package.

Add a lib package instead of a bin package to use a similar name as
other buildtools and be backward compatible.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v3:
- Add libzstd package instead of zstd-bin package

Changes in v2:
- Add zstd-bin package instead of libzstd package

 meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.2.bb
index 0ddff469b8..3887f31ecf 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -36,4 +36,8 @@ do_install () {
     oe_runmake install 'DESTDIR=3D${D}' PREFIX=3D${prefix} -C contrib/pzst=
d
 }
=20
+PACKAGE_BEFORE_PN =3D "libzstd"
+
+FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.30.2



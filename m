Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F8CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=XsvFqHh1;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTyZIkFVUMKb+vUmsYWnhHFWWO1iA2yA1PCmGykjBhGeBR/XE+rb0wctYtkpMwTavncHJrZnbWuTyrXDlmpNdpNH7P4VTNf9I4Zg8/eep3/9jJpF3oWIdELwjqnonoaKXVYAVGNSbQQmMyV8Ivgj91A93YP8EiV8e+IHhAJWgnSU640izZ/kQeY7cJdB/r82jAmJ1YWqhjTTyKb5hj020L4cJokrVRUkfk4Nsuvqv9i32Xl9UfCfj45BFOxY9dmh/lSo1Og4Ucf0Ob9tJEsPDM2AuV+DfhXF8IjdHD6Bd6XphxodQgMnZsuQoV7t75H/6AD29/2hyWDCgX+gwgtKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=F7xNmXOj8Zj/EIeEXGzd6Arx//bkqPlMv2G4rZp0USnLXVXZslxOTm2XT3188w8nXf5i6NeDpsXxHf2L5+1ScabZNSJfSssgT3jRFdEJkvuqZimSZpSiwoIjI80x1H9ljFNTeLovbQhsasnnxgG4A4BwkDPY0tOlwSRxLPJl9BSevsn+70v0LSC3WSQ5+AI4b8V7HNRC2y/64I49E6v9x/HIR7dYCU+hfBLy7WZ6X5OU0INKOAD+Rw2IppO5J0MaIFiiiYLlkBhVFKQGDGnrfRfCqvrNfB3IhqgB6APsTjxjG4HQHobKG9khgj9oWf7QJltPfmNjDYyyy+OUddD5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=XsvFqHh1He4cW14/aseBLawGdb1rei4/HhR5W8bnqEf2L70hCcJKW6xszGwK3JoYRmpZz8Ph/sBWHEr5Gf530sZiZEwPYKd5729EwCM/sn38qE63rxg+TqiKiFQ13hCwls3LtHwNeafj2mgYQqg0ob5/X3liHqakyx90HTm4PBmS6VoA5Vh9MuJ5sZ7PTmKW1Hi/Fw0yv2ufA7wEJpsKhARwTAd8yFQ1Pb5eyBEaKRF0e2ooczRnAFFZwRKvNn+46n3P4SZYkE2WQz3B0UFad5M5Wag6G7u9P3nVnHVZQM3nzlD/htOZi/8L+XC7bCQrLwzzGCn77wufXkPMyKar0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:32 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:32 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 16:57:39 +0200
Message-ID: <20231015145749.69995-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ebcd94-a84f-4d9b-4b09-08dbcd8f32d6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rNAEB8amstP2CKRQ44AbWINreGX5YL4qW8LG1SuDNM92ff0+oMQtO6dm8lTTR71RtsAtZEtVDC0TIJ3ExFQMleXRUJCLY2ipc8IlSqvt8aW6ak7YVNuXbQlxWgnDa2ofV3cFDnmywyw73KPwI7uha2IEMuUVBg/0CChzsD1p+9pd5aobiichT1h9eNyYDWflRBTrZvVJxmcgG6simhYqQUwr4uxpSw/9AbV2eNQRUXa4sm6eV0/VukyDtTRW17r4t3Qrll3EmRxTHDmulQkWNgamVmtrsnGVTlwJ/ApSB97xqzwO6DPTw/Mjih5G2p6ZGwMAZ1G6WbRxnlisMNK+6XFpYDQha7tHiAgGsFBTEj4tDAD8TM7/Kc+sgypJNPWL7G6Nua5jOCWvhBgcTzqjhcxlCmcjOnCNIbDNziD3DMDddjf536XOxgKQ2OFWm7FImtmMKXrC9EH3JzXsJWEcNq+Xht9PjoUGS9OvFnjALyrr0mhmHqEgUWRAnHf2qiqIWSNBYEVJ3d9T6TpJOYXgBG6b8965+QXmEtpSDhAvgnYarUpnTtr3InLLLizIhxPMHKhZgsia87yQE/oDcQAtYr8ZZdJPxbKMVtuHepbwjGY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XCZy4bnC9cerC89G1hDrEDxArd9raGhaZRxw9O9NyikVBznqTa4wtOu/+Qin?=
 =?us-ascii?Q?JK3clDrS2hjp678rBG0ZfuYV5mupmXGZGWcY5fhRC1VQYOOnvtg1CPepkOOK?=
 =?us-ascii?Q?HmMToZiBU1cU5mI+PEJT/I6m8R3GZlPnrfNXKSAvCxPA8GlLx4NlumTYbfSg?=
 =?us-ascii?Q?vALpupfVu/Eq8R22ST8NC+tnm+scdyAhFSnsof7//I8L/ADDAc04Vkh+yxhR?=
 =?us-ascii?Q?w6KIxEp4oOOieoCjcXonXWZyiYEBMlzvGP/p9oduMZnXuBSFP0rYz8BfJhVG?=
 =?us-ascii?Q?H8LVELoU2vqiNtnA5YbtU9pOmx9yofQXdnxQfFBUKklYcUzg6fq+iWDTBdYT?=
 =?us-ascii?Q?IPgTNG/IObO0pjnEGmQexVufy3gOwp5EhdnW0m8fn1v2vv47o9avQg3xBo+N?=
 =?us-ascii?Q?OGXJ6Lrw/NXjig0Ho+S6+5EwNipVZi6cNWJ/JDzQSKWyIETw1r4yW6tD2ntX?=
 =?us-ascii?Q?O5RAvsn4O1jSc9jrXdHp5vJd71nHi4zsrw/sMjIf7w8Yf1yxU1TQQkBQMf3S?=
 =?us-ascii?Q?lg5v/E3vnyBB+Lee1j1ftw4lN3g1tpe5AAqF3zH/dyMhFSdOFje/L5mP3r9O?=
 =?us-ascii?Q?A5tuefB/MbxEZa+fIuoyu+jtasAKvasGbxXl7q8RAfYWDSpxMIqUDTiu2Zk3?=
 =?us-ascii?Q?CnUJtBiooPC3+0ky75gNShaOmpAq7gIAgvyb1rVshhq4qlY1OY0DYQEhDdxt?=
 =?us-ascii?Q?S85HqDXWOOTxaBdwOF6Fl6nLgYo5MhKcamj4Cs5fkmy0C9KOgntNFA9RbQEX?=
 =?us-ascii?Q?DqZ+ksyCLB0TlDSsYBQOJneiotFcJYffOAgJMnxc11eJLcNvANmS6SYsXmqW?=
 =?us-ascii?Q?ptXy6INK03TznXjUBSPp/OBIN9FzunAfeKKJowyFNcj+2ShtP+wuExJ/KKNb?=
 =?us-ascii?Q?LsNRt98Ocyjk1TJTiAYsb0O3Vd1widAsJ2s6SNxoF33I2Vz5fAdFtfI4OXUC?=
 =?us-ascii?Q?jK8NWhxQRFiznlJygW+6em44w+oyGj84vP/B9SotZ7Z+l/l9mbuWhJYLa4Ta?=
 =?us-ascii?Q?tZy6bjnGPLHO3HAEa8Zswf6+XVypGbl8RB+wTPvXV2uElKgrzKnnF0N1zrJ8?=
 =?us-ascii?Q?bMBWTFaNSnR0FwlAplz+qqWBhS0zlbP/xy3KHkBLsd4D2RTch6m6OIGTLosM?=
 =?us-ascii?Q?QPJ7xwCxFe2rLn0heD+npl5B8K17Asbfinwjk0KzCC50XHgPVYEwAT4dK1Yl?=
 =?us-ascii?Q?ihXpcj7axw8wC1UYtbwLaiPLJ2WI7Z6+Fa5/USoAV4K/Faud2ar+lvdUTcH0?=
 =?us-ascii?Q?cdhJEzfoCQhmvl8Du+iaLqcsHzN3yCH5M1N38L7K0mDNd7wuZ1cNnWOid76d?=
 =?us-ascii?Q?lpTagh5dAjRcrhTJ4b0WGm+DvqfsPEmYpGocFpRAIi48Xs73aRwFqAd/9ouQ?=
 =?us-ascii?Q?UumATeXZhwq4bRuNMcXaklqkHnOWxkskw+d/cI+JSgQfA8B3zD/vGbqy82Y7?=
 =?us-ascii?Q?hoaW6aBc2ErmjrIBmqjbgtoW2HWJD1E3u1YMoc2VxctAcruJKDwBgwheplXU?=
 =?us-ascii?Q?yAXijqYMejdh8LJYq3cptnBGjVVtRkBsEJtto4vzfw4yJYZcoEnkC+O3Gw2V?=
 =?us-ascii?Q?q6UMrwrDfXZ1AJzrNQUmp5us6ay17wMQCdN6B2UW?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ebcd94-a84f-4d9b-4b09-08dbcd8f32d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:32.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV3X3BuJkvaiMzjkvvrxIR3soP9QscZXLtWlpmhNSISSR/yeznc6EUNdmM5oHnrr3/n+sl4xTjzy2L1cQTEt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189146

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

perform_packagecopy function and opkg-build script, will use
the tar provided by tar recipe, which is already in proper
version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 7787042e21..580884cd83 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_val=
ues(d, 'PACKAGE_ARCHS')}"
=20
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
-PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
-
+# minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and extracting files with xattrs that are read-only; this needs to work =
only if acl or xattr are turned on
+PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native ${@bb.utils.contains=
_any('DISTRO_FEATURES', 'acl xattr', 'tar-replacement-native', '', d)}"
+# perform_packagecopy and opkg-build require tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xat=
tr', 'tar-native', '', d)}"
=20
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need =
to
--=20
2.42.0



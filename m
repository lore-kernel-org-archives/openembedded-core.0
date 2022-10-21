Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18495FA3740
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=bl11tSBd;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap7LYrYI6L7nebCG+ReKOABcq4Uo4mjZp+zTbkz87AGcZQPALfEeKlHSAE9S/lat5NW+JzzLJljs+bUo9+4KFdXmlgcDQx0JGznjeCT5sb7B7+dNkMJwjFl5Zh316FnPdhr+MxFsTPTd1AJDHZ3YHcvsXzaoAAAYHTczTq0oYK71pJ1ORKIigM/ySLvvfjwebhYSTJX/cRouRLMPx5W02K4s+XR/7NulvdjIO3Jo7qf7FCdY4/48jpiMd2p25yB5hV2VZGzV//xg9qcpgiGXx+UTm2yOgwIKHFicUaNxxrRuweV/TPaKV2odvJLUeLb0LVLaPI9DnKXhx6JRqML4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gcqsj1wqJyRKynoCcF2DSLRp2EO9voBQoHJ0AHMD1ho=;
 b=Nnw3vcgh6yjRmTi0jp7Rjv1ZH2Lkp/jr0b5Vu4eM1z1nh6uLemDE04tTkZs6o6vg6vSDRojWQ3sdi8FAfP8MerrV17cQePNLumQSWZPRXi1Ky22fT4d5Aoo/dQccBZtacfAUFqckH+kfMMP7QKMrq87TP9MoxUaqvYVh2824Qy0pOdHMwKfoU8NwzcCcdS2YS9w2yZSvNoiiPl5RcTU4G0AXEvFh857OATWGj/FB/IdYcuBdAepYhR1x9snYu/fhvjdCbVltE4sltbKX1N9zNrRRmSD5yehtjsxD1gg0jV/BplVPAXUN8Svf6fqTeYvtu3uacKRqS5VRwzsgpgjNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gcqsj1wqJyRKynoCcF2DSLRp2EO9voBQoHJ0AHMD1ho=;
 b=bl11tSBd8xfp6r254uWjm1KuCmG3vh45X5snIJUqiwT2YUw3aWRHMSsW74SdQkodc4shslA9aGlSbXw6XzA5KbRL+Q6YcdByJnHcaVUNB+B2zQ0kfYfvFJqMjN0GnuFfuvDbkckiyX832rU8uzkBKzwGtQx1JV7IRzmo2C3b/5kYOg435qhSkRs6J9I5GOsix4pTUkNXTKWWxcpyPKOSC7cMbKPqQq+588C8HlPW/RTUkaAoi+eyYCLxEBF3rpyebgWXRzmaJLmErfQQUfXKA3IJAV2+YwWByOUnd4uSPWfXS7LILhiXfsFIfzNGiSGTPIGI/dWvDoQMaR2cB3T7bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:48 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:48 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 2/6] kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
Date: Fri, 21 Oct 2022 19:37:22 -0400
Message-ID: <20221021233726.1751124-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221021233726.1751124-1-sean.anderson@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa8ca51-427a-46fa-1f27-08dab3bd435b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gf0iqAR7t1LVAmUDvfocx9tSpjmBD3taOmV8l5bkJbX/24iZO2DhddX5p+RRzpsm5mmNCwHPvVrltlLnrl83wSlZ6TdYaehfXtnOVdB2/tUf9wgU5lRWrJWW1dF5VcmzKhr9J+5a5URIEcT//X74n0lXZKMWsrARcZOy8DuZX66HeDkHWTiB9tb94FvyDS6BeS3HF7dg4TWQxjCkkbCrEW0dUxmFDkcTqGnF5ZLYY+pxvzEAmYf4bLJMzpPm8ukTZAxl4QNP2dxOB0NSp6pC0ANFAWz0CQtUF9toPIoQ5PPs0uYnvt9sBfy9LO4DsrTox0/Ryv8bWLiTjuNmO3yR2an2AbStoWWqKy/Jv/BOB3Upyz9P7k0PuK2N2bl1msrox62gUTM8ISwpQm5XcslXju4m2OM2Cxmpd8GAMwD9Xgnh3DBxV9MV0IFCYddR8DpwfhSl6fqkdHQsj5HdRYZEOK6sLQWquwdNe2V6/RpJzDizJpqKnrevtznE0QkBnkmG4tO/zd3vcbxPioj1aU6fGIYLRlwOBAa+JruVoSP54Aljdweuv78tIJR/DZgeP0JbhypueXEkTJlNx1DFSVAwjfxTO+UK8gDtxhqtomttgCN2MDjuHWukk4Iq9DkyDmNk/li5Qc5CvKBWIG4WTLQFk+vnhFPFdL3WOILCSK4FIOYt9uBlVV2Cg6s27WlmexkysdwLbjtYbmX+VmtUDlkJfAtGH7SYJ3eHpBDNeZyjIO6sC4vDC25KCAqBA447lY17tQsQc2YGrKDVWOMoH47dPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(4744005)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9i1jfgjdNhiQ+WNhcCfnhCtfeujvtoNmfjB05cIlzuDAAr8gf1ts1k6hKcFX?=
 =?us-ascii?Q?aVyZZGF6THb3+hgz+otSgRco2Uwi71jF0BuK8XKFSga/yhLx6pZbZ9SVWhcF?=
 =?us-ascii?Q?DcIDd6lldysgUDzozm11AZXz1eXa0l3png+XTKtsn7wKdhsDO+cIUmBoQUGK?=
 =?us-ascii?Q?n7t87lE0kehBprhnx3tg6Q/lPp47FBA2U8DyYaz5Gj1W5ZjYGMHFoN7ca7u5?=
 =?us-ascii?Q?RUrNsRzccM87axlw9/TW20ryxS/7vRjJ0f7NRWZCe/7XsMxsGwpx9TBUGIJh?=
 =?us-ascii?Q?CBP8Pcw3J7eSlUzUuj1YQ7/LiQ8SMGQ3jVdo36aA4jzbzboBoFaqtL5ZUY09?=
 =?us-ascii?Q?mpJWYdvjG4lrjNVUaTVYeza+Go7P29f5uZVq7kCggcp8m3zCGJbY553mrlXZ?=
 =?us-ascii?Q?uoUBNUW4bWXTK/VO23xran7UYIXCASUO1JNbukjpgbJr+PXh0dI6PAXgsMx2?=
 =?us-ascii?Q?X8D8Z6mP35kZijTcVhOznAgf5GBO+tQLSl14WaDSMaHOPaYPINYOAbWU2aj4?=
 =?us-ascii?Q?oA5P/oBi8oCcgJ1mcrp0cAhIWxJsi0QqrSLnngLDeJDo4/7htwxAfXbudUhi?=
 =?us-ascii?Q?KT3mTX5aO0qgOj8lqE6cbHujnoqjR5dKwUgbhu0GWcd+EOc7ZYsHkqIUjKDm?=
 =?us-ascii?Q?o1BHR65BIbcZ3d5/TXN7HpdxidPCgXPROC30K304JgA0Rjo7khu4cPb3S+mi?=
 =?us-ascii?Q?EshH6QMZrvqwg9UuoBLlZu+hufKm+dNmoupjtWLaAvdrQCigPK0P53o7BLbF?=
 =?us-ascii?Q?WgjE4ZX/+e4YyIBzhZ+EwKaGr+t0E9oLBvfDKVxVThCo+hXm71Gn5TcZ9QPt?=
 =?us-ascii?Q?6a3DIkg395MGAx8xrbiUXurGAvmJDc5Az5apZpmvm9CGK+9whVijQeLdpgY4?=
 =?us-ascii?Q?hsfPCddzXrOkp7npuU4fbRLxxVyUSM7t8oE066l3tm8oy2xMOJK2HXXQREcE?=
 =?us-ascii?Q?5dLXI7LS61EVKk3uHaxYRDj6h5xoXujNz8QXpKucLT9JXvWyAyQNGXWSrWem?=
 =?us-ascii?Q?P6xjNct3S/q/IIVVk0h/e43r1H89SFxFPlKkvdFvhlQV1K7JaDrldRIxRXT/?=
 =?us-ascii?Q?i5hgSAq2CV03AkPyRiqfRFp0Zywj2Iz+ER02yXyD9xDmeAceUFCag6cQcaIa?=
 =?us-ascii?Q?LmnBVqb2w6DYcOEitRtKRIp6IzwD0s1g+mdsEa6lcKsmuqz4DuQ0Pke8Auwj?=
 =?us-ascii?Q?WQ5AsAawz+RdVG/QJtYVMBFr+tnWCzcmFtHwHPMOQIv71CDtyG+7Zfhf+6ZK?=
 =?us-ascii?Q?egUAOtX7Bz37vPjhtIu5vBBeYM3iXYh7wJvb/tzjPa5499dOwIiZyaBkDK+e?=
 =?us-ascii?Q?glGpoO3wRCAXrqW1gEGXv/KW9WOZInARQbIBwI9BPVKIt7Mai40r0hV20bkM?=
 =?us-ascii?Q?Ohm7XfVK43cQwE2sRy4f58PtBX0HT2IDIZNWom+f73NKp9GRiLedrDuUObTO?=
 =?us-ascii?Q?0+NdX940HtnGCC15cpF/T0E6WG5H0bqQzz/MhTMiCIWPzbm6SPsPhx1WxEYx?=
 =?us-ascii?Q?RvVn9MnpgGrMxaxW/ICZVya2TihIHm86u7NXwcXq2hR9QUe19cXKpMEnEawa?=
 =?us-ascii?Q?LhKkSgx5jr0j+iwKnqWyIWDr3b7MnspQ6orym/54NySIviYip1a7xzWKQIkv?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa8ca51-427a-46fa-1f27-08dab3bd435b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:48.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4azwd3fnzXReYucA4scFlVmfbmBzjRW8FkMc6kvpb/6uyz9eJQ101YmymSVsF8tXcV6WlxlU9YpQtIdswBE3ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172051

Replacing sysroot_stage_all by a no-op recipe makes it difficult for
bbappends to stage files intentionally. Instead, just clear
SYSROOT_DIRS, allowing other bbappends to easily add new directories.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/kernel.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index e4e69e0763..7bb3449223 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -594,9 +594,7 @@ do_shared_workdir () {
 }
=20
 # We don't need to stage anything, not the modules/firmware since those wo=
uld clash with linux-firmware
-sysroot_stage_all () {
-	:
-}
+SYSROOT_DIRS =3D ""
=20
 KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} olddefconfig =
|| oe_runmake -C ${S} O=3D${B} oldnoconfig"
=20
--=20
2.35.1.1320.gc452695387.dirty



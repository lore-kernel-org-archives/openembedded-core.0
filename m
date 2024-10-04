Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDCDCFA75A
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:17:03 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.133])
 by mx.groups.io with SMTP id smtpd.web11.18868.1728037013487378136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 03:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=Zo79xreq;
 spf=pass (domain: spinetix.com, ip: 40.107.167.133, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5wnqBIS21HfXn/3Wvs6yrP7eDyn+/qoKp8UmZ9I2LG9dj3SZ+UQkJd/3oHr35qBfIgANqy87tr2nTULvJJ6RZ31tyXjt/yaFPl3fteVjSQDUNOYuJ4MgnurAuzf70z+lzZGFt8kVpfUQQ0XoaAaqZ72BJx1CCvg2UyVmducRecvcGKngWdwzw94Tyvp24sNp2ja5hp/6dnLhfgh7udJMJfkZHS7YRVQcPhcwsZ+m61Kyix7dmLOJGBs91ns4L9qfkkVpiOZQreQGtoUsTb7budSLRRYRicgJZDqccv6rpET/dbKP0N9MKvMVNwAlHxIudJ/LSfaHh44z+cti7uAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgZLKaAMs5j3gQJtUV4GyB9VQmAuAaKfeNkvZuhi1sU=;
 b=ASg7laFeTu0ORj3tPjBR2R46K2XIlVP1OL7c/kWsHw1wQEuBHaatmYuh2Fv3YC2HmEWfIO2LYKVYaOIRlNFhhWjnd0lZguIin60kUzzz9egVGWUWNOZeJbzr3ZqM0VnLoJBWbFu9AgFuyYvjJQoUo9pQzF1A5wlxKZ+d45qUNIaLy4B+E98U6ag9grR6cb78MNT3RcThVyY9SsA54orkeQje8dAkJS98mYO060toJ2yzpkexLWkRYr5EiLTlZMNrvj9ES/5WYUrj1pnilLfXQHp6joJ/gTbeSCB+ls471ondfXnmn9ddZGK1Ap2F7ORRjAPhENT+ivldWZW1AezxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgZLKaAMs5j3gQJtUV4GyB9VQmAuAaKfeNkvZuhi1sU=;
 b=Zo79xreqQMyQ3yP7OFVTjsVAB6fFgwENxV/y/AazNKpIDhVPoNwNqQJ6/rY8w4LQVvcDeefLE741tYGXc9PZHbe+Ea/FgLgetAuwJw5q2Z0nmuUGL51YgxhN8WFdwubDgaS5BsSoAG/KmkwXuGaKfL5vn9Rp0n+jJn7v/ejQm3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::13)
 by GV0P278MB1105.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 10:16:50 +0000
Received: from GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30]) by GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b32f:8f10:6660:4c30%2]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 10:16:49 +0000
From: Diego Santa Cruz <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
CC: Diego Santa Cruz <diego.santacruz@spinetix.com>
Subject: [PATCH] pseudo: add man user and group to fallback
Date: Fri,  4 Oct 2024 12:16:45 +0200
Message-ID: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:33::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0241:EE_|GV0P278MB1105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eacd1cf-ba9e-419d-fca3-08dce45da8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sbksFCM0zVwr27YgwG/cq0FlK7hxLHwhC6YAYr3L8XbX84mM7YzXbJAQyEpG?=
 =?us-ascii?Q?FUAbCsMgxQM71MEyd3rbw0tkOalH2rMBNmCmHlgfNwjHI6OG7wgeUMTQL+8x?=
 =?us-ascii?Q?E1GHIP5PatzI0N+bDurc8o30yCBK8Ku72Ipi7Bg3cY9wyB2GcBfwmkcpNZVy?=
 =?us-ascii?Q?8KApPfGkTdOsQravEX2qAvJHTTcH8Cnc2+qdXFejR6VTQnPiA76g6geZnSkJ?=
 =?us-ascii?Q?V6RIxTBKF0M5opLuAQiko8AQBrNOHyQCuD/q6pDnH/evODXcC8BnwMZLz30V?=
 =?us-ascii?Q?Lso5Vn2PPh2cs1J2c/kg8wLH3sdf20SdSM4fENEtnraMoZoZ7SzqZqUPmfCg?=
 =?us-ascii?Q?rFIliQu2+2AnOQMyXVkMa6o07yzZyyCEGAPvUCik0J3LJNZLp3xyihMwuChS?=
 =?us-ascii?Q?AX6X/QZL9QJy1DQa33Y4LPpvXM1c+mZWvcfJmgcGUfyhjioI6r6+l6f1W7CS?=
 =?us-ascii?Q?J/niSOl0jw14YkQlJDPRRE1rhz2U7AyvIKf7GCn1nDX7cK2cVjMxe+98Re7/?=
 =?us-ascii?Q?JoRtBOBE9m0orUP4jVNBIZQXmNfFPPjb6K5Nx1Bb7MgHkiUZvBGJFQAznP1E?=
 =?us-ascii?Q?Q0ahya9dyVjv5T+FHl4e5ZgYi6awnJ3XEVwZGG5R4W59z2qr7oOH8UnjPA7I?=
 =?us-ascii?Q?1zA7Fz6+SSqmO5/IHBfmTVgPRBWc5heEnsVdH9HkwiNoAVvyDDdwsJncvCpL?=
 =?us-ascii?Q?+4qSccOgSLQp9cZp1bLMX826RFIJigE3Y/tr/keuspZHR81+Fc48886XDirl?=
 =?us-ascii?Q?nLVIqQftvbnub5f7/OjqdxQqet+TY/qVjirWS68Z0MGq9tmMmZ55U49jWiX/?=
 =?us-ascii?Q?NxLW8RSbCxMiL6mRAJZ0CkI/v/YBGc2IRhmKI0VM+3Bg2jceHezut8NB30Zp?=
 =?us-ascii?Q?SC4CV3IbBhpXzIC7zWwfdgfLwk/psFnaa64xU6hhkCFRHJKiL7MVq/wI2Rtj?=
 =?us-ascii?Q?AYqOVtqagCWczGubMBxT+fikVCEkhKdZeOuOrRO7hp9ORKZJZvk9Wmaf0UJX?=
 =?us-ascii?Q?kEyz2TfSfpT3ztLz+IGMTPxJkTYUVVi0JIdnjOSEcldWp/hDv88MMy0lES4a?=
 =?us-ascii?Q?B4tIbzezPhIsuzLfcQDwFG0PLIiOLXAkgpXz4yptjyXDB6TqXVKy+dY8Q0qB?=
 =?us-ascii?Q?kQLDNyGdTcx58SynAl1oNPL1oAn9TqMS0HqgwJ5AAVYgZ8n3uE1iUckRDj6L?=
 =?us-ascii?Q?OmlnpQ0VQnWu7QHiymiE1zS5uQBJqAitRPu3S/MbscsVK3c2Tg89jH3EWnC4?=
 =?us-ascii?Q?vdFCxIISceqMtJHadygZhbblfvyhRM/682Msrgn7t9oKqo0/upQABavwFq4g?=
 =?us-ascii?Q?2Q/Bg68abCp3DmjUntZxowGSBucTa1zuWS5bJeyy+SsKmw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RddQDUiVEe6TJeyWAQYR/HhqhY9KijuhCONNEg47jAMSwJcwsqpy8p4Rywxl?=
 =?us-ascii?Q?dObllrywRrIf0uyRkPLbHLhL8Z/RadDLLED2njpp4ajBq6SqjJwNS2h8Lwsw?=
 =?us-ascii?Q?m7sAZJvlMfIcKGQlsJDqWCBiDJxtCF+E3/GrvhXC8hsqqsbSDm/CGuNI5wtb?=
 =?us-ascii?Q?aLphPFXV3+tjUsGUUaNP+6gQsStvylyYeMV0sKcDR7tvLFqez5knu8r8OzBl?=
 =?us-ascii?Q?kgpJhOTlg5Vf1YXHN/6BugCf32MqS/GwHXndEplHFHfvtLWsCCeFrbbEoH7/?=
 =?us-ascii?Q?tt+PHUhuMZkcE+17jXBplHvtsmWiYIhwF98QxwYCuz2/f4sxjtcVtOuglcga?=
 =?us-ascii?Q?nwIKQQ3MrYEcakNl21p2CuNyJ8tKrg1dH9b6YTyaNQVvGILiNcxcjgOBF7f+?=
 =?us-ascii?Q?XfllGFR5lPE4fpmXe8x85kC5/uM1zGc+jQS0pHoUEexy6IZHZAUP+UzElaeI?=
 =?us-ascii?Q?cn8uWCqAfidBKuQByyfj3PRw5d/PAl27Y2D9p0WC6oZeTvvXHN+nnltMjB+K?=
 =?us-ascii?Q?1j6lixpGr2CYky7mwoWFAdhrn/yomraL8LAEsEWnOZRnDRs9tnQlEyFiiaGy?=
 =?us-ascii?Q?QkmeCRgAqcAdF4+MkIXz9rAyosFEp4kStbZ18N5bwkFNxuxK5ea4GHQ4l04W?=
 =?us-ascii?Q?eWjrYVOv4ED4CltCsbhuPSKcWLtZyqnH8htbKNE9C/OkXMIJb8XFTxdOgAIx?=
 =?us-ascii?Q?2aqUMMaLRelErgqRIz/JtBFBMOKtJKvXpZYZjcrc0dF9/ziSnKSSdaHHTxZD?=
 =?us-ascii?Q?+UNd2aqoprrKcVG2NYknvUghCPj2DSmyk1z4ScUoA+g16+lxcdAw0at85lcg?=
 =?us-ascii?Q?uEStVK/1EFL6uNgw+PhuNWJ4YLbrx/1VS/3RYttjjb8N6iOICGlmYS2/5Wx+?=
 =?us-ascii?Q?btooy6EaOdw405GYO1gpfpZ2FyoZWdm8fZjbaXPlClkrKAjOwhYVBMJnZbJa?=
 =?us-ascii?Q?9U8nYIVkeHWpHCOJ9fZ+CLyyG4JDoWrY85b7DRUQa7xC07N2JTevBbq40EWS?=
 =?us-ascii?Q?vNjFp0+Zr0+4DIkZm3KB5oaH+sp6s17qtU79MTvGQG7HWcON4D42d7TsT+7G?=
 =?us-ascii?Q?Ls7a0NiWgMFFVny6anAOL4YkS7RXoKn3gBy1ZUMDfhNpOgkRoZh9ofuwZ8tW?=
 =?us-ascii?Q?q/G3Y6PnN5h6y+7U18SwXHEE/mZFl7s/6h1pA7DLSB9CfenPbpCotbs6aPT7?=
 =?us-ascii?Q?AXzqAAJfNgUXw3AM2i7BES2RnMKzKKMHnavnKWl+g4oDKXE+gZkN4bdotC7p?=
 =?us-ascii?Q?a8uePTqgXDnAjxPBlCsqQmYn2skuTc3RBIejTc++ecLbsTTKdw5PCIcNDNcH?=
 =?us-ascii?Q?Ld7RYH0N3UtPmcABIjKXSg6sp4MyAlvzRTMNuvY75RiY062dxlaI6oU8oRlD?=
 =?us-ascii?Q?5+vShdtCmL+m8scOMlFEUTAMt7EiLrJ8x0FFzClzXRjbnXuwEgE6BZKc/6z9?=
 =?us-ascii?Q?tjRaC98wH+V5SfAZ7BBPo0lwfxHGe/IzW7hk5Dm4LZCkp+iaX5aC7iq69iS0?=
 =?us-ascii?Q?vCiViSuZwgtKcC5EZQ6kt5xF8Zr6IZJq3Ry7s3d8Pavqfww/uCdGPTdB/EEi?=
 =?us-ascii?Q?StEWSv0sfXtg1mntHmBi4yuiLjFXgx4vipuchg68WXOWLhXMWPlQrbLXY4SD?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eacd1cf-ba9e-419d-fca3-08dce45da8ee
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 10:16:49.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKFh7FlYHCbIzXsd6E0EXIatAT4X0nUGx9Om3KGINEc54WZIeWnyXTHNKdZwigYftz5SCE9h5x1D93VI76sSDo4pvUz2XFnXUTrzeguufvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 10:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205227

When installing packages with man pages the man user and group are
expected to exist. These are included in base-passwd and installed as
part of the rootfs. However, when populating the SDK the rootfs may not
have been built and thus the user and group cannot be resolved and the
installation fails with the following error.

  chown: invalid user: =E2=80=98man:man=E2=80=99

Adding the man user and group to the pseudo fallback passwd DB solves
the problem.

Note that PSEUDO_PASSWD cannot be made task specific as to include the
SDK sysroot path in the populate_sdk and populate_sdk_ext tasks, as
PSEUDO_PASSWD is embedded in FAKEROOTENV, and FAKEROOTENV is cached
globally for all the tasks of a recipe. Adding the path of the SDK
sysroot to all tasks of image recipes would be a bit risky, so it is
best avoided.

Signed-off-by: Diego Santa Cruz <diego.santacruz@spinetix.com>
---
 meta/recipes-devtools/pseudo/files/fallback-group  | 1 +
 meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/files/fallback-group b/meta/recip=
es-devtools/pseudo/files/fallback-group
index bb3dbca..068ea7d 100644
--- a/meta/recipes-devtools/pseudo/files/fallback-group
+++ b/meta/recipes-devtools/pseudo/files/fallback-group
@@ -1,3 +1,4 @@
 root:*:0:
 mail:*:8:
+man:*:12:
 nobody:*:99:
diff --git a/meta/recipes-devtools/pseudo/files/fallback-passwd b/meta/reci=
pes-devtools/pseudo/files/fallback-passwd
index 08611ba..270935a 100644
--- a/meta/recipes-devtools/pseudo/files/fallback-passwd
+++ b/meta/recipes-devtools/pseudo/files/fallback-passwd
@@ -1,3 +1,4 @@
 root::0:0:root:/home/root:/bin/sh
 pseudopasswd:*:1:1:this-is-the-pseudo-passwd:/nonexistent:/bin/sh
+man:*:6:12:man:/var/cache/man:/bin/sh
 nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
--=20
1.8.3.1



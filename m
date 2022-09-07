Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F750C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 07:13:03 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.71])
 by mx.groups.io with SMTP id smtpd.web11.4919.1662534774229003464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 00:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=g0m9RSNF;
 spf=pass (domain: vaisala.com, ip: 40.107.105.71,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7Aw86lzUhGdK+MACmMtOM2YdFlWDpCQHXZP4A+pih4Py8T4wc/OcKO7te6qDgaXJlQU3B8X/OEzCwdKiG3fpqBCpDP6wU3yZUTW6LIMc+WDrQqbqc5RLiOAITiSda4m52ibbSslHI2bfsUxLNxz35q1jG4OzAaH0XB/N3Y9WXIaQKY3h0qeqto9Zrm9jZhFvEhIh7wTivjOjscJLDvyZDJg3BKePBNFMeLY8esu1uRXdUqG4WH4st9H9P88/cbjLMT2wMllaXzZTbiIcmY2ufNmKD8vc0ezcBY8sLgLytwkxfRJZItHac9FCxOFizfYevLpJ9ufJIzbenp4GpwKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWDolt2Abb7IK+fPNktmnzGO6Zm33rJnwQ1P0AKmDxc=;
 b=HghUsG+eAN3yzWVFqj35iIta0sVU/+J/u3zVp70FLNz/vKE4C1r8RbPJhoGrGJZ1o7cUSoUiflIvNe5IQznzbrY7Bg02KJxmg3Ur34vpDPHB6jFC00ilCw3FHQf7lEbT99pWhmZtEv8bE1B61UFb0fpHineRsZi99ZczalepxXFvcugjdepIheRAoNo5WW4YMWKrey5VucCqYiWlHA/Z5EeAk4ZholGEoxzsUQeKG4ppqIgjg5s6yIehcqB19SQH65q8c9xnA3jC0k6OKQWuVQWotCNjDUp7iAa20CBp8dQYckaKAxc7FJJvjhWSYnjA1sujmzkcqB5r87ySjLcpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWDolt2Abb7IK+fPNktmnzGO6Zm33rJnwQ1P0AKmDxc=;
 b=g0m9RSNFo8fwu6oAByKs51pB1mY5HQI39ItFfP7KBBSgx+GnU5sbPWvLavdxoCaJ+DeUQFDYF0k/iDO6nWngB2C4XGOg+V9t7cJdZV9x5rrwmlNosvdJmnUcmf9McDwhK4L1OgTvO52W3rWygSmvmOyW99oqcOrJ7ZwlgH839x5ddymXi6O/SQ0HOhq7jDgn513kdyqnXdZGjw8Tte5R1IdR1LVzeOj7CvVrlPBIlG/ByizToCOXybgURpf0jEMsGfXL2klTrgVJgl8JySkZZrBhmYEmk1O0RWgblUduZDDBAJxHs/CE+Cp/iUG6IZvqYRD0VjSTSTdm4plAY/8+1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by DB6PR0602MB3303.eurprd06.prod.outlook.com (2603:10a6:6:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 07:12:50 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030%3]) with mapi id 15.20.5588.010; Wed, 7 Sep 2022
 07:12:50 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] systemd: Add 'default-dns-fallback' PACKAGECONFIG option
Date: Wed,  7 Sep 2022 07:11:55 +0000
Message-ID: <20220907071155.2807336-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0030.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::35) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4f940d-887e-4ff5-a36e-08da90a05faa
X-MS-TrafficTypeDiagnostic: DB6PR0602MB3303:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4wrpqMG3y/ECSt22UTMfQzc37ChIASfmO0Piix5jZ5D6yKSTLsQflId+DhEL7hBj0KAWCqdZq2QBSFx7CvDD6QorstURm65anUXYYU8hwx7wy5DXi1xptTnVU6S+SoHAcVgyGXB8DFXGYAuAg+0OBZhTvAPxcnOD8BAbBQ7JtXQSY9+/3lr90bD+FyI8gZWTayEV9v9iqcY/BIfVASfqqr557bketTrwojf3hJOeXS7q4DYQgX/1cCI80/9nO3W0ZeH6fmTlhzyqb9Nc85M7N5zZ/B3n8S4YkWSc3kU0upUsQKrct2fnV18SKRqHy3UQSS6A789sPMmmIH4Bd5bZi04L/nF0sKZ/U50qk869Lc7pmcRDwyp2piLPtHwxbXkhoWXW+FVtcwpmI8OUauWFoklLjHc72IhYX0RnjReftMCwWdaBNiEzdJLPYaKvgo4xHvhBcxyhoGihTdfOx3IMOvEE+DP6QL6PbG27rhGWD8Ter+VTcf1qXx2vKDvR9o4G8dvb+k4r4iHPr+fuVS1AEZgqaqjIe8H8yCwZIcuyKcSzqGDJhddwyjwM24+yWJpGB46J+zaagEX76zq+UA4CUHnJsutI7AVz2cscGEhaQUftpKziak0o+Zg9Mueh94BilZbRrw/NrTZigbZ2IntZXmXzxmnRkMZZxt8cdfVasgfwH4LYo6bxV8RaV56Lmf5PiCiR2hvxSY6SZsHMr/KGaWrZIt0CdcrZEEeLDk1yCTWWi9phXr9kropY/tVH0sNRPeU+4wTUI4mufOAZvbJd3w0H6Gck2oWmAl0qQpTCp7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(8676002)(316002)(107886003)(478600001)(6512007)(26005)(6506007)(52116002)(36756003)(8936002)(44832011)(5660300002)(6916009)(86362001)(2906002)(66556008)(66946007)(66476007)(1076003)(41300700001)(2616005)(186003)(4326008)(6486002)(966005)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FcojVXcD8UoGs2Y9CGL0XjqZeRmncspfqFniUOQ1Qxpu/3V8PUQJFyp4O8Rb?=
 =?us-ascii?Q?k7PvqREvTBF38opygNG57S0nq7sz1X2nWHLD8SjFhbuzUqIlpdRJhq8LZ0C9?=
 =?us-ascii?Q?5f2Pugcy+3p9W/ht66o1AyDRAt2kgpWcSJGS1AirhC507PvMOAaGuw7ueP8L?=
 =?us-ascii?Q?3Vq2nRmFFRsMzzhIrAeTLynLpDFzF5ye/VNU7tOPREbdfMJLUBLU0upL+fZ3?=
 =?us-ascii?Q?XOa5/Us3raiJ9q97yTodzBT4E5Irll2aQgX3LchwfLOsiGodkHwASRWZw8D6?=
 =?us-ascii?Q?ToExFcAs6iGwRKLNOYUTjM/TeX4ioyXDwU7KA9GRVkfQ60gc77Ava1BRwLcw?=
 =?us-ascii?Q?sCOYIzJxwBTM6adY7WSIjtLqQkl3L7kiXotX4rkhL0vt2ol80nJQIN1CfJ9h?=
 =?us-ascii?Q?xnJ0Tf0YuzqhtXNV/yrAZhyPB234CKfzixtNWE3/IKbDqkuIqSgtGYSZKCal?=
 =?us-ascii?Q?CU+E/nPM3I4BUmHFRIigDt+HnyiA/WhMAh6/0Hjfgm9YrDvbCCZAE2xPwoL1?=
 =?us-ascii?Q?/m0cHtS88mnr+WfkYJpGlNy2XwZJCGl85nXak5qGB2fYODWPpVA0wcs8XIhv?=
 =?us-ascii?Q?E3t8LAtK9d1uuXDvx58KKOhYYz+4eHlK/fH0/K56a1PKp15miSmUcZIs4xOe?=
 =?us-ascii?Q?HwabkN03IvF84DrVgurGH1D/RHmx6zRK/bo+BVwwsvXvdTeuRbs03nnIeJ9o?=
 =?us-ascii?Q?oLJAOsBwgRqXRz9BimT5a++vb4Ibs9NY9i/PLHinJMAK/DxWEDS/3iNdTN0b?=
 =?us-ascii?Q?MwS4NpEFHoKgz4618j1UHfepyAJBs2PjUT+mu6nCYFt5vVE2/5SYDTKHfvK0?=
 =?us-ascii?Q?6IeznjI0+qHWRm7I5nFhEWsM9rh4KeYRSn6GbkOUbkLpS2acoI1ONuvrgTVH?=
 =?us-ascii?Q?DMM4+SrqdgiMD5tF1q+Sw6kutMRNP6WnghX0/8fiuuZpNcMrofjtFPzQWuN4?=
 =?us-ascii?Q?3M+hTyUWFYMW6keoSymQkMQAc4jTWjYXOHPa0IKlggvcCUwVYLWv4V2IL8zc?=
 =?us-ascii?Q?TVrkPyJlCnqzEmd2wxU3NlZ905ZKVNHV2/E5SkU2bENhL5YfaTFIFCfhJDK5?=
 =?us-ascii?Q?RKc/SAsk4N4eCKGnRyYuoANBtCMDOZ1I4hYwAZIn8O5YVncfnRn/yb4rPIPS?=
 =?us-ascii?Q?zLfZX5iQm2UX65VMmVAAG/T/bYZzB21hteESJWX6kEKqxlqlif29EFLTNojJ?=
 =?us-ascii?Q?2rz8D5HlJ9WRcJBC92pvRJAmqFLp5v430Op/yiTcwr0u3TmOBJZLq5lO/scl?=
 =?us-ascii?Q?8L3yNL6aj9J0xSg7+BXOciSRfUfSAKOBk/0Dq8eFOrmM01WuoX1pp6Cv2tHe?=
 =?us-ascii?Q?+b53KayHGTKw2FmQRA1etcmZB5UE5UPAA5PfPPLqXRA2jZVHjEzYDLSibl/T?=
 =?us-ascii?Q?H8HFAqFr9tw4gcXDoqf7MC15Ax5dpdoYQWtFKt7XXxWbPO2pBFtvTVOyrC6V?=
 =?us-ascii?Q?f/Pk6yO2c1onb8vleThaE5GnsVYYwaF5hTJQxmIFoSpjOBSddz+BgS1h2SQ9?=
 =?us-ascii?Q?4+W6+dENsTwg2oGclUJkcMdaunT5lwo8kwuG6FAkzB2GVpHO6xIAaYjoG0M8?=
 =?us-ascii?Q?i01Ia3aLKRx9REKIIBd1H5OGfwBhXQkTDkgFGMilorD3Ht89Uz6x4C0HZXRe?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca4f940d-887e-4ff5-a36e-08da90a05faa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:12:50.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 569B7FiYg6DNMXqZja2ktM5UDh1jxmt8XZh6zcYtcvYY5Ji4eO37VVpOQSIRt8Ii9qk4SMAj4ld/0YzciGMVbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB3303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 07:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170370

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then removing that value from systemd's PACKAGECONFIG, the output
from runtime 'resolvectl status' command no longer contains the
following line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0=
.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dn=
s.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.c=
om 2001:4860:4860::8844#dns.google

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core=
/systemd/systemd_251.4.bb
index 8497e24af9..0f30b7dbb3 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -64,6 +64,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-sha=
red', d)} \
     backlight \
     binfmt \
+    default-dns-fallback \
     gshadow \
     hibernate \
     hostnamed \
@@ -129,6 +130,7 @@ PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredu=
mp=3Dfalse"
 PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3Dfa=
lse,cryptsetup,,cryptsetup"
 PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-tss li=
btss2 libtss2-tcti-device"
 PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
+PACKAGECONFIG[default-dns-fallback] =3D ",-Ddns-servers=3D"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
 PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LIBD=
IR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfutils=
"
--=20
2.35.1



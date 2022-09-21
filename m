Return-Path: <Sana.Kazi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E81C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 11:26:31 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.68])
 by mx.groups.io with SMTP id smtpd.web12.5183.1663759582609326432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 04:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ck8+Zp4x;
 spf=pass (domain: kpit.com, ip: 40.107.239.68, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5BlSW8q9cqGn729fB2Mdyat+cdANhGrleicChNCYfKsidKLKYf2jQK1WxoIrKWfKcQ1UF8wr7KN6rXLHnL9fArZSMybQ+gBIM1dvd9VP1+9IDp7noeuvrixXcFl4O8jARR0MYgFxVGOCw7wGfsuC0WNAjxqy/snoTc5NIcKeVcnkbClEUKzrc8qXWwJQzUM3UKNQZmDvS9F2cemZqDWPWebN6nQ+IDAQYxIDUNWCMv+diqDV1CyCKVVHOXxaXhNjHZ9KfiqnHmYjcdRnfuRc6IBiUozPhyz3TzOzn8f60H5ZJMGiZyjSRDOkcBQv2JOrHPt+E33gCeYia54WzuRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dtrymlgqtQPjq9yjBBHcty1p2Lw/tmVkPMO6hTtK0s=;
 b=jb62tfxugD9FeKmu2Q/lbkw7zWgOJCxGDQ9r95IahChWZXjynmyQcmZxrDPgDOz/+eUUKX/JOo0ZTqLKln+RPr0mAZeopqAV7/4t8prWxz2sIJA7TLByZUmwIfb9bTTcnyM0usNuwkeI7c1p94X1uYHpkAk3wut0S90/ze+MYFS5HqHaZkgjsRC9eakZKpZH9xQQ1fRydBNhNbl+aMD6Kl3mXubnh5bKmtM3ys+kFh4tx0YrjuWgFq2mqtYStL/4HxIeKsfGs+DIjzlPGTFJ5X3yU37xXOFGWbwClnuZPsFdk10ltYnx4mCsIRBrFaHeTpUzkEHrrtg0eN7MePwSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dtrymlgqtQPjq9yjBBHcty1p2Lw/tmVkPMO6hTtK0s=;
 b=ck8+Zp4xudSpr00S4ognp+Ya9sUbBlM6oiiy5C9vr0UKGZEVHAXDF2yFGWUSXmJYVQxtR2IGeeAir0IxLXMAeAZCElq/wt10THAiXPGUGQ6vRxCeLZgNLcje6Eh/uAUoR4467LRnwhMEK+FO8yzBnI+8AK5dzvpBr8i+UNOiQV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9f::7)
 by PN3PR01MB7384.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Wed, 21 Sep
 2022 11:26:16 +0000
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9ce8:fba2:d062:dfc2]) by PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9ce8:fba2:d062:dfc2%6]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 11:26:16 +0000
From: Sana Kazi <Sana.Kazi@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <Sana.Kazi@kpit.com>
Subject: [meta][dunfell][PATCH] sqlite3: Fix CVE-2021-20223
Date: Wed, 21 Sep 2022 16:56:00 +0530
Message-Id: <20220921112600.17768-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::14) To PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB7710:EE_|PN3PR01MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: c00a23ff-134d-4aab-46a5-08da9bc41833
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SZGH9Jh9iKUgcpVnWLaWRUs/65JIv+LjYfRBGZvXGIRKvJAMiZH8WWVUEk/ghrevkcfFMx1900XFLniODRclS76wnvZTihRy5uGL1g+FIRuPhEIxHcr2qd/h0H57UD7BWjC2Cx5LdCx4r+etz3RDuu9DetX4DHAG8EfUPAYjeXds/DNGhPm9LIS4nQXrcfV8pyE/DSEUecdOTyKxLKzFQ3DXDtxIOnSOz6yfEMiyQK4xi2/njx3CEqDgbYRz4v5Z4NrzVVQx147aNOgF3eQPNArV+fXYsKR5+TaQdEyBg7CiDpn3g5mruyRCoyLAN1wZS2zVhjoy2Ld26nxmarPYPVY+223eoVw8IlbLaK/G5LU84w/HRfA21mdtCAlr3F8iGJjFW0pTdNV0qN3PQE4i5DmmHzeB4VwjhisvaV/AX24E8ujCWYQ9M8bZLe+VqcwxXKduaqbx5ANRAkwFD2yKIMPTlzPMLiGg0MDFmddCIfbrZKaU4+VYE6TS/YKN0zzLkp0i0rCkCfNmZLeK5kF8yzQpBR6Eh+YPquPrPydONBRILAE5+PZ9JY6zMB1Jxy2TM/Mm0p1cMi13FrDJaPK4gUMxFuduC3zgEwk3NebdZecORi2S2JsEeP7WL1RUfzp0mVoNxfLnkVnABK2DRWQ0um6i/pJgBbtCf6Jm85cVp0LgQ7FmtAFPZsooBBUuUZwfYJgyjnVAvUbGjYMZmUdPDI151EWcVx4EuCF9juSGae4+o5765EWFCLrS4xGTASfD7xmYi4Mwe8EaQQdSauHIH2i0iUPEocKr6fFGRpNea6U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199015)(2616005)(966005)(2906002)(55236004)(52116002)(41300700001)(8676002)(6666004)(107886003)(4326008)(6506007)(83380400001)(6916009)(66574015)(66556008)(66476007)(316002)(1076003)(6486002)(66946007)(36756003)(186003)(478600001)(5660300002)(8936002)(86362001)(38350700002)(6512007)(38100700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uymdbERqzyxN+exg4YAXiWZergUFr75LAnpSXJ7msHoYfMGJRe31X3xnkecd?=
 =?us-ascii?Q?Z5bj6+1Lx1J91e1HsvrzSoAGW0i4+0nhoy5G4DnPd8dDAfCnQcsiM+xEC7qw?=
 =?us-ascii?Q?83bwP20GNRVfLVP5fm9dS6h9ybsFt9jvgujgTHtig3+WT5dVNBU/vThLIYkN?=
 =?us-ascii?Q?pPdKE93Wrw3JpEU2zrS9da4bXrxXd+KEaJcjy59p2PR2PIUAcOKGrdZUM55f?=
 =?us-ascii?Q?iIUurW4kBq3SObuG0rjy1w7L12yvMbWoV1UnuqfIzKBdK3VA70JiSWorpc7h?=
 =?us-ascii?Q?rnNV9gvN4Hz53Pat/Uj6Sz9aJqJ+aySkFIYX1VxQ4T30KnTZw/M75oYwD+6F?=
 =?us-ascii?Q?jiyeco62U5RyohDZSgy+fRtAdImo+oECoVYwLW+9KDhTGYViyZ978crwFWEd?=
 =?us-ascii?Q?nCSUX/rwx3SSGoOHwdu7PWmSbCHfnHGvJb4AC+acrhPX9lNK5tXICGM/HG/U?=
 =?us-ascii?Q?qjP2zDdiA1Sc00ZHmA0/AwaXBFUlgGXFed3KgCGLYC1NhF/1AawTO+5zRbeP?=
 =?us-ascii?Q?NixzD2FqVcTdlF3OlfjQfsYOFQRtv8OwMA+QYeo4KdPm05bQNqBvHZ8V8W+G?=
 =?us-ascii?Q?yPyDyVXj5JUwTqFOtR/QB17s3KEQCUeGMK8K/IcX+wyd2mu3vKmvZzjFf7se?=
 =?us-ascii?Q?IEtR6k/AKdm37W06qqEd24pl4sH7KbfxX2BguPAXOopv1tVZuvinyT8Q6l0u?=
 =?us-ascii?Q?PI4yK6f8fJH5VhlFpu0g2mK2T3L9PRoA1nP4JLVcuVdFJK6YLpYdex+Nnhdw?=
 =?us-ascii?Q?Dw1QRd58aqIfAMGsGQy12wy+oLavmcIrU80HMNlN5iGSYcDJy/m0cvLW5+j3?=
 =?us-ascii?Q?LVThCv3/tpbwQ/xrl+9KikJM/ZcJtw0CGx+c5YVsGYUm1cqGzID/+L7qIJ3R?=
 =?us-ascii?Q?t8KFR5sKcj9237ktFSzNZ8RkxW6Mr1RU/bQHymVlfmCCB22sYEbXj2W+PHiS?=
 =?us-ascii?Q?SU9TignmSzkLZefXXNlJ42n7dPUOVyGxWdZp817AyIcUv39YR64odqKVT35p?=
 =?us-ascii?Q?1gGsSPHOSi1zpiWYlCgE0x9Gg8Z/NbRX8JbfsR8qHVJvmuNZsaLZXc/I/51m?=
 =?us-ascii?Q?ffl31Hp8uLQtYZ10tEqpxg3NCu5GxudNU/IjgqMvJrXB6GiaCv+RG1xM3r/o?=
 =?us-ascii?Q?3CPgJ2ZMVSB0Qvxl2TPFV1KQ882r2KPHp/ZbSO4M9U0Y6kDKQ6460L6W3n63?=
 =?us-ascii?Q?nsG/hwxgvXp5tHzMQkt6Og2E2S+NkiVeJ8DBKXk99Otq+qM5vg1vRCjhqEyN?=
 =?us-ascii?Q?Vj7GlX1+dgBAraRtbnSafsSMwNWVx7y3tSV6PUH6jEWzecPUGqDgVvkaihbC?=
 =?us-ascii?Q?AGI74+ADXDT6kPVYRvqEb/ChYuMX9a+Pyb8z6mUqgPCrqS91fcbtUQnqEKnM?=
 =?us-ascii?Q?L8vITdHLIrRKiFJeKKi5KtRO/nhWRRYbTV5rK/TlITiHQ7o4e/wjBFUtnFG/?=
 =?us-ascii?Q?5HxGKe0+fpnAKDPnUKOwkZV8c1Y377PUppSZKsQGP14Qp1SMPeyx/F3eGbxY?=
 =?us-ascii?Q?8NUP3phgYgxFcm6z2LtpWxlK3rFY+0M4qykNIJCXOpg9K0AiEU2Na/q7yGY4?=
 =?us-ascii?Q?xDjgJCE9IZ1NrWeh9FuqZPnr/tc0VjXjsIAWyobK?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c00a23ff-134d-4aab-46a5-08da9bc41833
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 11:26:15.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QeDPBNHYhltHAmHCW0b+8jpiMzhSx8StaPeOreZY5P/0kXNZJ+cBK01HoOHhwUBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7384
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 11:26:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170945

From: Sana Kazi <sana.kazi@kpit.com>

Fix CVE-2021-20223 for sqlite3
Link: https://github.com/sqlite/sqlite/commit/d1d43efa4fb0f2098c0e2c5bf2e80=
7c58d5ec05b.patch

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../sqlite/files/CVE-2021-20223.patch         | 23 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2021-20223.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2021-20223.patch b/meta/=
recipes-support/sqlite/files/CVE-2021-20223.patch
new file mode 100644
index 0000000000..65e914c2c6
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2021-20223.patch
@@ -0,0 +1,23 @@
+From d1d43efa4fb0f2098c0e2c5bf2e807c58d5ec05b Mon Sep 17 00:00:00 2001
+From: dan <dan@noemail.net>
+Date: Mon, 26 Oct 2020 13:24:36 +0000
+Subject: [PATCH] Prevent fts5 tokenizer unicode61 from considering '\0' to=
 be
+ a token characters, even if other characters of class "Cc" are.
+
+FossilOrigin-Name: b7b7bde9b7a03665e3691c6d51118965f216d2dfb1617f138b9f9e6=
0e418ed2f
+
+CVE: CVE-2021-20223
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d1d43ef=
a4fb0f2098c0e2c5bf2e807c58d5ec05b.patch]
+Comment: Removed manifest, manifest.uuid and fts5tok1.test as these files =
are not present in the amalgamated source code
+Signed-Off-by: Sana.Kazi@kpit.com
+---
+--- a/sqlite3.c        2022-09-09 13:54:30.010768197 +0530
++++ b/sqlite3.c        2022-09-09 13:56:25.458769142 +0530
+@@ -227114,6 +227114,7 @@
+     }
+     iTbl++;
+   }
++  aAscii[0] =3D 0;                  /* 0x00 is never a token character */
+ }
+
+ /*
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index 3440bf4913..04eb3683ec 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2020-13631.patch \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
+           file://CVE-2021-20223.patch \
            "
 SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b78=
25a2b6b51949ae"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.


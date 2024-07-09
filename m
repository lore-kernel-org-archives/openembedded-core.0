Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9A7C3DA47
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.114])
 by mx.groups.io with SMTP id smtpd.web11.11587.1720527764914161539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=V/C/amnC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.114, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9/5oEFK3sUHFtmY/Xr/5di04Dj+kimGs1x8rAxubqT72CmeK5Teebr5WQcm+GSD+vKGDQGvpTBqdjPbOhZmrRAj7pMuOpZNRRkGnW83308se3avhvyEAf8GPdx4mF0+rRDpDudz5aoiUXzpNyiNowjjdzr1lQM7iOQgCyg0wnHHjbV2DJCh4GygN/LCAGooAuSimUaJi4YKmC6EOeu9l795OVlLQ8z/yhFF1QJODksjLHBw2S+R49DMlYJrjToThOobx7IxwVbHYGVZn8/LGbtFgo1RbkqKvdUGpYJMC2qJ+n2X/QqAaPvr/o0FTfOEopiM5nb1Hz0TCGPVEjIFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KDC2b+ltMIV4oAmDCQDEtSuMRZ/IiqdZODoCILwT+A=;
 b=DIoqW4bhIjw4skZDOLdWguRCHTpt2+DcVLgjznf9f3bfwafBoG18qKg4fdV84gJK2ucJ4ycrUvVfwm56Z8RJ671QI8SUYXKjqIQOOUIw2v4759XJRADOPM6ZpLEL/BOSt7PIvlIMso+YtSYQreGePdabFD9h9rIpB4n9pxz/OElznFCIItwpLqRuVj8B8Mt+7kxrjyc7MfJygxRMZ0o6EaOSXK8FuegqbeR8GGS3mSFj/XmcXzadzdejscxcEXprPiS44LlB37Xl1C6qifi3Ke9CnKp9AqiFPTTGUa1Pjxjpg3m8O67z81tmHvS+Y3/VEISHqf1vvpwsVPU3qN3nmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KDC2b+ltMIV4oAmDCQDEtSuMRZ/IiqdZODoCILwT+A=;
 b=V/C/amnC5jO3nqvQw6V190tp+O8cDBylpOcFCdlG9rxAxIWYZjSyOGwyMDwXpHDkZG8q8kwunlUngmy0XZRKeahAho9XclLNqQJKT4sDQR8LYqNHOPQ5qJM/oG8DeQo5NboJ51Qf8xtIv7T+88puJL09pmF2UUObUEqubLdERHH5J+CuEHgUe8ksA9Uy2ZW6qTGpK1o3QHCm9pode8tCaaWeLcy8Pr9up+Y72cg6VV8OcHAm0KsGJLxTQVz4Q4O8My1IzlTkyENbcRu1xH92i2V8sKvYuiChKaeTpDsj9pV0Dr/lzet2n2LMOXEpDa78ZNoVxWqT2+fvUixxpYXscA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM7PR06MB6611.eurprd06.prod.outlook.com (2603:10a6:20b:1a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 12:22:42 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 12:22:42 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2] systemd: Mitigate /var/log type mismatch issue
Date: Tue,  9 Jul 2024 12:22:11 +0000
Message-ID: <20240709122211.4108193-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003677.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::393) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM7PR06MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 02618ea5-3bc4-4737-4253-08dca011d4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HJpdOPAOUu+LFzyYw0DFrA1QKRg3qKRMrfYBY/NsuNKjjmKkqZ6Xs+wOjuB1?=
 =?us-ascii?Q?aJU6/mofPESEgN9SHDjO94ig1qbct+CmPtvSOKKooZfH4xY6S8K4dTXfiCHX?=
 =?us-ascii?Q?SNbvZV87lLTjXFgefBDwPr7A7fdl58+K3uurzURdHrqa4VbONnMxuOF976e0?=
 =?us-ascii?Q?uN8i3XiwX3evcvj7geEDegTdpqNetozwjJQVY2luHvLdXokhuMsJKV9bxpb/?=
 =?us-ascii?Q?Ys8+IcV1WtgxIPGDqG7M+paHu017LrIdYwsOM4TMIb+VYEe4P0i/5FUbswFG?=
 =?us-ascii?Q?k024eqYoy41tpC40xXrlZbJvZH5SSG9DrD1GtWvoV6J+DWlYkdZRrvW61oC9?=
 =?us-ascii?Q?+lwbCDbqjuL9xHSFRm5BRIU/5/8PdIsEVjB4DAfmnT2Of9ZPrdcOUf2jKs+O?=
 =?us-ascii?Q?xf91wnnOFJnnQ+Oi4SCxJ8Xogp6TAZDBd9mO3IoMn2F1fBngepnJBo1NtSRT?=
 =?us-ascii?Q?Hc+uQrs7IQcFMkLCOpSEmD5UqGd+pMcg/3eG/yLLgmLg2C5cFmW/0GTk9LOx?=
 =?us-ascii?Q?8RzL7gyMqrG63DvkUjAQ11Vp27/184Z4EmYu5LPVcfHXFA5acgfcrqFc5i5f?=
 =?us-ascii?Q?0hKUKZoVPaGPHgUY4v1UAb+N2oGSzvs4zt4ZzxUs3US715kL3O+EVRy0o6ni?=
 =?us-ascii?Q?JbkceCUJhJ8dbMn5DTDQ9MLG9z47zJgm336QwaXubupfvMkX0dOrSQliDwkJ?=
 =?us-ascii?Q?zDqJnQ9JB/0ePw5bY4GxmdtbE5iyPMx9HXVBph/WhnHzLpfsIUjNcrwCqZzu?=
 =?us-ascii?Q?jWKsEpgOwF9Lo4GJ2Db2wCPkGzBcvR4wkh0cpnhfo82dMxNyEmwWnIFvVRwf?=
 =?us-ascii?Q?74dUuhZh01ApGELb4pC6Y8IP1AMbQ+fJhBg2nCpJABZZuRllGS3xKcarNYBD?=
 =?us-ascii?Q?r6nEwG33IaYzHGbmQ00PjLAQhm71/akO1yH6FL4wtF615jJXZHwHshRfq1vZ?=
 =?us-ascii?Q?LpeT/WDJT6iNFYYRBHqfO5xQq1eSwDoBxOBfYWnkrmrReHuczm0XyVwgAvrd?=
 =?us-ascii?Q?zy9k6hTwLUTZRduyzA5wxw57s0UqqRVeJnsUmDm8TMPxoKval6Q7cbRna21Q?=
 =?us-ascii?Q?ZvZwO8e0K8gfyn7OoGsPIocnL+vWpLT2LoJdkNjawac9gn6NwUZJcu+JPls/?=
 =?us-ascii?Q?A6Op1vLQvyCGLEyHalWIDEgeDpvi1EYsGX2LZkaPkUqTiloavKVkcbawO0iN?=
 =?us-ascii?Q?vjLFVgGaQhKJS1VUPRsL4bhqUWL26aysZvAccOQy8v8KZ7ZtJ/Dx9PiPizW5?=
 =?us-ascii?Q?ws6RE9AbBjIc/TX5C/gFTDjmF3sNNA3wkww+af352b8k/5xU4E+MzsUNlF26?=
 =?us-ascii?Q?8zuJORFeKim15N1g3gxfwwqxrzZx+iwK0nUSQ1n7rUs0vGuwU5vJRt128i0l?=
 =?us-ascii?Q?YLRUN/r/edkMOXQsmci6l56vb0M5NJD0mzVrx8/uAmco584C7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LQvmfXeMTgJGjAMu3zU/cTDOY9qZEdCatOZmuYBIPuWT23x2ZcvMYneRIOIg?=
 =?us-ascii?Q?ntTaE3AEYa7203hAn1ux9Y1fedtbC5sbxLgIazt5T0IF6bW4by3owTY2jd6O?=
 =?us-ascii?Q?K76Azfm1izQIRSUubnXJf5H/yyZMMHIHE5fLavOrdzikcB1z1mx+uL3nb1Jx?=
 =?us-ascii?Q?3K/13luEdMrgEosTmMNc7WE6LI5duklKASms5E3nqts4HjD6gsF85a35yQAH?=
 =?us-ascii?Q?B557HmrkU41Zi/Gri0zNn/fjKFAU+ZaRkYqvJtLoJHUl6Ig/hYwXEUEgEfRW?=
 =?us-ascii?Q?x1YNyraQI6UpQjyFTYYRihxs2amqyNxJWJBYkiwJEKHML3NxA6sStB8nPrWl?=
 =?us-ascii?Q?YSY3DyJFu9tMgtkHNSw/2eSjw/2yFXV8PG2TbgM3hASI+F0lsBP3J38nL5mI?=
 =?us-ascii?Q?JiPj0eaUyWOpHsE1TnGegMoxHdvie3CbtJ59ez1sxDHRaqRwa/dWqmoqqYN4?=
 =?us-ascii?Q?okGO34RbSqyNTJMj/d57TzFMlu89yGtY3sLUULGvQya/UwRo9ysMucMP3b+d?=
 =?us-ascii?Q?m+MIAGKzqvFMghVtebMc4t5g3LDPLhVVUQJv6Fy7OIKnzsAEB2dK6iPLE6dQ?=
 =?us-ascii?Q?fQlZO2JMmN65OJB4+MddCbqhXb+fAlac8ggqMRS43eRciI27ZyccZLISkSH3?=
 =?us-ascii?Q?3oW3IBPTBt+UOcG8cnOAHsSwQpsJetFGG4jGYAe7CwTN/3RGhj5PFYphrbwt?=
 =?us-ascii?Q?tJQ3Kv3IeFBL059bjNDOP1qErYmf8ybHPJCd/9hdtPDwgmnaPp1O7EOxJNP8?=
 =?us-ascii?Q?xBtU+VKPZcJtUkGXrqjxjWf/RKNoNCKG7CRsFTJ7eAgZffs/C8PTtKM1ULZb?=
 =?us-ascii?Q?v1non5Xe980+5eFIVrpg2/IHqxWSvwQLkLislDr/HDRegL6I9ez+hBp4jkpm?=
 =?us-ascii?Q?c5JOBjDjJWxcaLD8FutkTPkeRk3cMiYgmdZ0Sc12PfJ0pUrJBitvGZT5poon?=
 =?us-ascii?Q?Ijs1LKXur1/6eWFUP3JgR2dnkNNSO+dDKGOM3BSMQJNzAgt2JdKEKmUdq/IU?=
 =?us-ascii?Q?8Oo7YExF/dnKRlesu1OeEd5BKuzy2GLsxAHnY6A/hjnEHBjWXMr3lDIfrNfQ?=
 =?us-ascii?Q?fcZP0dirCPRa/rvMCUr6KdDwJuA3rMM2Zz2sztOINf8WRqUdYEBJGJHqY8Iv?=
 =?us-ascii?Q?jHft555huXMK3WnnwKCf62rarY8e9iA4GIKrUDHLYnQPA1bcAChaBh9C/K4t?=
 =?us-ascii?Q?QDLaQX0Yx0GVRwYmeKe8Qqz3QyXEdmBMzyKH5FIdBFvEtpd9CGmn3XrxhgK3?=
 =?us-ascii?Q?1DNtqXLHvlTDnnje0+zMFyUK/IiHusbe+rY98Mgwnn1flcBhcPMd/MjXPYFo?=
 =?us-ascii?Q?QtNLgQHaBDnvu44SOnhXdup1FTyLVlgkcxocLuEA61lnr+d4vcfdLIY9yizW?=
 =?us-ascii?Q?DljTaPAIhAynAokYxKX6TCpo8+bYbaxjru9XHFt16UstJPiwZcMm5pKdbnIl?=
 =?us-ascii?Q?CO5APcXGy+eO6lqeBkaLJ4nwnhQ519DV0jNJcHnLnNmmqyb7fakk8asP98KJ?=
 =?us-ascii?Q?U4ITK9t19buzfAKICVQ7nbhHCu74lbuhqnkVWP0/6KijT6uZgtY0lk+mH4Ih?=
 =?us-ascii?Q?4eOthiyL/CRkJ2CjTrDmqmKz76wF7+dYokiAyB2vWQUXAXLyNuIXUPETX5H0?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02618ea5-3bc4-4737-4253-08dca011d4bb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 12:22:42.4844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4f9mPB5v1zuaixQNu7u1G7RNWZDioVvtvZaT+Uge0vQSW7RyFLK13OGlYJw7WTbrqNIAE1T0lRiVmdJWpPaCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6611
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201656

From: Niko Mauno <niko.mauno@vaisala.com>

When VOLATILE_LOG_DIR evaluates as True, the base-files recipe provides
/var/log -> /var/volatile/log symlink which is in conflict with systemd
upstream tmpfiles.d/var.conf.in which defines it as a directory.

This generates following error in journal:

  Jul 03 14:28:00 qemux86-64 systemd-tmpfiles[165]: "/var/log" already exis=
ts and is not a directory.

Mitigate the issue by defining /var/log as symlink corresponding to
the one created by base-files, when appropriate.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index 0376412f61..db37776fd6 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -313,9 +313,10 @@ do_install() {
 	fi
=20
 	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'fal=
se'}"; then
-		# /var/log is typically a symbolic link to inside /var/volatile,
-		# which is expected to be empty.
+		# base-files recipe provides /var/log which is a symlink to /var/volatil=
e/log
 		rm -rf ${D}${localstatedir}/log
+		printf 'L\t\t%s/log\t\t-\t-\t-\t-\t%s/volatile/log\n' "${localstatedir}"=
 \
+			"${localstatedir}" >>${D}${nonarch_libdir}/tmpfiles.d/00-create-volatil=
e.conf
 	elif [ -e ${D}${localstatedir}/log/journal ]; then
 		chown root:systemd-journal ${D}${localstatedir}/log/journal
=20
--=20
2.39.2



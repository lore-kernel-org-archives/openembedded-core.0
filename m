Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6E2C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 14:38:17 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.130])
 by mx.groups.io with SMTP id smtpd.web11.39378.1741617492399989865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 07:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2NwG8bd3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh2MMJF4k6KbTzsiEKTouj62P83PU6Q4oEGVay9g9yxcXyBuhnEOQ9/Zf/8mxbPsa+q1PvU0QzKLDebs9ASWzCyalv4z8TOibqwu+MrYPbkNEBEEUppBncYONXNESFo3BkZ7VmC9kCxojWjAb3hvL1NzAlDsSffiUxt8cx/wu514NA/pEvQ629xhZ/0Yzy2++rZ+6zzOIaBkcWpkbQW78NB8t1mfSCrI4uSTtByaFTYk3xRyKyneadXVhze4AmH4Wbgtb5K3Is2CoQnBM1Y5p+JiUZSDmnywxDAv4MsfxHceTpJv/P2suup6etodvtF+L7r1ceFKGGJUzTwEXX4eTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwyP35FHvAUQaLc3HKyLSDJ2wi+qQJUT/IZ4hQTNJtw=;
 b=R9vRimvZFZRDl2r7wVqgMIZydQbjYoCT8OY4kkhP6LWuwXU6lVIftyAgrRHT8HWpG/1J7nqEnAKXUmbS2QrF5Dz6ERQ6YiTlwNegRXd94hC+U/j4xuOTCfXNTQ+Hep8FF6kzEZ182x9ZIl3n9c4ZhS5bTmsO0yLMN5ex1jIVQIluOWAi04LIjs9rrD9uK8FRhvxpMDFzjzXs4TNoh4twrjUiSFLNb4butWZwp4gIXq9zM8sXuXa6Ic9HqH2uW7Kq623WX70SbcxCJC22pDNcGB3jAE3aYS6pqjZK9Y8gg4pqZ954X9/BFfcb+z8U7Wxf5zzoj07Nc7QyKYfRck/ZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwyP35FHvAUQaLc3HKyLSDJ2wi+qQJUT/IZ4hQTNJtw=;
 b=2NwG8bd3Z483va6+8isi5gMuZUBcVhkggcCxM4v3SbFzywE7wX8oEscsDwCFVE6GGSh96qRVn+DfApIFgVeCtc8zzjV4zaZCIitYQnvjn3XAvr8q+xTgF3DBMo0dvLfkNI8vYlEC7Qqj1uJP4OkSsvG/3Q4y9NE9eURCONYHxZz/T5RV4v4eyPnVTd3mXI1PYk26VQEpg2U0ZGi5X0noMeMiwtefsImgiIzoYFaA+v+iWQGug0xavXhFL3f1gdONkvuY8aQh1VC1DQZF3jUUTT8Xz0HMSyoJocAM/GzMsbe7ukhRbnDVl46ZM+FIIBvdGNjDNNLYENlx9CV7SNNX/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8511.eurprd06.prod.outlook.com (2603:10a6:10:36d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 14:38:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 14:38:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] cve-check.bbclass: Mitigate symlink related error
Date: Mon, 10 Mar 2025 14:37:43 +0000
Message-ID: <20250310143743.789988-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0093.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: a33a786e-8d3b-4ac2-54e0-08dd5fe12c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wU4CnIRQ88l7RcWu/Bm+e39PTBmA1//unPb64R9Z4fvL+NTNjYHIhaJI03/K?=
 =?us-ascii?Q?D2Ux195Acar/e+twa20x2/6nnTWpqEMNbfphkspn0JW67I+kWFFZeuEe/OEl?=
 =?us-ascii?Q?YPh3UCj1zyWSKhhpdfDZhpsFSbwNPqOnP2FGO4GksVhrnJSnXJKJBODnpg05?=
 =?us-ascii?Q?ce6gPNj5gFMtGfFor+CpwMDSJrf6XG8xvQ7QxYfSKl6DnJZGpKgVtVv6aF8c?=
 =?us-ascii?Q?YhDlVktlqBtECuCtXCWi6pLk4dujv9LrEMPLDgdFX+PFK+6G8rkoFYs5pytr?=
 =?us-ascii?Q?8I7RftICjgSgOQzHJv4SpcifbRa6hscnGD5foW+CVhGHC/0+pUDjfknIUCjH?=
 =?us-ascii?Q?1KA/EhMTXTdr/fxHgVfMEj8VO27KW4W57APRFuf/LWYWeFSdInkD176n2SpX?=
 =?us-ascii?Q?DNT1MQm6ed5fj/Pzuu2rcELEIu+OG5BcenAKONJ9aAl0tiIK945rcD72Z1dV?=
 =?us-ascii?Q?I97GPin5b79E8SLiYtfMrzym2fbXVRm/VbUg8F/PEwPiNKO2AkbUczOMBUVf?=
 =?us-ascii?Q?EOoxN5OclbbljBSbovWroiOeSI6nVd7EYqEh+wLuaDZH7C2ijMpkwWjoE8Fa?=
 =?us-ascii?Q?EHYUmYC1PGNjeCTF8q7oIEpkPCY21ZcpLB0IdMLVrsN1GhnqDBgHsz+AoOlr?=
 =?us-ascii?Q?ZjtmyBMJBNIqVj+DcQkMVEjIa1onbAURMTZHgDrtjRa4RlbYU7vCnyZLlcc1?=
 =?us-ascii?Q?fvUQKj18DLbZBsFksIsDE1jqkumO9tH2YJqlcEIaJc+H7JehP2vSpFT9A/SE?=
 =?us-ascii?Q?pTb+OL8y9Kq4Ek0d1q19Y9y9EmAZR9j5NIiCElqGFU4kJjdU5Srd+qZjfIKw?=
 =?us-ascii?Q?9CfErJQU5hUtMKukTxdqMsPfeKjM/PFYZ+lgojmaMaKuq3gFXE52SsybFceI?=
 =?us-ascii?Q?zQuOdBcvRYASVvENiMa0RWIji/V1YVLsIg5l0LI7zQ2M8v1MvG2mh8A1Mqh8?=
 =?us-ascii?Q?8mQ+Ofy1rp3UFrcq2bdLqZKodslpV6iMxKMBVbfsWmC7domBEPq7mYyHMiAb?=
 =?us-ascii?Q?/ykNciEFeC6JbOeCn4LnZujd7hYtIkMAfoccwY5put/doXC+1fxNs08x/KNC?=
 =?us-ascii?Q?oyBX7M18xgDS78+f3anVen48B76u1kZbfL3ZJBIFPPHVnMPfuGSzyC71Suel?=
 =?us-ascii?Q?4SJpSoeO4Q/17P5NuNONm8Nt75FUsSQyLfXoaqL5ynt+6B2uYMuRZ3Fk+pcr?=
 =?us-ascii?Q?s5vupH9WU7RTEOamfewhKkbJLy6pGLWBuyX0vUvC9m1gYOe03F0bJbxCu3JK?=
 =?us-ascii?Q?1pV67sAZSV2nZ8vvU6w8VUe4t5mZ6NOMC28Z1bGZlmfwlGYL7BwIYUkK0HzC?=
 =?us-ascii?Q?4+XE3z31aeoI6LCJZI1jkxbmiqJlZlmEUEvmrNI1nGLMRoYr1p4/Ilb467bi?=
 =?us-ascii?Q?SW2vtOSR1oRydDOiBDICAmU/3TAAoCz5nCGaWw6zv/28yPRimaPqrwUwy/hd?=
 =?us-ascii?Q?myjg1OSgG+vd/Cfh1FX7fnFIrGjN+Evq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ue/B/7r2mRnDUi/DfKi6rZZKE+o7WMaiou2fOWLkWZoFASmouMUWbvIXsYeZ?=
 =?us-ascii?Q?S5ixmHgNC9P0jIMKKcCeBjzcJFCXdMl+sj0IR3fUs67/8sIlRLJ7pQO2FLu9?=
 =?us-ascii?Q?C8JV3eYDTFuFvr7aCn8g4W55wa4p7b/Q+XNqb4HqO5WSY3wNOs+51SndOihf?=
 =?us-ascii?Q?6BbVtpJQpC7bTRDd9uAV6IcbGXCDXBSYgvRN/dJTNiaJ4m8JS7+lNtW9T5Ok?=
 =?us-ascii?Q?EQDwdKfAdh8jNBr8d5baVlelT5G/aXsVvbjLHj9jabisrU1+LM1ln44gkwET?=
 =?us-ascii?Q?+BYwafK8hhkGyPGMM5cQEud9oXFs/Hj0zrI+RUttECGA5w5erT75fR0t16zb?=
 =?us-ascii?Q?jwEvyPDy6WrM6sWZzN3oK+4Gkr47E6CEJUdyotqhCbMnjg8fPPHVhRDbNm7g?=
 =?us-ascii?Q?0drT2lJoC8v6AYlVjlFCYk1fa3N44JaTTy690mj4F/RNI4MAd4hDw9DHMmxS?=
 =?us-ascii?Q?2kD4v85W9hL84CHedYxoUfHSm3bjvbG2XoDgsjIbTpIEkG8Yag2FEh1Vravz?=
 =?us-ascii?Q?JivVByXGfLBqnEuBl/Re5iajfXo6B7N5/DaoVYpLXlwgVLgt46EXP+Z/dRlm?=
 =?us-ascii?Q?LmBXptmLrVeBetXtue5eO617akp+VxL8V8518+DugCuwvqxyD1D+VnqoYO4P?=
 =?us-ascii?Q?SuAYxHfpw7ldQ7693HQKYkbYE9kNfNIEsQgtAeejqoM7Qw+Qzhn5EH5GUNDG?=
 =?us-ascii?Q?yejF7CLHYximPjH/ojCQzzXnd8Zf0eAWy1nuyPn+85JLjYvMXoaGv3ePcq2F?=
 =?us-ascii?Q?YKDuQlbKTyNEPGf6dHMyxp9TJNyGFr+9qmyafgwAUHeNZ3418CHJRuf+C6uS?=
 =?us-ascii?Q?HapB5ewXUk/tnjXZPwjWIEIXBYBRMa3pzP8B088QxGt81NiDs0yCfkdkO3Ex?=
 =?us-ascii?Q?h9Uf+3OrJd/7ZB3CtiMMeoa2hkMjSUjC/Z2sD77ptc1YHPINWY9tfpsYYO+C?=
 =?us-ascii?Q?Smcz53hIp+JeTuRNbyZBmPgiS/GG56fiWdNcTe6k0foR0r2o1rPGER7/73wd?=
 =?us-ascii?Q?bxmdAHcJ+362VSu8G9LkKrsOfjunlpEuDvJdT3gvkUN3HubEcM4W2P5K6fXd?=
 =?us-ascii?Q?VeVBKKIoDWxWNLMhu8yFdvevNBC7jncu9umnShfaghi7FkPLL7JmqcyvV/9d?=
 =?us-ascii?Q?XRpx7Q0//A+T6At90sYhAw/duEMWaIQgz0faX6F96fkDn2QLYCQCWI6ke8Qb?=
 =?us-ascii?Q?l0plOBcqIyWiWwe4K0bB9SR7d2s/uPaRx9jtx65PjbVJUjXge+YWFoJ9A7sS?=
 =?us-ascii?Q?BFdRd+aCSFJteFUxLxWBcJDWm4mEqe5xVdzPRmZ4K4LO8JlbckdOcIydq7Bk?=
 =?us-ascii?Q?DiCBvQGshBxrFriotOiiLxhyHvKkPvemn/AuNn/bYjJOcbwQXjWPPbQThgFh?=
 =?us-ascii?Q?QBtLRavArba4J+1CyYq0AeF5zPWvhj3JJQuD/PI6P6HdhHNncTKYEBktzyG4?=
 =?us-ascii?Q?3lATIEU4f8krW3nMCZZJwcZ2UPjqkLfp5EaMAyun7LdZT6Ys8/z+x61g4j54?=
 =?us-ascii?Q?GenkDv8BcEdeBm1sKH9TTmzTYGmXfDbRGL6pcuWj49CX63DOzA/ctgH+G748?=
 =?us-ascii?Q?QMYcLmAVOsekAsWVPNAtp/UKfqHQMh+cOw5HXychd3AU4HQJJGMcfteQoDfg?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33a786e-8d3b-4ac2-54e0-08dd5fe12c41
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:38:07.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnUHI5ZuDQ7LxJ+qflxf+thuARVG/Q/q8L0QwXyECt/DeC8a364q+ZyZWPYGVBNdRWCbKi1cRNLGLwgWA49RLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 14:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212527

According to Yocto reference manual, in description of the
IMAGE_LINK_NAME variable, it is said that

  It is possible to set this to "" to disable symlink creation,
  however, you also need to set :term:`IMAGE_NAME` to still have
  a reasonable value e.g.::

    IMAGE_LINK_NAME =3D ""
    IMAGE_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION=
_SUFFIX}"

However, when using following additions in local.conf file:

  INHERIT +=3D "cve-check"
  IMAGE_LINK_NAME =3D ""
  IMAGE_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_S=
UFFIX}"

the implicit symlink creation in cve_check_write_rootfs_manifest leads
to following build failure

  $ bitbake core-image-minimal core-image-base
  ...
  ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-base i=
s trying to install files into a shared area when those files already exist=
. The files and the manifests listing them are:
    /home/poky/build/tmp/deploy/images/qemux86-64/.json
      (matched in manifest-qemux86_64-core-image-minimal.image_complete)
  Please adjust the recipes so only one recipe provides a given file.

Mitigate the issue by creating the symlink only in case IMAGE_LINK_NAME
has not been set to empty string.

(From OE-Core rev: 64bfec359bd909761ce0a6a716286d938ed162d1)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index ed219bf472..badfee550c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -281,13 +281,15 @@ python cve_check_write_rootfs_manifest () {
=20
     if enable_json:
         manifest_name_suffix =3D d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX"=
)
-        link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name, manif=
est_name_suffix))
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
=20
         with open(manifest_name, "w") as f:
             json.dump(json_data, f, indent=3D2)
=20
-        update_symlinks(manifest_name, link_path)
+        if link_name:
+            link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name, m=
anifest_name_suffix))
+            update_symlinks(manifest_name, link_path)
+
         bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
=20
--=20
2.39.5



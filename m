Return-Path: <fhoerni@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E769C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 07:54:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.91])
 by mx.groups.io with SMTP id smtpd.web11.15839.1747727680100240299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 00:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=NnH3I2uk;
 spf=pass (domain: witekio.com, ip: 40.107.21.91, mailfrom: fhoerni@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzKE6raRl9IBGXt0sRadUe3w9xW8PzlgXT5P3lhX8O3EzdAPGzLxepQDCRF7yjVrxB8QtscP2azsyazMS5XT7EAtaPwutb5tAna9Y26iFG6Z+LAutt+BYHjSIYUYWuHW2tKlJywnAK9pYtNk9kzhLSzK66yVZqappVZ268tIR0LSGTuM00Vyi4y48Og//FgwY9hXy2eE3LHd1bX9+50sEKeecsja6GESUjOeopK64golH6kxhPmWXZsRrDc+riHkgFimc2MgRyQjQZbvBcxvlu1jKW93NcVQmzfDVLcTDUJJewKUXAejytotoGIOZ09WRjnWgP0zJnd+2GITfY6S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdkJVQY2iBviFkEgI18m+9J9tuvLxEssLOZXSxXAi7s=;
 b=l+NVQ0jMpB+BIb211i3QLuyXqrqwWsmCuiFLVw3S64sWclyrctO4I0+vLqumx2UffQmidzJ4Es8hcQ1ajf0gDTaKSZ3rde4fLNbhoXLI5EMQp0XBwi5CSf5MXOiKjcsDtW3rReiy/CwsMkciBwUQrLHEXqMbbpPWU8FoKmU1HPZSfGxhDdUDtda1e5QeNaHd8drto1FcycO5WhHnf1XYFcFvXe8/wer6GiTjuP12dQvMi6ctyHasDcb7TpENc3LU0up7xfPmolNOdOv8hlUsahaCi/WcASG3XfG+3ggJSZXxzsOhduu/MbWM5u+dHC379ab7VGpoQdF2Mf6TtKqclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdkJVQY2iBviFkEgI18m+9J9tuvLxEssLOZXSxXAi7s=;
 b=NnH3I2uk3lnnKwzNyh0JE/GH/+X1acB8HInlWIXreaZ1qDqMkvG9KsEPSlhZFZNeq3+Y9M2cP98shi68L+UpQIS+A2dh+DyifHmD/iS39PzVtjI4MLb37xFy0VIN1FDQQenqhV1FnqZ7ru+IYL70JNofl6s+57v3ePW258DfAmgU+/B7tzC14nUpYfx/vnFCliZdkH15oKjO3B4M6KFcaHWZreDEjUxXrB24bbJnubFC5qk64a78Q3O3ZcLjz5MSvJeAUxhIuIbCHN8OV7cSDsRyhsnYzFKbE1I1hr1e4Sqxg4nLS3a7gzhHnhMzZCEkgBwMMKGckcs/iQEnDOQNCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:359::22)
 by PR3P192MB0863.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 07:54:35 +0000
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14]) by PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 07:54:35 +0000
From: fhoerni.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Frederic Hoerni <fhoerni@witekio.com>
Subject: [PATCH 2/2] image_types_wic: fix dependencies on wks files
Date: Tue, 20 May 2025 09:53:25 +0200
Message-ID: <20250520075325.64756-3-fhoerni.opensource@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
References: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:359::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2225:EE_|PR3P192MB0863:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9addd1-0acf-4305-eeb0-08dd97739066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pQKIA+WSxTTlEKkxggxlSvTckNXqBgaMJJUY7UpZelj4IRQsd6cspXzW11R2?=
 =?us-ascii?Q?Kza2OGR48XJFu/wdOTKsucYTHGwmMeaPqKmYxqH9kjOzeBVvzCbZ40EfkUUA?=
 =?us-ascii?Q?XUNv9NhBRDYdgOD0WgCtMoCUGkCMz/1uDPOVy+/8m5x77kylECDweZeUIBdk?=
 =?us-ascii?Q?xqAqMyPeM5UKEeCslUF0b/b9wfW/msw590bieSD3LJwn1JxuqMkY/VG280Xc?=
 =?us-ascii?Q?Hbqlx1y2wWZkh0GntzthUoKPydGgrelOwyQ+j3UXuLZFwOXULFQxNFP4KVBq?=
 =?us-ascii?Q?f6IK/J96asFUCRZGJh7R2gohMhaM5ceSuxmMCG8kQtYaE6vkIWSrR51Wf7pC?=
 =?us-ascii?Q?u+s72ZLhpMZF3cEYZY2DvEM56WyN5MQGZC8GuSwa/vaWCbs/evgq81hgrcf0?=
 =?us-ascii?Q?UX7asUfLTb2RTqDceWJRcyH5/jyAIUF1H4+QsULST29GStMBwruBQLrdoKho?=
 =?us-ascii?Q?f61grzvFSNS+RP4U+5F6I1bnlRl0WKChgqT2zy0kU1al9qKjLW4zXh+1kas1?=
 =?us-ascii?Q?htLlZ7hZPgGd5HfkH68kYOc5UADpVdU9kfs69+CnKiKgWnaKgYOBduhc+v88?=
 =?us-ascii?Q?81GC+tHf69Nit29Pydu2ZtLUk1YjIUOYTDL9A79wFtnFHK1eZu8nIoVK748O?=
 =?us-ascii?Q?VbcM4cyPSTYUo/EIg9/XJu5YYM6hONPn7HNkL0K23ju5T7faJmJJbZez0Wxr?=
 =?us-ascii?Q?cyYdfnpm8wR5mVCU2uafySrQxThrQnr9fQ9F8UFPR1uHmBR5GJwn6WRlZbck?=
 =?us-ascii?Q?xpSq4NVbF01eF2EWhD1zZ3Kh7Ta/6KxRXooiNfC5f0wU+x305HCcJUd3o/GW?=
 =?us-ascii?Q?z/lE5YUHQKR9rCYaEaWkdUzo11JeGHM43Svf1VvPwjpjgHYyWva5i9s3gHyC?=
 =?us-ascii?Q?dxOvXzCCfnZNU5b97oi5ve4N9tQ/Edk1i53nDftbJg0rrqPZXSTT1eNXVUrJ?=
 =?us-ascii?Q?73u9ehOWaIajsYnmCSe7J9t/gn0R8DeIfw9hGx+DtV5pZgIJtm62sBuu3YzF?=
 =?us-ascii?Q?9KU+j4PKkCx2XblTmhs3icmHYfBtzkPZgyHzYkVKVZfcdFFvtKNfLjYeBLnH?=
 =?us-ascii?Q?cCguuF0FRb9Weo0K5H1t+PWfEphcWUe2qeEmVykpK9iTtxs49QqT/vOsY5dT?=
 =?us-ascii?Q?wu49keDV2n7GXMnMGZ4eu9ERBbCPyOdOqp0f2Z2tV8r1Dxys1Tvw9X0LkNKs?=
 =?us-ascii?Q?V/9KAQJdbcG2Rp+CwqliAaVWxe+Wd0Y+VKDJQKVNglHcMzJH55kk+mqBpi4M?=
 =?us-ascii?Q?oL2eGtppMfqOucydFVsaxKQO5Cyvo8gdzW1UlSKwtA2iRSNX2cI4Nmg/Rv2i?=
 =?us-ascii?Q?S4BygLDLQcqn5bVz5bIs2r23n3xInr0d8LMjyCZCUy0SJe+7XEBEo5bb4rOQ?=
 =?us-ascii?Q?VVBLO1hJOhHucsOuCOaP5dVu8g3mMW+dAUVCpTQet5Y7N8LSf27VnW3fLIja?=
 =?us-ascii?Q?w6QmQc/uveM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP192MB2225.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AjkuLGMyV8MytdOs2xUXIiWzOIPklcV4IJsMihqYlUF9bnarch87wH/DLo5+?=
 =?us-ascii?Q?5kha+tuQs2Bh9KhkcD6XXPGrdK++rUMX2aHVURnfCcjGAMl6Kk4GRN4HNzoW?=
 =?us-ascii?Q?XNWl1axbpmbNwx7kYmlyodPzYMsJlSZORgCmvEzLhbIXMaC43Z1ZKUsdkI3k?=
 =?us-ascii?Q?4jlUZTTZ8GSu/Gv9lQwlXKNksB/ha3Ig+0A9B2GuNcaNM/6p9yfGU7z4IkeA?=
 =?us-ascii?Q?IJTljpJai2bIcQ1Bx0Z4dfzIhwVJxRwfiQNV4yfCaRCPKRIS31/XKIo8M0Cf?=
 =?us-ascii?Q?IvXBEqemKo8lYr2jDt2RVbhsxb4EG8bFX+BgcAedZNbYfMDDibCZATEi8rGn?=
 =?us-ascii?Q?lwgXZSELk/cuMVI20gnXnlP5leJQuyeUoHLAyCdaBJZAr/vNrQEZVT+IiU2K?=
 =?us-ascii?Q?9XsnlTGShJ7B1ekAtdBwtDbLwVPdJ6aG6zTBecrP1iZqdrJylmqNCxnyLG4D?=
 =?us-ascii?Q?X/g3/tBCDNchk1lep31o0KrUFgOLMNaCd5Ldc6Go4nA4XOAhBB0+HW1Roy/9?=
 =?us-ascii?Q?qtWlrsbWgG4H4UP7KI1oggyLoN47n+znizXzT6Rrnc41oGr+qJmGWdpOEgaK?=
 =?us-ascii?Q?1fpmgGvITXs8XvX/vtmyb5v0crl4yFurw3uiWj/h8KDTHSnkEmAjHGwiBgZT?=
 =?us-ascii?Q?BMSU8nnEisqdaGhsRgPjx417WprCgArJsstC0kqFn/g2pXd/LQqntgCtIAXu?=
 =?us-ascii?Q?vbrwludwNnkZeh05TMayUpF+ToqQae/2cfUWSqk7IQMv+YQhYDXiCGZZLjkY?=
 =?us-ascii?Q?tjxY2WcvnPz6zQ/eWxlFOSovblumWxZ7Rm0/0g1mCgJVl2QHPXjzP88z/glA?=
 =?us-ascii?Q?T71677bG9UzuGjCPAOoUTDjD5hg3BICf+vebQmfibI4QVBbe8UZ4LdOf1U15?=
 =?us-ascii?Q?HLhxauFITnsdYoKLDImOPAuTatOIrhCniYo7mjrpnwfM1JZ88ht+xYhPoisD?=
 =?us-ascii?Q?c8JWNqItvhxg8NNllt+jdcye/bDhcBsnvZeOhU0GC3olPzXBXqN0zwssqzHj?=
 =?us-ascii?Q?nn2Rqy2S2GU2BcbPG+Ov7jvTd2mYcEJ4m/XFitqyeWxG9ex4U57c0WBCb40H?=
 =?us-ascii?Q?4hpPQ65j+TjSmmAgoG+rqP3ZymUfDeMpk2lQHziYWidUeUyIqEqToNs09rPw?=
 =?us-ascii?Q?6JhTyRyVgeAY2h6J08a2PRpY5jEmBwSFt1Ql+IqkXvoml3tRMIUrQxxkBMpw?=
 =?us-ascii?Q?i5j7YnIwPPYW4FGbi641SDhM2HqwSykkjY4W+O28GE4qCxiKOFkpsQhlYlJa?=
 =?us-ascii?Q?xLcKV5Nefr/5r277XbAsBieEeTouT6hFKWyAr0MThzx5z51wZpZQicU7hE+B?=
 =?us-ascii?Q?ktdta6LvKp63jQuovaiToKWI9+qU8kPlMPGAU5IaCE0ZXOCdMkJNfExKbuw9?=
 =?us-ascii?Q?24xGi0JrkAZkOQVfbIOkC8dTdTFRMmAd5lu+pLbYNFlCf1O0Dhqw5khIxTj5?=
 =?us-ascii?Q?VQjMi3IiLppW1icJrl2A3cVzU9Xc0BUF+3/P56QP9gQrkBvZtlYeM+IDIb6u?=
 =?us-ascii?Q?SuI+xSFr5rtHv8nPeLJ01ZCz1rgo3PfXL1t2sXwRN9OSLPxJ3DULy72s0xgk?=
 =?us-ascii?Q?Ws8iidYIEpT5MzugB9ddLy3fa/caUgz3TO5QNwAEQBoE2OZOmw/X+jtWettj?=
 =?us-ascii?Q?YdllQlIE7gu+A4Pe6z5GLO50lrjb04/+21RvABVDLVPC?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9addd1-0acf-4305-eeb0-08dd97739066
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:54:35.7927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drPwER1IYqvQDSbDcuVjrre/XBHmIazHhqvztLEL+x4stznKpYUxsUN+Nmulqn7c+PyDE7MwR0s+7TdK93kvug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216889

From: Frederic Hoerni <fhoerni@witekio.com>

Add dependencies on all eligible files in WKS_SEARCH_PATH.

Before this patch, adding a wks file earlier in the search path
was not taken into account automatically.

To reproduce the issue:

1. Init (use default WKS_FILE=3D"qemux86-directdisk.wks")

    . oe-init-build-env
    echo 'IMAGE_FSTYPES +=3D "wic"' >> conf/local.conf

2. First clean build

    rm -f wic/qemux86-directdisk.wks
    bitbake core-image-minimal -c cleansstate && bitbake core-image-minimal

3. Create an override for WKS_FILE (earlier in WKS_SEARCH_PATH)
and introduce an error (a very small partition size) so that we can see it =
happen (or not).

    mkdir -p wic
    echo "part / --source rootfs --fstype=3Dext4 --fixed-size 1M" > wic/qem=
ux86-directdisk.wks

4. Build again

    bitbake core-image-minimal
    ...
    NOTE: Tasks Summary: Attempted 4670 tasks of which 4670 didn't need to =
be rerun and all succeeded.

=3D> Nothing gets built, whereas we should see this error:
| ERROR: Actual rootfs size (28713 kB) is larger than allowed size 1024 kB

Signed-off-by: Frederic Hoerni <fhoerni@witekio.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-rec=
ipe/image_types_wic.bbclass
index 61f028bd7b..33773db2e5 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -45,17 +45,11 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUN=
DLE', '1', 'kernel-artifa
 WKS_FILE ??=3D "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?=3D "${WKS_FILE} ${IMAGE_BASENAME}.wks"
 WKS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPA=
TH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in =
'${BBPATH}:${COREBASE}'.split(':'))}"
-WKS_FULL_PATH =3D "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('=
WKS_SEARCH_PATH')) or ''}"
+WKS_FULL_PATH =3D "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('=
WKS_SEARCH_PATH'), d) or ''}"
=20
-def wks_search(files, search_path):
-    for f in files:
-        if os.path.isabs(f):
-            if os.path.exists(f):
-                return f
-        else:
-            searched =3D bb.utils.which(search_path, f)
-            if searched:
-                return searched
+def wks_search(files, search_path, d):
+    from oe.searchfile import search_file
+    return search_file(search_path, files, d)
=20
 WIC_CREATE_EXTRA_ARGS ?=3D ""
=20
@@ -160,10 +154,6 @@ python () {
             d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
             d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
=20
-            # We need to re-parse each time the file changes, and bitbake
-            # needs to be told about that explicitly.
-            bb.parse.mark_dependency(d, wks_file)
-
             try:
                 with open(wks_file, 'r') as f:
                     body =3D f.read()
--=20
2.34.1



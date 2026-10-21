Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9834.1792584376533341928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 05:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HweCXHuR;
 spf=pass (domain: est.tech, ip: 52.101.83.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fbyav1N3i6r1GCu95cRbbvhDZkSsB5jI/6rGNpdNAcAFHfnpcVcJocuu0+iy5T9ofsuEUNH5VaDTDRJhopJUyqbFDmqB8tnpRNaNHMGZICvGDpCFimoiTB40H2/vJv8Kl3XFBgPUCt1uNinS6Z66iMBVU3m6hGDBr0WL3aeAyk+ZQ3jQX2d6zNYKV3uIozT+JH9P/FCmC2ZOlyTKJIwnjScVWdGVt4tVzb8X9h6zsLKJ4jVxeBvC5soDSrb/bmKIqALeFEsWKGQmjboYKafU1S02AQ6a6Bms0zMKGrRKz7jV9HLh2CF6dz3aRNu9cXVb/a0W5ITTD2UY3XVzYprMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KZGX+YvEq5phNcuapN/LBZ3hYOpzwFFzUlvXLb0Nvw=;
 b=AMOW2jVF1iCziFBfZsUS9j3rDxD5KH9ksI1IJiRp7EcxoVBUxBd2/xA2Wqy3Zf8XxCH9bN5IP4RHr127jolutgSmxa1i7nRFr6bfQPXfqGw4tIqcte8ovVSPpiMGwY/L1uAiVKJ1K1Qpayp3OeGo1QV2EqMPJrtYJxf9a418tKZfaFsanpQfwlinzN1Ka1heqRK7XJ+6n27MzTUrk1onekUDal1FVGGlaZMTvTjtKbs9R9Jg6ya6uBsna1ECxcQZKLWe/EQ0tZDuI4uGSlUbITLq6GJo2Fchlkhyjzyfyh7bpUzWykgEgERsJPhMKX+RwUrA6L+cEscaIzdr9d+HKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KZGX+YvEq5phNcuapN/LBZ3hYOpzwFFzUlvXLb0Nvw=;
 b=HweCXHuR6tzloyJhcTKptaZn9uL6Yid3MOwiiV7XOfpAycgFPQfHM8YYwmMG2dAvV4h/E9H59RaO92dyJJu4bA/9auS4gLUCGGEQN5A8fIhjC/UewdIlNyBPIrvXCbIcF/8sFwcnvREIb97iMk4qIpldHGPVCbrBDDFWVPYEnwu76Y01ZQHGevY6m1FpgCJW3SNu3LDck8NRGVU2YZjSA20L2x4a9MG95r3WYVtSO4AESTNS3qeDCbIt753JMBtKqJXhYxTOMcM1zX0fNQWMWfsJVxzZz6jNdjUOITTLbALjkWzmlhgilD2pPBfKOywkJ4OVsGH2Qx8VcRoLYvAamw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3449.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 12:06:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 12:06:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/archiver: handle original sources unpacked outside ${BP}
Date: Wed, 21 Oct 2026 14:06:09 +0200
Message-ID: <20261021120609.14844-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3449:EE_
X-MS-Office365-Filtering-Correlation-Id: 548e6aa0-a152-4c29-9435-08df2f6bb25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3+F4YD4a7gBDCXUe3KSZiXpGiu6PIfzofCYEyZWONEZDjI8x5sSYI4iw6asAsY4C4jbjXq1uRnAOEJefkMt6IKZbE4VJqp6M/5ByjWB4mTjSMv9dedncf89AD69SLkWH9PkIJ4yC+odQ5jnAVRmiOTtZ+AE1P6mBMQmv1p/84efpTvjrck5ETLwFu5RfhoyRbI0JRx8yPjhLh2++SZR7rApTe9FHKMncFGPS8vtG5pFFhuRVx/PAtlIRLYzPE1UKwprzhTxNyQ3KxGrjnPv91eGo6kPQ5yypO4PKewNUyGq/4MXc3yq7a2lVTdowcWgTfS7WUdz4QK8Yk8D8FJPbSrKe1OOSx8yIX9IBnJOO/NiXsDS+i+/FWgcgq+QqxeARk5TPi5x7qiH5tDxGoKyFk2rGy70tOCOStRyIlS+luIwK5hjCz9gTh3E3Art6YjDHK9rhU1EKYU8X/Ih6UvgiaFlOWQx9mPARp8L8GDEyESxU4k05tCMBhSsv9LzLcXZ74qEoN5qfHIrWjKgmcYiN34qBLXWqD8PN4e3XYgRLfQgoB3Yu/My/NwOn6oJnt1OiRQj0559t7UcUWyXl+V3BF+/ys/hy683TQXVCJsSjWvxIX07vkTUK2CIQ/xu9MvlxtHDOkGOKE0Lxe3JMznoA7Nek3lqccoBPnE5SMP2kVWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AwPGFBuT1PE1IZ3O9VyXuIzjfsu8HlctQo0O69LH9lzLQMmeuya8pWL/uk3w?=
 =?us-ascii?Q?zZzxRQE/mkJMqKVtoIL40rHf+/FKhbPn9NNAv8Npm7OAldNJNA2uK1db6A/T?=
 =?us-ascii?Q?z9ASjFxz2r2F0fU1hUveCD60HhVh/wsn3jkgUffGi9KvyL7Dzx1QZzhx3J1g?=
 =?us-ascii?Q?0OlZl1ndb3Cttu298UP0H+81Q7qSp3WLMhNGZfRBPmqjQj1ASkhRTYmnRidW?=
 =?us-ascii?Q?W8Qc8lZ1gBL/bKyYCzWlqZLRiJ3k4tkwok9jdmfbm+TX4A73t7soOG2qAFEA?=
 =?us-ascii?Q?35dxQbx/+zsitvOg8aLhS9EDUxgZ12AeMiPDGTAWIGpnn+ZMoPQyJBhOdTQG?=
 =?us-ascii?Q?VO11NTvKEhD2/gc55visjIsX46verZcm/SaolMSSmT7QSrc7vPLtDkip/Ok6?=
 =?us-ascii?Q?u2rou2YFjbgsrFVN/km1Xe4ptRKBYpq2ONjFpbpt1u4UE2bQtU3fpXMiOy3y?=
 =?us-ascii?Q?ht9MdmqbqFJQvNJZubTeXdnyDzDrYsrVlnclJ/8kwnpLUOgnpgtxNHZLXGvu?=
 =?us-ascii?Q?pfOOAzhJ/ZjdERZg4G4DniuCm+sxn3g9hC8MJdzp1zG4tkocGeIHpyWVSG6r?=
 =?us-ascii?Q?gWoI98wvbafLldvwk4O1pwWQG7kffOeVitm2VAksz0qAscfBSOGIgfVYDGZ0?=
 =?us-ascii?Q?0CIXi5xUv1NuVPQCO95J7pmmRU7wCDMaC3k8L4zPQHQdIvxTWqZR7rZAsTX9?=
 =?us-ascii?Q?Pyv5LyFu6EmTduFYbANkFfvfwOdPpJ/Hp5QJ+WdcM5jECXJ/aw4bXX4mo96x?=
 =?us-ascii?Q?Xa8aRf7PDvpQo35yNLa8e26zsOm/BV/Ryay2SW7WHfGuoRoGjIzYuIf9bgWP?=
 =?us-ascii?Q?GrZoHYZSOVhGq4cVb9Cl9EmODXOXA1P9Ww8j6RVwGnq9fzqqZuVqIvWxwYLk?=
 =?us-ascii?Q?rRfDfR/Z6ZMW/whj337nK/Z1kt9TiuxOpzeXVTLljQsUQw+8RbtEJrkEwyR3?=
 =?us-ascii?Q?pRDRAhA1JoRskVEzzhoUptOduv4Vqt2dXpMwPHG1bY1B7l03zo+fwBzvf3lL?=
 =?us-ascii?Q?gM6LratjzL3KQJVvqEftd/OAYx6vD6NtMosGCBGCrJ2VzP1Ww+sZN6u9cv5U?=
 =?us-ascii?Q?WrkYydy/xwFOLdPbJdXMwsGbrcNDJDxLI5LhtZI61x4YUqaPuSkvl/o57cs5?=
 =?us-ascii?Q?f6oOOSEHRQyqWvbnDFyvfipp+aRGkG8RhvpjBpLatv4i7EUm3tuGrHUxYqwD?=
 =?us-ascii?Q?epi2HCc67OqQfYM7D1eC8tSRm7GR9LxYf4hWn2oqgtk2YOEk6XqUwt2FHXlx?=
 =?us-ascii?Q?vShyUwMeWGRUdnGucWNbik41RxuqrBXwfgqUgWn9Y8b0CVt+6jD1Y8cnnDbh?=
 =?us-ascii?Q?43F+22iZ1KDx8htsM+gGqahvC53sBvSRpx7cJd2ZDT2AyUMyJUvGFpS6pJ2Q?=
 =?us-ascii?Q?Lpq8rimkgdjxbus95MpfVA+iFMhK1epkRthYXZlSv72OvEMry+8SQQA6Vw3r?=
 =?us-ascii?Q?FXdTrG4hcEpYvbtNPyux5wvtub40CBM5/zqWCsWUYRRSNvL/i9XeMA0wSuPW?=
 =?us-ascii?Q?LJylfoagxR1QyVcsYs6ZHU8Xu3qaDRcoEwCmsKEwe2d6N+vxo0qJVQDopotN?=
 =?us-ascii?Q?jbUAeTFZPrmf2TbYCv/iXN5h3nwqT9BAXn5nPc+hFKGoG+y/AjK0xxn0xCy8?=
 =?us-ascii?Q?GjwKVgMzYH4fiI98KOoeoeW/zRJHXp4V+X2C2VsBU6zrtjpTUx83A+BL6TsN?=
 =?us-ascii?Q?BxyylcCYiWc6ufo8VY+Om2mLINqHSHfvgRJ5Yyv71xgnsH5Fn0Y1iO+gDOPw?=
 =?us-ascii?Q?gHeQKF8zew=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 548e6aa0-a152-4c29-9435-08df2f6bb25d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:06:11.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfaVGqxqE/lTFTnqeUVgHOfcuMvYeL+5G5N2UaPwn/MyQSaWXPIJdx2B56wZw4ed4EURz9HVoCfrYfSHH+/AHzsXzMkaaoyZe/Rf8UmiseY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 12:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248394
Content-Type: text/plain; charset="utf-8"

With ARCHIVER_MODE[src] =3D "original", do_ar_original fails if the
source unpacks into a directory other than ${BP}.

Commit c73dbd0fa8a3 changed do_ar_original to archive tmpdir/${BP}
instead of tmpdir, preventing the temporary directory created by
mkdtemp (e.g. tmp8pu2nsck/) from appearing as the top-level directory
in the tarball.

However, this assumes the source always unpacks into ${BP}. Git
sources using 'subpath' can unpack into a differently named directory,
such as tmpdir/tools, causing tar to fail because tmpdir/${BP} does
not exist.

Use the directory created during unpacking when it contains a single
top-level directory, falling back to tmpdir otherwise. This preserves
the existing behavior for release tarballs while supporting sources
unpacked outside ${BP}.

Reproduced with sdbus-c++-tools from meta-oe:

    INHERIT +=3D "archiver"
    ARCHIVER_MODE[src] =3D "original"

    bitbake-layers add-layer <path>/meta-openembedded/meta-oe
    bitbake sdbus-c++-tools -c do_ar_original -f

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes/archiver.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c824718a1dd..29e0af648e6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -230,7 +230,14 @@ python do_ar_original() {
                     else:
                         bb.fatal("Cannot determine archive names for origi=
nal source because 'name=3D' URL parameter '%s' is used twice. Make it uniq=
ue in: %s %s" % (tarball_suffix[name], url))
             tarball_suffix[name] =3D url
-            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.'), n=
ame, ar_outdir)
+            # unpacked source may not be ${BP}, e.g. git with subpath.
+            # Use the single top-level directory when present, otherwise t=
mpdir.
+            entries =3D os.listdir(tmpdir)
+            if len(entries) =3D=3D 1 and os.path.isdir(os.path.join(tmpdir=
, entries[0])):
+                srcsubdir =3D os.path.join(tmpdir, entries[0], '.')
+            else:
+                srcsubdir =3D os.path.join(tmpdir, '.')
+            create_tarball(d, srcsubdir, name, ar_outdir)
=20
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')

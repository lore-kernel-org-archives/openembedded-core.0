Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB041C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 14:28:39 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com (outbound.mail.protection.outlook.com [52.101.66.100])
 by mx.groups.io with SMTP id smtpd.web10.22117.1739543310966461772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 06:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=X6nQagOG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.66.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iINrhZr2NyRk7R3OHY4avF7p66LmF4wpnBod0f4wJl0l91/6jGqM9GcMOVmAKWp7HZFZjd4jAXGxuuOrjTfjOUIDSAV+5O/NJv6sPX7a1Y86LTkdhh/M4RoDrwFwXXPuGBpy2BE717UU/iu6I0nRwwNYTrCn8BKMK5CiQPSe4BElZ0HbJUXIVvgx3zIqP+h8jb6cFz1b+J6vrQeeYgGZB6K83fe4vNHx2920KlBzUgDG7xWXofeks7I8AdGd1IEB1jo3l2d+6QXyCDc0Q6zuYusKNoBKkph47zJoNHs5e419wp73MuFIqbtoL3KhgInquy4kNVHD3V/nBKwjuhbILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsxEBNgclwJasp4mZhsv/7UphTmdpn29FEC/bAA9NGw=;
 b=cXKmpYADdQIit/Wd2dz5PaUGagOifHMD2In75AeaJEHVRzrDSO5W176hlg3Z78MlEh9qlmB0bkVJlCniLDYZkBMyBiDYSDD/EKpkb4ppsyjohYrNgf9ylY4lY8FD0Zx+GPdY9UqRP1fChagt08v850Akkapsn8QVHca6eBB63u7ZruQUSdi6Sw3FaqiSyPNnxBmH8Iq9YLe7ryVe/dMvTFqpn1s1iHtGPqo//Sqi1Jta9uV4YqHrMx84hkYH6q31TbLnFNRL9QwpqrjXA4Izg0hDHQixh2PBzEHt7HWSimKmgW8k18mtF/vKA7JQY7sB1s9vIB32Y9/vnjxpg7is7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsxEBNgclwJasp4mZhsv/7UphTmdpn29FEC/bAA9NGw=;
 b=X6nQagOG2C5eqZP0gr3eiwgVHsiiXe/niFJLOvS2EJtL/pLYRd5WX6I/5xW7Q9JYCmGTCF4NbAe6vOVZAIW64+w8EdVFfaKWfEz7IW+VtijzH4kZMWywJeY/FWGTimIibtaTBDhnEGU3nF8JdDzd3L8/BHTcXxxyoWVIX/8cGbDZdh4Dcknq5FZGgs2bb+p32H7wyYWmjfPFRlmT9hxYjyQMR7sZXcbQdlgevWS/TQRpXowXqJ0Fi8mlc+WvwcAX9cPyj2HCq5AQWufT+tXfqV820M046sA2pp+yTFvW95K65A9W8DAOS90c7UhD/eVrtqtdThijsq75kglFL9A0aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7339.eurprd06.prod.outlook.com (2603:10a6:10:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 14 Feb
 2025 14:28:28 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 14:28:27 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2] cve-check.bbclass: Mitigate symlink related error
Date: Fri, 14 Feb 2025 14:27:56 +0000
Message-ID: <20250214142756.3320169-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fe8e7c-f0ca-4fef-8426-08dd4d03d916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5WC95YkqXxmkUJrt28omnt5jXifszVt0inGsdNfWYxgTSOo3pjG1EDI+xDs0?=
 =?us-ascii?Q?OC89YurLI7RJ1b9WgfWnvTqz+bgv89KUULUbbqvqsHKtGYbrmI+mNsKfXGEO?=
 =?us-ascii?Q?aGmI0smS6kSCJNby7jcKaN4O6XorQOJUszVhD2/VowJ+lJBzrLLCC0SrkmV+?=
 =?us-ascii?Q?VqNaYGZiLWLT2BuWxPFQHWFNe3EoIHKWEaav2pCM721qDHVbOrqK9ZgijtK/?=
 =?us-ascii?Q?U6u+AjeH1AdE/OIEhVN+hmnqPRi5NOymmzg6fTtdplPekWKyy23cAnPWbHpA?=
 =?us-ascii?Q?UrsrSHevx4V4YCFi5mJuQ9+Pqv2ROYg8vjUN7Zrgu4sIFcKZCsf9pZdjx5RD?=
 =?us-ascii?Q?NmVYgquuiE9zPMsqKqajsDobynWAIyMtLE4Rkg7+gGWCxt/I1tJ2dwdiprQT?=
 =?us-ascii?Q?UvV/ZwtboHpkZP5n5L6+9DbV8nXnJ5cSz9qNx0HEO9CA7CZK8E59XIIKcJbj?=
 =?us-ascii?Q?zyZeSPwlBXtoK+wfR0EWnBWk/aduSFE5WrJS2OgRF+KaRK2GfxKLFmAs8D3K?=
 =?us-ascii?Q?XxhBOR5OGqC6UGU4nQktppxmZpHEXq6z0NI5UbMU7YmnD9JZNFjE2Clk0vcQ?=
 =?us-ascii?Q?QfkH1hC+jKHxNvLXaVFc3iUqrT7f4XJd0MIJKS7XHwcx7uvXogyFBZCfUvfC?=
 =?us-ascii?Q?qh/tPNysRTvbDKbjQI5nLFfvIfRgkd6oIiFvWA5MuNV0fTdjDuDk2d0smKmd?=
 =?us-ascii?Q?/b77TpvnkTaiLY05DjhTV53WSBAh31iAXuz/a+CZzqYsfAZt8J3D32z8jVv1?=
 =?us-ascii?Q?ukRTzgH+BHJWCTaVVoFXfow5I9qbJjZ8XV1gXF0QvpupDYzA5zQ+1ZRbsEP9?=
 =?us-ascii?Q?sQWTdHVtBpI+cBRZeSHn5A8iUmVcbf716upl+jZZ+Qlf9d2ajF40pxBiW8Yx?=
 =?us-ascii?Q?iPaj8JgadtE/tMUvIQwMTK8t/qiRlRBEt4L2VVLQnu87J62zesqsZT5bFPNG?=
 =?us-ascii?Q?8VhILkDi3ScdDUi0zCqzkOIQFUYTFXqB33ie//woUenmph01hp4ehuONoUw/?=
 =?us-ascii?Q?q0gaBcCSBK5H6myh3u9kKm8G/WY0S0mGiY/rBODyuXLS974NB6gtqi2XTBUO?=
 =?us-ascii?Q?UNiznpaEXCJ4S361BRW3HcLp5cEEAAgtT3aM5/6BrZGSiBtDwRkqjGJ6q843?=
 =?us-ascii?Q?odrgJOPIggOtjmSz6LQtiR2EXTRZTY8KVx9zvxS8cm39W1YWkH4PRU1uJ8Uy?=
 =?us-ascii?Q?RyexfTQlATa0A6s7q8sL/y6za1B7w+lbwkmnCmPO7iQSzh5Q695Z3SOxQwuN?=
 =?us-ascii?Q?3Fju+3u/sOW0r51VGGbEozamWYPmt2r44ttK9JMKrUg03JfC+G2n9/seJZR0?=
 =?us-ascii?Q?zrqmLWgkFhbLwoXYeKcuSxyUkyHJTYjhEizalDpDF51aPEEPexbAx56/0SFk?=
 =?us-ascii?Q?N4Vlx5Z/au2KG4pb8J4E22aVmrUrBrWd8/UMkcNmgr7QjYUvSPWDCkKYpq/w?=
 =?us-ascii?Q?LHkhk5qhiBkDla14GV7isrD/UNvn0/Fd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MAYawNa/PkiySi0fDAo067QkSCewivzEgvunswCaqHY6BIZq8RG2jo1z2idM?=
 =?us-ascii?Q?qlghGGGSvyPrkWw3UvCxvb+ouKVZGUONToTTGxYQtQLcfGJAfI9IiT5ytTi4?=
 =?us-ascii?Q?+8R3ET6YrwlXVgHU6ht8y95mMPFQe5p7PxueLvC89zUeLjIC3pvJ7pOtQS3j?=
 =?us-ascii?Q?tuCWF7rJDz721tt4RLQaHGCJmeSYZ0r5W3BUJ6C6IGkp3tsZD8ftEpqiVuSJ?=
 =?us-ascii?Q?MKPCslUMIyPkQYNb4H9n+yjELwPkdyTtd26jfnHe+EtM/yUM451NfVJ5tBKL?=
 =?us-ascii?Q?ZVpwnFC7gBYFYUhk/7dRQbF0WATdJU+KVS/3dLd5inQ4rJBGAuHn31KwsO8Y?=
 =?us-ascii?Q?UQfjnb/3ZC3G9sqg/yfsDrnQCxp33xoxpPEonYZWAhZj1XkUuGFRtnWmauLQ?=
 =?us-ascii?Q?Cdr5lzPr5bU9VfMZSgbd8FRs6crMHZUOFw5gFyJVdekCsO0PzEB0879Q687c?=
 =?us-ascii?Q?eYzrpW3yjkce3E1/dEoc3yNeXbeXo4L7Py+rt8nXlu5KYV4snuWTkApUt8VG?=
 =?us-ascii?Q?ZNPlPkFuCSQqkztOdi7O1Cm4JY27YRhYP3M9Lzub99jpLJMZ45hcpkFe5UYI?=
 =?us-ascii?Q?IbsmvtySTWsQmuEn+EUBBPpWyxA6QdXZCiaNftWFEpM2NsW2q/PGjIFXfX45?=
 =?us-ascii?Q?7DqOtue1O7OXH/hYntx3kNofHg8ea/Xnqedj1LBpCqLqsNvxoX6T4MzbT+fs?=
 =?us-ascii?Q?z0zueUnc/od357Oz5ny6GVNQdi1nQI0duYjV7LPQaBBnHaGFASA29u2ld9wp?=
 =?us-ascii?Q?e+FOIg4Pyv7ssrU8ukTNIk2vdj8LPrBJ/aUw6F0dXhSlyzE5wVAqlxYMLnm7?=
 =?us-ascii?Q?GoD6ACfI18MvvDH7YYlGOPjgXvD2uQWtDHkn/I7wl4a91hymnzwxVWzByvMl?=
 =?us-ascii?Q?YFF55dVEJ3G9Eysx9+7JCTB/IeY9pBS06rNPYDsgjHIdPhUgcA1/FR9ZWK2n?=
 =?us-ascii?Q?qKg4XpHRVEnX1cZDMiMBoTLtLmqC8ItZSlONMXFBF3iN14MSB4XpeQy6m4iD?=
 =?us-ascii?Q?jyT6K9o8ArLA0QHKSSb7juAWqkDoqamkrVfFYqBdpavwr5+QrVKIyV0Z3eJ6?=
 =?us-ascii?Q?0BOgBSP7wK8kQjtD23UWrYemjW8Y3i9LtyeN/Xm5ISSGlnzVeM1wezDMFNtY?=
 =?us-ascii?Q?thzWJCmPgZOP3sKnJ5HdnERcmARp0OO7diBVPzp3TdWE1DbXCSq4FH2XRAK7?=
 =?us-ascii?Q?0CAQbGVzFMjBbT40Xa/2TzN0Q2l2zVl+QNzcsoy1t89qIe/apG1TV/pKVtil?=
 =?us-ascii?Q?NICuiX6X82vyR8sdb+InI+5fcNJd04FuxxPbzINibitWhkab6SrtESX7xMT7?=
 =?us-ascii?Q?cl3WjDUxdogzPSU3W/ISdjlkSQGc/HCig5DGU53SYNE8+LXilG4LfEdmL9as?=
 =?us-ascii?Q?+MKEQHyufQBBMqejc63Y03e0pg8ISsw6MHSSexhkrNGzfeHCrmxbGNxfcAhz?=
 =?us-ascii?Q?e0gcoZ0VwgTM4fvgV/NJAk3cPz1ZK1MlJ3H5YNeLOnLcUeG7rU+zBjWyTQNZ?=
 =?us-ascii?Q?ZGXzisByp2r0FyxutKbAOi4a7PIaRvTMO/EudpCqBamIVbu1V+3ymc04sWn/?=
 =?us-ascii?Q?0sifCcOQVfsOCG8x39oHEX/dofahTofQ4e6eoe6dK7lOWWTmHWVicjhz+v2I?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fe8e7c-f0ca-4fef-8426-08dd4d03d916
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:28:27.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk+leRsjuDhImq8Yky0RxX25j145oRa11vqvRiutAApY/0vpY1JikCjBn/pIpMgrUPe78sCb9fxprkmgvcYM0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 14:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211391

From: Niko Mauno <niko.mauno@vaisala.com>

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

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 6e10dd915a..190c5b9a80 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -244,13 +244,15 @@ python cve_check_write_rootfs_manifest () {
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



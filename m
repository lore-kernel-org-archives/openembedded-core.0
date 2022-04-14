Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7782C636FB
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web09.10273.1649934427667953625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=BQqZLnK0;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.53,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mhf/JoFi/eqJqK1P0SKFEmqTRzrYiIOHQ9fLpaCYElpSdL4NMfsQ3CO+Dvd0PadrOrekxlLq1Jlj1BNDUdqm5M5QR2I8bl+ZLsZzkds9AXxw1mb3IJFKEf8qBnwUckv9dTML8n9j399SXaVnTOrjVylNhACszjmaooHwcPuIUJ/1Z+VzMnVKhxMICdnfaACZPUNAP5b2fFtgqZxfsNda3NNorYap83oCSbL6mNaS+hcCgFt9oNTFTUV7356laS5ECS8XuPA+PQc4gr5kgCCWKn7GIbaR05R21UzpqTbqKmnGyTgYmjm3MXuCcbg4SHyJBWbD3JIVBg4IooHpwPYj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8RX0Nkkv5IAR6mgRqC2ZQmIEPIiGpb+vPvTcSCqyt4=;
 b=KFR1XQoqjYXdRVUoWTO7QLDyGCIS5AtihA/nvKiSWhdVgVQavG8E4sB6OzwVICV6arRmPOws8toSJrkTmCUlFd0D7cipULCtV/8UTSjIWtPqGLckYuKHZyzW+iUQ8H69CoSkCFyL53TrOcgY4sZOsW/XL9C/z+kAYCaQEXZmNLUITKMihU/PP0hlG3YFUKWk4CkpcmpHvFIsXqFTAQOxou3nfgU63hEoQAwIp2vvS3yUAGgtip76OJxJ9LYLvhQyqrtI61zrGbNtOZDEkhGmDNSDfD8MtyVugvXc+ilOfVnEApvhJjMG8MTubCfZ0MW3FLOREHQRaE53+oxpZe1kPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8RX0Nkkv5IAR6mgRqC2ZQmIEPIiGpb+vPvTcSCqyt4=;
 b=BQqZLnK0G7Mn/UFTimhUDwXNO7EHWTzR89o7LS9osiFIgOdy1Gl5z8xs2q317oBXScVXIEsUQz+nFgc3+dQrI4eklPkXnTcU4xaL4pD/XSF1BvrGc8UG/9t/WdZLpPaJFFdRtNG1r/QJNmdxw3crngyQst5KwP/Aj8zgv73Jyyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DBBPR08MB6169.eurprd08.prod.outlook.com (2603:10a6:10:205::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Thu, 14 Apr
 2022 11:07:03 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 11:07:03 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <bluelightning@bluelightning.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] recipetool: Do not use mutable default arguments in Python
Date: Thu, 14 Apr 2022 13:06:35 +0200
Message-ID: <20220414110635.8495-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9P194CA0022.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::28) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ffb3b9-933c-49d7-5456-08da1e06e752
X-MS-TrafficTypeDiagnostic: DBBPR08MB6169:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB6169ECD63989D8267F403EEBD7EF9@DBBPR08MB6169.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F3f7Bo4stBDfivyKQrHOtPNigfXuumYZyeFYx1zRNuFVQZM7aNLLgCPFi2UASLRcPvD6Ge4sUWtuVbuJ0H+iimwnA9SGtC70mcjA16FMlBYLSrUJVjQz/LfZ8nXvr9xEKkaaj12Zo4M9Ya4zf7OScCKIn/fOpMr+N3imvPH4RoOgs7sDp5BV2KqDi68qmhD1gcd9SI9VArnG3NF81LHn1klPdzPzzM23MFa2XQaj334rO0VSTfVf8Jdggw2KLtb6WCtoC17DaNNONYfzUO6gF+8mOzGberlil2X+grQZHTkblKLan+w5dZfi/s5vlOLdRUJTBL8bhykeKoCL8LrCfB32Xfpq3+vZYuKwrz30ueJyyqJx+svrh6QG0FKW6BoHwwu5Y3Alf7xLg4Vs3lzMLW0o0KTAbqsJRdgIB/XbkBSIQMTZxJiM7e47ajDwVg7kBjWBf4CbJZol9CqFZGLOvABipcVgFNwq8F0fT11bFWMrAMEnlTm5cb0IqdXziGAFzs0150HC/Mcv7ORUzEuVe74oIrjDHmGvluO8LHI6A16kh+X90BcM4DPschUJ1z3rENmrr+K8SBXQJQ2xUgQpmHt+OOqJozpl0u+ffSPwM55xq9+p/MEv+aRh6iCA/NPA4ls91m7maX3H00q6ebgbDeIRz1lQPP2dzQEDh0N2x1vfL21Wc6j4HJVqFU3XzH5JqhdTwm/BIl7szirscc69rYlgRMgcM1PbKFNN2MdTD81LcEqFxO+fm4Ux+gUOWH09seHYa/Dw8D9bJjWFwbUShvu66RXZ3BNZjamp9GPruzM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(83380400001)(38350700002)(6666004)(5660300002)(38100700002)(6916009)(6512007)(966005)(2616005)(52116002)(8936002)(2906002)(107886003)(6506007)(4326008)(8676002)(66476007)(66946007)(66556008)(186003)(36756003)(86362001)(6486002)(26005)(508600001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D1/g36ZUqMhzIP4MQ27mVLLr83N3RaSvndX4nZxeqDkMCfnkKtqjpaimJhad?=
 =?us-ascii?Q?sBGH3NZoG3eBJRkDXkQctc6HgBxxd02UtwSGMOgwP3UtPHyP0HME5EUV3BGQ?=
 =?us-ascii?Q?DiKStWCQPQXBNv5XImxJM7Qc2oyWv1oWntcUxw4Fe6jntHshs9ztgMGx9oFO?=
 =?us-ascii?Q?X95M/iWgpMD4Q1JZ5Nw6SsJtexQgrYUrtaEmJVdch505+pc3dACZcPJbrQqn?=
 =?us-ascii?Q?nm44PjjPnD5Fe7HbMJ9HcHpVhEsuRpTAONX328mGdEr9dFpybqYX/x3Jq9El?=
 =?us-ascii?Q?TP7/8jeOvhcTuugmwGb7/fb5eCTQ9gtPyeChC3lN0gaYXInbg0xs1HvrJuNe?=
 =?us-ascii?Q?LUge2h1ZtXf48EbYJDoU/eXi3hnxY/7lEvXGo9SfUwDPr+ZmXpjpTht9I+6J?=
 =?us-ascii?Q?/MyDhsQEhbpvHkW+KWNqcfPmjnNDEzswcUfzFoMTh9+IbaAfE75XOjA5NuPw?=
 =?us-ascii?Q?XVm5CQe+tNFOz205DE6Z4N/z49Iyf8iTH8bCdp9S/S06PaHA8GKrDYt1iy2i?=
 =?us-ascii?Q?1/6nXgC0sJ3tHoNHZYmzgateJ8O51AexxnZRZalNUfhXDCoG+IayAGMhEAKz?=
 =?us-ascii?Q?L8dNBgsxyYD7IAgJl4nry+e18h8zC/UwANXrvzpCMdt3mWsKFhDh5SO+d0t0?=
 =?us-ascii?Q?L/7iC5qGaFnZ6uZVtvH1bHmcM7hVAnT4/wexf+lO09i1B+gHD5/STKfWESVX?=
 =?us-ascii?Q?0FxO8cB4olQBBEwD7vlK5foF0QM0h5K4oGuNnPAovloNR2LkYGbj4bSFT0cW?=
 =?us-ascii?Q?lS3vA+iTeHuFp5PZf8AMetktwtcgwsVSyR2uo+HA0FdHEnkDYJ+wh4Z/yULR?=
 =?us-ascii?Q?NKO0uQHW4oAlan9rXzIXkyWWCOTNQlcPwbAqmmuz7Sth5rUyh4ld6NCrq5bP?=
 =?us-ascii?Q?8nPCg1+FLmhAMTOIZuErIVa3ZmHbe0BLRHn9czAUZeHE61XG7ziPyn63K+Ql?=
 =?us-ascii?Q?wHWtMNAYaynStamRCD2NYMRkzUyffnSslXu9p0u8kcZT1qoM++VBwGqgjAIr?=
 =?us-ascii?Q?ACAEXv94AfYMpen5owjntSAIZPoss9eBEjM4ZFvJVPsrRJcXzvj6rMIJ72J4?=
 =?us-ascii?Q?hgTUubdtHvahnvLzb8DAvIJMSfK4C0EEw2t8OmWI2iy/XpVFxchLLKVtb5uo?=
 =?us-ascii?Q?bdzWUckSWugYoYa+VYhz5LerQ2Zb26kl32/ObA3aeU4ssRZREbmYgN0ushv9?=
 =?us-ascii?Q?rZ9LqqNJrH9rW+1NOgctoV62ILGXl/cs/Rll4mP3PTTkAaofXasy92UH45Oo?=
 =?us-ascii?Q?uFYTQlADTsZTCd9TyrNOMNxFhI+mns4CoogsW29yDhqYpUu14ops16Ahw7Ch?=
 =?us-ascii?Q?G8Jxjj2tvCYp7bnqAY+ZvMYZeeSu++HF40bcr+Uoc1fIt6GyvZaeHdrGJ4QN?=
 =?us-ascii?Q?Nccv9pTHIrBMXdLVna7bXEqIIEsJgPou6Ma23RRgPZNGzj9BuH5p49F4novq?=
 =?us-ascii?Q?XeAXstF1qL9ZNF6v5f9sw9zLa/a8b3RyEN5cPcAj+EOlzd047K/JF8pdKteZ?=
 =?us-ascii?Q?fb1quUrgZtLAOxyZqsl575XSpn7Kp9cXvMrjmmZnqBKctfLI2X44nrh075cd?=
 =?us-ascii?Q?B0bk3VrmZ9oa79mm7wp6ryelkElix+iaKvn0RHQHv66iWQhOQCrGMStJ6FVO?=
 =?us-ascii?Q?bIztU9qNSH8mzVYNFAIUe3DiOH4NusNpL4pNRhPZkKalN9fw4Ij7dvcPJnf4?=
 =?us-ascii?Q?83r/6acVTZsB7kVbGgi7g4EPPS64jB06RvERC5IHdg7J9qLqxFZxNeDS2q7R?=
 =?us-ascii?Q?XzSFpvlEY1XM8rpRE66pOnmnnhBjv/8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83ffb3b9-933c-49d7-5456-08da1e06e752
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 11:07:03.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nzo2sRH3LR53PoEgZlvWnX3k5QQZ9XJ3+XRDt8uRSwu1JXyodRZ1AwMS/8I3FQzckPAdtFcQhSYTxpWff7ABaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164407

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove mutable default arguments in Python because they can lead to all
sorts of nasty and horrible bugs.

https://florimond.dev/en/posts/2018/08/python-mutable-defaults-are-the-sour=
ce-of-all-evil/

Revert `recipetool: Change default paramter fallback_licenses of
function split_pkg_licenses from None to []` and instead check
fallback_licenses before use.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 220465ed2f..824ac6350d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1235,7 +1235,7 @@ def guess_license(srctree, d):
=20
     return licenses
=20
-def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
[], pn=3D'${PN}'):
+def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
None, pn=3D'${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by guess_license()=
,
     a dict of package name to path mappings, write out a set of
@@ -1258,7 +1258,7 @@ def split_pkg_licenses(licvalues, packages, outlines,=
 fallback_licenses=3D[], pn=3D'
     for pkgname in packages:
         # Assume AND operator between license files
         license =3D ' & '.join(list(set(pkglicenses.get(pkgname, ['Unknown=
'])))) or 'Unknown'
-        if license =3D=3D 'Unknown' and pkgname in fallback_licenses:
+        if license =3D=3D 'Unknown' and fallback_licenses and pkgname in f=
allback_licenses:
             license =3D fallback_licenses[pkgname]
         licenses =3D tidy_licenses(license)
         license =3D ' & '.join(licenses)
--=20
2.30.2



Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FA2C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:00:45 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.6635.1651820433030208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Xm7Guyuv;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHPjVJ6UzHrSpiexU4jHqxvMNA6OVUWUegLZxEZBwGxm2eyH23Bi8FPmriAZB+OZYLLI/62nzbdHOIWwJnqVnLF3WDITP0KlOo8zSF4BS2D3YRVZVHahpitgCWNTI6fEI82pO2Bbx4nZv/SpaL74KQIinjFKt3CZ7Y1fJEeshPMv+tYC/chV4FlGEIjP25bt6xoG7qEL3KNof/GHbtm6OeHz9RpHqKi6sL1DU0aWh/9ARFa7Ej4t2GntNRC7ovlD1Gn8GmpkBxjNt2uQLWpjNKYQbb/wfdUWF/86Vw9QiZTUWDPRrDWdNqGM4TQNvohR4z4cigNRsJNeILPJEaCV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC3ZLjBPIV5KIL2FRpmeFO2X5K5zq8AZeRuBTIZieYo=;
 b=kedHnuJ+CV10RjUbv/KUXTznvLnwFlLMlNu7CkldIba1RaQ1Unw6AUVAHlXOvVFx5nAIYcLPfAMAj8fQCAQjsDh4UPhsHbGv6rpj729CynFMpfC6+32w4aXE1athVej7d/qvvSXgGwuk6ntzmSF04qQVhArhcKdgaF4cGyPdr1QXSpmI6lo3gO7ai+7iLSu1s5qPkNHIKvE9d4oeXEUkqzf8i0wq6pFKCU4EKOiMbNS1yCbbG1lAw/62+Gt+MvPYX0EKHVuOq31dIoGkQf/ANDWkY9nCZxFycWfvm5bR2wztu95Y+B4uAGvtEKqurxRBhLOrqjFh2SgVmeJ3QzuAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC3ZLjBPIV5KIL2FRpmeFO2X5K5zq8AZeRuBTIZieYo=;
 b=Xm7GuyuvV0sWSADGotmr7Ph5TY1V57SmVGNGy7heVLMa1bnFeRRqlhEf10P3fJP5e1I5JkALAzQTtg+9Q+ZUgkGfmLuRFpdKk8t2BtfztrLcGNara4Vnb3hwWIT+OmoAWjzYnfycLYbfv/UFQ/fNYJNNrFqjXABJSEdTr0Y7/XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 07:00:28 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:00:28 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/5] create_npm: reuse ensure_native_cmd from create.py
Date: Fri,  6 May 2022 08:59:14 +0200
Message-ID: <20220506065917.1375-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbe4d33b-f045-4ea5-01b5-08da2f2e1a17
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1881:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1881A24F647CEA4ED977E6EAD7C59@HE1PR0801MB1881.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bdpnYZWReW0S9ftoczwXmsY7TqtQxLz9DJdLhu2296Iy1CJFc8a0asPG0c6KU3FTeGAUIiMM8uuo65WxPpN8uVIX/ZNyZtgPXkaUKnLVds510ZTvwDiZBK4tb5DtYWg0ivmzhMc2qhoRKXrPw6uZ0z66NJO5ky7ispzXma6FhSJEU/2SnoMnAvnMhAR1gzeEPBaMNjtHpuXv3tb8qn9mcKOWIiQ/OPVlLtFefSjR9iRccOweHsCx/1zP/rapECrMIquBrGsGBi7IjRq7EiPxqxdUSlFB6kkcCvyuQHUA7PjzK2S709QfidDcMTS0wfvL4AD4vQzP1AOchMwqVGkvtW1SFfuDtK4TJ9IQL8d17lVVYL9Jb8qHA1qqhNedfr7vZMnUIIjfu8dTe74PXU51F17QSeyDTp3mRUHthCWP09BdZ6QOOiJx9PXVBQM4XiyGFBxoJ/z9hCCej3bALbsIKrCGQyQDT4iDLo6YHsRBKXTRQOo7vTi5j/liwnym4wfKi3hgtp2q2F90yK4XGGvb3n7mtBtkOc4yrcf1JEZ6faJnYgrOKZZ5EiUZEpnw7zgyQ8HAT7b2ETu3WHLkvZX5+SOOLWrv2YD0e1en19FDaEaO1DLo715kUQJPDUDheAaRj4k3o4Tax6pL4EFnbsqGO5JhMtqmB5lWCXqB1fExUJjqhxWxKegnk6MD5gfMuO5isIgPmBfTRTaRq7oCykSiig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(5660300002)(316002)(38100700002)(38350700002)(2906002)(6666004)(83380400001)(8936002)(508600001)(52116002)(36756003)(1076003)(2616005)(86362001)(6512007)(186003)(26005)(54906003)(6916009)(4326008)(66556008)(66476007)(66946007)(8676002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7l2ePb+Rgg37gRBi+Htw19rU9cwXD5NGfT7vCjii62NaIoOdQ32PmvrWqIma?=
 =?us-ascii?Q?a0fK9gWHYR0zyAvjIEywHOLueqUVrGpeAjSVwPGOcKQqF6JHF5eGAyWQcbgY?=
 =?us-ascii?Q?qmrpliooaCKckGnLTFmAyIVQOdi0rEhuzWiGtYV0BtQrp5a84SP6KvS5gdPA?=
 =?us-ascii?Q?4Nhgp6p1G/UXjfXxcffjMZzcDVtfj6/njbOl1EE/cKN6tW9BPgySps48CQ/S?=
 =?us-ascii?Q?tS1WpWa14CDYgAyLlnR/cq/IBdncBaD2odga/GsZmqaBVGCtKQ/aPaKgB7tT?=
 =?us-ascii?Q?35jM4b5cBzr1W4UqU93pP1NS+83D+WnJVdCxRDspEXqKYZ/xj0tWgtSGB/JA?=
 =?us-ascii?Q?nkx6qC9iBAQGtQNUwcPYN0A1SXAT86+gJASeWVUFPeq4BJFvpRCMpWuRdVye?=
 =?us-ascii?Q?r0qiDwNTEUeOrIiSgMdzr2mJj8SI7an9+q/MnGv4SMlF8/WfSJFYRqriFAhS?=
 =?us-ascii?Q?lJJSwutW223qXuM2m2oAAo8KNb+ryNtZwwkSNm2o/yp/Zx9LdMqQtYhdNksV?=
 =?us-ascii?Q?WB2Vm7dLXnGpBo6veVnVSPaXDUmOPzqQ0LUDPa161N35Yo2IFF4eHbsdLQvT?=
 =?us-ascii?Q?4urj2OTcJkObQ3u3Z2O/S/G+wipdehT5GLLICGNrk3HAskoK5rmG9yvezWs/?=
 =?us-ascii?Q?2HMgtedWmiSZdprSqlPaOYxS5SivoqTR47960l+NYoMxocCQTitbRlFiUBKb?=
 =?us-ascii?Q?yKycJYSp/KNJf91Nkj5KcWAIudPq/6Nl/GoAbKPLz0V66VB8RG2SLUQwmwvm?=
 =?us-ascii?Q?SLKEwi24oCqf7fr+JPmqLSyI9xHBuxrsdnfBwyVa63hK4qRBUkWRwSGaapaG?=
 =?us-ascii?Q?h6XagKJOoGu2L4+kHiBWWTmGo4QJrcoLXjS96Zg/pig2uYLUlaYXS6hYcDKg?=
 =?us-ascii?Q?4sWk4U1eidN5FazOBklFakdOfNWMMI9tCge6FuMB4uM42b2onYs4GKS+aY02?=
 =?us-ascii?Q?0H5y+ft068CWzuTV2UWJesL3kpsdhuEssW0TBuA4wqm+XJlCjGMhz87TTO3J?=
 =?us-ascii?Q?VHIeNfu8nT/6LKJUwAUwcBAagiIqCasZVeL3D+k0wU9YM1jhH0uLliflBsp5?=
 =?us-ascii?Q?0eXraL6/n7iiMfnxGDY9YdfV1YnGiwDzFUNfD8fmmHzgmy1AlfXC2ZlUkC6V?=
 =?us-ascii?Q?+2PCH+aImbq5OdGsVriyJAnKhaIJ1QulRjno5Mbh9/ZVZxA8i1J33RIqo2lN?=
 =?us-ascii?Q?9fFnGx+AvkY5LZqIgA3NgwaFCF/8iSkj6t02cJ0CCBD0bALpN/61Q/AIVrgK?=
 =?us-ascii?Q?Gd0rjpFlXUUWzjf9fst4NWWEmTzL+mCfu0jg+dw1w5RWGi7E1BbdQX8wtB3g?=
 =?us-ascii?Q?wwA16guCXKK14eBwuyzlG1g7MgnnugM+9Xaq1bXiEr31XUVUx8pkyg4+rCXZ?=
 =?us-ascii?Q?5iec8EvRWuwTjr+1mPQij7zuL9FTuWOBboaweTHCy2HiuJ/SJfxnfzS7OLIL?=
 =?us-ascii?Q?G6GFE0wBuW/+o7QKBAkKc0dyL3qsYzwqDscpemu8oBo5S955RSdxB9N7UWpn?=
 =?us-ascii?Q?DNCJrU5IXzxaADuTQkvWntpGhltRx12TbcbY4ZYYZGhDzhDWSBP9Q1mvj0t+?=
 =?us-ascii?Q?J5YdxeEx9+4cGd/rJDqVr/CWZeXcWRhOnnttaBJEDOpDZP9SRKDjTdhmzPdP?=
 =?us-ascii?Q?X55sWuL2CiV0qAdJoIdXrVbBgOYvvH6pW9jFWR977yrvRqDh12BYnEhF9Icb?=
 =?us-ascii?Q?WIZFiaB77XWv3YPFYh6760ASlaAbrxGWTjQTI5apm+pDucq+7v0IxTupOIc4?=
 =?us-ascii?Q?tnKuHN1Ql+JD2gYN63CHtFnINweBiZU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbe4d33b-f045-4ea5-01b5-08da2f2e1a17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:00:28.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tX83FoN3/stw0WymjPaP3T0QcR2BIGqG3UzwsWOkIhL+E0a+vkwinTgevwckrvgjm1SkXvvFS2H73XF0BBlqsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165325

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create_npm.py | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py
index 3394a89970..3aed59252c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -18,6 +18,7 @@ from recipetool.create import RecipeHandler
 from recipetool.create import get_license_md5sums
 from recipetool.create import guess_license
 from recipetool.create import split_pkg_licenses
+from recipetool.create import ensure_native_cmd
 logger =3D logging.getLogger('recipetool')
=20
 TINFOIL =3D None
@@ -54,31 +55,6 @@ class NpmRecipeHandler(RecipeHandler):
=20
         return registry
=20
-    @staticmethod
-    def _ensure_npm():
-        """Check if the 'npm' command is available in the recipes"""
-        if not TINFOIL.recipes_parsed:
-            TINFOIL.parse_recipes()
-
-        try:
-            d =3D TINFOIL.parse_recipe("nodejs-native")
-        except bb.providers.NoProvider:
-            bb.error("Nothing provides 'nodejs-native' which is required f=
or the build")
-            bb.note("You will likely need to add a layer that provides nod=
ejs")
-            sys.exit(14)
-
-        bindir =3D d.getVar("STAGING_BINDIR_NATIVE")
-        npmpath =3D os.path.join(bindir, "npm")
-
-        if not os.path.exists(npmpath):
-            TINFOIL.build_targets("nodejs-native", "addto_recipe_sysroot")
-
-            if not os.path.exists(npmpath):
-                bb.error("Failed to add 'npm' to sysroot")
-                sys.exit(14)
-
-        return bindir
-
     @staticmethod
     def _npm_global_configs(dev):
         """Get the npm global configuration"""
@@ -190,7 +166,7 @@ class NpmRecipeHandler(RecipeHandler):
         # npm version is high enough to ensure an efficient dependency tre=
e
         # resolution and avoid issue with the shrinkwrap file format.
         # Moreover the native npm is mandatory for the build.
-        bindir =3D self._ensure_npm()
+        bindir =3D ensure_native_cmd(TINFOIL, "npm")
=20
         d =3D bb.data.createCopy(TINFOIL.config_data)
         d.prependVar("PATH", bindir + ":")
--=20
2.30.2



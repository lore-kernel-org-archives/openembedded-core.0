Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57309E9B268
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 13:58:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20675.1771941020513608410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 05:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wYAqDkR/;
 spf=pass (domain: est.tech, ip: 52.101.72.50, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAClDMdL8wWwnwQBEG1uWzcVMf0JzT8gX5FA/0mD/wPhtkkPveDhmMHfZFRWF7Y0L+vviWX8cjRtAvgqI/ulCuy4YEVyFcrQXvNCPnC7RiZnuEnjq6macaeqcgTP90HMtQr/Fi9QKiGj5DNj2pVrA34Qfezm53A9QwQUPcJXd18y8rdR8FoPdS24+9wL4kk29TyKb211eTxkS7qeiSv24Msa0NTybFH8X5DKfxHSx2nePPhY1U1d7x3MDsEq7M2yb/lOCmUcJO2WXFIEzFo/nSi7iYWSvMdTEepjFN8yWlC2UDqvszaudm21ow4neJs0ApJ8VbhmporryvjQ+uggKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4TsmBbZnyIEdaoNxTSAPGcBTCOLZVXPXlvYEurTvFI=;
 b=tjPrndwy/i5bztbbZlY70ZkQBqBB3X1P0wd4RVqxW8+BnUC93CTqj8z7eHYXK3chQPeldi/x4pPE+MLE1IbF7o/y2WDrKxzqfUMnYU58Imrq3RhVauLDfvrHqUKPPdevWlZqk4sRdq6u7pMoa+lDYOcOmndS5qMR8ZN9DjEia1TogTNZqyIH9NHe9DkfEr2qnpTG4g9F8Vp+HHK+ufqkt6SkdJxfT27mx0V8OYIvjbtqJ1lQIZ0iKGWU8hRizpFVyxwnDQJ3pLg/y+QelKJfeb+sYPXQc3AyWSjRccSyzLVmeHzdwCVuR/sErxjNft12YzwmARq7dKsPWo/3kAn6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4TsmBbZnyIEdaoNxTSAPGcBTCOLZVXPXlvYEurTvFI=;
 b=wYAqDkR/uACblG6P5LtuvXp5OOUCBLGTzkheY6bALFJwM4PUbK0B5E+BgypD+4Hlu4XH4MJ8Rv+/1d3fF14458lVm3sgrfR35z+UN7Bdk3V3ebVKhZpQfDIY4HvROaZeJ7fCMf1CFoqUH63aYujcZZFwJ8Ai+T/4yURLcgQQjsoDyjBuqzRbjA3k9/DZ6y1bcWk6v6ruUnMJxNuybWKz5Nouz5ztbgA0024/j0G4EAS5B7bR0X0ghgqxIVssnVTKfsWl/pv8aAf561hhF1SbACK4LYPiLv/bnZ0UJcGrSLacQFreInUM6795LbfDBMTyCeK1P2rZn3yVIssEBdIyIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DBBP189MB1194.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:50:15 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:50:15 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH v4] python3-pip: Backport fix CVE-2026-1703
Date: Tue, 24 Feb 2026 14:50:01 +0100
Message-ID: <20260224135009.1940772-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0224.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DBBP189MB1194:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d8ac01-e82f-45eb-620b-08de73aba364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lqq7/EWLlmPGIVXmGiipvlmONTyJvV7l4F1gCff6LRnZMGp1dcz+v4jUFOxD?=
 =?us-ascii?Q?z7VRMjZ142e8cPAZoNzLExce+geKTE2xuYI0oEj0+eR53FQkLIUQUFslMDbw?=
 =?us-ascii?Q?HyI8yZcQApf+hebFjd4f6eX+lVGlc7HacF6J5Uvo2bSJBQex+Wt4RoZ7PdUU?=
 =?us-ascii?Q?l2tey+0IaMr77fjXQesLcsIiKhE9reX7/IKsg+MYgwCnOCdEtmaYYVzEtBbo?=
 =?us-ascii?Q?gb8CSM/smt3Y75QAHM8BnoeYIbRWyaoGjSlzn9IaEvwNhr5QzW76H2H5n3D1?=
 =?us-ascii?Q?0/FxJin7nR2MgL5JuvNlHy0ypV42IyQJVCi5ENUqfumkTL+wSdRwbMM/3sql?=
 =?us-ascii?Q?sMUOcoYc83vuIS15dD8mQJKsa8seDGY3AX6vGBSrHxxar0nXQs/AsBUV5Jwz?=
 =?us-ascii?Q?j0NVlpFyM+re4DTsR9NoNrmABtKfs1S7ufjIxL/tBO6k+1qLiLwrYp/DmBYM?=
 =?us-ascii?Q?dwU4wErwukDePSBGKsEETCcWxYBQDxIl4xJvXUn6WsmquLOLED06Kp1N3qiT?=
 =?us-ascii?Q?xzzX8J8RaztlxoeJjW/lSwWZoF6l8yXmr+shn8lhDxzEa1x5srUV7vNKD1cI?=
 =?us-ascii?Q?AVA3NYMvBuEcCdvoicBfdQGKukMFiRA4LMxzhhfZFkdZ6mATmwZN0aV9Ywc2?=
 =?us-ascii?Q?vgMApLTbRMQvGUmOUEv2ob7NuQx1w6FL01woe1kR3HBCt2D1vnPTBuOHrjr/?=
 =?us-ascii?Q?aRYMgw7hUMH3Lp1oCagYpU5mSRUUN+oshbK8i4bbgAsB3krBH39Gt2yr5Pq8?=
 =?us-ascii?Q?oj0zYi2ErgJPUEnub+qxrdSaDl4qmtL8ZUbvwn3+IyIt/YHbbI3e7MBOFxxL?=
 =?us-ascii?Q?R6iFQ4tcAD9kQDvC0jHALuhDce3AHb1su6bms2uL5QfH3MaDr4hdg4xPDY8l?=
 =?us-ascii?Q?/Bv8GL519EiyUvVHD2khPf5IFxEXF1SAT7xuP6FEnalqVp+SW0jWfsbNNLC/?=
 =?us-ascii?Q?aCzFC6xVx9XvMQ7Wy5SbfJjLh9YcmHFSyi5r4j1kYvnhT7KbYtQ8pXU8Aus0?=
 =?us-ascii?Q?qOX9Yb1HqorBGukvnS8X/P5gzf4AVupq8hHosm6/JCKJZhZRdNZz+8yGZWbj?=
 =?us-ascii?Q?B0aD8qwHf2huSYict9uuIKb+FWSN5MzUsH5i413qrca99d+eoRABgmlZ1CpQ?=
 =?us-ascii?Q?Jdbqj+WUOfQA3RQazq092RaC28NRBPToj0POyjQniskcPxrSO35VxOIsm/vI?=
 =?us-ascii?Q?0Xjz71MF3hcLhyHeLf+mwMlILxG+W4Xsvncy5WfxeMHJ8+6U95A3R/33knAI?=
 =?us-ascii?Q?VEWK1f2JHRi+qxLlQTRjOobJKT+13F3ZfC03CC9250kM66wo8s9DIvp+AY+7?=
 =?us-ascii?Q?SSILK/I8TWnhkwdeb0lmrDurSAI1ZWpfZmUaK7rNfC+1moUH6h+F3kB+c12d?=
 =?us-ascii?Q?BzZa1RfHTZI9q6Wgv5/yQO1iSy3F85upZ3HqCmxXWM7dGE+xxeV8ZhR3GqBS?=
 =?us-ascii?Q?NZfeZo9CvA52hykicgJ5TzLXzSzRfRiPt+hghCxj91qinz6wCRLxqkQIaBTU?=
 =?us-ascii?Q?4I5CDsH3ZPgqYMb4lVn18t8tlQvO5UWtf1y7KOku0JF2T7aqIIva9JlKf0ZN?=
 =?us-ascii?Q?FogpzuFvfB7e6wzyAJA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8+RCuHn+24uS3a0U8JskR2HTLxWL6G6N/MsQevK8Yu9jzCminUvCOYwYcD/e?=
 =?us-ascii?Q?sA6exqzzcjObvHersuKTIsqBh520MMBkvgOnA7dO66830d7kkWinyoSRJOGm?=
 =?us-ascii?Q?nBgxtUq2fg82J0LOE7QuJd8FnCyZdz12N4/QdYeji4/OXIP+e1wj3ido1p1K?=
 =?us-ascii?Q?GNZUja/k5HyRZyDFbW2IgEUt2c752glgE4oAmvhDhcOtAGGA+p2LegCcGwxV?=
 =?us-ascii?Q?6gsYnbShgYlOg9UvfK7ST3u6uHiIx1NwIud6O5SnMDN7qHSR4A+o7b3WIqEt?=
 =?us-ascii?Q?ewP8LZtSIqO4i/99EUptHnPAtDY9z7axc3xVHd+OPZQ3HIu7xW801vOxNJoS?=
 =?us-ascii?Q?XA8TiZBq3IyUHIFvvwZZb6vI2Oh3Qr3r29tIF6OA6DUoN27WPVGRd69qBaDe?=
 =?us-ascii?Q?EUq3ILYVxqyRQUp9K7aRiJB5hm2h1ofUyiEXzKv0gYtWv9Sr3sXjJX9RPaCF?=
 =?us-ascii?Q?RN9z0UON2FO+uFPCxx7xXtkneC65YntHoej09Yn9J2Eeod4Tj1v9vFSDrU7U?=
 =?us-ascii?Q?RYWl1BZBI2VzE06yirIFS5u0iIJCHgAd7DmHvteF90zANFdHrkSn5VSirfFV?=
 =?us-ascii?Q?0GsZO7piNEPV4Dnmu0mKhOVTDhPTB6iiBL/olJnCBjKheYB3VMCFi9rmGfWo?=
 =?us-ascii?Q?MALrb5WEQwchx2lE+z6fYIoPS9GUwf6jduCByW9b94LOx+ECWp499QP3yNJF?=
 =?us-ascii?Q?1UiRDHx5zPNkBsL7m3QgtouSQFczKYCJ33oKcqrCoXzy2gv3fciiJkE1p6VM?=
 =?us-ascii?Q?pwAWkQhTemT4QlFpXXZO3tk0x6maw2VfbI7F+smsNG+eKcTi5qnIcWJGvgpy?=
 =?us-ascii?Q?CfLvtmDVtggF1OBDTtj5h/OmrBJ6k0vlNBxmVIsvSHbf9gap2Nz08SBOtUZo?=
 =?us-ascii?Q?doIjDkvcnAATMekxY9rniWOOAgfMTC+ize/NYi2qeg2ugAB0tsLo6Hf+VTMm?=
 =?us-ascii?Q?c9xScDgvLHIY5JHrRiSaQpZoomxudoa/25sEBXA6uz4hCQagqASWXvGpUFo5?=
 =?us-ascii?Q?Oe56ZIuvnL0mEBrFqoW5K5zYiFFhHsEQZboHwBR33s+vfES9M/tY6anlDObi?=
 =?us-ascii?Q?sd/5BO21W9hEYsDT2bi+GjEZSaQVHF69xRQT9NFSzX/RxOdktAiKYAyLW6Ot?=
 =?us-ascii?Q?1taFm685Wf0Jyz1sxzI9oAj6Qz7sgUIZF0TAr7hocWb1EFEtF5nRbh2he1sc?=
 =?us-ascii?Q?moPUtJvHAXI6PW496LRpU1K4rOR/3iGyc68qQ6BR3l59rFmj+J0Jp3+dDIMG?=
 =?us-ascii?Q?jpi4+NxfJk8lAaHG1X8vn7U8p+fTvD1rO9hFTwZ1sAb+LnSwUFxfXkRwJIoC?=
 =?us-ascii?Q?7GUSR2tDCfA+4KJ3kLjFXepca7xaMqax4Eos1rFEcLsiWY5Quj+jJhPa3Hux?=
 =?us-ascii?Q?SFeBOhFZ9w7d15cq07jY7gyFSjNMXPKMkrYd7kZ/H28Ex/6BUacCLWBqJywR?=
 =?us-ascii?Q?ytIs6WdVJcJ9hjOhPVh9XiBS0bK5Fk/xYFpbLc5mFVfrmreQkcfEjMhwL1eg?=
 =?us-ascii?Q?ukiYlnYktwwKT/bAdtUPQlLxI900CBOnIDG2innP+s3AEvPHqKIkDnhwGe19?=
 =?us-ascii?Q?Zu9Tu7Uh+D0HAz0VFG2rGwWD1Iw7aDKKFAhutaPscWcjD9HTLhyVi0cHU/Wo?=
 =?us-ascii?Q?J/9ULJar29bFtqvJ+qEvKFUoOCLK4ql56GpXHfZRMSWuij4RRde8KamrfHSV?=
 =?us-ascii?Q?TGTg6PYxTLZf0Xv4XV3x/Tg33DZnTTZbKHCIXLJfoDjrX87NCrZ/4jUPnHQw?=
 =?us-ascii?Q?EkfjfJcfjAdckmrVt+zbvsgEag1eynI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d8ac01-e82f-45eb-620b-08de73aba364
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:50:15.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clgwl4UVhpsA5K8ERS0FsOQ932Xqtix9eU4L8LQM9+I+aTgGZx4SsEniBdGXTrHQX46YQ7ZAv4oPcx+R4Mx0/y4C4N+i0Iqiw4ax/9r5AGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1194
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 13:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231764

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 41 +++++++++++++++++++
 .../python/python3-pip_25.2.bb                |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..826f483ea2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,41 @@
+From abce61e230c47598ce836157d075608595216a4c Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v4] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index 0ad3129ac..7cb3de3c4 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipe=
s-devtools/python/python3-pip_25.2.bb
index 350092d9ad..496eff1f15 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "578283f006390f85bb6282dffb876454593d637f5d1be494b5=
202ce4877e71f2"
=20
--=20
2.34.1



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1C3C369D1
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.102.160.18])
 by mx.groups.io with SMTP id smtpd.web11.9779.1744898735099865308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=BgVyB62n;
 spf=pass (domain: nxp.com, ip: 52.102.160.18, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF5a52LQLdNy1kpeE/KQCN/t5IBZi74HKlkW9qpSXE5yCeRkXTIPD5//0xf6o3ynt1NeDq1dL5Sd8nBmKV1ezu0pwxODl63R23qpWep0IpfUv9B0wl2gvO8vTiXKeVFjKU7ob0a3C7fVVxOA877PKpfh7wvaCbaiDozXcKfrV7Qj8/X0/YhqM46tzaidbcpFmZyQvl3Cu4NqMUKfwwruuzAah+uGP7XRNlF9YY6BMAcdRu9sI5JbXzl4hrmPyIdQOKRmHOzW8DS5jetJkB2wGRh6AJndqd99vR3tthBcFtdkdIMTAHyUyHldkikg2bdcj9hHnMWE+EY2MbTtNO3YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLY9dZyH31tbQowQJErO2zbBXg4JV1zccpMpPwhN8NE=;
 b=FOHx1xGKOsQ7O/HPe0RK8cAwleBnvDLtcsOCO/RAS5S2L/W6aaBr6vS0AV7b1ZUIgpYvAW4ZATjiV5UI8q1qgoTxwinVkm0eI5fhdO7NCxRGsYND8OO1DVvUgjCUMdKS1eUVysC2lN/DTBuwsXNVwIiDO/ojg7X44JNOOVXjxF8hT0fSt81V7IgEx4L1KwZAgxbH2d5sO9igMjBCLLNHoL2smhfE4Ar2OhGwBLrv2OCkNj9w2KwUnd3A4nH5fuPVQ9Tk1MZhb3g5gcoyy1NKSa3EfwFnyKvbaxB8u0bOZn8NlVsk4v991BtPXm0pMT0rVK9cYSQ5S/v5Pgh2VoMYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLY9dZyH31tbQowQJErO2zbBXg4JV1zccpMpPwhN8NE=;
 b=BgVyB62nkk/gqKd097bFrIT2WBs41JvQ6WJYA4mzYzvQkDcz4jjCipOkgn8YT5FRFokbYRqTNA/Jj40YKcWysewE43dRqCcsRUy/9VR4n7aCcWJjlS2s2oPlF3Sn+5byc9kj38VsXpXBIF6Z8iBz5I1tUP5ntXZzl5InjAMYivHYXB0IaaiPIx9euU6yngoTlEGR4lSeLBkND1gbcv6jXDOcJCFSnXC+U6D0sBAY/BXFeJjjYPGlZl0JgCvw3g54xMO1F1h0aPnHTDDp0r3uSnHoEzrIPrN9lerH9caYmY7oDrKzASzbk8KqrjxfMshkGgeZgpiATUjJpsYqkeWziA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:05:34 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 14:05:34 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v8 3/7] toolchain-scripts: Export meson settings for SDK builds
Date: Thu, 17 Apr 2025 09:05:14 -0500
Message-Id: <20250417140518.1720796-3-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417140518.1720796-1-user@yb20>
References: <20250417140518.1720796-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0fa94d-53eb-4255-5d21-08dd7db8ebe8
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|366016|52116014|376014|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ihF/SWJcRWvmihBAzkEMcIPm8JjzP3K2tGVu5o6cjsjEs76Yx+sr1m+yqd+e?=
 =?us-ascii?Q?VKaYqYn7OpcpDAV3qpzNwcb3a7mZxyKnZHFjABMJqz/bKVDhEzVluXKgFzNr?=
 =?us-ascii?Q?uEllDYLxyDn0NqhFiUjhdbzt5Bzsa8c5e/1mxS5X9F5B/mQKOiqECdd+gwgQ?=
 =?us-ascii?Q?HynYD31BvLshV9VpcSGvIbU6mwp5e3hBj/WO3bgMEG/VOcDMssQRDB6TfGUF?=
 =?us-ascii?Q?Xor++HJNv6g2TJHSDbwOhaQNy++0ToVmviR8Gj/kbbxhyeNe4n0riucB4T8E?=
 =?us-ascii?Q?tqPsTFX5rD7FsEUzbKa9hEzEZWLKvYd0Js3f5UA23XWR5HrKfHVbmRBST5Jp?=
 =?us-ascii?Q?x50djL214DJlfZjW26xgRwNZL5JAPRbDdsCjO067M1AJaedewEPVtQajBQmM?=
 =?us-ascii?Q?KzbpcooYELA+L+eu7AbSj0gwEHzwpu2qiqCr5PRtb24LycA7dYLwO/U+O9KQ?=
 =?us-ascii?Q?t+cAYpN2Kkmur5XF3xXbrarmaDFjJSxj/G6uwmPKHhkJG4up2z0G8NWdANlf?=
 =?us-ascii?Q?5LnVc+fTLGh13bgQyUzXJUKJswHciEpmg92eYXOnxSETHyTRb5495b+YxUe8?=
 =?us-ascii?Q?MK6ENICocq2W1fl7vR98EAV0xAUKX26p7WI77V678lUOgOTQuVjCBCF86J8I?=
 =?us-ascii?Q?/OnNF18ygC+BiKK6Hw9o0uooI8bTYya4b1wVOWr9/V45xs5kK19TuFGKL23C?=
 =?us-ascii?Q?wq1fOA4cbIi4MvcikUZ6y653M2AzxhDewDMskuVYZ0xA2kv2gC0g9eT91vHZ?=
 =?us-ascii?Q?WsZmj2mhd2A02ZOmJSk6glz7/jcnmky1C43tWb8QK25QB4L1dD9zgxCW8lmA?=
 =?us-ascii?Q?5jW+fxuDJK/59crY8aeyY/FZ+fbCheVePKuNZ0P1oii5AWY3KPz/qpodHNG8?=
 =?us-ascii?Q?+TFBqdr8r5BA7ZOH4g1X+lua1I4NtKcs/fDEOjk8Agjs/gB0Y9fZkj3MPgMl?=
 =?us-ascii?Q?3YHSoPwDeCMuuQlKCzyKPJ9DZCPcz7MwQAH/L9JBJjqM8FzXLpW6LZLUxoHF?=
 =?us-ascii?Q?XvkvO1ULG3lwSC6R9va4YjvNrRjwRkWsMFKMMAZ1ygP6yrwtb+lLExmCWF1g?=
 =?us-ascii?Q?eiBVBtHhkyKBj6jyinKQXL9CcpBJX5EjTz4ouCgYq5q+o3XQSVTIg45+JOG5?=
 =?us-ascii?Q?8Gqy0Fs+1GMnt2hYTiuYZpDhLjHPxPz3P7zEdrZ90sKyWtwMWwmeqJ+cOd9g?=
 =?us-ascii?Q?piNGQ2R7Uz4mY/5Sk77yGQXZbWkrXMMiPfUgbMIzaJFxKXP7P+77zrzaGIzk?=
 =?us-ascii?Q?FLC9mA1KAw1wn2S0f1hDfLBrPHAM3IuT3N/NUJY5xCgjI51Sm4maltBVTcbz?=
 =?us-ascii?Q?t+CvkVVktGAD64yhHJbCcPqm4KF9Il05hjCahs3t2jaIBtpHIZaqjTPPwRaB?=
 =?us-ascii?Q?xdfuFI88wgFLlfFpEhaz6dbz92I6nGR5btCWbdLK7cuUvNmxjHY8j50NCxvM?=
 =?us-ascii?Q?cdNDwh79Y7vgZ+qzMiGB+uK2CF/H3mm8xSKYQUtsW3gLzn2mAvO6J/r+5IaN?=
 =?us-ascii?Q?VICEMKm/M4Y+ggXR6oT8XDsAJB5H89OgsGHDMRqCfe58jokIW63/R+blYJTM?=
 =?us-ascii?Q?cRPKV67TK++9iLxG0azLG+2isUgMMm8luGQoeQxqhIwRekWdN7WXAt2TxqHh?=
 =?us-ascii?Q?Ie6q1tI4kCMq+JONMuoZbzmhHMj2SrMlkSX3KXIxJXGCZdGBi+8cSVSYm2cm?=
 =?us-ascii?Q?CmLZ++rsaedj+GmWJLHvarS7rd9D4lNzUOinbEP8tLEqH2khNxl+b7pMzIGX?=
 =?us-ascii?Q?BsvGDKdj8dUKY6CkFxc6WaogaO0CRBpLk3u3YywuEj8DypLw3Z5hcOW6Xok2?=
 =?us-ascii?Q?fc5q1+KYRMA19X9nLjVH6R400ate9opdV5Pv3xOKS7eY2pMnT5dXegFoleoX?=
 =?us-ascii?Q?J8GQZiK/WqhV1BSvjZOoF9yx+l7fHZvTZpl8dx9YcVnKVa4ilTjSrAa+6VAJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(61400799027)(366016)(52116014)(376014)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?31RQraiV3KAAt78OpYAMQR1WRa2KRFuBjQRZuzBqW4W0c/cmC5Kph+A1kncK?=
 =?us-ascii?Q?f8Vicqka4s3BIFfsvADxl47Y6VXmXxdzhZjf+Nwy8lmvXg7yjc17OhT2H9x+?=
 =?us-ascii?Q?66rpXaOyXqldhH74nGNBwiUkuJ9a9GYPJ0QpWq1FpMB+e7DQDGQS27SdtLrX?=
 =?us-ascii?Q?l/DShoS04KkU07kI3jw7+WSF28EUmLscynARXmLjS0hyP23UeA42dMRe5AEp?=
 =?us-ascii?Q?WIIR28RQypFGSp142vXw6pH3vm+DefwY6QzmLPFuqc0Tg+CHMJJ8vmJ+u2WE?=
 =?us-ascii?Q?YqYQ3fzmL3F+TV6GKYGsblicYtPjFflIAgPTudAXkBhBEVOuKfZXx2+oajxz?=
 =?us-ascii?Q?MO8pXyQ+SyUZionMzy+UMFVYMBGEfDnEaKXSNp5Aob/xdU/OfEEs2NWUoeKd?=
 =?us-ascii?Q?O7vkBlShnRfy/cK6Be3Q6GKQjdg8o81nGub3OObJiHTV9LIfOuXbyFOrCYBU?=
 =?us-ascii?Q?dfkQtubPh2XBBGGQhVHuhWE9WBU/e2VA2S8xUtcAYC/bWcRo3VZ9mVjt97U5?=
 =?us-ascii?Q?/Ztv4ot6pWjdPx/i+n0Brg8KKjrDp28NH9dtCjDrFpUXAeQuoIKG3FHsv/cH?=
 =?us-ascii?Q?n1xtgzjkFfxdPTOqNc3uCRDiXxesnvmngknASeiYCZdLZV1o2CeZPnEiMSqy?=
 =?us-ascii?Q?wOByOCNFxRJ8tPYXLc6BQDhsjuRRBJSxuTB9iTsPXTfALDhDNbVqewMEm+Al?=
 =?us-ascii?Q?AgFq1wT9kKGV8maG0HrYXjIJNkImXJllSoZqZh/xI/3IaasBmL5o4YICZu8D?=
 =?us-ascii?Q?EGU6/3x3QF5KYSihRD7MHy5y+rKsqq1kJc7vfGBO4FK1CR+F2Gw6GtAcSMKY?=
 =?us-ascii?Q?J2bqzDgXfHfz7sQ1p4SI+32tih8qfvr9+j2GIHcQs1c7bot+omwDyVaZ4nKP?=
 =?us-ascii?Q?tZgTlt5FxGHWx50AXY4mfchvYtxYP6v0gpgZg5J8WJylLQX9aTsZgRGbrr99?=
 =?us-ascii?Q?WXTv+hUwaMdCjP1ezgIbiX7QlCuNzmlL4DbQDseWZF2BqTTPCGzXdoisWPOz?=
 =?us-ascii?Q?dBQCFeWHnBrZzN2cVoZvGCXc18uwLQqkYanvGMPDiouY/3vGikAx5FLCViw4?=
 =?us-ascii?Q?pxXVzSte/geqb1iNQ1JeIHtC64Iz3tZTSHx0U3sTBoKH7+Ky/JCyak4eZ38W?=
 =?us-ascii?Q?8R1UMXn/dTnpJ9td0cQonYGr/A4W/svwAMigdhXraVixMLeKwH6kvQsrJveS?=
 =?us-ascii?Q?84UGNS7IPyWICmzrD4vbNbEKKmftjGUnf9ZSkbECfliSXf2/vP3mwLJiDqnc?=
 =?us-ascii?Q?m1cjZTyc1XISNtxaB1ruEeYyHWarb6sEmoO9zadhFr4B3RCa5G83g+2wz3CZ?=
 =?us-ascii?Q?xxYt818zbE1pAzG1ZYUVbCoCUaVwKqXxgWjdh7u93jixX5vzhYGJw7Pk6yMC?=
 =?us-ascii?Q?GpUNeASXHVRUyOeG6YWsVYeJvmYMx4s9bvYZSKUBlrOt8LMHIczGOfjc9PR3?=
 =?us-ascii?Q?QzfdMs6OWSTedexjxY367ecmfB5TNO/tR19xVGnOdolXh01iYzmt2VWYMS1/?=
 =?us-ascii?Q?cbKs35qC6Dpc3ehwe+WXNNE6LOyjkekf6/5iwXAnDDchZacoebKW9wdTHQoB?=
 =?us-ascii?Q?w/JV966Abnvi3TMb3L8WroOkTLkj/8UGX30fNjFe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0fa94d-53eb-4255-5d21-08dd7db8ebe8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:05:34.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt6GEWAcUnMrpRhsAogwcAzf2Hw5Zon/tWEmKFHlWVlH+In06vIKTzxK0LiC0PXUhx50l9+dCsjOsodCK4pnUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215093

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a native/nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 9e4320f876..3053cd0f1f 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #

-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines

 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
        echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
        echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script
+       echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system(=
'TARGET_OS', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('T=
ARGET_ARCH', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+       echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', =
d)}"' >>$script

        echo 'unset command_not_found_handle' >> $script

@@ -101,6 +105,10 @@ toolchain_create_tree_env_script () {
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
        echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
        echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script
+       echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system(=
'TARGET_OS', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('T=
ARGET_ARCH', d)}"' >>$script
+       echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+       echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', =
d)}"' >>$script

        toolchain_shared_env_script

--
2.34.1



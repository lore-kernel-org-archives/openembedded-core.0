Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1736D72373
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:47:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64706.1769165227340499467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 02:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=P9k8AKSE;
 spf=pass (domain: witekio.com, ip: 40.107.130.139, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHy4+6Uyom7aoPvrNVE1Uu3J2vQ0qAGwF0RD/HGUXVEUjSKaQMmV4qyUFMDJt30wNdmdZWgSU0dW+oY/W/NlfiS98FD/NWl3aJq2ohNZI71a/FuOEoH7fRVV5gWG1t1SfGmm/hBWqbRTuequlk+D4nSmFN4bzW4ccA7kIMLl2HIuKlRbdE/YpM/71tiBgfYtbdQEVv9iGNaYAQAnwUScL2Bif1rIKwaDK2iMr/txHi75C/lGTrOLDoUvRugJlr3ydtHR6yTzhGro1tSYcXOKT5vKsoCSa2ULOfw3yeBhYxj3zoh2IaQO3Eaas+2Zh4u4IthSpB3pGHxSLJxUwcyF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X70Gqy5NQT30ndBnb9nzr9vJmF0FLAlbNdkRZALx6EM=;
 b=gDNfxA7CmorDpZ2D7GoOqBOz1eU3+PXqPDdyg25jmztPlJwmtjzhusQE81LG/cDJ3JIfMEXbSqBz9eI00Nu8mHH1O8VhpuphEcrOnu+Jtml3Ir4KyjWW2uvfCM0g5bpU2u5aOv5cDnzgz6EmtGT3+vnswgaLX7SdhU0erb6FtCSwFJrCNrhalTkgUaroaLsH6GjodY9ifQvjSOYjzIFnrMG9hk7nLNGROuW5vcDI1VupwCPWli5ELvGvePIC7Dg1wj7ogfTQLRuXrR9VN1HW/H8nK5OOJBJmJG7j8GeOoVmZLZKDl3pUyO0JeuYcXQzvXGyH4nzvjQfDeOEJTTtfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X70Gqy5NQT30ndBnb9nzr9vJmF0FLAlbNdkRZALx6EM=;
 b=P9k8AKSE0MyFcwBpz0HG//vsrADXsF/gcScuXic3EuzI1T75owJ/iTtQKEPKBi2gtXkf1aFgKeOgm5BaSD7jNLMS84dWNM2xLpbikw2qxCMRojSDIoYBK3/znCBzaDklrRD/GZ2Mh4viUBIp6xxGT4lHnITgqPMwLFoRz31+9t3Zp3Mi6BcF6NgLe7SHfmCpqmywa697DLeeuqK+eArtFKKzsGY+KQoY3APVOCcDPXc6hbVVjBuft4frADmSsK9Ez/N+evTTQYCmbPqcppgFf2T4Mo+KLUQkGGF+xpW4UalmBbGj6PlT3RKeG6DWb8soisoOsqPvJ+MySlCGVUNhDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by DB3P192MB2084.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:438::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:47:03 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:47:03 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>,
	Louis Rannou <louis.rannou@non.se.com>
Subject: [OE-core][PATCH] python3-pyelftools: add python3-logging to RDEPENDS
Date: Fri, 23 Jan 2026 11:46:49 +0100
Message-ID: <20260123104650.2405-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|DB3P192MB2084:EE_
X-MS-Office365-Filtering-Correlation-Id: ab25597f-11d5-438f-0ac2-08de5a6cbeaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CLo0rC+ru3rLIg3iTYpdBh0O3mAworxGCArtSh3wmK3oQF8ZyxaY7KKNWV2+?=
 =?us-ascii?Q?LDq5urQC/6R1nWKMoSwXWTUakd2y/8NImh0uC/Jum5VZRmfU+pYnkfRks73x?=
 =?us-ascii?Q?onZyb8dq96T9s29oKQWA2aqEXm2p/4iXP0ntCUy0yb1kBEAqQf7h6Jrig1Cd?=
 =?us-ascii?Q?tojUjeGMq0bBAaFNKkk2d8/s9EmJC3Pin2elqaaZvGtwSTo2KRk/T8rEIJ9t?=
 =?us-ascii?Q?kuKvlu2w/1/eBndU1JlGLTYdU0yqB2dSj8FVO4ZRRoFvTwkLwM65nsiCb0vx?=
 =?us-ascii?Q?s+VQnFp7eXQncL7qEKuapbv/Q7aTckXTmhE0TNW7iIfTn9kLk7QJDTlSXWNX?=
 =?us-ascii?Q?aM0JV129HVN01sGxAtAzqBLTpnWtFrcwBTJU1pMZsfODHLneUJK8xaKjjeih?=
 =?us-ascii?Q?5H/0Oevb2cTDT1+l4KiXCFxWi9IngIxo9LpHMySqRFD0J7hMDN3yr10cqDAD?=
 =?us-ascii?Q?D/FT5g03yqrvku26C5HyqZPaGfUaY4zSxU1Fw5RD0qft2nBtQgc2lxfsBjaM?=
 =?us-ascii?Q?G0Rc70GDQ8UhY7qTQWN7D1uorbWE+ZcJxuTWeNRDQCuIE2siBUaK1LKhoyhh?=
 =?us-ascii?Q?x9mNZOucMQ+3mwyNmbbfk3j0g4IigtFipO+vpNVnRYyVdQGThUxi8jyHimd3?=
 =?us-ascii?Q?ljAyTsf2uUnzpurEHNpbZLPKWZ1Um+8Ngq0N5gc+8mNdUk5WzxgBJlBr/6K0?=
 =?us-ascii?Q?T1y4q4zw0BIi68deDcwopq2OPLb7Z4L0wjnTg8Y4Rl5jR8kLMgF3Jd7A6xhY?=
 =?us-ascii?Q?ovLamLPG453+BYweIssc4wG3FauxxnwBrxVc9WyGzeYRAcMRoVN4T2BUzmiY?=
 =?us-ascii?Q?yB+0llYZuAWwy7bsABhbLRhjrWZiyg95JpTAffzzG2UlJ6HqQWkmtAxxzRzC?=
 =?us-ascii?Q?oMBjT70uA1KRwZUaIuEXoJGX7JpU+3D1JQNCG6ulKRaagpkv/q1oTWpLU/Sx?=
 =?us-ascii?Q?KU3i0tVQxxVAudbTUiy4kPWQEkiEc9xQlUXTcBjkfUM136Olz7XKO6gT8usd?=
 =?us-ascii?Q?L2CUsZNHZmuXGx4M8h41rqbNoQtPBnwI8Yw/Vb+SIRhyQOK0AETzU/qG3Gs9?=
 =?us-ascii?Q?Xp3Z/mVabWaAO+NrCDGhHfPX9KyfXJQVnX5LpiptKlhwRruhSle62/HC5tn6?=
 =?us-ascii?Q?MjQBRJHj2SZw/ybsCm6MzAssCFT1i6d+TuKprWJt2yRvILKFEzc/oh9LeVZV?=
 =?us-ascii?Q?ciD3mgGH2jKdXEnQJH4G16MASowM88lXY0kRiRFvByJO833t/0WBggKO1bzA?=
 =?us-ascii?Q?UX8x1Z2IC9M/iaMvA4uHvcVXYKcwQJ+My6MKPmtL0t1NpPHTs5K7tV/jgE+W?=
 =?us-ascii?Q?idak5gy7lDDqrFqlnwqR/l1NikfTHQEY00ySFsoN0txltD8HHXJml2axe15a?=
 =?us-ascii?Q?mYmPqzSdwGiVCZYZdS+LrCRsDkWm5DrYOeAh7pg+xfQc/t1DY358RFpJ8L1h?=
 =?us-ascii?Q?UHcYiSS0w8eecnkI1Ocfqyc8FFx4kbu2GmnxfwQv0S6HeX/mnaxxET9XdWtl?=
 =?us-ascii?Q?TmGd+B4Jsb/LWCCx/Ed/KP4BiYJNiLzFhsLc8Y0bQkV5EQ2m0tjUwMrnkXqC?=
 =?us-ascii?Q?RVvGBYDi7yEylLShedGAIMNYZcVpaSjY+poKw2ploDlzN1exN6/GueP1y2qJ?=
 =?us-ascii?Q?PgRgolickGit0QAs0dpqZC8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sfy8ITnP11jEjZJwU1Q/H72nN2/aeUV4TWxeamvFMJIIgvf93JUpUgJm2Sq6?=
 =?us-ascii?Q?B2vNnhmuEynJ4I5ce5RS2vIc29y+2CVYatXQxQ8mD2XMldetFT0IVynJhSfo?=
 =?us-ascii?Q?18x+O82WNdRduzbY8BHW+VQNjoTWCkzolNO7SfctErgWpfFL/IlcYWv68C41?=
 =?us-ascii?Q?JrN+941gexGm7cS8bCSa0rhcQIMAu7DaZ2ddhFZBpMaoNveip/1Dr+ECvmXA?=
 =?us-ascii?Q?W6Mu4c5OmRU3aWw38so1xn4uXS1CTZ69EBwZleOH8/Axq6/XBXUNJ7UTZRqr?=
 =?us-ascii?Q?RwEReGknPkNsv5SY3c7wLTLNzlCxKqHNNvzLD2pLZP0MsMK6ao1XQqtZE3FH?=
 =?us-ascii?Q?qzxOs3r5rkwszXWPE1kAgrWcPZixoN1YgXm5lmsP9Hp8BPSHTRg08Ye6VSny?=
 =?us-ascii?Q?HFl86VByEWBVLgOaTwbcjcJusHNq8QzCPcKVSYfZaFY+Grm7MsFXNk8aUpNj?=
 =?us-ascii?Q?J2E5upW1+xvNDMg/nUeF6ozpD19WvXxlTIeZuWAGLgt7LPf8pAVl2GlhAuI2?=
 =?us-ascii?Q?I6W5C3vgkIgsYqFSsHBz53fsLYaWbZR8+2cMCRGrB+s5UUuCjRyjYI2tz7H0?=
 =?us-ascii?Q?sx9l0UU9my4ij/HjdrU5KLDLTrBx3aw4ZkqHSNVcbQ30U40ToaeKH8OeqLdj?=
 =?us-ascii?Q?Y2vzD6xaeCKnLAr2z82qhInmAPD5wAbUKgOxnlWQvWBniKAFNlYCaA3ET+oR?=
 =?us-ascii?Q?E2Bez0XpbqlgtFKRQLALp6gfLKPeky5Olznv6pUr7M4+YhG/UaUC+5EtjmU4?=
 =?us-ascii?Q?UtmSoDxchGzBYcrob67dHTrefUVfJwSbgPiUB/Thjh3pA+A3MMoWl3GRcGMK?=
 =?us-ascii?Q?T4eWQX1psP87f+yCACzzDBzLI86otpbifV5/IQLPVwgi65BVTN16YRIAS7TS?=
 =?us-ascii?Q?TKwW0GGRCtMPZWLno94Rmu6WmHaY8VCyrtUzi/zb9IhZZlfSJnC3bf8mNE4h?=
 =?us-ascii?Q?7Z3w19aAq56v9zs7z7D5jqBw20tptROUlzX/j+wxI5MhZluZi6PMy00PQONn?=
 =?us-ascii?Q?zN68ynM9dshcSJG900RHmhgZoAJ4fRGaN9je5+jZis1F+7zgu79EG6caEleE?=
 =?us-ascii?Q?bRM+P3N2QimhtB823p8I9oHCxYiZbe2q0KPqI2Hz4CmJgF4mwMkMSCS2VAZB?=
 =?us-ascii?Q?PS9QVjbjcLcayc10ZnQz2dFylJ9EwgA+4WFH73KKIXsAeQLPiXVxzMLy7n0Q?=
 =?us-ascii?Q?Gb7a+LIBWcniuZrKKFnHH+DWAf9GWmCWIfcM3vBYrkrm1WGYkk0/SQ9SxwsY?=
 =?us-ascii?Q?dw2Pi0FVkrW+chnyK/nPh2CrYApvQT0uZbeWsbqUP3AcpkM0UvuDZ1U6aXYj?=
 =?us-ascii?Q?uLWslBLwIzAkzIHT4vCCSOZQ3vGxT/0ZPwEIYSFHw5YbQ3eO66/ep7pNaBH2?=
 =?us-ascii?Q?Bss95MAbaswcR17Y0UnYuIqLT1HRRzlcf/UFLbQhyJJ/TE2lAsMvHCUXXpkq?=
 =?us-ascii?Q?t0fpjWccMcqayduDxF5cEyMrXsG19lkXUxsVRO2hKMIhGNbQbG4NI2YEFCbK?=
 =?us-ascii?Q?a6gCWVW+8KRmkZ6dK9H/GEplLgipel1Iw/6pdt/Xq5mPn4nNfjSH/xthJpSw?=
 =?us-ascii?Q?VEE5d6sADWSKX9s5g8Vr0dchmN2RTF3WLnJsYRLC3atu2S0X9rBLCvKmIPEx?=
 =?us-ascii?Q?qXqVyp9XY06WxnM2dec+nNSdedMOdt4ovaeWEzVtq0vhh4Z3aeCAEvyyYxLM?=
 =?us-ascii?Q?AGckrLyYW50wkWlzCS9FrSqVHk21s/5c4vumXoagOfLlqv5Ls1I177divAbD?=
 =?us-ascii?Q?MMRAlc00JA=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab25597f-11d5-438f-0ac2-08de5a6cbeaa
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:47:03.5984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AmHGyV/uad27Rralo8aBjXSLf9+Qz1Sg5p3xOuhdOdViP8Y5Pk1ZQuYluBShos1WCHWqxp8meSPmt/wgRtYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P192MB2084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229882

From: Theo GAIGE <tgaige.opensource@witekio.com>

python3-logging is needed as a runtime dependency of python3-pyelftools
else the readelf.py script run into the following error :

```
Traceback (most recent call last):
  File "/usr/bin/readelf.py", line 31, in <module>
    from elftools.elf.elffile import ELFFile
  File "/usr/lib/python3.12/site-packages/elftools/elf/elffile.py", line 29=
, in <module>
    from ..dwarf.dwarfinfo import DWARFInfo, DebugSectionDescriptor, DwarfC=
onfig
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/dwarfinfo.py", lin=
e 17, in <module>
    from .structs import DWARFStructs
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/structs.py", line =
10, in <module>
    from logging.config import valid_ident
ModuleNotFoundError: No module named 'logging'
```

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
Reviewed-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta=
/recipes-devtools/python/python3-pyelftools_0.32.bb
index 13e9efff8d..447c8ad6af 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -12,4 +12,4 @@ inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native"
=20
-RDEPENDS:${PN} +=3D "python3-debugger python3-pprint"
+RDEPENDS:${PN} +=3D "python3-debugger python3-pprint python3-logging"
--=20
2.43.0



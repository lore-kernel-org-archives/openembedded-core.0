Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C3C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 17:50:57 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.78])
 by mx.groups.io with SMTP id smtpd.web10.677.1707414648518039999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 09:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=kVMEnlvR;
 spf=pass (domain: ni.com, ip: 40.107.93.78, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW9xV3n+ZBEPWnwrER8YvYhZ174txhYAYFb7Fwq3vmq5jK+N2tvL16A7MAaUp+nvTiJ4yWNKbFaObMQa3NYuzxVmlUGgN8zfgM722Y2Ur4ANno1ZdYdNWxGracKyejc/YbT9px2pMZevWdlr4JuT/V4JfDE8UsvqYC+IthosjOG32j8c3EO0CaDR0WgrH1yRYJLXhOTDzL5rbc3F56FQQ2cJJ5PBFH1Va7mbTqfzVUEwRkfwm3wkNg9Au99v8o//jwS5CcM8ASErMYcDgP2B+cMTS+rsF8Gtc54YCoE8MOpZTwxdNeHnXK9urvezgiVYI8fshuzaGxic0Ko2PsiPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69mxIpBFQmi6sOeTx0IQ4oEkbGt/7/zqJQSRI3vnvi8=;
 b=Z7Tn/x+nVKKb3F48DeKIq/JoZw/6zmIIhxJtV/sfXL9LyzduvEnbvRSa3nMk0uWPumVB/A0L56EBzvN1d6JhSsBwoNvASSjuWROAjaaTrxhfzy7rTWOsU+4+rryVs8tlYaCjwhNv/cRfHO85qcbs3ytgzkl7Dllb6FPJ4Lzzt4SiWBo4x6/Vw3lzFvAOAlcWfUtkxnE4U3YtMhCMlOcNzBX9aXQYZH90v1Ws7YjMBLcv1KF1rBfleG5mzXUlXq4FWiba/EbCw50zrX+UjbuesSWqw7muOvaMaFDxMXDXq9Jp6YqsfaAVZ8QQnNd66VmN62ohu5Ephhh0UhfI77/yNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69mxIpBFQmi6sOeTx0IQ4oEkbGt/7/zqJQSRI3vnvi8=;
 b=kVMEnlvRiz0sRvsUCX3dPuBpS7gpyyAliobcpRZMxW0/ODq/jvsifbJz5WXysHHIk4IKOStnr5vkTNeg26Ht1g3mCiaX37aI221hi0vJpw6tH35DtExcoVoflAF1XVQAxqdkXa0bOxoArAJb13Y6GOe61Slb3a1QTsfJiJBZ8bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7396.namprd04.prod.outlook.com (2603:10b6:303:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 17:50:46 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 17:50:46 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH 1/3] opkg: upgrade to 0.6.3
Date: Thu,  8 Feb 2024 12:50:17 -0500
Message-ID: <20240208175020.1017580-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::13) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 015b399c-5d99-4897-e3fb-08dc28ce7a4e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PlGCpBfXM+MdVLA6fRzz0apDXoNJoGuTb1HDLvjDXVRa8XtnbHkuZz8OZkSOgUtUz1bPbJU5cEccClS7r2QozTzI7XUhjwr3qKM4Xe86FRl5cxpwNhfrbaQoFi6H0zQ9xAsKgwa+5uqb7AMURN1HE3ZUxDuPwcF2YgS2UMgTy4/Li6EHnXBneKlE1FtYT5uKlW47hUIHByPS19UizOijT8Oa0/zdqQc7G3+w80OhJqkjNrbej4b58p0O3N75EVYhDiecrNqd4vD+N7L3AbXPvsEDItRu4ozGux46nsI+X9F4lTJohwo4BsdgoIw5rJhWMShIbY+km63f2hM9ougtfwXNtM6/xUoxRkrmZI+i8QXhyiA0i/a7IYLEzr3P0xxg3F75Y/fMN+odYeaRKNH/6P6YrdxtIh4woKzYbRP6MmE5nPlLCJBrpXI9IdTLJlv3JJWQoOoLOX4myeqtEC8Iot+mtDtcadNX58x241/WELOUQ7FyhFbScN1RHL3hesxHoj5uWL5fqIEaRJrfsPkDxM21UrOU2c0GZjS8e5lI0u0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(6916009)(316002)(66476007)(6486002)(966005)(66946007)(66556008)(6512007)(36756003)(478600001)(6666004)(8936002)(4326008)(8676002)(19273905006)(1076003)(26005)(2616005)(86362001)(38100700002)(83380400001)(6506007)(5660300002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z2mcMNrTAaMcfe+rTUuAXai/zAyc2f156J6F4NmCBJrbuz4H8dGTkSTSPL4Y?=
 =?us-ascii?Q?dCb/Ha7wEpIO2rW6bekw1LFrNivBiThkZhPmq721jK4dvl2txsFWDD9SBF4H?=
 =?us-ascii?Q?HS85V6nK3O34o26eMBLOvGyln1/ltfJPlZqqfFMwIJHE4F98tQE9Wk3jC5gg?=
 =?us-ascii?Q?7WpKTiabZA8/56L6GMSWAxgzy2ISqFjf7mILEaPpEx9iipFXlTLsXOV0Fvqq?=
 =?us-ascii?Q?4k4Cdj38S3+0KEX+RTDc19fUudtMIH7WoQdQbHnD5l1B0ZDWplvlMbbPKopq?=
 =?us-ascii?Q?dMoCNqtJkNSkxQiJYiXTqU8sbBbNtfsvyHKbrtZajTvSgAkJ8fqvI/k9jjsn?=
 =?us-ascii?Q?APtb4PJDlEpXVNBRVoL1eZNipRuCacE4S7eHleCKe8uHnYEVlS0sXOcA0MVB?=
 =?us-ascii?Q?uNvJnetY5t6LrsxnoQNnmnec+V5QzY+/1zC79tM384z83HM5rZ8HHjojWPPU?=
 =?us-ascii?Q?+wHLLZW7+EuLj5iGaxZFyBPESkObh+2RU9O5Ru1g2OxHfnpY/s+IuXQXlw/2?=
 =?us-ascii?Q?EG4thIf/aRFXZeU5XjoSQKtqQ8oz9Yl/DdSy3X3twkHBBWa/+omoOc52SJv1?=
 =?us-ascii?Q?F7CkXSU1HpttDeyCZClbzrnhNyw1YP029Ser5mLkg1cg56Iv/U3fmwB5sgTE?=
 =?us-ascii?Q?aJPuLBOfrJceii43IwddWF958QfLcu1z25ZIlK/8+SN7OZjXaMDAyrmIFliu?=
 =?us-ascii?Q?pFAeoQZtqRp30cSq9w+kHHnlJifemOX6O3B6k1Mka0UyzzDV8sM/ZJ2sYg4I?=
 =?us-ascii?Q?FCq9SEUSn3qOwqXHtZbf7WELDq8wucAwcA0yGUJS6uTzNwRXPnKSsVmUoIMg?=
 =?us-ascii?Q?a2JPV6/bFLMM7PrA7ZAFKbs6+a0qJ2AmP23t3ooqDCNDa9iozUsonGaD46j7?=
 =?us-ascii?Q?zSnnmWjo15Dnaj8QEUf00HnjfOxytbgHbRRQIPBiW+tcoYgqDjhyV4CfMC42?=
 =?us-ascii?Q?whxv8TVrZFtBO7BjsTOhZ4bc8QjBUtWtGEhDDEaBqT3eL94RHQNEF1zdUaKb?=
 =?us-ascii?Q?1iMm80bDc+5tcjl5wSQHza60glK58jFryXFj8k8+T8O0U8j5W+rFhRWVffTL?=
 =?us-ascii?Q?J+NinrTDE7Rb4legbUVyGF4EKeZh6lYsiFXzWzbkY9rDgEFFVYM12rWkWxBF?=
 =?us-ascii?Q?8Y43pQ9ABYQFBrqC3NVaOKWsa/1T6B2lLICEpsE4qj205wNaxs6xuem2EK2n?=
 =?us-ascii?Q?JQnr4pHc6kB2EsFkH8yAEvffsY0PZJq4GQXBi1wcHF1Wl8Xyp10K3pcL8HrS?=
 =?us-ascii?Q?Cq7gicO5ku0wFYyFTXKl1ALUZIlEA5mGqteQScOf47xOqlSxWdKnIbvtd7co?=
 =?us-ascii?Q?UluP/AaFlLjISf/Swrwn8QqUwBPu4gTQQKnIPeIbxA+tAM+wF8wGOJ2fm7KH?=
 =?us-ascii?Q?g+9NvoSr4w5xHK2NhqipQ5B7IwZx50GuHtxpN1qm2t1+oioQ6SzC/cdw3O2H?=
 =?us-ascii?Q?US/gAXMBIDojOpp1/yNzK5hE8KsamrFZtZzNrKX8ZY+N3alhZ+CQgt5UEO2k?=
 =?us-ascii?Q?mf0OcYN8tZsnXpJ7NTDAJejggMWUmVlaDi3fMArYzhNN/yEYt+YYP0Hw9rI0?=
 =?us-ascii?Q?CutnGXLkfmDCFAKvyppiNafK+FA8kFwhzJ3pxwiH?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015b399c-5d99-4897-e3fb-08dc28ce7a4e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:50:46.1259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+kn6mVQxXv78lFCp5ybCT8EC3JqFG7T4U2zeb97BAsnxgeGOMXLMbU6UmBkYABiP7hQQd/zIzdhoRYd9waBhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 17:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195163

Release Notes for opkg-0.6.3
=3D=3D=3D=3D

- [Added](https://git.yoctoproject.org/opkg/commit/?id=3Def743b75745939df21=
0a9e6a70a44d69181ef05a) new configuration options to enable preserving ACLs=
 and XAttrs when extracting IPKs.

- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=3D9e62a38a4a52974007=
e9ea174504c42069da1a02) a bug where some library locales might mismatch the=
 user environment. Opkg will now consistently honor the environment's local=
e.

---

Updated recipe HOMEPAGE and BUGTRACKER links to reflect deprecation
of the projects' google code page.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../0001-libopkg-Use-libgen.h-to-provide-basename-API.patch | 2 +-
 meta/recipes-devtools/opkg/{opkg_0.6.2.bb =3D> opkg_0.6.3.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.6.2.bb =3D> opkg_0.6.3.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-p=
rovide-basename-API.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Us=
e-libgen.h-to-provide-basename-API.patch
index cff091fabf..61581e752b 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-=
basename-API.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-=
basename-API.patch
@@ -12,7 +12,7 @@ dropped from string.h [1]
=20
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd2248=
7bb64470881e86a92e7
=20
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/=
12]
+Upstream-Status: Backport [74fc3a991f974095644897d18d43846b5f359dae]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 v2: Do not override basename wholesale
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.3.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.6.2.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.3.bb
index 71c0b44aed..1f15c44e3e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Open Package Manager"
 SUMMARY:libopkg =3D "Open Package Manager library"
 SECTION =3D "base"
-HOMEPAGE =3D "http://code.google.com/p/opkg/"
+HOMEPAGE =3D "https://git.yoctoproject.org/opkg/"
 DESCRIPTION =3D "Opkg is a lightweight package management system based on =
Ipkg."
-BUGTRACKER =3D "http://code.google.com/p/opkg/issues/list"
+BUGTRACKER =3D "https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=
=3DProduct%3Aopkg"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
                     file://src/opkg.c;beginline=3D4;endline=3D18;md5=3Dd62=
00b0f2b41dee278aa5fad333eecae"
@@ -19,7 +19,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
=20
-SRC_URI[sha256sum] =3D "ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a=
53fcca474adbd5"
+SRC_URI[sha256sum] =3D "f3938e359646b406c40d5d442a1467c7e72357f91ab822e442=
697529641e06de"
=20
 # This needs to be before ptest inherit, otherwise all ptest files end pac=
kaged
 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
--=20
2.43.0



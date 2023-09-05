Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B96C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 07:30:50 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.125])
 by mx.groups.io with SMTP id smtpd.web10.16205.1693899044837321477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 00:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=HiiPwhjM;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.125, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIpBDmSOrfwqmXXbJHSHJ13uIy13Qqso6U7kyZkEfc3EpCtOXDMstSTR5q5eCRc7KVXXN7Pdt/DyYqznaUO2yVuiHeogTetL7V8DMFYCQG7GPOxhKLjOHMKej/wYLiM0qdfvr4AZce0y7Ps2SFqf14ofviuMexHREGmiCm/SAHXay7uIks32E1Brlgfa3vRJ7kA9jH4oEg87e+IprbLyE2E/2c1ZYX3xEOWp8AyIKTNsRQo+Iz/hsmsAGZkMHaQeqO1PunTTuSEXQpRQLfS2M7scMgcwoOgPBA7LWTqh0B1diSJ9QMhfo4zu9yddfssrLUF0KisrwHl/Qg5Slx0bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZS/h/GuTo0TlZmNzH1qq+KNuXQVum22/niJSafocS8=;
 b=LnzECJse4RynOwp0oW1onzqcrD/vKgD4jSFW+GGEW8p7ah6e5wpMPVQNTpJWCuul+3ENDyuIj4+GE9hDFnli2VmWmPJh8V4IxJnO+TUFCMnXuVy/2yNyH/46LndMwsFUjGuMUbTKrDvsMRqgV2Xwnh17laKh6UlZ2itgVJv2MJCB/myuibYbTkHbL/hNT2p2AbmwtZ3wRc/36gDA9WSTG73HTEw85riSfdbqCNiuytNlxUX7Nz1XjMD71hvltnTY2dDi+5Oo63LFHDp69PFnibRi1bLVnGTmf9zH1ytjK39+EVhPnGqrL5ZuJyVEaOfpC7nk57lEC77HHFAW6DmAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZS/h/GuTo0TlZmNzH1qq+KNuXQVum22/niJSafocS8=;
 b=HiiPwhjMmKW2rOMqHzttcrT+6bfZ1bcbEreDNbwSDZvpi12v+FRGOXOsPum1NBnR1C54fq7H0YRtr2QABAl60JdJ3z5APNvFxieI8IDQUIuUfOdwrqrysObdVdouiveKPa6VtUgnPpYTsyqWBbOr7Uy9ZCD/BI3AYb/W1D/OEqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by OS3PR01MB5575.jpnprd01.prod.outlook.com (2603:1096:604:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:30:39 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:30:39 +0000
From: Yuta Hayama <hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Yuta Hayama <hayama@lineo.co.jp>
Subject: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of boundary values
Date: Tue,  5 Sep 2023 16:29:06 +0900
Message-ID: <20230905072920.615-1-hayama@lineo.co.jp>
X-Mailer: git-send-email 2.42.0.windows.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: OSAPR01CA0316.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::16) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|OS3PR01MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4a8fc8-f009-4c12-9d7c-08dbade20116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DOrfROf4UwBWgnPAMDq9Qz/G8uu28rcRYK5iNozY0OzNx8IYjJOviTWjXP5jcZfHm0FKPHml9vFZ8JE5pOvatHjOYqzUtI0kB76Bu5c/YpFVNN7QjPGJFsaN1rReut2OUTATkWTL2FhCVcdt4LDmcxNBOxGZCI5EoHjQhoK2GPAjmQ8VURZRJ3sWnzOD2dSnzXRvif6W/v0asybZCml/Gmujyq7NoxNOjlFbp6U7RaDOhKTIOE1UgOQMcasYVfFOao/YcaclKXBHq9EzR89/WgcfMYPl34QyLMSJy7H35hVd2plNRuNhUH8xxWvs8ra48Ewzp7HbAloYoCm9WeMxLOK184byQ/ZlFigTh1MlDPM7zuTZoPdK0SgAw3u7YJZVskBjCvrbYVurJfmU8jON/QuY0FHGaCTm9erpm6qFZGq+p7oNtrfafJ2r1KibFaNDtDKXufFmJhxoJoUEUTan+WkQmB6iK1JSCQmCNj+TPlaphp482zIRcqflYdR5oCD6UdXJRSVtolVgQ2g80JG7huMsuoBtxSrG2nSOl+Y7/c1pjJ12nO4HALmaWQ/4Vw6nyotMi+EhCwSPu894hEqZy8RBLB7F8bqRDzYqDIgmbqSRgDZWXMZTwRCd9EnX7+l/ZBRQG24TUNXQNftPsXlfnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(346002)(376002)(136003)(366004)(451199024)(1800799009)(186009)(66946007)(66556008)(66476007)(6916009)(478600001)(38100700002)(38350700002)(316002)(2906002)(41300700001)(86362001)(8936002)(8676002)(4326008)(5660300002)(6506007)(83380400001)(6512007)(6666004)(6486002)(52116002)(2616005)(107886003)(26005)(1076003)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mAW+7tMWiufkzf2eilp+E/Hf+YYVOhUUkPwY0gFvA6w1ACsLxqirIwbggEnC?=
 =?us-ascii?Q?HfTRNM80VcPIKqqK5mBKGG4X+aXRz6hf+v23hmz0wSued4pU/1by+qjqyw+m?=
 =?us-ascii?Q?XpH6bx0FElMqkU4vPid2exPqSv7Rn0aNXlfexxQD9QXuhx6u0EpDnxoERRd7?=
 =?us-ascii?Q?ipWjGri7fxoFJ+/NMb7GkrUdFAxtT4P4506aGz0MVzhzKaSqDPC356mFktrr?=
 =?us-ascii?Q?uTNOB1oLiSWe3U+MFxJf8a+KgmUmlCbdjP8ogm3NQm9LEHUn6ORr7lqFdrHm?=
 =?us-ascii?Q?tHX0U9d+Mo3q6rk/C+zIkQxASOPpw0kT1H6ep8LKliDScq5VVzLxfwSnhxez?=
 =?us-ascii?Q?Vn2u8YxMj8jEcmlRi604GF9il9+IyQ0qq4OrC6AtrRY3Jdq4jpMd00GRhbQh?=
 =?us-ascii?Q?Hb4v5Ril0eKjj1lhfJm87eWH7ZBHcXUN2fWr3ax8quK8j/ym8mRYus9u2Lkt?=
 =?us-ascii?Q?606Rz7xVx2+5EY9EvNpsRrAxaCMxI+KVEj9Y01zeG4PNBEAt6fJRVLIcpSY8?=
 =?us-ascii?Q?mkrB6URxOgNyhBAsrnUDahVTddlznba77P8pZhdq+SPDA0Bab3fHzaUWKzTD?=
 =?us-ascii?Q?j9Srs3FrYlQPZtlr9a3owubiA3bP3IRT/V+Z9H2DuKdP0CGUVVsHTJdoyQ3v?=
 =?us-ascii?Q?RJ3a/V/3qJYYmz/Y91Ssm4VeY9lJeq0+VRcRqN/oLwxq6wfRHuCxH5YPhvok?=
 =?us-ascii?Q?slCzHiSx8+usTeXk27f4INhPsFXO0z5lp3xtes+ksa8cbBDUmXc0XJx+JD4y?=
 =?us-ascii?Q?jqc3paCmlr6Fc5ynOyOba/QrgKlKOTYht/HIkeBaZTvRgRZ7tTKoAH/1XScK?=
 =?us-ascii?Q?7ozWdZvVzKhWyGi5zFLcFAgiBFOCVKpHnRdmrIAAdEstsRGHDLR35rtygI/I?=
 =?us-ascii?Q?KNXyh/L3RX83Hd/VbVPmzctO2aRwqRell9hxSxQnY5EFxoA2W0fgj/di1Iw6?=
 =?us-ascii?Q?NjFI/QZR6qHZ9C+rHogXkol0+eqqG8nIUN+gB9+ivnhyDH4bModrmnfBsSNX?=
 =?us-ascii?Q?8rTDkd/yt4NajT92CE0bYCaTqzFFWJ6DXazC9tUTZG/hYqoWJgFVzFI8vCiD?=
 =?us-ascii?Q?baPwR82gTP68C1Bhx9674Lm92m+jAMvBMZ3d7o+bvw9vtjiWzZ4o8qoVxH4U?=
 =?us-ascii?Q?29RyR0i5RGkPP1zF1qmd765Q/WLOAU7sciF9N94Tsn9ictr24GNE4HX3hwdr?=
 =?us-ascii?Q?uEEW5z55XyqjPQzAHeepZnOgpJ3HTPaWLs9LgfVA0aKQwbRfPfETXWqzQEII?=
 =?us-ascii?Q?6E09TW2/DW8/tRpknvzTaAwAjsXn23VVNXZEWFnhZLuKX2E7N6LkPP/pCoj7?=
 =?us-ascii?Q?l1c1qrj1f5Z2hQxMZLoJ2dfmNjR+YxlMlb9sjmwOMOP4jE7+M6fqqy3iEnFP?=
 =?us-ascii?Q?9cjmQvlIRbXxndBudctmvjnv5txsEf/mV1bX0EaxsMlcj1bU23GVNvnTPqeX?=
 =?us-ascii?Q?YWamfv1kvuM2wPhktzsEi9vxjurV2D9O+fhQRQWrt6CE5E8IH/rcFI8CUugO?=
 =?us-ascii?Q?l/6IeC9S3uBmia5/XCx5zFBinQ9amVQNMxbaSngG5XdJxdvx/3Dgcmu+tUSd?=
 =?us-ascii?Q?Gq1/+qYc2Mjdn4rWXG535L4t28Rm9MLkA4IN4c4g?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4a8fc8-f009-4c12-9d7c-08dbade20116
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:30:39.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clApqnTazdMxEyrJJZuGdhV0YNFOcmFgNFRYcoYzbrsEpgtLrWHL10U2EGGR5MO9OFLB8UEoOaP0AZGp31Pu8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5575
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187200

affected_versions in kernel_cves.json does not mean "first affected version
to last affected version" but actually "first affected version to fixed
version". Therefore, the variable names, conditional expressions, and
CVE_STATUS descriptions should be fixed.

For example, when the script was run against v6.1, if affected_versions was
"xxx to 6.1", the output was "cpe-stable-backport: Backported in 6.1", but
this should be "fixed-version: Fixed from version 6.1".

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 .../linux/generate-cve-exclusions.py               | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/re=
cipes-kernel/linux/generate-cve-exclusions.py
index 3bc1c7096f..b936f843e2 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -62,17 +62,17 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status_ve=
rsion"
             continue
=20
         affected =3D data["affected_versions"]
-        first_affected, last_affected =3D re.search(r"(.+) to (.+)", affec=
ted).groups()
+        first_affected, fixed =3D re.search(r"(.+) to (.+)", affected).gro=
ups()
         first_affected =3D parse_version(first_affected)
-        last_affected =3D parse_version(last_affected)
+        fixed =3D parse_version(fixed)
=20
-        if not last_affected:
+        if not fixed:
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
             print(f'CVE_STATUS[{cve}] =3D "fixed-version: only affects {fi=
rst_affected} onwards"')
-        elif last_affected < version:
+        elif fixed <=3D version:
             print(
-                f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed after versio=
n {last_affected}"'
+                f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed from version=
 {fixed}"'
             )
         else:
             if cve in stream_data:
@@ -87,9 +87,9 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status_vers=
ion"
                         # TODO print a note that the kernel needs bumping
                         print(f"# {cve} needs backporting (fixed from {bac=
kport_ver})")
                 else:
-                    print(f"# {cve} needs backporting (fixed from {last_af=
fected})")
+                    print(f"# {cve} needs backporting (fixed from {fixed})=
")
             else:
-                print(f"# {cve} needs backporting (fixed from {last_affect=
ed})")
+                print(f"# {cve} needs backporting (fixed from {fixed})")
=20
         print()
=20
--=20
2.25.1



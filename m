Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EFBC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:58:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web10.54961.1697810316126249416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G538AUeX;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G538AUeX;
 spf=pass (domain: arm.com, ip: 40.107.20.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfgpfPIXbwavjNmgVQevzeiTj4rPt8RC3JYBP/vrh0=;
 b=G538AUeX5WxhwT0OkCwWRFKuGsyr/QDWg1o/rbAuTA4gwpomXvoNmjKCMn0wkSDyAalKvzZVI12NeKa6EJ+8/N3zSTUu4L08HQ5y17iUJFBJ9DTTJxC2U7Awa9evdXkGsExnLnsP89UhpcLhJwh/k5TzbAAV/99q+j6Fe3sntrM=
Received: from DU2PR04CA0218.eurprd04.prod.outlook.com (2603:10a6:10:2b1::13)
 by PAXPR08MB7419.eurprd08.prod.outlook.com (2603:10a6:102:2ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:58:32 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::24) by DU2PR04CA0218.outlook.office365.com
 (2603:10a6:10:2b1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 13:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 13:58:31 +0000
Received: ("Tessian outbound 36e2b13fe8d0:v215"); Fri, 20 Oct 2023 13:58:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db5883b94a44e633
X-CR-MTA-TID: 64aa7808
Received: from fe8898ded891.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EA4BBA1-EDC7-4452-85A2-C2F4B44B7F67.1;
	Fri, 20 Oct 2023 13:58:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe8898ded891.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Oct 2023 13:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krbeM4BRy6T6pfPbX66LqqJLAP9VCZLFgyx33mD9BHFIpqt0TAlhPgyCj5VMsZ52Rw8yQqjQLiFOi9UyaHKX5OVsQOACkihxFmkeQvR4fOujSDSplXHncqVPPHc51ewUpRfClDoqUZS5jVg67UiFfYcJizc0fd4UofqIzSBDjfvE+fwDFbz0L0ZMTPKeoubd5DzSUyOcgFaI1XlPZhbpFfZfPS1bcC65kRcXpHx3L1cz9BoR+xhyBEX8Q1KKy64RQr9vFGqIaMSI5takmSMxtfI57UogU9BJuLeJAkxRD9wx0oxUw37s8QD63Km/GzlbwpQT7ST7VjXqQJ5pTm39kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJfgpfPIXbwavjNmgVQevzeiTj4rPt8RC3JYBP/vrh0=;
 b=hXZo1f4YV0hqZaws0XoPVCkYcxe4aLu91Du/JKT65CUVbftJMXW1zBB8Ip+b6p4Ejpzr0wyaMz2h+bOlMYWXsCRBGtyLMk3eCW+RApS0PnP+rSGkUoCpkhoVameYb5YaVQYHz1Ox4HaxXUAzwTsOfMVodNT40hobML9a43OlQJBKTz65rfHK5bY//hhr+ZNBvYKrq/P5MHhUWeLFeCEnpmIXRLSCj/z+Edesum5bd2seoGL7/J/v5A1dpFPMgf6ei3fCDP6R4mjHL0Wjtvn2bdOgZOpnzmI9F/eEKiXZeHh023cV9Y+s/0mXCUKEp+OrzeR277FLxx5yzsL9Vucdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfgpfPIXbwavjNmgVQevzeiTj4rPt8RC3JYBP/vrh0=;
 b=G538AUeX5WxhwT0OkCwWRFKuGsyr/QDWg1o/rbAuTA4gwpomXvoNmjKCMn0wkSDyAalKvzZVI12NeKa6EJ+8/N3zSTUu4L08HQ5y17iUJFBJ9DTTJxC2U7Awa9evdXkGsExnLnsP89UhpcLhJwh/k5TzbAAV/99q+j6Fe3sntrM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8955.eurprd08.prod.outlook.com (2603:10a6:10:466::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 13:58:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 13:58:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] shared-mime-info: Fix missing sentinel
 warning
Thread-Topic: [OE-core] [PATCH v2] shared-mime-info: Fix missing sentinel
 warning
Thread-Index: AQHaArPyUxE8iuBwikao9X9nLAbZ4bBStYSA
Date: Fri, 20 Oct 2023 13:58:22 +0000
Message-ID: <81CD76E7-0BA0-4ED1-AA12-9C826E35843C@arm.com>
References: <20231019174423.2873569-1-raj.khem@gmail.com>
In-Reply-To: <20231019174423.2873569-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8955:EE_|DU6PEPF0000B61C:EE_|PAXPR08MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: fd09f055-67f8-4424-b0ef-08dbd174a50d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ny/ntmwUhcmkNr7ADl9ObTxd/enlgnSlSY3pSEy0YqdON+gT1Mxr4x0z69zPnZXfzeUwu3JWNwzPhZhrEpMrXQhsCi2L3wNZX0SiKsSIEzSBo6T8M/DPLTfOXSzX8SOSirOkhJc8MRU3oskStVqH2uzz1gMb6itCCH39i+tR5MzfY7KTuLUVsNiO+ekZy6gmQ8A3GRYO48nkoFyWV6CB4Se4kP1Q4HfIepHXXzUT4QBT9z+lmExkUwCuThq/9NeQurilDe85FeF3D+v383j8/tPV66X1M+kB+4jFcs4PO6b6Ncll9dq89kLqVPvuB+QAps741Uljp7WlVjLrJEdcSOU7skX9k8Iz+m00Snq1SL40HElXPwhMGYc724CyyX2P7JDoLDKm2sawh3HNQbT/E2JMbTSx3g5sh9dz6iBXCd2f39uMee9DTW/xWc2si1l93x0lpK0esgDTswjUNzp0cHjOeGExQ0kuPj5iVHWWA44fCMXCirh4X4E9fWNcbEmSZ4pDcWJlfsMrPV3Rfv5yaa66YKzYVRdlzhyZVdWGL5QIIomey26BwMg18kkNxWAs1ANSNBTvNby6NWnHmi1aIrndFtFdRWItKGa0EvNLS9zWl06OPXzpkO5ZJiYsVBqh9NAR+BajfVFOuFthZTXp5sSC57z4SsZGwLJBcpPSBf4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(136003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(86362001)(66899024)(36756003)(5660300002)(76116006)(66476007)(316002)(66556008)(66946007)(64756008)(6916009)(71200400001)(478600001)(8676002)(66446008)(8936002)(91956017)(6486002)(966005)(33656002)(30864003)(4326008)(2906002)(38100700002)(53546011)(2616005)(122000001)(6512007)(83380400001)(41300700001)(26005)(6506007)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93E556698D14164D9CCFF69649E760E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8955
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	be924c59-bee9-4906-d76c-08dbd1749f5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qh92seHbV3Vh+CK/qkOf1Uh72I4rQGNNp85YZYu9b1fmr27W4izRXdJlPNI3YGPZlWEbQAt/oFdurMH2MwYJ3uifYIr4pJe805OwAzNTC5/Uau7Cdno+lIIbpYKf1uPPt+luUoBjbkQ63rtq8T6BMW4d4AsHLL5t24wUbovvqn+5lbVyPryd3WbXebBE4W8wsQY9m4YUtedZYtN6SGbMzRUk6aVs/ALd4wf5/oVOjBWYAMSAEfhLhGDKK1OpaWtK6YdXu2ldiSvluY4fD6kQvgQXry+8nw99fNXZlfCzIu8R1MgU1HRkscSifYOoOk361gI9NT9hWWiJydl3V1DljdNSkTtmdxhKVDO8COy1AFPp4MY/ihsq1luz2Qb0WmHNaen33NKdzAknwhm5TJ9HcQGrUkSOGseEyvsXvadiUc3vKos2Pci8AUixGA6VM02MiNzXOXb/SInEBtVKBZMXeSqzGtukxWneP1NBwDkEhBG8QhvCrlaEn935jMlw+raBd0je7PJeW3lMa9eHQ40pG9d5eIHRR2j69S5mO8AliHhkq1cqrvy9XLSTBYRBFSt/4y3JTRlKU+37Y3+jL8+mmAX1JeTDE2PN/D0KAeEYDILBzLwxejV6o+7CskMiwuuTGh5XCUmgAKvWTh2y06NsCIbsiATfdIg/QOx6kpdHCwZh2MOZpjT3mOod8SWRuXF42hl4m5Pe44UnqJNo53Q4GSjz826+eqBvdJYtusj+l7BsBrEwgOI9h3tRnrLm6d276X/+/LTTSap0x37a0tNjgQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799009)(40470700004)(36840700001)(46966006)(40480700001)(30864003)(2906002)(966005)(40460700003)(6486002)(478600001)(5660300002)(6862004)(41300700001)(4326008)(8936002)(8676002)(316002)(70206006)(70586007)(66899024)(36860700001)(47076005)(83380400001)(356005)(86362001)(36756003)(33656002)(81166007)(82740400003)(53546011)(2616005)(26005)(336012)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:58:31.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd09f055-67f8-4424-b0ef-08dbd174a50d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7419
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189535

We might want to belt-and-braces this by backporting the fix to LLVM too?  =
https://github.com/llvm/llvm-project/issues/6057

Ross

> On 19 Oct 2023, at 18:44, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Clang finds it, gcc does not.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Some more warnings fixed with clang
> .../0001-Fix-literal-as-per-c-11.patch        | 279 ++++++++++++++++++
> ...001-Fix-string-literal-concatenation.patch |  39 +++
> .../shared-mime-info/shared-mime-info_git.bb  |   5 +-
> 3 files changed, 322 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info=
/0001-Fix-literal-as-per-c-11.patch
> create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info=
/0001-Fix-string-literal-concatenation.patch
>=20
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-=
Fix-literal-as-per-c-11.patch b/meta/recipes-support/shared-mime-info/share=
d-mime-info/0001-Fix-literal-as-per-c-11.patch
> new file mode 100644
> index 00000000000..25f409c206e
> --- /dev/null
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-lit=
eral-as-per-c-11.patch
> @@ -0,0 +1,279 @@
> +From 157c16b09f54741aefbc4be6a3507455f0378389 Mon Sep 17 00:00:00 2001
> +From: Biswapriyo Nath <nathbappai@gmail.com>
> +Date: Sun, 8 Oct 2023 13:26:43 +0000
> +Subject: [PATCH] Fix missing sentinel warning with clang
> +
> +This fixes the compiler warnings similar as following.
> +
> +../src/update-mime-database.cpp:393:50: warning: missing sentinel in fun=
ction call [-Wsentinel]
> +  393 |                         g_strconcat(namespaceURI, " ", localName=
, NULL),
> +      |                                                                 =
      ^
> +      |                                                                 =
      , nullptr
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mim=
e-info/-/commit/157c16b09f54741aefbc4be6a3507455f0378389]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/update-mime-database.cpp | 58 ++++++++++++++++++------------------
> + 1 file changed, 29 insertions(+), 29 deletions(-)
> +
> +--- a/src/update-mime-database.cpp
> ++++ b/src/update-mime-database.cpp
> +@@ -390,7 +390,7 @@ static void add_namespace(Type *type, co
> + }
> +=20
> + g_hash_table_insert(namespace_hash,
> +- g_strconcat(namespaceURI, " ", localName, NULL),
> ++ g_strconcat(namespaceURI, " ", localName, nullptr),
> + type);
> + }
> +=20
> +@@ -1023,7 +1023,7 @@ static void write_out_type(gpointer key,
> + char *lower;
> +=20
> + lower =3D g_ascii_strdown(type->media, -1);
> +- media =3D g_strconcat(mime_dir, "/", lower, NULL);
> ++ media =3D g_strconcat(mime_dir, "/", lower, nullptr);
> + g_free(lower);
> + #ifdef _WIN32
> + fs::create_directory(media);
> +@@ -1032,7 +1032,7 @@ static void write_out_type(gpointer key,
> + #endif
> +=20
> + lower =3D g_ascii_strdown(type->subtype, -1);
> +- filename =3D g_strconcat(media, "/", lower, ".xml.new", NULL);
> ++ filename =3D g_strconcat(media, "/", lower, ".xml.new", nullptr);
> + g_free(lower);
> + g_free(media);
> + media =3D NULL;
> +@@ -1622,7 +1622,7 @@ static Magic *magic_new(xmlNode *node, T
> + magic_free(magic);
> + magic =3D NULL;
> + (*error)->message =3D g_strconcat(
> +- _("Error in <match> element: "), old, NULL);
> ++ _("Error in <match> element: "), old, nullptr);
> + g_free(old);
> + } else if (magic->matches =3D=3D NULL) {
> + magic_free(magic);
> +@@ -1843,7 +1843,7 @@ static TreeMagic *tree_magic_new(xmlNode
> + tree_magic_free(magic);
> + magic =3D NULL;
> + (*error)->message =3D g_strconcat(
> +- _("Error in <treematch> element: "), old, NULL);
> ++ _("Error in <treematch> element: "), old, nullptr);
> + g_free(old);
> + }
> + }
> +@@ -1960,7 +1960,7 @@ static void delete_old_types(const gchar
> +=20
> + for (i =3D 0; i < G_N_ELEMENTS(media_types); i++)
> + {
> +- const fs::path media_dir =3D g_strconcat(mime_dir, "/", media_types[i]=
, NULL);
> ++ const fs::path media_dir =3D g_strconcat(mime_dir, "/", media_types[i]=
, nullptr);
> +=20
> + if (!fs::is_directory(fs::status(media_dir)))
> + continue;
> +@@ -1973,13 +1973,13 @@ static void delete_old_types(const gchar
> + continue;
> +=20
> + char *type_name =3D g_strconcat(media_types[i], "/",
> +- dir_entry.path().filename().string().c_str(), NULL);
> ++ dir_entry.path().filename().string().c_str(), nullptr);
> + type_name[strlen(type_name) - 4] =3D '\0';
> + if (!g_hash_table_lookup(types, type_name))
> + {
> + char *path;
> + path =3D g_strconcat(mime_dir, "/",
> +- type_name, ".xml", NULL);
> ++ type_name, ".xml", nullptr);
> + #if 0
> + g_warning("Removing old info for type %s",
> + path);
> +@@ -2002,7 +2002,7 @@ static void add_ns(gpointer key, gpointe
> + Type *type =3D (Type *) value;
> +=20
> + g_ptr_array_add(lines, g_strconcat(ns, " ", type->media,
> +-   "/", type->subtype, "\n", NULL));
> ++   "/", type->subtype, "\n", nullptr));
> + }
> +=20
> + /* Write all the collected namespace rules to 'XMLnamespaces' */
> +@@ -2038,7 +2038,7 @@ static void write_subclass(gpointer key,
> +=20
> + for (l =3D list; l; l =3D l->next)
> + {
> +- line =3D g_strconcat (static_cast<const gchar *>(key), " ", l->data, "=
\n", NULL);
> ++ line =3D g_strconcat (static_cast<const gchar *>(key), " ", l->data, "=
\n", nullptr);
> + fwrite(line, 1, strlen(line), stream);
> + g_free (line);
> + }
> +@@ -2061,7 +2061,7 @@ static void add_alias(gpointer key, gpoi
> +=20
> + g_ptr_array_add(lines, g_strconcat(alias, " ", type->media,
> +   "/", type->subtype, "\n",=20
> +-   NULL));
> ++   nullptr));
> + }
> +=20
> + /* Write all the collected aliases */
> +@@ -2092,7 +2092,7 @@ static void add_type(gpointer key, gpoin
> + {
> + GPtrArray *lines =3D (GPtrArray *) data;
> +=20
> +- g_ptr_array_add(lines, g_strconcat((char *)key, "\n", NULL));
> ++ g_ptr_array_add(lines, g_strconcat((char *)key, "\n", nullptr));
> + }
> +=20
> + /* Write all the collected types */
> +@@ -2127,7 +2127,7 @@ static void write_one_icon(gpointer key,
> + FILE *stream =3D (FILE *)data;
> + char *line;
> +=20
> +- line =3D g_strconcat (mimetype, ":", iconname, "\n", NULL);
> ++ line =3D g_strconcat (mimetype, ":", iconname, "\n", nullptr);
> + fwrite(line, 1, strlen(line), stream);
> + g_free (line);
> + }
> +@@ -2168,7 +2168,7 @@ static void check_in_path_xdg_data(const
> + dirs[n] =3D g_strdup(env);
> + else
> + dirs[n] =3D g_build_filename(g_get_home_dir(), ".local",
> +- "share", NULL);
> ++ "share", nullptr);
> + n++;
> +=20
> + for (i =3D 0; i < n; i++)
> +@@ -3588,7 +3588,7 @@ newest_mtime(const char *packagedir)
> + while ((name =3D g_dir_read_name(dir))) {
> + char *path;
> +=20
> +- path =3D g_build_filename(packagedir, name, NULL);
> ++ path =3D g_build_filename(packagedir, name, nullptr);
> + retval =3D g_stat(path, &statbuf);
> + g_free(path);
> + if (retval < 0)
> +@@ -3609,7 +3609,7 @@ is_cache_up_to_date (const char *mimedir
> + char *mimeversion;
> + int retval;
> +=20
> +- mimeversion =3D g_build_filename(mimedir, "/version", NULL);
> ++ mimeversion =3D g_build_filename(mimedir, "/version", nullptr);
> + retval =3D g_stat(mimeversion, &version_stat);
> + g_free(mimeversion);
> + if (retval < 0)
> +@@ -3694,7 +3694,7 @@ int main(int argc, char **argv)
> + }
> + }
> +=20
> +- package_dir =3D g_strconcat(mime_dir, "/packages", NULL);
> ++ package_dir =3D g_strconcat(mime_dir, "/packages", nullptr);
> +=20
> + if (!fs::exists(mime_dir) && !fs::is_directory(fs::status(mime_dir)))
> + {
> +@@ -3747,7 +3747,7 @@ int main(int argc, char **argv)
> +=20
> + g_hash_table_foreach(globs_hash, collect_glob2, &glob_list);
> + glob_list =3D g_list_sort(glob_list, (GCompareFunc)compare_glob_by_weig=
ht);
> +- globs_path =3D g_strconcat(mime_dir, "/globs.new", NULL);
> ++ globs_path =3D g_strconcat(mime_dir, "/globs.new", nullptr);
> + globs =3D fopen_gerror(globs_path, error);
> + if (!globs)
> + goto out;
> +@@ -3761,7 +3761,7 @@ int main(int argc, char **argv)
> + goto out;
> + g_free(globs_path);
> +=20
> +- globs_path =3D g_strconcat(mime_dir, "/globs2.new", NULL);
> ++ globs_path =3D g_strconcat(mime_dir, "/globs2.new", nullptr);
> + globs =3D fopen_gerror(globs_path, error);
> + if (!globs)
> + goto out;
> +@@ -3782,7 +3782,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *magic_path;
> + int i;
> +- magic_path =3D g_strconcat(mime_dir, "/magic.new", NULL);
> ++ magic_path =3D g_strconcat(mime_dir, "/magic.new", nullptr);
> + stream =3D fopen_gerror(magic_path, error);
> + if (!stream)
> + goto out;
> +@@ -3807,7 +3807,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *ns_path;
> +=20
> +- ns_path =3D g_strconcat(mime_dir, "/XMLnamespaces.new", NULL);
> ++ ns_path =3D g_strconcat(mime_dir, "/XMLnamespaces.new", nullptr);
> + stream =3D fopen_gerror(ns_path, error);
> + if (!stream)
> + goto out;
> +@@ -3823,7 +3823,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> +=20
> +- path =3D g_strconcat(mime_dir, "/subclasses.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/subclasses.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> +@@ -3839,7 +3839,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> +=20
> +- path =3D g_strconcat(mime_dir, "/aliases.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/aliases.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> +@@ -3855,7 +3855,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> +=20
> +- path =3D g_strconcat(mime_dir, "/types.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/types.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> +@@ -3871,7 +3871,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *icon_path;
> +=20
> +- icon_path =3D g_strconcat(mime_dir, "/generic-icons.new", NULL);
> ++ icon_path =3D g_strconcat(mime_dir, "/generic-icons.new", nullptr);
> + stream =3D fopen_gerror(icon_path, error);
> + if (!stream)
> + goto out;
> +@@ -3887,7 +3887,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *icon_path;
> +=20
> +- icon_path =3D g_strconcat(mime_dir, "/icons.new", NULL);
> ++ icon_path =3D g_strconcat(mime_dir, "/icons.new", nullptr);
> + stream =3D fopen_gerror(icon_path, error);
> + if (!stream)
> + goto out;
> +@@ -3903,7 +3903,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> + int i;
> +- path =3D g_strconcat(mime_dir, "/treemagic.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/treemagic.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> +@@ -3928,7 +3928,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> +=20
> +- path =3D g_strconcat(mime_dir, "/mime.cache.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/mime.cache.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> +@@ -3944,7 +3944,7 @@ int main(int argc, char **argv)
> + FILE *stream;
> + char *path;
> +=20
> +- path =3D g_strconcat(mime_dir, "/version.new", NULL);
> ++ path =3D g_strconcat(mime_dir, "/version.new", nullptr);
> + stream =3D fopen_gerror(path, error);
> + if (!stream)
> + goto out;
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-=
Fix-string-literal-concatenation.patch b/meta/recipes-support/shared-mime-i=
nfo/shared-mime-info/0001-Fix-string-literal-concatenation.patch
> new file mode 100644
> index 00000000000..7825c39312b
> --- /dev/null
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-str=
ing-literal-concatenation.patch
> @@ -0,0 +1,39 @@
> +From ccf704a606625bc62e70dbe815b309c22a0bda05 Mon Sep 17 00:00:00 2001
> +From: Tobias Mayer <tobim@fastmail.fm>
> +Date: Sun, 8 Oct 2023 00:11:49 +0200
> +Subject: [PATCH] Fix string literal concatenation
> +
> +Clang is not able to disambiguate between multiple string literatals
> +and C++11 user defined literals. Spaces help.
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mim=
e-info/-/commit/12a3a6b1141c704fc594379af1808bb9008d588c]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/update-mime-database.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/update-mime-database.cpp b/src/update-mime-database.cpp
> +index 733ba06..29d82a9 100644
> +--- a/src/update-mime-database.cpp
> ++++ b/src/update-mime-database.cpp
> +@@ -2158,7 +2158,7 @@ static void check_in_path_xdg_data(const char *mim=
e_path)
> +=20
> + env =3D getenv("XDG_DATA_DIRS");
> + if (!env)
> +- env =3D "/usr/local/share/"PATH_SEPARATOR"/usr/share/";
> ++ env =3D "/usr/local/share/" PATH_SEPARATOR "/usr/share/";
> + dirs =3D g_strsplit(env, PATH_SEPARATOR, 0);
> + g_return_if_fail(dirs !=3D NULL);
> + for (n =3D 0; dirs[n]; n++)
> +@@ -2170,7 +2170,7 @@ static void check_in_path_xdg_data(const char *mim=
e_path)
> + dirs[n] =3D g_build_filename(g_get_home_dir(), ".local",
> + "share", NULL);
> + n++;
> +-=20
> ++
> + for (i =3D 0; i < n; i++)
> + {
> + if (stat(dirs[i], &dir_info) =3D=3D 0 &&
> +--=20
> +2.42.0
> +
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
> index 81a9259d7b5..cae00643332 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
> @@ -8,7 +8,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263"
>=20
> DEPENDS =3D "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlt=
o-native"
>=20
> -SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;proto=
col=3Dhttps;branch=3Dmaster"
> +SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;proto=
col=3Dhttps;branch=3Dmaster \
> +           file://0001-Fix-string-literal-concatenation.patch \
> +           file://0001-Fix-literal-as-per-c-11.patch \
> +           "
> SRCREV =3D "8e80a317f5c61a7f410330abea441e0b0b9280b5"
> PV =3D "2.3"
> S =3D "${WORKDIR}/git"
> --=20
> 2.42.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189477): https://lists.openembedded.org/g/openembedde=
d-core/message/189477
> Mute This Topic: https://lists.openembedded.org/mt/102065318/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



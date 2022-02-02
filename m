Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BC3C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 07:35:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web08.60815.1643787355020477274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 23:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=jGcsRggF;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.45,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8BQw35N4KzQHlQEJ5UGXQcbQYSvGOj45t5xfXvTwQiT2Twx7kdMYoyOP4pb1Wqci8huSYVIhCcD4rTzNq0iyjyLzKBTDUB0nwfnG+aQxiiUMT/BtGQW8PgBmukyc0qkWgUz3gbkhXnChBj29qdh/igpay62Zg9Hq2alAN829oX6me7QsfrnFce2sVDZ/uyEQY2qnid8R04cdJDl51b6P09zHLnfSpPdY0IyPuQGy/7zfiqCDMkNjlZ9Hn45xCw1m/+ZfCMp2+E+UZBgtYYPieAvath4Wa8/Df3NfH0n1cLtR/daloUkJAPh06rBkk4ID8uVCK+C8Eu1xA0P18+9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkTuDHJAM7AwxES1OLQTW3bL0RnXaFRTgUPqbmvaVtw=;
 b=ZjIKLt23yfDmrEoXsiqiwtDXc5Ls23oSryCLmI4gZE6ZlC8mAFXEOnRGYv1qpyO55NT7/PP0vNqLnAXcigki2ld2N5eB7JwmcZhgREUwiyckhuQb12v6YqVM7i7n7554yL9+RnOq4TEBYIyrWqvJyonL8P8BMZOk3AqVnTie3UBKBAQhxSKxCDwWaWZxogB1ovRVcPPpfYfD2ZGTQ77lOh6ghgCratkA4X2H20vKHYUuq3lADPUwQGEH3flxRm8SCo30KKu7zRb0M7kr1qKg0CAiPUVbnt3v1fIQcQxdYi1SCimwNsNbGqf8maCyRp4YoxiP4+AB446Eh6kqnuPaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkTuDHJAM7AwxES1OLQTW3bL0RnXaFRTgUPqbmvaVtw=;
 b=jGcsRggFajxkZjwnk9zQeV1/gGUxjKOHAKsStvLNo2VWW/dLeA90DvPBxt/2ExUFajm4B0JjsIv3uScFG+zfLEsBfGj2eLgNon5AS3jBb7RWhLTJ2FR2VsdRBPvBB2ck+SF/a6y/R5to+9ob8sZnl5VkkwVLVIrlWG0K9/VSUuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5756.eurprd08.prod.outlook.com (2603:10a6:102:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 2 Feb
 2022 07:35:51 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 07:35:51 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 1/3] cve-check: create directory of CVE_CHECK_MANIFEST
 before copy
Date: Wed,  2 Feb 2022 08:35:23 +0100
Message-ID: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::48) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550ff0d5-2905-42ac-684b-08d9e61ea352
X-MS-TrafficTypeDiagnostic: PR3PR08MB5756:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5756FCA7B0E23E36ED2FF0D4D7279@PR3PR08MB5756.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5D8TlQrIfgNOc29epX2/vWec+PTH+8OdvVrAj/bSglrNPNCgVmxX2xSoaIlqoyNVzGJKnCR7KkzKYXdeUiL2V81jjFoUkoHtiYZ35/2H8MCwfmJF5f21k7+jl1NcSfO3SbN9HzE2HrKcvrcnVeOsDPTT9e8oMNOepmLEeAf6AIKINMyjCzog6kgg9eJd0Upjqkyl7Wgm/sm3lXvVuM5RU2y/tWH15kMn6nEbHDW7NvBcYTAcJApn/rPMGKtvlNFx5xDt8O343Jfxu7ff7lQX/6FoxT0o0G69OFoYXhEvzO0UMq66MVtxVZ2NbqXThDCsaXfHUBctrFQyodfadq8DJMNs+R/HlAmwcYoqtPl3B5B8dbs6hhcbvqiTL4EAV4uTNgwxPF0NVH3h06ri/JIlKQXeRBLt+zfi0HjZp2T4OlNEfJmAEGod3HwGthtWY/3bQ+Nk3N8mzw84JYDoX0o8B/0syLM6vAybq9t43IXhy5yBxGLFq3bsvruwbMgY6PbqY0Nw56HBzpWig1B5aLxp52XzEM1ppCnFWDvR0AIqpoyS3BZkuhYL7EwE1AdK7SBJpmLTD5NNho7YGs+QIJDEh8k6m9NBMhuP2aZRFcVjNnPWEZgL3Qt2tWpXzzOQYl+f3klswWz5kIghZOzZuUtvu+2PTSka3yFdx+/7FD3D3cAizbFbEsZRk5h/XyL3h7wF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(1076003)(107886003)(2616005)(38100700002)(38350700002)(8936002)(36756003)(66556008)(2906002)(8676002)(6486002)(4326008)(186003)(508600001)(6916009)(316002)(6506007)(6666004)(4744005)(5660300002)(52116002)(26005)(6512007)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?saiKswxIiWaWk1mKAvdVzsgoqDz1PZTRoZMY7jB7U/by+xEU8PoK4lEnK31v?=
 =?us-ascii?Q?LyA7JA+yJ+KZ4PGTYNlr94oxk4N7Hw9bjzBpPw+xW66SgrTvml/cedHyzIIg?=
 =?us-ascii?Q?9+VSM1D9BFW3Is2YMbgsqXYW5kYG8pFQuDSN7pY967eHE6oI2aRhRlyxOcyL?=
 =?us-ascii?Q?ApnHa3vNEgQn+q2b1dvomZFTFcxgbpYyR0rwhdnDUN3qK9mTaaeLWKjMMYwC?=
 =?us-ascii?Q?RibMFNTJW05yJazgnYnB3VYUZh6xiqHdnvF9GTA4t2fALs496BiDM0XJJGzW?=
 =?us-ascii?Q?3DMHxrrMoUKQuPX0DOfpyfFsd1mITpWUlubX5lQfMsLF5z/1g7R4VkKymgDJ?=
 =?us-ascii?Q?xYwaLwiraAEFQn5VeuuaQVIcizWgn8wUJv1y6ifU66mJ9fxukgwC2IIk31z4?=
 =?us-ascii?Q?Cam2wblUnf+WS7c9doYYOHcKB60cVUpVswoIUV3AlAqZB90+zakkRaKq9Lyk?=
 =?us-ascii?Q?s10xzvWHSA8XyGx7OuDazM28LEoWSYPXBcVZ2ZlGOAdpSuP7dC3Z49SYqowg?=
 =?us-ascii?Q?bfc5fPwr2Lq0B8T/oOzkirmchk2pk/cQhlP4IlY+2cO5NIwsp+TjFj+d4OkB?=
 =?us-ascii?Q?ikLXkt4t30uWTn1Ca3nd0ssRzfaxEKElPgWAQqXNCUPvGmhnPJ4HV4KBJem+?=
 =?us-ascii?Q?7mbzduiGyzuekoKaYlPg6GGgvlQBL5SP607jHY05p2qW7pE63csuAyaQmpAi?=
 =?us-ascii?Q?7pZ4A2yTZQmjXpQIetlCf05hd/my6hAzlW5GDWh6QSjv7a+TS/I9fLECipVQ?=
 =?us-ascii?Q?/Lkc3wVTkMp4+YxQHiOMX6t8CuaP/zEnhdzJ1G9gQebpFnZN+iFEOlGeshq6?=
 =?us-ascii?Q?KEMh19J33WK14YDsA1lY6EROA443wWF4eifA4lLQnZqX0Gft4qTEMWOBgXS4?=
 =?us-ascii?Q?SU0UbXMdTlRqhd3z8ByOOdxS5aRnMLJjlTGAaTkjvV889QaZS5JD4Z96TjoP?=
 =?us-ascii?Q?xJCnMvBESRylhAJSQ+Gv0hVrSGxI3Ii/hoT4LCb3higANurlOdHSzsYWAHq8?=
 =?us-ascii?Q?SWoRef+uyZnt5ia6owSJFuCKq1oAQzDqiTJrrmdb5Tla81pyLZapZqOfZAJ0?=
 =?us-ascii?Q?yGoYMwst5tTNhx6ZGAzDaKC3csp7RnPZoXOZCXlueZ0vrAhSwFDeKCrDtcRo?=
 =?us-ascii?Q?tdmAs9WdySSF3ttXjycR7ikRbxQ+6w0vC7cQoLkjQ4cPELb6Be7r5RpSbdsm?=
 =?us-ascii?Q?U99XC64WJBWaXSCtuhG4CiS9x8KWFjVV3hyLF99mfNIz2Ojz0ssuqLihq7ha?=
 =?us-ascii?Q?1MvQZQ5Cdhkw8KkGndRG65gaj9SCBZDSCt2w9kRWusaEPwVDuvEFLl+B4bEa?=
 =?us-ascii?Q?/KDFGIrRz708sdt2gbaGvuCMgYGcj71YRt4qzL7DI13RFKUky38ImCVPHsfa?=
 =?us-ascii?Q?ZwJyj9gjSiM+iKlY+V7fuMQK2bYcTLkC3zJB5yO54tANizBtr94FFGq9NZBE?=
 =?us-ascii?Q?T5urXc+A8WknQwwcOwnKkVnHsT4qmcs8y2N2BDonlbzUAyptxl1L25UbnU7Y?=
 =?us-ascii?Q?N1Br0Lc9GTBKYamZYtlWAwSo86dQRb42VB8oK/QUFnlVRIebmpPPmj95QKj6?=
 =?us-ascii?Q?9EbLtabmLXvhWIHQm4lMHKK5R96Uu/yeSK4xIZJJsdT5WKn8KqhmlPiAb7D8?=
 =?us-ascii?Q?QcWkMrqcacP/6+u1MKi55Hg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 550ff0d5-2905-42ac-684b-08d9e61ea352
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 07:35:51.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FHlcy0i0Zt2d7ij3oplTMGSuOY/M9VgR1YOvuOFPuDfnsYbdeXYt2mz6tlQGXmQNrHpg8DVDQHRgrFAcwDrhxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 07:35:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161180

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Create directory of the CVE_CHECK_MANIFEST variable before copy to it,
so that the variable can use an arbitrary directory name.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Reword commit

 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 70d1988a70..a4d735c323 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE")
=20
+        bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
=20
         if manifest_name and os.path.exists(manifest_name):
--=20
2.30.2



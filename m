Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F6FC47096
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.38])
 by mx.groups.io with SMTP id smtpd.web10.7802.1649747425691171876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=RaVBwrDa;
 spf=pass (domain: outlook.com, ip: 40.92.74.38,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Em3EozhSfhTGe1CSRzK7FscpVd5TUGVwZ8hD0LC/k/oxVOxY5U9C9Ywvw/bzeNnjwTBzugQr3AXUERrKWEoYtFQlAG+WIW8eq2p6QM9PBEBeEAmKjDxzoXiUOgaHfetPHrC9rTXPcbqeXOWFW4mGSzCeHbuzYJvQntJ1LiYo0MsoIYDLuxgFvYe/ncdu25Gjo7t+ExxOgkJjN3guofa75Nv9x1XeOnSNYwwotbgNi6La8e8pF2NzAT3h79eIEv5X7izGe85pXlrC83LIEtK//P3ktuWnInFAdNrklFRnnpoOCBOfAY7+uOB7Fwh9SyPssc9P0V18YfVipF9G7aq4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbXFbCNW4VrSC2EApJgVTnP9+qAEiIG1SOYhN7uh2y4=;
 b=YtUQaK2em0UY7T42AgeB/maF6l8tYPotSkTlRJFUHE9J+Kr4bg97mk59Dmgp5M+WkghdhHoZsAIEhDlXS+g8ZT1XUOwKtaTf7DTjCPw/ajVkCaD0VYKPqa46ry473Gg9+M2G5Uk9dzVwkRvvBglwQE1DuAzoUAZa/3Su4DAFek7PVgzeigAcXK/yFXj7rBbukzUjW3Y51H1AG+Z0fYwUu0f7LHqUp5GPKmyG73G8Tqj994niBKXEYqLtMGp+nmNfd2QSX4mU8Yg2dBy601g4d2nmVdXOdl57YHHyWZ4T/CrAB9ZfnGiWsWvQ5iwr4WWWMwB18EGHDN5MuYW/6f1M0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbXFbCNW4VrSC2EApJgVTnP9+qAEiIG1SOYhN7uh2y4=;
 b=RaVBwrDal5w18fjbpzKQVtchSXBzyNZn50yiPKopTIpPwVbxNSi6tWapQA+nI2FwZ6byL6mlKZALWL2LfNmWxTl+NazrXB58fQNaaaqF5JomXvzrNAbXmOT+V2fUFqQyboF8Hy495XwJx4hMkQpCz2abPD7MAYs3sHz4ZOjlIzalPKHzKJhkCndOXK4HNI9l0fipOqnJu/MCivYfsE/g+rbnVW3WOkuPOTS10kA6KBV82uaXG1HY/SfR9m162hZ0IZYFJDZ90R66Oj59aCP1z++vS9mK1CagGcQhEFipwJ27aIh42jwrOMSJF6xx4KucYmaISsCXGVrFwu74AOItPA==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by DB9PR09MB5034.eurprd09.prod.outlook.com (2603:10a6:10:2a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:10:23 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Tue, 12 Apr
 2022 07:10:23 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/4] gmp: add missing COPYINGv3
Date: Tue, 12 Apr 2022 09:09:54 +0200
Message-ID: 
 <HE1PR0902MB180108F78D681A1AAC8216BEA8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412070956.1117150-1-kweihmann@outlook.com>
References: <20220412070956.1117150-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [44CDkjZyCOxpwD0TmJ32EtmIhGC6DPcPTwDjlo8PU0r+T8aO2NdEznkVP3pmB4VP]
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220412070956.1117150-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80797be5-7b03-44ea-d018-08da1c5382d7
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj073MlNAFTSbz05llLMp44WxwNE/+8qT2BtKCik9zTG7K4XdhDt4c2lUCoDAdMORsx0yo/OazBhEk/CS62gfWbcGbtJZ45ZiOPXZuko3ua9yqhSZw8l6qo4psKB1xtMTvyV+QY9mkfl5sNOb/WLdQ93U06Qwhfy1aJAf0Yj3/1YvnO6qu0WsZLDh8bhU0v8ueECLUjqgLxTugpWLsqE+YFFqUXbgXdhCXKWUgyUYUI+lwDDf0c2CxhRG+qAVJK3io1ytrTKzkS5k2ivurTm5fNMgz7lbnvbEY8XJUdveUZSkPhMuhWp6nB1tekBCVetFAfcGTtadLjO8AjkeBtIXcBokiWYLwRSFnOr14UJSI9w01WALOrPEjE7+WvJveNIpQYyQ8SXgy0YnpgAVLevSe5aWwLknGvv6oHBNAOrouSyoeEymWQz2llvkPuci291Hj+Eeqy/8aGDJlsK9Gs/XNFX38voY99pBENxIiwg80fa8/inK3HHgqlMq0tV0ff8kIa5qSXBImqHqOv0Jc7JXbwyhEwCAkj58/nA4hhJWDeXACG5HFblMP+MOaWU5pH6WsoYktqwOt21/Vs9sMCBpLiz2OiVGjd80/l+rOwLc7Fb1Ky1jl94PXkbTs6R0Ue97mU9JEARDS+/D8MAz87GIshwfJFMhGeZsEH94fMyB1wXNMg5mk0LGxIpyHhd/VVEW8AbwzaoO819Iw==
X-MS-TrafficTypeDiagnostic: DB9PR09MB5034:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKsjcitunUQiqxzq6BZBsriMWf3ws8bIJxsuTkpuRsOqEkpgqFYON+VRfof6TEI6GjAdUyZd2whBaP7wMfVT16K7mQKwRfnz2LhDJ/Le5UyExxSV/5mETg84aRhHJS8vifE2hRzATirZqvc+SyKHqz5I0ZrnA6n9wivVnVIThsdLPHpTzsUyfgJ50k3D9tpH5TmltYqcB/DnBD4WEWmLXHEZ6n/1PMv2y8+tQ1HMzhZs8IU63IyvWosbuaUorS4yTKqxfHl+TYZReyJPkThVdnLn/LWXxo+XuOgFhuNJy0vlDkr84oOfDAgOt74QicukDwvkZj8/2DGH2dd/zGfbW9yNA7PMmhA8iz3KweRRjq/e8zRfd0z6vPJsJYYwn0sxjMRBU8Ug2E5Oq+AVEAJwjF69vW2dPrJmCyamP3to9f3FxIUSvB/EaDWNdfjVis/Gy0l4tLAzndO5Ckc2u1dQn6CKzit/PiK8+3aKktyVMMqILSUr7AMtQqO+dHfSkvsOufUAZDkAnd6pZXlb/FbI+nVEuAdzvamOoOSm0Q0Y4B70ztALaPcL4PNiUJB2gMujC7UtnKENNJz9ettAAv5n6Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0PtqUBqfvbxx95JAGYrsc4sA1OwY+jUBS6g7ptLrV9W4eivYd7J+ibihTLiz?=
 =?us-ascii?Q?raUfCZskRWS+POHcLD+rWm1OPSlkTN6mU4X3KTo4OydPfSWmuGYvlzCKAu0Y?=
 =?us-ascii?Q?z3apl3CeemH3GfZq7Z2kJ7iOOeXPXAjfV0LC4pDFeOCUFCRgfTxkxlgx5ZEs?=
 =?us-ascii?Q?R8DLacg3JRu0vvG8RSQZYRSsj3X3iU6G9JY9MKMaGrC6Q7Lw6qNQ+uwbO7VD?=
 =?us-ascii?Q?2tRBXPy4eRl7M306Ns1kUy02VMZeUzKYxWYjakgduhHLmw2ONeh6HJzJgQ86?=
 =?us-ascii?Q?G3e9EXsNVZeuuQe9VFsQ49OdGUDW1K6owHbnX7tNJ0cEzQm+0E+w8FC39uJo?=
 =?us-ascii?Q?8srXSwid5dRj5t7NKCNNb4gy0/uczA5yMkuIEVgCWLTvInu5rlbzcUM0H3DB?=
 =?us-ascii?Q?04uiQmTbdlIMg9RAll/So+IjUP2WCJvSzWJXi4xgrUXRZUaUvQjjkVAhI/lC?=
 =?us-ascii?Q?Sc48M8FHQH+ERL2PJcx6w41YY58LFf2TbAyKAMW6Ypo677Yh9GDlQebOQT92?=
 =?us-ascii?Q?RPthUX3FCFrB/9Yq8KySYX1ChIg45XXBE1NZ8ynIRzOK7gv/n8c8nMC4m7Xb?=
 =?us-ascii?Q?CSeYU7SSuYeyQUWeMiJvzylAQNrS+qF+T9SbXxqm++Be6rEeNF9Njno1kuJW?=
 =?us-ascii?Q?CsIdwUSn20BJab6BUA3/S1VCaxXizHXhYNXQ6vU5u0YDdvSXG2yTfrGDiQ6v?=
 =?us-ascii?Q?boMmrHqoOYOXFYHMK17Qwi0m32l0FXBXB128LdXlZywHs3ROYXAZFKlwdCgd?=
 =?us-ascii?Q?aE4A5iTBBKEs+IKfzz/F0USTIz9rqymWkn3Bnr8vXS65Es12ymxQs7G4yR8m?=
 =?us-ascii?Q?Z3Gxq7TiGPPXVUv9SrHaSOjv25y3CAT4SOTNjyNeA0TeQli5/X7X8iV2QLHm?=
 =?us-ascii?Q?tc4kznxKcxqkteRnhEuY4CkD4xThOx6VVC0PgFWjMWzdz1Ffy/V/ro4ydKDT?=
 =?us-ascii?Q?e+ho4zXxlPjvK3HzmdOeMK+OaF12SjCyJtRfc5EBmPaCCG2lLs93wigtt5LJ?=
 =?us-ascii?Q?/U1ZVYgGgPC2tdcEHl8EFxnbZoDmaYS8iu5ottHB+Kqkxs3nNY5mIzzWOMqm?=
 =?us-ascii?Q?Y43AU46Y4fmMJZxAFlHcCOI24giqeaSDmiK4jtDRX9RHiYNj9pnUJJ8ohi+8?=
 =?us-ascii?Q?fK43ryAuE2qfeXVud2kUHcalTTxbuL7+CBEGn6yekDgQwF05cxmePHochygq?=
 =?us-ascii?Q?grRYB90RHbrlxTb0mx+OXsbI76wkr60gR7loQ+X0AUO3siL0C+LJQeagWBOI?=
 =?us-ascii?Q?+cw87/nXV3BuLTnNrufc9rpMtJq/p+Apnj3sAB0NMsxeMmIBnh8C8g7+apHv?=
 =?us-ascii?Q?F3f2ac2bMV5gc8V9/Ppf9rAhY9prNuR8bkpisq/9QqAyOkCoqej0dcH98cBw?=
 =?us-ascii?Q?BtjnzhJ8VDBCxw6jw/agvNIFG1GIr0IaqRw3aw/UfWwVRpmRPhwq1J8HzDH9?=
 =?us-ascii?Q?n0aKJxaljCv7hXVMv6+Hzjr6rJXaZ5/KEPGHsBvL5yv/0WDVLVKoLTt/sLEo?=
 =?us-ascii?Q?RsjISAaBFuCbL8M=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80797be5-7b03-44ea-d018-08da1c5382d7
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:10:23.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR09MB5034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164256

add COPYINGv3 license text to LIC_FILES_CHKSUM

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/gmp/gmp_6.2.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/g=
mp/gmp_6.2.1.bb
index 72fbf4eefe..29055492c2 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -2,9 +2,11 @@ require gmp.inc
=20
 LICENSE =3D "GPL-2.0-or-later | LGPL-3.0-or-later"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4 \
-                   file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c=
1d46df6 \
-                   file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263=
 \
+LIC_FILES_CHKSUM =3D "\
+        file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
+        file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
+        file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
+        file://COPYINGv3;md5=3D11cc2d3ee574f9d6b7ee797bdce4d423 \
 "
=20
 REVISION =3D ""
--=20
2.25.1



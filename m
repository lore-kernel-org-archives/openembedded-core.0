Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB96C43219
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web08.5884.1633678981685181195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=vZgHuGDm;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hItCrwG/viuERmT3LZP0Un3623MQjIp4r22Af5PIi39sRjniyaMBZXxDj15uxG2IcPQNFfZX6oozLKFJGwMNSPqliWrL6Q51xyHv+71J3/RLN+V6ss/fXL9Ad96FGLKWNbphR55CGQ29S17YhzpcjYeETitlbXIbCcQgZKMUROGUfLSP963IBp0gfKi5nIqG4VK7HaBoHJw36eTgXzMG4+4AJY3Pe+f02ysd0dg33WGA+bQRDzwllcvYSwS4YyFaipQDsZSVQdY63mQ1iRyonWRSQluG6HLPROjO3kZHnM+yqVwVXbDm7WdO+rVwtUTHn3cZfSX2m8nZRJvCMshxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7P0jhSxZF+eAVAZO8Un+4oQawwSw+ld0oJrR4K9sEQ=;
 b=SiyMdH0QgSA3oZRJIVMONjrHOp2Y+5nXiSlc0841I38NsXjw/m+7tMW8Ot8RqPzl1jMoQObh/1KklLJ0un6q+UxcDmlV2n8i2rYdCeYx9Ws0gtQWWh05cAY+H0rEO9MO4Tsw3hkDYmakZwmkjkX2FkHWteEe/KHEILknoCBeBoP53VRX6xDreRGdMnM7CXZ9pRrdUTf/Fw4LyQDEN9T9Z85AFqLCrv4MdSI1sOs4aeOeTmaklxGIhP3vD8v4JYWjOpp0gYRzgXKT4BiKW/Y5BbuV1z6F9zppLkPa02HUNWuQU/OaA9odkgUBRS+2/aKwGeHWNlerRa+VhTyFsguBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7P0jhSxZF+eAVAZO8Un+4oQawwSw+ld0oJrR4K9sEQ=;
 b=vZgHuGDmU+gXuq594A+EROpr0EFpdmjX9Unfu9dSnTuDuJ90iOgplxQkCRO1M0XZmRJGhTGqQSfuyBSn1us8SzD9bS+pLBeJE0tcegKZCo3hTgWg1WofF2LwidyYhQ7ECIXRSqGFNgn4YFCb1BtdDEBitX1VrheNVm+gYduZK1s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:59 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:59 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 06/12] recipetool: Add logger info for missing license entries
Date: Fri,  8 Oct 2021 09:42:22 +0200
Message-ID: <20211008074228.8635-6-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a3aeb6-81f2-4dc3-5895-08d98a2f4024
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB577233EA4BEC5674E90F19A6D7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ov0j3fa9MzgofeUSOrZbIejKrdh220EO2AJ5VLb9dYm1ydUWG+AUKzk4ajxfXKKNO1e14OI1eGtW+rptsSLJDKYzkruGrj9mfLoVya3/378K8Aq/nIGE3pwvO1F2QLPujRk/fFPFj8atBt43J3eD+KLZALq01eOEz0/vPn/TmD69Z2z9hkWpZCkpFNqjR6iD0I5VDjdQJTmXhjcQjVI4jmKs3bGdPQsHZpXwVK2QCgvrDdXc79sOP3wtVSX0wa9JIz17WgKOuic7qPgW5d2JKaEN/EkSyL4E3OJa4xbWJVBnXJr2zrF8lVPh+XGyj444OWthJ/eKjj7swQRc+qQoTwBQPjPI9zr7aKohAS4Zym2gBY41ZTcxXcrESX1PFRhEu8b0Fkv0zyjiUHtYVcv+4Ih2pR5D4BOA69lmOhv/TNjKPhp2NXgs3C2Gyrqu6Bl2bq7zyaSg/Rl9SBv7Mw92lEZsXsTLbJlq2wGEhislCk7x4ymeHffBj7ZwtVb8awysP1AjhRN8occtfeG/k3kL8gfxAyVwFRvK3OQ5jPpK76rHfNKCqzhpDhNUe2jIDxzpRt/5429BhvhEv+B4UOxFSWf3BIcHF2WpBEQfQt/wJsG1vTR/w9V+1KNGKm0TfhCxI9vF4ZRaLYA713wL6D3rgUsg3lkHUo29y+dGziyG18car/o40skjRwFAH370yTfbjHiXZj7REANaZyyKyBelFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(6916009)(38100700002)(86362001)(4326008)(6486002)(4744005)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6LXm1tcMneh9LioTdH9pYvOFYE/IEyzhWwzlEsiRhUW/Px1XCAaA/URJdzWo?=
 =?us-ascii?Q?URxjfcHVSVuift4f3oZKbwhtzofMjjBcSku7l/SwfYeLNBNMTUWw//G/k8B8?=
 =?us-ascii?Q?ZunxNYOygpMF3f3R+eifUURw4+M9SvJ5yEE7JvG282ThI0wkjKOmiV4D9+SI?=
 =?us-ascii?Q?k0DLAEoHZ7tbSnSRVbFTqvSnxPLRjg8413dMcMlAABuOqpP3kuUFa6Ulvju0?=
 =?us-ascii?Q?mUUka5H/IW26WuNg1WjIKUnudHe8BfGEbdTpIvUC2gz0Of/Fb2786/yKv2tp?=
 =?us-ascii?Q?zXmmkVySYyzYqMp+8fkFkFS1SqXE3VtFd3v6lG3uAx94kVVay9FTVGxW6Ht/?=
 =?us-ascii?Q?NADiv3xoClWzgGobQJpW4URFU3MTMe5MhJCiPfFKO5UvKNx/I/6IYhuKkw0g?=
 =?us-ascii?Q?blcHibnoypvwqIK9jHS78AYxMHXYjSWQ2wb3X3WJw5PkbYuazsl65isw0HiF?=
 =?us-ascii?Q?KRsrv3+l8ktAQ+PLvU20eY9GBBhvdZCTd25bhW09pHvbyU0IdZG9LzVTemKg?=
 =?us-ascii?Q?ae1ib9KzPtnXT9ClVoojDqXaAe17to4G+0oZz4+iA6xLQn3+Mu/RxpxCpdTw?=
 =?us-ascii?Q?wPYRuGlQh42qzzKwVXmFwBwmNzI33giWYdoMf0KAUsnfX/+SScNyLltVikV3?=
 =?us-ascii?Q?b+DaD0UH46q807eArifjZMzxRk8rwe2uQ1nY8gql8ypt8nCKcq6jl7wQboPJ?=
 =?us-ascii?Q?dCw9LRL35oKYxH2nz5OKM0900CqCtIfFLCRGewQtCDn2ebqnOho9cvZax3N6?=
 =?us-ascii?Q?WkUPFqTy7zapMo2fD8RgvDVlE/7n1/YpTDhccgIS+3+ZGeP5QT4Sno28O1QI?=
 =?us-ascii?Q?FCHo2KffFqzXh9dtr0OMj+ZiXy5EJ1lEThOjp6FAsaK1kcD+bxohP8OWxibA?=
 =?us-ascii?Q?ZpIpvAHgTgZVFBFpZ8EEuxhLkWtcy501DjJMfM9+HaiSQ7c9uZbPDcmI2rty?=
 =?us-ascii?Q?sw6WLRCCgc/TSwMS3O4enALetcCuNYmtDSHVUew1ZYsh4LMolcq6layKyD7l?=
 =?us-ascii?Q?1qwIGuhQjfEDVLX6s6Jgx/FwYid2zgydj04d5A+j13n2J4QA7T8z9Y3lI2Dv?=
 =?us-ascii?Q?XX5XVnDCBdbOZ22qGJuHL0apYU7nIq6NOZ+3ZYW/0mcdMA+WslzABS0e5tt7?=
 =?us-ascii?Q?pitZqwFTC3HdAyqLAs760s2/B2N1535t1U7IwaI8QBhurF8YxTG4qDWV6yWZ?=
 =?us-ascii?Q?01nJgJWA3UvbFYIDILB4THFDJRoYeyFysefP2hfYMPwlWmuJdkPoIehc0e/d?=
 =?us-ascii?Q?lq4CHBr4LCzrfJX1pRvCeU/RBb1FEsemnuZ+qF+DKOw1f+Y9aPwJb2WDlFds?=
 =?us-ascii?Q?8oKmPGNwnGJF+45x1no8Cjko?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02a3aeb6-81f2-4dc3-5895-08d98a2f4024
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:59.5209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rlQ2KhKdbgvbbeIa9oThFH6GND+3FCxm6afJI5VlMlYqLwitCeEbyJvbVjLIpeKj0Hdf83nSR23V6cO8M8yFSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156749

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 87b25ebc7e..a8c4cdef4a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1128,6 +1128,9 @@ def guess_license(srctree, d):
             license, crunched_md5, lictext =3D crunch_license(licfile)
             if lictext and not license:
                 license =3D 'Unknown'
+                logger.info("Please add the following line for '%s' to a '=
lib/recipetool/licenses.csv' " \
+                    "and replace `Unknown` with the license:\n" \
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5=
value))
         if license:
             licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
--=20
2.20.1



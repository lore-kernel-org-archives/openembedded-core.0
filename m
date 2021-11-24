Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04458C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=0td54vJP;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yjc/o7cjJepGLmy6Q2nb8t6rL9Jbcwu0VuqHNebGMD2fjbg2pztpPmepurkdRiKOuTxokoofSBP6rExQ1jIMBTnRRyCvo5N9Rvm5xUq0u4E3lOHxYBHNs336xVj0S9T0hrWrVwlsmDBvJp7wowcMWK37vNbjZbSiWHRarEDIP7GMOdv53prW9qJw0HseRafPtiL8mqJ0lRRVF2Lh5Sl4KcM9fZ7laB0RmvdYGsxMEsfDqKPXM/b6/ikKkEyfbf8cwKw/1hSmbd+DynN7VEN032hjIrOiRa+vP/8CoVe8neR0ALDU6g+0DhQ/992rm3xCZbS0W+WJ/1UxjUx1ZA/q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz88teO6NvIEmO99g6r5SLtVTOZgC/G5K308B4U3k4c=;
 b=jPJt30suhEttWz9uJEQNrlZ/gR0ZlJL/mkaY8vVspIpM+UZhkB2pNdnWyLxf5fpGpC3fLeDHZSGshSCGFUCyU3qLJ+KmYg6QWXOJjGQ2frMLewaLUqq4ee/Tu3O4GLO+qDYnyO4EOc0IJGR7YCqWz6N1/d0V1IXHomZ9N0h4+8K5hNY1Ztjl5fP9c4EXM+JdQw9/NtT7eMeOccqG9Mz2crvLi5HW6Qs1qBMfzv1ntcEiypL3W2glWNu1EdOhsZIjGNXNtexAncSHrm9NQ9AWrpdlxXQcMpigcMmnko6bVe/5zvYj6dqK0ntJwgRpQP+38rhDVObL8FiHY2Zldoy81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz88teO6NvIEmO99g6r5SLtVTOZgC/G5K308B4U3k4c=;
 b=0td54vJPcBJIg6UWzLxvycTwJtZCTp2jIWCgtRD9pWVXrjosNQIxSPYLDXqB8zioLl2a0dliRBmHrQSf+bWTrZa6QL638dpCBiiuFvLYdPppr0Auh4UnYD2OGiSL2iccgND+0HmiySSo50rpf4aNIxS7H9ehJgL7UsL++2OoEPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:03 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:03 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 01/15] openssh: Extend to provide native recipe
Date: Wed, 24 Nov 2021 15:47:25 +0100
Message-ID: <20211124144739.2250-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905d6126-64d6-4556-02bd-08d9af596b1d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6447A48FD23DE491F83B9AEED7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VFnzFgj1WN7TrEMFnCrGR47cr/OyZMatIC96gpcZrVDGGhq+uecgtc0fd3Tn8pqUefPxIMR2V96rF2fFLeqSNie6eMGd0rAnn7M0CID+vPPw1ChSwzjJoon45IK9qpkPO79lwMWn+Y8pge86LLfkM+zNtM4JwXJBrnl0/YwxTO9Zg6YKlOggPI3ibEH+onPp0rccNCfPT/Gu64ofyCRFXvTkbTCi0KpCUK+06bR9CQUBx0uQtP6axcn3834WdAhO92sJWJ0VdzGjy6uVnaPFjW1pX0oq6xrc1MGg+h7V9RHKHH2DJqTZnH7qbmG7O10DjQWuv7XEF4p0uqm3xxsNiu3Cz3teQJGTxrgNajXtqsrnWT5A3cUDVUBiKXjVxhV3EcXTPrcfZuXkDVqB4hTc4nDC3ly33ImAmcxGp8MJXGFuhQ7Rs/BlxgjQczaD6z/3QZOCU0CGObXtEjDoaaMA2wrQV2GIMAaNyAbXEiRupP6dsSyprJMvMpvkssMjUO4EouJ5rWyWIUQkRVEXrAAf0Xo1/pJGA+lgK124+7XnJYEW1wQVdI1P7Y+2NM8vw9UdDpy3dp2nPmzRM/4H5duLyaMpH8lmgSN/1kWczVd80MneQixOzBdTs/Cz/EILu55G1tVZR3pUNBLxPZLEh3sb9BDLMOsrdLLRy7PF5WYHdPNF0C2EChMcCth+cFua9vELagMFDPjbAyvy8EF5l+gqKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(36756003)(83380400001)(186003)(4744005)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FwiXycD9vn/BZcsRi5xoGunaeiOyYoYRJgkbVhV2apSGuExAq1Esdkg/iJPs?=
 =?us-ascii?Q?bcnLC3L+1U75ki7lEB07ZNsExI1sePOGMe9GZbjScyGvGBJZcOACmcetnW3f?=
 =?us-ascii?Q?7JlhtbNnVo4EqDJ92R02J0PI049R2ioJ2xOqt/QvOGEtkLn/FJVrpRsfJvgT?=
 =?us-ascii?Q?ddJJHN88jJ6jaS0gbY4cBOmWPdiY4QMFOjkVwzi8YgMOldUnkbZyBw++HU/T?=
 =?us-ascii?Q?93BAeNDAkwKd5GGnEYPoche5+3j4A6j2PurEeGF9EXF3ElfD1biB07KY2bVf?=
 =?us-ascii?Q?WzgrweP87G8QqsXqlJMoPJrvHRDtWqncHrR3n+26WAtqyinihkBdZkDnLNSv?=
 =?us-ascii?Q?Us9pyfaVrxhvyY2/4zORrhq6turffmk6Mlw6otEX4kJlpsfh4QBqY6BVo/c6?=
 =?us-ascii?Q?N/mSd20+iaR44F/on5BDhVftIIx9TY04DcyHAiSwKT4h9ze5TZQsVxRf2/tq?=
 =?us-ascii?Q?GnHJNtyRkP25x9n47jS8Lf5TkLPM+jpCq415RWeLmR01erX6glGIBZfKyaMb?=
 =?us-ascii?Q?BVgxNoaLI/O6c7Trc51dezHQ1uNplV9CQCtez4MrvtRwLXFvZSXvPHN2XWLX?=
 =?us-ascii?Q?LYKgcah0c3EkybtnCMjZOdXaxgbRNznavJbwQ1ZKanNyrUOB6ihlzLWuLBno?=
 =?us-ascii?Q?L0A+pl+DWCINnVfhxviUSpQVjHCC7vu25tzJ8OPNLELj+30Lx8KRBHwTA3Gu?=
 =?us-ascii?Q?+G6M00E9NV2Q4FysEQkoKDgR6wmJEgb/xVGwe5wDb0+W8UFPD3O0+DUIgYlK?=
 =?us-ascii?Q?pyOEzuH+1pUoRw8302/RG51YN9dSu3/OyIF485yOdq8Gs5zyKLZh1PTomXZb?=
 =?us-ascii?Q?iFRT0Ew2/Sd1CYPOCpvj8sdoOK/23ovuY35q/RWEddje/tyhWvj/+I47g1R0?=
 =?us-ascii?Q?ba/ammu1a+lL+iCLapvZwONL1XmLP+ZdB5ZED7zBX4YtC7mPZdYlOjFX/Zs9?=
 =?us-ascii?Q?eQKht+sZzKE1bfOEZifCUn6NU+ZxRz/Jofk0wMdKkalP3nzplTJt4H0sPWzo?=
 =?us-ascii?Q?IqrpHMx0d0N0S1wFxgzUvT33mAAipbr5L45GkifXq3FZgd5/zYla1adh/oRd?=
 =?us-ascii?Q?xbIO88immLqozxJluFtCOrcfnTc4B9jn0RJ15lNHwc0al0bXh8/oythh9YVh?=
 =?us-ascii?Q?XW7wLAnCC9D5DySsPmOSstvfrHSTOu8KgCumSAlyKFp74y9nWe5KQ0XdZJTM?=
 =?us-ascii?Q?3FgGlGSX/qusnPqABg3Bi9hC426i/J4oXUyCAKh2H3TL1RYvFwYmuiXw2XNT?=
 =?us-ascii?Q?M4yByDqF0ZsTjgTToAJDl/cerQKqJt2gdcYrgGBvd3sCu8McTn8tdh7kNKYH?=
 =?us-ascii?Q?k198W/q+Alc9rK4Posf1G3OviLCfV/4fz6P8cm188IM7rQfe/J9dB34Fq1uc?=
 =?us-ascii?Q?+R29t+eVmre2r9oyqz/8JyNErrMB/4A/UUBLTcrr106olrF+DLuaEq6e9hqm?=
 =?us-ascii?Q?vtZc0DvX75QdKXCVhUPNdTtly77l5C5Wa8Ltx7QdNAy6WI/ltqAiaY6iE38A?=
 =?us-ascii?Q?G64lLLFmJGvHNw/1eXIuD8TqDprvF8CXNxGM+1rX4MzS7WEvklU6CfR+Uqdg?=
 =?us-ascii?Q?ooVNGLS6yZ+xZhSgG2t6S/5wD+exoyKkTs/aiNg1zVNdy1xpR8RJQ8rOtLH6?=
 =?us-ascii?Q?zQiz9rHCysY/ylQ7zc13qn8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 905d6126-64d6-4556-02bd-08d9af596b1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:03.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kp/Z74w3fBNq1RsLP36gabCs5JeDjGRvppnoHOcxLYvvaQ3pS1meg5H4V+O3OPQeo/P5pmPwRF2PM57KzQK7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158696

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/recipes-connectivity/openssh/openssh_8.8p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.8p1.bb
index ee86bb92ab..33fdf1e8ab 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
@@ -182,4 +182,4 @@ ALTERNATIVE_PRIORITY =3D "90"
 ALTERNATIVE:${PN}-scp =3D "scp"
 ALTERNATIVE:${PN}-ssh =3D "ssh"
=20
-BBCLASSEXTEND +=3D "nativesdk"
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.20.1



Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743E5CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:45:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web10.53231.1697805935514709876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Rvjl12Qo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.8.71, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtQcyOlyK3jSpvQGrOiwJ6etomRFOXNHfjNoIsh9Hw9qinRDxpj0a/mvo93TLIDjpxF3k78yJ1UyQO7wVSPvbspiJ+oV1a8fwRqcV7fvbB4K/o+RHWJafxXtoYZlUg9r0snmvGied/TOA8Op4AApYT2TuHQOr55HVmntb3vmZ1frYluSqiVywonUJnqC8oSCPjfx7U7/amQ3pMaMAETBltJgfKvA52Z3bqEPmRdn2kCiNiNJ6HKY0Ht1vkCi5NNEY0+/BfoNIUOS0slnFSS3ZZDfXC9IJQTSaWpc/Jy0dMcmYzhriS1Rduo9LZZhxgzn6Lw89tPpu2VOhL4GHcr7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtnRDGHSe4vgTRrW7C2QFXpZVj2deGIJrYTYgiS+OnI=;
 b=oI7YWUtnGh19WMvody2qMaNMz5UqKoFC/P2jqMHfZSIroXdlGoeXNVZ3KRD4/YfoNcgYdrJoE+4DXPRaZ/uru6WpUnChzb52LqXpuM+3IIjBbYkVPkQdouKTKKmBcnUfFTAekoDJ+PCTvfqrh1iMib2HBzYy4sNF21SUjmTQZgw5n8aTyoe+qYASqwSNFhynrPHPZGx+F/R0MPrmm0xBHqNJG1u2i3M0q1K6+R7ehZQHL80vJecYNf3be2JQrfQTVO/kNSNvfCDIJYWKdxdFizpEOZgTYBXmkYfhWypFEKgCAX/R42MQnY3NBiDdWOClO0pBJcorD092Undo8w6GjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtnRDGHSe4vgTRrW7C2QFXpZVj2deGIJrYTYgiS+OnI=;
 b=Rvjl12QooIQ25KeMiwGq3ljpZNfmw7xkxn7jDv9J3CjB9wUmfksFFqfD/ZN0c4EXTY0/aJcaaVeNQ3L7YcsH7uyt8y4pTrvqoUHJmUUQ9X/OahUJ60m2ykN2wQsii5QKPIp1A0ZT9Yzdk0Oqz8whHaSE+24rtVzGgnBGd76VwSDiMmLAIlgOCu7yHqhXovd2Mrc+UB38qIK7RjgzZIqDu+ig1rzu4fxR30D0d6qCErB9c2zcOpcc7dca3lOVXeRPtVFUt8+0fwOyMnkSNXgcx+UNRBfgvPLe+I8iaa+H3lsLpgtP/1URpZzg6LUWfJ8EsyexRXwP2STTTfND5qnzhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7515.eurprd06.prod.outlook.com (2603:10a6:10:260::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 12:45:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 12:45:32 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/4] package_rpm.bbclass: Minor cosmetic and style fixes
Date: Fri, 20 Oct 2023 12:44:48 +0000
Message-ID: <20231020124450.9736-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020124450.9736-1-niko.mauno@vaisala.com>
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a8f635-5a34-4ebd-49fd-08dbd16a7268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FOxDUkuNibqIVGdRCsKObKxlYMFL7vLLFvLh45BSMAQWufc/rddC3cOK6O7fld1p44N5ii2kX+m5DCuNyVxQDLx2bQ+cWT6T/3WNTjaCAa1T8mV7c7mQOre4zY4KbrDt9JJztw63J/GgFR49NxB3QpSnMfI4/F506C/tzZAZhv5ZOtI6j48wVDJD8kQahyfnCYUJ7X3bi2jh0X1yAfBLnbFNAA76jgkkbFroja5zPjHwmGxiJ2V03LzRgWrAkL+FjsZ3u5YOTnHNrDMZ984rGPgb4kB44EUdkoybJZXKQcjf+hgHJZlh1YujsABIUSz0OvH/pXw9xNeliKhgccr3aAz9YFSCzlALmUC3QJl2NCNSzDq3cOgGWuHrGJpStEtbDr5pbK5r5JoIgpPvK9f1WxORdGyGZK5evJcFqa0BDMOM0L9hco0j/7Gfj+Et7hJMjCUYKJVCZ2RUY15BqBvs4/uiXHp1qZQagPg6sBgyZrbOYbu5crRIt/Pmb9rbpI6OUdSQQWj4Z/mblFE0qvH4vLDH0gt3J+s1/kkePWk5DjYEXdQevEdBDRY6cWy6LeaOoGw49t/Mk1BaNg4N21AeS960LRS7lmEF/ArEgnzi80nQmM8QaSczZKHAY3PB+rP5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(83380400001)(38100700002)(107886003)(9686003)(6512007)(2616005)(36756003)(4744005)(1076003)(2906002)(5660300002)(6916009)(66476007)(86362001)(8936002)(66946007)(8676002)(4326008)(66556008)(316002)(478600001)(52116002)(6506007)(6666004)(6486002)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JPoyW+mKknaxCpJ/jYWRhPgTTBWIiVgkdqam6jK5hH/vqTnQIs/b1LSBsDwi?=
 =?us-ascii?Q?PDAdD0AB6CWoDledjQM3az7busfS9QvHxTfOXhkRo6HMA9pT3lwiODABtnkc?=
 =?us-ascii?Q?Ut5Ibchi7wxYefh88t7yKpsVKpZ5hYgYJJ3UVLT4Ff9mGcsxiPfrnNfyJzOY?=
 =?us-ascii?Q?wGEfINQ3nvpd0KOVmrViMV7PlYDP0+WxvCzJbmto9kFAToNLPZC7rrWP+Y9H?=
 =?us-ascii?Q?qmj3v3/lyZK3FxrUduSFDV9h93uUC/Va8PGYhNH+e+lD95XCnueK7wyEatPx?=
 =?us-ascii?Q?kDBVatJCv9QYNzz03j9iHCQqIGSdEFlI2K4MWPmGYGPVtSVs/3H1nQ++oHBI?=
 =?us-ascii?Q?GviUnFOo4cloXt3rqFKNzBBBHx3e+o/cRgeSZBMBCznuHWNiq1CxLvE6+NKq?=
 =?us-ascii?Q?4HREUaomlPQ7X2sE1wfTnViwyZm1XLy606W8NBmUgLmvymEzciOKrOw4a8Zk?=
 =?us-ascii?Q?acu4gChxJydZcTR9SwnPM2s1IUL+SARao4f6z8/gjOAHEnQf4Y1Dn0PYWROd?=
 =?us-ascii?Q?mmkHOjJByNEIifPm6FDJecgwQeTKApgHwerJ/ugQh+yVBuuHjZVtwn47IlOK?=
 =?us-ascii?Q?4Nf9Se9JA9fcvTOERBgqiTi6LTWlScsi7qwfj7hzM9yslY8UBfhpeoUQJj6F?=
 =?us-ascii?Q?E8v7V00KsOGONEv8rcIU+rBdhLxjCuICltZ0HjCeNR3/y5BGnaoXZ0A9CQMg?=
 =?us-ascii?Q?PywtDIw77fUQ3vNsZcc7FJAd6FKoNTqVJ0ohWHzb/vdULzpQZhervFAJI+4p?=
 =?us-ascii?Q?kPMDRUIDDAPWEbc470OcgHHrrAP22R8Zf9qcinGyJMs1aAzjWlmChc8M22gT?=
 =?us-ascii?Q?ei5WrezIYx/D6htnZrspQscXvyrjzrEqctL6ORrpOyGChz0oYE35DX3cL+P6?=
 =?us-ascii?Q?s8+NijN+l9PP1EVGcYPYoJ2w+Yk88aUKNurXn/qFebCNJb56c3pewPTplzlf?=
 =?us-ascii?Q?+QoBFpW9TJj3lch7VHGrFahKINRNSp6qtrgjasIFJEVtEAF7npaqRE/Qdxfw?=
 =?us-ascii?Q?8A8Ymqw+yaA2WnFvpwulsXbOXkVPe2ZjdU32VqOfx5mWC7bM+wXyMK7GXagL?=
 =?us-ascii?Q?bqBcXF1hKFua6fDZ+TubnAifQdo97H5U5yatwSIDR/GID/hpd8V3m4/AxQoX?=
 =?us-ascii?Q?MKEkv065rAv5oGWIZzlYw+9NQ7cVBhfFvr0V9sM3qv2P0Q61LuBWeYh/da/0?=
 =?us-ascii?Q?kPGj/ik6S7HqwIw1jSwKLDIB8B+lawDuQFYaVZRqdzR4NX4P34HWg+QZl3cV?=
 =?us-ascii?Q?vsKB80TuY1YnmuJH4baSpiOgIMh/ojiri1kX5cxML+Jn6xRIe/StidqUlm3g?=
 =?us-ascii?Q?DUBqufq/ZRPTH+KVk3Bcz6P2MWv2HiRWvch3xTwrLKkYUhZNey9cy1Rk/iUP?=
 =?us-ascii?Q?tGqeVF6/TArsMQK1MUpXi2RZ17vHHERKnbmNqs3vQPmIAH46wGVpAUvz+uk0?=
 =?us-ascii?Q?k8tVlrPhoHnxaYN6FZONpFkpvNSF+m6zMqXRwskDwunPFBvI/TOwMq0qr6Zr?=
 =?us-ascii?Q?0cmL3G4Q/c+dMzqC5C5pemA8Bu1Gq3slNyzzWAlgk36tRk3iYLe+4pR+0qIM?=
 =?us-ascii?Q?bKDWqdWnQDQ8xdVuGo1tBcphoQtVouFAdLMBND5FkPjBcligPg0TKkXKQtQb?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a8f635-5a34-4ebd-49fd-08dbd16a7268
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:45:32.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: befJnZovc2U1jJNKEmYUlWdlGW3n5VUA90M4MSkNaL9Z/EORbh7bdHVmz8QoRU8iQ6n+I+UNJsiWi5vdU0gWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189521

From: Niko Mauno <niko.mauno@vaisala.com>

Add the missing conventional space characters around bitbake variable
assignment operators. Also fix a typo on a comment line.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 992446a033..402fa5c4e8 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -8,12 +8,12 @@ inherit package
=20
 IMAGE_PKGTYPE ?=3D "rpm"
=20
-RPM=3D"rpm"
-RPMBUILD=3D"rpmbuild"
+RPM =3D "rpm"
+RPMBUILD =3D "rpmbuild"
=20
 PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
=20
-# Maintaining the perfile dependencies has singificant overhead when writi=
ng the
+# Maintaining the perfile dependencies has significant overhead when writi=
ng the
 # packages. When set, this value merges them for efficiency.
 MERGEPERFILEDEPS =3D "1"
=20
--=20
2.39.2



Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B295C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:11:18 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.61])
 by mx.groups.io with SMTP id smtpd.web10.20154.1663596677085299985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=oeJvVf6G;
 spf=pass (domain: kpit.com, ip: 40.107.239.61,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtgWGbV4HkvUi7FI2q8/s7evIfWwCmriRRJu6T0epKADr+H6Pvtam7QMbokzuPrtczFp+KeyxS75kSxVH8BcSMaYrMruHnMyMmAeVw95xlyfltRsVb5LIzs86eJNDhQU83i4VmNODP35s59yws0uQXdmHzvkn8EdwapRzUJVtiLH9K7w/lHe5L1UDyEtTM5WQIdrPvA8dJJzsc0r2Vi82lUNSVsvSx3BmbPm2Xlzkz6kcUckZplIvsM6+6hvGmPqvEnXRwCho8UERmEcQKP+KDINxXYhM49gw1BigdcU2unEYElit9wFt7zYEMi3yhExd+KNIV8veqmGqxmm2GOeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqDeRM9BLCsqjk7DRR3AC7JoPCuKj5OT6JGScXx5I2c=;
 b=IdR/L1oz9qaWZVVKmOD2BY5in1dIu04TPUQAt2VFDGa+mhwj0TONslYq5KgGSj1JTG4IuUbv1cpAK1DxfWPYWUMzHly2GeJmMgzLoEGZUUqQ+1LVZkc9qCC63knpQgMtvxQ6FJfP6YEMh9WrMSq0Egj81Zss4sTinUtvJwIote4vRCuo0nfr9HLOyxfHSteyIcciT1qAt4JXCeL8t+rDfJQrwpRYyBHXCaNdeJE3fJWQF6VApxKQyov5zQ3OedCsDNO/qCZHT3h478gdvIwCZf4QP0VJj3GYGhRaEvQ47azZvX77iLi+CqkGT0Nn5Xb2fVCjrL73q0EYq8hBqeD8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqDeRM9BLCsqjk7DRR3AC7JoPCuKj5OT6JGScXx5I2c=;
 b=oeJvVf6Goa60BEwkdynPlFWAd92Iu7vknStRCWPz/z/cM8w9Q7Tvby7fTWQMxmuhq4SCkh8GxnbD1VU7okN9MeUhylD6cjmO8ebhINHEnXxicsa3WKi24HahkLRLd8K1HcL23ixJlCSmy4EWgDl4OqVi9hXpzILt5RVNFqpaIvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN2PR01MB4171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:13::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 14:11:10 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 14:11:10 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [OE-Core][dunfell][PATCH 2/2] sqlite3: Fix CVE-2020-35527
Date: Mon, 19 Sep 2022 19:40:50 +0530
Message-Id: <20220919141050.15332-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN2PR01MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 137fc88a-da81-4f8a-fb7c-08da9a48cda1
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jxbODWLm4XxlmbkTWE8x6cwpWhBMdKOPdYD66OxOap5F9ap0beqbdsd/mywkbxZHzvfHYdDCcQcE9j0Y18ZfUKu6X3jenX1/jYVRnIYm0kg4RWSSxYUHAdbWgOMM8+yAWzedk5OHj5gZYDFTvJyTiLrsERctilRHzZ8MOJiN4wOTY279/OaCjlrjpWuXbvudM91T4NRjZeSqYJlIaPglrnzVrgWYW1M23TF1GheV4fqNlXvIkqRQ2nb1xOcr/fqVoRevOFhUnc5JwUXpmxodz7rnfRmKiIN6tpYKcpnDlvekMlzwWbqn1NyBp5TGYpvSFBOljBvzhJbQ60Mwj7qcYlrEkDAWormhDnlrelY2Nr9EIqQrGZpv7b7gx1g2oaXw2Q0yoJZnTcua+Ooo2FBZ4kQ8OXPtOhbJCPPayoY3aGnqCcn2osNN5p4ssolDJcNT6hGCiSyQavKM8o3LIL0lbMDEG87u0FNr1vM5tGh3ljm/L019sdhlPsx/BhyieT2b8g4MMVwbvo4wF8eV34XBDgt6PNRRQ+fjDiuDE/aTpXWhdo11RgUN6qZliabtESLcpiTuBrHSGiGRimS/jd0jfJ0nwbCzwIVVYo5VNWVp7PlU4QshansprLYfIMSbKLyLxcmCbyeZxRiTTzjnJMwwsUfnd8OiN7KlltqxP9JPGXD+UVQTzeUZhfwFJJ9oRj+PrFxnlyzTJHz9T26xgfQS7qpSfR9TQIMmFwnF9xHkQs3JWmAK1w8kgJV2dqW7VaVlCVzxbwRDwGN/ueVfh7wgxbl2Wgk/iIHXDUmfwqLo/Zg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(66476007)(36756003)(66556008)(1076003)(2616005)(2906002)(66946007)(38350700002)(38100700002)(84970400001)(4326008)(83380400001)(8936002)(66574015)(186003)(41300700001)(107886003)(6666004)(966005)(478600001)(8676002)(6512007)(86362001)(26005)(316002)(6916009)(6506007)(52116002)(5660300002)(6486002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AeC45nEayAndToY5ox1UNwEelBGHpThlrIVbz8OvKg8xeJAmCUZmstNuNlUl?=
 =?us-ascii?Q?OW2l5qYehqV7iKjW+FhCloGbbTMRmJZk/NbB0MQXtXIaI0Sd9f6snhn/MP4k?=
 =?us-ascii?Q?EJRCMhsjDvhmlpcgcGYzd7jDj/JZ/zjolObKcMK73w7oHi4eO/99CBzfCoR6?=
 =?us-ascii?Q?MaHaNuQ+vPe0vchbT1LOtZsxGKFrkkg7X36K7Z91q5Xh18xXuCIBcVi2jeyG?=
 =?us-ascii?Q?J0dEHC+n+vs2XO/9Fii3KkwlSy6mLXXzMkulJ17AC6XXaXTB1jIBEKzEPzWS?=
 =?us-ascii?Q?6FCKDge1T8ES2JrxJnxcJZyeHqlYL7Pr+q5hfLKPvxwg6+Bno8DX5tkTkgeG?=
 =?us-ascii?Q?0xlRwa7hhoIpMv+m5IIt7SaNcFMb6SWBU690jnS91UcBYLjLh2Pgumg2XV4e?=
 =?us-ascii?Q?mCty2WQId7grFe4m6FoIs16i3/MxF4uCh4h/SBPVRgrJ+wcsxI6XVL7JovBw?=
 =?us-ascii?Q?4KhcWHg2RmIpeauGXrtckw4feENNG7pI/zC5ZiJAtVqJw5vJs9T14HCJkwE9?=
 =?us-ascii?Q?6nccSoWYMM8V6j75sG65DAlCvJkRs7AOz3ma8/ybTYbrslZtf3NY6c6QbDrg?=
 =?us-ascii?Q?IKfxfn/2ULp1U+KFhUAMlL/K16Sd5QOZGl5ss+dIl9TUG+Q1C9eXqkPijcCV?=
 =?us-ascii?Q?A1S5Bu+yXXU1wb9sY5MiqpVR3uUpVXJ3nJoO4K4TSuA/SgFIDmQc4+VaWUSq?=
 =?us-ascii?Q?Jm/T6VrFM/4Uh1y6VIs8HsLvp2Vv4/LT5QnlZC2JNCjQxstyGzKxdGmnQMWn?=
 =?us-ascii?Q?huXwHJ0rBIczVUcBEydsSCdBAR+Ssr+vCSfYtv4/FcML0ctAatqdKAZLhPRp?=
 =?us-ascii?Q?aw4hscfBubbF1FJHi+1h1dnLwSaDkUzImKDLs6WwwBDqUpEVDzhUBpHreFfU?=
 =?us-ascii?Q?KvKFaYRjNVkl7ly5KeNy8F0i4qaFxEXK+/1ClbNaYtMK4GHnQbHnw38TL5Uy?=
 =?us-ascii?Q?Et+v5E2JkmzpgOaJ4YC7cS5mPsgMaCPmpVDWVkbrq7Zmgb4wPQ6ZLtC3ORJb?=
 =?us-ascii?Q?OYU8VjLqq/UBbT+HxhUMvqwIjBiMUqD3TUOpLojViGHk52vgG1Q3gFUifBxS?=
 =?us-ascii?Q?LmST324FxvJUFVKOZV1bTGA1JkF1OI43CIOmiueQQcch4kgN1rd0EF/fd7LC?=
 =?us-ascii?Q?VjyY5MR8rq14G12w163eUTWqA2v6AVtx075wI8ysZ4Og2SL0AdMJBAXdSzWI?=
 =?us-ascii?Q?3Qqa96cxFT6wB0cXrMiy8bYyvNQsp7Jvnz2TWoPyosHssz0v52FahMMrxn7X?=
 =?us-ascii?Q?Vp2Qc+oqL9+CYj0vkU3BD4W5cciUgbqR7JPDOql5Z6aNZ1EyXdsxLSVgzKAN?=
 =?us-ascii?Q?t5+DNOChE0IiH70seJoTK5VVZRKmUFX2LcVREMXEO7kQRhtQJUM1WNiTrqce?=
 =?us-ascii?Q?igM4nsmS7Ebl5y2macs8CeVN7N8BZJVcQQHhKPeu30bpdgvzKjeGwk4cjBTa?=
 =?us-ascii?Q?Ddr0n2BYpu/e2tROhk8RsbsmXzfLx+HhlIna2aIyE9fMxIhP2Ks0M3UVIt7j?=
 =?us-ascii?Q?LTIu5nlHq1c+xisUGj6mhgDnDmGhVkDhdPjwLqDsyRdoqQbPB+JUb5N+GCrK?=
 =?us-ascii?Q?3vt7eJghE0AtjSagKIo7Q/k9LMQTAmjEySpPlajm?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 137fc88a-da81-4f8a-fb7c-08da9a48cda1
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 14:11:10.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BXOwi4pbHx3JqcLD7l48uFnLtu/s+g08Px4o/BTiV7iLDKoY+eJ3uwh4IQxDB26qC6o5XJnbVj4vFba4Swp9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:11:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170861

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2020-35527

Reference:
http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqli=
te3_3.27.2-3+deb10u2.debian.tar.xz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../sqlite/files/CVE-2020-35527.patch         | 22 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35527.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35527.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35527.patch
new file mode 100644
index 0000000000..d1dae389b0
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35527.patch
@@ -0,0 +1,22 @@
+From: dan <dan@noemail.net>
+Date: Mon, 26 Oct 2020 13:24:36 +0000
+Subject: [PATCH] Fix a problem with ALTER TABLE for views that have a nest=
ed
+ FROM clause. Ticket [f50af3e8a565776b].
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool=
/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz]
+CVE: CVE-2020-35527
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -133110,7 +133110,7 @@ static int selectExpander(Walker *pWalke
+             pNew =3D sqlite3ExprListAppend(pParse, pNew, pExpr);
+             sqlite3TokenInit(&sColname, zColname);
+             sqlite3ExprListSetName(pParse, pNew, &sColname, 0);
+-            if( pNew && (p->selFlags & SF_NestedFrom)!=3D0 ){
++            if( pNew && (p->selFlags & SF_NestedFrom)!=3D0 && !IN_RENAME_=
OBJECT ){
+               struct ExprList_item *pX =3D &pNew->a[pNew->nExpr-1];
+               sqlite3DbFree(db, pX->zEName);
+               if( pSub ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index 48051593e4..d9e98c9120 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
            file://CVE-2020-35525.patch \
+           file://CVE-2020-35527.patch \
            "
 SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b78=
25a2b6b51949ae"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.


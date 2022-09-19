Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEB7ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 13:56:18 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.50])
 by mx.groups.io with SMTP id smtpd.web08.20190.1663595774386897026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 06:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=J2fYiGg6;
 spf=pass (domain: kpit.com, ip: 40.107.239.50,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmbGc4Ws5uGFCU1WjkrE/GTI/Uq+X1nbaoPxO3gKtMr0WjE+EaKB9spjoVVgPq1aAvBn6ma1mF4WpEh2Zaz4O/dQzJQqL+vuIFP9W66KSGvQDJjNKxOK4Dg164QXaMlnKB9iBvrgnT8LxL4zWJIHSff9Qit/qh/K+deXQp/HGhmYN8jVQ38GwH2/xcuCJ+7rs6EWDxu/NCCGg+wA/HP0I7Tv3wVfvozuDHQsMvYQI/66TEA/WT9SMbmfYQy/O1vYAidAmSQx06EP4vlqpadA4JoMTtXkWdJVgmuRKLvzQGsXdziGIGOYi1AC+VIMLJ3piDJFqgSyTv/8OXouThaqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgOUbwbUq1lXlCiLwXxmzpuYNMg7oqucD5Dg21GtxFA=;
 b=GbtVhmgIufzEzX7HBKKPotZ8GLiABFNRF1i+i6jtHjIcMh/x889p6640RjRus26R5wb1zOsGVYvP2/P/cmc/lHnB+MdRPEh7ncR+szj3cQjbLTUJ/PlNZydHKVuGcxdlb3JkiBxq6JLXTfvUnyzPGW1NPiTYt8gD/zAzYOoZtgSqQhOrHZjH1Xri1xE/XQwN8jH5hkHeTTA4Vc96DbBiHKRWXW+iOdXCAbDXddBKfD+0M6UcWw8tmUNkFNbi8s9tzjrEMGkuiqKi2xysQUL82b6rsbkEYV0tMonqEzrp3OH+5wHt5of/kqUDWDOi5jQGyOQ3uOhmzOJYRdDKHspCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgOUbwbUq1lXlCiLwXxmzpuYNMg7oqucD5Dg21GtxFA=;
 b=J2fYiGg6SPyvueEAYSp2Qv+M7VdUA4j7FcvfqgV1SMFDFMvraMv3aVfJANAc1NyZkGc542334nGwb7lLOye2C6DnaNzBbxxYC7ef7lT3++1CoEqR8IueuQCCVEXkxMH7p+nOAEQVr4H4oiwjGzTFmhNv3nnK1uVrYD/KBvJSO3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MAXPR01MB4120.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 13:56:06 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:56:06 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [OE-Core][dunfell][PATCH 1/2] sqlite3: Fix CVE-2020-35525
Date: Mon, 19 Sep 2022 19:25:36 +0530
Message-Id: <20220919135536.5360-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::24) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|MAXPR01MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ef6b4f-62da-4e9c-4c0e-08da9a46b263
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ip8glriWLsrIFzTJw9rIaIFxXmPj3AvYZdlSoLBtJtjmvtBOAGeo8jZ6VstVl/IXlDgCoaA6b8Pk2Bugxwj3IHMDSOqweof8slGToOyrG+cn7IIAo5zaV9inCnBoJ9+/H9VEQ2oSUtYq/zqdYts3FFCs7iDClGbgi2ec9l53gubSAAf6iDR9Y4fVsXI3V2D4kM9hokwP+U0gqK9AbxjBFPMZuz4Z/mIR2FqIaXxU9p6bEd9j5lh2SD3+XGUZA9DZPvQge2GyNz13bcHYkck8/IQTCkFPebuEtIm/AFTfCsYWq4AzIosBpXh1fF0fV6Ibz+4qEPYeWVGEuqNu/XMpDwkYe4Dv4uzmM/pn3ci/zKEKRnBF35Tg9r4EaIazODQ4esQgPIorA/UOdkUAP8nGFmE2DTkZy2a6S4RR7PdQlWuC4lZ68Xr3pnYkXhL8oWyr7Gxmp/G8ghNhSXrD+ZRdVxb9pkj/Z/zfEZ50c+PkW9hwiYQybinPyLrtH7Epc+KZCvv+GCgvYwUy6QUHc+iREzDpZkBQ3DpNJVm2vjYMVMk0blyG9iDzTWgVx/PlHHLqsLB5/Y+IQCzkIA7ZX1HKymtx0btPy9c6bpwj4TOHgvEEWC2juSsDlTDKvnpyVujdh85l/pczpmQWsu3aYhPWnOUQbWOPWDXDq4gkwW6re1rWWqkmMm0XnD1Ytp/6dNeptZjU6FVUuCaabCa6dQzzmGU6s7b/IvOOsw2QA25OmWo6jIJNUGgZJM1j/pB2XzMOYLkSeVCCOOH1dD8dGgPhYR+cGusl8iSZARybm76gzhk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(2906002)(2616005)(44832011)(966005)(52116002)(41300700001)(6506007)(6666004)(107886003)(84970400001)(4326008)(8676002)(66476007)(66556008)(66574015)(83380400001)(6916009)(66946007)(316002)(6486002)(1076003)(5660300002)(36756003)(186003)(8936002)(478600001)(86362001)(6512007)(38100700002)(38350700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h5Vb4NEAFBB6Qz+pHFjQzOXofKhS/s3/4/Lkq2i5mzofS4LJLFuJyuB1sxdu?=
 =?us-ascii?Q?NXlPiI9gd2cvlvyr9RTFr3EdSs+1eMavudjljLK4imQ3iXO7Xh78mPdmBfDJ?=
 =?us-ascii?Q?uNl/9ml7wpUTYydDK/D0MD03VNTNxgWTp6uSLsUsq1ZHP4bGpByFAP6WACn0?=
 =?us-ascii?Q?/VMNc4s76eY1EsLg2baGOVsXN1ob1AEdlT8WJmhg+xAy19t6hP+8+lt7Px9Q?=
 =?us-ascii?Q?D17etqgI7gzqmL+MOhlyka3aDk27MXVbwZDp5Vu17jg6KUkgtdmSri48g9KO?=
 =?us-ascii?Q?JWA/YpHh2UGw+E/nKfyJCmuauroye48slnvU26Q55pZhsrOd/G9viQADd41H?=
 =?us-ascii?Q?oYh03Z1IWVGvk4hO+eSz1ORfEQJkIE2E5VrNLOzB4eegbROwVIk4Dr8eAk32?=
 =?us-ascii?Q?beujESrPlD5Yo7xMBQs3fE8rIRuplTjEt6VoSET8dssjd2xyS/P1EEqK81c3?=
 =?us-ascii?Q?v61dMxPCfxhJ+exbXFWICf+8BlkSwZZEQ0IuTIiFH1vtWM0zaEzFyB7wflnh?=
 =?us-ascii?Q?o4cPvaBYsSpRhjX201Og2aauMgG9cSanz+ScD/GKLHlUfHa44gmQWEgnpTPy?=
 =?us-ascii?Q?p5fBbZ8osUcvB+z/XbL1pVuifPovc8CyKiST+3+h5PwB02LYQQIn5VDCT0Wi?=
 =?us-ascii?Q?oHRW6sdv5zAV4ABBpYIQU2DAA/yTmMwjnt//abZ5cSh05NRoUBPf++kY2p2w?=
 =?us-ascii?Q?APAMfP7pE7j/zxH7MbraLhQxIsV7JUD4dtt3l35QeQ3P6/yCLJqhnn6/kHPA?=
 =?us-ascii?Q?05P0hICKbC9Ms+6br7zRHq14bGwEmOIPHt/Gs1r9rJxYjoWxzqYXSPjrrqj/?=
 =?us-ascii?Q?n0K/u5uyRFVCahwoBiQlr66dIxlkvYZp9+n2hF0mmPEKmJ1oaLu2eoRRVpnk?=
 =?us-ascii?Q?+voiu/GBDo0IIONaVpg3nTsBK0MNtSnAC/BD/keW2YRwuG0HMgXXcEq5Bbbg?=
 =?us-ascii?Q?Y026iZ3FHrFET1qhCH2iX97uUP4v5W2dMG0gnMyAg3Btd7op+pEGJ75m3MZC?=
 =?us-ascii?Q?UB3tV9I8tRW9H0kjrdalbXieCsbMC6JlyNjYiCBLXQmwqGtpLXyCNzt4AGMJ?=
 =?us-ascii?Q?htBwtNLSGGIiNlRTgLXvTlEkSjZ15g86oZlLaxguGJkp4FuziHKu+q+SBd6I?=
 =?us-ascii?Q?LUi5cojK4x6IKZyHWVv2WX1VXDSrZUK3N+orbwRJzLptnKP/uZDabAQsQu9P?=
 =?us-ascii?Q?LQtVarLokjDvA5H3IwRCho+s3JKPbz8PZp6Pee212S8oExoCuKYlqVtXWrLn?=
 =?us-ascii?Q?fW1q/11BnjRVfSmYVLgMrfGKwrV0OTsRY7tVwplkItGSXkiW6Bp1jgQByFyY?=
 =?us-ascii?Q?8ZLd6ED+BfWIroV/v+tFR4Hd4E9PYF7bxgkXOq/uiP+iWsOYOWEchu2EeaQz?=
 =?us-ascii?Q?TO5Vut531EGXEPkhBiaN6YK3zj64q/+ZwwiKIZ4yRVg4BJDD9scGb89C8qs1?=
 =?us-ascii?Q?1ZjKvryaVm8du0Yg8rfaHgM49v/SphwR5a3IhutNb6lszyka5lP+R+NjO5lp?=
 =?us-ascii?Q?xVo0tgRKepYOgQy8MIPCx8DyqP0QTTimr+x4jOyAXPo4su7tQiqNNmy0DsqC?=
 =?us-ascii?Q?44WEM+ktQGkGJjmiNqe/HBn6lU/2eJKEFpy0ALy/?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 66ef6b4f-62da-4e9c-4c0e-08da9a46b263
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:56:05.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 czCgYdid0gl/OE4UOFQLE3ootYGWAJcRBx3u/S42uMekx00AdViWKVf+54vYfmLYnWLKY8G4LtYYjCHt9F6lnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 13:56:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170859

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2020-35525

Reference:
http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqli=
te3_3.27.2-3+deb10u2.debian.tar.xz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../sqlite/files/CVE-2020-35525.patch         | 21 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35525.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35525.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35525.patch
new file mode 100644
index 0000000000..27d81d42d9
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35525.patch
@@ -0,0 +1,21 @@
+From: drh <drh@noemail.net>
+Date: Thu, 20 Feb 2020 14:08:51 +0000
+Subject: [PATCH] Early-out on the INTERSECT query processing following an
+ error.
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool=
/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz]
+CVE: CVE-2020-35525
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -130767,6 +130767,7 @@ static int multiSelect(
+         /* Generate code to take the intersection of the two temporary
+         ** tables.
+         */
++        if( rc ) break;
+         assert( p->pEList );
+         iBreak =3D sqlite3VdbeMakeLabel(pParse);
+         iCont =3D sqlite3VdbeMakeLabel(pParse);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index 3440bf4913..48051593e4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2020-13631.patch \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
+           file://CVE-2020-35525.patch \
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


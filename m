Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F0C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ZTA11Vih;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebxL6eV/MXnI835Sn7iajwX8bDr1sIx4Y4/rQqXDKu/987jFAb7i2mSGCsnlJtwAN66uvAfS2DOgYYfhjF4AFRvf9X7rcZ/Jwy5XBYlfkC8Bmhg9ThsV4kBBtTKlKhPkP3Vtit5RMmgLJsgmY2JwATangnMSsWlV786Zfk3ZRDMzEDcDzEmh3tpVy5GHIN8bh1aakJ9PXaCJRJGzxAUZsxSFNa7gulJ9Ls7GsIxMzl7l/XBHDjxorL7Kn4pGrRQYZS04GA//Jb9X1WdtsXneRggYmUgQrB0mTqaOggixSut/c4kezUd1B6zsNidUZH2DhOnVUG5nIWbN6rEW0/JXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gcK5Q8WlipHynBTotZuxrYVyFCeidaQDVJmE0+SuKQ=;
 b=aHHjlnyHkmwXnjDDb3hTFthKc3Zsed+IgChAQwMxOwewW14fa/yVmqMItEyBXvwbcfA3ZGBfbaIJRjmo6qNzK2z9uWuPUw6R4MuJovZGbAmZjV/M1N4b2P2xwpWKuRmmEU6AwAcKg2ouOHUdG1UvUJDTQHptcwi5mbDCRyQAQELWOBO/pFyBETTEvSpuwG7XpHdm+/xaA/jtbEN7SAPIdDoC6ZJglLm1k9LZolWDi78Ihwmg0p9/8LEV7h6VOjybEJCR/4/jiM7cVMiAhygTUiL+1TFx0Qet+qhslusbqPdwQy2LxC6O0x4Sc6BNCvsM3LJVj1TtuFZBHKSmg788+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gcK5Q8WlipHynBTotZuxrYVyFCeidaQDVJmE0+SuKQ=;
 b=ZTA11VihfRMD6HUqObQx4wyokVFcWY7dWNVMEl6tHVB4NRidndC9deHfvBQbwh6FVGBnyCGC+iaNfZ4ic1+sbUt1EVKew5ZxiMNJJ7VfmkEMWio47IvvIgq75grchYBh0FiK3vsTp1MD5HgJPJqFQtg6F4lDg/sKNn88OcUps5Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:49 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 05/12] recipetool: Change default paramter fallback_licenses
 of function split_pkg_licenses from None to []
Date: Thu,  7 Oct 2021 12:13:19 +0200
Message-ID: 
 <20211007101326.11075-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63d539d4-1420-420b-f26b-08d9897b27dc
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB46493641EC497C03E16EEA4ED7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1l9a9fAjJyCzaPee8ptUQER+ld6jbKNy0sTxx1mDv02Wj0dH00Bd30UhSlLie6akIea2C5iVg4y9c59Qa2mVP48ywqL3TM/dlYohcz2gQYDRoCZOKfUfL8cKLdZL7STvUREEbJvobvysPqNpna+0tXIsP3xOEIGb7a5KCzHk3045L+P7c37wuPuq+6QWphKR+C6MSi9aUQPr8GG1ClM3Ih1UFH17cDxZEQRPTf4JOVIFH+oqchCW8rYjDr619zwglJc6Spl+2KXwu9SYvhr80Kln0mntY3Qi7LdREmQFxXtdGTC+m0L33L4M2or77m7aKpx9UUT9BSJ8x3gVggg0riUfsWai6qnxcHXX11IpCRvTHHabVsJUH9KYxu6K5QkriCeD+3aQbjU2HB03e6WX6YPHcKh3iXp8qA8AvNjcv9fjlCrtJbjrWZ4LQcqvsT7CrNSVUfmXyB3hkEng0HWEO6wdq8NnmuL5ZDfhKUOwheKr2lUUoENjPssO8ObAy7JOPZrLF1n5u8+CiEEKZRKvUbFs/o/3GcL+tqJch3F3kqWwFXjyOuIek3qO1+dbM7ViXvXwP3z1w+3/EyXbDYSlG287eT9OQFLZ3Xi9llAqK4Tu2yhgdQVyUpMdMuiZiEJbNRX5CRPGMibNo/cz7a7Me6iedow4V58o0BMbyRnHyA4gUFN0qdbeuOTlbgln/6liNFeEWpLw7MEeeg55yodCJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(4744005)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CRDwhUGYFSXDrLKrjxLjTxEkfjJ4NKxJLLbixCNE2FLGtyC2xO0x1+irSY23?=
 =?us-ascii?Q?oJ1F/ZxpoffHyVEFs0i1gRBNY+qjLcrxG1XuX6lP5kSJ55ELGoQjP8lJYDq6?=
 =?us-ascii?Q?by1vodLzbyO0N3IQHeGI8ULAXvwQ5OSk3Cr2ngVF0XfES3gC1bbIpUhsGtyt?=
 =?us-ascii?Q?r1Ycdr4FrY2TKYcCCGDf4tcM9ZDDnRrJmreu9Ee6v5AjOU67OpQ5OG2/ppjQ?=
 =?us-ascii?Q?2v1BMaaZm7VY1caPllfw2q27e2gOePZyd3kVjGB9vgODl+EU6ujXHkjpAL59?=
 =?us-ascii?Q?ceO1OyC+FSFYLkOXJa+YC8bMjNkc3fQ9p+lrbzzMTtwnZYnD3qUjHJvnA/Gh?=
 =?us-ascii?Q?N3DjMl6c2ij24D56xyizbRoCFLZvOGMk7COvPMk6+3trGv//dIGMAMR8DfnP?=
 =?us-ascii?Q?XicK1fmQivLqJ3eOosYd4r9zNUK3JybqPuz/L+uE/0XyQ08HWvbIYy0Jsl6v?=
 =?us-ascii?Q?vhIUKgOCC+zyGVmtyaDsY1jaArbVPT1tdmY0wKdpBhD15nASO9jxv0JMq/OS?=
 =?us-ascii?Q?BVGR8tTwo+PW63AjTjjmq5XMI8e8nupZCdQDXHv/l8gW5veuhYHKuXaW/XOx?=
 =?us-ascii?Q?Fx4Cmo5axSWcsPYNH1yjP1U9VqcAHHci3VnEeaB3aplrhBZOTCWE41Oj9AxI?=
 =?us-ascii?Q?fLpVg95EZnvSTn4zUAkIY7zeVyuceXVwM9GetppmTGU9yf/CILQp3hR4IA42?=
 =?us-ascii?Q?s2sz3UKb5R+VTSUK5Hobde4VoUNG+A8J050TP83sRBkQrMhJS5s3NiT/ZmQO?=
 =?us-ascii?Q?WatpJW41KDKBIjaJuHcAWREPnTM5olXIv4xoaJnQcKD8yBJw/UNAj4lrp/V9?=
 =?us-ascii?Q?BfLfhu6bXmSECa3m8vKqIlsJn7776uG4sL03yesKv+0Tub55DB+j9Z7JHbPB?=
 =?us-ascii?Q?rh8TzNXUwqY/zQHp9AIYZtv9i9PyUP4xl3S/TPI9MzdxTa9oFciauAouL3L9?=
 =?us-ascii?Q?9Brc65O9ArnZsOY2Y9CZLG0UaVaOZcWEOYWaqha5QfRO8Mar6w+DLIfA0ANy?=
 =?us-ascii?Q?5XC6jwBgRwGMQLOCMNMxDtIE9FSnf15lcq0ExK6tcDgSQsc4P3XZrkT5qXE6?=
 =?us-ascii?Q?VMgP6KJlclQHQNqfCm0M72kug37ohTDP+9a/rhrFNiSxTDMLPxuW3KlIY6KU?=
 =?us-ascii?Q?epPB7AGqMdXRZ8qa51XFw2uROexqZZFwXUJBG5TyfWanYpGFIvGKWJnS7APE?=
 =?us-ascii?Q?4etUGlfghpzFxDLo+Dic90kGo5y19GWSHgyhjWrYYLA0OsOm2/Dgm2yAPT4W?=
 =?us-ascii?Q?K+QScl+MPlWOwTOwLqPSKRY7b9JzZtgF6OrPyKiodhocU5lp7dNSAAFgaEjY?=
 =?us-ascii?Q?GSaywIyOLzhONxBqLkcQFEFk?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63d539d4-1420-420b-f26b-08d9897b27dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:49.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BikjRhCgRVzhSwiWiaMyUj+alSIWiTF4ZJGFYhV3HkqHnXTHZmb6sqyYWKnE8C+HM1HQT+rcTNgsRCxp6+84FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156711

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index b1c8d32852..d86b98ff1e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1133,7 +1133,7 @@ def guess_license(srctree, d, licfiles =3D []):
=20
     return licenses
=20
-def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
None, pn=3D'${PN}'):
+def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
[], pn=3D'${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by guess_license()=
,
     a dict of package name to path mappings, write out a set of
--=20
2.20.1



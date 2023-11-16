Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B823EC54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:55:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.5065.1700135707865706721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=pGIbBM9i;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcU5B5fM54uWn/WNdM2DmuTcXFEzyoHyBwEsjkbOby7eKXvx/8HFoYxXx6w9fa+dKaurWsXIUkd7txE40ICQ8ptROdI/FT6T8ZgC66cR80XuWEOK2RMeH9Ti+AQZAQXOZe2Moo0OJMWLcoAl4tktep5cnvY3S+NflffHOS7NZMxqVImEcLVuBTULU6hLynceDuMZMIH4+Pzs4OOHUF8Vg18xrhf0H20/buw/yXJINGzEQpepWxYQ/LF0Sjmgtzv6ieuXQNe9rvWAl8dXdWjwFbKa3cVae13bWZftka9ZcnBOCAPnwqAwTf1iGoaQQLSA/V02Ofh1V4kalvM0yYATyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzXh+VWNrRE1XTCaginoV+RADDCuJ6p/++7nP57oJ4E=;
 b=EfU5deC15Bew8JLixbSEXu2usUTfJuTPo6tMwvUT1BrmcoAXszr5/xpUmzXOnHENP0duNbN78klPsq6skDGMmfUcKCo/qwEZbnK9dm9iaYIdHN2H7bcAGNwZOuo+AhbV7Vo12MD/qRE5awEjF2vtEftyNohS7sa2l4TBH7WaJOoEUPP7+R+MnGOJLRP8Pr1I5IDX0GoMqtgjiT5JJCAQCkoIosMteZkJFBrG1HhxwxxhWzJPBRsR6e1nZzD7o1L5c49ASmUAGbRYC0rGeuAcwGfr8aqVzbI03ZO6MSb6zz5DX3YXdT8K98kNQHmUVsIi93NFzK/c/UoHkCz0y805Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzXh+VWNrRE1XTCaginoV+RADDCuJ6p/++7nP57oJ4E=;
 b=pGIbBM9iNq/zKOBEz7I/Xe5P++rqsZc1fR2lmgmq/E2P8ai9jxIz7cjuftSxRqKQkxl9b1CN5TFkHVBJOtXNQJq2H2T9dCWnUUMw6pASrE8Csh+qTNlumbU7Pb4l0+XJhROYP7n7lIcWwKVQKnVUViM2PF5QXH9rRLHjmEjWz/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10581.eurprd08.prod.outlook.com (2603:10a6:800:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 11:55:04 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 11:55:04 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	Malte Schmidt <malte.schmidt@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 1/4] systemd: use nonarch libdir for tmpfiles.d
Date: Thu, 16 Nov 2023 12:54:54 +0100
Message-ID: <20231116115457.1462082-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
References: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0e24db-4095-4dc3-5e1f-08dbe69adeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	988yulC7bu/dFMtK4OiAC2NKXnneTOU1tLp5asNYEOMRLc/Yb6wzArDXheTdgCooc8YrLQsDJV6FRRv//naD9O2WTElGat0A7g8yRFLr0sb4XU/n/En1rexIJbP/t+J1TKb6qvWkRkm1+XNEt6r6R5dwn/2iTx0jD8XaXfieXmGSOIGlIwyGGxQlzXE1WDxGL7+TKM8rj48trM0gSaH2fQo5X7pNUwTLQLqDBeygBDWvTIlcYHK6Pm1Z6rcGdUJvMCu+KeE7uWdnoQTKKv40I3mgITNykAG7gB5Svsnauirb2Wq/UD21Gi55qKutmV4DzMNnSPSI0Vo4M+UQX0s7huWdJJiSTVEHVrZVBZ+IKmJQsInYtMHVYwe7iGdqXxLHRFELtSAD7syc5D8aX/6Ljr066m3x+cq6HZB/FotGsBj6vgq6q8d22J5+aZXRYvrtegCz6eFw+Bo5J788tGZcdrI0i4NaYhqG06WTYOjxCi1bGM3eea7QARiUbdnVlGVKtaIDQtD3v4ZNHTwK4LUE738xedNxLjZ55jSg8NHomLTlTRb1vFFjl0lwVBnPtTUzt5Mllp10Rxd0RsunMKzukp5pSAj0/PqbjCHuiJALvQQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(478600001)(6512007)(1076003)(9686003)(2616005)(6506007)(6486002)(107886003)(966005)(6666004)(26005)(316002)(54906003)(66946007)(41300700001)(4326008)(83380400001)(2906002)(5660300002)(66476007)(6916009)(8676002)(8936002)(38100700002)(36756003)(38350700005)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ih+Zw17x+6tu4FWgqWQjr7mSOaxUcYrcnRgDKz3YJ2uGsm5Wf0q69qrqIXMi?=
 =?us-ascii?Q?MUcNRZmxnlgUrp6YHwZG28uLpCG7iUcQjO3Hy2X0AvPd2dbKE/lxt4GGT2oM?=
 =?us-ascii?Q?xKQHp5R8EnVTM4t1ywTlr+jTpRrhx2A2OQSb1SmjFASrVVL9C4Gb9OH8pMDe?=
 =?us-ascii?Q?Mcd56QjchVgdFltJRtLsikuZBioi370vVUyj3a5m1HqxYpG5bL5NCFvXcRuS?=
 =?us-ascii?Q?2iw/b+S7sOJu9iqaD0q/StmVE1CS8kf7FgQcKqJAubRv/uC33vXgRRJ0WU41?=
 =?us-ascii?Q?pVfHF1i4ilt9HZu2LLjR6+DjiAuQAGyx3qvvfGpwNFgaRNSiqqmpz92Sd2oM?=
 =?us-ascii?Q?C5B5U6n+pn3fBNQ0FyJrJRR6qVWApCzVd98c9IeI6hG9MP3pkQFjODpKQ5zw?=
 =?us-ascii?Q?BXVGojO73zws+EiX3VjaOi7+FU9CO38cEA3KetvWe3HOTK0fOf7J2yimbjba?=
 =?us-ascii?Q?9Xvlubuy2m9GJvFiTbkupn1w5Q2BeU0bT2bJHPvcjPIl5/bZW0Anm+B3Pts+?=
 =?us-ascii?Q?gal+iI1mnQRMeJ/eTXoP4fFen7H/A/OG2GY4SILW9S3Pe5h2Tdaw72A3kHMB?=
 =?us-ascii?Q?rZ+fE+yTUMLOHvlHUMYZsshhJXqbpMGlUujJ7OpqlXlUNQe072U1u9UAF1es?=
 =?us-ascii?Q?1QNipV8qyAlXkCdh5PmPwYrS8A0o2R1NNUacWPbHD/vecxuWvRxuEu3vdTr5?=
 =?us-ascii?Q?pYDv5KvdZaVMhZE9h2GYmo23iMFqHcLENzBd2ISQPRRBEjp9c3WKeeY28kNF?=
 =?us-ascii?Q?xE5iOa+oJdk6JPsxujA9omSeICjnhvAtEsRGnl8Xw71MJZ7ttmldPzZpVdHq?=
 =?us-ascii?Q?4rQwHKETVzMRJPpvxoi43IAqZdo+U+DSAzYW38TBFO+RNIuyqKoovDfA5ITK?=
 =?us-ascii?Q?TtMtNImYYHfJO/pM0Gn2XOkrppDRDHp/m13rKtil48o3FlGRefjntkcgLtic?=
 =?us-ascii?Q?EXXvN/fEhiPMcdLDGKDlXkOuUQjUzmvNjZ+rkvpSg8BBTGM9rKZPkRWSp3v1?=
 =?us-ascii?Q?dpKQj3F0UyrNSPcGRmhI6Ms7R7a7AgkeJbElt0eb8DIv424tOYpoeQVG7Ahy?=
 =?us-ascii?Q?d0FVpqBAYSMECIPIMJlLQ0ja665rP4clR+2nm5lRBG/PbuARQXlS8NS793DS?=
 =?us-ascii?Q?ynMgiCbFa3K+BYLLEDsEPPofY89pSbxKMpGbwW7pn8NOtw3Taua8PH6cso23?=
 =?us-ascii?Q?H56ckqEGwPQGL7xvuaYOTpIy7sta18DwjFbqswHIZQ+pYfbgrLlKf/4ITcxe?=
 =?us-ascii?Q?Fafb2OZE17R6SP+Y+cIQv/UJkI9ht5UrY8K5sVTvfV4T526/Ju9nE6bYCp9Z?=
 =?us-ascii?Q?UlRy5dWa4GAReDlibbOaxZH/LjdusPoL0ZG9V6xBRrb8N3zO1VGmTvnyKeTl?=
 =?us-ascii?Q?0n/9cQGI1xMhgFZxYhbXhzH2XP5Qz1m/vp/LiYL4srxruPmg5NaeOT+KodFN?=
 =?us-ascii?Q?yBpJD0AnaXqGf1LzS0SiuEN9OtrUZs29vdQ+1tgDEwZQt/41ypxw5wMfe6Iq?=
 =?us-ascii?Q?zjd9q5v6x8pvmbTkau9azlHbrfDdP35LePJCA0D0aZM5Kd4lARCYjnKgvArn?=
 =?us-ascii?Q?kH0OWdacQjaCZSoRbHO0mh+fSg3cAN6Xu22FtjmovDQLChl1SGisnjO5OdB8?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0e24db-4095-4dc3-5e1f-08dbe69adeb7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 11:55:03.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sXPGAghljjfJJXdCjo8SZOf5P2vuFvwGTubKSad0XilQY25V46LLk7x5P7n1nWwCGxhr8k0QbdUq1IyqvnqlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190785

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core=
/systemd/systemd_254.4.bb
index cc0e29fdd2..6d71fbaba2 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -282,12 +282,12 @@ do_install() {
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/sy=
stemd-udevd ${D}/${base_sbindir}/udevd
=20
 	install -d ${D}${sysconfdir}/udev/rules.d/
-	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -d ${D}${nonarch_libdir}/tmpfiles.d
 	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
=20
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpf=
iles.d/
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${exec_prefix}/lib=
/tmpfiles.d/
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; =
then
 		install -d ${D}${sysconfdir}/init.d
--=20
2.30.2



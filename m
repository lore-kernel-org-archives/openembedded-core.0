Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966D7C41513
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=GjPKQJ0D;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS7+Tt0cQGR2ek3KpxpO+Rn338iD0k+11Yk0u1hwMy3x9BJZwzcp+LJRjB8b+9AVw7zimEJTbTvTgA8sNMXYT8yJUu3HiKH9AE/aE02knr5hsrsrOKvgXNYrXBW5p85xO2MiQWIlda/JWn8HLBQztORijbE3pcSVBe8vrHR+FCTGd6U0bO0nVR5d3gpGjVounNvixKr+OV9datmzY7g+nRo1LQL1Z5zxgAb52WUVQ+WrjuiTAqcumxNM1qt2ekykF4kwpSGBr0oZbr9fEZl44B2u+QkOb8QxF9v+46mxMGjWocfL/Rnmh+NbTOU0+ZWxaSxt19udGlY41BuNShXhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=jjJo0TBxyrviq+76QOOOg2CUmQrb9ccfwAoCpQUp+7MH7BSlwa+CGQPj29/0WWY+UZNeGYpLSvhAidiZmKxu2Ex4lkQC5m5t+aPJkOIP608Rn1PsPj6pYp+IH4Dbkt+xB437cCOGRX7kqHCRRb9WbTEQwAS1SnBHaq2i7MPYVqsZ7uPp40WuGDjwr9blBusdtHpnN2qNUEc54ZNEqNh/U9p+KDIo/zivUOFmhb6wQ7NCyFHWbxTKl7QufRYWykTANmEtXAq+Yb21K6WO13GsuMtGhrYuUjXXnOzuZay3yXV8AJgy+1sN0+0LTcBRo4QqzSRHUhzBRz44MFSsU0oqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=GjPKQJ0Dh0oMnbzzB/xkJxyPXD/Nj3OcqAhGB3lBd0/TuXbN9MiqHE91jPIkRqUfqxAXc8lL0vzuO4wW6PEaBTt8k/VQXXh9EBFdBEsxk7a1o/DqJBsPflYyIJ2d+UOuayeyQ2NEJFhHSM+Qe6jLzyInhu23KslxhhDgA0W+hnSJgNuTwljOcDyn1GiClRjEEU94nKidr8Rc6Jpu5gX3h/O2Avd6j8OM4qTshWhTuS8PO5K85cVkNjtv1xN+sKkwf5Mid8HEi0M7Ithfjgi6jI4pok1YLmja1qCn3Oy1uvB+Ik7alMp7pVcJs7dhKwBDSABB3D6nnLhxnei2y5EAAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:34 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:34 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 05/11] package_ipk.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 16:57:43 +0200
Message-ID: <20231015145749.69995-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c09137e-d3d3-421f-ed0a-08dbcd8f341c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d2hjEwSP28i5lVygu7WCHpJFSMCaa74mr9sGsq1ynlRHw8Es2If1Q52KROuk+oNtHNCbFtJzacgO7bVaDy4Ih0/8njTQZeObN6NWsK8xu8JepfPyaGIM8yFnlxrV1nHLbRXsoW8daLWtCom7qCZXd7glmeNrvr4twF4qnuMsRmC50WFl4I4oOdRElcCwtJXN5B7nfQxjVha15hqryjCrxSWpoFyyRB339ZnqanfStH+UkQ8Pp/ULWRZWJJCrKkPjbKxBqBVyoX7PfUKoq5GEuYx6DT1oIS1z6E63SFZtaYEO+L1I+DC97F0wdEsplRBkdewFviRyXWcz8XDx6XCbTjegtJv9uDPV4oB4Yy2Dw8upo+BtC75u45JqrPoDb3sBrh8txJt1oQWRMLxe7Q9caHA8LvQx7BqhPShf59S7R4J2ZXGdYVRZWuOreisoNdmSaUgHVW3TzojMyup2jMhP8yCpE2hZ4jYuBkKqkHCoYeTLs/E3ytBpNDED2+BhltOxEGFtcT4XJ3oxH+Fte7KcnIMdjp8ZA0DbsxYxerc5DtEeUzOcC/bnvHeEBejQISTvkqd7Su6hjjM20+zW7dqDkDFb3fbS26X1cxWtWWPHzG4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3uA6RAm0tw7JdzPFK338aUJ/pqLzYrWI+mymapwp3Pdvb1U0IYl14VlK71SD?=
 =?us-ascii?Q?SSnmtHvqY+ybuafHWmR4EX+MlgTAomtvC31vitPHMkHkkqqK80rBeAJ+V9fi?=
 =?us-ascii?Q?3gazhxViwGmTk2J921vxEKjH9/6wlNWcC/5vJI7mfbfE4O6NLCM6buQBCmK3?=
 =?us-ascii?Q?8zwXAoIBcxykKpExIW+WNs/SPecpFldA1hP4RN7iE5i5rP7i0Jk+Im6Kgp3k?=
 =?us-ascii?Q?/x8JUk3PCYYAWP+eraIVA0/j6f7CJ9GDlFcSP6WCe+hdRHH9Fi8JMkvL0/mq?=
 =?us-ascii?Q?dWLa5pKqagZGA+bsGrEDK0+1iQH8tScU0SePlce9DT5Fw79zg5PanNFunEIS?=
 =?us-ascii?Q?hHvIFCDsCkNRo6THHHmLw6UKRJxVc+HGs5uEqGRfF0HT9lwdzVkLFkATxVui?=
 =?us-ascii?Q?0oaNCWf3gbH3qQ/SAZWXlKy1cf1OnpZXwQ+56QVyY5FandRWr6ANWxhNM2ZP?=
 =?us-ascii?Q?1D9s8wLNn6zlIxYxFOpyB7I5Y0KommaciiQlpFUACc1UfgZtzhH/KEQF/zoO?=
 =?us-ascii?Q?EHr+3wuZfXKw0JrsocQug5sHDwW/Muf/je0+bLH4N4pD57bP9wmLI6ita2c4?=
 =?us-ascii?Q?DDK7pYBFeqPiEWxVF461xFbubN0x8eHYkF58wfMScB1hyXH91RJJNF6RRr7u?=
 =?us-ascii?Q?TleGaoyqKTKaE+hjOVgYeovsaOPdZ4WlKu19n390+hZ9gY51cujhBE3W5sWl?=
 =?us-ascii?Q?MnABplvm2ZnMQKvjJB3hv/4u1rSklvNnwdLQNipX55yrV5iim6ocWYFp0qEV?=
 =?us-ascii?Q?OFCen11sUg+VjZF20phOBwS0b9C7S3eWV0okJ89p1oC0ZiSLtG6RIkB+LIx3?=
 =?us-ascii?Q?klP9aQfYEZMXXea4IgkobLMOgkh5i45nQCmWJWjtZmy2IhW3MsM/9tMQfxL3?=
 =?us-ascii?Q?NLBn0siJ39To1TkINacZM8fuYO02tFI5cC+XD9QI/hafxAU0VQAzICiQQcZh?=
 =?us-ascii?Q?THneUA5/2Myy6AuoohGNTkXwpwwEbuRvoGwbJC9TQf/mWGNoCxxdzExUs+OD?=
 =?us-ascii?Q?XT0B9LLWMNycLZIDbtdrhl6jTZ9kiQaZq7QeUeSfLfT/mYDW9zCHVpxOEDTm?=
 =?us-ascii?Q?FZ23vP607aZpoNZrcai3luIHiRrBPzXtT7zjKlRDubef+qIUYn5J5wP5dmc4?=
 =?us-ascii?Q?4Wl5etMjWbtUUYdEbNKQy7RoGzDTQg1BQcaUrxqyKrZQnIrpDvW7WnWoZwnD?=
 =?us-ascii?Q?GOsEINZigkJOyiszDPKAnbjSD01DoTXkhQW18s4ysHl49Nbn/d0Zjn/vTjuN?=
 =?us-ascii?Q?z9pGK9lTn8EdBEJx4tiSp+ifRw0mMPE0uYCNItKV5lr+eiDiFjDurlYbx+XK?=
 =?us-ascii?Q?eBcsEDW7+8mFExNAA5Wo4tS0LcLnckCgq9rw8WcqnIbh85RnOTfymL6jqLIq?=
 =?us-ascii?Q?P3yPIiz83TesymdlJYC/IT5FYYjSmgywiVg7bxUEhqBZdD7fIq7+hUabVBmc?=
 =?us-ascii?Q?Sd+gVzb/R6c3FK8zDwkhQLgq5eO0xT4x2RcLWXXLl9mPuZ6dzujFdCrnrAHD?=
 =?us-ascii?Q?5bumTQ0rgmgjHBzioYtueWMV6qYB0QGReZIGzlLIBiOFT8e5d//UFEMOmrZm?=
 =?us-ascii?Q?sLGa8tPU7AyZEqjwvdwTF4u074ooA4An3ZU2GCfL?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c09137e-d3d3-421f-ed0a-08dbcd8f341c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:34.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPUuL4aw767H7DNr1e1eHSl+b7bl85poffVePlfwqa6J58l0MqTv72gYgumQDYYiZr2GnRQ7dpE+/mhfKRULBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189150

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.42.0



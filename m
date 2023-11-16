Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDE0C5AE4B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:55:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.5065.1700135707865706721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=auwtOUew;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYVV62WkhFkLgxSd1owGcb2Q2Kab0/s01i5Prt/8sKdnLoSnJMwVC/fsmhkTC1/R3erBVSytUAAFvPGOCEPTQ2XGTHFaC+jTU0OcNnd4Uw6vnn4T83IiONIG1MYvOafMQKiSQp8uxHDZ+pQBYgcbMupFVvAAa6cod8yd6VPOzowrZkfNuScg6GFDsm/KPBdsuIQN21QQcWLIH/U0WDoVyMEuHgjcIpCzrsNy1+RMzBpXUCg+RWyfK3NoBN2B9S3hYO+qXB3OFnnIWf80YCTlHGP4uemGxM3WbrS+IvslXEFtIWir8vX2hMMuNZoBfyV3kbQN4JbnfhRuNsZYVTRtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcwczFfgTTtjKGaco4xvsiH3NUvqt6basZ9k5+ULhcE=;
 b=YxgLg++GjIA48tHI2/Zy2/Qpd55E6zNlb6V2spiXKHsnAJwukqs7a/1hVIunL4NlpXXgsbfjDW5gepQsLGYc3eiJ9cVIIkop2OLzK/ZnRbWpTkzZWRYugZIzKJZOiqgzDXSIb3mKRyTnr0NPY0/ThzMRWDwT0E1vp04KRuS2RUZMyxU5bZbsXMHIidQeKzCREActSNaReD7wS8CTiq0jJqJtBAIQOOPs7ryMA/9wAWYh/StJdlRR+/aaD4buFZAOSvX7eu4cNsKGHRfdlznesbPHqdPANu9lP8cQ/hgY2E2ga6nIKZ9rUwwxr/PcDuazwiR3ZzGs6AY10aMVzgX8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcwczFfgTTtjKGaco4xvsiH3NUvqt6basZ9k5+ULhcE=;
 b=auwtOUewKLrUsxaj/Vjzv8WTAMBjJiZzBERCpf/e+s/jK05gdr6kGh2PdtLUE2JWpbzgHQAjlDbsYTXRkXtUe9XIJMl2jGGgn0i5SN6Gc6zUDqpabkIb9nK0yUmxxydy+/4nbqwgWJ6FnQ60gXHNQx0Lzl1Yqq3FMCVpTt+hMsM=
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
Subject: [meta-oe][PATCH v2 3/4] sysstat: use nonarch libdir for tmpfiles.d
Date: Thu, 16 Nov 2023 12:54:56 +0100
Message-ID: <20231116115457.1462082-4-lukas.funke-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f5200ae-649b-4c84-d049-08dbe69adf0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZYH5wyPlVMyMA63v9mGeDK1QHuGMScm2OoXavKlZD+pfwPQSlMKmhblN5oGVICrH0nYEjp1DKoyw7nKGL4BM9yQDnsrwtB8UcbjF79FzK3s/Y8+JGhsBSfVQg2J8ujSem777IA8+QkkApE5zm74HeZgbZb6tGVoRrDkYIfMMmPMqprzn42lP2om+E1dZBMSqkB4+huVe+WzgxddKbM4xFmuUahK2AkJ4E+8TaBfwtoU+UBOiXzKKIHkoy7OJW58hmgNqgM/lhU5cSzhN6YA7GAHmm5P+Cta//cPIgZaW/yUVU8nTPvUzgt5CZdiNSBM7+PDlMPcDEvZoc+00F8REZzy9DTR66jhs4BZw6A2V7UV/gngCjyNMiatKqIYcCusvxEkETbhwXiKgPd2OVU1pWV5kCmhJ3QsgdBwGfLtVG14Z3szJAPaUoPXb/VRvRM13/MkBD+4xmgOhloy8iyj5jnxhlrCjN4zPrMlxAnI1ebH1M9ZkVQ1cBv6baNY/+MANYV9RS0C3CaAGlHx5M+Wn3DpwsOWCHzgviLNiVGzKBKzCQWhiPt1jCh5oZPBdV9Sk7BtK7dkfrErRw7FM7dcnNnsFAMc6DN8eTZAuB/DJXxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(478600001)(6512007)(1076003)(9686003)(2616005)(6506007)(6486002)(107886003)(966005)(6666004)(26005)(316002)(54906003)(66946007)(41300700001)(4326008)(83380400001)(2906002)(5660300002)(66476007)(6916009)(8676002)(8936002)(38100700002)(36756003)(38350700005)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fM+CxSgpBDso3kiWeeaKeVXaC5rbDIdW705r0GB0c3sIDbiDNLyihVCcxtJX?=
 =?us-ascii?Q?79PudZbGlc4EpsQFbIPjL6GOrIQ+VOfPash28PoHgOx5ujmEE3UA+lySQwWn?=
 =?us-ascii?Q?0uc3RrCmcyDqrgVaBu8/3tIBa/5okvvKhIZE0cYKi4Q/JVACtFArMMyLDiUC?=
 =?us-ascii?Q?Phwqo3+LMjMxqK7aACxNo3i/tv8lLfmvk0rKEB34rnWWhvOnNXAFVG/5SP4d?=
 =?us-ascii?Q?vbl9QQe3u4nbb2jp2KaDUze/2Ag1OOoHljZmqd+9wvOs2YqHd9DCfBxX+T1c?=
 =?us-ascii?Q?VLA1tdqeSxW4g1oxkdHXgnhq5zxmoQoOwbtyx4acM2SIiHZmCpN3lmFgHDXQ?=
 =?us-ascii?Q?1+lLXRFSEioW4SF+IeYSJ04G6679VPJ8ODp/Ns//VMcuCh/FmpXh+Vp/F/rl?=
 =?us-ascii?Q?qexzydmPZoaRuyeoyv/3wSkwpZAfxWi2egK4PrWAPDKLtFXRYUDxgnMQa8cu?=
 =?us-ascii?Q?4gQv3+7l8aZKvk1x+WLE2dFI8ZlyvDfLZOgW40nk0YXmwpaHGndCeybz2IQa?=
 =?us-ascii?Q?INWlY1SC0Kps4bVEurfm04urzOkLCarq96f8N9TMNI1MHoC1Wz0vuB8gP44o?=
 =?us-ascii?Q?M8kIVILnnblVogv6mhi4tGq6nZaMazQhrIaew9YuP3jenCaEhtksMOZmWJz2?=
 =?us-ascii?Q?qTeNOGIhMXhra99ue884pNKLk0AP+uCfYA0pTRPUEuvtJOVgRGzWe2HISUmc?=
 =?us-ascii?Q?qEWUOWEG8vbMLK0OeH9zHPt2ONdfty5h43qJSi96GIxFQNibgbA1gPzcyHJX?=
 =?us-ascii?Q?ENFmnJuLqpP23o4Cf5lw0UTw5/jyH7mlb9uh4qLKb/2woZO5DrKu2+bn+FUg?=
 =?us-ascii?Q?9PMZ/Lsl2BPs4Og0Qtz3dgSlxk6J7NfCc/l+U4Spt/nV8Cswy+eM6j7PX1Gp?=
 =?us-ascii?Q?TmvnMjdbIJHJV3B5u0Lu9ORGr5077zDrn8Ezed/RaWvkbqILdy8u2CqBidkJ?=
 =?us-ascii?Q?PRLBH2vbcrJ/UR3GVXP90nJbWZrxd3RDqxA/cl7o+kIwEvaI0uho5AZFKekM?=
 =?us-ascii?Q?oVIDqeMoFSKAIvcWP++VUfc88pL3LIyHX4I3uyj/c6py3gTslKo6pXbR/19x?=
 =?us-ascii?Q?4+psgCu51F39DaRaAaBYCRBS1tr8+3bhG+RiN8hJuS2CcB/Bg67Ka2xqSiLM?=
 =?us-ascii?Q?W6Me4Grbb9JydtLTk5bBICkhPw7QA5qdpkQ/tKhDhHYpFxzGdNNopNd31S+d?=
 =?us-ascii?Q?6kN+DPLflT0vMNF3ZX+LEvlJFani/TiBrYrfTFM28ChzqkcvxBVmHP4abWiq?=
 =?us-ascii?Q?689QnASw4ZloywYpMKyiY5IZK8axMIWp2uP4ThgwYruCqncodqDV0yqEs6bJ?=
 =?us-ascii?Q?l8MkO9s0QlZoKLfT6uCQLgfYpYhM8jF9fLig4m0NKgHxDEsFgIq4fX0MPaz+?=
 =?us-ascii?Q?N6BtnlWcA3Ib9jbhOf/19nuDS0EzL3UdZ2qLp1tvLa9LQWNxkJdUjeX+mltE?=
 =?us-ascii?Q?ieqOsB0/XOh20t/H71PQmL2LnqKmpdg0EPHACNmrXf/DtIlUqI10WftjH2kq?=
 =?us-ascii?Q?6i0yQHo38WUmC0UDBU0PLc7XIxKcs16pI91Zs1tVbWe5GQklydEBQsfh70yN?=
 =?us-ascii?Q?GG4n8GBS0/0mwuJ1OppP9V9UIMCmJMODsJ6RkpjIwhzGMrh7IBfNNlT3r5R6?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5200ae-649b-4c84-d049-08dbe69adf0a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 11:55:04.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBAnKJH2slSljSWWE8b8XdLKjhJErPYUa2mwCV3CrUwWOqVmBKRfbMXZpoC9QRKOgSPSiJJZjGTOVUnLNZAc3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190788

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
 meta/recipes-extended/sysstat/sysstat_12.7.4.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb b/meta/recipes=
-extended/sysstat/sysstat_12.7.4.bb
index 134fd5cf96..660bc634a0 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
@@ -48,9 +48,9 @@ do_install() {
 		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
-	        install -d ${D}${sysconfdir}/tmpfiles.d
+	        install -d ${D}${nonarch_libdir}/tmpfiles.d
 	        echo "d ${localstatedir}/log/sa - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
+		     > ${D}${nonarch_libdir}/tmpfiles.d/sysstat.conf
=20
 		# Unless both cron and systemd are enabled, install our own
 		# systemd unit file. Otherwise the package will install one.
@@ -70,7 +70,11 @@ pkg_postinst:${PN} () {
 	fi
 }
=20
-FILES:${PN} +=3D "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd=
"
+FILES:${PN} +=3D " \
+	${systemd_system_unitdir} \
+	${nonarch_base_libdir}/systemd  \
+	${nonarch_libdir}/tmpfiles.d \
+"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
--=20
2.30.2



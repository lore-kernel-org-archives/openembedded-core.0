Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1057EC433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 18:50:43 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.84])
 by mx.groups.io with SMTP id smtpd.web12.34559.1636311042039993414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=q4lyO8OI;
 spf=pass (domain: nxp.com, ip: 40.107.4.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGtO+pAQ7ASaONbn4PHJpKCso5t7Zjq/RiX/5VRXfOZfUAX0MHqP7XsFmCWhGhB+tysLInSszcOAdkzLjLpn88LfNrlyAPUnZ6xITf/LImcJ1zESuPjA3+xPmukKPe+ASBWFN0QxQYkYg+kD13GXKBN7uXoRCxE9E60UfvCIe495AAl7uLQAuW0Cj3zr9X6Cvn6TrvCsWByBobUN8wCrbjZEt7Bufy7R6QdX0N9yRKpNUdTbfMcQg2pQYePbV3h0kuBiYFMsVfi+oDbFALoOg0Ou6IYiPy0cLXW9Z3eIpig9+AAoqFT6b4ArmXXMuNupHv45u3Fr3c0cLc2JFFUWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJmfLUgLRS8CHHZFkyaFlAMjI+FeO7mPgxCJpqidi8g=;
 b=eKejURFY1l+Au0g25SBFCZWy8fmaLzBEKGg3G0ZdhJkxPdj6I7bU1oWNbIrFgWhLmF7xUfS/FI3FF4MRpfU4maLtRpmfQiziLFgpfvyPLffE5uG6+iYH0xBuIRIYKA/RwHBNfykPI4edGZOYbw5iLRP8lc8ZlMLMyUSDGd3SncAijGp/+6ksOoSEJiA3Z55kJubXMBHwNTG29Em++E0QUA6qAf/SMoXd2GjWBLh3/g7BrC09LYvKnsmzJqQNhFQ5EN5SCB4IFaFwa+Nfee1Vyv6FOD6Mdky5NqYGHJy6TNJF91/qvDr1ea6hrlBbqEOhWIXvDYo0+CztXYOc8za/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJmfLUgLRS8CHHZFkyaFlAMjI+FeO7mPgxCJpqidi8g=;
 b=q4lyO8OI+UK6puNuTqp15A2zugDICCl00An0DtkPClbKaqTulkOO4ruuMfweVCmZTmtH3fpmiRhJ3VQoIhOmxIkaSwtFlrSnOf/PwllrCBDoY9eUtkBazhfvSdEw5RF95KQYnck8rKmyYAS34VvMwtbFJzD1zcwNmJGesMPNS3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sun, 7 Nov
 2021 18:50:39 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Sun, 7 Nov 2021
 18:50:39 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2 1/3] wayland: Fix wayland-tools packaging
Date: Sun,  7 Nov 2021 12:50:14 -0600
Message-ID: <20211107185016.28794-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 SJ0PR05CA0068.namprd05.prod.outlook.com (2603:10b6:a03:332::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Sun, 7 Nov 2021 18:50:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ac3bc7c-4648-4464-ad4a-08d9a21f7dd5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6890:
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB6890481CD40DB21739BE34FFE2909@DB8PR04MB6890.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cuISY1KMXfbcVjdAph94ips6C3zr54yxsLRvKX3aoU3gx2SL0jRJNyMIcLeigPJmBTvZEwUVDQFOLK/2istQxb0DVK1ZLx604KeoBBf0kQ95MVWLII5W36Cg3r9tAv5LHH0ZMkBrrjYsUdrLSHfmeT2k56qcdJLR3hkRHu9mf9BE6IBWnI7tf0EEtvHJeDXn4kF4xhj1PsP5uBsOvJCtA+E+ublz53a1HESMlyIl//gJ0/I2iWEoLa8FuCF0cPOilypvtAm2EUJ4UB2QFzU+e7czTX9B2z/uCZoSSVT5lTuBstpbNqdeRxqNFabPzSW6kh9eBgijJWNAsYAVHNbtHLrV287WHti/kywzwQmDNkRHd/40P+YKndieV/s0yMqLqalQRFqywy+yI2xKxHxXWc3DUT7yDVKSUgqYGTd9MadHTjsgzwf4Q0h8+6R9sTaWirByvNYIUF95kRz45ujTtJhRjhhnCNm6eVd1D9lv3hmK4/xnks4WXC8r08DH81FqUcMmD5cVAOuH75Szqe8aEV2Ud5qH1E6f/mbeGHIGMTYL7xmPtvLOBxiL0U46oT9oQ47+kr0Pkrd99a3aJluL2PomlZQ/COmvUl0O607+ZuuW4J3TTeLjZdWK7BlmHn/B97goA1inuIjpzvwp7XwcEFgwxBtlZC0oXN8TBkEJhfGzCbp8aXRwiM8CRAk8/CrRZoFV/AorXbKqKL3LPUoYhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6486002)(6916009)(52116002)(38100700002)(38350700002)(26005)(6666004)(186003)(66946007)(66556008)(66476007)(36756003)(44832011)(83380400001)(86362001)(8936002)(956004)(1076003)(8676002)(508600001)(2616005)(2906002)(316002)(7696005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kRNa/dQWvdc6hcfYhHaWhvTGSmhzu0TAGaKEjenSOHEAPzvDboi7AM+82peu?=
 =?us-ascii?Q?oSVksYPkuxmh6jdhgURnwnbDjeUcgRzEo6eh/yVhqCFNda3wp6+CdZxpeh9Q?=
 =?us-ascii?Q?IXZjV39SpEJ/OkKX/uh3Dz4/utB/mMSOZz3Pk/KRNuJEA8kpNkjstK2he1XZ?=
 =?us-ascii?Q?a5WjVeHfdyybr4IBYJ3UzII7EJDyR8pVXgrprMxjYLDkoRazjUwp+jCEm1rS?=
 =?us-ascii?Q?skCSus1TIVziL3wTfOeW8NL5++ozT61MQqP5CGTjOwWGLGUU4RxZ0yyepHUZ?=
 =?us-ascii?Q?i/LzmGEv0bpTAFLONxb86Aa9/EsikqEThhk3oYH+m9S2r2TgFfNaml5pskSY?=
 =?us-ascii?Q?bsnkN/9o0YjPM9Cuzh1YYxTwWickrCviGMVdHNK1d+3kIAgGgYIT0i1iLZhs?=
 =?us-ascii?Q?Xxk+vxesV485wZ0lycTKeagdgNtvB/3Aacyc1d4gsaL2zk2D86bNIOj0DHBI?=
 =?us-ascii?Q?N9aDNSEWLP0cvaZk+HtEZGoAyx74lptHb701RhnEcxx4oyqgy1pfsjAA4L1U?=
 =?us-ascii?Q?OHsPW/SQ2gy9CMvNFa6JrpnSRegxsJdAXm+cuXIgBN49zp37gkpkWOaOWzNk?=
 =?us-ascii?Q?M59mNIg7cFwh9fB5pKlxbm/OlHVBK4cQduHRtSzGFjipZWwqWFtYJFAfbBVT?=
 =?us-ascii?Q?nrYYR8hbBr4/bTijowvDZ4pqPglRFQEaH2Svtn21693UAkkEMmLS5UREuRNA?=
 =?us-ascii?Q?ZeVgyn5Hw2wHYyXoHPRCYXnEQCT7E0s+gk378rQaIsbBsrNv6pFGivJJ0d2F?=
 =?us-ascii?Q?WErnOJaAgDVxhO2fJIfh23wsQF4u5Y8LpPuHuQVA3XeKHn3RbQIdqUgBOCOf?=
 =?us-ascii?Q?3ouQCqsQbKsgWw2eVcgjwkPKXLpEmfJ8W/0mOpT1XWzwHvQPnT0utheoLYbn?=
 =?us-ascii?Q?DI85PqnRTH3YpkDefmIuyc71v3i9CWCr4eR9xEXqTnPIoQFJWFcCMUiNEEfW?=
 =?us-ascii?Q?05fje0a/L3Gp0gt9ijtW+KVx2QIVIb8zCrtH77Sq64/Y0RAYGZgj2bNZlZfQ?=
 =?us-ascii?Q?2Vg6EOs2eXY9fEHF1p1XXRtVyFk+b7Xnnqec9zomtBfLP+MJrbQolVG8G7KX?=
 =?us-ascii?Q?ykjVqbyTYPaknKdhnQRtDuFgE78eAjp3Vb812rRgZihvcUa5+4ZrRIxvRqHl?=
 =?us-ascii?Q?vhB5rryIXtMCeV5FqJrFG/ppbFB0CfGoCeIpCcL+Cq+tNRNeKa6UA1kFdQI0?=
 =?us-ascii?Q?r1yc3w9WuVT81kt119UtIuWXfexlcToEx/ZjWT8mV5twyF3Z55/YYQUz5zqh?=
 =?us-ascii?Q?iuwAaIeDR4zEyYXgSHLV/uEHTZwDNMwjvVeFCb67yrvkGOO9Z7sqr1tCdKjV?=
 =?us-ascii?Q?p1Y72cAfeYp6X4y5FhE6n6xktg/b65sG+Z3+cCSulDd5SlkL3iszJYXmGDUv?=
 =?us-ascii?Q?jyOdsb6qk0lY/EiEL8LzUbVAXolxUK7onhPNEL86Ay4YnZn7Bdmy6bDBl60S?=
 =?us-ascii?Q?/ObjtvoR4d04/38qmZQ7O1RHGrtUoBdB3lkeAxx0GsD5yLcqbgIo/d0szzxc?=
 =?us-ascii?Q?nBQ4aCoD3GT5kdblIlp6YU2rJOdHJlV9K8AcHtJMer37287rxDeJ1fDWBNG4?=
 =?us-ascii?Q?OjPRltvtGzCCs3dpq7C9hBpOkgcQHNJJfenK2KOSA4ck+5H/7iIUzOimu1Zu?=
 =?us-ascii?Q?lPzp3ObDnE1WIiYlVH8M7ic=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ac3bc7c-4648-4464-ad4a-08d9a21f7dd5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 18:50:39.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VSey6zHRzfnl6Z9z6PHM+jfOvsibtXLu1+57r6xbK8U4Zec76cwe95skJsBGBsrVKZJinrGo04fEfQtuXph3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 18:50:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157958

There are some packaging problems due to the wayland-tools packaging
implementation. The wayland-tools package currently looks like this:

wayland-tools
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=9C=E2=94=80=E2=94=80 bin
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 wayland-scanner
    =E2=94=94=E2=94=80=E2=94=80 share
        =E2=94=94=E2=94=80=E2=94=80 wayland
            =E2=94=9C=E2=94=80=E2=94=80 wayland.dtd
            =E2=94=9C=E2=94=80=E2=94=80 wayland-scanner.mk
            =E2=94=94=E2=94=80=E2=94=80 wayland.xml

The files wayland.dtd and wayland.xml belong in the main package,
while wayland-scanner.mk belongs in wayland-dev.

Fix the wayland.dtd and wayland.xml packaging by prepending the
wayland-tools package and dropping the main package FILES variable
override. The file wayland-scanner.mk is included in the main
package by default, and so must be explicitly added to wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/wayland_1.19.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes=
-graphics/wayland/wayland_1.19.0.bb
index d6e468497d..5f8b972f76 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -52,10 +52,10 @@ sysroot_stage_all:append:class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR=
}/${datadir}/aclocal/
 }
=20
-PACKAGES +=3D "${PN}-tools"
+PACKAGES =3D+ "${PN}-tools"
=20
-FILES:${PN} =3D "${libdir}/*${SOLIBS}"
-FILES:${PN}-tools +=3D "${bindir} ${datadir}/wayland"
+FILES:${PN}-tools =3D "${bindir}/wayland-scanner"
+FILES:${PN}-dev +=3D "${datadir}/${BPN}/wayland-scanner.mk"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.17.1



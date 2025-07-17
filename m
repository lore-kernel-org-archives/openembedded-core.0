Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD335C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 11:44:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.web10.46549.1752752676064493349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 04:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aXAKsPQh;
 spf=pass (domain: est.tech, ip: 52.101.69.22, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4VAy+rF+rHbIUytc5D8/EkhH1TYj2VyWw7ujXdNy0JFRvqtn7bnv3YqVRJmNMb3BXH1Vm+/d4wLRKqfXYXFXdIEcgg7NAtTwoYCJLTVSEZQhgY2mGiBzddyiKHi4ML/P8Q2wDo8UiSO8rqRaUStzJmF2DY+c2jwjxz7DVUQey9ZGF+K5amT0gJEj19u9sSEDk77Hnp3Rck0mqLOZgBSb7jlcjcVIV758ct3wfw0Ou3atXDB0p1P8sVk74Ml+bfWzhIfnIURcfQpy3wmGVqzBaM0urq3Fke7fkABbX7Y5t9XfH5ZW43tWbFsfvAJrivc9dgGLhPpxCevOG4laPb8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/XcY+ZXy+cbsaqvO+TXTYLWcd7XGqCXCjMlwj0cLTw=;
 b=aFvTH8M3wHV+DnBMfXd5D1DMS1EJZcu9/qSOUzk1ZCdoQa4LPz6Qcg228Kt1jGd+aompXgcEFPrqtgrXiPnJbDaB7MuXBAquuqc3MzcTePp6BHa8RJqAD+rhP1YFqAUuBHBtOw/gAZYXAJVOsNhy60wICMcjhEwib3DjyBYIXlJRyJCuPHoMC2JH4HMJb3EBagpcDUyfGdz6FfOmiXnZ8cXK/fRayCkfLU9LcLr0sRm+2gzMVLAMZ5grdxA5KXwwvDqnzF+k/gACd5580W41DE8DKXu7TB1NpvRXXs49/4oHqXhOrNAtjzI3arvUxVobHl/T6Jy/raNZ2V4Zr/QfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/XcY+ZXy+cbsaqvO+TXTYLWcd7XGqCXCjMlwj0cLTw=;
 b=aXAKsPQhCcHL3Na72wftbdbP3o8wKZuU3F/GTFInupCwhOgfUwKbSzF5GiD1XGbNoi8OXllH9WHAWTlww1yU/FvkBfZD5Sme8HuBIFM9vt1QIqGl3OYGlw2yHwHl0Z/WqzADMMCnshHChrOuL9CQ14quQiIQW2GahtupqzG6sHDTeoY9/jSAc4JQaCk2fLUoa4T1BFEe65UHB83D5m9bHhWYXH8r/5PXHmznVd9TamyJnT7yERCWOjLw6hhWzRJz2ulq0bd2u38y+szdywRoZjIbx77TcMuSRNADpH1BN2IHRPuX04B+wuXuThIIinVdkiZyJM9EFakqPAn/j4yvfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS8P189MB2093.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:521::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 11:44:34 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 11:44:34 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH v2 1/1] libxml2: fix CVE-2025-49795
Date: Thu, 17 Jul 2025 13:44:13 +0200
Message-ID: <20250717114412.13075-3-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717114412.13075-2-roland.kovacs@est.tech>
References: <20250717114412.13075-2-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0026.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::31) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AS8P189MB2093:EE_
X-MS-Office365-Filtering-Correlation-Id: 4492079c-7fff-44b7-2eae-08ddc5274d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JrIyqdQroSSuTPrj5OKdz/pUOkao+Cb5jZP6iuS3+349RgHr4SE0ztg3sMaY?=
 =?us-ascii?Q?OynSjsdawxe8IyI6t+cnT5+YeyOElYtaRbnU+tb0qPft0PgfMEd5WzuFiKyp?=
 =?us-ascii?Q?DSPw+iyAhHBf34oW1T6776DcIBUk/kAqkjnTKuDLkUSBMWE4HAPjPFkjhlPi?=
 =?us-ascii?Q?XKYxXaKScHtujrKtlWy8qbLswj7M6Xsb0BU7HiSwWXYufSmBm0+f/brzlqBF?=
 =?us-ascii?Q?XFIvA3emwZlStR+rjqcAFSeyM8rxPYPapNhbwlvZzSPLwpA9BP86NZhcskBd?=
 =?us-ascii?Q?pM+twkHkprg9xaM02SQiipZJEs3W5P28BbIMz9wZJcPz4nf7OBWWJSSdo+3b?=
 =?us-ascii?Q?aILqXA6kdUrBJn4pFMx+tMhIaLOUXz5zka3SuY0O3wICmBU/SwQl3Hhp5zkt?=
 =?us-ascii?Q?jA5HBkw9HTLgX4zczHLqlCLlu2tPMoWhUgjIIeTsmQ8p0nZZwe/wXPiTfY/8?=
 =?us-ascii?Q?jcyTbkfWK4K9eFRQs1TSjhqJvpajb2cdquDCwdcixioa6Su1YM5AzGnOBmwW?=
 =?us-ascii?Q?J/RHEWVgPqaSicC9j+9XC5d0JAW6InLveMfBonMEUhHMnG5jkY+5P1sYAPOd?=
 =?us-ascii?Q?CjMDKSzDkPzEZqXop6VzeQ4jU7tOzZT1WESkjieKFXWwhum/S5r/LTED/rDM?=
 =?us-ascii?Q?c9sQV9QuU93MaUmtrEDP+RsZwjxoGT8rXOD4UR3YCQGsszDx1Hh2leLZK7YE?=
 =?us-ascii?Q?3LfJzzEI48Er+cQ/TSIx235fUTpLDtm6FiXV5mbGVWwOQM9xR3+UIi+Qg43W?=
 =?us-ascii?Q?+iyKc96GMfO0C5Nrg7QSbggUI9VhqXahp8SXe0JdtGD6bUYD1lfwdvs8TKdl?=
 =?us-ascii?Q?g6DKjKTkpqkgBYz1KWM9POdH974/or3/nO0A6OWFC9A6Dufy1mEQHF16t+Tg?=
 =?us-ascii?Q?syWDQPiBIbk0Ac/SxiCNrCKbBjNCA7upggv5K0JyuiT4xBUKbUbEsNUv1bfG?=
 =?us-ascii?Q?HJ2p5Blf+bXjG6TxN1QmJNVxqs4m74Xz5R1C1BTDeCfd+ZqN2Fl6fRJAI8Z9?=
 =?us-ascii?Q?U3+e3tYkm35Ddl0gDPnFSHumISWr3GMMNruSptPXHwPSsNbC7+i/+UhkTvNb?=
 =?us-ascii?Q?sJUPdB7sHqivJlrSK/S0xf9MXjf5334vl9siAwsk7zXWFhTSVNrLl83KWJUw?=
 =?us-ascii?Q?yNrWALSR0eZ7wuLAmBGJlsP2gWFJtxhW38iWOi+atMXLTaTuouBf5BE/OXX1?=
 =?us-ascii?Q?U3Vcm3+QsGfNiPpwfgLAGJDEzPvWO2u8The45T543uS2ztfRynct2kRmnrch?=
 =?us-ascii?Q?fvQYeDT/J56QxAD4eCR1Wk4peAKTkQKbkYQkGLyJC7O/2RNFfWz6F7GYMipl?=
 =?us-ascii?Q?7WCGOO6gKj1fzxe3T58RhwBXXRFe/VOow+LV9IIoby1QVIvpWxX9w2sL/AFj?=
 =?us-ascii?Q?vBHyHaY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hKQqELIcicadeCVCIm0eKl2KsSYkOS8bvjlJDNnnfWYNn+njpvKBLGk2++IN?=
 =?us-ascii?Q?cLkX0wi0GSnV/sbbzxx4gzX4lEi35hqH/VIKnrXKwRrzQhgEKMv3wDHLH3z4?=
 =?us-ascii?Q?5LSP6sb9irIT8aEATO1ph+/xnDBz40Rt6f8vqkkGUp22k4DLGg3s4FDesvLr?=
 =?us-ascii?Q?K0GQ9a5K43YUHtyl9yCFWX8IZuwpYlRhFfBA5V57RsOV9VCBbKoWwyxFQYts?=
 =?us-ascii?Q?m1qBiT3uodh9HRbu1TxZ3HnuCxmEP8Mnm/EbHBS3a+6EDIcaQrf+QIgz9L0D?=
 =?us-ascii?Q?mxG9/n3DGWGFIBHHSqt3x4IeiwyYLo+GZ8qNy00Gkon+g/Urk+r2fOsun3iI?=
 =?us-ascii?Q?otiLpdBtCQkkPZafA98RePSt05Ry7LzP93C9C8ByovZ4RpqIUIf0zL7YRopL?=
 =?us-ascii?Q?9dXjjRctSj3q/aqSXnAl9+2dQHIDjKSuxMTH7dgcrkcOHZkR2YiqEjoK8Dmo?=
 =?us-ascii?Q?ac+ogjj5vOWBw85PFYDDvuIhM2H2+i7p/nwkeQHirCTHczevgdy6/SkvuPn4?=
 =?us-ascii?Q?DMSLqwqwGnzJnvM028kNEk6zGFtPqo/mY6Pcddk3e5e3W9sIUy6fPaIGrurv?=
 =?us-ascii?Q?w5azyTregFqwfDFHPhBH9DHPV9AN9NbaXU7tHgOoUkiEbGdcsro3bc83kk62?=
 =?us-ascii?Q?O+atsZeuHyxIhKy1KyyYOCZWS3st9I2Nyi145LkyR7NVii3podiuwZzgwD56?=
 =?us-ascii?Q?mw2OUavtyRrZSQNlbOWUxyg0ErQJRpOfWegMJ2tt3v3p43pHrNkUcQNZ5nU/?=
 =?us-ascii?Q?OlCIRROjkYyETI1p1xI7h4eRzZbPIAWFCLvE7X9wNsI9DR+NGltzuGHHH+9o?=
 =?us-ascii?Q?lJtM4ETxK7um63h4MExbY8MMh3sYZsAAkGqeckCkweZAcBZ7b5G/j8oxrDNP?=
 =?us-ascii?Q?LIPcs68eH/aUQP9m/Sk/mQVk20NV9OaoZtLSgzYtiSdgMOYGO3X4vW9GPv4p?=
 =?us-ascii?Q?sHsAeoNFxovy3h281jEdzt7HYqTkJlfeFZ//kABlxiVcpcAxiTN4BIeS9OEr?=
 =?us-ascii?Q?oOs5F4ZP5XVpKGNhHZJInuQeGTEzfYRBHJXY/1LPM7Kw04cusoAAHoNUiNrp?=
 =?us-ascii?Q?wXV2sfdkBLz7+buUUQPIW3mqeH0HTpE45v3qOCxDfuUt/SiuA0S+AdKPKlLc?=
 =?us-ascii?Q?lcWwl87uujqXV3/PkyjURVN+PyXCaMY85t5vpVH9iLpFlOc3hcFHx7Wn+hpG?=
 =?us-ascii?Q?bWxgkWYD/RFzAUpVlRJ5b1uLKLyGUU+hKazTBH5jAODJ7YTcsobfdGdTGeKb?=
 =?us-ascii?Q?IfqDc0EtrD0pXakeso095GFdLHWD0XDpx3LFRoqc0M/eaMSeQBJ2j1L9OHSJ?=
 =?us-ascii?Q?iTzT6TT2wXaJ4BL7tf8jLzh5LSRHKLxWtsvmUKEWZey3YnUafgdqVlD3Vvl/?=
 =?us-ascii?Q?fg+k77IKsAofIoyEu/XgO1Mrx0boEI5jxmVl9D6mhNEj6mLgLQNNuzm3yo9u?=
 =?us-ascii?Q?+h36W6B6rCMIO3+tPGxDjIC4lEXEaC9x3+FvGn47QV0hxMZe5rnMTEaBlDgV?=
 =?us-ascii?Q?3vA1Q7HI476TwfNVX4N6ub8nLqYObPdaIRX7/gn7n+xcXG0F5LFNvh8OkgEr?=
 =?us-ascii?Q?6AP4KSzelbAZRY/WKb1uPpNx/WCiiFzliCqAxkrv?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4492079c-7fff-44b7-2eae-08ddc5274d0c
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 11:44:34.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Gznii/hoOfnlMahD70LJrfnPYYnaIGzNBAUyO4M7CMAlKIYkouVR/CX2LGT2onW+39HmE3lZWp8PT76Ui+K1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220534

From: Roland Kovacs <roland.kovacs@est.tech>

A NULL pointer dereference vulnerability was found in libxml2 when processi=
ng
XPath XML expressions. This flaw allows an attacker to craft a malicious XM=
L
input to libxml2, leading to a denial of service.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../libxml/libxml2/CVE-2025-49795.patch       | 92 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta/r=
ecipes-core/libxml/libxml2/CVE-2025-49795.patch
new file mode 100644
index 0000000000..2e21a99b45
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
@@ -0,0 +1,92 @@
+From 19e0a3ed092085a4d6689397d4f08cf5d86267af Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
+
+(CVE-2025-49795)
+
+Fixes #932
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit=
/c24909ba2601848825b49a60f988222da3019667]
+CVE: CVE-2025-49795
+
+(cherry picked from commit c24909ba2601848825b49a60f988222da3019667)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ result/schematron/zvon16_0     | 6 ++++++
+ result/schematron/zvon16_0.err | 5 +++++
+ schematron.c                   | 5 +++++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 5 files changed, 28 insertions(+)
+ create mode 100644 result/schematron/zvon16_0
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0 b/result/schematron/zvon16_0
+new file mode 100644
+index 00000000..768cf6f5
+--- /dev/null
++++ b/result/schematron/zvon16_0
+@@ -0,0 +1,6 @@
++<?xml version=3D"1.0"?>
++<library>
++	<book title=3D"Test Book" id=3D"bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.e=
rr
+new file mode 100644
+index 00000000..a4fab4c8
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1,5 @@
++Pattern: TestPattern
++xmlXPathCompOpEval: function falae not found
++XPath error : Unregistered function
++/library/book line 2: Book=20
++./test/schematron/zvon16_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index a8259201..86c63e64 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1481,6 +1481,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr=
 ctxt,
+             select =3D xmlGetNoNsProp(child, BAD_CAST "select");
+             comp =3D xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval =3D xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval =3D=3D NULL) {
++                xmlXPathFreeCompExpr(comp);
++                xmlFree(select);
++                return ret;
++            }
+=20
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 00000000..f03848aa
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch=3D"http://purl.oclc.org/dsdl/schematron">
++	<sch:pattern id=3D"TestPattern">
++		<sch:rule context=3D"book">
++			<sch:report test=3D"not(@available)">Book <sch:value-of select=3D"fala=
e()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 00000000..551e2d65
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title=3D"Test Book" id=3D"bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-cor=
e/libxml/libxml2_2.12.10.bb
index 1ecac70b4c..144ba07025 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -21,6 +21,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.ta=
r;subdir=3D${BP};name=3Dtestt
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
            file://CVE-2025-6021.patch \
+           file://CVE-2025-49795.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "c3d8c0c34aa39098f66576fe51969db12a5100b956=
233dc56506f7a8679be995"
--=20
2.34.1



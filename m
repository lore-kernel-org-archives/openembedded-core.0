Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BDBCE7AED
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.109])
 by mx.groups.io with SMTP id smtpd.web11.30524.1725613361254842639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IBdQwbt0;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxXvmRWVGB8DriK0ZZL3mBpOEYJxuPhE/HPVW5wqVDyTJW4yWeq6ZEPOUPUMMSjHqnFqSN260/GVz7WyuAZ3KTbgZh5BGho8YK0I5njzHFK09hNiNu0ckODJOy/tX3f/t7LRF3U87ngttejvQ7rRKFEhNnrhPHu98WrUIFo4xJm+gN3/3/TyIftW5T8FwTZbCGVTbLcsZvEx0R0u+6/wHK0ZFzBTGfJctZuO23Mh+FIbaC2RrtqEOkd/ldt4dNGMnSemmC5QCnTAl7FShO14tqzD6MAsVlRz42fPgNcOeVEBXdncvVntQpjmkLigpOsaDnM3C4TNqnNUbP+Bl+5Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F56PwLLDLgF+1y277Uh25hXunEucd52EUWwzZYu79b0=;
 b=QGpcfLH9lwxLScRqRYCEC0t94W82rC7EVOZT1lp87U9riUBeVk+Ngl3Oi2o3mGQfFh2KKk6Cti74QNPEHdjz47s/fcMWWuP7whkP5+54EV1IxLH6gSUj034ps0/BimnSoRUYfOK+AWGqjWbHng1P2tUwod/VqeLVtI8/pRT7RL73NwiPJINjeuvbGwADB53u6M0Quf/KAzoAGd07XxVYEWThrKzInpWpR45QNUs6mCCmuX6htKd6KF4D7bgfcDXso7zTIzmutYYmqHr0eCXT2j53M3ECFhg5Vb1NFA5GzKpWKBqmp+D8618pMlHOFVz/lMjIJvYMeOKQsLxMS79k3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F56PwLLDLgF+1y277Uh25hXunEucd52EUWwzZYu79b0=;
 b=IBdQwbt0PmkzFWJLT/mZybkGUrRKdaul+fyqSPUZgiaP7AuP6K3K+piR943RIegkZXHK7ZN/sMcONI6SWloFTrAOGaHLTjTg0iNWvN++FSCTRTaKsx9mRFHLjp4UQ3OnNT+akckLHxm9eiHYwN3CxtJ6a9pCOnPJPRkRFq1v1HIJEfP7jTOJwWryaQR2cp2psY+Gw3zxxIDpVUMpebpvfLB2h9FZHK5uNUajYuW/O4V9LaK7JGwmZGFBqgKpdURXZJOFIcuiw0NLMKWc0z+YkxyT1kWAajF/JDL6Xc/wL2Me8Xx2DrIBsZY1w+Oy00DZleWcp2ZwAwKb2/e070uZug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7072.eurprd06.prod.outlook.com (2603:10a6:800:1ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 09:02:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/7] dejagnu: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:46 +0000
Message-ID: <20240906090151.513160-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c6013d-4453-45f6-1cca-08dcce52a792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q8HIVLFrAxySObv776NBEhjQmJ9dATcTDS4yHhOUiO8ki03l0AjF9aZ7mST2?=
 =?us-ascii?Q?fMFlNf1fVyKKjnPGrb4VFk/i+Q6Zlkf18teNQ706jtQk71hs0pNZ/yDaV0Ny?=
 =?us-ascii?Q?4eXAbGY3GILdttcsoqgvIEMaLbMhPKs3k7Vjl7G5KApWqIlEiaQ7Rxo5888z?=
 =?us-ascii?Q?ViJWxnDWPD5gs4FQHnxlkxw98j9/THkTXsb6RdePBvApK0+yalc38RgnlbrE?=
 =?us-ascii?Q?DjNZKVUpDyvbnMKkNSxq2NH+vX4w34vGZQEJnqJOLopK/TUu5Erez4irCugd?=
 =?us-ascii?Q?9V/m0Mir2DF7zAkG7Erwd7L94lOjsXPQ7bUyieCudPYc5Rbu2k4hOzRTmY9w?=
 =?us-ascii?Q?LHd3m4Xst2kd/arOeKNCZWg7iQ8rWeORn6922aJyevUGbt7LfZPsMFrIb8o8?=
 =?us-ascii?Q?T0KEh28hez3ReC+lA9OzdWsr+r3JeKFUGPcVnrxyCdBn0chUi7B3prxZOnaC?=
 =?us-ascii?Q?MX9kS0lX57VoQ0aJ19pBAZ86s80N0nw/0xFe7aeih6F0VmeJZ87DVT4hAQVL?=
 =?us-ascii?Q?fzgsKv5fbb7oCEeSb+ymjYu0p93E1Aw3c5/HfU0qqQ/PA3EXyeC2ByzNpa4V?=
 =?us-ascii?Q?310/BhJizobvmHh2wqw9cLSD5KUPJ8HTUCFISFJ+Av9ACpkmUgpcI2PMAn5z?=
 =?us-ascii?Q?gRFf9pfi9udM6Y95AkGq7v6Jub0fUK9GDZOKuFRwSMyEyEfTckXD3zgFdvD1?=
 =?us-ascii?Q?uPJxPOyUldOE534XW1Vvc7us99GEu43Ao7krfxKmTkB+kioIdt8nlxQQSyBG?=
 =?us-ascii?Q?12KMv1WT1W7cPq2Tdey/RQbufhRzUURuE1Fha2wzaEk1nQJWj/Y7ZRI6grsU?=
 =?us-ascii?Q?/+ppkcoEmgjP5kLQlceEYFedzAA1JQy/ZoNeuVgHHNcszdYf0nZ8yw9U9+xs?=
 =?us-ascii?Q?H/dXxMSBdGlkUipAABlukVWk8S3SFeD+AOudeRd7yWE5UtB4FTiqMNGPstxU?=
 =?us-ascii?Q?MfelqqBFF1tRGCT4PWe6R1cPDMvGd/IHKjH2abyzCf4+pMZSQJ4a6Voc0yby?=
 =?us-ascii?Q?tRwqfyee8ThdGZCjx+jba79YEp2L3yWQU7TDNPlulQAamZPN17+x+LMTmQya?=
 =?us-ascii?Q?BSZww6dzj4nqwZKtLZJnXAmVt/WqQqQCtfEHPOvi92juBk1s7tibuGGfI7FJ?=
 =?us-ascii?Q?SCAAyCIZflw3HNsQ90OTDFoOOo0f2w/Uwvuy7Y33VHM5j434Rfcn2Bd9bl83?=
 =?us-ascii?Q?PlpINagTKO49vrIMxhMGv2tyxtxiIGKo8dcwSVf4AegvSrDLY099MsuG7zQ+?=
 =?us-ascii?Q?6b6m/wOHC/ahDPXAZN4P8hgZAWJEu3I+v1bgT5Pl78uXOjTgB5ZdGfd+2Cqv?=
 =?us-ascii?Q?hITHR4mU1wbaIKPY9EqLyHayZoGAEpPr97v1nzmNZYQRD1iizKcp+3PTMR+X?=
 =?us-ascii?Q?crXmBqHwJdmXJJwtaGFI0ESW/oGxFpWkSQgycMna2fRBjvpS6Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aR5/nGPfXNrTLCjGrrbDzmGkQUoI2EQYCO3UGKn90nmpcOWZtBMwK91zlLmd?=
 =?us-ascii?Q?+Ymtq9d8ceDyIDF1Wvqzh8sX8vKhfhKzkh2s79jgMWJ8vfncAKmRXUCvwjGj?=
 =?us-ascii?Q?KhYfcSNlISw/6WgsJroaMohThJrTDTIn0LurlKxywZ6425/vYPlv4OfFGb45?=
 =?us-ascii?Q?b3qmcO2Ux56y/oR3KMMRs1PqLPlFYoXl16ALXG2GNcnNPwAw2y0WhpKBEtT5?=
 =?us-ascii?Q?SPrdwDwnnUgbyfbHF5PmC2JS/qN1tQzOMA9HM1D4yPPpCbGxcH1n5D8mNsfF?=
 =?us-ascii?Q?q5G8zu4tJaayYZFnWhWfGaUg5I1FS/elSwOLqYx4tO8lWS3JgtMBYX2MhM4x?=
 =?us-ascii?Q?i5RiljUW4EVib485rxU7EvsXXV+9NGwGSA6QP4uJ+6IoPBscbzdF9sUEFQag?=
 =?us-ascii?Q?6ZJRNR83UABuznPzdWOJszJSfsNSn/ji3OJvZIPJ4E09PSG+OgBEqK5tgKdU?=
 =?us-ascii?Q?/7xpv1JDJD44SD+Vb3SVf20Z4xvZK5ODaYcdVhxP9BGNpp0bjNkM8h9jumOe?=
 =?us-ascii?Q?rdbMZqNid+BPF3NbAhv+k5XSzrb6mzR6YaX6AmUWVKQYX+K+Czov1hJZldN/?=
 =?us-ascii?Q?4AhVIQGbuuVXgu5UNIHGPHS+aBPjqsWWFUv5y/xrcCGvXM8qGnzARRv3z9tq?=
 =?us-ascii?Q?dD0lH0tYMQ4pvEHBlpt1TQkSMgj9U9AKTOWQn5WlF/n7gtX2uUqhHdbve0Iz?=
 =?us-ascii?Q?A6Rs4FDouLyb/T2n1XWsyLxEXBUixMJm88b6PO8sgNQlas83MrL01qXY0z3l?=
 =?us-ascii?Q?qOUPCSfJbEhq2GVsmEHch7wv2IbxgqaE0b3S5vr9q2hKvH0UE+DaQ2Qo1GBe?=
 =?us-ascii?Q?/Bi80jJ3LOftjZYFA1Sad/5xm4f+ozTm7mqQsJIqwAdvObRh3iEBX2oTWYh7?=
 =?us-ascii?Q?DkWaJdLUpQKqe5pcFowPs2/wXf0UHNz80mXUjheGRDlPAb9cTp8w2Ge4lf+B?=
 =?us-ascii?Q?BIjIdiJAvLKKriL523ox/tPaK1zuEhbzTZqQG/fRVVYEtkowqtTNVwTI/u/J?=
 =?us-ascii?Q?m/3PLhmnkuKWx58TaIvVAaGVDx1NbHK7M54pLGdwTRSniUjCsv3Sdctr5Orq?=
 =?us-ascii?Q?ma3M2GVqLtCO+Uts9yyej599ZyWAUisbxZ3JtrmGYVNgI5B/7+OEVclgVBeF?=
 =?us-ascii?Q?kTjYvyK9Jka3XAoOF0GeMyYXcKMWlBuLNEvy9IPswR4OJ4MEN0sAWQtueAMp?=
 =?us-ascii?Q?1udGKEPAiW+E5u2AofXsvKC0XhwqzUecGaScmuV1BCAogCFHsI0C6nV4K9aV?=
 =?us-ascii?Q?Mkicr3YoCPZnL9abxXnY+TBxBifGSLtQAdleLdXLI2nCYQ05BRUqUWZPUejp?=
 =?us-ascii?Q?V18M6aYS9Sr5j/mQ9jD4bRdnIU2dtw1tJ3dj4wDsUa8txuF96oaH061ZY/Tf?=
 =?us-ascii?Q?PYvb1xpOSn996XiDnV/6QEeEgonkTwoHVkktougoPUvKVwsXwX78/N2geGJa?=
 =?us-ascii?Q?BvHa8AK9a597ycjdfOd0MJyFLjOXETdsY7FYEqNnjs6Ci/wEZ+/gJIo0kKEd?=
 =?us-ascii?Q?/OgUCI6lAjJOmICUsCqxoC2Fr+cR+gfW3+wYJpAjEtMghgb3999jrfKyBeL5?=
 =?us-ascii?Q?igFObLFY90P2WGx0qQCMRa9TZukRjwnq7Uex5JQD2X6Vj0rVLDiR/rgxqN8X?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c6013d-4453-45f6-1cca-08dcce52a792
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:37.4810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3xuGHUgwu5rtfwhHm8NPBsdpKqQLZyHut/v/VmWblRte0RIFzu8XRiZyTP2rd1aql47xwihvgDQvu4ZDy/HCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204253

The contents of the COPYING file included in the current source code
package match those of GPL-3.0-only license, which seems to have been
the case since 2008 commit
http://git.savannah.gnu.org/gitweb/?p=3Ddejagnu.git;a=3Dcommitdiff;h=3D9beb=
e7b9bfb9b02e5e4d86ad74e8ce3eb32a36b9;hp=3D50fbdd118dba066e201c73a8b0155381c=
d65a32d
("* COPYING: Update to GPL version 3.")

(From OE-Core rev: 26b71cfb7815a096c5962629801cc3bc85147284)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-=
devtools/dejagnu/dejagnu_1.6.3.bb
index 895f6d3b36..c6002d5e45 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "GNU unit testing framework, written in Expect =
and Tcl"
 DESCRIPTION =3D "DejaGnu is a framework for testing other programs. Its pu=
rpose \
 is to provide a single front end for all tests."
 HOMEPAGE =3D "https://www.gnu.org/software/dejagnu/"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
 SECTION =3D "devel"
=20
--=20
2.39.2



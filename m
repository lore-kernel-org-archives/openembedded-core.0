Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321C1C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=pKRtgpZI;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKLnzh8HJB+k91Qv96fPgN4KsljLBsu6TfmjMpFsgeYNnk5e1IZx9UOmIR4k7DC3dh5WM3k7T4yz+mBm3w+XJ5/pysWI5rLKbNo467uBYcBA7hSimsnSMTGTKL7FZrONefGLgKoDk5AIYaMbozPq12QWzuealDPp02wZJ/ZDsIvvI20trk85nYYPaYNrP8ltKMDTe25OBqI0WA0eZR3uYV6WBaKECMt0TnSR6RmyzcMml2qs/IrNpkzSX1D2Ut+B6x3xSU+fU53T6TukG+x8ZNj5U9hxpzvz1A8yhdrkJhr0+yCRxl0lBJMNPdw5fep8wS6WDufVA5STePCXXz8b4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwWGBPdEe3gpglRghXAsY2p2DpgDcxY+CuWEldD2HVg=;
 b=a9AWItqlAqajojCJEmAdBWae22ufPKWAHhSY76r4HAtLsq9lEVgBuj1MaYpG+X5pQ7OkGCZIbJwIjEQAhrePv2VmUFkBxltZ5fRW11ke7chzJvFNfVklNQaoRioYBnjvH01pGCh+4NWu+5+r2wzYn0k3LVD9LCEkVBA59Y9H2TDnN5nBDUTpIlIUYBs0/jTmTqvYZsC+Tko3/gkf9WJ2gQhtvRbdGpnWKHBa1BQV+6xPMM/9UpAgp3xXYcku6H21aMyXqvh2uvEPF8/7wgYMU7aHczWcE2TguxkBFK/2RsHutpP4sygfjIDERI8MksSc88JjUpN528sMXkvc0OYe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwWGBPdEe3gpglRghXAsY2p2DpgDcxY+CuWEldD2HVg=;
 b=pKRtgpZIJ3++toCB8GgEZ6SUw0Ej1xArRI8H4yZ9XKDYb6nIK5b+NjpDn47zhx/6XNukVFRF0rB25P2Tn4ggU0vYIcJTjyrOT9A77kjgcOr5GIJDWL/OwS36H+iiSBHz4rZ/UuFCBMZthcXySwYQPT7SYOd3fFE6Lzx2XpmDeu0=
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
Subject: [PATCH 04/12] recipetool: Skip common source files in guess_license
Date: Thu,  7 Oct 2021 12:13:18 +0200
Message-ID: 
 <20211007101326.11075-4-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Thu, 7 Oct 2021 10:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccef7c78-24bc-4cf3-5e65-08d9897b27a3
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB464948B416B508862D2E9B9FD7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6006sDOVtl59Wq/oN8CSvEUhEtuB7b0rRz3VTZcXnC4ITI6cZ8uvCHAj4tux2ejpvJKUlOYC61KEP3RiB81P9QRZBLRoq86juUagXgn/mUBQyDTCtkhNKaX7M501QEtqE9oHXCMbyokvXLgrf07KqEt8PC/LbtYSBQFuMQpB36gm5O7W2UDo31eH0/kCyHOoIO7q4X5H/9FLh9ZVhSMhicimzi9im2EIsYdMrNEJIadjftRQdUuTXGr4sOgI8MGAuPn9bsw6zIa1cSB0PWEGhdIpghW90tpHyK8mNoudVt+elQiOeAZGeTVwvGxJv8hnN+k1H8dpd71kA2JVxRWeEipAgCGHZcIC5iWUt89R92d8p3bI5qL6Vvrp+6j+cF1Utrt01skBZeJNVgypqT5rXppgbpprP3u3WxnwFFQZBfmZUO2s51RzxOpZLmmkoyNduZ6ywtRPorS5Syv4TKJSuwExp9cVMX7LoyAUvVQAYApD1Wl9oF3n11el4myZMGvgk9l7SOvwePr0iitVhdhLKR16s6wqIM/MoDTPKbkV35jTmp3o82NJHGnjPSQIi3p7fHTV1VDU6mCgYdplnzy8/QmDZGUXZgdzpA8MruciM3P5XtUJYOHARQlbq/QFMS7ZJaLJmYXKaYE4rfpBu7RwErK3+WERdmwOzWZeHdIqKWkNP6ZNNg1ynyqcWzCarcbP2Ll75blwmHYvYg2AztIOIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(107886003)(4744005)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fblFGSc7GhTAgbt+eoY+fTYU7cHea8KxI/i/a4Mw7w+99Rz5IXAyUNWSHBGz?=
 =?us-ascii?Q?canP7+cux8OSWasACXewjHPynTYFfFkrUxtGt2dpKJ3yztK+jMfw6B2QkowF?=
 =?us-ascii?Q?eoS2kixVtQxk8feevYH03J5H13asDQA9EW/guNBJ1SUCi9FTwsvRYhCjJXDV?=
 =?us-ascii?Q?oKQ5JctW7lLaY9il47XNEGeBkqJP+ag/kKwkG7Id7FOcV+sp4SouIJJlM8mi?=
 =?us-ascii?Q?eEXvmUQNdRNExgp6BfCKLMKO3k870NIxwk5x6n11Gg+62iz9s/3VrSSpmG8/?=
 =?us-ascii?Q?93Hq3GDG7c/0Y6q+Gr6WsI217Zf+PtmjYS9FMRhAPHE0vE1zhZHTBrRCvfrl?=
 =?us-ascii?Q?GiD2EZS71+keCU0kd6PTvf/kADZminUeaz9bzcTFvKsTk7WO3F95RGtGOnOG?=
 =?us-ascii?Q?wBf8fkVHeweZp2omMMOeS8p09FM2/HsN39vHu2dTSyFwmj6TWHEY5vHutTnv?=
 =?us-ascii?Q?mx9ayQyM8N6cCK9MoYdYHIuwxEmXql9hhAqZ+kffCJAHn5KdHO+fFy1MS33Y?=
 =?us-ascii?Q?oCNholU93pIAiilczfCOnucWhq66g/MXekUpuAq5h4nwdHQ0bgrfSlR8Ftdr?=
 =?us-ascii?Q?H25NkhFtLa7ZxxcwpwXu/pQSyngKEIzXgrbBJ3NG6TUDKfZJ4Hwyi1NpelDg?=
 =?us-ascii?Q?TTNRWSodzc1eJ3BR/GotVSqAyPm+t9cYwc5ByXSyUMnnOuTp7YZIIsYbX2Z6?=
 =?us-ascii?Q?8EpSzd3wgUvsPHzblaRVsERdOWFFr9DwqBPMnw0A853gP61cXLsREypabupj?=
 =?us-ascii?Q?yiEqcd/ITuwXaCAIrrAJs3zyLTRcKfxvYm0ZJWtexmadsQq73l9w/oPuCZNX?=
 =?us-ascii?Q?/XevocV0HQYj9eJMI5g1r1QrivmC4gMMmiNlpdDAVPDPar8dQhpm3fQ0mJkF?=
 =?us-ascii?Q?Zg4bH7B6QEs41eifPfyBCBU34vQwk8I6KX6qCw88vFuWbS0/DnVxIoOC+4BA?=
 =?us-ascii?Q?bqNkyiVQrMP1Kc04e0/g9MPkZxerdqm64f9M7qiWKk6zssTI7PAbDLJRuYTs?=
 =?us-ascii?Q?L/ZFfU01wNXJXuGAlEG6Owx0JLU9xEiW7njZd2PBC1zpI1PVG98qpu1XCG1g?=
 =?us-ascii?Q?MA/BJ5kccRLWSKOKMdX1EQgSPIL+6SeQKN29SwIGaSSjA9zt7ddmx0pd5VyF?=
 =?us-ascii?Q?7z5CIvbDceuQ1QvuOBVhHPTogS4syxWKmIX0E+Nrx/bybF6NKh1CO26/NIk1?=
 =?us-ascii?Q?AcXGWkAua0odJ8gZVzWXOYpYWFv/xQSMo9iKKo71zPn2iSuvVKvoikC5aaL3?=
 =?us-ascii?Q?XnZj+rlwgrPmV3xDKrfrGOnHbwQnBMStkgxf12rCAjWYqwUeEn9a2n8rWbn5?=
 =?us-ascii?Q?B4Dwp6zYDHbbH3ck6uvup/CQ?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccef7c78-24bc-4cf3-5e65-08d9897b27a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:49.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BUdcpHesSdNCokR6ynfE0hxlgIen+GaiO3hTh5aqLc4ZUFGDipRdUnxwyryeCOs1IP23TrGSktz1qny0/DgIKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156710

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 3bcae962a8..b1c8d32852 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1113,6 +1113,8 @@ def guess_license(srctree, d, licfiles =3D []):
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
     for root, dirs, files in os.walk(srctree):
         for fn in files:
+            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith("=
.json") or fn.endswith(".svg") or fn.endswith(".ts"):
+                continue
             for spec in licspecs:
                 if fnmatch.fnmatch(fn, spec):
                     fullpath =3D os.path.join(root, fn)
--=20
2.20.1



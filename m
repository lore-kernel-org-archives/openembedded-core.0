Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AB5C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 13:47:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.69620.1701697631000390875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 05:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=c4RfRmO3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.52, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l19rq92MnkfGPD5P1qDwg3/NSAgPZUkwZPTaTbsmXrDSHJ2i7btDlG33zIVGg1xDFzb+zFWYsdnUI1cnTSyRk9Eo9BtGAJ86O9prkHYcNLxBtbheZvRuj4s7o5dTxHbSHKth8m646i/zbsaryO1RunRt/xxVYqByuIBFs0iRY6kVB3eSiMk1cwU/X5/zwxpVQ1Tbo8k+wTB2zoRq2D8q+9gkXsS3e1leJOwPEUBERuQCde2+wgEKh3c5zdaWOQarROO6Fg2k1VS/vhtc51dx6/iL+I4wcVJwke+q6TO0eWTGjKEts3gaAw+Ryxyn2vFKryJxp/MbZLHPxU14yxNFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN57ayLw6484IFcLbZzPKbXhSoDwhqpL3bzjDmLFYKc=;
 b=eFZJgpC+drblfYJDdqSnGEmEtKngtX4ZOygzQ8yOikVrg9j7UFKVFoV3jb/grogwpMDqSp8m4PKpG495ZrVy8u632a4xVSwmJ0EUluem4cgrLRQ1f7JUcVapx/MLXAx2m9hI8J4iBUTPW+DPs2FdiWduBc+SMijqoEu+dngKdx45LiY7cp6nCkWuDsaRAW7NXYd/NRxCOyqEmzLU3mNftISObr0SZCj9V4t/PkDvnZOznpx/v1NBYw3RPyXaLkOvLgyhzxrzNPSE1Wakc9Jl3PAD2BQD/xPaDvp8WTUUiuP0y0uWRkLziYq/7rXsBVX7rLHWqJeaxDmTf9gMFfIvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN57ayLw6484IFcLbZzPKbXhSoDwhqpL3bzjDmLFYKc=;
 b=c4RfRmO3vczBSwAqafzYy/7dGDufRnBewUb81r9JFDKjwzXWz5OI+1+YY8Lte62WqHPLst0Kk+wAfF7LhyIh2EDVw36mZtk6WFewj7vLY9KiubhTKcYsRU3te54FSpNcePl7WpnkUFXFqU3Aho2uj7HifssCT0Px0M5grCeheYdDYmGSceyql4Ru9Rbh7rxmpm/eYlCV0ucO/ICYxbGpwNvFpZT1hR6iG/mE4VzXz7KaT3ceCAce7PYuNELdh+SmFuj9beiaQL77CrNGHJ83rvkDsHJHgtcw/z3bG5T3QrdskEzwHVmWkhFPSOqUzJbGUGnrU3eSnoXQsjinrhERjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DU0PR06MB8574.eurprd06.prod.outlook.com (2603:10a6:10:359::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Mon, 4 Dec
 2023 13:47:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 13:47:07 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] rust-llvm: Allow overriding LLVM target archs
Date: Mon,  4 Dec 2023 13:46:53 +0000
Message-ID: <20231204134653.2805341-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::29) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DU0PR06MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf81f5b-8ee5-41ee-7c06-08dbf4cf81b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s4I1K3Per7Ex7zs8WznlzjHeQNFIa1VhtUxXSMUX7yGRQpp5lmlh2+6nOCyE5b3FMsjXJc41onRD6JhvKnQbk9PDbqELPIR6Hup9AG4+X9iN5TnCJ1Xmg8sJ84E7Rt1JTv4Fqj3eAvFjIOy9GDmwZ9Fa8Po2S5JJt8dne7Px2kVKHia8+SxgQDdOw8vvR1BdXKqFVmsp46l5K/Zu+NnCi677ZgQ7ELl2ujOBSOe5KWG90KpMSmKCdrpOlba286yNXePJfw3HUpsmOwK9rFSXcnCwYk0zu1DwdtpJDr71c9rO1xcpVR2M8o2XcGntOgRaaJzawdWFYe8pA312vKM23ve1OK4vRh8fRWzpCPD4j8MepBt+ePQ2OXWxD1Y/84u5R6fhBN3jKS+NM0NHsk7ZCdzQqY+iwxvYQoduYu5lUVUSThm90QGctP/kHVQkvqeCwP3ZvnFFAuEtGyVGYjtPRGxwFgiPHiucuedH1FuCu3vtlfjM6wvh9fhAo/wiPIVTgoOfKFvtqtjg4qbXOslVNT70/Z6A9tx3l39lu/TUlj1zQRKh++AoUcxwnTqYrm/qwvpMz3gV7QYwChSNrEe5A7+RJHrGgYdDNCbGGt3tz/cOevjrA9TtFW0o/x+22taU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(66556008)(52116002)(6512007)(6506007)(38350700005)(26005)(9686003)(6666004)(83380400001)(1076003)(2616005)(54906003)(4326008)(66946007)(316002)(6916009)(38100700002)(5660300002)(8676002)(8936002)(86362001)(66476007)(478600001)(36756003)(2906002)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oUlFriw/vAuj9KP5TeoIUejZh1LS961zp0c1X5P9XpzFZx8zGGwkIs8wF4cn?=
 =?us-ascii?Q?7hFjcYbqcTqSebaQttnZczQzaQDayFxBhH6ycYrKPWYBhanH8nPNA5YSGEYE?=
 =?us-ascii?Q?3G5Gpi/LaSrB+GOC9Smdyct477fDs8f3K+ke7UCQE+/3pODNu1E8jkGpXmZp?=
 =?us-ascii?Q?yHtaLGbt486VUkJzbcnlmkWOQzYJXdq9em7YcbhxoI7G78HByOEMkLDAtKzr?=
 =?us-ascii?Q?XxPAH8XHjO9Wlf3LMutNUMCaZ677IKyJAckd2JeeCweG74/OCLfCl5RfuW6M?=
 =?us-ascii?Q?prQwtzDnIivHetj5V5A9seJggQMT7foir3s74EDcGpCQsHhuaOqZ+OmUpqgS?=
 =?us-ascii?Q?YN+n962+/1TcUWwS7fbzzBkDl9M8O0OTKmC4Ue1W0yqOKqOIHK7bukVg9Mwx?=
 =?us-ascii?Q?fv4ZbNo2rs56ah9kBm3KUHZG9rFcyYNHvehtkseynJp2L3k5ItyQDQvBg3Or?=
 =?us-ascii?Q?NxNOBxclhNioi78KLsrj3c/inQUZQwTyQlgX3EV0m3c+T80i7rToYHwmGJBi?=
 =?us-ascii?Q?aIOFyOcEFwAE7jNI5/XqQMd+4F6RXMMBgZ4f8I1w0H1Kgz7/J3nscokbDJZF?=
 =?us-ascii?Q?70mCdOJa47pR6pRjV5L1cicDW18Mnv4LMhwKicMFhFYnMQaAzNPIpOKgJGE3?=
 =?us-ascii?Q?F1WgEJhRY06uOTrPzfNP0TK4a4exi4Ry5ufBDOaNHcNAG++NpMYXxuI0jPGC?=
 =?us-ascii?Q?FkjSKFiARQ6ZEyNXijeDN8l8NUs63qsOMi0IF+S70Ntsp+yCGQggdBk8HLT4?=
 =?us-ascii?Q?VUB0BY8GxF74aVkXdtZ4fwOrcQ/RZYvLbe5TfyTGvikEJBE2gk/0ToEcrV/P?=
 =?us-ascii?Q?0afjitKcsF/m4lGlw5SOamICfd3P5Vbt2+vSJVbu+4R+sJkCWYyRu87mEd3o?=
 =?us-ascii?Q?b8PDcN+wpw6L6FRZihn7io2H7lnwRl31/6LLiHnsZ4kh77QZ+eFvQedGOh1E?=
 =?us-ascii?Q?MUD7rw4LgkYEsuySIwIyb4RjQ6Ux+nPwgpA0nA0JhSnFOKlDo3/KKaWqeyE0?=
 =?us-ascii?Q?rCM1wilwLYxrn+looosPQgsZuJ7nKKqvcOrkcgdVaVJPHPFlzIdeSUGaIzbP?=
 =?us-ascii?Q?PoMW+RRisRXEH5KKYAGkcc6KdKv3ClcoHH8G20HzWrvhM/ygSj+UayU2SyNi?=
 =?us-ascii?Q?W9vzfizOqSGNauryG1u/qJhjHG7ULp1FoLDuvZqcJXxxInnD97rIP+IXyhmy?=
 =?us-ascii?Q?JZ66y+Vda+6SOUR7Fdui2S6pipGQuUw6q0ryMWffqmJ3YokiIvw0jfxZy/1X?=
 =?us-ascii?Q?Dq2HLpwWvKcQKth+6f+17kso46LRfwVp7I9QVPotXMPEo9+WbWA4et/u5u5p?=
 =?us-ascii?Q?V9D3b0w359Rb8engmAB67ZiKPRJSYlUMOSAcfRfG3e+SUfkn/3tm6JjCnciu?=
 =?us-ascii?Q?9MwMo1/KmrzvX5MDn1yxt/le9RiM9BSCKuLrXHvwQBGBm8IgyyBn7xg1QEwO?=
 =?us-ascii?Q?rHA6/b8OfSGR6oaJgO+37lvJUdkJ+Yl5H18t97rikJHcJuI7sKGRERDEAxlD?=
 =?us-ascii?Q?Xj7tn2ODAsqCRiaRixnsbPOkRKtLFIaeiyOO5GmTL9/Tm/d8mVKwRYtVLy+t?=
 =?us-ascii?Q?qJOmViSRNDT4fBLmNFVm+D4fUSqX/Ze1ApG6FPOfMF9nboIrrmqYMC6Npe6E?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf81f5b-8ee5-41ee-7c06-08dbf4cf81b7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 13:47:07.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyI42dhnt5c0ANBPEruHIvyyB0BuyNi8zNXDUBf332eB60cd6JHZfzofpBFtSOaDQ8pgcRWOOIWrzZtCz5Bs6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR06MB8574
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 13:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191738

From: Niko Mauno <niko.mauno@vaisala.com>

Move the default value into a variable which can be overridden to
match more accurately the use case specific scenario.

(From OE-Core rev: 645370e85d8742d0614cd52ca7507b5df2d38ad8)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-llvm.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtoo=
ls/rust/rust-llvm.inc
index e645e7a7ac..416a07cd40 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -25,9 +25,11 @@ CXXFLAGS:remove =3D "-g"
=20
 LLVM_DIR =3D "llvm${LLVM_RELEASE}"
=20
+RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
+
 EXTRA_OECMAKE =3D " \
     -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'ARM;AArch64;Mips;PowerPC;RISCV;X86' \
+    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
     -DLLVM_BUILD_DOCS=3DOFF \
     -DLLVM_ENABLE_TERMINFO=3DOFF \
     -DLLVM_ENABLE_ZLIB=3DOFF \
--=20
2.39.2



Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE4CC433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web08.5885.1633678986590087679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=grZxvX9T;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.52,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9zQ3gZV7coR5C78e6UwjxIYGdddr4btkz89opzqAPByrznc617Q6bio9feGCPhs0wK1G+RpxgtGMw3KfSrq6nHzTDmoQwQhRvmpfYhi5NwQRgeLVZAPlccxPbPQjzj1uL+3PnKwxZ3ZNFQmsG6nPcyspVa/LgrrkabfdPhv+7dNAtoZIhzbKg9WG7UjTKSQn/Aw43aB978P0MwUZjfEv3S3we69DNpz8YKl1ffhXiQLUKex+r3U2YfD6qGUKRPU1kMLTytbIRiR5RTKY3wWzWQtLMs524UWZLw4ocPHuGohEPPH2Ilm4XyWYnTivAoP6jshlSegGsY4H+7qu+LH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd8k+YGNrusGN7k8bKGmXs0M7MuSwteyLwYjmVPd8DU=;
 b=HBxZh0DsSrAzoer3FVyiG3zUZNiJC4CAA4H2A7xAjtIc8RWx+O5bMtB+bTeLoZ6MVyY/QH4qPGILfmcqCLCayeJRzgkdY4HT8lLTDYP0Kxo1jQsF/UBjQyUkS64aJhfNZ1D2ame9YuRfQjrbg+WPrZ+NRI1DgX/FVZRAUjIINevaOony677N+JwMb/LNZURhDk8n3klmOcIHhEHFM+99wQULe4EuFYv8+/LEiWrUW9ck/Q3sK6++99RcckalYk4oj6Ne7MR304CoWwrZM/Kw1aKMJ/bamnRtUTsFXd72i9E4cz4P5qn/ndg5nBldn+AKedlDu3oUYF4VcD9omxpGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd8k+YGNrusGN7k8bKGmXs0M7MuSwteyLwYjmVPd8DU=;
 b=grZxvX9TGEcJjtQOkq3n9TOZaS0cS+77fJu7uFfRCdB8WYa7c3YoPXDy8oyf4v/vq7okz2nM70bvgKqvfclH73zNrJ8C3aDItcpFqxvQek5fA39p8+zcXbApRF24O0lfy1OQGZBsGreNvjPEgfajfr5/B/AWESkOO+/DnwGGjrU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:43:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:43:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 11/12] npm: Use configs for npm environment and args for npm
 run command
Date: Fri,  8 Oct 2021 09:42:27 +0200
Message-ID: 
 <20211008074228.8635-11-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58b5fbde-8974-4266-5f41-08d98a2f4133
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB577264FB4F30AAB29476BDC0D7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OkDPpfSdmaiENg5+hWPpxvXnKh9gBVSltX/P+tKmMZfRnWuGeWeIqmlP3PymcRcmlhZLgVbGXTgzt7zwW1142gUSYLI9s7x5NPdebFiz9LpzdvOvNGYotYPb4XAUZjiuDWHyfxy6hxSHTu1g2h/5KjPymTDUIXsEofB+H0VGqGpuy0BgfMRqhCnTeEDWqlxavdSkKKSkjOCCBkDrB3gKtLSZlLtNkruwxmFzkL0eWiERs25PMIArmCoKULVpiToef16EZLOVaiXrSq45WUur/7+gbh33nd3RIyHi9U1Ni2/YaYqvG+V1fdRjqkUM0CivQu4Wha/I4/LrXBNiRC6g2K6gFSxsxDWrGFiuSb6fgS72LRX++YDHYzrBJ9DHQV8t9nHpoxYxlPcPSpcPmIJZ0+8dQRz1/mYDiv8O3U39F7eSBTnz7qmqIfErNCKIsO/KOfn33k0yFTMCRYX08+ITNzhsx77lPIjwa2ZqInRzVDrRyg6WOLLG0zI3Dxdec5HWn9rwPvedd6pKMoL7Z3bMwbQbLOYCxUkdSjEjAIenlI2FY5NX/fx7PqA3cho8p5FHDv4KUcHtvtP2U7lxv3LRyb/4A0fWVnL2ga+Zy+3FLdclSVDmN6PkAxzkq7WsxGiHyCYsBEuV1+D4IMUcvbBc5/uucTetW6qSIz+r/sZpVGPiO0KXnsWkppn5dcTpH0g73wnqXWyCm5eZR94l4TbtJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6EdMXclUW1kDDrPwTcr/zpT3y8Oezl5SsipHElWIaXwix4wZVAO3RPOCX+JI?=
 =?us-ascii?Q?hx1pP5KxnUj4XzTqLh6eFOmujGOsDIMjiJH98MRL/WaDVg+LfWki/Jbt+G+j?=
 =?us-ascii?Q?KfVN3af7B5d+5pCJT84zx9DQzalYA9dtom1TCVr0kCZfx7iATLAiejuWPnNb?=
 =?us-ascii?Q?CFx8th+tvGmTm+q2rvkmtYCmSSUq5KbeQKI3BsdAQtKVS/JkapuVtRIHarWA?=
 =?us-ascii?Q?0WJL3tqp8iIY432N8i0y0tuMVPe0QzuYaufOFOvvRujh1tSh1tyDp98jEQZ7?=
 =?us-ascii?Q?EfyXR1l9+lDpt1BbIdF5VvTD7n6zJ7sxw7ZVVDVn8EFtivRLibPaaQgeM1yI?=
 =?us-ascii?Q?Aj+780raIVvK7xw1cj5rnGDWd8IbgsQgi9NBNauPxdQ2dmz+7yiPUyKA68oL?=
 =?us-ascii?Q?7ICYk6CvgVoYt6gU8cH5mVPnsQIWpXEzAMgB1t8go8ShpH65P+zLkOv0s86J?=
 =?us-ascii?Q?Wu/WW9XLHZFN4YY4NZ6Swgy5EdRmR9xJszO0RdfDswa2eTfglynqUhbzSrVx?=
 =?us-ascii?Q?mqhUKcYDnPwiJ3bE0yGsVrLiViyxovH3xb8TLoiIx8Apz1U8KR6964cyQWCP?=
 =?us-ascii?Q?bFYSrb8hOuerTRUBuMoIW321Y4Xceje6F7uQqFRzNfLJdwssQbT06NdoODAW?=
 =?us-ascii?Q?HVwiQ4xVjiZIYUbTlxp3p5rZsKgnplUry76YjEMQ3UWz/cGVN0DdE+3SeXlD?=
 =?us-ascii?Q?bI3Wilg6ZWv/VtkDCgWmAuByrcvRSqPi0ha7d7s0pk2Ma3A9VDmL/ioPlBpm?=
 =?us-ascii?Q?rAOFi5TS0DG4t+7ewfZa87MH12bRdPYyvpvjr5K5sAelkkrBtm99X6w1UTIN?=
 =?us-ascii?Q?bTvrfbzAD9cqjBuXr80raZAiBeeRk7s4ISZFpcVh28W6wE7otgOfTKpjNlqa?=
 =?us-ascii?Q?ShmZWGafNT2p0VveY0eXwzDfnG0zw12/tnCE0SHGGX7aZ9W8AFub7cWEouCu?=
 =?us-ascii?Q?TQ0OGWVovz4tpinNEfNnDZPanmV2NzG0MzyKvM50/cJd9MatO1nvLnG7xO/7?=
 =?us-ascii?Q?8USp1k/NtW8un266Tl+r+Cafng0HaYcgy9Sqxw6T3wQaielRUjB/30M+o3+l?=
 =?us-ascii?Q?bavfMeFwW4Al2nsDjueftTZVg7CYiQnBQXWooKi18tv4+CSTg4BBIH+VGD18?=
 =?us-ascii?Q?pbEX/oJg4sB4altFEPydNJFsFyqa52/ZFQlLczZzgAbMHR0uRG8T6EoxzCol?=
 =?us-ascii?Q?kXhcK/KD5r2ZYy+A1YBqBMERCCiwby65UPkJpFMkOpB5gOCzU6ea2SXtZ0Mm?=
 =?us-ascii?Q?aEq8ofNOfDMVF8yKn7dTPovLWub3cdkEFpfeF66lERjEgPAHrJJ/NOl+2p3Z?=
 =?us-ascii?Q?HPZWcfHAH1mQ3Y9CVHkwnvpi?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58b5fbde-8974-4266-5f41-08d98a2f4133
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:43:01.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q1rEbIJVSJyUcgmaW9J9kuu9KyXVm/E1MNHUh/pEcmQfRU61p8uX/rRAGH8ayhzl8Pd8TndoCcaaXgx+S3hElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156756

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use parameter configs of class NpmEnvironment and parameter args of
function run to support a common npmrc for all run calls of a single
NpmEnvironment.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/classes/npm.bbclass | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 05bb9f578d..547c531883 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -61,8 +61,8 @@ def npm_pack(env, srcdir, workdir):
     """Run 'npm pack' on a specified directory"""
     import shlex
     cmd =3D "npm pack %s" % shlex.quote(srcdir)
-    configs =3D [("ignore-scripts", "true")]
-    tarball =3D env.run(cmd, configs=3Dconfigs, workdir=3Dworkdir).strip("=
\n")
+    args =3D [("ignore-scripts", "true")]
+    tarball =3D env.run(cmd, args=3Dargs, workdir=3Dworkdir).strip("\n")
     return os.path.join(workdir, tarball)
=20
 python npm_do_configure() {
@@ -228,15 +228,11 @@ python npm_do_compile() {
=20
     bb.utils.remove(d.getVar("NPM_BUILD"), recurse=3DTrue)
=20
-    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
-
-    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
-
     with tempfile.TemporaryDirectory() as tmpdir:
         args =3D []
-        configs =3D []
+        configs =3D npm_global_configs(d)
=20
-        if dev:
+        if bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False):
             configs.append(("also", "development"))
         else:
             configs.append(("only", "production"))
@@ -254,6 +250,8 @@ python npm_do_compile() {
         configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
         configs.append(("python", d.getVar("PYTHON")))
=20
+        env =3D NpmEnvironment(d, configs)
+
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
         args.append(("build-from-source", "true"))
--=20
2.20.1



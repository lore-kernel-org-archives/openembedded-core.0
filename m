Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF17C43217
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=m0Id8RAk;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZV1ivOKoPr8hBNV3hQu+aG+4jHRB8G/ph+3n5hemJtFKOcVuXEGZKTFG9Ko8ZTNG8OQvp5urljqQCukMDrkqStmXElJNgj5C96ENCbNp4fAWspXjEUl1Z9VpHhid5d7QbePVwnI8I92TrAtdMFaLuKkReeq1bYxDEGdpvJrprkktSZatWWQx6OWUCecIphHuL4B/4Wj9RztdjHA97I9FfiTM9FjgldMu/8sYIbuDp89UYGJvpxf/dMqN/gtTczXiXw7zXLF+t8QyEwxmm/AXexmbEKENDvFEzU+XZLpUXzit+fQTGeDPl4hK9S9/ZgNTEKdeQiAKGa1cQhohfoUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szinUh6UDMFsYAQwVabrUFka+NUI85vWR2tDC/WdJSE=;
 b=HtvR96fO1fmbwy8A9mfHkBaYqpqJNXRxRpwF+Xq6oeC5sZkSW4RGDLSdBcRppCTlZN7K6CaeZ9sqkuaYJ80Vl9lezt3n8/kCg5FBkatuslbOuS9Xc9E7jPFiZ8FM0R7NFyRK5GdiR1kPnyE9YMUFfk7d0/pBC7SFCl/SiJ8w1+rz8ACJa80HaGEC0WV60ybhxpY5thZ4xRrDF3dUk3QsKwGSH4PUmVIiCtEptiXObU4Z3TilSBmJ3M0mZl/koCopQyDN8j0HPiCJ2OyqjXTbJ70cSUajl9WfMl4GwOqT92MJcnItkrWBE+hfe7Q53ZlF0Woszu4gOV8vRtnYlIr/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szinUh6UDMFsYAQwVabrUFka+NUI85vWR2tDC/WdJSE=;
 b=m0Id8RAkZtmRFT7vP0h0X7/T12opBC+N1XKmHn4XW/wOQeQusGq2QTybqnHJlMShA6TuYmH9tGvXf1pkpBWYtsa4YiXyOO0y9rT+oLSRgr2WXh4LVSyjufFUOIxY02ISBma8nCGE3GQOYH9un99lctyQIejCw3HpS1v9+PscYag=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 11/12] npm: Use configs for npm environment and args for npm
 run command
Date: Thu,  7 Oct 2021 12:13:25 +0200
Message-ID: 
 <20211007101326.11075-11-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Thu, 7 Oct 2021 10:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d3c88de-dfed-40fd-6109-08d9897b298e
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB464991BE1D9551709DDFD145D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	djXu9ysoKRAfMKmO820hN0zenzuCe4kC+hVova2S+KPPwz7c381zZ6UF/IPSg9AVvefeuXttoFSQU4AcUTnUtp4TkGdPbTk2zwYKvWFjboXFqRW+q8uIiVrwY8pinyjBF2ftATOiOvFADbevSoEspvqCFfvGMal3WusWSSDov9c7x9Mah0acBp8engfk9CYEFpXuMEn21fcri8afd0vgac3LkHMbazlQkVFFf9b2otiqDINXYMA1GsfjZE5hWSDG5j/c1WyDN/JaZa/CDz5LhZ3ep8Phds8ID0zJ1guUIh3ipm8zqwVl+M3PvqfDnEeawyCQ/BaQLKHa9ZUG3sdxgYSA9d6JHsuKfeyvyGfbMSEMNp6M4vxn0GSUD7LyMXUDl+dD7XBDSA6rjCfDVAi8E8kh7E6ph4Haow8a+bboH0HtybTHOTju7RueMLyx9hlKgC1lRwCytVu4xLdn86EohJoKwUBtRtKU/N01Gy0b1Ulbmeq25rwmC0VPspSwYiCY+x1EUCITYQE/I+M1Y6Kf9fQ7x/t/q6nZIr7AbHkHu9nj3Pvyz+1WB0zrKMD/gPS1JU952RgQNel+wcfRJki2p/re2sYvKWoXGwDZIFcOUUgZA7dJnfUEhNeOMnkHdMvNCIagu5HFJVrB+7yzKXJlSQvrtknnsNVXUDzvRrjYgcr+PU9bpwOi7OKgv0jXi21e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MJMFpkRSAahc2HidNGm5SSYHEz+zhCd5urUY/+vyN5Mu5kJ6C5RQ4KHVN5HY?=
 =?us-ascii?Q?hvtpCUHABsl3qi2E0eB8uuum8SD6JGCD2eE+dDAwqHDOZoGcSmXaNt8Z/tYk?=
 =?us-ascii?Q?OViqJbY7wOocgATCuEnQvpEx6QP+0tCOiZNR5GxE278LGaoFIJqA4oY3nDpz?=
 =?us-ascii?Q?i2BkJ7zRzgG7g+wvHquYod9kVXV2+ZjugXJDDSWo7rTlGuFR5+CY+Zfe1Lso?=
 =?us-ascii?Q?AZMYSJ+YSvSb+nHWoVnNqB4jUtZ4VvADyAWrz5+aHgnczJNbyVdJShwTYXWS?=
 =?us-ascii?Q?3jM40VCVoep7Q9K3XPF+iQcqZ90kbQ+j6QPCLGJxTr1Ue9NERjPcwkpGNXKB?=
 =?us-ascii?Q?j+iORRbb3S3igtoIlOa05YonXE4iGc+KWBglRlnDn6lPofLrLUA/mYdYri7P?=
 =?us-ascii?Q?jTK8WLbiwYK4gURn8ahRJuWhnFg14ow0RWpM2ZbS10NxICEoYXHiel52dNxU?=
 =?us-ascii?Q?3aECHkXK+Q3Llz/wnocbPKa0RUTmw1VDDjljraYISLlontignaOCr3Q+TBTo?=
 =?us-ascii?Q?cBXQGmHu1M2Aye67Jfml5uzbq1VamDD2rAGCAeU3zOj/UlMgHNWLAUTDfwiO?=
 =?us-ascii?Q?x1R7Zyh8fUhCRrm7QIZV2rILbhBvDOCbZu9z9MF4n2IVjLZlGwV/Q8NEKyG/?=
 =?us-ascii?Q?I4i7095amakDMPBYWXwARkfZO+xpwvE0ph9HhtHAooElHjy+aMDCJpGv011O?=
 =?us-ascii?Q?giHMeGnEkXEtIobx7WQDNuqHBBRIU5bXsF7mDLatFyiKg23wqh9+93xDJKX3?=
 =?us-ascii?Q?/Fgfqie5UM5UDwirXtth089dN7pgLtwAtHI3hhRigEo6kjWsdh+l4wzKLcwA?=
 =?us-ascii?Q?GnZ+Zouh0M7bmrdz96V6zI6zpqVDZpUGQAoY3zr6PMEDpaOzhJ9BpoapDHhF?=
 =?us-ascii?Q?eUYW79zuUKpWnFe6vJ4LIRg6xKOShDbgDHEIJuc6vQivTXgfxJrYTg6wCH4e?=
 =?us-ascii?Q?KCINZn6UxpYPGepU8nM1iolFC3Ie/81mtTqvC0lD25Ee4uJ3Eejr8hx2KJ5T?=
 =?us-ascii?Q?kGadEXkaABePLjUUkn5QUOhsp6XWPgoqVX9ehgWou8J8ht3GPUG/ERL9KYa4?=
 =?us-ascii?Q?SqEUu+cY3pkx2JwC4GBHTDHd0g8Mz9BYfnszp2ykLEPPyWdniHcuXLvWONby?=
 =?us-ascii?Q?YYPpxF3j8G57cgv1vTmamWD18dZixhfIvWxOjiM/4ptNhuwmTP3rNdcaWOFR?=
 =?us-ascii?Q?zv4f05sQobbzG3H9i+agcOrmww4saca/pkLxFn8OgK9QyMzzyeWqg789wxDC?=
 =?us-ascii?Q?FtZl+T0TVjKqgu+J1c+bYkomdzvqabIZh9LyYkfuqg98NvuQpMy1o/ydJd0e?=
 =?us-ascii?Q?j5B53fcoSD/3sZYRaqNMMBdm?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d3c88de-dfed-40fd-6109-08d9897b298e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:52.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q8u/LngiPuI2Gpi0U5+BJGzXw1bJ4KOt11D8HVEmnn45HUJ/jt3r8HSRgF2jBfoVY2Y6iHs2pNyfUWiV9uQlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156720

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use parameter configs of class NpmEnvironment and parameter args of
function run to support a common npmrc for all run calls of a single
NpmEnvironment.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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



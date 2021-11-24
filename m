Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04793C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:14 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=iQH8TxkZ;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iykjvy76vwn1AkoT9RTreY88po0roRWXe3eJkZnOPVp8lH1QaMpsZ+ZaU5BgCgcX9m1OztFVJhWmnPS7y0y1sMmxjVytNxfqz+VwyziewmfDQLJCg6CSauBspgRmPJjpV3mF5VuzpbErChOSJLc0eDoKR1sYJQwQtv0yNh4L2l5n0CKgieVp+Z1yUxYRnUVp0AxkuAlkn9Uxl6S/wXKuIfu5p0SD6jIY7hAELTHQ4BfjkE+ADdGdflzrvniPWeZh+m/Phz25TNV283ONHBSwpuTpusdf/eO/uToX/Ab2Bw/lWfSzxy72oV7oJBe0kTCA+LxwzE1Ugv+u9jJqagGLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLy0+7jLDO0VDvYpe1IhxyUcZ83OQ16eEv9+EjB/IRI=;
 b=klbXEqhzG1HbtC7plVOVcYNJT0TfsbbqKxaKoIOl2pNNBCLxc8Ywj4GK0pdi7L76ehE2EzWtxVA0+1/oaaX5/zrNYaAWiHUshATJrO58PrqGcWshU5fyOYleWHHg5zRukZ5QXzNs6H5X3ZZbIy99YHvJ2jRnZAbuGNNWByC6q3v7YelMi/3jOu7mwFkmVMUB16wcvkoslEx8Ka3BfYwv9XT6u9+MOv/Rf1uF7UpRMG6oVhspxMwtj9Rgc2LKFM7KrmjqPwrL86qt5Njg7hobLIlpN+MkR4trXc+SdGyF/ls8c2L7kRMYTZSWrjy2zLPZUMmO+YyUmPy3/4syJCToPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLy0+7jLDO0VDvYpe1IhxyUcZ83OQ16eEv9+EjB/IRI=;
 b=iQH8TxkZa363xqbY42FDIjNWQcZfFS1vk8qB3kQO3bR8s0E8ZngJ+Xlm3Ra1fyp+FFZXkvBJuBxr8R4OYy4qmWcOk0C/alv5XktuxXZI4jDlUd1v1YefN59kjY0RRStASs4WJXMJ6yL8h26UAtK7GNLGwnypRajBv4bsX7IAyjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:07 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:07 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 07/15] npm_build: add class to build and install an npm
 package and its dependencies
Date: Wed, 24 Nov 2021 15:47:31 +0100
Message-ID: <20211124144739.2250-8-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a23ce92-87b1-410d-5f25-08d9af596d96
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB580107EE37F6E0BD131C2BDAD7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wetkgc8Qupl80tcl9pQ4Yolot4Pptsk10JvV+LUH2iQGxkgFG4e3xlzR7IGRl3lQ3Fh8hqXAo5R3p45LSxhuHCQU3ipoy3+KsqQFZWZNOO8wX/1is/UG+OWXokoKW9IiXrQIELUluSpLG0ijwsuIa6WOqP0NE+d/m3OTtwTwsM+ZATJRjT7sBEe6GhNIK9manYATLoi2E1x1NkkbFJ1BcBneylJZdmQSB1qIYZfWTKdGBOBiDpBm+29MdxPSJ9amYAQFhrhh3MMmpt7ToevMX3fruC4qHd6ctWwPkmMUvG0iPzG92XKDbj95lXIW7GkJeUHOiODLNtu9LtlOXj8AJaerN2fA5wrOZyy11Z+05v0Kvg00wp+Df6ekIDcoWgYrXEWxq06vn53o4XzlxNOEyswT+zcqnCsxJJtzyR30ZicfO3cKAP81iN8NTdzWHrZzDA8lwNYoc59++2vRaTAvwMoFIEGKJX982IOEeS5NFG+4/dryFZ5vuB+ildOlu6pCusB0WzWk5biZFjjSYhCQwBFBu/XDSl8jkBT5lnvSgIvefxXZhmWzRk11xDdsZPIkWFaNfvB8Px1heGWh2wNG8PTgT/yiRSaSiFuPmR4BomTAfpLi13I+AOImCnAFT4rgTep+s+ywRY2DEEvqUV3TptY1DhkmX2mCc0kbywx8+0jR80HUn/a5xNvJNtMEB9xAiIte/Z4kgKPGS8ZA6YX3LA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X+uuCoVwSXhb1TrAexLOElaidd63xGaZrkjVbeyGJbzZJZFrtTz2BQZ/VylN?=
 =?us-ascii?Q?crMLbaR8csrflWkjH5zRXEmUzRDAtAjYadSjwcA3W+H80NT1qU8YA0qRvnD9?=
 =?us-ascii?Q?/0zYyeenPp2enaA1aHTp2x8k08Wksn9R9nEiJqZu9npYiCSZghPcqzD2eDY0?=
 =?us-ascii?Q?NSf6ViXrCGJMB9g59dSdoXlbQyKUSI1K62/56fGKGb4j+njvm0XVbHcC5CdO?=
 =?us-ascii?Q?JQ7d4nVxxK6+srqoEvqe+enV/eenCYkwT+5o8v8KTcbHCKPYxz2Y1v9xmJwI?=
 =?us-ascii?Q?WS8atEh54Ls0Ds0yllp7kI+xbzsTETDUlQ/jC6glY66uQBjgmkPnNQPCUxnj?=
 =?us-ascii?Q?Tb0ZxMyHe23Mm5u1OZzNhu0ii0muPSidOpmJq8+KQn8EkL+y2f77EEgjGPef?=
 =?us-ascii?Q?Y1Ya7arnzGuQ8nfA4B3FafVt+rXHHNmcnD+H/yrksuMR3SgBzTakBSwLBv+C?=
 =?us-ascii?Q?bjgUPySw2OmaEmgOqbYJPOctmHDgamgdecKGp5YvXCB9ZOxVbbx96/cTYWVq?=
 =?us-ascii?Q?osFVLEl60FqdOXwl798FQatBTRyBxEiLpfnzAIu1L8acMCKu/B3dqFFZ5cOP?=
 =?us-ascii?Q?OmRndRb1Wx1Ymr/l+A61Peu3t01x35iSnX/eS/onFlWsdLHx4h/qtzVYss11?=
 =?us-ascii?Q?xO+8CDiKA6CuydAiOCi3wVkv3TJv6yk9BSPKPqqA1VtWcTndLJ2W3357EXuy?=
 =?us-ascii?Q?MNhOhTziGtWIeCsaTmwNoPRg4gFuO555wtUy83X9drdsU4Z4Sz/LnjqyIVMP?=
 =?us-ascii?Q?ltVz2ViDLhv9YeGrgKtS6hJ2sQX95C2XVcUKIcG3/nMxDVARgNqHQ2TuvMbc?=
 =?us-ascii?Q?rkvUHAN0o3M2mRF8HwDiCQYJoQgixX9eC6drScyJ+5GQVhESaU6UH9U942EP?=
 =?us-ascii?Q?cYkVXz/jRMG7rAjdKFa6jX1ex217yu2V+geiXaMGSPtm/ERmNRSG6uvGg/8S?=
 =?us-ascii?Q?pPcIZiBIwfCQqIy/9SvzDQrKm0CEpB0lFxrwMIET+sH5RKUYCFYtdgw3WREi?=
 =?us-ascii?Q?OpfFfa06l6DjNuiLhM8nKVN4hSTXvdQ0AmPnSiZ5Q3rlJSQhPbrbg+UHnj1P?=
 =?us-ascii?Q?WtMcjMdf9zd3cZ7ZHh3LrSj1qdxopnXOfTqHRNRRajGTmhR+4KeAVcJLrV9f?=
 =?us-ascii?Q?bP2zBKymTcBJfrefawVyhWJxmyTfTBG/WbYug7Y0GPkJ17B4eYUdlN8F7qe8?=
 =?us-ascii?Q?egzf9lm2jFlEUnrqAMlj9vMZNbKaCcieVOpWSqYqLADPYBMex7DPoxFigAVj?=
 =?us-ascii?Q?TTI6NgQA2AnyKJUki8mTNocFLlCCtlSgwYNVsaVNOel00gIONZYNt02GRxVA?=
 =?us-ascii?Q?ER8o/QNJ5F++cSJmJ4A/y/WBaNeGCknEDXDG6BPHrQIn8KHhvuZ2kavUl1KG?=
 =?us-ascii?Q?vNNiFAjAndDJGzt3gepXEhORCncBtK5HdI9zyQrT8EwEKin6k4fAq331SBze?=
 =?us-ascii?Q?CjnykLvu4hhDwPxWdROJlONucRJmMVdoWozYfDAzk5mmAl49WwneBmPOQqMS?=
 =?us-ascii?Q?4rFuNxrzfql2umshpT2XWor8v3pFPYIrTgJelfG7ff+opQhUbdIMM1REY5wx?=
 =?us-ascii?Q?o0+WoRLa5HF9GNOFvZGeMLW0sX1tuKtp6vNl004pJxjU7oKCZDHI6sDjMsHs?=
 =?us-ascii?Q?jzqZ0DH67dGI0Zhqb3zGGZI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a23ce92-87b1-410d-5f25-08d9af596d96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:07.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6ZriMevzSM9cNKGxBzKbq4QiqkjX9Asvd6TbiG36s9jfmBwyUEgPEjpQ1h7IwQFymDbd8czuhWKJwFA4PQxIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158699

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm_build.bbclass | 77 ++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 meta/classes/npm_build.bbclass

diff --git a/meta/classes/npm_build.bbclass b/meta/classes/npm_build.bbclas=
s
new file mode 100644
index 0000000000..388eef9519
--- /dev/null
+++ b/meta/classes/npm_build.bbclass
@@ -0,0 +1,77 @@
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# A bbclass to build and install an npm package and its dependencies.
+#
+# Usage:
+#  inherit npm_build
+#
+# Optional variables:
+#  EXTRA_OENPM_BUILD:
+#    Extra arguments for the npm build script.
+#
+#  NPM_BUILD_ARCH:
+#    Override the auto generated npm architecture for host build
+#
+#  NPM_BUILD_SCRIPT:
+#    Override the default `build` script
+
+inherit npm
+
+EXTRA_OENPM_BUILD ?=3D ""
+
+NPM_BUILD_ARCH ?=3D "${@npm_target_arch_map(d.getVar("BUILD_ARCH"))}"
+
+NPM_BUILD_SCRIPT ?=3D "build"
+
+# Override npm package source path with build package folder
+NPM_BUILD_SOURCEPATH =3D "${S}"
+NPM_SOURCEPATH =3D "${B}/src"
+
+oe_runnpm_run_script() {
+    script=3D$1
+    shift
+
+    oe_runnpm run-script \
+        ${script} \
+        -- \
+        "$@"
+}
+
+oe_npm_setup_host_env () {
+    export CC=3D"${BUILD_CC}"
+    export CXX=3D"${BUILD_CXX}"
+
+    export CPP=3D"${BUILD_CPP}"
+    export LD=3D"${BUILD_LD}"
+
+    export AR=3D"${BUILD_AR}"
+    export STRIP=3D"${BUILD_STRIP}"
+    export NM=3D"${BUILD_NM}"
+    export READELF=3D"${BUILD_READELF}"
+
+    export CPPFLAGS=3D"${BUILD_CPPFLAGS}"
+    export CFLAGS=3D"${BUILD_CFLAGS}"
+    export CXXFLAGS=3D"${BUILD_CXXFLAGS}"
+    export LDFLAGS=3D"${BUILD_LDFLAGS}"
+}
+
+do_compile_host() {
+    oe_npm_setup_host_env
+
+    # Copy sources without preserve mode and ownership
+    # to prevent ugly file permissions
+    cp -a --no-preserve=3Dmode,ownership ${NPM_BUILD_SOURCEPATH}/. ${NPM_S=
OURCEPATH}/
+
+    # Rebuild dependencies
+    cd ${NPM_SOURCEPATH}
+    oe_runnpm_rebuild ${NPM_BUILD_ARCH} ${EXTRA_OENPM}
+
+    # Run Build script to build main npm package
+    if [ -n "${NPM_BUILD_SCRIPT}" ] ; then
+        cd ${NPM_SOURCEPATH}
+        oe_runnpm_run_script ${NPM_BUILD_SCRIPT} ${EXTRA_OENPM_BUILD}
+    fi
+}
+do_compile_host[cleandirs] =3D "${NPM_SOURCEPATH}"
+addtask compile_host after do_patch do_prepare_recipe_sysroot before do_co=
mpile do_install
--=20
2.20.1



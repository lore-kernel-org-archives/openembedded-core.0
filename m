Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AFEC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:53:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.34981.1698940405841993678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=dQQKMPKP;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qh6p2T04irVKJueIsPOEB31wUljHUK7bsIGHsWdwePaaOVC8YsZzIq1QMrClzSrf97KeygNAvcrtJ0laRiQGjW76RRpplkbgvfynkxE4DuQFcpBHOdtd43Ylz/Hu6NWWcPC4puJQVtB/qRYIeOoboK3MdfN3hjOQeRO1lqyJZ94ir55G0sIECfQfrS+sB+tNMfcXolWgZhfbxkHsBPpGAxWvQelI0VnALWs5sBoas5aOlCH3wob+M/pZh4rTMWOgz6OjSGmmWw+J+R5No4ZqCVicwoCpZB+ArX9sJ4VFE1Dit5yuAZ24vXCo70Ae15m/DbFhjUDp+rneXaXOXSXQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+C266ydI9GNGv1NWuP4ArggEAvXF0p8ahHlHV9Vxb8=;
 b=Hl/qF6c3ZbUlVDnFpXM3qkj7uGjZYwfZA4/k6RRbOJ7s8liz3VfOOsb9kxkutxLzEBQ10AyhZsZqyREcxRs7w2hw1FvWQE3yDAfhy0gXKuCp2MbaNW91IOQ4+jicUtSMKIHTEREQm692QnP08B4iCj1KRtrC+RD/fWecQb1Y8JsC/uViBfocp3NNp5cpa4a7vvtpkgCFB2yesAVD1Z83c89KPpXPhlF5b+e6hbxrTQ/O7mKgdPGfPzRkjN7fZ/oVMvGXoJh7vWrcoW9sGttsTd+JdagtQ26tJ4BPUDFSvTGpGWzEQSMe25NaBDVu2CnQg1LQemAHEVauX2IK8MS6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+C266ydI9GNGv1NWuP4ArggEAvXF0p8ahHlHV9Vxb8=;
 b=dQQKMPKPlS7kcZ88ffZIhAQ74tYyUKKq5xEU/+kujsTr0oru0ngSrx2+EbpxWs0DDds/x/JpjCGUWMO4+KKtPYoGobvx3ACTIwNfzAM+cnDwlYcj7ddIIVyEePU46WJA6QYQkH6wnEZPB1Z+xXrAUKTiNdEvpCGwpxNDJcErp8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAWPR08MB10059.eurprd08.prod.outlook.com (2603:10a6:102:35d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 15:53:22 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 15:53:22 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	u.oelmann@pengutronix.de,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v3 2/4] selftest: recipetool: Add test for go recipe handler
Date: Thu,  2 Nov 2023 16:53:11 +0100
Message-ID: <20231102155313.309534-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAWPR08MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2359f9-bdad-444a-7147-08dbdbbbd750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sTCPR6NitOYRnrc+25aBgUXc3SSywu+0+iFipHqGMdCXFviu0M/F8xZCmQlq+CVb3sbRdXFoKLRgUrSEKmAu7XpatP4YrHMK9dT0tiTujzxfqRRLYWpjw37DzTx+PdEXtP0q7Ib7KboLXoB+h1Mv/EPgDixMXTwsaNe0PzCaEl46abo+0YTCjhpnSrtsmZhXk4RAb+2/liMraEfJn5K8dmmXp/XCWOTl9FIdRUY+U9ntoCx90DVIuM9SLO9SnyDP4ZiQ761rNAwFppA9G7NnbU0hYPo3WsTABM2itp6IaZFO4zrbY9w5MOJIQ7Ov5wFzou6tIpZw9fvH50CubVMmcc2lJRUMjbKzOxI+wIcZY4M0RjFOG4NPH0+U9wXRVPudGFqN2RxZJaXlfXFHdhL+XWQ7jmhoEBkWe2dWejFj0IuUBC7HW37TKXFq508LijbB/f89ox793/5cBvZg1oszRpu3D4Ir/f2ohTbKzu1ZacOZmvn4k7OWCB5HNcVD9EqDzHI2eVilCRp1bSCmCNCoo3O0Tq1vJsyBU4LpALmMTZcIen2/JiJXpGow8ID3GMdYO9UqSAlqAazlV4VTs2gDtZcPY5P4iNLBCH/C/NyLbg4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(6506007)(52116002)(45080400002)(83380400001)(38100700002)(1076003)(107886003)(2616005)(6512007)(9686003)(41300700001)(30864003)(2906002)(86362001)(36756003)(5660300002)(4326008)(8936002)(8676002)(6666004)(38350700005)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xU1szaeD+vtlFQ8+NEAaKN7WEuw2dwKuXxnJdexacJlgHlIamK6OIKK3Xy9I?=
 =?us-ascii?Q?LDuUuEV1wzDsRQvNjBlFExOH2KZaMvvYJeoxjLmLbiYcZbYcs5WwkFDDbvAU?=
 =?us-ascii?Q?LV7enLtmVEjjh0/R0cEVyTd15lcw1w0l3rraDKTectlYPv7W4uJnos85wJNi?=
 =?us-ascii?Q?HzHy0Ht60LSiu142gt5i7WwqT0t9DYnDwpJtMa/RAr173qw9y6a79w/soCce?=
 =?us-ascii?Q?e57bK4ulv/a21u6mej+V8HVX/U8Dc5SJwMsQJFjK6ZBsDB/PO2qqDCw4FhTf?=
 =?us-ascii?Q?JIzISSI9ZdAQLO+PuzlldAHreAtcHd5EarPQ5H71V8HucWDjF0fZZkZEkhfY?=
 =?us-ascii?Q?JtvDF8yrrirEZlZXalEM9TgZfyICaHumq0b000axGQ90IfnMMdDekP7U+fFN?=
 =?us-ascii?Q?S9pLWGF8QuUKd5d7YAYbppvm/uGX5l/QXtd0hH9aolB+PXzVwzN3ZcsxjpfB?=
 =?us-ascii?Q?U8WhO7vg9K77QPYuKdnpD+zsqSw2xsA9wK/H57S20PEQq2cqM445WoVtGYrg?=
 =?us-ascii?Q?CSXwch2660KFuVK7GoK/UVFmZce8qcJD3Z7Ydx5F9tXXzij57oPPzkZrBF6c?=
 =?us-ascii?Q?bTFruxNh0BRin02PmsPPIz1CgyI4IC2u+GzlvFLC1lAmnkPTxItK9HRCT63a?=
 =?us-ascii?Q?xVkrtKZBTPHH6b4U38AUE8teZbLlJHbcb50k84i27BxazkpjuDNYLaKNAmZu?=
 =?us-ascii?Q?X7pODlF614uvXLnbISrfx5D16Yqpw7O8hNkezGf38fSpF3wAilJchNXfTpGx?=
 =?us-ascii?Q?lKW2eJI92k4gU/EVSVjbIlnSKfm758rf7l2JdrvnUBfvZao7TAAhwnobTdvf?=
 =?us-ascii?Q?wzHgRT9Y+P+dZFZbegoCquedk75Iyxc2NN3Pf0gfn5xEG3VORZgvgMLdTRht?=
 =?us-ascii?Q?BHAU2ilpt+n6TifchuM8T1dZbndT+BOKseVOxPObD4CTGPtchvgmt9aB+7EA?=
 =?us-ascii?Q?HNqmwxNOlC4lrApUr6hC3Yy26aRJINlcZUxGnkVnQDKFZreFZk/nHODtf8Yt?=
 =?us-ascii?Q?H7E7g07iUMSygFeRAP25JKJQLTI9w7admhxkSE1B9gGqotWCwaGyjnbrBI3T?=
 =?us-ascii?Q?8kSmqoA2EzWyRHE5JLpbZDFnUq61ipaxK5puxJjJcmjdnN/lIlyZmyLo9oNV?=
 =?us-ascii?Q?SyDM8m8CvzkgWPYA47HkUTO9JqTO8Pclz2EbEplYZhavvxuIMfzLg2UZMhbW?=
 =?us-ascii?Q?DMlk+0EvkDAvPqHWiw5XDzlAsbSLzzxKcI6cFixjEPXI+NXbT6cm0KxoKv+1?=
 =?us-ascii?Q?hQ7oow5zUY30toCW2U1DVdYKfu6l2ikpOV3Tt+OBdQQWEYyN+KwmQfeBXBpH?=
 =?us-ascii?Q?yRxTj2OsUcfnPMd6A4QtXcFW2NigEdSJJFoXzRsxFSRsDWj8GGACOkvojgxC?=
 =?us-ascii?Q?xjY1vSoOjDLdu6mPDxjzxb4JdGpc2A2oMNLAy2r3tf24XwpiJDiyL+RPVpz3?=
 =?us-ascii?Q?dIV/s3mSboAp4bipy6VgC2Msu7z2KoQ1fkogUOorCo73niNksFSd8glZwZc4?=
 =?us-ascii?Q?nksZHnQtMOlbE0rIoAITgWIxHNc39dIwFa/6oDKL9YubXYLK1IRO2iBuuaOP?=
 =?us-ascii?Q?A+UFed4jq81RkIA6y8U1S+ylHzaLGOkscsd+SxSM9/whKHZ7IkZM9QhyRxb7?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2359f9-bdad-444a-7147-08dbdbbbd750
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 15:53:22.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M12CASAtOpLZVCg8TOx+Q7JLG8lApalJeFhjlxW9mREL0A5fu/+zpICXeLMnEz76A+mV026o8ZazSjvRAP0jlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 15:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190085

From: Lukas Funke <lukas.funke@weidmueller.com>

This commit adds a test for the go recipetool handler. The choosen go
project to test the created recipe was picked randomly. The SRC_URIs and
the LIC_FILES_CHKSUMs are checked against there reference values.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 185 +++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 48661bee6f..73b5ce1d83 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -532,6 +532,191 @@ class RecipetoolTests(RecipetoolBase):
         libpath =3D os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib',=
 'recipetool')
         sys.path.insert(0, libpath)
=20
+    def test_recipetool_create_go(self):
+        # Basic test to check go recipe generation
+        def urifiy(url, version, modulepath =3D None, pathmajor =3D None, =
subdir =3D None):
+            modulepath =3D ",path=3D'%s'" % modulepath if len(modulepath) =
else ''
+            pathmajor =3D ",pathmajor=3D'%s'" % pathmajor if len(pathmajor=
) else ''
+            subdir =3D ",subdir=3D'%s'" % subdir if len(subdir) else ''
+            return "${@go_src_uri('%s','%s'%s%s%s)}" % (url, version, modu=
lepath, pathmajor, subdir)
+
+        temprecipe =3D os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+
+        recipefile =3D os.path.join(temprecipe, 'edgex-go_git.bb')
+        deps_require_file =3D os.path.join(temprecipe, 'edgex-go', 'edgex-=
go-modules.inc')
+        lics_require_file =3D os.path.join(temprecipe, 'edgex-go', 'edgex-=
go-licenses.inc')
+        modules_txt_file =3D os.path.join(temprecipe, 'edgex-go', 'modules=
.txt')
+
+        srcuri =3D 'https://github.com/edgexfoundry/edgex-go.git'
+        srcrev =3D "v3.0.0"
+        srcbranch =3D "main"
+
+        result =3D runCmd('recipetool create -o %s %s -S %s -B %s' % (temp=
recipe, srcuri, srcrev, srcbranch))
+
+        self.maxDiff =3D None
+        inherits =3D ['go-vendor']
+
+        checkvars =3D {}
+        checkvars['GO_IMPORT'] =3D "github.com/edgexfoundry/edgex-go"
+        checkvars['SRC_URI'] =3D {'git://${GO_IMPORT};destsuffix=3Dgit/src=
/${GO_IMPORT};nobranch=3D1;name=3D${BPN};protocol=3Dhttps',
+                                'file://modules.txt'}
+        checkvars['LIC_FILES_CHKSUM'] =3D {'file://src/${GO_IMPORT}/LICENS=
E;md5=3D8f8bc924cf73f6a32381e5fd4c58d603'}
+
+        self.assertTrue(os.path.isfile(recipefile))
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+        checkvars =3D {}
+        checkvars['VENDORED_LIC_FILES_CHKSUM'] =3D set(
+                 ['file://src/${GO_IMPORT}/vendor/github.com/Microsoft/go-=
winio/LICENSE;md5=3D69205ff73858f2c22b2ca135b557e8ef',
+                 'file://src/${GO_IMPORT}/vendor/github.com/armon/go-metri=
cs/LICENSE;md5=3Dd2d77030c0183e3d1e66d26dc1f243be',
+                 'file://src/${GO_IMPORT}/vendor/github.com/cenkalti/backo=
ff/LICENSE;md5=3D1571d94433e3f3aa05267efd4dbea68b',
+                 'file://src/${GO_IMPORT}/vendor/github.com/davecgh/go-spe=
w/LICENSE;md5=3Dc06795ed54b2a35ebeeb543cd3a73e56',
+                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.m=
qtt.golang/LICENSE;md5=3Ddcdb33474b60c38efd27356d8f2edec7',
+                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.m=
qtt.golang/edl-v10;md5=3D3adfcc70f5aeb7a44f3f9b495aa1fbf3',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-bootstrap/v3/LICENSE;md5=3D0d6dae39976133b2851fba4c1e1275ff',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-configuration/v3/LICENSE;md5=3D0d6dae39976133b2851fba4c1e1275ff',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-core-contracts/v3/LICENSE;md5=3D0d6dae39976133b2851fba4c1e1275ff',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-messaging/v3/LICENSE;md5=3D0d6dae39976133b2851fba4c1e1275ff',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-registry/v3/LICENSE;md5=3D0d6dae39976133b2851fba4c1e1275ff',
+                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/g=
o-mod-secrets/v3/LICENSE;md5=3Df9fa2f4f8e0ef8cc7b5dd150963eb457',
+                 'file://src/${GO_IMPORT}/vendor/github.com/fatih/color/LI=
CENSE.md;md5=3D316e6d590bdcde7993fb175662c0dd5a',
+                 'file://src/${GO_IMPORT}/vendor/github.com/fxamacker/cbor=
/v2/LICENSE;md5=3D827f5a2fa861382d35a3943adf9ebb86',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jos=
e/v3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jos=
e/v3/json/LICENSE;md5=3D591778525c869cdde0ab5a1bf283cd81',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-kit/log/LIC=
ENSE;md5=3D5b7c15ad5fffe2ff6e9d58a6c161f082',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-logfmt/logf=
mt/LICENSE;md5=3D98e39517c38127f969de33057067091e',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/=
locales/LICENSE;md5=3D3ccbda375ee345400ad1da85ba522301',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/=
universal-translator/LICENSE;md5=3D2e2b21ef8f61057977d27c727c84bef1',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/=
validator/v10/LICENSE;md5=3Da718a0f318d76f7c5d510cbae84f0b60',
+                 'file://src/${GO_IMPORT}/vendor/github.com/go-redis/redis=
/v7/LICENSE;md5=3D58103aa5ea1ee9b7a369c9c4a95ef9b5',
+                 'file://src/${GO_IMPORT}/vendor/github.com/golang/protobu=
f/LICENSE;md5=3D939cce1ec101726fa754e698ac871622',
+                 'file://src/${GO_IMPORT}/vendor/github.com/gomodule/redig=
o/LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba93',
+                 'file://src/${GO_IMPORT}/vendor/github.com/google/uuid/LI=
CENSE;md5=3D88073b6dd8ec00fe09da59e0b6dfded1',
+                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/mux/LI=
CENSE;md5=3D33fa1116c45f9e8de714033f99edde13',
+                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/websoc=
ket/LICENSE;md5=3Dc007b54a1743d596f46b2748d9f8c044',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/cons=
ul/api/LICENSE;md5=3Db8a277a612171b7526e9be072f405ef4',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/errw=
rap/LICENSE;md5=3Db278a92d2c1509760384428817710378',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-c=
leanhttp/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-h=
clog/LICENSE;md5=3Dec7f605b74b9ad03347d0a93a5cc7eb8',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-i=
mmutable-radix/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-m=
ultierror/LICENSE;md5=3Dd44fdeb607e2d2614db9464dbedd4094',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-r=
ootcerts/LICENSE;md5=3D65d26fcc2f35ea6a181ac777e42db1ea',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/gola=
ng-lru/LICENSE;md5=3Df27a50d2e878867827842f2c60e30bfc',
+                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/serf=
/LICENSE;md5=3Db278a92d2c1509760384428817710378',
+                 'file://src/${GO_IMPORT}/vendor/github.com/leodido/go-urn=
/LICENSE;md5=3D8f50db5538ec1148a9b3d14ed96c3418',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-color=
able/LICENSE;md5=3D24ce168f90aec2456a73de1839037245',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-isatt=
y/LICENSE;md5=3Df509beadd5a11227c27b5d2ad6c9f2c6',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/cons=
ulstructure/LICENSE;md5=3D96ada10a9e51c98c4656f2cede08c673',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/copy=
structure/LICENSE;md5=3D56da355a12d4821cda57b8f23ec34bc4',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/go-h=
omedir/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/maps=
tructure/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd',
+                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/refl=
ectwalk/LICENSE;md5=3D3f7765c3d4f58e1f84c4313cecf0f5bd',
+                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nats.g=
o/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327',
+                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nkeys/=
LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327',
+                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nuid/L=
ICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327',
+                 'file://src/${GO_IMPORT}/vendor/github.com/pmezard/go-dif=
flib/LICENSE;md5=3De9a2ebb8de779a07500ddecca806145e',
+                 'file://src/${GO_IMPORT}/vendor/github.com/rcrowley/go-me=
trics/LICENSE;md5=3D1bdf5d819f50f141366dabce3be1460f',
+                 'file://src/${GO_IMPORT}/vendor/github.com/spiffe/go-spif=
fe/v2/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327',
+                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/objx/=
LICENSE;md5=3Dd023fd31d3ca39ec61eec65a91732735',
+                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/testi=
fy/LICENSE;md5=3D188f01994659f3c0d310612333d2a26f',
+                 'file://src/${GO_IMPORT}/vendor/github.com/x448/float16/L=
ICENSE;md5=3Dde8f8e025d57fe7ee0b67f30d571323b',
+                 'file://src/${GO_IMPORT}/vendor/github.com/zeebo/errs/LIC=
ENSE;md5=3D84914ab36fc0eb48edbaa53e66e8d326',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/crypto/LICEN=
SE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/mod/LICENSE;=
md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/net/LICENSE;=
md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sync/LICENSE=
;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sys/LICENSE;=
md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/text/LICENSE=
;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/golang.org/x/tools/LICENS=
E;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707',
+                 'file://src/${GO_IMPORT}/vendor/google.golang.org/genprot=
o/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57',
+                 'file://src/${GO_IMPORT}/vendor/google.golang.org/grpc/LI=
CENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57',
+                 'file://src/${GO_IMPORT}/vendor/google.golang.org/protobu=
f/LICENSE;md5=3D02d4002e9171d41a8fad93aa7faf3956',
+                 'file://src/${GO_IMPORT}/vendor/gopkg.in/eapache/queue.v1=
/LICENSE;md5=3D1bfd4408d3de090ef6b908b0cc45a316',
+                 'file://src/${GO_IMPORT}/vendor/gopkg.in/yaml.v3/LICENSE;=
md5=3D3c91c17266710e16afdbb2b6d15c761c'])
+
+        self.assertTrue(os.path.isfile(lics_require_file))
+        self._test_recipe_contents(lics_require_file, checkvars, [])
+
+        dependencies =3D \
+            [   ('github.com/eclipse/paho.mqtt.golang','v1.4.2', '', '', '=
'),
+                ('github.com/edgexfoundry/go-mod-bootstrap','v3.0.1','gith=
ub.com/edgexfoundry/go-mod-bootstrap/v3','/v3', ''),
+                ('github.com/edgexfoundry/go-mod-configuration','v3.0.0','=
github.com/edgexfoundry/go-mod-configuration/v3','/v3', ''),
+                ('github.com/edgexfoundry/go-mod-core-contracts','v3.0.0',=
'github.com/edgexfoundry/go-mod-core-contracts/v3','/v3', ''),
+                ('github.com/edgexfoundry/go-mod-messaging','v3.0.0','gith=
ub.com/edgexfoundry/go-mod-messaging/v3','/v3', ''),
+                ('github.com/edgexfoundry/go-mod-secrets','v3.0.1','github=
.com/edgexfoundry/go-mod-secrets/v3','/v3', ''),
+                ('github.com/fxamacker/cbor','v2.4.0','github.com/fxamacke=
r/cbor/v2','/v2', ''),
+                ('github.com/gomodule/redigo','v1.8.9', '', '', ''),
+                ('github.com/google/uuid','v1.3.0', '', '', ''),
+                ('github.com/gorilla/mux','v1.8.0', '', '', ''),
+                ('github.com/rcrowley/go-metrics','v0.0.0-20201227073835-c=
f1acfcdf475', '', '', ''),
+                ('github.com/spiffe/go-spiffe','v2.1.4','github.com/spiffe=
/go-spiffe/v2','/v2', ''),
+                ('github.com/stretchr/testify','v1.8.2', '', '', ''),
+                ('go.googlesource.com/crypto','v0.8.0','golang.org/x/crypt=
o', '', ''),
+                ('gopkg.in/eapache/queue.v1','v1.1.0', '', '', ''),
+                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
+                ('github.com/microsoft/go-winio','v0.6.0','github.com/Micr=
osoft/go-winio', '', ''),
+                ('github.com/hashicorp/go-metrics','v0.3.10','github.com/a=
rmon/go-metrics', '', ''),
+                ('github.com/cenkalti/backoff','v2.2.1+incompatible', '', =
'', ''),
+                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
+                ('github.com/edgexfoundry/go-mod-registry','v3.0.0','githu=
b.com/edgexfoundry/go-mod-registry/v3','/v3', ''),
+                ('github.com/fatih/color','v1.9.0', '', '', ''),
+                ('github.com/go-jose/go-jose','v3.0.0','github.com/go-jose=
/go-jose/v3','/v3', ''),
+                ('github.com/go-kit/log','v0.2.1', '', '', ''),
+                ('github.com/go-logfmt/logfmt','v0.5.1', '', '', ''),
+                ('github.com/go-playground/locales','v0.14.1', '', '', '')=
,
+                ('github.com/go-playground/universal-translator','v0.18.1'=
, '', '', ''),
+                ('github.com/go-playground/validator','v10.13.0','github.c=
om/go-playground/validator/v10','/v10', ''),
+                ('github.com/go-redis/redis','v7.3.0','github.com/go-redis=
/redis/v7','/v7', ''),
+                ('github.com/golang/protobuf','v1.5.2', '', '', ''),
+                ('github.com/gorilla/websocket','v1.4.2', '', '', ''),
+                ('github.com/hashicorp/consul','v1.20.0','github.com/hashi=
corp/consul/api', '', 'api'),
+                ('github.com/hashicorp/errwrap','v1.0.0', '', '', ''),
+                ('github.com/hashicorp/go-cleanhttp','v0.5.1', '', '', '')=
,
+                ('github.com/hashicorp/go-hclog','v0.14.1', '', '', ''),
+                ('github.com/hashicorp/go-immutable-radix','v1.3.0', '', '=
', ''),
+                ('github.com/hashicorp/go-multierror','v1.1.1', '', '', ''=
),
+                ('github.com/hashicorp/go-rootcerts','v1.0.2', '', '', '')=
,
+                ('github.com/hashicorp/golang-lru','v0.5.4', '', '', ''),
+                ('github.com/hashicorp/serf','v0.10.1', '', '', ''),
+                ('github.com/leodido/go-urn','v1.2.3', '', '', ''),
+                ('github.com/mattn/go-colorable','v0.1.12', '', '', ''),
+                ('github.com/mattn/go-isatty','v0.0.14', '', '', ''),
+                ('github.com/mitchellh/consulstructure','v0.0.0-2019032923=
1841-56fdc4d2da54', '', '', ''),
+                ('github.com/mitchellh/copystructure','v1.2.0', '', '', ''=
),
+                ('github.com/mitchellh/go-homedir','v1.1.0', '', '', ''),
+                ('github.com/mitchellh/mapstructure','v1.5.0', '', '', '')=
,
+                ('github.com/mitchellh/reflectwalk','v1.0.2', '', '', ''),
+                ('github.com/nats-io/nats.go','v1.25.0', '', '', ''),
+                ('github.com/nats-io/nkeys','v0.4.4', '', '', ''),
+                ('github.com/nats-io/nuid','v1.0.1', '', '', ''),
+                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
+                ('github.com/stretchr/objx','v0.5.0', '', '', ''),
+                ('github.com/x448/float16','v0.8.4', '', '', ''),
+                ('github.com/zeebo/errs','v1.3.0', '', '', ''),
+                ('go.googlesource.com/mod','v0.8.0','golang.org/x/mod', ''=
, ''),
+                ('go.googlesource.com/net','v0.9.0','golang.org/x/net', ''=
, ''),
+                ('go.googlesource.com/sync','v0.1.0','golang.org/x/sync', =
'', ''),
+                ('go.googlesource.com/sys','v0.7.0','golang.org/x/sys', ''=
, ''),
+                ('go.googlesource.com/text','v0.9.0','golang.org/x/text', =
'', ''),
+                ('go.googlesource.com/tools','v0.6.0','golang.org/x/tools'=
, '', ''),
+                ('github.com/googleapis/go-genproto','v0.0.0-2023022322284=
1-637eb2293923','google.golang.org/genproto', '', ''),
+                ('github.com/grpc/grpc-go','v1.53.0','google.golang.org/gr=
pc', '', ''),
+                ('go.googlesource.com/protobuf','v1.28.1','google.golang.o=
rg/protobuf', '', ''),
+            ]
+
+        src_uri =3D set()
+        for d in dependencies:
+            src_uri.add(urifiy(*d))
+
+        checkvars =3D {}
+        checkvars['GO_DEPENDENCIES_SRC_URI'] =3D src_uri
+
+        self.assertTrue(os.path.isfile(deps_require_file))
+        self._test_recipe_contents(deps_require_file, checkvars, [])
+
+
+       =20
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
         self.assertTrue(os.path.exists(dstdir))
--=20
2.30.2



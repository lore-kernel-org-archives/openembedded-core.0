Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A751C43217
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:00:45 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.6635.1651820433030208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=0weI3UqQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlB8k/8zQy1u/eYeJZGveaThAv+Ouqh3OQC0hYSb/Qx3CMWLniMymHXR6Zmz/jwvTae33pYMD9K35lM/C7YwF8gL7VleM5922TLk1RMbzs2vELVzhjE200IBL/kO/askwGA9QFm4VInJw2ZDWTBMUzXNltgaTgNK43MnbAczX6YY+PaYyYvaleHqI8P/Z2MAmPkY6huQww6MLlXaxxgY2D0RQKww27UD5Gb6ILM21C0EfmTVbfVuzVAPVoU3ApOAaq69KJyuv3W8Dal7cLK7Ha3ZqGI2Ch1Q+Bwsu2O7MRLxILI4tkU+X2TTU264sCwOAwx21udNruB3XMneDGM8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oReOzIFbb2SrtTQLty6IQSDlnCgks50kfsksRJL4gU=;
 b=eNBdDiIMwNb0DG3h49BK584a7QkpwLbUByWevEaYcQ3bKK1DuX9vncjwn49WSNZB3HrTW9tfykJSbsWQHTCPosCgoW0+vABOLZkm8LJkehaWI+xOVtXrI5VPAcw6QxFodqUJSk2RyAS+vLOe3d0DH0eH2xGMyHvoowjd6lTyn/PmwZhKQRIk3QQgscr1jnjxT+QGwTsI5OfC0szE19+adcNp86BKxXX2OrgsaqmTCyMYaVYwxpDIUWrXre/sQKuM1KNsoJ0bE4MlpuFdFKgyz44BIE0JvFAKfevuMXhxyyEEMKrG5EVptzPpQPcS/ThMwlrODG9+dlAfyK364RXVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oReOzIFbb2SrtTQLty6IQSDlnCgks50kfsksRJL4gU=;
 b=0weI3UqQ30h6Irh9UirR8AuyGOoY/lNOO9ssfrHQJj8UwUg8Ju0/O3U2p9jKLpe05bVWVGQ1Ptc4eIpbDf4Mr9SgXYES0KqyWpQJqzCj9y1dEbp3eVddukFw6nbyVg+0sPXyPUHZ9h8nIhF4VQAST4iiYEomCFG3U6Po7NrQzxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 07:00:30 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:00:30 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 5/5] oe-selftest: add go recipe create selftest
Date: Fri,  6 May 2022 08:59:17 +0200
Message-ID: <20220506065917.1375-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83acbd2b-bed3-4275-235d-08da2f2e1af0
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1881:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB188181536FCA8E92C3417CEAD7C59@HE1PR0801MB1881.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fQkj/cZvgqP2Yde9AiXmBgrSgEM9bLiIXmOBUOTcKVAy8mSX1fJkCrzG+Yq0q5+xu+3rbnXaPg3h+Ctz4LhB1fLkI2O7OqX+hvAIWi3jmC01OD27dY5Ka0iVv1AtSvNJcmXf62M0o31JTy1E8YEPTfESODe2kFKAS8kAOYN5ryPt0METnmyWOjaUQNcfqVc3zjtn1gQZnAkOktQcWQFIz2A7AoKkKmmZFoSyecMeZs+1TQogiyMjoJZU2UWhs7OQRNtvrMSHEObwRbTlrIPVKNAx0RVzJweH//yGBbsfX9gkbQ1mqH04kGnHHMVZCzraqZP7G56J/Q+ZVdnOzyVkuXcEF9LBaMv6wOpZvhGqTotAETriZrGFIrepGZkcLLWjc57s3bU8PT8q7meaWZ8mQl6izyGbjceLkP3xK7fK3f6S3JqDfBH1N+BXDZxUvwRqWwZjFqYzsjNIeAzr7m/M4unIcFriiWb14uZJiAQ94gUjNGS8xQrRKWXUTKviqwdwhPZ27+EOPA8t6aoAVvsLDUYXzvYiuNGlBx7tydTQYSM7c4DxTSGkuA7aCR6AovBtg7ShPCck6tZqYocWsDvXlWOG2BPsDxJRltD7D6QxffwFQRz8Ntm3XZU4ErnLB0ujqmIvvRaypJfpWOmvSSm7z3BG9VokcUyB2z19Q+r00kUwpqAAuEuN8o+3xu17pihGFR5t4ZEoiSIbmD+eHVKoVwZFZ9vigPy2OweN+89DhvLEMwkwrAzYdvVi0UURz/v7gKIT2PmDyvoITACHDOYwT9uvCJTZpuMu2vfDD6KiseQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(5660300002)(316002)(38100700002)(38350700002)(2906002)(6666004)(83380400001)(8936002)(508600001)(52116002)(36756003)(1076003)(2616005)(86362001)(6512007)(186003)(26005)(54906003)(6916009)(4326008)(66556008)(66476007)(66946007)(8676002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VvEFQBdNxNzOIcvrSLpHPLbg7zrwuAFO0Y9vtHwMUwCJrCOXePQGWZS1Q7tY?=
 =?us-ascii?Q?p5nZbncs9yNEMj6EkBRazY+725nErxbGJ/0WjMIjhCSgjRLc5dREi0BrgUgL?=
 =?us-ascii?Q?VHuh8ERKRbdnMZpxirSku6iriwio3pUMPDpa0lTS5tjuhXf4Tw7YtxLLIca5?=
 =?us-ascii?Q?tqZrXbuP1dh3LdrGXzVoRPvu46Cg9TKhn3y8++FUJWZ1zsh5J3RNvXdzLaKl?=
 =?us-ascii?Q?ohEKbqlsZKbREd4PYK79IX2/Fb5/ZxyGHRIJUeFedvBSJauefVQqXWG25gFG?=
 =?us-ascii?Q?8t6nYjcDvRGQxKm/H3sri1nWkS9lpI0G9z/ISdLapfoBXfFz0Zya2Bw9depA?=
 =?us-ascii?Q?3+WUDhfKN8j8dyxpHfhOeBJ2HjHAMm7CrFPMTcN8pTG+v0PaajIq8rNRxuUI?=
 =?us-ascii?Q?NHLba8wPWgIJKcuh4FwT+BBQnA3wQvxVuU+8LgHbEs0lFnI277Kgd8GpKFAj?=
 =?us-ascii?Q?ktxyHhzcZIYqDdbAlhxeG2h5JPQzwGJuzP5UEDOHc8LF/nwCT43C0R8W7mEU?=
 =?us-ascii?Q?BqU/sZBLQZ2oaX+lSpOYH9pYQSWK77hWKTwLP72JagoGoMCoPWbcqEuLXi99?=
 =?us-ascii?Q?+HHH8Jod2AhSzUFL5lTInBJIxyUcvFOOeN3BAXBu1K95zI+aNonwa8uByhO/?=
 =?us-ascii?Q?OExjTycOzEAjxY6C0nQXZq9g+VKmPcl/f9T5M0KrJDd4jwdhQZ5UE94WV5Bn?=
 =?us-ascii?Q?uU3UFVAPz3+O1IqtzMD5FxbpVPAshdMGM9DmAonLk8BwtzOzB5Zfofq8TREr?=
 =?us-ascii?Q?je2OuudPa7gD2JZZh9PyldjBL85O4yBunrBVsQa0e0pJKVIcWlOkWFxlYP4d?=
 =?us-ascii?Q?+7q3xYQx2nPzE8Vq2d25D7ZlZSyU56zHtSXpqCpw8JUKd96d9W/kP33CFQ2t?=
 =?us-ascii?Q?pekSAdNb55F11FoqzedaOrpBpZofti5FICaNVREhA0IPliC5PoWjEfQdokNe?=
 =?us-ascii?Q?EtlqPks2U5RXuSdSQ99H9YUi3ABta1NgBbfL++ygFZx21ja/62CJUYRqiCdJ?=
 =?us-ascii?Q?jQFZL1SqduvUmVsVqLLAegMT6psNy+lURbw3FfLEVUjYqpnR1tBTXvDdBCrJ?=
 =?us-ascii?Q?slOt/xnYqeZ1VVwBkwizkjydGCVssIv0EngDYcMnvY1KB0K8NIJHinJIL89B?=
 =?us-ascii?Q?RZ5V4OOzjXgQ9F6fJ5uCbZ2peA/T2O80UACJUc4w0rcX/L+f/QVQTI+btoch?=
 =?us-ascii?Q?yk7JbGHN/IX1SC1XDCxed1Oerc+kz/3SRtuwErtX454ckEaOMw0x3Fcl6NJT?=
 =?us-ascii?Q?8e9yiFk6uIfFYZnwmxUhI/G3RwPLZAoaWdeVzTOPsAL1q+gIy4NLdUljI9sC?=
 =?us-ascii?Q?Q81tNX/2/1YCMvLOwz2Wge2Vlp62HglugE2Ox1QYLh2NwFwe8+zKsWqnIg2s?=
 =?us-ascii?Q?HmZSa0RYlVGnE5Nwjg/1wV44ZpyC1MXlzG9qUkK6qVKvLQXPiJfDlWdqZXUN?=
 =?us-ascii?Q?cj/hIQCty8estVd7IxfN7eIGEG/txNPjkFjADzXRmoHeBlVIk/Kc7QjmS1YL?=
 =?us-ascii?Q?0zRo3qiWM3xOS8nePkkjDZ0o3BWA5Zd4HtbTcRk+XSQWZQ816rTPVErqZ8D8?=
 =?us-ascii?Q?zKWqylTHAVx71mR/TdA8/T4oRoUdcrL3OL+rCRfBctnUzMkZVui1n3AhgWtS?=
 =?us-ascii?Q?1huFYhOXX9kBHX+XlSyz10JVArNTTlp249eqxI80N7sfbt71ZRRRLM2Div0B?=
 =?us-ascii?Q?rJ1cFCsvaKOJPiX8NDe/VYkTvdii/bCfONTAossPeaGlxkgB/VcFqHOk9dK+?=
 =?us-ascii?Q?CD5YMx67CGgDgmEpRzOa84+Bn/qU7+k=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83acbd2b-bed3-4275-235d-08da2f2e1af0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:00:29.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9mBq5/Uu4QojfYhbnANzDQ4LuEe0LhkQBVRAGGoeKJtDHH32APvMWu3pzKI9FR9ty+TxT7E/AGG6Ouvh+fcGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165327

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oeqa/selftest/cases/recipetool.py | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 510dae6bad..bb36e7b6d5 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -530,6 +530,94 @@ class RecipetoolTests(RecipetoolBase):
         libpath =3D os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib',=
 'recipetool')
         sys.path.insert(0, libpath)
=20
+    def test_recipetool_create_go(self):
+        # Basic test to check go recipe generation
+        def urifiy(url, version, path =3D None, subdir =3D None):
+            path =3D ",path=3D'%s'" % path if path else ''
+            subdir =3D ",subdir=3D'%s'" % subdir if subdir else ''
+            return "${@go_src_uri('%s','%s'%s%s)}" % (url, path, subdir)
+
+        temprecipe =3D os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        recipefile =3D os.path.join(temprecipe, 'edgex-go_git.bb')
+        srcuri =3D 'https://github.com/edgexfoundry/edgex-go.git'
+        srcrev =3D "v2.2.0-dev.54"
+        result =3D runCmd('recipetool create -o %s %s -S %s' % (temprecipe=
, srcuri, srcrev))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars =3D {}
+        src_uri =3D ['git://${GO_IMPORT};nobranch=3D1;name=3D${BPN}']
+        checkvars['LIC_FILES_CHKSUM'] =3D set(['file://src/${GO_IMPORT}/LI=
CENSE;md5=3D71a6955f3cd81a809549da266346dc59'])
+        checkvars['GO_IMPORT'] =3D "github.com/edgexfoundry/edgex-go"
+        inherits =3D ['go-vendor']
+        dependencies =3D \
+            [
+                ('bitbucket.org/bertimus9/systemstat'),
+                ('github.com/edgexfoundry/go-mod-bootstrap','github.com/ed=
gexfoundry/go-mod-bootstrap/v2'),
+                ('github.com/edgexfoundry/go-mod-core-contracts''github.co=
m/edgexfoundry/go-mod-core-contracts/v2'),
+                ('github.com/edgexfoundry/go-mod-messaging','github.com/ed=
gexfoundry/go-mod-messaging/v2'),
+                ('github.com/edgexfoundry/go-mod-registry','github.com/edg=
exfoundry/go-mod-registry/v2'),
+                ('github.com/edgexfoundry/go-mod-secrets','github.com/edge=
xfoundry/go-mod-secrets/v2'),
+                ('github.com/fxamacker/cbor','github.com/fxamacker/cbor/v2=
'),
+                ('github.com/golang-jwt/jwt','github.com/golang-jwt/jwt/v4=
'),
+                ('github.com/gomodule/redigo'),
+                ('github.com/google/uuid'),
+                ('github.com/gorilla/mux'),
+                ('github.com/lib/pq'),
+                ('github.com/pelletier/go-toml'),
+                ('github.com/spiffe/go-spiffe','github.com/spiffe/go-spiff=
e/v2'),
+                ('github.com/stretchr/testify'),
+                ('go.googlesource.com/crypto','golang.org/x/crypto'),
+                ('gopkg.in/eapache/queue.v1'),
+                ('gopkg.in/yaml.v3'),
+                ('github.com/armon/go-metrics'),
+                ('github.com/cenkalti/backoff'),
+                ('github.com/davecgh/go-spew'),
+                ('github.com/eclipse/paho.mqtt.golang'),
+                ('github.com/edgexfoundry/go-mod-configuration','github.co=
m/edgexfoundry/go-mod-configuration/v2'),
+                ('github.com/fatih/color'),
+                ('github.com/go-kit/log'),
+                ('github.com/go-logfmt/logfmt'),
+                ('github.com/go-playground/locales'),
+                ('github.com/go-playground/universal-translator'),
+                ('github.com/go-playground/validator','github.com/go-playg=
round/validator/v10'),
+                ('github.com/go-redis/redis','github.com/go-redis/redis/v7=
'),
+                ('github.com/golang/protobuf'),
+                ('github.com/gorilla/websocket'),
+                ('github.com/hashicorp/consul','api'),
+                ('github.com/hashicorp/errwrap'),
+                ('github.com/hashicorp/go-cleanhttp'),
+                ('github.com/hashicorp/go-hclog'),
+                ('github.com/hashicorp/go-immutable-radix'),
+                ('github.com/hashicorp/go-multierror'),
+                ('github.com/hashicorp/go-rootcerts'),
+                ('github.com/hashicorp/golang-lru'),
+                ('github.com/hashicorp/serf'),
+                ('github.com/leodido/go-urn'),
+                ('github.com/mattn/go-colorable'),
+                ('github.com/mattn/go-isatty'),
+                ('github.com/mitchellh/consulstructure'),
+                ('github.com/mitchellh/copystructure'),
+                ('github.com/mitchellh/go-homedir'),
+                ('github.com/mitchellh/mapstructure'),
+                ('github.com/mitchellh/reflectwalk'),
+                ('github.com/pebbe/zmq4'),
+                ('github.com/pmezard/go-difflib'),
+                ('github.com/stretchr/objx'),
+                ('github.com/x448/float16'),
+                ('github.com/zeebo/errs'),
+                ('go.googlesource.com/net','golang.org/x/net'),
+                ('go.googlesource.com/sys','golang.org/x/sys'),
+                ('go.googlesource.com/text','golang.org/x/text'),
+                ('github.com/googleapis/go-genproto','google.golang.org/ge=
nproto'),
+                ('github.com/grpc/grpc-go','google.golang.org/grpc'),
+                ('go.googlesource.com/protobuf','google.golang.org/protobu=
f'),
+                ('gopkg.in/square/go-jose.v2'),
+            ]
+        src_uri =3D {urifiy(*d) for d in dependencies}
+        checkvars['SRC_URI'] =3D set(src_uri)
+        self.maxDiff =3D None
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+       =20
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
         self.assertTrue(os.path.exists(dstdir))
--=20
2.30.2



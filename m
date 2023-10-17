Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB15CDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:27:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.214674.1697549217556090878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=DOfk237s;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.69, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guU53ZISIvuqbs21pahN859jqzzITH5eoUW0i4Hakzx84ElmhFTR7KySWf9V+iS5eqw0vo/g6pWRJ/vQIpw1/gHOfEeYOs93Tu1ZMPdRDsJCxi9yg30CoI5o2tmGpkm2vZc8W1rQ1hj870vaz0qxKUrgYlrprN1AUHkzgXwF/PteWE19IjWftJ7UcbbZRNlNk+IqTVwcmbtThiuY+RKcAUvXUoN0loJFxLvV6aAbAjVzMBTaS32nPzmdj2RjoSOyLIzsVpoZq/DqxAwj1YA4WW8u6Nitdossz0Vsd1I8Y/B7DyJJsxM+n5NDuqWYq/Z5JClEQj4WWsnjxJiiWkd1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTB57h38HuySMMAP0ggp2OVRKV7ZsczQUMvf+VYsjtM=;
 b=iRgKQvAsK5XszSuYiXG6XbspWMQpYMEsUbuZg71BmycR8sarzL2MUt+1pnHEyaMBVxK4SHYC4k7K7IFSqtzy+7twkwW3Lrzv1neNrW+qUA0CevmVyIiZ41g//1OuI+DHdlk5ZsIirilNGiAPm64N/N3r+9iBD+gVOCZCeH/Xl/3eyJOWXad3kinQ4bOp/awBEfc9/TfAPiD1rrbsbGGzt4FDizmhGAO12tZVpiN/7wH/q2yHyOGNbw8j68uNd7qPY3vNoOzIdrLgyNfYRxI6mSeeZFpCstK/fuqxYLTjbrDN9isM1z4V9T1kFYayYgnXDAh91WeMV916hl4UUs6Tjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTB57h38HuySMMAP0ggp2OVRKV7ZsczQUMvf+VYsjtM=;
 b=DOfk237s3u4S+eCK4kgs47e/1xgfwFBJgWGUMsm6N0ZMI7hdaFbyRoLfsOLeOvHZYRhwxyv8YUiucWOpzIRQ60YSjl7YSetfhZaqzLFfAA1nefqK6wCfSw+samRWV4u97ezTQni/4PfbGyH+cF2tIFDqjBZDhwcB5zAZhQ6E/uI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:26:54 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:26:54 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2 2/4] selftest: recipetool: Add test for go recipe handler
Date: Tue, 17 Oct 2023 15:26:45 +0200
Message-ID: <20231017132647.352938-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cf1f3d-3ec0-4220-fe8c-08dbcf14ba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FPkHtLDKpAY2yUG6pN28surNfHx76cubps/5XK8TojGlyaMA6pxlRM1b4YUHCjNesNFgyli49NCKew3zL0p5EE8YsGoFezjLJSdaU1nT8kjcitIQuYIpj3KF3dfN7V9PJEjU1oD8pf2MjEAN2zQT69NDuSkEP8a3GGIIxEd290M7vkuGQtdo+Ra8n2OoRjGJdRUDkEQKduS+VAaxJDYhFb6KHEjQpqV1Ozgoi63gWpGXXOGFiOX1oxuv+4S93v1g924l3BqDmpLhR2yXuy67wL2FYckxAmnoM+N6a5C+m/SZF79akkfGhmtWAyhGzA1Djmd/Pqm5A35dWoId5mUXGGUJgAXIfPm0s5nJ1oQr65somV2A4RH4Mde+VyRy74ngwlh0k8lxW3Ov/8ja0j61QcHVf0QkfAL3MG9UlNbyhu9QSDoauET4SpEZHHKmj5wTTtwclC6AVnvux9QsOoZhi6ycct9cCRQIdycYbpl6NAEW7S2s4j3/G+ad7I8mzXcZ6xxZdwZMnnbLgR54C+rtLf4O63fv8wYDN7/f7qkQxt//l3lNbEW/7UL81Hx830j5ysKqmNdGzZkUcy+GNgF4U7RI3IB+JaHoCNEhHJQcH+8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6512007)(107886003)(6666004)(2616005)(6506007)(1076003)(9686003)(83380400001)(30864003)(52116002)(54906003)(41300700001)(5660300002)(478600001)(8676002)(8936002)(6916009)(66476007)(2906002)(6486002)(4326008)(316002)(66556008)(86362001)(66946007)(38100700002)(36756003)(45080400002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZL5g/RoO1PUc8rQIdMvBhwU7m1Aul7qU2LEdQulO/wHt0xJ6+EgOC7guUDtP?=
 =?us-ascii?Q?NJGjVMpaKH8qsWnxv1uJRnjRoXR22K62Gy2w1A+ztTWHYnhCJCVRByiWQfgY?=
 =?us-ascii?Q?r9YymuJL7+RI6Eb//jSoxaboeyTxRaK0fzPa2QrvZNSCLyRwAZ+F61+pTFAn?=
 =?us-ascii?Q?Zvu4lklsuLLH/5ZPxAfB2VRCwyGIl7KzM3mxwfcFNJY2XYal+Ge5UjT7Td78?=
 =?us-ascii?Q?AVCsMwLhTYH2PHXKmmwgqC3IgZycc69Jb4ZF1f3DGHV4MVENavjm07k6Ns2U?=
 =?us-ascii?Q?Rq1biH1ns5fqZtL5nRKnv5/s8lz4bdPuxaPoMHhbX9A8uqG+3yJz8hzLqI3V?=
 =?us-ascii?Q?i5pKckoTB13Xt7YYR3bvrDpuKrHZvcikHXkO6XfGRjsV2w6EmDHdSPbwQpjg?=
 =?us-ascii?Q?M0jGyDBWmKw2DrKOXFmaL/WCg47dYw56hAhbBMk7SS12l/0opzDfDn1rw5rx?=
 =?us-ascii?Q?dqVOiK76EmgJuUd6RISUQ2rAc9v2I4eh/Nu7hWLM0eXEz20FTyYvYHnLVv1N?=
 =?us-ascii?Q?VftZBa46GU9Ga8CLZYYjZrx1Xi+PXd6/dWHaZjrptuWDXAbuxdhlyHLowpky?=
 =?us-ascii?Q?l9BZq2RpuG744eKl2WAOQBsqKXAA6sJWNCure7V28osSasqJiH3ecx+UDvXk?=
 =?us-ascii?Q?TnClWcCP1DxuM+5LUuG1xP/VncPWIex8jOLDM3gf8v/dkMgHsoDUcqxSzYYz?=
 =?us-ascii?Q?WGaw7abdQSQtdtcNI2kJ4hijlq9XlI9N7unsBeuhPqA+Zaf9ThUXgf7yN7kH?=
 =?us-ascii?Q?3FCMdoj4K8ZUg6gajunLw8zqK53PQdKpjVqDlBN0yDNEk/JP3DQ65kCvasT1?=
 =?us-ascii?Q?c4K6aIU7SJfdBlLLCsuE1fzrUvgdpXkEsdAeevFNYEvZGmecL5GABRIl9Dzh?=
 =?us-ascii?Q?Vsp0/fPcym/WKDLTGU7pu0kZXit8J6al/z9xvV0kHeVBqPEykguadAMvCYFq?=
 =?us-ascii?Q?cEWD/6GAJvj5242VGqjNehk9zbvnBXXDoRMLfy+emTtA+DbG76n8Tne3dyDT?=
 =?us-ascii?Q?/mj0lG1pXwCp8lXWViZl3/1VSvFnwSc3uQ+iteEtwCsyFgOlqqaIPtcxEqXh?=
 =?us-ascii?Q?woWLkbnz7syePsE7hcG3hAZSb9oc74izDAKRFhTYnBVZYkBHguUHitu0YPu1?=
 =?us-ascii?Q?eEn5buoXTRKFDqjdEWCILJ6qkmKDDJNsIwcGBhA/6IUo1CCyePAY7OT7iDks?=
 =?us-ascii?Q?gn3Ecx1AuVGjpK03itiyBhcBv2UnNoh3H0f81poVZT1Q48tvIzmy4aZToz6g?=
 =?us-ascii?Q?k4X02mDnkb5Ke77Ocu8SDHDEpfsOtl2kh7X+aue5fDYGD1Ng3KT4TBlFFmvr?=
 =?us-ascii?Q?jhcuHnYkjGC0qenEdjRHkEqlHhgS+IemqBrzSfr8hWj93B1u4dPVLR1wrsUK?=
 =?us-ascii?Q?Vwxc7WKoZa6s8neqf3uR8R7tSXvSkr+4Ek9y8Z3XJ0VTcBxuRS8ojp8i+haJ?=
 =?us-ascii?Q?PDHyvKn2jxBSfg7NpAD9cBeQwUOk5oYZ499NbbE5pnp2GeUnbnEbrNAZrxvv?=
 =?us-ascii?Q?uZIJbueM0dZeb1+2KHmRDLtBxzgTEZEWHpEdz2ApXmHqs8V+qaUmFSNZgAyd?=
 =?us-ascii?Q?J3PAG5kRSIMzPiMHAl65V/oCELYuqIo9wR3VmkoeqJ/cjBiL5NdAkAWu8XR2?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cf1f3d-3ec0-4220-fe8c-08dbcf14ba98
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:26:54.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnX0xmss1WplQhbFLU7sazwTKZMHMAPQXtmgwIgzbQ1MlsxRYzTY679/66R+PFAjNc/30BzmK5FtIL8lBDVphA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189329

From: Lukas Funke <lukas.funke@weidmueller.com>

This commit adds a test for the go recipetool handler. The choosen go
project to test the created recipe was picked randomly. The SRC_URIs and
the LIC_FILES_CHKSUMs are checked against there reference values.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 48661bee6f..6f3d5df50c 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -532,6 +532,169 @@ class RecipetoolTests(RecipetoolBase):
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
+        recipefile =3D os.path.join(temprecipe, 'edgex-go_git.bb')
+        srcuri =3D 'https://github.com/edgexfoundry/edgex-go.git'
+        srcrev =3D "v3.0.0"
+        result =3D runCmd('recipetool create -o %s %s -S %s' % (temprecipe=
, srcuri, srcrev))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars =3D {}
+        src_uri =3D {'git://${GO_IMPORT};destsuffix=3Dgit/src/${GO_IMPORT}=
;nobranch=3D1;name=3D${BPN};protocol=3Dhttps',
+                   'file://modules.txt'}
+        checkvars['LIC_FILES_CHKSUM'] =3D set(
+                ['file://src/${GO_IMPORT}/LICENSE;md5=3D8f8bc924cf73f6a323=
81e5fd4c58d603',
+                 'file://src/${GO_IMPORT}/vendor/github.com/Microsoft/go-w=
inio/LICENSE;md5=3D69205ff73858f2c22b2ca135b557e8ef',
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
+        checkvars['GO_IMPORT'] =3D "github.com/edgexfoundry/edgex-go"
+        inherits =3D ['go-vendor']
+        dependencies =3D \
+            [
+                ('github.com/eclipse/paho.mqtt.golang','v1.4.2', '', '', '=
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
+        for d in dependencies:
+            src_uri.add(urifiy(*d))
+
+        checkvars['SRC_URI'] =3D src_uri
+        self.maxDiff =3D None
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+       =20
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
         self.assertTrue(os.path.exists(dstdir))
--=20
2.30.2



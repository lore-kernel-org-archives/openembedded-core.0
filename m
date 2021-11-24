Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED95C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:25 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.88])
 by mx.groups.io with SMTP id smtpd.web11.7028.1637765303189255420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=dykqueFg;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcYdSE82bMzEGgYIUEKWorxuG29QIlte3Q+rRreRkJKe1xalr/14x76U0w/RCMoHT/YSQ5IOOtnaLnzHe54dL6ctUpj1fQbJJ+sJKQXcKCXI1Fb2PX/jq0EmqKHEXMTS/I0G9rQs653Sh6bYzf6X0vWzjfcqiNj5SWH+jpfA1rvWC8n64CtxGtSp/sszNoC6dMnP6m6NMtJJPNNGVpsHxap+oDxWhXatiCGZFWOjfvj+O+fN9ap/LkQkbbAaCH6H7TTI5fys3Uw0z3pQUGIM8z9yBLY+GpedEb3KVkxuBspnQPyW//7q6iA6qM5rBhJ24siPC0iUB2Kw6MP8NfIEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/+6SmSAezSKe5U6+9+omWbtefl6sG//U2+VWxtloPg=;
 b=RCqNoWyysPdT+gMx5wu3fuC3kpZhf8me5jg8hJmtvQKhPnfXfA17yg8DloaabJp475KmbvEjtYObmi6W4+VrOrdZmG1b6sCWnoCqc2ABadwf9igq45eKFyhDxISX7pzXIFYZSeZP9uo7E+wjHrHoiRnTsqjzbWg7yo/Gvpw31ari9NhD61uhY6GrVfKI1Wk0Kpe77v1VzphAyejJQNMNQawMhI1UaivYnXK9uoz+mX8PLynTIIuPu3jC2t0XltmTLQakOFV+uo66UeJDQSc1AVjDrGF/FZw+ZeD6Zaq98v/VJ/SGTtjO3fGhDA0Msdm5p9y7+Ki+QdDNtVsOBFAX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/+6SmSAezSKe5U6+9+omWbtefl6sG//U2+VWxtloPg=;
 b=dykqueFghbnUForpPKOU2OIJtr26p6J1Gn6ifcDfh7GZkYAZYvcEZYkehcWtkN/BY4gwtP+1u56pQ43HnahCFGwjo8HXPNCAk9UVUvWfs2TIq+tyNnuDXY+ySxlOiuhy+3SaXuiJZyn5MvqF4PrcJjIGvY+how7Thjo/iwXBbC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:12 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:12 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 15/15] node-red: Add git version
Date: Wed, 24 Nov 2021 15:47:39 +0100
Message-ID: 
 <20211124144739.2250-16-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ce5020-dc6a-4bde-f874-08d9af597051
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB58012F043A9C8C5B1E1379D8D7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JLoJbAd2MvI6vehBkmChNwLK1cvyiDnMYueNVoabGOjOssL+57Pgs0zd17qNdGqS8V5lqXcth6IDmegQi1LIXd6YOJt7Wup1x9cPeGKYiFcrcL7sOe0g5JKwzXT+qVSdbhHrRS0/W+Kkq2mAWbchaIlj4XQyAJyQjkrwKqlJjbIGZxYwMqVR0feA3gRFMkAZ9PnB71IJS2FIPvOXxNoxSiNHrYcptCljvwNjaY+YWPfmGUOS2bF4i8IURqIomhz7DVjFKyRGJwtJVgxipgKWphjYEsegdTlDO3RR4SEo+KCJxhbhznHJDXmLgmlNc2TOIsqwODqn2SNfxkZ5pvjBe9tsBqjljyZej31xcZyRrpn6mcRsu3ut4EnSSZpnfT/3W7hxGjx8ETUTQQJs4I9hcbVBzulxBoL3wS8vUr2jpbTm+x7Ub+yQgs98ra+6/NMLQgWED7GL1JXggiuqgHvrye0N+XVCeOIJqiRTyrfRvh5RTuYDoX+u3ExspJE9b2sozVpCFixLdC3cP7bA5OaMJVudkrSzaYot5DELXSjVNzFQSdK1gNX9gCA+ZxTk2hWX9pRKAj3ZtQ8J390SGVMeFVZ3/hKaJbvJH1YoxnmvG7ofqY0xRjkz453s1VyTmWbrhc8GBNoLPzJ82auUUbgpHd3l3b8lhzz3CtPkd2sMCKZC5g8cPUY9uYg+o86WZwNaILH2sc9mzyw3IUF+c2vzw0kjsh+ctIAPwl2QspJ/XV7WZ6hbkjQE23Wh4ztX8XXS5EkStevRuG0iA+dvwbJS7rRiE+3GU11EXPOAuaP6oDI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(83380400001)(186003)(26005)(1076003)(66574015)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(30864003)(4326008)(86362001)(966005)(36756003)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S85tQxvcG2qEWPmpbP46YMbsmvxmyAGGkDlYEUxdq+iecSx40JOetlW0rKs7?=
 =?us-ascii?Q?PMrfXQ/qsLjz5D4f/CXWqoRUtNFv1WpWE/chR6Z+bOg3PM1CGIKPUX9cD0ZD?=
 =?us-ascii?Q?bUMyny2Ya49HiTh7P3txB0PQYi50jf8sWgInexo3mDrH3cprnuOjt4VEUT9O?=
 =?us-ascii?Q?+lsUxY9LxXzQ9Hhqb4rdqvlou7Cc7sHHpdny0QuZWVEDqCueG3/+ODgg2N/P?=
 =?us-ascii?Q?2ihcp0HUtKTcUISc77+HITGyUCoeBVygurU4WU6rJqlYgViVJmS3BBYMus0J?=
 =?us-ascii?Q?J0AmnrXaKOw9U+PIcGNp1Gad/tHtXYu9Eg8GrR38bYmLzLY7N+ovFZUb+5Is?=
 =?us-ascii?Q?JkhwPpTK6wBCiuevLbpHy/33gsu2+EQ33nVI0ksTNAPjofl4nevi3bnX4nUZ?=
 =?us-ascii?Q?lzjTR6V3nt7v6xRS3T/XuY/BsnHtMDo7PQgXqqUTJzzp/S0mT+uGyr4N99U0?=
 =?us-ascii?Q?wpyuWJLNRB5pKg82c1a9xl5SMfpNcs+a6VNhFT6/aH5S2c/80N6NSFCaO09i?=
 =?us-ascii?Q?BgZuTaj19wGjF6/nDrpNSMLbrh9kyMTSBXt5k5aA8hLQ4SLQoiGfVFyzv24D?=
 =?us-ascii?Q?4+PZpg0GGqnvC5CxDoNZu59tMI1T+BI4tGOUKsEuLBV/NFWe1s9Po30v+9si?=
 =?us-ascii?Q?fYxVChTyPlDSUnRZv5hshQEfMnQzfLJpZs/djZZCelsuxlh2M7ZLu7zf2rY2?=
 =?us-ascii?Q?Nvt3BpBXrZvdFXv520eDUid3jSjhv8qPVXBCbLdjQErWgtAcLGUBDozaXH3a?=
 =?us-ascii?Q?VQfXxQQWAWd4nC2txoHVOOWoxD2ObspkuK3fFJmKdzg/73/N5ORHh3dFg7w+?=
 =?us-ascii?Q?gU4TA+kQGHTTjSyp/GU0s/nuNFc9pgOEOT5VdI0+1VstKTEOkXuWmm2OVxhH?=
 =?us-ascii?Q?TuqVOp9mbS5nK/sXriLVTf2nVAptjydz+EE/H9GtLoMmIvDNVrdPhVsxfHMA?=
 =?us-ascii?Q?OSZ8lvemIV8r5vnxqy5o5oXwrfnbph/LjMJfVEc6FTC7SlS9vsc2YB9nr6CT?=
 =?us-ascii?Q?emVTTAvTjBvD9IyOKSyC2tbshwSZShBDNjeAhoYF7vz5/6XLKeyviLcEH291?=
 =?us-ascii?Q?d/4gCdgT4vr1At/V15QGGrCx+cw8Htty35jzPrYNOJkM+7L2uebvtGs4quC7?=
 =?us-ascii?Q?ogS5CfDgTBtJrSxOK+OZg0LI0vImD5S9ZhMJta7w0I7roM2imV4AhU+9u3sZ?=
 =?us-ascii?Q?fS6orcFAkyspyKML5Js+jIVWTld83thhZneBlpBDM/VW4jbTLWSlkyviuNaw?=
 =?us-ascii?Q?CZARnpX1Vilc+rFes3pkM+bbo52MBgQkqpQo+IniKQucTh8Wuq3XJfW0gJ/c?=
 =?us-ascii?Q?yESg5ZQkvSy9EQbEXbc2nHRhCbXN0d6dezJ/x3opzAVJzGKmzrb82A4FK8eS?=
 =?us-ascii?Q?2B0y3/AShbLoz7vyBQix93GwIlUzqIp42Cj5uPwwzi5O4lMXRzlSFcrdSRJ+?=
 =?us-ascii?Q?fUyiBiv1n90MzvwbgiCxFABFVTDHbg4Sk4WgkccNvua/1+OS4tXFk5LBGDkX?=
 =?us-ascii?Q?MARINrKWgShGS92az6XOhgU0XMB51aX9ezEb7xOcCReyH0s3pjAIgVwdigoa?=
 =?us-ascii?Q?jHT7mAfLgw3XvscOpHBbBQq8iMPhi8GOWDdg4+KjTXqmJMuPV3YnfFnombKT?=
 =?us-ascii?Q?DKq31FrZbA9YH5XtnI1AbDg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79ce5020-dc6a-4bde-f874-08d9af597051
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:12.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t16/4ybxydnKkDdAO5gIa1/XGWOTKne10DRqIvJlHGu+W7Sq5eJ1rmWXES5PQ5DZ/ZnfOLyHzTn3BvYl36zISQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158710

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Created via recipetool:
  devtool add --npm-dev node-red-src https://github.com/node-red/node-red.g=
it

Requires openssh-native as DEPENDS to pass all unit tests.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../node-red/node-red-src_git.bb              | 2855 +++++++++++++++++
 1 file changed, 2855 insertions(+)
 create mode 100644 meta/recipes-devtools/node-red/node-red-src_git.bb

diff --git a/meta/recipes-devtools/node-red/node-red-src_git.bb b/meta/reci=
pes-devtools/node-red/node-red-src_git.bb
new file mode 100644
index 0000000000..a2e2d9aff1
--- /dev/null
+++ b/meta/recipes-devtools/node-red/node-red-src_git.bb
@@ -0,0 +1,2855 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to b=
e fully functional.
+# (Feel free to remove these comments when editing.)
+
+SUMMARY =3D "Low-code programming for event-driven applications"
+HOMEPAGE =3D "http://nodered.org"
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best gues=
ses - it is
+# your responsibility to verify that the values are complete and correct.
+#
+# NOTE: multiple licenses have been detected; they have been separated wit=
h &
+# in the LICENSE value for now since it is a reasonable assumption that al=
l
+# of the licenses apply. If instead there is a choice between the multiple
+# licenses then you should change the value to separate the licenses with =
|
+# instead of &. If there is any doubt, check the accompanying documentatio=
n
+# to determine which situation is applicable.
+LICENSE =3D "Apache-2.0 & MIT & BSD-3-Clause & ISC & ISC & MIT & Unlicense=
 &  MIT & BSD-2-Clause & Apache-2.0 | MPL-2.0 & BSD-0-Clause & MIT & BSD-3-=
Clause & CC0-1.0 & MIT & Python-2.0 & Apache-2.0 & MIT & ISC & CC-BY-SA-4.0=
 & Apache-2.0 & Unlicense & BSD-3-Clause & MIT & BSD-3-Clause & MPL-2.0 & I=
SC | MIT & WTFPL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D014f1a23c3da49aa929b21a96808ab2=
2 \
+                    file://node_modules/simple-cli/node_modules/ansi-style=
s/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/simple-cli/node_modules/async/LICE=
NSE;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/simple-cli/node_modules/escape-str=
ing-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/simple-cli/node_modules/color-name=
/LICENSE;md5=3Dd301869b39e08b33665b7c4f16b8e41d \
+                    file://node_modules/simple-cli/node_modules/chalk/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/simple-cli/node_modules/supports-c=
olor/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/simple-cli/node_modules/color-conv=
ert/LICENSE;md5=3D9bdadfc9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/simple-cli/node_modules/has-flag/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/range-parser/LICENSE;md5=3Dd4246fb=
961a4f121eef5ffca47f0b010 \
+                    file://node_modules/path-exists/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/grunt-jsdoc/LICENSE-MIT;md5=3D048c=
c487b2b4b7bd5b783e8ce111be13 \
+                    file://node_modules/nise/LICENSE;md5=3Dc40c7dbb472ca76=
5e7c5111233da2bec \
+                    file://node_modules/nise/node_modules/path-to-regexp/L=
ICENSE;md5=3D44088ba57cb871a58add36ce51b8de08 \
+                    file://node_modules/deep-extend/LICENSE;md5=3D827bb578=
1213ff1e9d2fe309bbfc0115 \
+                    file://node_modules/strip-bom/license;md5=3Da12ebca051=
0a773644101a99a867d210 \
+                    file://node_modules/readdir-glob/LICENSE;md5=3D1b68cff=
15294bac8380a9df9ab8fa90e \
+                    file://node_modules/command-line-args/LICENSE;md5=3Dcc=
691b00068be9f59d2ad75882f133b3 \
+                    file://node_modules/command-line-args/node_modules/arr=
ay-back/LICENSE;md5=3D15a318bc4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/command-line-args/node_modules/typ=
ical/LICENSE;md5=3Daf12ffcd8249d3c27090df967c30f7e4 \
+                    file://node_modules/lodash.defaults/LICENSE;md5=3Da3b2=
b7770df62392c164de4001b59f8f \
+                    file://node_modules/neo-async/LICENSE;md5=3D7996c7c8d8=
9624a025e40e8b614de7e3 \
+                    file://node_modules/pretty-bytes/license;md5=3Dd5f2a6d=
d0192dcc7c833e50bb9017337 \
+                    file://node_modules/global-dirs/license;md5=3Dd5f2a6dd=
0192dcc7c833e50bb9017337 \
+                    file://node_modules/json-parse-even-better-errors/LICE=
NSE.md;md5=3D16d4ff0e774195fa8cee4940a14e99d6 \
+                    file://node_modules/json-buffer/LICENSE;md5=3Df26ea3f2=
a31273ebd199d933804f5e8b \
+                    file://node_modules/is-ci/LICENSE;md5=3D0c6fa9c682ce05=
a9a4da4f4a96cf42ec \
+                    file://node_modules/reduce-flatten/LICENSE;md5=3D43210=
8a22142773341c20697e2b629bf \
+                    file://node_modules/decamelize/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/@ungap/promise-all-settled/LICENSE=
;md5=3D87f405a0e708f7ec7db7c1c22476a7d1 \
+                    file://node_modules/split2/LICENSE;md5=3Da3b8406138769=
6c9678867c878a6bbc3 \
+                    file://node_modules/mdurl/LICENSE;md5=3D4dd6bce4f4fc62=
f6f51f603c406c145b \
+                    file://node_modules/file-set/LICENSE;md5=3Dcc691b00068=
be9f59d2ad75882f133b3 \
+                    file://node_modules/file-set/node_modules/array-back/L=
ICENSE;md5=3D2953118f740c646d26207e56f3c874a3 \
+                    file://node_modules/minimist/LICENSE;md5=3Daea1cde6964=
5f4b99be4ff7ca9abcce1 \
+                    file://node_modules/leven/license;md5=3Da12ebca0510a77=
3644101a99a867d210 \
+                    file://node_modules/gzip-size/license;md5=3Da12ebca051=
0a773644101a99a867d210 \
+                    file://node_modules/escape-goat/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/normalize-url/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/dateformat/LICENSE;md5=3Da57a36c7c=
438edd461693e4afcc2377c \
+                    file://node_modules/arrify/license;md5=3D915042b5df33c=
31a6db2b37eadaa00e3 \
+                    file://node_modules/mute-stream/LICENSE;md5=3D82703a69=
f6d7411dde679954c2fd9dca \
+                    file://node_modules/content-disposition/LICENSE;md5=3D=
13babc4f212ce635d68da544339c962b \
+                    file://node_modules/is-unicode-supported/license;md5=
=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/oauth2orize/LICENSE;md5=3D6392ca87=
973f3c4bfd78b7cd812e289a \
+                    file://node_modules/should/LICENSE;md5=3Df623b23bfa4e6=
df5d05de8639b8fc05b \
+                    file://node_modules/resolve-alpn/LICENSE;md5=3Df3d086f=
7c83cdc609b9f5d6057d7c1e4 \
+                    file://node_modules/strip-json-comments/license;md5=3D=
d5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/are-we-there-yet/LICENSE.md;md5=3D=
1750b360daee1aa920366e344c1b0c57 \
+                    file://node_modules/object.map/LICENSE;md5=3D62ea55494=
2f7592db55834ba4499798b \
+                    file://node_modules/reinterval/LICENSE;md5=3Dc65ef22a3=
86436c433298ca42418c200 \
+                    file://node_modules/passport/LICENSE;md5=3Da632f82c0ee=
b821949115ede725c2326 \
+                    file://node_modules/parse-json/license;md5=3Dd5f2a6dd0=
192dcc7c833e50bb9017337 \
+                    file://node_modules/path-is-absolute/license;md5=3Da12=
ebca0510a773644101a99a867d210 \
+                    file://node_modules/cross-spawn/LICENSE;md5=3D6046ffd2=
c9edcd9052bb4dd794d12f95 \
+                    file://node_modules/detect-file/LICENSE;md5=3Daa4dcde4=
017ea222442bc37c2dacb36b \
+                    file://node_modules/stream-connect/LICENSE;md5=3Dcd95b=
e2d70b882f88af300a7dd2d3663 \
+                    file://node_modules/stream-connect/node_modules/array-=
back/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/is-core-module/LICENSE;md5=3D02b0f=
b5ff4014a08fd4193bc3e2349e2 \
+                    file://node_modules/key-list/LICENSE;md5=3D7736132281d=
49e0e85ed45724718e614 \
+                    file://node_modules/decompress-response/license;md5=3D=
d5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/decompress-response/node_modules/m=
imic-response/license;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/type-fest/license;md5=3D915042b5df=
33c31a6db2b37eadaa00e3 \
+                    file://node_modules/got/license;md5=3D915042b5df33c31a=
6db2b37eadaa00e3 \
+                    file://node_modules/yargs-parser/LICENSE.txt;md5=3D8fd=
106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/archy/LICENSE;md5=3Daea1cde69645f4=
b99be4ff7ca9abcce1 \
+                    file://node_modules/ipaddr.js/LICENSE;md5=3D88f60a4b6e=
44cb849b5d907a7664c0ef \
+                    file://node_modules/bl/LICENSE.md;md5=3D455bc3781a009c=
f9a615e8622138814c \
+                    file://node_modules/body/LICENCE;md5=3D8966d3100f2d871=
ee216d056c0ea0160 \
+                    file://node_modules/body/node_modules/string_decoder/L=
ICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/make-dir/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/make-dir/node_modules/semver/LICEN=
SE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/sax/LICENSE;md5=3D326d5674181c4bb2=
10e424772c60fa80 \
+                    file://node_modules/acorn-walk/LICENSE;md5=3D33e8b86a0=
84578431a31c72608f226b8 \
+                    file://node_modules/busboy/LICENSE;md5=3Ddf3ad145c2acb=
fc4f246fa834a6675c7 \
+                    file://node_modules/busboy/node_modules/string_decoder=
/LICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/busboy/node_modules/readable-strea=
m/LICENSE;md5=3Dd7351a4fc8e956f1a68413490d5e655e \
+                    file://node_modules/parse5/LICENSE;md5=3D179850e04995d=
6fceaf64f2dd2a851b0 \
+                    file://node_modules/type-is/LICENSE;md5=3D0afd201e48c7=
d095454eed4ac1184e40 \
+                    file://node_modules/type-is/node_modules/media-typer/L=
ICENSE;md5=3Dc6e0ce1e688c5ff16db06b7259e9cd20 \
+                    file://node_modules/memorystore/LICENSE;md5=3D3c97a7f1=
928df131f083f488a42c41b7 \
+                    file://node_modules/memorystore/node_modules/debug/LIC=
ENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/memorystore/node_modules/ms/licens=
e.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/chownr/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/forwarded/LICENSE;md5=3D13babc4f21=
2ce635d68da544339c962b \
+                    file://node_modules/stream-buffers/UNLICENSE;md5=3D1d2=
67ceb3a8d8f75f1be3011ee4cbf53 \
+                    file://node_modules/crypto-random-string/license;md5=
=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/requizzle/LICENSE;md5=3D154fe2301b=
7d94bf03c6fe51237a21d4 \
+                    file://node_modules/pump/LICENSE;md5=3D9befe7026bf9158=
86cd566a98117c80e \
+                    file://node_modules/buffer-from/LICENSE;md5=3D46513463=
e8f7d9eb671a243f0083b2c6 \
+                    file://node_modules/@mapbox/node-pre-gyp/LICENSE;md5=
=3D7e13c3cf883a44ebcc74a8f568c0f6fb \
+                    file://node_modules/set-blocking/LICENSE.txt;md5=3D8fd=
106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/emoji-regex/LICENSE-MIT.txt;md5=3D=
ee9bd8b835cfcd512dd644540dd96987 \
+                    file://node_modules/global-modules/LICENSE;md5=3D78c70=
5080a639d3bb4085a9d1bb22987 \
+                    file://node_modules/safer-buffer/LICENSE;md5=3D3baebc2=
a17b8f5bff04882cd0dc0f76e \
+                    file://node_modules/signal-exit/LICENSE.txt;md5=3De29e=
20260a1c78dba16a233048565cde \
+                    file://node_modules/commondir/LICENSE;md5=3D31f6d70a3b=
756797901b2aff55cc7d7a \
+                    file://node_modules/readdirp/LICENSE;md5=3Dd982124c58b=
759403329f9c0906aae7a \
+                    file://node_modules/for-in/LICENSE;md5=3Dc8f80ed52c907=
4414e8a69541cdc1587 \
+                    file://node_modules/pstree.remy/LICENSE;md5=3Dc15dc8a0=
a85bbb8b3a15fd0879f9c365 \
+                    file://node_modules/isobject/LICENSE;md5=3D2f5638b0557=
426da0c3bd67e00a0ebde \
+                    file://node_modules/ansi-align/LICENSE;md5=3D42624e59b=
d3dabedcca59e1b54e3af50 \
+                    file://node_modules/global-prefix/LICENSE;md5=3D78c705=
080a639d3bb4085a9d1bb22987 \
+                    file://node_modules/global-prefix/node_modules/ini/LIC=
ENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/global-prefix/node_modules/which/L=
ICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/lodash.camelcase/LICENSE;md5=3Da3b=
2b7770df62392c164de4001b59f8f \
+                    file://node_modules/ini/LICENSE;md5=3D82703a69f6d7411d=
de679954c2fd9dca \
+                    file://node_modules/array-slice/LICENSE;md5=3D3d83ea4c=
8ec9b31d9ff2c82fa29beabb \
+                    file://node_modules/make-iterator/LICENSE;md5=3Dccdc09=
59f67943eb090f7e7c299621af \
+                    file://node_modules/is-typedarray/LICENSE.md;md5=3Daea=
1cde69645f4b99be4ff7ca9abcce1 \
+                    file://node_modules/jsesc/LICENSE-MIT.txt;md5=3Dee9bd8=
b835cfcd512dd644540dd96987 \
+                    file://node_modules/htmlparser2/LICENSE;md5=3D10e03952=
c97f225d4229d7524619eb7f \
+                    file://node_modules/merge-descriptors/LICENSE;md5=3Daa=
f57ba8c5c9bf256fea7e943991a81a \
+                    file://node_modules/string_decoder/LICENSE;md5=3D14af5=
1f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/string_decoder/node_modules/safe-b=
uffer/LICENSE;md5=3Dbadd5e91c737e7ffdf10b40c1f907761 \
+                    file://node_modules/resolve-dir/LICENSE;md5=3D8a4b0e5f=
d41b2cf9072913a284384998 \
+                    file://node_modules/jsonfile/LICENSE;md5=3D423f377ade9=
5936f6fe009b1c137bfdb \
+                    file://node_modules/which-module/LICENSE;md5=3D42624e5=
9bd3dabedcca59e1b54e3af50 \
+                    file://node_modules/passport-http-bearer/LICENSE;md5=
=3Df694b9c022a5bf0f2c3976a047fed39c \
+                    file://node_modules/basic-auth-parser/LICENSE;md5=3Dda=
94a2bc313c830fb7edd22f43f84cc9 \
+                    file://node_modules/package-hash/LICENSE;md5=3D9b7c9c0=
f77f387fcc0027b4b35aeca6f \
+                    file://node_modules/picomatch/LICENSE;md5=3Dabd0e25891=
525eb13d5a794f550a6ee4 \
+                    file://node_modules/on-headers/LICENSE;md5=3Dc6e0ce1e6=
88c5ff16db06b7259e9cd20 \
+                    file://node_modules/grunt-contrib-copy/node_modules/an=
si-styles/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-copy/node_modules/an=
si-regex/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-copy/node_modules/es=
cape-string-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-copy/node_modules/st=
rip-ansi/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-copy/node_modules/ch=
alk/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-copy/node_modules/su=
pports-color/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/tar/LICENSE;md5=3D82703a69f6d7411d=
de679954c2fd9dca \
+                    file://node_modules/tar/node_modules/yallist/LICENSE;m=
d5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/p-cancelable/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/lodash.pick/LICENSE;md5=3Da3b2b777=
0df62392c164de4001b59f8f \
+                    file://node_modules/proxy-addr/LICENSE;md5=3D6e8686b7b=
13dd7ac8733645a81842c4a \
+                    file://node_modules/object-get/LICENSE;md5=3Dfc20ee584=
9f94fb5da737859f9226d5a \
+                    file://node_modules/binary-extensions/license;md5=3Dda=
0684b7c90dcea9333d6517f4fbda22 \
+                    file://node_modules/wordwrapjs/LICENSE;md5=3D2613420a3=
157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/wordwrapjs/node_modules/reduce-fla=
tten/LICENSE;md5=3D89b0669afc8c7ddb483a7cab7860548e \
+                    file://node_modules/semver-diff/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/semver-diff/node_modules/semver/LI=
CENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/uri-js/LICENSE;md5=3D3b55dad4a9874=
8003b5b423477713da1 \
+                    file://node_modules/handlebars/LICENSE;md5=3D99f14a0ee=
149e3c9d7b9a335d73c908f \
+                    file://node_modules/handlebars/node_modules/source-map=
/LICENSE;md5=3Db1ca6dbc0075d56cbd9931a75566cd44 \
+                    file://node_modules/has-ansi/license;md5=3Da12ebca0510=
a773644101a99a867d210 \
+                    file://node_modules/has-ansi/node_modules/ansi-regex/l=
icense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/which/LICENSE;md5=3D82703a69f6d741=
1dde679954c2fd9dca \
+                    file://node_modules/exit-on-epipe/LICENSE;md5=3D6ce114=
9091029627236c6a2e5f9fd157 \
+                    file://node_modules/reduce-unique/LICENSE;md5=3D95edf7=
c0a797611a9e08a8d85e793d01 \
+                    file://node_modules/uuid/LICENSE.md;md5=3D353e680cdafd=
96bf30131cbb7b14a6e8 \
+                    file://node_modules/append-transform/license;md5=3D289=
129afe2c8d393c7a535bcdcbddb86 \
+                    file://node_modules/@babel/types/LICENSE;md5=3Db1d0cd2=
83a346e919abb3beeb018279d \
+                    file://node_modules/@babel/helper-validator-identifier=
/LICENSE;md5=3Db1d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/helper-function-name/LICENS=
E;md5=3Db1d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/helper-get-function-arity/L=
ICENSE;md5=3Db1d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/helper-split-export-declara=
tion/LICENSE;md5=3Db1d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/code-frame/LICENSE;md5=3Db1=
d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/template/LICENSE;md5=3Db1d0=
cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/parser/LICENSE;md5=3D3b324a=
f8e79986f4a5621efa85dd1292 \
+                    file://node_modules/@babel/traverse/LICENSE;md5=3Db1d0=
cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/traverse/node_modules/debug=
/LICENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/@babel/traverse/node_modules/ms/li=
cense.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/@babel/generator/LICENSE;md5=3Db1d=
0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/runtime/LICENSE;md5=3Db1d0c=
d283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/helper-hoist-variables/LICE=
NSE;md5=3Db1d0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/highlight/LICENSE;md5=3Db1d=
0cd283a346e919abb3beeb018279d \
+                    file://node_modules/@babel/highlight/node_modules/ansi=
-styles/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/@babel/highlight/node_modules/esca=
pe-string-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/@babel/highlight/node_modules/colo=
r-name/LICENSE;md5=3Dd301869b39e08b33665b7c4f16b8e41d \
+                    file://node_modules/@babel/highlight/node_modules/chal=
k/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/@babel/highlight/node_modules/supp=
orts-color/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/@babel/highlight/node_modules/colo=
r-convert/LICENSE;md5=3D9bdadfc9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/@babel/highlight/node_modules/has-=
flag/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/vary/LICENSE;md5=3D13babc4f212ce63=
5d68da544339c962b \
+                    file://node_modules/depd/LICENSE;md5=3D13babc4f212ce63=
5d68da544339c962b \
+                    file://node_modules/grunt-sass/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/lowercase-keys/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/require-from-string/license;md5=3D=
be72c3ad86c1c4e9578a1945b082b17d \
+                    file://node_modules/dompurify/LICENSE;md5=3D0c419ae0ef=
32e42c7f620d5d2cac30aa \
+                    file://node_modules/has-yarn/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/cheerio-select/LICENSE;md5=3Dd5b9c=
b3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/find-replace/LICENSE;md5=3D15a318b=
c4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/find-replace/node_modules/array-ba=
ck/LICENSE;md5=3D15a318bc4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/mri/license.md;md5=3D75a8a6449fca3=
9883a2bcfd1d6ddac5a \
+                    file://node_modules/responselike/LICENSE;md5=3Debe53e6=
698981352da17c09ed915f13f \
+                    file://node_modules/release-zalgo/LICENSE;md5=3Dc2b237=
a3430a82027ddcc4c80ee5686c \
+                    file://node_modules/map-cache/LICENSE;md5=3Da0bd3ad96a=
d6f399ce73b75ce8332105 \
+                    file://node_modules/array-back/LICENSE;md5=3Dbc64ddbdc=
f97f5c6ca534ca7b979918a \
+                    file://node_modules/jshint/LICENSE;md5=3D4e19041df56fb=
b7a49fb87c4322d5849 \
+                    file://node_modules/jshint/node_modules/strip-json-com=
ments/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/jshint/node_modules/htmlparser2/LI=
CENSE;md5=3D10e03952c97f225d4229d7524619eb7f \
+                    file://node_modules/jshint/node_modules/string_decoder=
/LICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/jshint/node_modules/domelementtype=
/LICENSE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/jshint/node_modules/shelljs/LICENS=
E;md5=3D4d534bba3a94c8be6a9e37265197d453 \
+                    file://node_modules/jshint/node_modules/domhandler/LIC=
ENSE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/jshint/node_modules/entities/LICEN=
SE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/jshint/node_modules/dom-serializer=
/LICENSE;md5=3Dba3390a22fe1d127f3522ac8ef1bd1a0 \
+                    file://node_modules/jshint/node_modules/dom-serializer=
/node_modules/domelementtype/LICENSE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11=
 \
+                    file://node_modules/jshint/node_modules/dom-serializer=
/node_modules/entities/LICENSE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/jshint/node_modules/domutils/LICEN=
SE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/jshint/node_modules/readable-strea=
m/LICENSE;md5=3Dd7351a4fc8e956f1a68413490d5e655e \
+                    file://node_modules/base64-js/LICENSE;md5=3Dea9187ca93=
cdc4f71219d1675712e908 \
+                    file://node_modules/catharsis/LICENSE;md5=3D9063ac7c9d=
c4b913974adad5dac6691e \
+                    file://node_modules/iconv-lite/LICENSE;md5=3Df942263d9=
8f0d75e0e0101884e86261d \
+                    file://node_modules/fs-constants/LICENSE;md5=3D0033175=
ba371b569c73d23fd726c37e8 \
+                    file://node_modules/object-inspect/LICENSE;md5=3D28816=
2f1d1bfa064f127f2b42d2a656f \
+                    file://node_modules/i18next/LICENSE;md5=3D3eff6c8f85f3=
d254cc65be1f1a47d81f \
+                    file://node_modules/cli-boxes/license;md5=3Dd5f2a6dd01=
92dcc7c833e50bb9017337 \
+                    file://node_modules/default-require-extensions/license=
;md5=3D8819fc3eba8c00f25673f0e4fcbbc2cb \
+                    file://node_modules/lodash.union/LICENSE;md5=3Da3b2b77=
70df62392c164de4001b59f8f \
+                    file://node_modules/uc.micro/LICENSE.txt;md5=3Dee9bd8b=
835cfcd512dd644540dd96987 \
+                    file://node_modules/nyc/LICENSE.txt;md5=3D16ee39fb47fe=
f70c573a1941c6ff2968 \
+                    file://node_modules/nyc/node_modules/path-exists/licen=
se;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/nyc/node_modules/decamelize/licens=
e;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/nyc/node_modules/yargs-parser/LICE=
NSE.txt;md5=3D8fd106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/nyc/node_modules/make-dir/license;=
md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/emoji-regex/LICEN=
SE-MIT.txt;md5=3Dee9bd8b835cfcd512dd644540dd96987 \
+                    file://node_modules/nyc/node_modules/uuid/LICENSE.md;m=
d5=3Dc9420736e23afb538ba5fbe44197f0b4 \
+                    file://node_modules/nyc/node_modules/find-up/license;m=
d5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/semver/LICENSE;md=
5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/nyc/node_modules/string-width/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/p-locate/license;=
md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/p-limit/license;m=
d5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/ansi-styles/licen=
se;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/ansi-regex/licens=
e;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/cliui/LICENSE.txt=
;md5=3D83623193d3051ca8068a89a455c699ca \
+                    file://node_modules/nyc/node_modules/strip-ansi/licens=
e;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/color-name/LICENS=
E;md5=3Dd301869b39e08b33665b7c4f16b8e41d \
+                    file://node_modules/nyc/node_modules/yargs/LICENSE;md5=
=3Dbecfe5b407a6b8b768960384631232c9 \
+                    file://node_modules/nyc/node_modules/locate-path/licen=
se;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/wrap-ansi/license=
;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nyc/node_modules/is-fullwidth-code=
-point/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/nyc/node_modules/color-convert/LIC=
ENSE;md5=3D9bdadfc9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/nyc/node_modules/y18n/LICENSE;md5=
=3D55e5f88040679148136545002139a8b1 \
+                    file://node_modules/nyc/node_modules/rimraf/LICENSE;md=
5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/cp-file/license;md5=3D915042b5df33=
c31a6db2b37eadaa00e3 \
+                    file://node_modules/cp-file/node_modules/make-dir/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/cp-file/node_modules/semver/LICENS=
E;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/grunt-legacy-util/LICENSE-MIT;md5=
=3Dccd4d932a9c483a13bc4d229776d4608 \
+                    file://node_modules/grunt-legacy-util/node_modules/asy=
nc/LICENSE;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/fs.realpath/LICENSE;md5=3D06247052=
5c8e380f8567f665ef554d11 \
+                    file://node_modules/xdg-basedir/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/livereload-js/LICENSE;md5=3D655b28=
541e17243ef2bb0708efbc9660 \
+                    file://node_modules/through2/LICENSE.md;md5=3D86fc40a9=
2fe89e4ec72daa6fab2f9c21 \
+                    file://node_modules/through2/node_modules/string_decod=
er/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/through2/node_modules/readable-str=
eam/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/form-data/License;md5=3D7aa505292e=
2636a9e59d4d3f258f4819 \
+                    file://node_modules/kind-of/LICENSE;md5=3D3d83ea4c8ec9=
b31d9ff2c82fa29beabb \
+                    file://node_modules/duplexer/LICENCE;md5=3D8966d3100f2=
d871ee216d056c0ea0160 \
+                    file://node_modules/fast-safe-stringify/LICENSE;md5=3D=
d06834a8b49bbad54ea80bd501ce4bdc \
+                    file://node_modules/has-symbols/LICENSE;md5=3Dafee57a2=
89508ed4df3456667778aaf6 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
ansi-styles/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
escape-string-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
color-name/LICENSE;md5=3Dd301869b39e08b33665b7c4f16b8e41d \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
chalk/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
supports-color/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
color-convert/LICENSE;md5=3D9bdadfc9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/grunt-contrib-uglify/node_modules/=
has-flag/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/qs/LICENSE;md5=3Dd5c7c6dc45a33a0a9=
620ed81315672d7 \
+                    file://node_modules/find-up/license;md5=3Dd5f2a6dd0192=
dcc7c833e50bb9017337 \
+                    file://node_modules/anymatch/LICENSE;md5=3D12cd52ddd05=
803f07238d49743e68e37 \
+                    file://node_modules/ci-info/LICENSE;md5=3D0c6fa9c682ce=
05a9a4da4f4a96cf42ec \
+                    file://node_modules/has/LICENSE-MIT;md5=3Dd000afc3c9ff=
3501a5610197db76a246 \
+                    file://node_modules/json-parse-better-errors/LICENSE.m=
d;md5=3D048cc2006d506256349ca6088641486b \
+                    file://node_modules/http-errors/LICENSE;md5=3D60720962=
3abfcc77b9098f71a0ef52f9 \
+                    file://node_modules/http-errors/node_modules/inherits/=
LICENSE;md5=3D5b2ef2247af6d355ae9d9f988092d470 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
ansi-styles/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
ansi-regex/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
escape-string-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
strip-ansi/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
chalk/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-concat/node_modules/=
supports-color/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/http-parser-js/LICENSE.md;md5=3D60=
032084d2dab2aac11aed18f4861771 \
+                    file://node_modules/figures/license;md5=3Da12ebca0510a=
773644101a99a867d210 \
+                    file://node_modules/figures/node_modules/escape-string=
-regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/cookiejar/LICENSE;md5=3Ddd627a90bb=
622a86c4b81863f55ae23d \
+                    file://node_modules/express/LICENSE;md5=3D5513c00a5c36=
cd361da863dd9aa8875d \
+                    file://node_modules/express/node_modules/cookie/LICENS=
E;md5=3Dbc85b43b6f963e8ab3f88e63628448ca \
+                    file://node_modules/object.defaults/LICENSE;md5=3Da9f6=
06f2e3822130012aab1f9c6ed213 \
+                    file://node_modules/mkdirp/LICENSE;md5=3Df653359cc2be3=
ff55aa601d58d84c808 \
+                    file://node_modules/camelcase/license;md5=3D915042b5df=
33c31a6db2b37eadaa00e3 \
+                    file://node_modules/fast-deep-equal/LICENSE;md5=3Dea87=
ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/help-me/LICENSE;md5=3D6c5e18034ed4=
abefcb9ac97254596680 \
+                    file://node_modules/fs-extra/LICENSE;md5=3Dea817882455=
c03503f7d014a8f54f095 \
+                    file://node_modules/path-root-regex/LICENSE;md5=3Dd4f3=
6f2681729e3ad311515c316b42ff \
+                    file://node_modules/psl/LICENSE;md5=3D2425d288296fae32=
e27553694ff40294 \
+                    file://node_modules/grunt-jsonlint/LICENSE-MIT;md5=3D0=
04888afab822b17c0e370df931577b0 \
+                    file://node_modules/crc-32/LICENSE;md5=3Dfe5367bf1b5a0=
2e4baacc2567f485bf6 \
+                    file://node_modules/buffer-crc32/LICENSE;md5=3Db27a845=
c0955487ec9ca7b4ff7295b2b \
+                    file://node_modules/grunt/LICENSE;md5=3D5c3a0fc1d25b92=
e82995c0baf70f6f1f \
+                    file://node_modules/grunt/node_modules/iconv-lite/LICE=
NSE;md5=3Df942263d98f0d75e0e0101884e86261d \
+                    file://node_modules/grunt/node_modules/nopt/LICENSE;md=
5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/find-cache-dir/license;md5=3D8195d=
8f796dcc7c47fb602e26a78d6cb \
+                    file://node_modules/find-cache-dir/node_modules/make-d=
ir/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/find-cache-dir/node_modules/semver=
/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/domelementtype/LICENSE;md5=3Dd5b9c=
b3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/grunt-legacy-log/LICENSE-MIT;md5=
=3D15b8c41863be1507d1b155ab783dd621 \
+                    file://node_modules/registry-auth-token/LICENSE;md5=3D=
7b1df94b672916450d194cf7a8bd0e2d \
+                    file://node_modules/once/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/nopt/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/resolve/LICENSE;md5=3Dbaa47288b5bd=
3e657a01886ce3dd0cb6 \
+                    file://node_modules/jsdoc-parse/LICENSE.md;md5=3Dcc691=
b00068be9f59d2ad75882f133b3 \
+                    file://node_modules/esprima/LICENSE.BSD;md5=3De3c825c9=
32a984958bafbac21e21f984 \
+                    file://node_modules/import-lazy/license;md5=3Da12ebca0=
510a773644101a99a867d210 \
+                    file://node_modules/expand-tilde/LICENSE;md5=3Da0bd3ad=
96ad6f399ce73b75ce8332105 \
+                    file://node_modules/semver/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/semver/node_modules/yallist/LICENS=
E;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/semver/node_modules/lru-cache/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/passport-strategy/LICENSE;md5=3Df6=
94b9c022a5bf0f2c3976a047fed39c \
+                    file://node_modules/command-line-tool/LICENSE;md5=3Dc1=
d0f392d6113887beeee9e0de58693f \
+                    file://node_modules/command-line-tool/node_modules/arr=
ay-back/LICENSE;md5=3D2613420a3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/interpret/LICENSE;md5=3D976108e041=
d95aec03ec5c4246bad937 \
+                    file://node_modules/istanbul-reports/LICENSE;md5=3D716=
b8ca15fee2be15af13159d0890c56 \
+                    file://node_modules/concat-map/LICENSE;md5=3Daea1cde69=
645f4b99be4ff7ca9abcce1 \
+                    file://node_modules/escalade/license;md5=3D1cb46128f91=
146188c0ded3a1c6144f3 \
+                    file://node_modules/setprototypeof/LICENSE;md5=3D4846f=
1626304c2c0f806a539bbc7d54a \
+                    file://node_modules/uid-safe/LICENSE;md5=3D6a3e6caad27=
80f696f4884e98789e866 \
+                    file://node_modules/cacheable-request/LICENSE;md5=3D9a=
2baa6947d5018096b83508bd94026e \
+                    file://node_modules/string-width/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/p-locate/license;md5=3Dd5f2a6dd019=
2dcc7c833e50bb9017337 \
+                    file://node_modules/css-what/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/get-caller-file/LICENSE.md;md5=3Dd=
21aa422a43e9693d50143d612b58967 \
+                    file://node_modules/is-relative/LICENSE;md5=3D3d83ea4c=
8ec9b31d9ff2c82fa29beabb \
+                    file://node_modules/send/LICENSE;md5=3Ddf2b0938eba0709=
b77ac937e2d552b7a \
+                    file://node_modules/send/node_modules/mime/LICENSE;md5=
=3D8e8ea2ad138ce468f8570a0edbadea65 \
+                    file://node_modules/send/node_modules/ms/license.md;md=
5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/path-root/LICENSE;md5=3Dd4f36f2681=
729e3ad311515c316b42ff \
+                    file://node_modules/media-typer/LICENSE;md5=3D13babc4f=
212ce635d68da544339c962b \
+                    file://node_modules/diff/LICENSE;md5=3De6f0309f3f9919c=
d96cc45a4d4859c54 \
+                    file://node_modules/is-extglob/LICENSE;md5=3D97b255bb4=
707da164bfaf4e5c7b9f9ef \
+                    file://node_modules/tslib/CopyrightNotice.txt;md5=3D36=
b68802c0e2531ae0fe6cd30619652a \
+                    file://node_modules/tslib/LICENSE.txt;md5=3Df938d99cba=
29007eeae26d80a9a4cfa6 \
+                    file://node_modules/date-now/LICENCE;md5=3Dd91e9f173d4=
b3af83019acabd84f997e \
+                    file://node_modules/just-extend/LICENSE;md5=3D9a101e54=
3aed27cd8558f6376292442e \
+                    file://node_modules/component-emitter/LICENSE;md5=3Dee=
4aea2d350b7bdbf93e14297dcdd8a2 \
+                    file://node_modules/utils-merge/LICENSE;md5=3D1cf09060=
82187f374cb9a63c54eb782c \
+                    file://node_modules/p-limit/license;md5=3Dd5f2a6dd0192=
dcc7c833e50bb9017337 \
+                    file://node_modules/ansi-styles/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/etag/LICENSE;md5=3D6e8686b7b13dd7a=
c8733645a81842c4a \
+                    file://node_modules/denque/LICENSE;md5=3Df49b524d140e2=
dcf1b437d9185172531 \
+                    file://node_modules/lodash.flattendeep/LICENSE;md5=3Da=
3b2b7770df62392c164de4001b59f8f \
+                    file://node_modules/delayed-stream/License;md5=3D5270b=
4ddb6700d0a820e6d066744589c \
+                    file://node_modules/istanbul-lib-report/LICENSE;md5=3D=
716b8ca15fee2be15af13159d0890c56 \
+                    file://node_modules/istanbul-lib-report/node_modules/m=
ake-dir/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/istanbul-lib-report/node_modules/s=
emver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/istanbul-lib-report/node_modules/s=
upports-color/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/istanbul-lib-report/node_modules/h=
as-flag/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/object-to-spawn-args/LICENSE;md5=
=3Dcc691b00068be9f59d2ad75882f133b3 \
+                    file://node_modules/mimic-response/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/yallist/LICENSE;md5=3D82703a69f6d7=
411dde679954c2fd9dca \
+                    file://node_modules/normalize-path/LICENSE;md5=3Dccdc0=
959f67943eb090f7e7c299621af \
+                    file://node_modules/he/LICENSE-MIT.txt;md5=3Dee9bd8b83=
5cfcd512dd644540dd96987 \
+                    file://node_modules/punycode/LICENSE-MIT.txt;md5=3Dee9=
bd8b835cfcd512dd644540dd96987 \
+                    file://node_modules/delegates/License;md5=3D039225978c=
07bc42e8c0ef2f72b81c09 \
+                    file://node_modules/ansi-regex/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/yargs-unparser/LICENSE;md5=3Df03c6=
ef2061d80f2064e17c8117e63a0 \
+                    file://node_modules/yargs-unparser/node_modules/camelc=
ase/license;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/globals/license;md5=3D915042b5df33=
c31a6db2b37eadaa00e3 \
+                    file://node_modules/encodeurl/LICENSE;md5=3D272621efa0=
ff4f18a73221e49ab60654 \
+                    file://node_modules/hpagent/LICENSE;md5=3D6b1a33a7ee2b=
aee18174a3db1ec2138f \
+                    file://node_modules/end-of-stream/LICENSE;md5=3D9befe7=
026bf915886cd566a98117c80e \
+                    file://node_modules/has-unicode/LICENSE;md5=3D2bab5b1c=
26e9c44fc4e489bb98cfb196 \
+                    file://node_modules/stream-shift/LICENSE;md5=3D4201401=
0547e55bd3bcac2fec8c45624 \
+                    file://node_modules/@prantlf/jsonlint/LICENSE;md5=3D79=
3061c20f57b93ac09c954c05040857 \
+                    file://node_modules/@prantlf/jsonlint/node_modules/fas=
t-deep-equal/LICENSE;md5=3Dea87ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/@prantlf/jsonlint/node_modules/jso=
n-schema-traverse/LICENSE;md5=3Dea87ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/@prantlf/jsonlint/node_modules/ajv=
/LICENSE;md5=3D4973982316cdc12e988b814af2813df7 \
+                    file://node_modules/pumpify/LICENSE;md5=3D9befe7026bf9=
15886cd566a98117c80e \
+                    file://node_modules/pumpify/node_modules/pump/LICENSE;=
md5=3D9befe7026bf915886cd566a98117c80e \
+                    file://node_modules/pumpify/node_modules/string_decode=
r/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/pumpify/node_modules/duplexify/LIC=
ENSE;md5=3D9befe7026bf915886cd566a98117c80e \
+                    file://node_modules/pumpify/node_modules/readable-stre=
am/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/marked/LICENSE.md;md5=3D63067ac27c=
0f658572e4798649c2ef4a \
+                    file://node_modules/nested-error-stacks/LICENSE;md5=3D=
6c265ae5e7946b8ebc7103738288d6df \
+                    file://node_modules/nanoid/LICENSE;md5=3D237c21016e56a=
1ee4475a39fc00d1504 \
+                    file://node_modules/ignore-by-default/LICENSE;md5=3D16=
2a5ab16770dc811d62c9dcb10e8a77 \
+                    file://node_modules/axios/LICENSE;md5=3D61ca8e74b70ea1=
9443b95af4bd607999 \
+                    file://node_modules/mime-types/LICENSE;md5=3Dbf1f9ad1e=
2e1d507aef4883fff7103de \
+                    file://node_modules/is-plain-obj/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-value/LICENSE;md5=3Dc1d0f392d=
6113887beeee9e0de58693f \
+                    file://node_modules/test-value/node_modules/array-back=
/LICENSE;md5=3D2613420a3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/configstore/license;md5=3D2838f6ac=
c24e1d83ccb791d68f311c29 \
+                    file://node_modules/configstore/node_modules/write-fil=
e-atomic/LICENSE;md5=3D68705ba56afdf6710c9187ed9a9cdd03 \
+                    file://node_modules/fined/LICENSE;md5=3D0e3fd3bc075aa8=
679de16c734bc34198 \
+                    file://node_modules/istanbul-lib-hook/LICENSE;md5=3D71=
6b8ca15fee2be15af13159d0890c56 \
+                    file://node_modules/cli-table/LICENSE;md5=3D7426c3e07c=
d555a7113d8e4740f8bf6a \
+                    file://node_modules/cli-table/node_modules/colors/MIT-=
LICENSE.txt;md5=3D5bc6c72caa0dcc082d24a52a6ae12112 \
+                    file://node_modules/randombytes/LICENSE;md5=3D43fa85ce=
b75821d9968f69be10da7623 \
+                    file://node_modules/mime/LICENSE;md5=3D8e8ea2ad138ce46=
8f8570a0edbadea65 \
+                    file://node_modules/hooker/LICENSE-MIT;md5=3Dcd468da85=
ddf24f7058f599c2d3fac98 \
+                    file://node_modules/liftup/LICENSE;md5=3D976108e041d95=
aec03ec5c4246bad937 \
+                    file://node_modules/liftup/node_modules/findup-sync/LI=
CENSE;md5=3D3a438d3755bd6f94b7bd674a2516107d \
+                    file://node_modules/is-stream/license;md5=3Da12ebca051=
0a773644101a99a867d210 \
+                    file://node_modules/grunt-contrib-clean/node_modules/a=
sync/LICENSE;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/grunt-contrib-clean/node_modules/r=
imraf/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/methods/LICENSE;md5=3Dc16a7dd9f946=
172f07086576d135d9d3 \
+                    file://node_modules/ieee754/LICENSE;md5=3D56c3be003027=
d64d24ca6b69a2612f2f \
+                    file://node_modules/dot-prop/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/lodash/LICENSE;md5=3D8e2fca844c70b=
3833d7228885447c026 \
+                    file://node_modules/rc/LICENSE.APACHE2;md5=3Dffcf739dc=
a268cb0f20336d6c1a038f1 \
+                    file://node_modules/rc/LICENSE.BSD;md5=3De7a2a325a0069=
e82aff675bbf74464a0 \
+                    file://node_modules/rc/LICENSE.MIT;md5=3De0f70a42adf52=
6e6f5e605a94d98a420 \
+                    file://node_modules/rc/node_modules/strip-json-comment=
s/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/rc/node_modules/ini/LICENSE;md5=3D=
82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/async/LICENSE;md5=3D64a378b2b01424=
fe22d54bc626175994 \
+                    file://node_modules/url-parse-lax/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/mocha/LICENSE;md5=3D9aea0c9dc24e8e=
8272abaab5bf35fec0 \
+                    file://node_modules/mocha/node_modules/escape-string-r=
egexp/license;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/mocha/node_modules/debug/LICENSE;m=
d5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/mocha/node_modules/debug/node_modu=
les/ms/license.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/mocha/node_modules/supports-color/=
license;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/mocha/node_modules/ms/license.md;m=
d5=3D2b8bc52ae6b7ba58e1629deabd53986f \
+                    file://node_modules/mocha/node_modules/js-yaml/LICENSE=
;md5=3Deffd621a9bf5d72d6a7e6ef819bf3afb \
+                    file://node_modules/mocha/node_modules/argparse/LICENS=
E;md5=3D203a6dbc802ee896020a47161e759642 \
+                    file://node_modules/toidentifier/LICENSE;md5=3D1a26107=
1a044d02eb6f2bb47f51a3502 \
+                    file://node_modules/exit/LICENSE-MIT;md5=3D159111132f8=
7941857a4f42d60c880c8 \
+                    file://node_modules/is-unc-path/LICENSE;md5=3D78c70508=
0a639d3bb4085a9d1bb22987 \
+                    file://node_modules/is-npm/license;md5=3Dd5f2a6dd0192d=
cc7c833e50bb9017337 \
+                    file://node_modules/underscore/LICENSE;md5=3D4886e1b09=
03301009cfebb33ee4981da \
+                    file://node_modules/js-tokens/LICENSE;md5=3D1d63bea73a=
26ffaf5e964ce74d3b83a5 \
+                    file://node_modules/node-addon-api/LICENSE.md;md5=3D04=
92ef29a9d558a3e9660e7accc9ca6a \
+                    file://node_modules/sass/LICENSE;md5=3Dbf0a54d2f82d71d=
dd96a1bab4743b8fc \
+                    file://node_modules/fs-then-native/LICENSE;md5=3D9fb79=
ae9c55b92e51d4d77f6f7345f1d \
+                    file://node_modules/grunt-concurrent/license;md5=3D915=
042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/grunt-concurrent/node_modules/asyn=
c/LICENSE;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/cheerio/LICENSE;md5=3D476b79500345=
6b2ff8c5a905d5829955 \
+                    file://node_modules/on-finished/LICENSE;md5=3D1b1f7f9c=
ec194121fdf616b971df7a7b \
+                    file://node_modules/jsdoc/Apache_License_2.0.txt;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://node_modules/jsdoc/LICENSE.md;md5=3Dc3d9320133c=
9682c5a17fc24ee53c791 \
+                    file://node_modules/jsdoc/node_modules/marked/LICENSE.=
md;md5=3D63067ac27c0f658572e4798649c2ef4a \
+                    file://node_modules/jsdoc/templates/default/static/scr=
ipts/prettify/Apache-License-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
+                    file://node_modules/commander/LICENSE;md5=3D25851d4d10=
d6611a12d5571dab945a00 \
+                    file://node_modules/walk-back/LICENSE;md5=3Dbc64ddbdcf=
97f5c6ca534ca7b979918a \
+                    file://node_modules/multer/LICENSE;md5=3D0395802799233=
34e9eaeb656c54e6039 \
+                    file://node_modules/multer/node_modules/string_decoder=
/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/multer/node_modules/mkdirp/LICENSE=
;md5=3Db2d989bc186e7f6b418a5fdd5cc0b56b \
+                    file://node_modules/multer/node_modules/readable-strea=
m/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/multer/node_modules/concat-stream/=
LICENSE;md5=3D3ad90c134f824ddfcea611ee1fa567a8 \
+                    file://node_modules/jsdoc-nr-template/LICENSE;md5=3Dd6=
60da3579d1fb0bd50b4ff646479de3 \
+                    file://node_modules/is-plain-object/LICENSE;md5=3D3d83=
ea4c8ec9b31d9ff2c82fa29beabb \
+                    file://node_modules/npmlog/LICENSE.md;md5=3Dc637d431ac=
5faadb34aff5fbd6985239 \
+                    file://node_modules/shelljs/LICENSE;md5=3D4d534bba3a94=
c8be6a9e37265197d453 \
+                    file://node_modules/prepend-http/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/superagent/LICENSE;md5=3Df60302064=
77cb73726a5c886539edb8b \
+                    file://node_modules/superagent/node_modules/form-data/=
License;md5=3D7aa505292e2636a9e59d4d3f258f4819 \
+                    file://node_modules/superagent/node_modules/qs/LICENSE=
.md;md5=3Db289135779dd930509ae81e6041690c0 \
+                    file://node_modules/superagent/node_modules/debug/LICE=
NSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/superagent/node_modules/ms/license=
.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/is-windows/LICENSE;md5=3D5fb5a7fdb=
cfa3640822ec69bd3ee86e7 \
+                    file://node_modules/escape-string-regexp/license;md5=
=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/table-layout/LICENSE;md5=3D15a318b=
c4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/table-layout/node_modules/array-ba=
ck/LICENSE;md5=3D2613420a3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/log-symbols/license;md5=3Dd5f2a6dd=
0192dcc7c833e50bb9017337 \
+                    file://node_modules/node-red-admin/LICENSE;md5=3D2ee41=
112a44fe7014dce33e26468ba93 \
+                    file://node_modules/acorn/LICENSE;md5=3D33e8b86a084578=
431a31c72608f226b8 \
+                    file://node_modules/config-master/LICENSE;md5=3D261342=
0a3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/config-master/node_modules/walk-ba=
ck/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/pseudomap/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/retry/License;md5=3Dc40fe50d231414=
ad1bc68e8965e7e95e \
+                    file://node_modules/flagged-respawn/LICENSE;md5=3Da23a=
40ab945d47b3d110800a06bd2bd2 \
+                    file://node_modules/parseurl/LICENSE;md5=3De7842ed4f18=
8e53e53c3e8d9c4807e89 \
+                    file://node_modules/browser-stdout/LICENSE;md5=3D3a82c=
a6497b86652ecafd7a5f256ff9b \
+                    file://node_modules/grunt-jsdoc-to-markdown/LICENSE.md=
;md5=3Dcc691b00068be9f59d2ad75882f133b3 \
+                    file://node_modules/validate-npm-package-license/LICEN=
SE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://node_modules/core-util-is/LICENSE;md5=3D6126e36=
127d20ec0e2f637204a5c68ff \
+                    file://node_modules/markdown-it/LICENSE;md5=3D4323c95e=
1014fb58368f2d4c2b78064b \
+                    file://node_modules/markdown-it/node_modules/entities/=
LICENSE;md5=3Dd5b9cb3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/function-bind/LICENSE;md5=3De7417c=
1a8ad83f88bcac21ad440d48b2 \
+                    file://node_modules/supertest/LICENSE;md5=3Deacbaae255=
52d53aba44661c68b770d7 \
+                    file://node_modules/typedarray/LICENSE;md5=3D6085b70b7=
4c7dcf7df4e955725e3153d \
+                    file://node_modules/lodash.flatten/LICENSE;md5=3Da3b2b=
7770df62392c164de4001b59f8f \
+                    file://node_modules/js2xmlparser/LICENSE;md5=3D86d3f3a=
95c324c9479bd8986968f4327 \
+                    file://node_modules/cross-fetch/LICENSE;md5=3Deb7fe47c=
dcfb97c3a853891fb8c90c4d \
+                    file://node_modules/cross-fetch/node_modules/node-fetc=
h/LICENSE.md;md5=3D89fabe2fb10f72e48c2b3be506237d1e \
+                    file://node_modules/http-cache-semantics/LICENSE;md5=
=3D7b7cd412797b9e24e3c58eff96661bf9 \
+                    file://node_modules/commist/LICENSE;md5=3D3f047b8c7263=
3e56a5d2bddc7feaa719 \
+                    file://node_modules/printj/LICENSE;md5=3D603da8c86614f=
63539f44d25b3a96b1c \
+                    file://node_modules/printj/dist/LICENSE;md5=3D603da8c8=
6614f63539f44d25b3a96b1c \
+                    file://node_modules/body-parser/LICENSE;md5=3D0afd201e=
48c7d095454eed4ac1184e40 \
+                    file://node_modules/body-parser/node_modules/iconv-lit=
e/LICENSE;md5=3Df942263d98f0d75e0e0101884e86261d \
+                    file://node_modules/body-parser/node_modules/raw-body/=
LICENSE;md5=3Dc970d30155ebbdb1903e6de8c0666e18 \
+                    file://node_modules/glob/LICENSE;md5=3Dc727d36f28f2762=
b1011dd483aa1a191 \
+                    file://node_modules/read-pkg/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg/node_modules/type-fest/li=
cense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/sinon/LICENSE;md5=3Dc40c7dbb472ca7=
65e7c5111233da2bec \
+                    file://node_modules/moment/LICENSE;md5=3D397bb5fedab22=
612d8d69f1458a9321e \
+                    file://node_modules/@sinonjs/fake-timers/LICENSE;md5=
=3D0e2cf5e454998e626d64af5b86bc869d \
+                    file://node_modules/@sinonjs/samsam/LICENSE;md5=3D28bb=
60b24d0c97ef229aefc95a6f95f0 \
+                    file://node_modules/@sinonjs/commons/LICENSE;md5=3D446=
dbc721381c51aeadb895e74f715a5 \
+                    file://node_modules/@sinonjs/text-encoding/LICENSE.md;=
md5=3D087f73cd75dbac5c7d0b0cd06f759c85 \
+                    file://node_modules/cliui/LICENSE.txt;md5=3D83623193d3=
051ca8068a89a455c699ca \
+                    file://node_modules/xml2js/LICENSE;md5=3Dd9fc599c8d9e6=
f8665063862aac66dfc \
+                    file://node_modules/duplexer3/LICENSE.md;md5=3D2ac3dfd=
ce5a77f9cff9b5f70d216d17d \
+                    file://node_modules/unc-path-regex/LICENSE;md5=3De0602=
35353cb686ae1695ec7db63cfbc \
+                    file://node_modules/strip-ansi/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/quick-lru/license;md5=3D915042b5df=
33c31a6db2b37eadaa00e3 \
+                    file://node_modules/number-is-nan/license;md5=3Da12ebc=
a0510a773644101a99a867d210 \
+                    file://node_modules/mustache/LICENSE;md5=3D33fa3c7f276=
11cfb1191e5aa2bb107b1 \
+                    file://node_modules/hash-sum/license;md5=3D06049b6eb5e=
43aafd8fe7c733d033646 \
+                    file://node_modules/safe-buffer/LICENSE;md5=3Dbadd5e91=
c737e7ffdf10b40c1f907761 \
+                    file://node_modules/update-notifier/license;md5=3D893a=
d33659c31c56c0f4ba00ac978281 \
+                    file://node_modules/raw-body/LICENSE;md5=3Dc970d30155e=
bbdb1903e6de8c0666e18 \
+                    file://node_modules/raw-body/node_modules/iconv-lite/L=
ICENSE;md5=3Df942263d98f0d75e0e0101884e86261d \
+                    file://node_modules/raw-body/node_modules/http-errors/=
LICENSE;md5=3D607209623abfcc77b9098f71a0ef52f9 \
+                    file://node_modules/grunt-cli/node_modules/nopt/LICENS=
E;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/color-name/LICENSE;md5=3Dd301869b3=
9e08b33665b7c4f16b8e41d \
+                    file://node_modules/should-format/LICENSE;md5=3Db9d99d=
98c0703a6b8791ceb941a485ee \
+                    file://node_modules/domhandler/LICENSE;md5=3Dd5b9cb3bc=
7f6ffd7bea8661f30447c11 \
+                    file://node_modules/dmd/LICENSE;md5=3Db1e4182a30eb9718=
635b626938336217 \
+                    file://node_modules/dmd/node_modules/array-back/LICENS=
E;md5=3D2953118f740c646d26207e56f3c874a3 \
+                    file://node_modules/dmd/node_modules/marked/LICENSE.md=
;md5=3D63067ac27c0f658572e4798649c2ef4a \
+                    file://node_modules/pify/license;md5=3D915042b5df33c31=
a6db2b37eadaa00e3 \
+                    file://node_modules/for-own/LICENSE;md5=3Da9f606f2e382=
2130012aab1f9c6ed213 \
+                    file://node_modules/enquirer/LICENSE;md5=3D62927f9e287=
cbc1dbddd9c8f208b7cdb \
+                    file://node_modules/require-main-filename/LICENSE.txt;=
md5=3D8fd106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/object-assign/license;md5=3Da12ebc=
a0510a773644101a99a867d210 \
+                    file://node_modules/serve-static/LICENSE;md5=3D27b1707=
520b14d0bc890f4e75cd387b0 \
+                    file://node_modules/shebang-command/license;md5=3D0524=
0cd20679544d6e90fcff746425bc \
+                    file://node_modules/node-red-node-test-helper/LICENSE;=
md5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/nise/LICENSE;md5=3Dc40c7dbb472ca765e7c5111233da2bec \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/string_decoder/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/form-data/License;md5=3D7aa505292e2636a9e59d4d3f258f4819 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/semver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/diff/LICENSE;md5=3De6f0309f3f9919cd96cc45a4d4859c54 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/yallist/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/mime/LICENSE;md5=3D8e8ea2ad138ce468f8570a0edbadea65 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/superagent/LICENSE;md5=3Df6030206477cb73726a5c886539edb8b \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/supertest/LICENSE;md5=3Deacbaae25552d53aba44661c68b770d7 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/sinon/LICENSE;md5=3Dc40c7dbb472ca765e7c5111233da2bec \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/@sinonjs/fake-timers/LICENSE;md5=3D0e2cf5e454998e626d64af5b86bc869d \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/@sinonjs/samsam/LICENSE;md5=3D28bb60b24d0c97ef229aefc95a6f95f0 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/lru-cache/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/debug/LICENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/path-to-regexp/LICENSE;md5=3D44088ba57cb871a58add36ce51b8de08 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/readable-stream/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/ms/license.md;md5=3D2b8bc52ae6b7ba58e1629deabd53986f \
+                    file://node_modules/p-try/license;md5=3D915042b5df33c3=
1a6db2b37eadaa00e3 \
+                    file://node_modules/gauge/LICENSE.md;md5=3Dc637d431ac5=
faadb34aff5fbd6985239 \
+                    file://node_modules/minami/LICENSE;md5=3Dd660da3579d1f=
b0bd50b4ff646479de3 \
+                    file://node_modules/minami/static/scripts/prettify/Apa=
che-License-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://node_modules/entities/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/cache-point/LICENSE;md5=3D743d60b1=
8f147cfead51a95082e25a9b \
+                    file://node_modules/cache-point/node_modules/array-bac=
k/LICENSE;md5=3D15a318bc4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/defer-to-connect/LICENSE;md5=3D78f=
d36a7284eb85369521bcb6e863186 \
+                    file://node_modules/uglify-js/LICENSE;md5=3D00b4520269=
5de5cd110bd3c2927a0da2 \
+                    file://node_modules/inflight/LICENSE;md5=3D90a3ca01a5e=
fed8b813a81c6c8fa2e63 \
+                    file://node_modules/os-homedir/license;md5=3Da12ebca05=
10a773644101a99a867d210 \
+                    file://node_modules/normalize-package-data/LICENSE;md5=
=3D745d0cb7803882ab26451fefb149878e \
+                    file://node_modules/normalize-package-data/node_module=
s/semver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/continuable-cache/LICENCE;md5=3Db1=
c841959f01a2fc8da6242c32371b50 \
+                    file://node_modules/is-path-inside/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/rechoir/LICENSE;md5=3Dc86b3e59f975=
615dfa869526b45d2031 \
+                    file://node_modules/sprintf-js/LICENSE;md5=3Dab40451de=
4e35c90f1b663b4fbd314a9 \
+                    file://node_modules/xtend/LICENSE;md5=3D66787c5cd698a0=
b30b358c7e30f500ca \
+                    file://node_modules/is-glob/LICENSE;md5=3D3d83ea4c8ec9=
b31d9ff2c82fa29beabb \
+                    file://node_modules/json-stringify-safe/LICENSE;md5=3D=
82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/balanced-match/LICENSE.md;md5=3D7f=
a99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/stoppable/LICENSE;md5=3Dd9159b596c=
29390c4c536845edbfd909 \
+                    file://node_modules/to-readable-stream/license;md5=3D9=
15042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/yargs/LICENSE;md5=3Dec88e65c7bb017=
32069f3ad6b09ac90d \
+                    file://node_modules/get-stream/license;md5=3Dd5f2a6dd0=
192dcc7c833e50bb9017337 \
+                    file://node_modules/latest-version/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/chalk/license;md5=3D915042b5df33c3=
1a6db2b37eadaa00e3 \
+                    file://node_modules/call-bind/LICENSE;md5=3D0eb2c73daa=
0ecf037cbdf3d0bb0c98d5 \
+                    file://node_modules/indent-string/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/lodash.clonedeep/LICENSE;md5=3Da3b=
2b7770df62392c164de4001b59f8f \
+                    file://node_modules/lodash.get/LICENSE;md5=3Da3b2b7770=
df62392c164de4001b59f8f \
+                    file://node_modules/reduce-without/LICENSE;md5=3D89b06=
69afc8c7ddb483a7cab7860548e \
+                    file://node_modules/reduce-without/node_modules/array-=
back/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/reduce-without/node_modules/test-v=
alue/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/bluebird/LICENSE;md5=3D5dd221993f5=
1ba714ddd208ff3b2ed01 \
+                    file://node_modules/convert-source-map/LICENSE;md5=3Db=
f595075ff556bc46c43e08f142fa4f5 \
+                    file://node_modules/is-utf8/LICENSE;md5=3D10d1495ba466=
09e55e586ab71fa81f45 \
+                    file://node_modules/path-parse/LICENSE;md5=3D4b940f966=
8dfcb796d2cb98ad94692df \
+                    file://node_modules/is-absolute/LICENSE;md5=3Db2593528=
953061a799b5b34922f0064d \
+                    file://node_modules/ansi-escape-sequences/LICENSE;md5=
=3D6c52529f7556f9d043018efc71ee007d \
+                    file://node_modules/ansi-escape-sequences/node_modules=
/array-back/LICENSE;md5=3D15a318bc4fd8f01eb4196c7418b4cb1c \
+                    file://node_modules/websocket-extensions/LICENSE.md;md=
5=3D608a8da857bde98dd52bde5a1c1fb332 \
+                    file://node_modules/lru-cache/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/cacheable-lookup/LICENSE;md5=3D23a=
0ab677f942ddc394168925c5a9328 \
+                    file://node_modules/braces/LICENSE;md5=3Dccdc0959f6794=
3eb090f7e7c299621af \
+                    file://node_modules/grunt-simple-mocha/LICENSE-MIT;md5=
=3D53da8466d7b64dd2fa4ab2db8687ca2f \
+                    file://node_modules/css-select/LICENSE;md5=3Dd5b9cb3bc=
7f6ffd7bea8661f30447c11 \
+                    file://node_modules/shebang-regex/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/finalhandler/LICENSE;md5=3Db506956=
e5cbfbe0d04f8a5c40107ec89 \
+                    file://node_modules/v8flags/LICENSE;md5=3Da23a40ab945d=
47b3d110800a06bd2bd2 \
+                    file://node_modules/minizlib/LICENSE;md5=3Dd8a0ca0c46b=
fa01db064fa836f550966 \
+                    file://node_modules/minizlib/node_modules/yallist/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/tiny-lr/LICENSE-MIT;md5=3D43d8f7fc=
0bf7836df8d9a9d90a9a1ccb \
+                    file://node_modules/tiny-lr/node_modules/debug/LICENSE=
;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/tiny-lr/node_modules/ms/license.md=
;md5=3D2b8bc52ae6b7ba58e1629deabd53986f \
+                    file://node_modules/graceful-fs/LICENSE;md5=3Dfd63805f=
d8e3797063b247781e5ee6e4 \
+                    file://node_modules/gaze/LICENSE-MIT;md5=3D494057b8bde=
68aa8307ba61b8968b3dd \
+                    file://node_modules/grunt-mkdir/LICENSE-MIT;md5=3Dcd1a=
49780b40f08cb8caf2221fdbc22f \
+                    file://node_modules/registry-url/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/common-sequence/LICENSE;md5=3Dbc64=
ddbdcf97f5c6ca534ca7b979918a \
+                    file://node_modules/error-ex/LICENSE;md5=3De67c75e8965=
6b80fd99cb7d30fb43102 \
+                    file://node_modules/compress-commons/LICENSE;md5=3D514=
78cb9e7ab40d3d3616c3794ded96b \
+                    file://node_modules/grunt-simple-nyc/LICENSE;md5=3Df0c=
69130f73541904f2e8a99a694ee3d \
+                    file://node_modules/foreground-child/LICENSE;md5=3D827=
03a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/foreground-child/node_modules/cros=
s-spawn/LICENSE;md5=3Dd81e220dee93fdbcbf7696cc76cec0a0 \
+                    file://node_modules/foreground-child/node_modules/whic=
h/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/widest-line/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/bcrypt/LICENSE;md5=3D4665b5424ab73=
4549385bae891f8d35d \
+                    file://node_modules/mime-db/LICENSE;md5=3Dc8d3a30332ec=
b31cfaf4c0a06da18f5c \
+                    file://node_modules/pupa/license;md5=3D915042b5df33c31=
a6db2b37eadaa00e3 \
+                    file://node_modules/adm-zip/LICENSE;md5=3D605fa183dd4e=
ff83d85b99cb5263646a \
+                    file://node_modules/file-sync-cmp/LICENSE;md5=3D846700=
8dfe4845427d620193798a589d \
+                    file://node_modules/archiver/LICENSE;md5=3D6de886fe021=
f2668e514b5d0e5629e58 \
+                    file://node_modules/archiver/node_modules/async/LICENS=
E;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/grunt-known-options/LICENSE;md5=3D=
331e7399a324dbd9645b0d949ab3996b \
+                    file://node_modules/isexe/LICENSE;md5=3D82703a69f6d741=
1dde679954c2fd9dca \
+                    file://node_modules/is-installed-globally/license;md5=
=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/flat/LICENSE;md5=3D13aa15a115948e3=
4248388ca8956ea4d \
+                    file://node_modules/stream-via/LICENSE;md5=3D2613420a3=
157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/streamsearch/LICENSE;md5=3Ddf3ad14=
5c2acbfc4f246fa834a6675c7 \
+                    file://node_modules/http2-wrapper/LICENSE;md5=3D78fd36=
a7284eb85369521bcb6e863186 \
+                    file://node_modules/is-number/LICENSE;md5=3D0f64900f8f=
30e53054962c9f1fc3205b \
+                    file://node_modules/reduce-extract/LICENSE;md5=3D89b06=
69afc8c7ddb483a7cab7860548e \
+                    file://node_modules/reduce-extract/node_modules/array-=
back/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/reduce-extract/node_modules/test-v=
alue/LICENSE;md5=3Dfc20ee5849f94fb5da737859f9226d5a \
+                    file://node_modules/regenerator-runtime/LICENSE;md5=3D=
57a79768a3b1e4d0f3a3787048a96356 \
+                    file://node_modules/grunt-contrib-watch/node_modules/a=
sync/LICENSE;md5=3D73f63c1fa4541b2f2f34d77140ebe89d \
+                    file://node_modules/node-fetch/LICENSE.md;md5=3D89fabe=
2fb10f72e48c2b3be506237d1e \
+                    file://node_modules/cronosjs/LICENSE;md5=3D364202e8ebc=
58122042346798591bff7 \
+                    file://node_modules/asynckit/LICENSE;md5=3D177bc287fb9=
558bf3ea50b440c1c86ff \
+                    file://node_modules/path-type/license;md5=3D915042b5df=
33c31a6db2b37eadaa00e3 \
+                    file://node_modules/path-type/node_modules/pify/licens=
e;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/cookie-parser/LICENSE;md5=3D720bd7=
b9472a2297cd6820c73c71cf3e \
+                    file://node_modules/cookie-parser/node_modules/cookie/=
LICENSE;md5=3Dbc85b43b6f963e8ab3f88e63628448ca \
+                    file://node_modules/bcryptjs/LICENSE;md5=3Dd99a4f4253f=
ea793a1256aef626aa6e5 \
+                    file://node_modules/jquery-i18next/LICENSE;md5=3Df4112=
c384a38707998b5a2af4cfc4154 \
+                    file://node_modules/boxen/license;md5=3Dd5f2a6dd0192dc=
c7c833e50bb9017337 \
+                    file://node_modules/boxen/node_modules/type-fest/licen=
se;md5=3D4131c9cb751198c626a526bc9ef613c6 \
+                    file://node_modules/boxen/node_modules/camelcase/licen=
se;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/pad-stream/license;md5=3Da12ebca05=
10a773644101a99a867d210 \
+                    file://node_modules/pad-stream/node_modules/split2/LIC=
ENSE;md5=3D3dc087ebf2e241fb54b937c0b9a11cf5 \
+                    file://node_modules/ws/LICENSE;md5=3D95833e8f03687308b=
0584a377b9e12b0 \
+                    file://node_modules/should-equal/LICENSE;md5=3D257f0a1=
5e23399219e3de6c0c3d52bcb \
+                    file://node_modules/debug/LICENSE;md5=3Dddd815a475e733=
8b0be7a14d8ee35a99 \
+                    file://node_modules/html-escaper/LICENSE.txt;md5=3D7f7=
6bc579cecca728c4f088789c787de \
+                    file://node_modules/path-to-regexp/LICENSE;md5=3D44088=
ba57cb871a58add36ce51b8de08 \
+                    file://node_modules/spdx-correct/LICENSE;md5=3D3b83ef9=
6387f14655fc854ddc3c6bd57 \
+                    file://node_modules/clone-response/LICENSE;md5=3D9a2ba=
a6947d5018096b83508bd94026e \
+                    file://node_modules/jsdoc-api/LICENSE;md5=3Dbc64ddbdcf=
97f5c6ca534ca7b979918a \
+                    file://node_modules/random-bytes/LICENSE;md5=3D65cf5ba=
a33cf259f107bbfc965d9f8a0 \
+                    file://node_modules/collect-all/LICENSE;md5=3D2613420a=
3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/fast-json-stable-stringify/LICENSE=
;md5=3Dfebe55307df96f60ad763842f5a8ca6f \
+                    file://node_modules/unpipe/LICENSE;md5=3D934ab86a8ab08=
1ea0326add08d550739 \
+                    file://node_modules/should-type/LICENSE;md5=3Db9d99d98=
c0703a6b8791ceb941a485ee \
+                    file://node_modules/homedir-polyfill/LICENSE;md5=3D103=
6373bcb7944578843baf629c16dbf \
+                    file://node_modules/json-schema-traverse/LICENSE;md5=
=3Dea87ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/micromatch/LICENSE;md5=3D0f64900f8=
f30e53054962c9f1fc3205b \
+                    file://node_modules/touch/LICENSE;md5=3D90a3ca01a5efed=
8b813a81c6c8fa2e63 \
+                    file://node_modules/touch/node_modules/nopt/LICENSE;md=
5=3Db3245a33f2d41818f14c489bd33bc4a8 \
+                    file://node_modules/temp-path/LICENSE;md5=3Dc8d3a30332=
ecb31cfaf4c0a06da18f5c \
+                    file://node_modules/destroy/LICENSE;md5=3Dc8d3a30332ec=
b31cfaf4c0a06da18f5c \
+                    file://node_modules/cookie/LICENSE;md5=3Dbc85b43b6f963=
e8ab3f88e63628448ca \
+                    file://node_modules/istanbul-lib-coverage/LICENSE;md5=
=3D716b8ca15fee2be15af13159d0890c56 \
+                    file://node_modules/yocto-queue/license;md5=3Dd5f2a6dd=
0192dcc7c833e50bb9017337 \
+                    file://node_modules/supports-color/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/keyv/LICENSE;md5=3D13e5cd3c004de57=
8850c852f5760aa36 \
+                    file://node_modules/minipass/LICENSE;md5=3Dff53df3ad94=
e5c618e230ab49ce310fa \
+                    file://node_modules/minipass/node_modules/yallist/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/workerpool/LICENSE;md5=3D6c4db32a2=
fa8717faffa1d4f10136f47 \
+                    file://node_modules/workerpool/dist/workerpool.min.js.=
LICENSE.txt;md5=3Db1bcd789912620550e40dcd2b10c7a35 \
+                    file://node_modules/path-key/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg-up/license;md5=3D915042b5=
df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg-up/node_modules/find-up/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg-up/node_modules/p-locate/=
license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg-up/node_modules/p-limit/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/read-pkg-up/node_modules/locate-pa=
th/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/mqtt/LICENSE.md;md5=3D4ebb3d258700=
b7b67ec523232e4b5555 \
+                    file://node_modules/mqtt/node_modules/debug/LICENSE;md=
5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/mqtt/node_modules/ms/license.md;md=
5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/locate-path/license;md5=3Dd5f2a6dd=
0192dcc7c833e50bb9017337 \
+                    file://node_modules/combined-stream/License;md5=3D5270=
b4ddb6700d0a820e6d066744589c \
+                    file://node_modules/formidable/LICENSE;md5=3Df4f51c2b6=
40a5b7a159552605e03b887 \
+                    file://node_modules/typical/LICENSE;md5=3D616a79a0ccc4=
cd477c5a06494d7c9206 \
+                    file://node_modules/lines-and-columns/LICENSE;md5=3Dcc=
ca5bd3aeb53dd27037cf30f01b379f \
+                    file://node_modules/colors/LICENSE;md5=3D5bc6c72caa0dc=
c082d24a52a6ae12112 \
+                    file://node_modules/detect-libc/LICENSE;md5=3De3fc50a8=
8d0a364313df4b21ef20c29e \
+                    file://node_modules/escape-html/LICENSE;md5=3Df8746101=
546eeb9e4f6de64bb8bdf595 \
+                    file://node_modules/source-map/LICENSE;md5=3Db1ca6dbc0=
075d56cbd9931a75566cd44 \
+                    file://node_modules/async-mutex/LICENSE;md5=3D2bed6324=
2f12f0617c19f2f6ceafab6f \
+                    file://node_modules/whatwg-url/LICENSE.txt;md5=3D5ab91=
13efe10eeab888f7502d1c2e894 \
+                    file://node_modules/universalify/LICENSE;md5=3Da734c6a=
d6e37a515025ac5e8e90ef786 \
+                    file://node_modules/wrap-ansi/license;md5=3Dd5f2a6dd01=
92dcc7c833e50bb9017337 \
+                    file://node_modules/console-control-strings/LICENSE;md=
5=3D43abbc6f9093aea69560715033788727 \
+                    file://node_modules/object.pick/LICENSE;md5=3Dfad3c8b9=
c04b365012f3d6821f2dda61 \
+                    file://node_modules/fill-range/LICENSE;md5=3D0f64900f8=
f30e53054962c9f1fc3205b \
+                    file://node_modules/fs-minipass/LICENSE;md5=3D82703a69=
f6d7411dde679954c2fd9dca \
+                    file://node_modules/tough-cookie/LICENSE;md5=3D7189377=
a5215f1211b70cf2b9754841e \
+                    file://node_modules/tough-cookie/node_modules/universa=
lify/LICENSE;md5=3Da734c6ad6e37a515025ac5e8e90ef786 \
+                    file://node_modules/moment-timezone/LICENSE;md5=3Df512=
12467d7a94e1583a4cff9492bd80 \
+                    file://node_modules/linkify-it/LICENSE;md5=3De2f6d3a49=
c2238880c1d728ddc187f7a \
+                    file://node_modules/is-obj/license;md5=3D915042b5df33c=
31a6db2b37eadaa00e3 \
+                    file://node_modules/cors/LICENSE;md5=3D947eb5e695dade4=
32a500b12c510de85 \
+                    file://node_modules/array-flatten/LICENSE;md5=3D44088b=
a57cb871a58add36ce51b8de08 \
+                    file://node_modules/aproba/LICENSE;md5=3D9d215c9223fbe=
f14a4642cc450e7ed4b \
+                    file://node_modules/markdown-it-anchor/UNLICENSE;md5=
=3D7246f848faa4e9c9fc0ea91122d6e680 \
+                    file://node_modules/lodash.omit/LICENSE;md5=3Da3b2b777=
0df62392c164de4001b59f8f \
+                    file://node_modules/tar-stream/LICENSE;md5=3D9befe7026=
bf915886cd566a98117c80e \
+                    file://node_modules/pkg-dir/license;md5=3D915042b5df33=
c31a6db2b37eadaa00e3 \
+                    file://node_modules/pkg-dir/node_modules/path-exists/l=
icense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/pkg-dir/node_modules/find-up/licen=
se;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/pkg-dir/node_modules/p-locate/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/pkg-dir/node_modules/p-limit/licen=
se;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/pkg-dir/node_modules/locate-path/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/glob-parent/LICENSE;md5=3Da3d42bb6=
76c62db87cbf7b04d98da83e \
+                    file://node_modules/osenv/LICENSE;md5=3D82703a69f6d741=
1dde679954c2fd9dca \
+                    file://node_modules/dom-serializer/LICENSE;md5=3Dba339=
0a22fe1d127f3522ac8ef1bd1a0 \
+                    file://node_modules/serialize-javascript/LICENSE;md5=
=3D88ca0f627a04462a0ac7effbc69ae1c7 \
+                    file://node_modules/safe-json-parse/LICENCE;md5=3De49c=
c503e2655840a840d2721a204062 \
+                    file://node_modules/webidl-conversions/LICENSE.md;md5=
=3D44d86433f305935cb0c3d3cd320e7a34 \
+                    file://node_modules/parse-filepath/LICENSE;md5=3D360e6=
0c9b7aa16428ee600ff20935e1f \
+                    file://node_modules/lazystream/LICENSE;md5=3D44d6d25a5=
dd108a624f4edf4c5e7c2a1 \
+                    file://node_modules/lazystream/node_modules/string_dec=
oder/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/lazystream/node_modules/readable-s=
tream/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/to-fast-properties/license;md5=3Da=
3b54a26fb11cf7129550e6ffc7807ea \
+                    file://node_modules/sort-array/LICENSE;md5=3Dbc64ddbdc=
f97f5c6ca534ca7b979918a \
+                    file://node_modules/sort-array/node_modules/array-back=
/LICENSE;md5=3D2953118f740c646d26207e56f3c874a3 \
+                    file://node_modules/sort-array/node_modules/typical/LI=
CENSE;md5=3Dfc064aa35c26f923e6a59088bb11dd1b \
+                    file://node_modules/os-tmpdir/license;md5=3Da12ebca051=
0a773644101a99a867d210 \
+                    file://node_modules/crc32-stream/LICENSE;md5=3D51478cb=
9e7ab40d3d3616c3794ded96b \
+                    file://node_modules/is-fullwidth-code-point/license;md=
5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/follow-redirects/LICENSE;md5=3D291=
3574e921aefe1275cd5864b4f9b66 \
+                    file://node_modules/lodash.padend/LICENSE;md5=3Da3b2b7=
770df62392c164de4001b59f8f \
+                    file://node_modules/extend/LICENSE;md5=3D33d9f7a91df27=
6ec16aa941032ee1476 \
+                    file://node_modules/nodemon/LICENSE;md5=3D9b54883148df=
d5ff6b9f1a23f9470a30 \
+                    file://node_modules/nodemon/node_modules/semver/LICENS=
E;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/nodemon/node_modules/debug/LICENSE=
;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/nodemon/node_modules/supports-colo=
r/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/nodemon/node_modules/ms/license.md=
;md5=3D2b8bc52ae6b7ba58e1629deabd53986f \
+                    file://node_modules/nodemon/node_modules/has-flag/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/ee-first/LICENSE;md5=3Dc8d3a30332e=
cb31cfaf4c0a06da18f5c \
+                    file://node_modules/lodash.difference/LICENSE;md5=3Da3=
b2b7770df62392c164de4001b59f8f \
+                    file://node_modules/globule/LICENSE;md5=3D15b8c41863be=
1507d1b155ab783dd621 \
+                    file://node_modules/parse-passwd/LICENSE;md5=3D1036373=
bcb7944578843baf629c16dbf \
+                    file://node_modules/args/license.md;md5=3D3f3851cc06d7=
6bb3e32293232e33ad76 \
+                    file://node_modules/args/node_modules/ansi-styles/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/args/node_modules/escape-string-re=
gexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/args/node_modules/color-name/LICEN=
SE;md5=3Dd301869b39e08b33665b7c4f16b8e41d \
+                    file://node_modules/args/node_modules/chalk/license;md=
5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/args/node_modules/supports-color/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/args/node_modules/color-convert/LI=
CENSE;md5=3D9bdadfc9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/args/node_modules/has-flag/license=
;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/ajv/LICENSE;md5=3D5ed8db7ae36f56c8=
a5cfc218c41ac926 \
+                    file://node_modules/string-template/LICENCE;md5=3D18e8=
f817c4497aaba6a796a9709bda34 \
+                    file://node_modules/accepts/LICENSE;md5=3Dbf1f9ad1e2e1=
d507aef4883fff7103de \
+                    file://node_modules/color-support/LICENSE;md5=3D82703a=
69f6d7411dde679954c2fd9dca \
+                    file://node_modules/domutils/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/chokidar/LICENSE;md5=3D385493bcd68=
524333269db742d243165 \
+                    file://node_modules/bytes/LICENSE;md5=3D013e95467eddb0=
48f19a6f5b42820f86 \
+                    file://node_modules/read/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/is-arrayish/LICENSE;md5=3De67c75e8=
9656b80fd99cb7d30fb43102 \
+                    file://node_modules/command-line-usage/LICENSE;md5=3Dc=
1d0f392d6113887beeee9e0de58693f \
+                    file://node_modules/command-line-usage/node_modules/ar=
ray-back/LICENSE;md5=3D2613420a3157e6d11b6dbf4304a77ba9 \
+                    file://node_modules/archiver-utils/LICENSE;md5=3D6a2fb=
c0984e7bbc2c40dd7f8f4c90906 \
+                    file://node_modules/archiver-utils/node_modules/string=
_decoder/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/archiver-utils/node_modules/readab=
le-stream/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/hosted-git-info/LICENSE;md5=3Da01f=
10cd299d5727263720d47cc2c908 \
+                    file://node_modules/spawn-wrap/LICENSE;md5=3D82703a69f=
6d7411dde679954c2fd9dca \
+                    file://node_modules/spawn-wrap/node_modules/which/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/spawn-wrap/node_modules/mkdirp/LIC=
ENSE;md5=3Db2d989bc186e7f6b418a5fdd5cc0b56b \
+                    file://node_modules/spawn-wrap/node_modules/rimraf/LIC=
ENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/color-convert/LICENSE;md5=3D9bdadf=
c9fbb3ab8d5a6d591bdbd52811 \
+                    file://node_modules/es6-error/LICENSE.md;md5=3Df4f6bdb=
cd0f2a80034d88e08f2479014 \
+                    file://node_modules/y18n/LICENSE;md5=3D55e5f8804067914=
8136545002139a8b1 \
+                    file://node_modules/duplexify/LICENSE;md5=3D9befe7026b=
f915886cd566a98117c80e \
+                    file://node_modules/console-browserify/LICENCE;md5=3D8=
966d3100f2d871ee216d056c0ea0160 \
+                    file://node_modules/minimatch/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/write-file-atomic/LICENSE;md5=3D68=
705ba56afdf6710c9187ed9a9cdd03 \
+                    file://node_modules/fresh/LICENSE;md5=3D373c2cf0978b37=
e434394a43b4cbbdb4 \
+                    file://node_modules/grunt-npm-command/LICENSE;md5=3De2=
6574ec49f317e8bee2acc89b4861ae \
+                    file://node_modules/is-yarn-global/LICENSE;md5=3D70e5c=
3ddb07f13a85007f15c0792b800 \
+                    file://node_modules/@types/node/LICENSE;md5=3Dd4a904ca=
135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/responselike/LICENSE;md5=3D=
27e94c0280987ab296b0b8dd02ab9fe5 \
+                    file://node_modules/@types/cacheable-request/LICENSE;m=
d5=3Dd4a904ca135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/http-cache-semantics/LICENS=
E;md5=3Dd4a904ca135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/normalize-package-data/LICE=
NSE;md5=3Dd4a904ca135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/keyv/LICENSE;md5=3Dd4a904ca=
135bb7bc912156fee12726f0 \
+                    file://node_modules/@szmarczak/http-timer/LICENSE;md5=
=3D78fd36a7284eb85369521bcb6e863186 \
+                    file://node_modules/spdx-expression-parse/LICENSE;md5=
=3D35a411d082d4487ab0e0287014cddf80 \
+                    file://node_modules/wide-align/LICENSE;md5=3D9d215c922=
3fbef14a4642cc450e7ed4b \
+                    file://node_modules/xmlbuilder/LICENSE;md5=3Df2836c06c=
74eca0f4565de06fe9900b0 \
+                    file://node_modules/clone/LICENSE;md5=3D411e33109fa516=
d190d232100fdc7f8e \
+                    file://node_modules/uid2/LICENSE;md5=3Ddd54d0741106ff4=
193bcecb833f6e350 \
+                    file://node_modules/should-sinon/LICENSE;md5=3D71a5283=
1f2bbba1383d42d9390458df8 \
+                    file://node_modules/brace-expansion/LICENSE;md5=3Da5df=
515ef062cc3affd8c0ae59c059ec \
+                    file://node_modules/type-detect/LICENSE;md5=3D4b2ce66e=
eab3484b3213e85ab6c0564d \
+                    file://node_modules/unique-string/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/websocket-driver/LICENSE.md;md5=3D=
7c8302260aaa493b73540d8815befc10 \
+                    file://node_modules/is-binary-path/license;md5=3Dda068=
4b7c90dcea9333d6517f4fbda22 \
+                    file://node_modules/hasha/license;md5=3Da12ebca0510a77=
3644101a99a867d210 \
+                    file://node_modules/readable-stream/LICENSE;md5=3Da67a=
7926e54316d90c14f74f71080977 \
+                    file://node_modules/wrappy/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/package-json/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/package-json/node_modules/json-buf=
fer/LICENSE;md5=3Df26ea3f2a31273ebd199d933804f5e8b \
+                    file://node_modules/package-json/node_modules/normaliz=
e-url/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/package-json/node_modules/decompre=
ss-response/license;md5=3D5b422d6bf88afe88977d04f8bdd4959c \
+                    file://node_modules/package-json/node_modules/got/lice=
nse;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/package-json/node_modules/got/node=
_modules/lowercase-keys/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/package-json/node_modules/got/node=
_modules/get-stream/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/package-json/node_modules/p-cancel=
able/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/package-json/node_modules/response=
like/LICENSE;md5=3Debe53e6698981352da17c09ed915f13f \
+                    file://node_modules/package-json/node_modules/response=
like/node_modules/lowercase-keys/license;md5=3Da12ebca0510a773644101a99a867=
d210 \
+                    file://node_modules/package-json/node_modules/semver/L=
ICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/package-json/node_modules/cacheabl=
e-request/LICENSE;md5=3D9a2baa6947d5018096b83508bd94026e \
+                    file://node_modules/package-json/node_modules/defer-to=
-connect/LICENSE;md5=3D78fd36a7284eb85369521bcb6e863186 \
+                    file://node_modules/package-json/node_modules/keyv/LIC=
ENSE;md5=3D9a2baa6947d5018096b83508bd94026e \
+                    file://node_modules/package-json/node_modules/@szmarcz=
ak/http-timer/LICENSE;md5=3D78fd36a7284eb85369521bcb6e863186 \
+                    file://node_modules/package-json/node_modules/@sindres=
orhus/is/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/ms/license.md;md5=3Dfd56fd5f186096=
1dfa92d313167c37a6 \
+                    file://node_modules/require-directory/LICENSE;md5=3D90=
3997d26b12b72b43aa60018387bb90 \
+                    file://node_modules/side-channel/LICENSE;md5=3D375dc7c=
a936a14e9c29418d5263bd066 \
+                    file://node_modules/should-type-adaptors/LICENSE;md5=
=3Ddc1de4fd31f0ead856f3e4a3d0e4bb0d \
+                    file://node_modules/process-nextick-args/license.md;md=
5=3D216769dac98a78ec088ee7cc6fad1dfa \
+                    file://node_modules/append-field/LICENSE;md5=3D5c090f9=
df283eefdcea00b2f0766ca6c \
+                    file://node_modules/has-flag/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/ansi-colors/LICENSE;md5=3D442b5b96=
1878bc805832d1d24572f62d \
+                    file://node_modules/maxmin/license;md5=3Da12ebca0510a7=
73644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/pretty-bytes/l=
icense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/ansi-styles/li=
cense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/ansi-regex/lic=
ense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/escape-string-=
regexp/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/strip-ansi/lic=
ense;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/chalk/license;=
md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/maxmin/node_modules/supports-color=
/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/klaw/LICENSE;md5=3D697a7a0c3411588=
9f2e13e78c7d0bc9b \
+                    file://node_modules/jsdoc-to-markdown/LICENSE;md5=3Dcc=
691b00068be9f59d2ad75882f133b3 \
+                    file://node_modules/proxy/node_modules/debug/LICENSE;m=
d5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/proxy/node_modules/ms/license.md;m=
d5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/concat-stream/LICENSE;md5=3D3ad90c=
134f824ddfcea611ee1fa567a8 \
+                    file://node_modules/express-session/LICENSE;md5=3D23ef=
db85883c5cc9b6cc5b0456666a2b \
+                    file://node_modules/express-session/node_modules/depd/=
LICENSE;md5=3Debc30494fd072dc98368da73e1821715 \
+                    file://node_modules/express-session/node_modules/safe-=
buffer/LICENSE;md5=3Dbadd5e91c737e7ffdf10b40c1f907761 \
+                    file://node_modules/content-type/LICENSE;md5=3Df4b767f=
006864f81a4901347fe4efdab \
+                    file://node_modules/istanbul-lib-instrument/LICENSE;md=
5=3D716b8ca15fee2be15af13159d0890c56 \
+                    file://node_modules/istanbul-lib-instrument/node_modul=
es/semver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/buffer/LICENSE;md5=3De49e579dbcc02=
cf1f699deec85fd96f0 \
+                    file://node_modules/inherits/LICENSE;md5=3D5b2ef2247af=
6d355ae9d9f988092d470 \
+                    file://node_modules/dicer/LICENSE;md5=3Ddf3ad145c2acbf=
c4f246fa834a6675c7 \
+                    file://node_modules/dicer/node_modules/string_decoder/=
LICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/dicer/node_modules/readable-stream=
/LICENSE;md5=3Dd7351a4fc8e956f1a68413490d5e655e \
+                    file://node_modules/rimraf/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/negotiator/LICENSE;md5=3D6417a862a=
5e35c17c904d9dda2cbd499 \
+                    file://node_modules/util-deprecate/LICENSE;md5=3Db7c99=
ef4b0f3ad9911a52219947f8cf0 \
+                    file://node_modules/passport-oauth2-client-password/LI=
CENSE;md5=3D95ca2874231d1b4d06ca94c35aa604f7 \
+                    file://node_modules/statuses/LICENSE;md5=3D36e2bc837ce=
69a98cc33a9e140d457e5 \
+                    file://node_modules/zip-stream/LICENSE;md5=3D51478cb9e=
7ab40d3d3616c3794ded96b \
+                    file://node_modules/basic-auth/LICENSE;md5=3D42fffe6fe=
0b70501d52150ebb52113df \
+                    file://node_modules/mqtt-packet/LICENSE.md;md5=3D622e7=
7e45833bb4f785aebc7e41c0bdb \
+                    file://node_modules/mqtt-packet/node_modules/debug/LIC=
ENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/mqtt-packet/node_modules/ms/licens=
e.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/parse5-htmlparser2-tree-adapter/LI=
CENSE;md5=3D179850e04995d6fceaf64f2dd2a851b0 \
+                    file://node_modules/jsonata/LICENSE;md5=3D0a2fefbb55a8=
4675607e8efd57183e99 \
+                    file://node_modules/lodash.isplainobject/LICENSE;md5=
=3Da3b2b7770df62392c164de4001b59f8f \
+                    file://node_modules/https-proxy-agent/node_modules/deb=
ug/LICENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/https-proxy-agent/node_modules/ms/=
license.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/array-each/LICENSE;md5=3D7159ba8f2=
e9f17d4c29d1a73c4f4b759 \
+                    file://node_modules/typedarray-to-buffer/LICENSE;md5=
=3Dbadd5e91c737e7ffdf10b40c1f907761 \
+                    file://node_modules/istanbul-lib-source-maps/LICENSE;m=
d5=3D2c39380ca74c032242016476ea5f4e2c \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/make-dir/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/semver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/debug/LICENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/source-map/LICENSE;md5=3Db1ca6dbc0075d56cbd9931a75566cd44 \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/ms/license.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/istanbul-lib-source-maps/node_modu=
les/rimraf/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/xmlcreate/LICENSE;md5=3Dd229da563d=
a18fe5d58cd95a6467d584 \
+                    file://node_modules/mkdirp2/LICENSE;md5=3Db2d989bc186e=
7f6b418a5fdd5cc0b56b \
+                    file://node_modules/grunt-chmod/LICENSE-MIT;md5=3D3a22=
1608c3558736c42b6ae348ee55de \
+                    file://node_modules/caching-transform/license;md5=3D28=
9129afe2c8d393c7a535bcdcbddb86 \
+                    file://node_modules/caching-transform/node_modules/mak=
e-dir/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/caching-transform/node_modules/sem=
ver/LICENSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/js-yaml/LICENSE;md5=3Deffd621a9bf5=
d72d6a7e6ef819bf3afb \
+                    file://node_modules/@sindresorhus/is/license;md5=3Dd5f=
2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/undefsafe/LICENSE;md5=3D618de54e80=
747f52d17d55001558549e \
+                    file://node_modules/should-util/LICENSE;md5=3Ddc1de4fd=
31f0ead856f3e4a3d0e4bb0d \
+                    file://node_modules/to-regex-range/LICENSE;md5=3Db561e=
0a423bedc9d9ca9c8c67d40abb9 \
+                    file://node_modules/get-intrinsic/LICENSE;md5=3D0eb2c7=
3daa0ecf037cbdf3d0bb0c98d5 \
+                    file://node_modules/abbrev/LICENSE;md5=3De9c0b639498fb=
e60d17b10099aba77c0 \
+                    file://node_modules/test-exclude/LICENSE.txt;md5=3D8fd=
106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/test-exclude/node_modules/path-exi=
sts/license;md5=3Da12ebca0510a773644101a99a867d210 \
+                    file://node_modules/test-exclude/node_modules/find-up/=
license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-exclude/node_modules/p-locate=
/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-exclude/node_modules/p-limit/=
license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-exclude/node_modules/read-pkg=
/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-exclude/node_modules/read-pkg=
-up/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/test-exclude/node_modules/locate-p=
ath/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/argparse/LICENSE;md5=3Da2f2590d8d8=
2b0fa2b3e2fc5c69d2b81 \
+                    file://node_modules/findup-sync/LICENSE-MIT;md5=3D1591=
11132f87941857a4f42d60c880c8 \
+                    file://node_modules/findup-sync/node_modules/glob/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/uri-path/LICENSE-WTFPL;md5=3D8365d=
07beeb5f39d87e846dca3ae7b64 \
+                    file://node_modules/uri-path/LICENSE-MIT;md5=3D565078b=
a0c0b64399bf09a6eb7a5be28 \
+                    file://node_modules/wordwrap/LICENSE;md5=3Daea1cde6964=
5f4b99be4ff7ca9abcce1 \
+                    file://node_modules/agent-base/node_modules/debug/LICE=
NSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/agent-base/node_modules/ms/license=
.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/nth-check/LICENSE;md5=3Dd5b9cb3bc7=
f6ffd7bea8661f30447c11 \
+                    file://node_modules/merge-source-map/LICENSE;md5=3D0ce=
b9034c469f8ce8f74ad9b7e61177c \
+                    file://node_modules/merge-source-map/node_modules/sour=
ce-map/LICENSE;md5=3Db1ca6dbc0075d56cbd9931a75566cd44 \
+                    file://node_modules/load-json-file/license;md5=3Da12eb=
ca0510a773644101a99a867d210 \
+                    file://node_modules/load-json-file/node_modules/parse-=
json/license;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/load-json-file/node_modules/pify/l=
icense;md5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/resolve-from/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://packages/node_modules/node-red/LICENSE;md5=3Dd6=
f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/editor-client/L=
ICENSE;md5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/editor-client/s=
rc/vendor/ace/LICENSE;md5=3D794d11c5219c59c9efa2487c2b4066b2 \
+                    file://packages/node_modules/@node-red/editor-client/s=
rc/vendor/monaco/dist/LICENSE;md5=3Df54bb2c6fe5e92709d134914191197a3 \
+                    file://packages/node_modules/@node-red/editor-client/s=
rc/vendor/monaco/dist/theme/LICENSE;md5=3D280545e7ad0c4af4a6c0e737934a23b2 =
\
+                    file://packages/node_modules/@node-red/nodes/LICENSE;m=
d5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/editor-api/LICE=
NSE;md5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/util/LICENSE;md=
5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/registry/LICENS=
E;md5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://packages/node_modules/@node-red/runtime/LICENSE=
;md5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/agent-base/README.md;beginline=3D1=
18;endline=3D139;md5=3D817767aad5d49be3802ded0fd39ffb91 \
+                    file://node_modules/body/node_modules/bytes/Readme.md;=
beginline=3D35;endline=3D54;md5=3D0013724cc04a6cb8b764788cee133501 \
+                    file://node_modules/body/node_modules/raw-body/README.=
md;md5=3Def8467d6bd550b15f77457b59646b452 \
+                    file://node_modules/boolbase/README.md;md5=3D48c1ef355=
8d25499a96a3d66baed5d9c \
+                    file://node_modules/busboy/node_modules/isarray/README=
.md;beginline=3D34;endline=3D54;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/cli/README.md;md5=3Db149a33049b6f0=
76517901309f2f0a31 \
+                    file://node_modules/cookie-signature/Readme.md;beginli=
ne=3D21;endline=3D42;md5=3Ddb8ec78b5bb012861b19b8353c342fbe \
+                    file://node_modules/dicer/node_modules/isarray/README.=
md;beginline=3D34;endline=3D54;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/error/README.md;md5=3D90de56cef7c6=
bf007d92020c21744fe4 \
+                    file://node_modules/eventemitter2/README.md;md5=3De432=
6b894ff7415bfaa94e1da2b8bb34 \
+                    file://node_modules/faye-websocket/README.md;md5=3D263=
6658b8db7a569c2535e4e3a736561 \
+                    file://node_modules/fs.notify/README.md;beginline=3D39=
;endline=3D57;md5=3Dc82960e8037b3f5932e15efede72951b \
+                    file://node_modules/getobject/README.md;md5=3D00f4effc=
b4ee9ca22da785c919254a93 \
+                    file://node_modules/growl/Readme.md;md5=3Db893b04726af=
41be4aa9f17583f08f16 \
+                    file://node_modules/grunt-cli/README.md;md5=3Da24cc788=
ab726e615aa5bf0168c5d77d \
+                    file://node_modules/grunt-contrib-clean/README.md;md5=
=3Df693edcbae2a51d450211d2939580175 \
+                    file://node_modules/grunt-contrib-compress/README.md;m=
d5=3Df2d8b17f6e22f834e670404375d3ad94 \
+                    file://node_modules/grunt-contrib-concat/README.md;md5=
=3D71e951c33456cf77aa36b172db8b906c \
+                    file://node_modules/grunt-contrib-copy/README.md;md5=
=3D2139fac2f3e66d1410bece24c7b105c8 \
+                    file://node_modules/grunt-contrib-jshint/README.md;md5=
=3Da9d7e24dc015351de25bf1b5e90b3f9d \
+                    file://node_modules/grunt-contrib-uglify/README.md;md5=
=3D5e4764d2403e307a126a3dd0ae9d8f42 \
+                    file://node_modules/grunt-contrib-watch/README.md;md5=
=3D111dd9c59f13aa9f105aa5460b3ba38f \
+                    file://node_modules/grunt-legacy-log-utils/README.md;m=
d5=3Daeba4df3381a2ac857eca7273d5768ce \
+                    file://node_modules/https-proxy-agent/README.md;beginl=
ine=3D114;endline=3D135;md5=3D817767aad5d49be3802ded0fd39ffb91 \
+                    file://node_modules/imurmurhash/README.md;md5=3Dc1fd47=
197ecab8a0852a47c5876c059e \
+                    file://node_modules/isarray/README.md;beginline=3D40;e=
ndline=3D60;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/jshint/node_modules/isarray/README=
.md;beginline=3D34;endline=3D54;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/nise/node_modules/isarray/README.m=
d;beginline=3D34;endline=3D54;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/isarray/README.md;beginline=3D34;endline=3D54;md5=3D7fa99ddc3424107350=
ca6e9a24552085 \
+                    file://node_modules/node-red-node-test-helper/node_mod=
ules/readable-stream/node_modules/isarray/README.md;beginline=3D40;endline=
=3D60;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/opted/README.md;md5=3D9e345735559a=
35bcfecc9b066216165b \
+                    file://node_modules/pause/Readme.md;beginline=3D8;endl=
ine=3D29;md5=3Db45d61f441ee044a3ad2d6cdac00aa86 \
+                    file://node_modules/proxy/README.md;md5=3Da3629505960b=
b2c93bfe68c85534895b \
+                    file://node_modules/simple-cli/README.md;md5=3De9fb233=
cd000554e80d0f33663842342 \
+                    file://node_modules/spdx-exceptions/README.md;md5=3D3d=
a6b6bd12471d6d6b5d357602830417 \
+                    file://node_modules/spdx-license-ids/README.md;md5=3Df=
104993d690a59653087fcdab31036a4 \
+                    file://node_modules/underscore.string/README.markdown;=
md5=3D84c1525c2b4c2f76c941ec57789219e3"
+
+DEPENDS =3D "openssh-native"
+
+SRC_URI =3D " \
+    git://github.com/node-red/node-red.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Dmain \
+    git://git@github.com/node-red/jsdoc-nr-template.git;destsuffix=3Dgit/n=
ode_modules/jsdoc-nr-template;nobranch=3D1;protocol=3Dssh;rev=3D3c7c8f96d58=
5c7c5918a2e63519310e1297e162d \
+    https://registry.npmjs.org/%40babel/code-frame/-/code-frame-7.16.0.tgz=
;downloadfilename=3Dnpm2/babel-code-frame-7.16.0.tgz;sha512sum=3D205e0438c1=
15f9b7d8c0e98dc46cd29e347612642877b7f55173a964cde5e22e28e10370ce3b4902efc7c=
5d8c7ab469806f76a32e4046357a0d27a96f593ce44;subdir=3Dgit/node_modules/@babe=
l/code-frame;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/generator/-/generator-7.16.0.tgz;d=
ownloadfilename=3Dnpm2/babel-generator-7.16.0.tgz;sha512sum=3D451f215027d14=
27f63f513ca1155e8f4b8b0a312cf627ea135996f50e47cb529dac650f4a74fa56b4d193fdf=
d29d1b7a1dc84aafe5f47cedabf2fac44e22467b;subdir=3Dgit/node_modules/@babel/g=
enerator;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/helper-function-name/-/helper-func=
tion-name-7.16.0.tgz;downloadfilename=3Dnpm2/babel-helper-function-name-7.1=
6.0.tgz;sha512sum=3D059878984935c62da1e071635945d1417e40131e2bbda6711e06b1f=
6072374b59d923b18ecc2ade69d28b63b20e67a17c3ea41f9c94c0a3c3e684558003323a2;s=
ubdir=3Dgit/node_modules/@babel/helper-function-name;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/helper-get-function-arity/-/helper=
-get-function-arity-7.16.0.tgz;downloadfilename=3Dnpm2/babel-helper-get-fun=
ction-arity-7.16.0.tgz;sha512sum=3D0120aab8d732c02d4d91887fcfb0a0a77c37d585=
bc6a88e360894d83855e2621e4ab23f803322faf8ab1ee96036f8fecf1872c656aaa392c609=
2f8d4cf59290d;subdir=3Dgit/node_modules/@babel/helper-get-function-arity;st=
riplevel=3D1 \
+    https://registry.npmjs.org/%40babel/helper-hoist-variables/-/helper-ho=
ist-variables-7.16.0.tgz;downloadfilename=3Dnpm2/babel-helper-hoist-variabl=
es-7.16.0.tgz;sha512sum=3Dd40665a5ace3511d0441942fdec81135f33d9845563cadcce=
af95a95ccc0f8410270fcf75cf87a56995b12b2f95283290a1852724e700091ed8658f56d8a=
5c9a;subdir=3Dgit/node_modules/@babel/helper-hoist-variables;striplevel=3D1=
 \
+    https://registry.npmjs.org/%40babel/helper-split-export-declaration/-/=
helper-split-export-declaration-7.16.0.tgz;downloadfilename=3Dnpm2/babel-he=
lper-split-export-declaration-7.16.0.tgz;sha512sum=3Dd1830c469b8314d1931cd4=
628aa257d7d1a33570381f413c8d9da26dc71f4b1682a206e6dda9b958dff69d0363d189d0c=
0658cd49d3a18e710daa9e1dfed296b;subdir=3Dgit/node_modules/@babel/helper-spl=
it-export-declaration;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/helper-validator-identifier/-/help=
er-validator-identifier-7.15.7.tgz;downloadfilename=3Dnpm2/babel-helper-val=
idator-identifier-7.15.7.tgz;sha512sum=3D2b826f0ad42a69df4e636fb24d4f30f84f=
36cb093f7def842cd96dd46f33ddb5469597e7fe139c410b14846856fcdfad6f77f12bcd34c=
0bb4a384fda3349bbdb;subdir=3Dgit/node_modules/@babel/helper-validator-ident=
ifier;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/highlight/-/highlight-7.16.0.tgz;d=
ownloadfilename=3Dnpm2/babel-highlight-7.16.0.tgz;sha512sum=3Db7c307e359144=
32941b6edbee08400ddab6a7af03695182a036c32541fd88969ac0d2bb295966e5ce532f6b8=
9cdf485fcdab8415f76cba4fde5d346b1ab7ddd2;subdir=3Dgit/node_modules/@babel/h=
ighlight;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/parser/-/parser-7.16.4.tgz;downloa=
dfilename=3Dnpm2/babel-parser-7.16.4.tgz;sha512sum=3De95d2a74f51a8951c7dd1b=
5978b22c73eea90e16d8cc747ca2003cc3e7fe59cefb0ee5eda35f60d90530bde20da12df85=
30f96f3f8500c6242c7e8b89fbc5c9e;subdir=3Dgit/node_modules/@babel/parser;str=
iplevel=3D1 \
+    https://registry.npmjs.org/%40babel/runtime/-/runtime-7.16.3.tgz;downl=
oadfilename=3Dnpm2/babel-runtime-7.16.3.tgz;sha512sum=3D581c1e91ca9a71d6367=
bd005fd0ed62c551699d24625391b8ea4e3a0c0e05e4559dd9454bce3ec2dbe4a770212a105=
6c6cff834335595b8661722d03be96cd4d;subdir=3Dgit/node_modules/@babel/runtime=
;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/template/-/template-7.16.0.tgz;dow=
nloadfilename=3Dnpm2/babel-template-7.16.0.tgz;sha512sum=3D32765da450ff65d6=
215f08ae9ccaaa832672b9c698b1b2f422b8e81a36958468a5cfec7c601fbe9117f28123888=
f5c8eb5628f971ecd069fbd2354504a0b1de4;subdir=3Dgit/node_modules/@babel/temp=
late;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/traverse/-/traverse-7.16.3.tgz;dow=
nloadfilename=3Dnpm2/babel-traverse-7.16.3.tgz;sha512sum=3D7a896e9abd6f54c8=
ea7af0a9c153bdf7237f2e818bd04c8788b3b9234e3769842fc0e27d791e54b19482947542c=
df84176e300b12ce003fe80caa3e335ac896a;subdir=3Dgit/node_modules/@babel/trav=
erse;striplevel=3D1 \
+    https://registry.npmjs.org/%40babel/types/-/types-7.16.0.tgz;downloadf=
ilename=3Dnpm2/babel-types-7.16.0.tgz;sha512sum=3D3c9820fe4dd274bb066f78618=
ac16fb4b3b0e6db35d77925ae92ee20fb4224853e041db87eaaba95ff115aa289123cea5d1f=
40107d6b21be574eac011c1fa442;subdir=3Dgit/node_modules/@babel/types;striple=
vel=3D1 \
+    https://registry.npmjs.org/%40mapbox/node-pre-gyp/-/node-pre-gyp-1.0.7=
.tgz;downloadfilename=3Dnpm2/mapbox-node-pre-gyp-1.0.7.tgz;sha512sum=3D3e99=
52be5e2927937706456301d0f3a4f85550f742ef7260b6d911f8b9c1c7638e442d46090b018=
d4784ba2a5ff6e39a00cd526f171d6457d1dca0d32a6d92d0;subdir=3Dgit/node_modules=
/@mapbox/node-pre-gyp;striplevel=3D1 \
+    https://registry.npmjs.org/%40prantlf/jsonlint/-/jsonlint-10.2.0.tgz;d=
ownloadfilename=3Dnpm2/prantlf-jsonlint-10.2.0.tgz;sha512sum=3D28c15f76cd29=
7962cb7c2bb76e10a54e210dd2d763fd9f3a409be7d5ac0a1f0b3aafe4b1e93ddae3811a773=
e8ebea37a669b1192a691a59c6a75dbef0c074365;subdir=3Dgit/node_modules/@prantl=
f/jsonlint;striplevel=3D1 \
+    https://registry.npmjs.org/%40sindresorhus/is/-/is-0.14.0.tgz;download=
filename=3Dnpm2/sindresorhus-is-0.14.0.tgz;sha512sum=3Df4d113f75d0335a20f9e=
06272cb3de83e3a0ceab22f6e3389926e8539cbaa7c4b90f3313544b0966b6b08be0680cd51=
505ad83849a9061416f3037e0534eb62d;subdir=3Dgit/node_modules/package-json/no=
de_modules/@sindresorhus/is;striplevel=3D1 \
+    https://registry.npmjs.org/%40sindresorhus/is/-/is-4.2.0.tgz;downloadf=
ilename=3Dnpm2/sindresorhus-is-4.2.0.tgz;sha512sum=3D56413728b0662707026950=
11b50a5fb8a70abfc81c06652e6eb7c7185f38757bae5ba8e0b116313edcdc2213f22bd5803=
e946ddbfc58eb3903f4c9d1689cd2cb;subdir=3Dgit/node_modules/@sindresorhus/is;=
striplevel=3D1 \
+    https://registry.npmjs.org/%40sinonjs/commons/-/commons-1.8.3.tgz;down=
loadfilename=3Dnpm2/sinonjs-commons-1.8.3.tgz;sha512sum=3Dc6435c2c09ffc1969=
7d7844f9708b370a89c0e4f46dc5f26da75372fb5249b9cc1813c224f4c2ca05007c7d26ae7=
a7c9035cffeee286b4246ed7ab0e5022c81d;subdir=3Dgit/node_modules/@sinonjs/com=
mons;striplevel=3D1 \
+    https://registry.npmjs.org/%40sinonjs/fake-timers/-/fake-timers-6.0.1.=
tgz;downloadfilename=3Dnpm2/sinonjs-fake-timers-6.0.1.tgz;sha512sum=3D3193d=
4c6b985b9b237e974b50c8dea988d1874dd6092ceb626d159bf147aee58e348d09e2ba534f1=
9c789ac116397ba87e0a94b7accf1d28b51fd7db8d1fcd44;subdir=3Dgit/node_modules/=
node-red-node-test-helper/node_modules/@sinonjs/fake-timers;striplevel=3D1 =
\
+    https://registry.npmjs.org/%40sinonjs/fake-timers/-/fake-timers-7.1.2.=
tgz;downloadfilename=3Dnpm2/sinonjs-fake-timers-7.1.2.tgz;sha512sum=3D89000=
3b16e0b04c212a99e828b576ea492fda69aeac1c5454dc3ac12640e1215be28b0959ff63826=
bbe0da4d7d7c81c2a7e885a6bae260f4dd45c411f0d6d43e;subdir=3Dgit/node_modules/=
@sinonjs/fake-timers;striplevel=3D1 \
+    https://registry.npmjs.org/%40sinonjs/samsam/-/samsam-5.3.1.tgz;downlo=
adfilename=3Dnpm2/sinonjs-samsam-5.3.1.tgz;sha512sum=3Dd477346f54edc9f06ef2=
2c45feda5f4874d558ac0204b6384096e482713b1dcc32bd3db102b0f16f82bb74c82a466de=
ccc8f8b25bce65bfb38c71121bfa8700e;subdir=3Dgit/node_modules/node-red-node-t=
est-helper/node_modules/@sinonjs/samsam;striplevel=3D1 \
+    https://registry.npmjs.org/%40sinonjs/samsam/-/samsam-6.0.2.tgz;downlo=
adfilename=3Dnpm2/sinonjs-samsam-6.0.2.tgz;sha512sum=3D8f13d13e9f67f77722ed=
bf2131f24e1433d12c561a74de854a97913854d1e14345e22e5bf842ba9b84173cee3a04384=
5811cb526e4bcef302714ecc253030971;subdir=3Dgit/node_modules/@sinonjs/samsam=
;striplevel=3D1 \
+    https://registry.npmjs.org/%40sinonjs/text-encoding/-/text-encoding-0.=
7.1.tgz;downloadfilename=3Dnpm2/sinonjs-text-encoding-0.7.1.tgz;sha512sum=
=3Dfa24db9edc362193dbfda9d50dbca9cdf41af9acbae0c5b4668f1a27c8193d630c2bafce=
b9b3156fa9543cc6a0aa338f9e6b5ab979c50800959773bba208dea9;subdir=3Dgit/node_=
modules/@sinonjs/text-encoding;striplevel=3D1 \
+    https://registry.npmjs.org/%40szmarczak/http-timer/-/http-timer-1.1.2.=
tgz;downloadfilename=3Dnpm2/szmarczak-http-timer-1.1.2.tgz;sha512sum=3D5c80=
765dbcc74cdea27888df20c57d86555c7cf536eacdaf69f61641c6475971cec626916581032=
84c1d975dbd672839d3e7e8615da30a0b6ba9203aa8db8d48;subdir=3Dgit/node_modules=
/package-json/node_modules/@szmarczak/http-timer;striplevel=3D1 \
+    https://registry.npmjs.org/%40szmarczak/http-timer/-/http-timer-4.0.6.=
tgz;downloadfilename=3Dnpm2/szmarczak-http-timer-4.0.6.tgz;sha512sum=3De010=
1f7f29183a03bee67cc1598c04dd6f74b0180b26850f45659c2fcc25ca233c201f22a49cf75=
0c27d29741dd512905e92a9f13bad9fcd0766d5acbb6bbbeb;subdir=3Dgit/node_modules=
/@szmarczak/http-timer;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/cacheable-request/-/cacheable-requ=
est-6.0.2.tgz;downloadfilename=3Dnpm2/types-cacheable-request-6.0.2.tgz;sha=
512sum=3D077c55a3e76528cea79ca4dc9a6e59b58fce2fc6ce00e7763a579ef4cd737edeb9=
a31e743b38c41d6f75b03894f63e9cbd6f048e0d7f4247f8c5dda4ba002950;subdir=3Dgit=
/node_modules/@types/cacheable-request;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/http-cache-semantics/-/http-cache-=
semantics-4.0.1.tgz;downloadfilename=3Dnpm2/types-http-cache-semantics-4.0.=
1.tgz;sha512sum=3D499b3b7a46cff02374b71546db15511fa1202a6126df504ec40d3bbe4=
15a113cd9cf5c61f9c6edf01708d2c969ca6bf0871e5d9459d01b6ad394f5509fe8913d;sub=
dir=3Dgit/node_modules/@types/http-cache-semantics;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/keyv/-/keyv-3.1.3.tgz;downloadfile=
name=3Dnpm2/types-keyv-3.1.3.tgz;sha512sum=3D157089832c8dde2bd5811a2697887d=
e06fe9de463ebbf07ce8b6be429b5ca89696b415ad99ce93b6435f4b8d27f5b22fc8bb5e1e1=
ef35ceb606e86ce44a3db0e;subdir=3Dgit/node_modules/@types/keyv;striplevel=3D=
1 \
+    https://registry.npmjs.org/%40types/node/-/node-16.11.10.tgz;downloadf=
ilename=3Dnpm2/types-node-16.11.10.tgz;sha512sum=3Ddda4671dad4a94e104849ebe=
0afc8728ae6f13d05c2c68ed529c2fa982d1bd835028c7da6eedc1c1f25a03f48b5bc7717b6=
f0bb0d0e3b47c1e3d3bb39f782638;subdir=3Dgit/node_modules/@types/node;striple=
vel=3D1 \
+    https://registry.npmjs.org/%40types/normalize-package-data/-/normalize=
-package-data-2.4.1.tgz;downloadfilename=3Dnpm2/types-normalize-package-dat=
a-2.4.1.tgz;sha512sum=3D1a3edc23bcfef7c336f364ea9a9d8ae4422ca28b941336c1261=
410cc31378d221193aafd82ccf4a14a24a88511e2ed51ddd307a34a431cceec34e1f286e972=
a7;subdir=3Dgit/node_modules/@types/normalize-package-data;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/responselike/-/responselike-1.0.0.=
tgz;downloadfilename=3Dnpm2/types-responselike-1.0.0.tgz;sha512sum=3Df39636=
0638ae7c5cda30896f243bd34c1f05c65db17cba381e0987cd5073d3cc38c0378f0938d8c3a=
e8f76ba253b4933962df26a6fd80a046e7f2a350dd4154c;subdir=3Dgit/node_modules/@=
types/responselike;striplevel=3D1 \
+    https://registry.npmjs.org/%40ungap/promise-all-settled/-/promise-all-=
settled-1.1.2.tgz;downloadfilename=3Dnpm2/ungap-promise-all-settled-1.1.2.t=
gz;sha512sum=3Db0bfdc12f2560270a55f0d301e4f39ff62f41ba4a3f140740ad7354c431b=
292b26a51a2caa1c23f605a0151652ac1af67fdb625c84b036108f9a57ea52ac9bf5;subdir=
=3Dgit/node_modules/@ungap/promise-all-settled;striplevel=3D1 \
+    https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz;downloadfilename=
=3Dnpm2/abbrev-1.1.1.tgz;sha512sum=3D9e77bdfc8890fe1cc8858ea97439db06dcfb0e=
33d32ab634d0fff3bcf4a6e69385925eb1b86ac69d79ff56d4cd35f36d01f67dff546d7a192=
ccd4f6a7138a2d1;subdir=3Dgit/node_modules/abbrev;striplevel=3D1 \
+    https://registry.npmjs.org/accepts/-/accepts-1.3.7.tgz;downloadfilenam=
e=3Dnpm2/accepts-1.3.7.tgz;sha512sum=3D225f3442cd968d89492013733642ba298aa5=
54c4db64b5e01f1da84f4a54fdf8d11f2129f8f11f10f634477582c001953ad6aec61d613b1=
36021fe5bbfb750a4;subdir=3Dgit/node_modules/accepts;striplevel=3D1 \
+    https://registry.npmjs.org/acorn-walk/-/acorn-walk-8.2.0.tgz;downloadf=
ilename=3Dnpm2/acorn-walk-8.2.0.tgz;sha512sum=3D93e8b21c4b8f812c3a49bb83a46=
40cfb4e874146b4e03677a3e17a092cd732fbc8e4a32f9da12a5def9855ee79e51f679fa18f=
b78d387e8b38c1c829c35d920c;subdir=3Dgit/node_modules/acorn-walk;striplevel=
=3D1 \
+    https://registry.npmjs.org/acorn/-/acorn-8.5.0.tgz;downloadfilename=3D=
npm2/acorn-8.5.0.tgz;sha512sum=3Dc976d8785cbe8d4b98777fc20dc83636421813df75=
5d85ff6e37bb2e68c98a051c89a78ed494785f15e0088575fd973f751b85132c352f4a5b03e=
ab29c9916e5;subdir=3Dgit/node_modules/acorn;striplevel=3D1 \
+    https://registry.npmjs.org/adm-zip/-/adm-zip-0.5.9.tgz;downloadfilenam=
e=3Dnpm2/adm-zip-0.5.9.tgz;sha512sum=3Db3eddf5cb91e78b8d9da42e3081c10b9fa48=
e5fb8dfa4206071bbae77d2755064656897477b63f33cf3fc70f4718651c26329ff0bbad377=
54f45406ae8dec08e;subdir=3Dgit/node_modules/adm-zip;striplevel=3D1 \
+    https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz;downloadf=
ilename=3Dnpm2/agent-base-6.0.2.tgz;sha512sum=3D45937035c945efe312ffc6c383b=
d1a9a0df6772799199c620ee42667128b025423af78c6c8bc7ee0a924e7c50eec3d90760148=
402a2fb92b991129dee911ba5d;subdir=3Dgit/node_modules/agent-base;striplevel=
=3D1 \
+    https://registry.npmjs.org/ajv/-/ajv-6.10.2.tgz;downloadfilename=3Dnpm=
2/ajv-6.10.2.tgz;sha512sum=3D4d7b54504607b9a4c46cb65620a52be69981ba10cbcbef=
0a62d3d875c57ca82fa93992fe34aa98c2f59246b5571e7f99991440bbcbc94c0ce71fb39a8=
3a45547;subdir=3Dgit/node_modules/@prantlf/jsonlint/node_modules/ajv;stripl=
evel=3D1 \
+    https://registry.npmjs.org/ajv/-/ajv-8.6.3.tgz;downloadfilename=3Dnpm2=
/ajv-8.6.3.tgz;sha512sum=3D48c24e7433fa2ea4e40f452af2a2e2fa03304add229972d2=
574f34a85570242a47f54e8c6fe49418701733428d6dc04f82ecad5b2bc5c5c1e030b7b60f6=
5d2a7;subdir=3Dgit/node_modules/ajv;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-align/-/ansi-align-3.0.1.tgz;downloadf=
ilename=3Dnpm2/ansi-align-3.0.1.tgz;sha512sum=3D20e7f0c0117989ccce8e9fd6798=
e18c728ea005310a19b9f750583775f52104c5b54b357aafa73489fcced96b8fec08f990d3e=
191aaea00edb19c20d7317b0eb;subdir=3Dgit/node_modules/ansi-align;striplevel=
=3D1 \
+    https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.1.tgz;downloa=
dfilename=3Dnpm2/ansi-colors-4.1.1.tgz;sha512sum=3D2685f46a919b1da50904d97a=
c85fa9e89005619ebaebf86108628de6df501636c940a514fe0f0c35b1436ef7eb80a5ef235=
42966994f3a7c08a3df655ff00098;subdir=3Dgit/node_modules/ansi-colors;striple=
vel=3D1 \
+    https://registry.npmjs.org/ansi-escape-sequences/-/ansi-escape-sequenc=
es-4.1.0.tgz;downloadfilename=3Dnpm2/ansi-escape-sequences-4.1.0.tgz;sha512=
sum=3D7735bd907c47d35d6e06c89d4d7775e095e0cf27bf60b6f62f378a6786ec825fca9f0=
c7c02d6d2164906c5a81d34ea21d0396a1c299f8848d62816aa8ce6a757;subdir=3Dgit/no=
de_modules/ansi-escape-sequences;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-2.1.1.tgz;sha1sum=3Dc3b33ab5ee360d86e0e628f0468ae=
7ef27d654df;subdir=3Dgit/node_modules/grunt-contrib-concat/node_modules/ans=
i-regex;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-2.1.1.tgz;sha1sum=3Dc3b33ab5ee360d86e0e628f0468ae=
7ef27d654df;subdir=3Dgit/node_modules/grunt-contrib-copy/node_modules/ansi-=
regex;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-2.1.1.tgz;sha1sum=3Dc3b33ab5ee360d86e0e628f0468ae=
7ef27d654df;subdir=3Dgit/node_modules/has-ansi/node_modules/ansi-regex;stri=
plevel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-2.1.1.tgz;sha1sum=3Dc3b33ab5ee360d86e0e628f0468ae=
7ef27d654df;subdir=3Dgit/node_modules/maxmin/node_modules/ansi-regex;stripl=
evel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-4.1.0.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-4.1.0.tgz;sha512sum=3Dd5aa5e3df5ccd54392ab0d28f48=
885028bd5cfd3394b50e0fb84eb0f07cc7b043aa7fae632e79beed5998d0d6bc782e8cb502b=
060828a86a5faaa748e2ba2776;subdir=3Dgit/node_modules/nyc/node_modules/ansi-=
regex;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-5.0.1.tgz;sha512sum=3Daae2505e54d25062f62c7f52517=
a3c570b18e2ca1a9e1828e8b3529bce04d4b05c13cb373b4c29762473c91f73fd9649325316=
bf7eea38e6fda5d26531410a15;subdir=3Dgit/node_modules/ansi-regex;striplevel=
=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-2.2.1.tgz;sha1sum=3Db432dd3358b634cf75e1e46643=
68240533c1ddbe;subdir=3Dgit/node_modules/grunt-contrib-concat/node_modules/=
ansi-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-2.2.1.tgz;sha1sum=3Db432dd3358b634cf75e1e46643=
68240533c1ddbe;subdir=3Dgit/node_modules/grunt-contrib-copy/node_modules/an=
si-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-2.2.1.tgz;sha1sum=3Db432dd3358b634cf75e1e46643=
68240533c1ddbe;subdir=3Dgit/node_modules/maxmin/node_modules/ansi-styles;st=
riplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-3.2.1.tgz;sha512sum=3D553d1923a91945d4e1f18c89=
c3748c6d89bfbbe36a7ec03112958ed0f7fdb2af3f7bde16c713a93cac7d151d459720ad395=
0cd390fbc9ed96a17189173eaf9a8;subdir=3Dgit/node_modules/@babel/highlight/no=
de_modules/ansi-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-3.2.1.tgz;sha512sum=3D553d1923a91945d4e1f18c89=
c3748c6d89bfbbe36a7ec03112958ed0f7fdb2af3f7bde16c713a93cac7d151d459720ad395=
0cd390fbc9ed96a17189173eaf9a8;subdir=3Dgit/node_modules/args/node_modules/a=
nsi-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-3.2.1.tgz;sha512sum=3D553d1923a91945d4e1f18c89=
c3748c6d89bfbbe36a7ec03112958ed0f7fdb2af3f7bde16c713a93cac7d151d459720ad395=
0cd390fbc9ed96a17189173eaf9a8;subdir=3Dgit/node_modules/grunt-contrib-uglif=
y/node_modules/ansi-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-3.2.1.tgz;sha512sum=3D553d1923a91945d4e1f18c89=
c3748c6d89bfbbe36a7ec03112958ed0f7fdb2af3f7bde16c713a93cac7d151d459720ad395=
0cd390fbc9ed96a17189173eaf9a8;subdir=3Dgit/node_modules/nyc/node_modules/an=
si-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-3.2.1.tgz;sha512sum=3D553d1923a91945d4e1f18c89=
c3748c6d89bfbbe36a7ec03112958ed0f7fdb2af3f7bde16c713a93cac7d151d459720ad395=
0cd390fbc9ed96a17189173eaf9a8;subdir=3Dgit/node_modules/simple-cli/node_mod=
ules/ansi-styles;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz;downloa=
dfilename=3Dnpm2/ansi-styles-4.3.0.tgz;sha512sum=3Dcdb07dac22404f5adb8e2543=
6f686a2851cd60bc60b64f0d511c59dc86700f717a36dc5b5d94029e74a2d4b931f880e885d=
3e5169db6db05402c885e64941212;subdir=3Dgit/node_modules/ansi-styles;striple=
vel=3D1 \
+    https://registry.npmjs.org/anymatch/-/anymatch-3.1.2.tgz;downloadfilen=
ame=3Dnpm2/anymatch-3.1.2.tgz;sha512sum=3D3f8dde3df38022ea6482e1d4c9cadce2a=
27d933f198ae3948a36844f05fb4c7b7463f18d2bbbf469af2b63cd7ac568d9eeb25d0395dd=
31ca5515328cabe46f5a;subdir=3Dgit/node_modules/anymatch;striplevel=3D1 \
+    https://registry.npmjs.org/append-field/-/append-field-1.0.0.tgz;downl=
oadfilename=3Dnpm2/append-field-1.0.0.tgz;sha1sum=3D1e3440e915f0b1203d23748=
e78edd7b9b5b43e56;subdir=3Dgit/node_modules/append-field;striplevel=3D1 \
+    https://registry.npmjs.org/append-transform/-/append-transform-1.0.0.t=
gz;downloadfilename=3Dnpm2/append-transform-1.0.0.tgz;sha512sum=3D3f4d3da18=
91e1f253be36892649cd9672c23e104497674d67df68ab8940b69b942675bb3ebf716e32691=
81c0daa10faec0ec719edd204547307ec34fdab8b483;subdir=3Dgit/node_modules/appe=
nd-transform;striplevel=3D1 \
+    https://registry.npmjs.org/aproba/-/aproba-2.0.0.tgz;downloadfilename=
=3Dnpm2/aproba-2.0.0.tgz;sha512sum=3D9587b81b1ed04fe30a19b0ec03e67e85efd6b5=
e7f4062c033a52bf5e406b75fb21f49fe33cf5db5f4b44f71f5c976ed39aee608374146d4ad=
061aff2f8a3873d;subdir=3Dgit/node_modules/aproba;striplevel=3D1 \
+    https://registry.npmjs.org/archiver-utils/-/archiver-utils-2.1.0.tgz;d=
ownloadfilename=3Dnpm2/archiver-utils-2.1.0.tgz;sha512sum=3D6c42ffc946ff7cd=
362353b94cfdefd674620e4bf8bccbc46273f31efd958991e787e64c86faa1bfe1350824427=
2140d62058d9550c25f57b37e7a23a0403077f;subdir=3Dgit/node_modules/archiver-u=
tils;striplevel=3D1 \
+    https://registry.npmjs.org/archiver/-/archiver-5.3.0.tgz;downloadfilen=
ame=3Dnpm2/archiver-5.3.0.tgz;sha512sum=3D894c3ea03c0ad1f80da6fbde12c750d00=
b1ee8820aced04953653413d333b3331f995554cafd502614b62135bd642ab1f1d92d031540=
8d65a429e86e644f0e3e;subdir=3Dgit/node_modules/archiver;striplevel=3D1 \
+    https://registry.npmjs.org/archy/-/archy-1.0.0.tgz;downloadfilename=3D=
npm2/archy-1.0.0.tgz;sha1sum=3Df9c8c13757cc1dd7bc379ac77b2c62a5c2868c40;sub=
dir=3Dgit/node_modules/archy;striplevel=3D1 \
+    https://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-2.0.0.t=
gz;downloadfilename=3Dnpm2/are-we-there-yet-2.0.0.tgz;sha512sum=3D0a2fea10d=
9b01e7b18a3dc4a21c5093792de0ca749e91d59d63f55fc9e70caaf2787f9983c4a482896c1=
657b598c6d381e22bbcd5fe9e95b3df79d8cacc79423;subdir=3Dgit/node_modules/are-=
we-there-yet;striplevel=3D1 \
+    https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz;downloadfile=
name=3Dnpm2/argparse-1.0.10.tgz;sha512sum=3Da39468cbab4d1b848bfc53a408037a4=
738e26a4652db944b605adc32db49a9b75df015ab9c0f9f1b3e7b88de4f6f4ea9bc11af9798=
10d01e3c74996c957be84e;subdir=3Dgit/node_modules/argparse;striplevel=3D1 \
+    https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz;downloadfilen=
ame=3Dnpm2/argparse-2.0.1.tgz;sha512sum=3Df3ef56a9e6db173a57f4e47e59ae8edbd=
6ac22881e44ccdc1ad00835da4c1c7c80835d1fd3969215505b704a867ff3d7c35123019faa=
dbf6c4060dc3beeacadd;subdir=3Dgit/node_modules/mocha/node_modules/argparse;=
striplevel=3D1 \
+    https://registry.npmjs.org/args/-/args-5.0.1.tgz;downloadfilename=3Dnp=
m2/args-5.0.1.tgz;sha512sum=3Dd64aa614216c3df7dabd0146b7c3b125d21c113b62f7d=
93249150f3293a16868cbea64499fc1c55353b1298e5b32a7d9294c1341cd6666402398661a=
54e1c5b5;subdir=3Dgit/node_modules/args;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-1.0.4.tgz;downloadf=
ilename=3Dnpm2/array-back-1.0.4.tgz;sha1sum=3D644ba7f095f7ffcf7c43b5f0dc39d=
3c1f03c063b;subdir=3Dgit/node_modules/reduce-extract/node_modules/array-bac=
k;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-1.0.4.tgz;downloadf=
ilename=3Dnpm2/array-back-1.0.4.tgz;sha1sum=3D644ba7f095f7ffcf7c43b5f0dc39d=
3c1f03c063b;subdir=3Dgit/node_modules/reduce-without/node_modules/array-bac=
k;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-1.0.4.tgz;downloadf=
ilename=3Dnpm2/array-back-1.0.4.tgz;sha1sum=3D644ba7f095f7ffcf7c43b5f0dc39d=
3c1f03c063b;subdir=3Dgit/node_modules/stream-connect/node_modules/array-bac=
k;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-2.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-2.0.0.tgz;sha512sum=3D789bf8a4b2ee7cfde0e64719af2=
d23e965e921bcd8c3d1940789952599e8f707f0881c5b8b34e71c2c375496f4edc06285b157=
e3c63ba12ad6f72fa0b78825cb;subdir=3Dgit/node_modules/command-line-tool/node=
_modules/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-2.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-2.0.0.tgz;sha512sum=3D789bf8a4b2ee7cfde0e64719af2=
d23e965e921bcd8c3d1940789952599e8f707f0881c5b8b34e71c2c375496f4edc06285b157=
e3c63ba12ad6f72fa0b78825cb;subdir=3Dgit/node_modules/command-line-usage/nod=
e_modules/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-2.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-2.0.0.tgz;sha512sum=3D789bf8a4b2ee7cfde0e64719af2=
d23e965e921bcd8c3d1940789952599e8f707f0881c5b8b34e71c2c375496f4edc06285b157=
e3c63ba12ad6f72fa0b78825cb;subdir=3Dgit/node_modules/table-layout/node_modu=
les/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-2.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-2.0.0.tgz;sha512sum=3D789bf8a4b2ee7cfde0e64719af2=
d23e965e921bcd8c3d1940789952599e8f707f0881c5b8b34e71c2c375496f4edc06285b157=
e3c63ba12ad6f72fa0b78825cb;subdir=3Dgit/node_modules/test-value/node_module=
s/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-3.1.0.tgz;downloadf=
ilename=3Dnpm2/array-back-3.1.0.tgz;sha512sum=3D4e4bb10385023afc6e0cae8d658=
5c26a5b331338fe4cbb33c804a8a24cbe8bbe3697d4eab0e75808c249ba9c5189ceb5870aae=
36da6907786072eabd495487d5;subdir=3Dgit/node_modules/ansi-escape-sequences/=
node_modules/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-3.1.0.tgz;downloadf=
ilename=3Dnpm2/array-back-3.1.0.tgz;sha512sum=3D4e4bb10385023afc6e0cae8d658=
5c26a5b331338fe4cbb33c804a8a24cbe8bbe3697d4eab0e75808c249ba9c5189ceb5870aae=
36da6907786072eabd495487d5;subdir=3Dgit/node_modules/command-line-args/node=
_modules/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-3.1.0.tgz;downloadf=
ilename=3Dnpm2/array-back-3.1.0.tgz;sha512sum=3D4e4bb10385023afc6e0cae8d658=
5c26a5b331338fe4cbb33c804a8a24cbe8bbe3697d4eab0e75808c249ba9c5189ceb5870aae=
36da6907786072eabd495487d5;subdir=3Dgit/node_modules/find-replace/node_modu=
les/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-4.0.2.tgz;downloadf=
ilename=3Dnpm2/array-back-4.0.2.tgz;sha512sum=3D35b74c7b3c6a7fde1c9cd7d62cb=
ed5fe29b451bf809db6f4228661bf389ef3ee072789cc42ecc7bb2e3d1641980892b6c80968=
67799e881e8054c0a56eb235be;subdir=3Dgit/node_modules/cache-point/node_modul=
es/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-5.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-5.0.0.tgz;sha512sum=3D920556c0945e656995b96390284=
3a88572895fe9c3d36240679e03d5145696ff0bd0d79b6ae280685c4008acc1ef8453725b75=
f96373e4a1da2d10c03d96c313;subdir=3Dgit/node_modules/dmd/node_modules/array=
-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-5.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-5.0.0.tgz;sha512sum=3D920556c0945e656995b96390284=
3a88572895fe9c3d36240679e03d5145696ff0bd0d79b6ae280685c4008acc1ef8453725b75=
f96373e4a1da2d10c03d96c313;subdir=3Dgit/node_modules/file-set/node_modules/=
array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-5.0.0.tgz;downloadf=
ilename=3Dnpm2/array-back-5.0.0.tgz;sha512sum=3D920556c0945e656995b96390284=
3a88572895fe9c3d36240679e03d5145696ff0bd0d79b6ae280685c4008acc1ef8453725b75=
f96373e4a1da2d10c03d96c313;subdir=3Dgit/node_modules/sort-array/node_module=
s/array-back;striplevel=3D1 \
+    https://registry.npmjs.org/array-back/-/array-back-6.2.0.tgz;downloadf=
ilename=3Dnpm2/array-back-6.2.0.tgz;sha512sum=3D9a2c55bf4dc638e9ffb9b1c4e12=
4d0fae7af5f8d844dd93426831512336448e093ed6804461ec2f3ff8dca159836913704debd=
a7117224805c17b0b15b3ffee0;subdir=3Dgit/node_modules/array-back;striplevel=
=3D1 \
+    https://registry.npmjs.org/array-each/-/array-each-1.0.1.tgz;downloadf=
ilename=3Dnpm2/array-each-1.0.1.tgz;sha1sum=3Da794af0c05ab1752846ee753a1f21=
1a05ba0c44f;subdir=3Dgit/node_modules/array-each;striplevel=3D1 \
+    https://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz;dow=
nloadfilename=3Dnpm2/array-flatten-1.1.1.tgz;sha1sum=3D9a5f699051b1e7073328=
f2a008968b64ea2955d2;subdir=3Dgit/node_modules/array-flatten;striplevel=3D1=
 \
+    https://registry.npmjs.org/array-slice/-/array-slice-1.1.0.tgz;downloa=
dfilename=3Dnpm2/array-slice-1.1.0.tgz;sha512sum=3D075a8c0f74413fb3bca341f6=
29bad70f207421c71e8cc175e7ef3b2ef968af5d8e34f4473fa8138d730d92dfdddd9b8e19b=
01eeba84599a09f102236e147e9eb;subdir=3Dgit/node_modules/array-slice;striple=
vel=3D1 \
+    https://registry.npmjs.org/arrify/-/arrify-2.0.1.tgz;downloadfilename=
=3Dnpm2/arrify-2.0.1.tgz;sha512sum=3Ddddb84c2d8bcf34c6a8b878030df00c91e1ad0=
1c93f74ce861d2e57af7ebbd4e37bdbd186706557f13a0c56acb5d75e9cae80bd2135973d1b=
a0620790779d4ba;subdir=3Dgit/node_modules/arrify;striplevel=3D1 \
+    https://registry.npmjs.org/async-mutex/-/async-mutex-0.3.2.tgz;downloa=
dfilename=3Dnpm2/async-mutex-0.3.2.tgz;sha512sum=3D1ee4caec4ecc4fb8d9121d4f=
f46b515bdf9a4d68835968bd2276d9e618f1ae745adfd292e015b4e3ec4b06160d4b6697847=
5082994b0de08f83e7d698fea8600;subdir=3Dgit/node_modules/async-mutex;striple=
vel=3D1 \
+    https://registry.npmjs.org/async/-/async-0.1.22.tgz;downloadfilename=
=3Dnpm2/async-0.1.22.tgz;sha1sum=3D0fc1aaa088a0e3ef0ebe2d8831bab0dcf8845061=
;subdir=3Dgit/node_modules/async;striplevel=3D1 \
+    https://registry.npmjs.org/async/-/async-2.6.3.tgz;downloadfilename=3D=
npm2/async-2.6.3.tgz;sha512sum=3Dcdf96f96cd750c2cbe7505b34d6d9dcee8a5bfc679=
5ffa637e664e59b6ba4cd2150e6fb650368999748e5e56ac1ca7cd06cf28a37334693e747c3=
1167ca6635e;subdir=3Dgit/node_modules/grunt-contrib-clean/node_modules/asyn=
c;striplevel=3D1 \
+    https://registry.npmjs.org/async/-/async-2.6.3.tgz;downloadfilename=3D=
npm2/async-2.6.3.tgz;sha512sum=3Dcdf96f96cd750c2cbe7505b34d6d9dcee8a5bfc679=
5ffa637e664e59b6ba4cd2150e6fb650368999748e5e56ac1ca7cd06cf28a37334693e747c3=
1167ca6635e;subdir=3Dgit/node_modules/grunt-contrib-watch/node_modules/asyn=
c;striplevel=3D1 \
+    https://registry.npmjs.org/async/-/async-3.2.2.tgz;downloadfilename=3D=
npm2/async-3.2.2.tgz;sha512sum=3D1f413ea9968311fc7f158e2dee22d1bf55b67c523a=
fa9c82793c35b8ddb40103e2c2ac0cea88cfc47c5d2efe33f218b60ed9d6f4139c912b292ee=
716ee9204e6;subdir=3Dgit/node_modules/archiver/node_modules/async;stripleve=
l=3D1 \
+    https://registry.npmjs.org/async/-/async-3.2.2.tgz;downloadfilename=3D=
npm2/async-3.2.2.tgz;sha512sum=3D1f413ea9968311fc7f158e2dee22d1bf55b67c523a=
fa9c82793c35b8ddb40103e2c2ac0cea88cfc47c5d2efe33f218b60ed9d6f4139c912b292ee=
716ee9204e6;subdir=3Dgit/node_modules/grunt-concurrent/node_modules/async;s=
triplevel=3D1 \
+    https://registry.npmjs.org/async/-/async-3.2.2.tgz;downloadfilename=3D=
npm2/async-3.2.2.tgz;sha512sum=3D1f413ea9968311fc7f158e2dee22d1bf55b67c523a=
fa9c82793c35b8ddb40103e2c2ac0cea88cfc47c5d2efe33f218b60ed9d6f4139c912b292ee=
716ee9204e6;subdir=3Dgit/node_modules/grunt-legacy-util/node_modules/async;=
striplevel=3D1 \
+    https://registry.npmjs.org/async/-/async-3.2.2.tgz;downloadfilename=3D=
npm2/async-3.2.2.tgz;sha512sum=3D1f413ea9968311fc7f158e2dee22d1bf55b67c523a=
fa9c82793c35b8ddb40103e2c2ac0cea88cfc47c5d2efe33f218b60ed9d6f4139c912b292ee=
716ee9204e6;subdir=3Dgit/node_modules/simple-cli/node_modules/async;striple=
vel=3D1 \
+    https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz;downloadfilen=
ame=3Dnpm2/asynckit-0.4.0.tgz;sha1sum=3Dc79ed97f7f34cb8f2ba1bc9790bcc366474=
b4b79;subdir=3Dgit/node_modules/asynckit;striplevel=3D1 \
+    https://registry.npmjs.org/axios/-/axios-0.22.0.tgz;downloadfilename=
=3Dnpm2/axios-0.22.0.tgz;sha512sum=3D674537ba1a907a0d6835c8a1b307f8643e7b3b=
736b475f995e1c5a44e696a439ac0d3c7b4f61cd055dae941b627b6870269b6ef14be09c9a0=
af8122a77387fd7;subdir=3Dgit/node_modules/axios;striplevel=3D1 \
+    https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/balanced-match-1.0.2.tgz;sha512sum=3Dde849e50ed13315=
ebb84dd4099b5ec2b8c9aa94eed8e21e56f144364ea47d0a5bdf82797e1b440697d009f1b74=
b71d8cae94695b041a3f02252121098585393f;subdir=3Dgit/node_modules/balanced-m=
atch;striplevel=3D1 \
+    https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz;downloadfil=
ename=3Dnpm2/base64-js-1.5.1.tgz;sha512sum=3D00aa5a6251e7f2de1255b3870b2f9b=
e7e28a82f478bebb03f2f6efadb890269b3b7ca0d3923903af2ea38b4ad42630b49336cd78f=
2f0cf1abc8b2a68e35a9e58;subdir=3Dgit/node_modules/base64-js;striplevel=3D1 =
\
+    https://registry.npmjs.org/basic-auth-parser/-/basic-auth-parser-0.0.2=
.tgz;downloadfilename=3Dnpm2/basic-auth-parser-0.0.2.tgz;sha1sum=3Dce9e71a7=
7f23c1279eecd2659b2a46244c156e41;subdir=3Dgit/node_modules/basic-auth-parse=
r;striplevel=3D1 \
+    https://registry.npmjs.org/basic-auth/-/basic-auth-2.0.1.tgz;downloadf=
ilename=3Dnpm2/basic-auth-2.0.1.tgz;sha512sum=3D345f9ea6e11d9d4615946ba16b1=
6dbabe76f26db702e7198f988b195794c1392a94395b70a75c0e5c5539de63748f6cf0d191c=
8cc6e27ebc261587029603997a;subdir=3Dgit/node_modules/basic-auth;striplevel=
=3D1 \
+    https://registry.npmjs.org/bcrypt/-/bcrypt-5.0.1.tgz;downloadfilename=
=3Dnpm2/bcrypt-5.0.1.tgz;sha512sum=3Df414e09ab859336b756cdb83b6bb483154a69b=
1641ac9ef59fc5a0f9881d8c7b8859817b4a38e608f64507eff98bfa3f3c8791a705494773f=
e36ba4822d523ab;subdir=3Dgit/node_modules/bcrypt;striplevel=3D1 \
+    https://registry.npmjs.org/bcryptjs/-/bcryptjs-2.4.3.tgz;downloadfilen=
ame=3Dnpm2/bcryptjs-2.4.3.tgz;sha1sum=3D9ab5627b93e60621ff7cdac5da9733027df=
1d0cb;subdir=3Dgit/node_modules/bcryptjs;striplevel=3D1 \
+    https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.2.0=
.tgz;downloadfilename=3Dnpm2/binary-extensions-2.2.0.tgz;sha512sum=3D8c372d=
27f21541b6682729287876e15e93a5341a8635cc1724a268838d84e470cf53041349d8c21dd=
8a18e3d0396785e43b6e56d3e9d1ce69f340892f28a1028;subdir=3Dgit/node_modules/b=
inary-extensions;striplevel=3D1 \
+    https://registry.npmjs.org/bl/-/bl-4.1.0.tgz;downloadfilename=3Dnpm2/b=
l-4.1.0.tgz;sha512sum=3Dd56d3b70cf604ba0dc2e97ab65f1528fe6d62ed68f1923875a1=
3e21b35e6bd525b44b746f36b07fca9fc12d5b556a595039e0029fda1e64e416e721bc05de1=
eb;subdir=3Dgit/node_modules/bl;striplevel=3D1 \
+    https://registry.npmjs.org/bluebird/-/bluebird-3.7.2.tgz;downloadfilen=
ame=3Dnpm2/bluebird-3.7.2.tgz;sha512sum=3D5e9363e860d0cdd7d6fabd969e7ef1892=
01ded33378f39311970464ed58ab925efd71515f9acf1026f2375664dd3a413424fb63765c1=
f6344392f6e6426711b6;subdir=3Dgit/node_modules/bluebird;striplevel=3D1 \
+    https://registry.npmjs.org/body-parser/-/body-parser-1.19.0.tgz;downlo=
adfilename=3Dnpm2/body-parser-1.19.0.tgz;sha512sum=3D76110fb3bd943db0e70102=
7d64a30d4cfea9b496a2a2784fe5c05be78d675cf956eb425ea68f5157f6b87d7e17596f42b=
8534adb692b86b8f5fab83389f342b3;subdir=3Dgit/node_modules/body-parser;strip=
level=3D1 \
+    https://registry.npmjs.org/body/-/body-5.1.0.tgz;downloadfilename=3Dnp=
m2/body-5.1.0.tgz;sha1sum=3De4ba0ce410a46936323367609ecb4e6553125069;subdir=
=3Dgit/node_modules/body;striplevel=3D1 \
+    https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz;downloadfilen=
ame=3Dnpm2/boolbase-1.0.0.tgz;sha1sum=3D68dff5fbe60c51eb37725ea9e3ed310dcc1=
e776e;subdir=3Dgit/node_modules/boolbase;striplevel=3D1 \
+    https://registry.npmjs.org/boxen/-/boxen-5.1.2.tgz;downloadfilename=3D=
npm2/boxen-5.1.2.tgz;sha512sum=3Df6062040a5f1fb59cff263fb0b3172694011860ec3=
de7d5d17f16712b5a6bbd97a26f1a9354376efc8746926fe423a22292586fa2677b87adcaa4=
d2aad8f5141;subdir=3Dgit/node_modules/boxen;striplevel=3D1 \
+    https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tg=
z;downloadfilename=3Dnpm2/brace-expansion-1.1.11.tgz;sha512sum=3D882b8f1c31=
60ac75fb1f6bc423fe71a73d3bcd21c1d344e9ba0aa1998b5598c3bae75f260ae44ca0e6059=
5d101974835f3bb9fa3375a1e058a71815beb5a8688;subdir=3Dgit/node_modules/brace=
-expansion;striplevel=3D1 \
+    https://registry.npmjs.org/braces/-/braces-3.0.2.tgz;downloadfilename=
=3Dnpm2/braces-3.0.2.tgz;sha512sum=3D6fcba6f8bd51cccdd60d2cef866ea0233d727d=
36c1b7a61395c10a02fb26a82659170e3acfadba9558fd8f5c843d6df71f91fe94142964c3f=
593c97eefc1dad0;subdir=3Dgit/node_modules/braces;striplevel=3D1 \
+    https://registry.npmjs.org/browser-stdout/-/browser-stdout-1.3.1.tgz;d=
ownloadfilename=3Dnpm2/browser-stdout-1.3.1.tgz;sha512sum=3Daa1015235f80bf6=
5fba9e94e7c0218c1738da2877a5e5644fdf5da052996fd3e52ccb0260a0ce2f9e89613b7d4=
bdb1da78d0501f5dd47ed8e95f1b1f2e432983;subdir=3Dgit/node_modules/browser-st=
dout;striplevel=3D1 \
+    https://registry.npmjs.org/buffer-crc32/-/buffer-crc32-0.2.13.tgz;down=
loadfilename=3Dnpm2/buffer-crc32-0.2.13.tgz;sha1sum=3D0d333e3f00eac50aa1454=
abd30ef8c2a5d9a7242;subdir=3Dgit/node_modules/buffer-crc32;striplevel=3D1 \
+    https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz;downloa=
dfilename=3Dnpm2/buffer-from-1.1.2.tgz;sha512sum=3D13e5d0091c126da6a20a1b6f=
ea4e83c2073e6f1f81b3abee2891c7979928c7f05a29b8625f3a903b02b870edb6c84946a76=
3829a3c15853dc79b18323c69c97d;subdir=3Dgit/node_modules/buffer-from;striple=
vel=3D1 \
+    https://registry.npmjs.org/buffer/-/buffer-5.7.1.tgz;downloadfilename=
=3Dnpm2/buffer-5.7.1.tgz;sha512sum=3D10773220f050e0148696f8c1d7a9392a0009db=
b088b0763fd8906609145ea38f32f6b43731a533597dca56505ae14eccc97d361dd563d0aec=
2dd6681de3bbb15;subdir=3Dgit/node_modules/buffer;striplevel=3D1 \
+    https://registry.npmjs.org/busboy/-/busboy-0.2.14.tgz;downloadfilename=
=3Dnpm2/busboy-0.2.14.tgz;sha1sum=3D6c2a622efcf47c57bbbe1e2a9c37ad36c792545=
3;subdir=3Dgit/node_modules/busboy;striplevel=3D1 \
+    https://registry.npmjs.org/bytes/-/bytes-1.0.0.tgz;downloadfilename=3D=
npm2/bytes-1.0.0.tgz;sha1sum=3D3569ede8ba34315fab99c3e92cb04c7220de1fa8;sub=
dir=3Dgit/node_modules/body/node_modules/bytes;striplevel=3D1 \
+    https://registry.npmjs.org/bytes/-/bytes-3.1.0.tgz;downloadfilename=3D=
npm2/bytes-3.1.0.tgz;sha512sum=3Dcdab8b8eb7c21bec6fa326aa2e857c6cb5575cd182=
e09aa5c450aeb520d603a7c9ad3a3666ebcb613a99eda1c12d948c3a8a5bcf0bfc7fec19715=
cdf5532360e;subdir=3Dgit/node_modules/bytes;striplevel=3D1 \
+    https://registry.npmjs.org/cache-point/-/cache-point-2.0.0.tgz;downloa=
dfilename=3Dnpm2/cache-point-2.0.0.tgz;sha512sum=3De2091e1e516948a826def9b6=
809379b0fa9f9a28d844560243ab6fe5c2f0d315664faaf5cf5bdde05367a6e39111ca37701=
b351bbd3db19ef62dd81d74abcbe7;subdir=3Dgit/node_modules/cache-point;striple=
vel=3D1 \
+    https://registry.npmjs.org/cacheable-lookup/-/cacheable-lookup-5.0.4.t=
gz;downloadfilename=3Dnpm2/cacheable-lookup-5.0.4.tgz;sha512sum=3Ddbf90db1c=
3e1a5cc6b3a280c6736e2585eddcfc8a585bfe72075371326625d65e97aafdabbca89f1585d=
7ed324b72de7ec68fa1c819a9501bca2204d07700980;subdir=3Dgit/node_modules/cach=
eable-lookup;striplevel=3D1 \
+    https://registry.npmjs.org/cacheable-request/-/cacheable-request-6.1.0=
.tgz;downloadfilename=3Dnpm2/cacheable-request-6.1.0.tgz;sha512sum=3D3a3ddc=
0063c2a8e657ed1cfae149f2d8660064d962412a9f6de3eb800435c0a022858982527ada06d=
26d29c191e31cfbc05f8ba090beb2c159befe41805f4882;subdir=3Dgit/node_modules/p=
ackage-json/node_modules/cacheable-request;striplevel=3D1 \
+    https://registry.npmjs.org/cacheable-request/-/cacheable-request-7.0.2=
.tgz;downloadfilename=3Dnpm2/cacheable-request-7.0.2.tgz;sha512sum=3Da68b96=
f3f16688f41bb86a645d0f4100fbff328e710c600d812357cd3cc9f03aca1ae5ceb2c338c08=
4118df6a735187762ee5c7d83ef728aea6e183628826d7b;subdir=3Dgit/node_modules/c=
acheable-request;striplevel=3D1 \
+    https://registry.npmjs.org/caching-transform/-/caching-transform-3.0.2=
.tgz;downloadfilename=3Dnpm2/caching-transform-3.0.2.tgz;sha512sum=3D32d81c=
bf7961dd4d334628bfeaa56040e0dd3c0e06df3846fa3b5b0968f7f515ee5054cccc7d2f71d=
32d6894b58cfa3077e22dd8faabeb2dcd24c42a3aa084db;subdir=3Dgit/node_modules/c=
aching-transform;striplevel=3D1 \
+    https://registry.npmjs.org/call-bind/-/call-bind-1.0.2.tgz;downloadfil=
ename=3Dnpm2/call-bind-1.0.2.tgz;sha512sum=3Decef856c28a1ac1e5619b1587ac72d=
c264ca69eeab3a22339b3d6272b79627ed1a03b2c97eeaa112ca364fd9dca5c16dccc42dcd7=
7f64061ae7962464d8b2aac;subdir=3Dgit/node_modules/call-bind;striplevel=3D1 =
\
+    https://registry.npmjs.org/camelcase/-/camelcase-5.0.0.tgz;downloadfil=
ename=3Dnpm2/camelcase-5.0.0.tgz;sha512sum=3D7daab066a9d6c5bc67f85d5ddfdf72=
81e6a640dcb794fa7f1fd1faacdaea621e054950ad718fb772e6f533103ca3d983779e6633c=
02086ebbf92ec9803a553b0;subdir=3Dgit/node_modules/camelcase;striplevel=3D1 =
\
+    https://registry.npmjs.org/camelcase/-/camelcase-6.2.1.tgz;downloadfil=
ename=3Dnpm2/camelcase-6.2.1.tgz;sha512sum=3Db55238ab98e3155e426af014f035df=
cdafd325c66eb552a8ff9168b249aca9c9b432c2fdd66a07bf0886367a9a6b6a3a3c5ffbc93=
e6290345c55c97c463e8b08;subdir=3Dgit/node_modules/boxen/node_modules/camelc=
ase;striplevel=3D1 \
+    https://registry.npmjs.org/camelcase/-/camelcase-6.2.1.tgz;downloadfil=
ename=3Dnpm2/camelcase-6.2.1.tgz;sha512sum=3Db55238ab98e3155e426af014f035df=
cdafd325c66eb552a8ff9168b249aca9c9b432c2fdd66a07bf0886367a9a6b6a3a3c5ffbc93=
e6290345c55c97c463e8b08;subdir=3Dgit/node_modules/yargs-unparser/node_modul=
es/camelcase;striplevel=3D1 \
+    https://registry.npmjs.org/catharsis/-/catharsis-0.9.0.tgz;downloadfil=
ename=3Dnpm2/catharsis-0.9.0.tgz;sha512sum=3Da6b313415a5c9ecfedcc5805564569=
e9a93a472919c966f782ef1c914a5de9891395a70e7770d71898c8a43e10eb3262ae2cef6a2=
0234921e53ac03eeac361d8;subdir=3Dgit/node_modules/catharsis;striplevel=3D1 =
\
+    https://registry.npmjs.org/chalk/-/chalk-1.1.3.tgz;downloadfilename=3D=
npm2/chalk-1.1.3.tgz;sha1sum=3Da8115c55e4a702fe4d150abd3872822a7e09fc98;sub=
dir=3Dgit/node_modules/grunt-contrib-concat/node_modules/chalk;striplevel=
=3D1 \
+    https://registry.npmjs.org/chalk/-/chalk-1.1.3.tgz;downloadfilename=3D=
npm2/chalk-1.1.3.tgz;sha1sum=3Da8115c55e4a702fe4d150abd3872822a7e09fc98;sub=
dir=3Dgit/node_modules/grunt-contrib-copy/node_modules/chalk;striplevel=3D1=
 \
+    https://registry.npmjs.org/chalk/-/chalk-1.1.3.tgz;downloadfilename=3D=
npm2/chalk-1.1.3.tgz;sha1sum=3Da8115c55e4a702fe4d150abd3872822a7e09fc98;sub=
dir=3Dgit/node_modules/maxmin/node_modules/chalk;striplevel=3D1 \
+    https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz;downloadfilename=3D=
npm2/chalk-2.4.2.tgz;sha512sum=3D32d8be7fd96924d730178b5657cfcead34ed175819=
8be7fc16a97201da2eada95c156150585dbe3600874a18e409bf881412eaf5bb99c04d71724=
414e29792b9;subdir=3Dgit/node_modules/@babel/highlight/node_modules/chalk;s=
triplevel=3D1 \
+    https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz;downloadfilename=3D=
npm2/chalk-2.4.2.tgz;sha512sum=3D32d8be7fd96924d730178b5657cfcead34ed175819=
8be7fc16a97201da2eada95c156150585dbe3600874a18e409bf881412eaf5bb99c04d71724=
414e29792b9;subdir=3Dgit/node_modules/args/node_modules/chalk;striplevel=3D=
1 \
+    https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz;downloadfilename=3D=
npm2/chalk-2.4.2.tgz;sha512sum=3D32d8be7fd96924d730178b5657cfcead34ed175819=
8be7fc16a97201da2eada95c156150585dbe3600874a18e409bf881412eaf5bb99c04d71724=
414e29792b9;subdir=3Dgit/node_modules/grunt-contrib-uglify/node_modules/cha=
lk;striplevel=3D1 \
+    https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz;downloadfilename=3D=
npm2/chalk-2.4.2.tgz;sha512sum=3D32d8be7fd96924d730178b5657cfcead34ed175819=
8be7fc16a97201da2eada95c156150585dbe3600874a18e409bf881412eaf5bb99c04d71724=
414e29792b9;subdir=3Dgit/node_modules/simple-cli/node_modules/chalk;striple=
vel=3D1 \
+    https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz;downloadfilename=3D=
npm2/chalk-4.1.2.tgz;sha512sum=3Da0a9db845c91217a54b9ecfc881326c846b89db8f8=
20e432ba173fc32f6463bfd654f73020ef5503aebc3eef1190eefed06efa48b44e7b2c3d0a9=
434eb58b898;subdir=3Dgit/node_modules/chalk;striplevel=3D1 \
+    https://registry.npmjs.org/cheerio-select/-/cheerio-select-1.5.0.tgz;d=
ownloadfilename=3Dnpm2/cheerio-select-1.5.0.tgz;sha512sum=3Daa871a1cfbf9ca9=
79f87a60dc6f9db001334eca3311316ed6dfb89a0889ede26575f5111c18989708891aebf47=
d39b9c40fd64dbc75abfcae974382341df1dae;subdir=3Dgit/node_modules/cheerio-se=
lect;striplevel=3D1 \
+    https://registry.npmjs.org/cheerio/-/cheerio-1.0.0-rc.10.tgz;downloadf=
ilename=3Dnpm2/cheerio-1.0.0-rc.10.tgz;sha512sum=3D834274abf3ba996f33e73c50=
dc0f04f09d61520a7848c3af1285bfc7ce0ec321ca7bf65c733f373d54f8cb90ab72be77d05=
57a36098a235aaf19329597d5d757;subdir=3Dgit/node_modules/cheerio;striplevel=
=3D1 \
+    https://registry.npmjs.org/chokidar/-/chokidar-3.5.2.tgz;downloadfilen=
ame=3Dnpm2/chokidar-3.5.2.tgz;sha512sum=3D7a41a13a73553e04fbeebe0afd4dc60e1=
bbe150d92f139cafecd8a6c81978b44995aec2467640dc9f59d656f9355f9fce03a443fbacb=
782b76508e9b27c1b06d;subdir=3Dgit/node_modules/chokidar;striplevel=3D1 \
+    https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz;downloadfilename=
=3Dnpm2/chownr-2.0.0.tgz;sha512sum=3D6c8a26b43179286a5da2090b77d56ca6f17393=
d29fa72c86952f18155665ed318f0472f9b2720e9f17ac8705603ed790f5be04c9d97ea556c=
8c84d4372f09681;subdir=3Dgit/node_modules/chownr;striplevel=3D1 \
+    https://registry.npmjs.org/ci-info/-/ci-info-2.0.0.tgz;downloadfilenam=
e=3Dnpm2/ci-info-2.0.0.tgz;sha512sum=3De6d2bb12dad9d0df8e2c532d86da8e8f87c8=
d8979bf3c0b808064fbb6e4b0d55205c9d00dc9b383cc1aaae7d095355b4321d7f67cc19cd8=
3f1a94ad77816e809;subdir=3Dgit/node_modules/ci-info;striplevel=3D1 \
+    https://registry.npmjs.org/cli-boxes/-/cli-boxes-2.2.1.tgz;downloadfil=
ename=3Dnpm2/cli-boxes-2.2.1.tgz;sha512sum=3Dcb872831cca581209d5629e388306e=
47c3c20b66cb8f2193c0498f6fd34747f41a354e8450e5dc4d8fece958c6303e8435211a790=
607098d063464b98df3303f;subdir=3Dgit/node_modules/cli-boxes;striplevel=3D1 =
\
+    https://registry.npmjs.org/cli-table/-/cli-table-0.3.9.tgz;downloadfil=
ename=3Dnpm2/cli-table-0.3.9.tgz;sha512sum=3Dede03a845b40670571ddd5801a8681=
a93af35a4a398d15052a91d3eb8647909a5a037cb9c1fe4d94b8e0baa4d19aac9c6ad2598b0=
7ed383618c8634b6d0eccb8;subdir=3Dgit/node_modules/cli-table;striplevel=3D1 =
\
+    https://registry.npmjs.org/cli/-/cli-1.0.1.tgz;downloadfilename=3Dnpm2=
/cli-1.0.1.tgz;sha1sum=3D22817534f24bfa4950c34d532d48ecbc621b8c14;subdir=3D=
git/node_modules/cli;striplevel=3D1 \
+    https://registry.npmjs.org/cliui/-/cliui-5.0.0.tgz;downloadfilename=3D=
npm2/cliui-5.0.0.tgz;sha512sum=3D3d87864849a61cceb3be879fdb0f133f396b9cda57=
2234e2a582bbf3462cc2620ff6f8f199de98d9adc20762acebf014f0d1e366e817be8f30de8=
58cdaa9f05c;subdir=3Dgit/node_modules/nyc/node_modules/cliui;striplevel=3D1=
 \
+    https://registry.npmjs.org/cliui/-/cliui-7.0.4.tgz;downloadfilename=3D=
npm2/cliui-7.0.4.tgz;sha512sum=3D39c444ebc70eb15317a7562fa2797f7f39103b28cb=
4aeffc6e13c37d0b747b4fc46f6f374ca3f6d05b3632aa0fb2bf52c00e7de6b44203e40ccd8=
73d9c13fe25;subdir=3Dgit/node_modules/cliui;striplevel=3D1 \
+    https://registry.npmjs.org/clone-response/-/clone-response-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/clone-response-1.0.2.tgz;sha1sum=3Dd1dc973920314df67=
fbeb94223b4ee350239e96b;subdir=3Dgit/node_modules/clone-response;striplevel=
=3D1 \
+    https://registry.npmjs.org/clone/-/clone-2.1.2.tgz;downloadfilename=3D=
npm2/clone-2.1.2.tgz;sha1sum=3D1b7f4b9f591f1e8f83670401600345a02887435f;sub=
dir=3Dgit/node_modules/clone;striplevel=3D1 \
+    https://registry.npmjs.org/collect-all/-/collect-all-1.0.4.tgz;downloa=
dfilename=3Dnpm2/collect-all-1.0.4.tgz;sha512sum=3D44a66147026d2443f9156ba5=
fa09123049da2ba1f70063d34d63a246298272cfab73f3a6404dd8872d50ec0ecab1d906dd9=
5d5759abaf18e8e35276f91e11c28;subdir=3Dgit/node_modules/collect-all;striple=
vel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz;dow=
nloadfilename=3Dnpm2/color-convert-1.9.3.tgz;sha512sum=3D41f014b5dfaf15d02d=
150702f020b262dd5f616c52a8088ad9c483eb30c1f0dddca6c10102f471a7dcce1a0e86fd2=
1c7258013f3cfdacff22e0c600bb0d55b1a;subdir=3Dgit/node_modules/@babel/highli=
ght/node_modules/color-convert;striplevel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz;dow=
nloadfilename=3Dnpm2/color-convert-1.9.3.tgz;sha512sum=3D41f014b5dfaf15d02d=
150702f020b262dd5f616c52a8088ad9c483eb30c1f0dddca6c10102f471a7dcce1a0e86fd2=
1c7258013f3cfdacff22e0c600bb0d55b1a;subdir=3Dgit/node_modules/args/node_mod=
ules/color-convert;striplevel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz;dow=
nloadfilename=3Dnpm2/color-convert-1.9.3.tgz;sha512sum=3D41f014b5dfaf15d02d=
150702f020b262dd5f616c52a8088ad9c483eb30c1f0dddca6c10102f471a7dcce1a0e86fd2=
1c7258013f3cfdacff22e0c600bb0d55b1a;subdir=3Dgit/node_modules/grunt-contrib=
-uglify/node_modules/color-convert;striplevel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz;dow=
nloadfilename=3Dnpm2/color-convert-1.9.3.tgz;sha512sum=3D41f014b5dfaf15d02d=
150702f020b262dd5f616c52a8088ad9c483eb30c1f0dddca6c10102f471a7dcce1a0e86fd2=
1c7258013f3cfdacff22e0c600bb0d55b1a;subdir=3Dgit/node_modules/nyc/node_modu=
les/color-convert;striplevel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz;dow=
nloadfilename=3Dnpm2/color-convert-1.9.3.tgz;sha512sum=3D41f014b5dfaf15d02d=
150702f020b262dd5f616c52a8088ad9c483eb30c1f0dddca6c10102f471a7dcce1a0e86fd2=
1c7258013f3cfdacff22e0c600bb0d55b1a;subdir=3Dgit/node_modules/simple-cli/no=
de_modules/color-convert;striplevel=3D1 \
+    https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz;dow=
nloadfilename=3Dnpm2/color-convert-2.0.1.tgz;sha512sum=3D4511023ec8fb8aeff1=
6f9a0a61cb051d2a6914d9ec8ffe763954d129be333f9a275f0545df3566993a0d70e7c60be=
0910e97cafd4e7ce1f320dfc64709a12529;subdir=3Dgit/node_modules/color-convert=
;striplevel=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.3.tgz;sha1sum=3Da7d0558bd89c42f795dd42328f740=
831ca53bc25;subdir=3Dgit/node_modules/@babel/highlight/node_modules/color-n=
ame;striplevel=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.3.tgz;sha1sum=3Da7d0558bd89c42f795dd42328f740=
831ca53bc25;subdir=3Dgit/node_modules/args/node_modules/color-name;striplev=
el=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.3.tgz;sha1sum=3Da7d0558bd89c42f795dd42328f740=
831ca53bc25;subdir=3Dgit/node_modules/grunt-contrib-uglify/node_modules/col=
or-name;striplevel=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.3.tgz;sha1sum=3Da7d0558bd89c42f795dd42328f740=
831ca53bc25;subdir=3Dgit/node_modules/nyc/node_modules/color-name;stripleve=
l=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.3.tgz;sha1sum=3Da7d0558bd89c42f795dd42328f740=
831ca53bc25;subdir=3Dgit/node_modules/simple-cli/node_modules/color-name;st=
riplevel=3D1 \
+    https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz;downloadf=
ilename=3Dnpm2/color-name-1.1.4.tgz;sha512sum=3D74ecbedc0b96ddadb035b64722e=
319a537208c6b8b53fb812ffb9b71917d3976c3a3c7dfe0ef32569e417f479f4bcb84a18a39=
ab8171edd63d3a04065e002c40;subdir=3Dgit/node_modules/color-name;striplevel=
=3D1 \
+    https://registry.npmjs.org/color-support/-/color-support-1.1.3.tgz;dow=
nloadfilename=3Dnpm2/color-support-1.1.3.tgz;sha512sum=3Daa20639296cc2cefc7=
2faf32fa5878ab4fced4c6458f6457e97fca98c6b7fa0243df3f96c08d59cc31f2b2fa87192=
de63fa9b39cf724a579b0d6723d7098f246;subdir=3Dgit/node_modules/color-support=
;striplevel=3D1 \
+    https://registry.npmjs.org/colors/-/colors-1.0.3.tgz;downloadfilename=
=3Dnpm2/colors-1.0.3.tgz;sha1sum=3D0433f44d809680fdeb60ed260f1b0c262e82a40b=
;subdir=3Dgit/node_modules/cli-table/node_modules/colors;striplevel=3D1 \
+    https://registry.npmjs.org/colors/-/colors-1.1.2.tgz;downloadfilename=
=3Dnpm2/colors-1.1.2.tgz;sha1sum=3D168a4701756b6a7f51a12ce0c97bfa28c084ed63=
;subdir=3Dgit/node_modules/colors;striplevel=3D1 \
+    https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz=
;downloadfilename=3Dnpm2/combined-stream-1.0.8.tgz;sha512sum=3D1503783117ee=
25e1dfedc05b04c2455e12920eafb690002b06599106f72f144e410751d9297b5214048385d=
973f73398c3187c943767be630e7bffb971da0476;subdir=3Dgit/node_modules/combine=
d-stream;striplevel=3D1 \
+    https://registry.npmjs.org/command-line-args/-/command-line-args-5.2.0=
.tgz;downloadfilename=3Dnpm2/command-line-args-5.2.0.tgz;sha512sum=3De33aad=
535858b1227370904e70d6486d6e456e4f419230a9d696558502a845a58be49ecde17a610cb=
c28f1a5b0750a53ba0c70bbe8dff6ed998645e2aa9e59e8;subdir=3Dgit/node_modules/c=
ommand-line-args;striplevel=3D1 \
+    https://registry.npmjs.org/command-line-tool/-/command-line-tool-0.8.0=
.tgz;downloadfilename=3Dnpm2/command-line-tool-0.8.0.tgz;sha512sum=3D5f0d7c=
1d5c7f433415dd2739935bf2de482d39e1a6b0a22ac2d145a328c8e1b6dca52827c36096554=
2efb5a932c38b3a7e1c80748eaca104215dcd8ecc9cbada;subdir=3Dgit/node_modules/c=
ommand-line-tool;striplevel=3D1 \
+    https://registry.npmjs.org/command-line-usage/-/command-line-usage-4.1=
.0.tgz;downloadfilename=3Dnpm2/command-line-usage-4.1.0.tgz;sha512sum=3D331=
4bc01df7de4aa5d002d09a29a3fa2f188ae857f9b4287c3329f5f129a83a1473a41ac1fcfe5=
bf9ca381a6e5711c422490b4a0979432e3bf8266aaf96ab8ea;subdir=3Dgit/node_module=
s/command-line-usage;striplevel=3D1 \
+    https://registry.npmjs.org/commander/-/commander-4.0.1.tgz;downloadfil=
ename=3Dnpm2/commander-4.0.1.tgz;sha512sum=3D20f178a2e8423fea9d95c98279d871=
5f8c621813f28a06fcbf935e529fb42f28702e0c4cab2a774b4be5ed300f7d2fe188fec50b7=
71a23f3c1f654e63fcaf534;subdir=3Dgit/node_modules/commander;striplevel=3D1 =
\
+    https://registry.npmjs.org/commist/-/commist-1.1.0.tgz;downloadfilenam=
e=3Dnpm2/commist-1.1.0.tgz;sha512sum=3Daeb682f0d5d63848e10036d97bd4013732c0=
3794377ec4cf42d055f9f1158fac4a2200e036211513a64d7c7a593aa7d0db5614cdf54d517=
2ce119aae62f40f3e;subdir=3Dgit/node_modules/commist;striplevel=3D1 \
+    https://registry.npmjs.org/common-sequence/-/common-sequence-2.0.2.tgz=
;downloadfilename=3Dnpm2/common-sequence-2.0.2.tgz;sha512sum=3D8c0834f6091d=
92b0cef445937577eff345961f7c9e665e684faf5f19f79d04d4bda5750a6089d52756c9fbf=
86ddbe32879e8b8f139926d00d831cf043b1f46d2;subdir=3Dgit/node_modules/common-=
sequence;striplevel=3D1 \
+    https://registry.npmjs.org/commondir/-/commondir-1.0.1.tgz;downloadfil=
ename=3Dnpm2/commondir-1.0.1.tgz;sha1sum=3Dddd800da0c66127393cca5950ea968a3=
aaf1253b;subdir=3Dgit/node_modules/commondir;striplevel=3D1 \
+    https://registry.npmjs.org/component-emitter/-/component-emitter-1.3.0=
.tgz;downloadfilename=3Dnpm2/component-emitter-1.3.0.tgz;sha512sum=3D45ddec=
7ba401fac3b54f0a998ec710aeeae910f21f3b4ff26274a29fa43fac3de63aeb47bd4ac2021=
26e6f7afdd2e35bf9211206e134418a01f7461d7dab6c46;subdir=3Dgit/node_modules/c=
omponent-emitter;striplevel=3D1 \
+    https://registry.npmjs.org/compress-commons/-/compress-commons-4.1.1.t=
gz;downloadfilename=3Dnpm2/compress-commons-4.1.1.tgz;sha512sum=3D40b7432c2=
28d57676da13a2baa0c6781008c03e8165e433f370bbb169781864fd1764ce29aa0b78ee79b=
fc50e669979787eb9bcb58e406a137c40aec2c1139c1;subdir=3Dgit/node_modules/comp=
ress-commons;striplevel=3D1 \
+    https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz;downloadf=
ilename=3Dnpm2/concat-map-0.0.1.tgz;sha1sum=3Dd8a96bd77fd68df7793a73036a3ba=
0d5405d477b;subdir=3Dgit/node_modules/concat-map;striplevel=3D1 \
+    https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz;dow=
nloadfilename=3Dnpm2/concat-stream-1.6.2.tgz;sha512sum=3Ddbb1c18212718e266d=
224dd872f9ffe246c993fd6e66e2457ee3c49ece8b684be9bc6d5fd214de6bc96296ba2eca8=
f6655cd8659d70467c38ba0699200396b0b;subdir=3Dgit/node_modules/multer/node_m=
odules/concat-stream;striplevel=3D1 \
+    https://registry.npmjs.org/concat-stream/-/concat-stream-2.0.0.tgz;dow=
nloadfilename=3Dnpm2/concat-stream-2.0.0.tgz;sha512sum=3D316b9f61d170e7771c=
1a3080f8e97b5c96290255bafe9ad2333b8f393467246706cee84b9f849caf3eea7faa3c6d1=
399e75e25b5acdc2052597af71f6e8d31ec;subdir=3Dgit/node_modules/concat-stream=
;striplevel=3D1 \
+    https://registry.npmjs.org/config-master/-/config-master-3.1.0.tgz;dow=
nloadfilename=3Dnpm2/config-master-3.1.0.tgz;sha1sum=3D667663590505a283bf26=
a484d68489d74c5485da;subdir=3Dgit/node_modules/config-master;striplevel=3D1=
 \
+    https://registry.npmjs.org/configstore/-/configstore-5.0.1.tgz;downloa=
dfilename=3Dnpm2/configstore-5.0.1.tgz;sha512sum=3D68c2a9ae093962104dc87db9=
863f301addbe0f9d92c350d1448cea0702e9d986bd985998f0a3efbedbe69daf12c5547d24c=
678933303ebc376daf95a46991e14;subdir=3Dgit/node_modules/configstore;striple=
vel=3D1 \
+    https://registry.npmjs.org/console-browserify/-/console-browserify-1.1=
.0.tgz;downloadfilename=3Dnpm2/console-browserify-1.1.0.tgz;sha1sum=3Df0241=
c45730a9fc6323b206dbf38edc741d0bb10;subdir=3Dgit/node_modules/console-brows=
erify;striplevel=3D1 \
+    https://registry.npmjs.org/console-control-strings/-/console-control-s=
trings-1.1.0.tgz;downloadfilename=3Dnpm2/console-control-strings-1.1.0.tgz;=
sha1sum=3D3d7cf4464db6446ea644bf4b39507f9851008e8e;subdir=3Dgit/node_module=
s/console-control-strings;striplevel=3D1 \
+    https://registry.npmjs.org/content-disposition/-/content-disposition-0=
.5.3.tgz;downloadfilename=3Dnpm2/content-disposition-0.5.3.tgz;sha512sum=3D=
1313b4efbe2290439b200115f640e8e74a3eefd54251d101ea7ea5cca806c2ea5c55e46586b=
8f7a8601fc2af06eae0498e4a8bae14f4a846057169e0f33d73d2;subdir=3Dgit/node_mod=
ules/content-disposition;striplevel=3D1 \
+    https://registry.npmjs.org/content-type/-/content-type-1.0.4.tgz;downl=
oadfilename=3Dnpm2/content-type-1.0.4.tgz;sha512sum=3D8483f71043ecf2d07d013=
d4bf8d52ab70380a6ce269366686fcf4c5973078c75a0f668a517f8f8a2c9e740b5c1081141=
93fb6f206fed51cf663942623c184f5c;subdir=3Dgit/node_modules/content-type;str=
iplevel=3D1 \
+    https://registry.npmjs.org/continuable-cache/-/continuable-cache-0.3.1=
.tgz;downloadfilename=3Dnpm2/continuable-cache-0.3.1.tgz;sha1sum=3Dbd727a7f=
aed77e71ff3985ac93351a912733ad0f;subdir=3Dgit/node_modules/continuable-cach=
e;striplevel=3D1 \
+    https://registry.npmjs.org/convert-source-map/-/convert-source-map-1.8=
.0.tgz;downloadfilename=3Dnpm2/convert-source-map-1.8.0.tgz;sha512sum=3Df8e=
41d8cfe3dcd5888ffa8bb9c826903cac0978b15fc974f7d4f6766cdd5a8ec062208b3202bee=
376aeee9f31dfb89652f4b5aaf5f146095df67f4d6b668548c;subdir=3Dgit/node_module=
s/convert-source-map;striplevel=3D1 \
+    https://registry.npmjs.org/cookie-parser/-/cookie-parser-1.4.5.tgz;dow=
nloadfilename=3Dnpm2/cookie-parser-1.4.5.tgz;sha512sum=3D7f5ddb3d48ff806ff9=
983afec4b992c710ec07d0d089321f8494bfb2a8eb99f01688037ec763b88bf5e0b932fdc83=
67efc81436a727ee71ee10b80974fd4ddcf;subdir=3Dgit/node_modules/cookie-parser=
;striplevel=3D1 \
+    https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.t=
gz;downloadfilename=3Dnpm2/cookie-signature-1.0.6.tgz;sha1sum=3De303a882b34=
2cc3ee8ca513a79999734dab3ae2c;subdir=3Dgit/node_modules/cookie-signature;st=
riplevel=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.0.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.0.tgz;sha512sum=3Df87a7c7cba79ef09d44add2d634b47117878be=
86510e7a08ad93ea968dc33e2238cbd97083f8eac7ed4e9bde3f5ba65a3c33946e78ceb7ff7=
dc3aeb393e9755e;subdir=3Dgit/node_modules/cookie-parser/node_modules/cookie=
;striplevel=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.0.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.0.tgz;sha512sum=3Df87a7c7cba79ef09d44add2d634b47117878be=
86510e7a08ad93ea968dc33e2238cbd97083f8eac7ed4e9bde3f5ba65a3c33946e78ceb7ff7=
dc3aeb393e9755e;subdir=3Dgit/node_modules/express/node_modules/cookie;strip=
level=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.1.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.1.tgz;sha512sum=3D670ac5906271511dc42285ed3bec9513af446f=
b2a58b16da78059f05007dbd5b0d9ffa3e630ebd8015924832bcdb985035d37ec05f3310b7f=
7745365fe4c6450;subdir=3Dgit/node_modules/cookie;striplevel=3D1 \
+    https://registry.npmjs.org/cookiejar/-/cookiejar-2.1.3.tgz;downloadfil=
ename=3Dnpm2/cookiejar-2.1.3.tgz;sha512sum=3D2716c205476b7ebe80423397af1a13=
bc03093b81c14d4225073b257093c0cfefca4fcca4e777d7ba7e75bbe45e9cd62f69dffe55c=
d83233e68f54c65083ca615;subdir=3Dgit/node_modules/cookiejar;striplevel=3D1 =
\
+    https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz;downl=
oadfilename=3Dnpm2/core-util-is-1.0.3.tgz;sha512sum=3D65006f8b50dca49e060ea=
6a78ee719d878f7c043b9a590d2f3d0566e472bbddc64b09a2bc140c365a997f65745929f5a=
c369660432e090e6c40380d6349f4561;subdir=3Dgit/node_modules/core-util-is;str=
iplevel=3D1 \
+    https://registry.npmjs.org/cors/-/cors-2.8.5.tgz;downloadfilename=3Dnp=
m2/cors-2.8.5.tgz;sha512sum=3D2881db2c9aaeef7446aff8676eb3bdb817a2c4d1aebd2=
423ba5fe3745bd2fca152207d615957759e0ef3387c7e62b11f2272c6eeae27e861d0f5c0ed=
c6ffcfea;subdir=3Dgit/node_modules/cors;striplevel=3D1 \
+    https://registry.npmjs.org/cp-file/-/cp-file-6.2.0.tgz;downloadfilenam=
e=3Dnpm2/cp-file-6.2.0.tgz;sha512sum=3D7e6bd5e1c6819e87e13def2439c8ad0704a7=
d9fdfd40b8e70271aade03bd75f77be66532b7328d641d6175ee901ee9d6d91b7e3b0b8138c=
7378b5b4d1256eccc;subdir=3Dgit/node_modules/cp-file;striplevel=3D1 \
+    https://registry.npmjs.org/crc-32/-/crc-32-1.2.0.tgz;downloadfilename=
=3Dnpm2/crc-32-1.2.0.tgz;sha512sum=3Dd6e0701f117e63fe321791b8f1fc272aae90b0=
85e17a8af764b3d3f34c86055d68114c293e88e512141b58a570d55c1c4d0c8c1872b5fd732=
64e39a5b264d318;subdir=3Dgit/node_modules/crc-32;striplevel=3D1 \
+    https://registry.npmjs.org/crc32-stream/-/crc32-stream-4.0.2.tgz;downl=
oadfilename=3Dnpm2/crc32-stream-4.0.2.tgz;sha512sum=3D0f1159fc7938ef76ff9ae=
ab5549ffffcf30d2e3d19327cf27bdb610699a3a4928273978c801f7968af33086ac67d0f74=
716a39eb54dee872bd0fe8f828f74ceb;subdir=3Dgit/node_modules/crc32-stream;str=
iplevel=3D1 \
+    https://registry.npmjs.org/cronosjs/-/cronosjs-1.7.1.tgz;downloadfilen=
ame=3Dnpm2/cronosjs-1.7.1.tgz;sha512sum=3D77a4baf9ea7b749c6c006f0e41009d2ae=
07223f4bf015eb877d385e66b6673290ec8fbbdd9c0240271774db73db39a0e68b401618426=
4cdbe3a984643c9feee5;subdir=3Dgit/node_modules/cronosjs;striplevel=3D1 \
+    https://registry.npmjs.org/cross-fetch/-/cross-fetch-3.1.4.tgz;downloa=
dfilename=3Dnpm2/cross-fetch-3.1.4.tgz;sha512sum=3Dd5e02d156748b9b8ba4f85cf=
cba7a2f62505a0aa5490817def540b37c948befbf0b9e23ae7e370e6168c34a5307c9c5a6ea=
94820338324a1ab43aea0c42d0f6d;subdir=3Dgit/node_modules/cross-fetch;striple=
vel=3D1 \
+    https://registry.npmjs.org/cross-spawn/-/cross-spawn-4.0.2.tgz;downloa=
dfilename=3Dnpm2/cross-spawn-4.0.2.tgz;sha1sum=3D7b9247621c23adfdd3856004a8=
23cbe397424d41;subdir=3Dgit/node_modules/foreground-child/node_modules/cros=
s-spawn;striplevel=3D1 \
+    https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz;downloa=
dfilename=3Dnpm2/cross-spawn-7.0.3.tgz;sha512sum=3D8910cf24a50f544343edd1cf=
3bcae46ce9cfa720f281c0c5b568e9796342832f163f6ad77315cbf13b2445e425e8eac1d86=
efe509ada82cd6ad7916e75cec6eb;subdir=3Dgit/node_modules/cross-spawn;striple=
vel=3D1 \
+    https://registry.npmjs.org/crypto-random-string/-/crypto-random-string=
-2.0.0.tgz;downloadfilename=3Dnpm2/crypto-random-string-2.0.0.tgz;sha512sum=
=3Dbf5a65203df2f6bfe53e1be2275c2b5e92dec94206019d921cd61311aa66efff00f672cf=
a32bd5a7744afc43c5aa7e641339f25a061936c46d6182166ee1bc28;subdir=3Dgit/node_=
modules/crypto-random-string;striplevel=3D1 \
+    https://registry.npmjs.org/css-select/-/css-select-4.1.3.tgz;downloadf=
ilename=3Dnpm2/css-select-4.1.3.tgz;sha512sum=3D813df004d77d363e3dac06e6b45=
1e3d5c96320038b6125f59d9f0207b4c13b720d61c932826e41ecb21253fb3363ffd899d892=
2db26f0cb3b1f559cc569301c4;subdir=3Dgit/node_modules/css-select;striplevel=
=3D1 \
+    https://registry.npmjs.org/css-what/-/css-what-5.1.0.tgz;downloadfilen=
ame=3Dnpm2/css-what-5.1.0.tgz;sha512sum=3D6ab48c456208158d2157ca48c593047e6=
308e3b5a3dd1fda5a96430f159808f12238cbfab5f3ab9e90ed8310583c4403e15d18ffde7c=
fb54dd0b78964c57143f;subdir=3Dgit/node_modules/css-what;striplevel=3D1 \
+    https://registry.npmjs.org/date-now/-/date-now-0.1.4.tgz;downloadfilen=
ame=3Dnpm2/date-now-0.1.4.tgz;sha1sum=3Deaf439fd4d4848ad74e5cc7dbef200672b9=
e345b;subdir=3Dgit/node_modules/date-now;striplevel=3D1 \
+    https://registry.npmjs.org/dateformat/-/dateformat-3.0.3.tgz;downloadf=
ilename=3Dnpm2/dateformat-3.0.3.tgz;sha512sum=3D8f20844ed4a5dd5319316791a3b=
898d452f5f607acd6de7984ca39c9a6a6e09aec9b910f2fcf54424a10472888f987f893caf6=
66976782457c86bd6521d8dbdd;subdir=3Dgit/node_modules/dateformat;striplevel=
=3D1 \
+    https://registry.npmjs.org/debug/-/debug-2.6.9.tgz;downloadfilename=3D=
npm2/debug-2.6.9.tgz;sha512sum=3D6c2ec496b7496899cf6c03fed44a2d62fa99b1bdde=
725e708ba05f8ba0494d470da30a7a72fb298348d7ce74532838e6fc4ec076014155e00f54c=
35c286b0730;subdir=3Dgit/node_modules/debug;striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-3.2.7.tgz;downloadfilename=3D=
npm2/debug-3.2.7.tgz;sha512sum=3D0858f3618022e1385f890be2ceb1507af4d35c7b67=
0aa59f7bbc75021804b1c4f3e996cb6dfa0b44b3ee81343206d87a7fc644455512c961c50ff=
ed6bb8b755d;subdir=3Dgit/node_modules/node-red-node-test-helper/node_module=
s/debug;striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-3.2.7.tgz;downloadfilename=3D=
npm2/debug-3.2.7.tgz;sha512sum=3D0858f3618022e1385f890be2ceb1507af4d35c7b67=
0aa59f7bbc75021804b1c4f3e996cb6dfa0b44b3ee81343206d87a7fc644455512c961c50ff=
ed6bb8b755d;subdir=3Dgit/node_modules/nodemon/node_modules/debug;striplevel=
=3D1 \
+    https://registry.npmjs.org/debug/-/debug-3.2.7.tgz;downloadfilename=3D=
npm2/debug-3.2.7.tgz;sha512sum=3D0858f3618022e1385f890be2ceb1507af4d35c7b67=
0aa59f7bbc75021804b1c4f3e996cb6dfa0b44b3ee81343206d87a7fc644455512c961c50ff=
ed6bb8b755d;subdir=3Dgit/node_modules/tiny-lr/node_modules/debug;striplevel=
=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/@babel/traverse/node_modules/debug;st=
riplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/agent-base/node_modules/debug;striple=
vel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/https-proxy-agent/node_modules/debug;=
striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/istanbul-lib-source-maps/node_modules=
/debug;striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/memorystore/node_modules/debug;stripl=
evel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/mocha/node_modules/debug;striplevel=
=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/mqtt-packet/node_modules/debug;stripl=
evel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/mqtt/node_modules/debug;striplevel=3D=
1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/proxy/node_modules/debug;striplevel=
=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dgit/node_modules/superagent/node_modules/debug;striple=
vel=3D1 \
+    https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz;downloadf=
ilename=3Dnpm2/decamelize-1.2.0.tgz;sha1sum=3Df6534d15148269b20352e7bee26f5=
01f9a191290;subdir=3Dgit/node_modules/nyc/node_modules/decamelize;stripleve=
l=3D1 \
+    https://registry.npmjs.org/decamelize/-/decamelize-4.0.0.tgz;downloadf=
ilename=3Dnpm2/decamelize-4.0.0.tgz;sha512sum=3Df621353e04a293d1de208c3624e=
f78222767137781a10ac5277c3bb05bb3497e03a66677bf9b19a54895e52c1c7fa990105f98=
d2bbbc35ea3ea7e9f287627e85;subdir=3Dgit/node_modules/decamelize;striplevel=
=3D1 \
+    https://registry.npmjs.org/decompress-response/-/decompress-response-3=
.3.0.tgz;downloadfilename=3Dnpm2/decompress-response-3.3.0.tgz;sha1sum=3D80=
a4dd323748384bfa248083622aedec982adff3;subdir=3Dgit/node_modules/package-js=
on/node_modules/decompress-response;striplevel=3D1 \
+    https://registry.npmjs.org/decompress-response/-/decompress-response-6=
.0.0.tgz;downloadfilename=3Dnpm2/decompress-response-6.0.0.tgz;sha512sum=3D=
696df9c9933a05bff8a099599dc307d8b0a866d2574d1c444b5eef137868462a305369161da=
24a1644810e70d1f9c9bd27ef5085799113221fbf4a638bd7a309;subdir=3Dgit/node_mod=
ules/decompress-response;striplevel=3D1 \
+    https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz;downloa=
dfilename=3Dnpm2/deep-extend-0.6.0.tgz;sha512sum=3D2ce1f120e68f61d1e5251b42=
41f0c8559b5fc3fb9f33cfab563eb8f51207cdc9bfbc6c1045716de8e3ea2055ac9b65c432b=
34812d591eb8b18d4b10a0f6bc038;subdir=3Dgit/node_modules/deep-extend;striple=
vel=3D1 \
+    https://registry.npmjs.org/default-require-extensions/-/default-requir=
e-extensions-2.0.0.tgz;downloadfilename=3Dnpm2/default-require-extensions-2=
.0.0.tgz;sha1sum=3Df5f8fbb18a7d6d50b21f641f649ebb522cfe24f7;subdir=3Dgit/no=
de_modules/default-require-extensions;striplevel=3D1 \
+    https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-1.1.3.t=
gz;downloadfilename=3Dnpm2/defer-to-connect-1.1.3.tgz;sha512sum=3Dd0849d368=
bac1ef653d84885959799007054bd2c662acc150847fc856eca5a01b86bc31512eff755beae=
598a33923ca5c82c5ed090488910758d5e394bbd1655;subdir=3Dgit/node_modules/pack=
age-json/node_modules/defer-to-connect;striplevel=3D1 \
+    https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-2.0.1.t=
gz;downloadfilename=3Dnpm2/defer-to-connect-2.0.1.tgz;sha512sum=3De2dbedb5e=
a571b555a606ad189b93913025dd6de2e76e9d239531d2d200bea621dd62c78dfca0fc0f64c=
00b638d450a28ee90ed4bd2dc0d706b1dcd2edd1e00e;subdir=3Dgit/node_modules/defe=
r-to-connect;striplevel=3D1 \
+    https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz;d=
ownloadfilename=3Dnpm2/delayed-stream-1.0.0.tgz;sha1sum=3Ddf3ae199acadfb7d4=
40aaae0b29e2272b24ec619;subdir=3Dgit/node_modules/delayed-stream;striplevel=
=3D1 \
+    https://registry.npmjs.org/delegates/-/delegates-1.0.0.tgz;downloadfil=
ename=3Dnpm2/delegates-1.0.0.tgz;sha1sum=3D84c6e159b81904fdca59a0ef44cd870d=
31250f9a;subdir=3Dgit/node_modules/delegates;striplevel=3D1 \
+    https://registry.npmjs.org/denque/-/denque-2.0.1.tgz;downloadfilename=
=3Dnpm2/denque-2.0.1.tgz;sha512sum=3Db5f89673a0502d734ba4d891e6219dd0e72edc=
fdd5a717f3162aae6cb80c7e17cec3d5b2be0241778e820a5367f64dea7db8ef4ffff471fec=
0958457fceb2531;subdir=3Dgit/node_modules/denque;striplevel=3D1 \
+    https://registry.npmjs.org/depd/-/depd-1.1.2.tgz;downloadfilename=3Dnp=
m2/depd-1.1.2.tgz;sha1sum=3D9bcd52e14c097763e749b274c4346ed2e560b5a9;subdir=
=3Dgit/node_modules/depd;striplevel=3D1 \
+    https://registry.npmjs.org/depd/-/depd-2.0.0.tgz;downloadfilename=3Dnp=
m2/depd-2.0.0.tgz;sha512sum=3D83b9c7e8fe9dc838a8268800006a6b1a90ad548989869=
3e4feba02cdd6f77c887ad7fb3f9cfb1f47aa27c8cc2408047f3a50b7c810b49444af528404=
02cb08af;subdir=3Dgit/node_modules/express-session/node_modules/depd;stripl=
evel=3D1 \
+    https://registry.npmjs.org/destroy/-/destroy-1.0.4.tgz;downloadfilenam=
e=3Dnpm2/destroy-1.0.4.tgz;sha1sum=3D978857442c44749e4206613e37946205826abd=
80;subdir=3Dgit/node_modules/destroy;striplevel=3D1 \
+    https://registry.npmjs.org/detect-file/-/detect-file-1.0.0.tgz;downloa=
dfilename=3Dnpm2/detect-file-1.0.0.tgz;sha1sum=3Df0d66d03672a825cb1b73bdb3f=
e62310c8e552b7;subdir=3Dgit/node_modules/detect-file;striplevel=3D1 \
+    https://registry.npmjs.org/detect-libc/-/detect-libc-1.0.3.tgz;downloa=
dfilename=3Dnpm2/detect-libc-1.0.3.tgz;sha1sum=3Dfa137c4bd698edf55cd5cd02ac=
559f91a4c4ba9b;subdir=3Dgit/node_modules/detect-libc;striplevel=3D1 \
+    https://registry.npmjs.org/dicer/-/dicer-0.2.5.tgz;downloadfilename=3D=
npm2/dicer-0.2.5.tgz;sha1sum=3D5996c086bb33218c812c090bddc09cd12facb70f;sub=
dir=3Dgit/node_modules/dicer;striplevel=3D1 \
+    https://registry.npmjs.org/diff/-/diff-4.0.2.tgz;downloadfilename=3Dnp=
m2/diff-4.0.2.tgz;sha512sum=3De7c966c4a480e013722f3f871cc53394e129834f4557e=
7afe9931edef262860771ce073067c5681043e600b0991bd2e6a9f56834c30aa6db48613546=
eae0d8ec;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/d=
iff;striplevel=3D1 \
+    https://registry.npmjs.org/diff/-/diff-5.0.0.tgz;downloadfilename=3Dnp=
m2/diff-5.0.0.tgz;sha512sum=3Dfd54c2aef9b9674246b72fc158796387e0408b0dc82be=
da3f3b34632ef0dc1cfdfe3c5a80c00b7f79ba898ef590f5d7b64e05a1e6917d68c8bbe454c=
fda213df;subdir=3Dgit/node_modules/diff;striplevel=3D1 \
+    https://registry.npmjs.org/dmd/-/dmd-6.0.0.tgz;downloadfilename=3Dnpm2=
/dmd-6.0.0.tgz;sha512sum=3D3f059996a66724f113c2a659ef485a45af940d9703e63781=
0f7cb05b529ffa3618bf4307bbf4bb462f63b12a1e4ccc2470c556f615ce300d48654304b9f=
0613a;subdir=3Dgit/node_modules/dmd;striplevel=3D1 \
+    https://registry.npmjs.org/dom-serializer/-/dom-serializer-0.2.2.tgz;d=
ownloadfilename=3Dnpm2/dom-serializer-0.2.2.tgz;sha512sum=3Ddbfc4f6f7391b10=
e369c76224ae9d79038cf2c16848ffc53c143b807b5c26504d193b101b5338f6b2821d74600=
021d8e23542ba7a3567e9021cecc23d3276df6;subdir=3Dgit/node_modules/jshint/nod=
e_modules/dom-serializer;striplevel=3D1 \
+    https://registry.npmjs.org/dom-serializer/-/dom-serializer-1.3.2.tgz;d=
ownloadfilename=3Dnpm2/dom-serializer-1.3.2.tgz;sha512sum=3De5ce78064e43c38=
a80c4d388d691448b33d28d5b31e7e6e924a98bda43e7f0984152adaad3db5309ade68e28ee=
9f635f2bbf0d328b8360d30190eacf6624be8a;subdir=3Dgit/node_modules/dom-serial=
izer;striplevel=3D1 \
+    https://registry.npmjs.org/domelementtype/-/domelementtype-1.3.1.tgz;d=
ownloadfilename=3Dnpm2/domelementtype-1.3.1.tgz;sha512sum=3D052281f934a9329=
148fc73b108daf53bc68c39367c853de9337190d30fe65919a48440d2149924cb3cf85d0b01=
578e010a1c0692b0df3328d50f4780d9a155df;subdir=3Dgit/node_modules/jshint/nod=
e_modules/domelementtype;striplevel=3D1 \
+    https://registry.npmjs.org/domelementtype/-/domelementtype-2.2.0.tgz;d=
ownloadfilename=3Dnpm2/domelementtype-2.2.0.tgz;sha512sum=3D0ed04ca3cda9bf5=
745b54987cabe3c6de8aeabbf764b1a21afef079bdce8c649583df6ba9f46770728e3d8857b=
6e6af6232a82967a844217e01c9279405d11e4;subdir=3Dgit/node_modules/domelement=
type;striplevel=3D1 \
+    https://registry.npmjs.org/domelementtype/-/domelementtype-2.2.0.tgz;d=
ownloadfilename=3Dnpm2/domelementtype-2.2.0.tgz;sha512sum=3D0ed04ca3cda9bf5=
745b54987cabe3c6de8aeabbf764b1a21afef079bdce8c649583df6ba9f46770728e3d8857b=
6e6af6232a82967a844217e01c9279405d11e4;subdir=3Dgit/node_modules/jshint/nod=
e_modules/dom-serializer/node_modules/domelementtype;striplevel=3D1 \
+    https://registry.npmjs.org/domhandler/-/domhandler-2.3.0.tgz;downloadf=
ilename=3Dnpm2/domhandler-2.3.0.tgz;sha1sum=3D2de59a0822d5027fabff6f032c2b2=
5a2a8abe738;subdir=3Dgit/node_modules/jshint/node_modules/domhandler;stripl=
evel=3D1 \
+    https://registry.npmjs.org/domhandler/-/domhandler-4.2.2.tgz;downloadf=
ilename=3Dnpm2/domhandler-4.2.2.tgz;sha512sum=3D3f313d68132c7593bc4cae019ee=
2701f4413e35c2031b473b99ac751ca589dc1239906b3abc4046815a02c6ed9c82fc3019284=
820969200ea3e109ff1e6c52df;subdir=3Dgit/node_modules/domhandler;striplevel=
=3D1 \
+    https://registry.npmjs.org/dompurify/-/dompurify-2.3.3.tgz;downloadfil=
ename=3Dnpm2/dompurify-2.3.3.tgz;sha512sum=3D76a9ea4643cc023399134168819f9c=
78934cd9d67757fc8d3ae141efedfdaa93bdde11e17d1a47c3785e6100bb0cf2bd16a6d04df=
04a50986249fcf832f5d8c2;subdir=3Dgit/node_modules/dompurify;striplevel=3D1 =
\
+    https://registry.npmjs.org/domutils/-/domutils-1.5.1.tgz;downloadfilen=
ame=3Dnpm2/domutils-1.5.1.tgz;sha1sum=3Ddcd8488a26f563d61079e48c9f7b7e32373=
682cf;subdir=3Dgit/node_modules/jshint/node_modules/domutils;striplevel=3D1=
 \
+    https://registry.npmjs.org/domutils/-/domutils-2.8.0.tgz;downloadfilen=
ame=3Dnpm2/domutils-2.8.0.tgz;sha512sum=3Dc3de828e87e9ef63392088698e0a1b062=
99811fa0f8f1d55c740525fd3f7d1605d656d9620a5344f505dd24cf678d67d8a48ca8076c4=
c8ac7c041e87d4bde1dc;subdir=3Dgit/node_modules/domutils;striplevel=3D1 \
+    https://registry.npmjs.org/dot-prop/-/dot-prop-5.3.0.tgz;downloadfilen=
ame=3Dnpm2/dot-prop-5.3.0.tgz;sha512sum=3D40cf2adf30dee7c86a52a8eb6903a6cd9=
d4b207f525902539442821f8909da842f2d993b45b417bed0ccd9712addfc2457d082bef1f8=
2c0d0057ea2016c04cd9;subdir=3Dgit/node_modules/dot-prop;striplevel=3D1 \
+    https://registry.npmjs.org/duplexer/-/duplexer-0.1.2.tgz;downloadfilen=
ame=3Dnpm2/duplexer-0.1.2.tgz;sha512sum=3D8ed0fa606dfbd190888bff464da24a431=
593643d38e7ee11e214e4ff1d54ca8a9a77227dc7d0a04a2d519550d017c536b312cb4a7164=
09a32286a9631c85a032;subdir=3Dgit/node_modules/duplexer;striplevel=3D1 \
+    https://registry.npmjs.org/duplexer3/-/duplexer3-0.1.4.tgz;downloadfil=
ename=3Dnpm2/duplexer3-0.1.4.tgz;sha1sum=3Dee01dd1cac0ed3cbc7fdbea37dc0a8f1=
ce002ce2;subdir=3Dgit/node_modules/duplexer3;striplevel=3D1 \
+    https://registry.npmjs.org/duplexify/-/duplexify-3.7.1.tgz;downloadfil=
ename=3Dnpm2/duplexify-3.7.1.tgz;sha512sum=3Dd3bcfcbafdb03324b9d642a10f52ac=
757260e5643ab7ddd19dea91c541e7b245d5b6561890ba8cd20a92b50677a63d3bde0ebcee3=
3c21eba8d7c2cdac0b621e6;subdir=3Dgit/node_modules/pumpify/node_modules/dupl=
exify;striplevel=3D1 \
+    https://registry.npmjs.org/duplexify/-/duplexify-4.1.2.tgz;downloadfil=
ename=3Dnpm2/duplexify-4.1.2.tgz;sha512sum=3D7f3dce8dc3421e644fd76309a1930f=
825c7c9b8aeb14ff2ba2f9e4e2f4fc16cf9aa276680b01a0d74752b10b1f3ff13ad9e65c3d3=
31230febaf3a7eef5096ab7;subdir=3Dgit/node_modules/duplexify;striplevel=3D1 =
\
+    https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz;downloadfilen=
ame=3Dnpm2/ee-first-1.1.1.tgz;sha1sum=3D590c61156b0ae2f4f0255732a158b266bc5=
6b21d;subdir=3Dgit/node_modules/ee-first;striplevel=3D1 \
+    https://registry.npmjs.org/emoji-regex/-/emoji-regex-7.0.3.tgz;downloa=
dfilename=3Dnpm2/emoji-regex-7.0.3.tgz;sha512sum=3D0b004b444210ecbbd8141d16=
c91bf086ae4de6a3e173a3cc8c3e9b620805948e58c83825fb4bf1ab95476cc385a8b83b85f=
5b39aef13e59d50a1f8664c8848b4;subdir=3Dgit/node_modules/nyc/node_modules/em=
oji-regex;striplevel=3D1 \
+    https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz;downloa=
dfilename=3Dnpm2/emoji-regex-8.0.0.tgz;sha512sum=3D3128d8cdc58d380d1ec001e9=
cf4331a5816fc20eb28f2d4d1b7c6d7a8ab3eb8e150a8fd13e09ebd7f186b7e89cde2253cd0=
f04bb74dd335e126b09d5526184e8;subdir=3Dgit/node_modules/emoji-regex;striple=
vel=3D1 \
+    https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz;downloadfil=
ename=3Dnpm2/encodeurl-1.0.2.tgz;sha1sum=3Dad3ff4c86ec2d029322f5a02c3a9a606=
c95b3f59;subdir=3Dgit/node_modules/encodeurl;striplevel=3D1 \
+    https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz;dow=
nloadfilename=3Dnpm2/end-of-stream-1.4.4.tgz;sha512sum=3Dfaec358a720754f428=
695b87cd1c97776d6270cf9c9ede02cc3e6b5be342d708ce5124ceb3e4deec53afec084deef=
4bdc7fa08ca12cfe4f4751fea614001eee5;subdir=3Dgit/node_modules/end-of-stream=
;striplevel=3D1 \
+    https://registry.npmjs.org/enquirer/-/enquirer-2.3.6.tgz;downloadfilen=
ame=3Dnpm2/enquirer-2.3.6.tgz;sha512sum=3Dca33673ebdf5e7f1634b8cc8b14c5882e=
6143cfd9ed4d2b877b13b64e2e2c9809c6c50624ccc880fedb0be6db0ebea59fe874c03b711=
92386c3db96dc013ab2e;subdir=3Dgit/node_modules/enquirer;striplevel=3D1 \
+    https://registry.npmjs.org/entities/-/entities-1.0.0.tgz;downloadfilen=
ame=3Dnpm2/entities-1.0.0.tgz;sha1sum=3Db2987aa3821347fcde642b24fdfc9e4fb71=
2bf26;subdir=3Dgit/node_modules/jshint/node_modules/entities;striplevel=3D1=
 \
+    https://registry.npmjs.org/entities/-/entities-2.0.3.tgz;downloadfilen=
ame=3Dnpm2/entities-2.0.3.tgz;sha512sum=3D332a19d238272ef0765f72e0e47aa9166=
9f59326c38887c44262b34dbe5aa6be7545bf93dca766322a9aef44fe6e11a7cafedb43a58c=
8f640c1e918c9a5ad461;subdir=3Dgit/node_modules/markdown-it/node_modules/ent=
ities;striplevel=3D1 \
+    https://registry.npmjs.org/entities/-/entities-2.2.0.tgz;downloadfilen=
ame=3Dnpm2/entities-2.2.0.tgz;sha512sum=3Da7dda27f9373eb5f48d30f9a909acb647=
d0c5f43dbe435f7f573b0413b5749d41039a607d374b5b88429e2684e66d017af1ab85623ba=
ed84e22c1a36eb7f28f4;subdir=3Dgit/node_modules/entities;striplevel=3D1 \
+    https://registry.npmjs.org/entities/-/entities-2.2.0.tgz;downloadfilen=
ame=3Dnpm2/entities-2.2.0.tgz;sha512sum=3Da7dda27f9373eb5f48d30f9a909acb647=
d0c5f43dbe435f7f573b0413b5749d41039a607d374b5b88429e2684e66d017af1ab85623ba=
ed84e22c1a36eb7f28f4;subdir=3Dgit/node_modules/jshint/node_modules/dom-seri=
alizer/node_modules/entities;striplevel=3D1 \
+    https://registry.npmjs.org/error-ex/-/error-ex-1.3.2.tgz;downloadfilen=
ame=3Dnpm2/error-ex-1.3.2.tgz;sha512sum=3Dedd147366a9e15212dd9906c0ab8a8aca=
9e7dd9da98fe7ddf64988e90a16c38fff0cbfa270405f73453ba890a2b2aad3b0a4e3c387cd=
172da95bd3aa4ad0fce2;subdir=3Dgit/node_modules/error-ex;striplevel=3D1 \
+    https://registry.npmjs.org/error/-/error-7.2.1.tgz;downloadfilename=3D=
npm2/error-7.2.1.tgz;sha512sum=3D7e8f4706f5a7c7734650a32f33007f08108c32b7c4=
2606c34d50c490fca003705d77794cd4ec8277eadb43c0709e917a19d55e38b0cd9b22f8379=
060f3466f74;subdir=3Dgit/node_modules/error;striplevel=3D1 \
+    https://registry.npmjs.org/es6-error/-/es6-error-4.1.1.tgz;downloadfil=
ename=3Dnpm2/es6-error-4.1.1.tgz;sha512sum=3D526ffe17132bf422125a1d1b8b966f=
d22383fb8705879a8b7a4b35aa1028a4a540270dddae029b2b24a2929ef01a10cbd073de6a3=
6b43f950b66bc4b92789456;subdir=3Dgit/node_modules/es6-error;striplevel=3D1 =
\
+    https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz;downloadfilen=
ame=3Dnpm2/escalade-3.1.1.tgz;sha512sum=3D9347abda05242dff0ed33289880866913=
9c9953bc8346bfbca00cd3db788b17fd3263189647ba1f41d94c5bb1a1249a5128f4c7e1ad2=
ce68489614652361979f;subdir=3Dgit/node_modules/escalade;striplevel=3D1 \
+    https://registry.npmjs.org/escape-goat/-/escape-goat-2.1.1.tgz;downloa=
dfilename=3Dnpm2/escape-goat-2.1.1.tgz;sha512sum=3Df3fb8885b1b5d82b23cb6244=
5bb0fda476eb79a55a4bf3a9377c9c9f2bc49537703399fa198e96e9ed883de99fbc665e50c=
a99f40ff71aa2193202a7061030fd;subdir=3Dgit/node_modules/escape-goat;striple=
vel=3D1 \
+    https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz;downloa=
dfilename=3Dnpm2/escape-html-1.0.3.tgz;sha1sum=3D0258eae4d3d0c0974de1c16918=
8ef0051d1d1988;subdir=3Dgit/node_modules/escape-html;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/@babe=
l/highlight/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/args/=
node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/figur=
es/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/grunt=
-contrib-concat/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/grunt=
-contrib-copy/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/grunt=
-contrib-uglify/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/maxmi=
n/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-1.0.5.tgz;downloadfilename=3Dnpm2/escape-string-regexp-1.0.5.tgz;sha1sum=
=3D1b61c0562190a8dff6ae3bb2cf0200ca130b86d4;subdir=3Dgit/node_modules/simpl=
e-cli/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-2.0.0.tgz;downloadfilename=3Dnpm2/escape-string-regexp-2.0.0.tgz;sha512sum=
=3D529cdc2c25e895459c36ee47b5530761d5c98c0ae3b05f42d1a367aae658638b96fd5bb4=
9a2cb96285af6d5df8e476ae56f700527a51ba130c72a4dc18e636fb;subdir=3Dgit/node_=
modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp=
-4.0.0.tgz;downloadfilename=3Dnpm2/escape-string-regexp-4.0.0.tgz;sha512sum=
=3D4eda5c349dd7033c771aaf2c591cc96956a346cd2e57103660091d6f58e6d9890fcf81ba=
7a05050320379f9bed10865e7cf93959ae145db2ae4b97ca90959d80;subdir=3Dgit/node_=
modules/mocha/node_modules/escape-string-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz;downloadfilenam=
e=3Dnpm2/esprima-4.0.1.tgz;sha512sum=3D786b85170ed4a5d6be838a7e407be75b4472=
4d7fd255e2410ccfe00ad30044ed1c2ee4f61dc10a9d33ef86357a6867aaac207fb1b368a74=
2acce6d23b1a594e0;subdir=3Dgit/node_modules/esprima;striplevel=3D1 \
+    https://registry.npmjs.org/etag/-/etag-1.8.1.tgz;downloadfilename=3Dnp=
m2/etag-1.8.1.tgz;sha1sum=3D41ae2eeb65efa62268aebfea83ac7d79299b0887;subdir=
=3Dgit/node_modules/etag;striplevel=3D1 \
+    https://registry.npmjs.org/eventemitter2/-/eventemitter2-0.4.14.tgz;do=
wnloadfilename=3Dnpm2/eventemitter2-0.4.14.tgz;sha1sum=3D8f61b75cde012b2e9e=
b284d4545583b5643b61ab;subdir=3Dgit/node_modules/eventemitter2;striplevel=
=3D1 \
+    https://registry.npmjs.org/exit-on-epipe/-/exit-on-epipe-1.0.1.tgz;dow=
nloadfilename=3Dnpm2/exit-on-epipe-1.0.1.tgz;sha512sum=3D876cf99ab44e4f171e=
e7a4bea67bc057cf74baeee5b3b7f5904bd51896f0d4e9451f7fe6949e5b917bb4291c96f78=
bf7ef3cc73e251de7988b9f70c0ed38d6a7;subdir=3Dgit/node_modules/exit-on-epipe=
;striplevel=3D1 \
+    https://registry.npmjs.org/exit/-/exit-0.1.2.tgz;downloadfilename=3Dnp=
m2/exit-0.1.2.tgz;sha1sum=3D0632638f8d877cc82107d30a0fff1a17cba1cd0c;subdir=
=3Dgit/node_modules/exit;striplevel=3D1 \
+    https://registry.npmjs.org/expand-tilde/-/expand-tilde-2.0.2.tgz;downl=
oadfilename=3Dnpm2/expand-tilde-2.0.2.tgz;sha1sum=3D97e801aa052df02454de46b=
02bf621642cdc8502;subdir=3Dgit/node_modules/expand-tilde;striplevel=3D1 \
+    https://registry.npmjs.org/express-session/-/express-session-1.17.2.tg=
z;downloadfilename=3Dnpm2/express-session-1.17.2.tgz;sha512sum=3D98f71870b0=
3496f87b0f83aaaf968d24532d04c28f2e5fbe38a2b1907cd9d14d280ead6ba4a067911e5fe=
6f087476e95780ae54ce105f6d778c7922320292c45;subdir=3Dgit/node_modules/expre=
ss-session;striplevel=3D1 \
+    https://registry.npmjs.org/express/-/express-4.17.1.tgz;downloadfilena=
me=3Dnpm2/express-4.17.1.tgz;sha512sum=3D98727d3bbf51aa5ba9851adcc365ff1938=
7793db55bfc61ca326382a487858331460a45952ad21d68d30dabaebc41a8ced5a1e515aa06=
f6ef19443174e762de2;subdir=3Dgit/node_modules/express;striplevel=3D1 \
+    https://registry.npmjs.org/extend/-/extend-3.0.2.tgz;downloadfilename=
=3Dnpm2/extend-3.0.2.tgz;sha512sum=3D7e3aae0b9f5c0fb0b25babab3572b4141b9f91=
97288861bcd304ee3ee8d7e7dd1c0794ed967db4136501e12fd601156a8577df665d8b3604b=
e81074f2088a6fe;subdir=3Dgit/node_modules/extend;striplevel=3D1 \
+    https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-2.0.1.tgz=
;downloadfilename=3Dnpm2/fast-deep-equal-2.0.1.tgz;sha1sum=3D7b05218ddf9667=
bf7f370bf7fdb2cb15fdd0aa49;subdir=3Dgit/node_modules/@prantlf/jsonlint/node=
_modules/fast-deep-equal;striplevel=3D1 \
+    https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz=
;downloadfilename=3Dnpm2/fast-deep-equal-3.1.3.tgz;sha512sum=3D7f7a90f68432=
f63d808417bf1fd542f75c0b98a042094fe00ce9ca340606e61b303bb04b2a3d3d1dce4760d=
cfd70623efb19690c22200da8ad56cd3701347ce1;subdir=3Dgit/node_modules/fast-de=
ep-equal;striplevel=3D1 \
+    https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stab=
le-stringify-2.1.0.tgz;downloadfilename=3Dnpm2/fast-json-stable-stringify-2=
.1.0.tgz;sha512sum=3D96177fc05f8b93df076684c2b6556b687b5f8795d88a32236a55dc=
93bb1a52db9a9d20f22ccc671e149710326a1f10fb9ac47c0f4b829aa964c23095f31bf01f;=
subdir=3Dgit/node_modules/fast-json-stable-stringify;striplevel=3D1 \
+    https://registry.npmjs.org/fast-safe-stringify/-/fast-safe-stringify-2=
.1.1.tgz;downloadfilename=3Dnpm2/fast-safe-stringify-2.1.1.tgz;sha512sum=3D=
5be28973676620b94fa650ff1f82bd97d2dc00701f3ed3fa058f38b952d743a12f733f4b720=
df7636cf52156e54fac5d639e0f5d854712ffb45a9abc228eb390;subdir=3Dgit/node_mod=
ules/fast-safe-stringify;striplevel=3D1 \
+    https://registry.npmjs.org/faye-websocket/-/faye-websocket-0.10.0.tgz;=
downloadfilename=3Dnpm2/faye-websocket-0.10.0.tgz;sha1sum=3D4e492f8d04dfb6f=
89003507f6edbf2d501e7c6f4;subdir=3Dgit/node_modules/faye-websocket;striplev=
el=3D1 \
+    https://registry.npmjs.org/figures/-/figures-1.7.0.tgz;downloadfilenam=
e=3Dnpm2/figures-1.7.0.tgz;sha1sum=3Dcbe1e3affcf1cd44b80cadfed28dc793a9701d=
2e;subdir=3Dgit/node_modules/figures;striplevel=3D1 \
+    https://registry.npmjs.org/file-set/-/file-set-4.0.2.tgz;downloadfilen=
ame=3Dnpm2/file-set-4.0.2.tgz;sha512sum=3D7eec448339382fcc1a19768091df1c32b=
ef73e6d05c4e5649fc873b73516ec100784e187f74be240d5db88eb2779c09699f227a94e98=
980330c5131d2844dc79;subdir=3Dgit/node_modules/file-set;striplevel=3D1 \
+    https://registry.npmjs.org/file-sync-cmp/-/file-sync-cmp-0.1.1.tgz;dow=
nloadfilename=3Dnpm2/file-sync-cmp-0.1.1.tgz;sha1sum=3Da5e7a8ffbfa493b43b92=
3bbd4ca89a53b63b612b;subdir=3Dgit/node_modules/file-sync-cmp;striplevel=3D1=
 \
+    https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz;downloadf=
ilename=3Dnpm2/fill-range-7.0.1.tgz;sha512sum=3Da8ea3d17e74c5260b62dc6f805b=
56f9ca2714cf8c29be451a5ee200ee1abce42fb984565fdd8d84aed8e750d8f6b7d36378a2a=
91283d8abea368b589d94495a5;subdir=3Dgit/node_modules/fill-range;striplevel=
=3D1 \
+    https://registry.npmjs.org/finalhandler/-/finalhandler-1.1.2.tgz;downl=
oadfilename=3Dnpm2/finalhandler-1.1.2.tgz;sha512sum=3D68059c5b9eeec5536b419=
a855e3213a56dec2144261c61b7a926fd9946a1f4c80c0b835e5a134e94d8d7118ab71e3440=
bcbe9aad4be2646189b0183acf4cec58;subdir=3Dgit/node_modules/finalhandler;str=
iplevel=3D1 \
+    https://registry.npmjs.org/find-cache-dir/-/find-cache-dir-2.1.0.tgz;d=
ownloadfilename=3Dnpm2/find-cache-dir-2.1.0.tgz;sha512sum=3D4eae8f8b1134c3f=
54c15f0a06ce36792240856897f2492fb9d1322db47eacc0e0d46cf407dea8c19e45d3e2df0=
221624c63781696876af1c1aa67e53bb722a39;subdir=3Dgit/node_modules/find-cache=
-dir;striplevel=3D1 \
+    https://registry.npmjs.org/find-replace/-/find-replace-3.0.0.tgz;downl=
oadfilename=3Dnpm2/find-replace-3.0.0.tgz;sha512sum=3De936f69b2322a02020bf9=
91fbcfe7f3e4659fe7b53a552b7f5f1d8ed6916060bdb784f951ddfed66e6789ab0be6f1878=
71f3997982953da24866d65757b18d09;subdir=3Dgit/node_modules/find-replace;str=
iplevel=3D1 \
+    https://registry.npmjs.org/find-up/-/find-up-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/find-up-3.0.0.tgz;sha512sum=3Dd720fa4662c8d5705fc6e82f391c25724e9f=
ef9b582fe891d23ab0b0eacec4c672198a94b83849d25e005dd3b5897fc54ecf5c040304935=
816484c759126f296;subdir=3Dgit/node_modules/nyc/node_modules/find-up;stripl=
evel=3D1 \
+    https://registry.npmjs.org/find-up/-/find-up-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/find-up-3.0.0.tgz;sha512sum=3Dd720fa4662c8d5705fc6e82f391c25724e9f=
ef9b582fe891d23ab0b0eacec4c672198a94b83849d25e005dd3b5897fc54ecf5c040304935=
816484c759126f296;subdir=3Dgit/node_modules/pkg-dir/node_modules/find-up;st=
riplevel=3D1 \
+    https://registry.npmjs.org/find-up/-/find-up-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/find-up-3.0.0.tgz;sha512sum=3Dd720fa4662c8d5705fc6e82f391c25724e9f=
ef9b582fe891d23ab0b0eacec4c672198a94b83849d25e005dd3b5897fc54ecf5c040304935=
816484c759126f296;subdir=3Dgit/node_modules/test-exclude/node_modules/find-=
up;striplevel=3D1 \
+    https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz;downloadfilenam=
e=3Dnpm2/find-up-4.1.0.tgz;sha512sum=3D3e93b001d43f6255d0daf8fc6b787c222a43=
b98462df071e550406616c4d20d71cab8d009f0ec196c11708c6edd59b7e38b03a16af6cb88=
a48583d0eb2721297;subdir=3Dgit/node_modules/read-pkg-up/node_modules/find-u=
p;striplevel=3D1 \
+    https://registry.npmjs.org/find-up/-/find-up-5.0.0.tgz;downloadfilenam=
e=3Dnpm2/find-up-5.0.0.tgz;sha512sum=3Defcfcf5d3d7094b2c3813cc3b3bb23abd873=
cf4bd70fece7fbbc32a447b87d74310a6766a9f1ac10f4319a2092408dda8c557dd5b552b2f=
36dac94625ba9c69e;subdir=3Dgit/node_modules/find-up;striplevel=3D1 \
+    https://registry.npmjs.org/findup-sync/-/findup-sync-0.3.0.tgz;downloa=
dfilename=3Dnpm2/findup-sync-0.3.0.tgz;sha1sum=3D37930aa5d816b777c03445e196=
6cc6790a4c0b16;subdir=3Dgit/node_modules/findup-sync;striplevel=3D1 \
+    https://registry.npmjs.org/findup-sync/-/findup-sync-4.0.0.tgz;downloa=
dfilename=3Dnpm2/findup-sync-4.0.0.tgz;sha512sum=3Dea3bef9ffd76202e2ab8b04b=
d4a3689310bbc164ef62771a554612a315b0ed8ca43cbb91ae7bf8a9d1dc48ecb0388e51a64=
39519e411b5633cfeaf86e96eaa7d;subdir=3Dgit/node_modules/liftup/node_modules=
/findup-sync;striplevel=3D1 \
+    https://registry.npmjs.org/fined/-/fined-1.2.0.tgz;downloadfilename=3D=
npm2/fined-1.2.0.tgz;sha512sum=3D6580ea3cb1b10e40e10d90636416fea03d7e8f4ac0=
e04d295d8e747a994000e3e0d8dfe050149293920cd7f4213dfc95a35f6527e0af5e9a9fbe4=
f9bda9ffc36;subdir=3Dgit/node_modules/fined;striplevel=3D1 \
+    https://registry.npmjs.org/flagged-respawn/-/flagged-respawn-1.0.1.tgz=
;downloadfilename=3Dnpm2/flagged-respawn-1.0.1.tgz;sha512sum=3D94d687355ca6=
6a39a4d0e24c067f1f554014d41b4378a22a2a8561938c4000b079eda00b83a6f85b431f27f=
71413483d6015f2e5785294f22960827b1da63fdd;subdir=3Dgit/node_modules/flagged=
-respawn;striplevel=3D1 \
+    https://registry.npmjs.org/flat/-/flat-5.0.2.tgz;downloadfilename=3Dnp=
m2/flat-5.0.2.tgz;sha512sum=3D6fab2e103fb9ff7ad3a5405d1b582ea4897c30f14200c=
034417c269632e1bc250a714bdd138816932f73a6e1827171ceb33e09f703c6356aba38aa66=
233cf785;subdir=3Dgit/node_modules/flat;striplevel=3D1 \
+    https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.14.5.=
tgz;downloadfilename=3Dnpm2/follow-redirects-1.14.5.tgz;sha512sum=3Dc2da614=
97cbb778fce47e32f2056c25410f3679e76d2a57c5df3e495237942dc6e314259f9bd169ecb=
757b59420e871fcee0a41ea8fc93416966a3be50868a34;subdir=3Dgit/node_modules/fo=
llow-redirects;striplevel=3D1 \
+    https://registry.npmjs.org/for-in/-/for-in-1.0.2.tgz;downloadfilename=
=3Dnpm2/for-in-1.0.2.tgz;sha1sum=3D81068d295a8142ec0ac726c6e2200c30fb6d5e80=
;subdir=3Dgit/node_modules/for-in;striplevel=3D1 \
+    https://registry.npmjs.org/for-own/-/for-own-1.0.0.tgz;downloadfilenam=
e=3Dnpm2/for-own-1.0.0.tgz;sha1sum=3Dc63332f415cedc4b04dbfe70cf836494c53cb4=
4b;subdir=3Dgit/node_modules/for-own;striplevel=3D1 \
+    https://registry.npmjs.org/foreground-child/-/foreground-child-1.5.6.t=
gz;downloadfilename=3Dnpm2/foreground-child-1.5.6.tgz;sha1sum=3D4fd71ad2dfd=
e96789b980a5c0a295937cb2f5ce9;subdir=3Dgit/node_modules/foreground-child;st=
riplevel=3D1 \
+    https://registry.npmjs.org/form-data/-/form-data-2.5.1.tgz;downloadfil=
ename=3Dnpm2/form-data-2.5.1.tgz;sha512sum=3D9b6d4ddd63a6104511824e81f462ce=
13846e58e15fdbc2e187da8661e3651aae150d7525272dad876b2504d53c1a9f04ce5a1864e=
89b649eede5e708ac54a354;subdir=3Dgit/node_modules/node-red-node-test-helper=
/node_modules/form-data;striplevel=3D1 \
+    https://registry.npmjs.org/form-data/-/form-data-3.0.1.tgz;downloadfil=
ename=3Dnpm2/form-data-3.0.1.tgz;sha512sum=3D4479012ad2d6515c1ded2a9122f099=
304bc0328194a745d4fac7908997a38f408ecf7448de158fe2c0afde065658b8c94ddeeb1b0=
72c17978a6468a2d2bfe16e;subdir=3Dgit/node_modules/superagent/node_modules/f=
orm-data;striplevel=3D1 \
+    https://registry.npmjs.org/form-data/-/form-data-4.0.0.tgz;downloadfil=
ename=3Dnpm2/form-data-4.0.0.tgz;sha512sum=3D1131249521a2e6dd10319ba25e803f=
43abdc9f170b40fe6f76e812a6e0328ba4951a2d9c94f3e9fb180486e31a1c2fb31a09f7d4a=
776df95b7e5fec7ca491ac3;subdir=3Dgit/node_modules/form-data;striplevel=3D1 =
\
+    https://registry.npmjs.org/formidable/-/formidable-1.2.6.tgz;downloadf=
ilename=3Dnpm2/formidable-1.2.6.tgz;sha512sum=3D29ca5b729b8b34ec2b1239dba4c=
0b4812f97f1c883a19135924ab36ade1af2fae9adffacf6928d43f408c167db7ece25b60985=
977303d7bed235392f7b707019;subdir=3Dgit/node_modules/formidable;striplevel=
=3D1 \
+    https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz;downloadfil=
ename=3Dnpm2/forwarded-0.2.0.tgz;sha512sum=3D6ee446d1fa41b511d24c238049eea1=
0f6e7cb44b9b16844b6f864d03a3713151cdc3680e7301e8f70c9a6e5ccccce039cfdc40f4b=
d4a36393f36de8c4fd698a3;subdir=3Dgit/node_modules/forwarded;striplevel=3D1 =
\
+    https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz;downloadfilename=3D=
npm2/fresh-0.5.2.tgz;sha1sum=3D3d8cadd90d976569fa835ab1f8e4b23a105605a7;sub=
dir=3Dgit/node_modules/fresh;striplevel=3D1 \
+    https://registry.npmjs.org/fs-constants/-/fs-constants-1.0.0.tgz;downl=
oadfilename=3Dnpm2/fs-constants-1.0.0.tgz;sha512sum=3Dcba380c284887fb1728cc=
22ff78bbe6f9add85e6448f347adc64f26499b9aa1e018bed988302c2708fdf3c56642f93d2=
8b13ade9934a9bec3e1dfa7f05c8b0a3;subdir=3Dgit/node_modules/fs-constants;str=
iplevel=3D1 \
+    https://registry.npmjs.org/fs-extra/-/fs-extra-10.0.0.tgz;downloadfile=
name=3Dnpm2/fs-extra-10.0.0.tgz;sha512sum=3D0b9a306f5e2ef5e2708b328675c85c0=
d441e16d9521c7b61064f296d7f557353c566b2e899bb9d8c39cd9ecf3c698b250b217a218e=
52530dd1a33eb14a170421;subdir=3Dgit/node_modules/fs-extra;striplevel=3D1 \
+    https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz;downloa=
dfilename=3Dnpm2/fs-minipass-2.1.0.tgz;sha512sum=3D57f26038b1424be47a55cab4=
b250ae69e58474d0b7a2e0e524c348b1a707d95b402e2bbd995e0b3eb1dce5c0e5f24e5ac3a=
27c8f08165a9893a39458866233be;subdir=3Dgit/node_modules/fs-minipass;striple=
vel=3D1 \
+    https://registry.npmjs.org/fs-then-native/-/fs-then-native-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/fs-then-native-2.0.0.tgz;sha1sum=3D19a124d94d90c22c8=
e045f2e8dd6ebea36d48c67;subdir=3Dgit/node_modules/fs-then-native;striplevel=
=3D1 \
+    https://registry.npmjs.org/fs.notify/-/fs.notify-0.0.4.tgz;downloadfil=
ename=3Dnpm2/fs.notify-0.0.4.tgz;sha1sum=3D63284d45a34b52ce60088a6ddbec5b77=
6d3c013d;subdir=3Dgit/node_modules/fs.notify;striplevel=3D1 \
+    https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz;downloa=
dfilename=3Dnpm2/fs.realpath-1.0.0.tgz;sha1sum=3D1504ad2523158caa40db4a2787=
cb01411994ea4f;subdir=3Dgit/node_modules/fs.realpath;striplevel=3D1 \
+    https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz;dow=
nloadfilename=3Dnpm2/function-bind-1.1.1.tgz;sha512sum=3Dc88a2f033317e3db05=
f18979f1f482589e6cbd22ee6a26cfc5740914b98139b4ee0abd0c7f52a23e8a4633d362163=
8980426df69ad8587a6eb790e803554c8d0;subdir=3Dgit/node_modules/function-bind=
;striplevel=3D1 \
+    https://registry.npmjs.org/gauge/-/gauge-4.0.0.tgz;downloadfilename=3D=
npm2/gauge-4.0.0.tgz;sha512sum=3D17cb14e39c90a63423c4a926d5438085fd14fced1a=
16dfff165ee1b2b355b68fa96ad3078ecedd3c8f6614e19429b86b80a9b44b71235b7b1c305=
b909964913b;subdir=3Dgit/node_modules/gauge;striplevel=3D1 \
+    https://registry.npmjs.org/gaze/-/gaze-1.1.3.tgz;downloadfilename=3Dnp=
m2/gaze-1.1.3.tgz;sha512sum=3D05174d9bc85b5b31735871114eb7a32eac070df4b81a2=
6cfa2ae708d33c8a091e806d2863e0df10057f198cfbdced6d77a5c5c7f687041c6b3d4fb66=
15eb9ef2;subdir=3Dgit/node_modules/gaze;striplevel=3D1 \
+    https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz=
;downloadfilename=3Dnpm2/get-caller-file-2.0.5.tgz;sha512sum=3D0f214fdc133f=
dd81d340e0942ffc343991d1d25a4a786af1a2d70759ca8d11d9e5b6a1705d57e110143de1e=
228df801f429a34ac6922e1cc8889fb58d3a87616;subdir=3Dgit/node_modules/get-cal=
ler-file;striplevel=3D1 \
+    https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.1.1.tgz;dow=
nloadfilename=3Dnpm2/get-intrinsic-1.1.1.tgz;sha512sum=3D91666b9d5338d900a2=
100d888356c6f338e820c3a0c56c1808478d77063a4effdc392786a5ca17e295c77ca53134a=
56802b9eb12bd9ef6cae7031c4622b692f5;subdir=3Dgit/node_modules/get-intrinsic=
;striplevel=3D1 \
+    https://registry.npmjs.org/get-stream/-/get-stream-4.1.0.tgz;downloadf=
ilename=3Dnpm2/get-stream-4.1.0.tgz;sha512sum=3D18c6ade04279d7ad64232d877af=
2e5af896e363060be68f8d7729a400ee3b7857c078443b1fa4793b590f4656a7d8cb2c7c392=
fcbeba2a8c7eac944d9252caef;subdir=3Dgit/node_modules/package-json/node_modu=
les/got/node_modules/get-stream;striplevel=3D1 \
+    https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz;downloadf=
ilename=3Dnpm2/get-stream-5.2.0.tgz;sha512sum=3D9c117e175ac06550aefe9eeb8f3=
800f986f895f617ae997b6ba56626b53cc05f48d422af3ff4303cd6479ce9706d3918e9dbed=
148cc5312c905db2e84d03d1a4;subdir=3Dgit/node_modules/get-stream;striplevel=
=3D1 \
+    https://registry.npmjs.org/getobject/-/getobject-1.0.2.tgz;downloadfil=
ename=3Dnpm2/getobject-1.0.2.tgz;sha512sum=3Ddb36e50c168571bdeb078ac5efb5d5=
9ee20d384da1da4fce9ea5c08b2d08ad3c547d5d62169de56b7de8010558f690a9594dbaf16=
15856ddadef586532e2ec3a;subdir=3Dgit/node_modules/getobject;striplevel=3D1 =
\
+    https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz;downloa=
dfilename=3Dnpm2/glob-parent-5.1.2.tgz;sha512sum=3D00e22049009ea62258c0fdc0=
4671b1fb95674eed870587736c63f8e5e2f0d6faf7cc1def64b7b279dd6c0bd8676dc39cf7f=
4ab33233944f42b906cf8692f59a3;subdir=3Dgit/node_modules/glob-parent;striple=
vel=3D1 \
+    https://registry.npmjs.org/glob/-/glob-5.0.15.tgz;downloadfilename=3Dn=
pm2/glob-5.0.15.tgz;sha1sum=3D1bc936b9e02f4a603fcc222ecf7633d30b8b93b1;subd=
ir=3Dgit/node_modules/findup-sync/node_modules/glob;striplevel=3D1 \
+    https://registry.npmjs.org/glob/-/glob-7.1.7.tgz;downloadfilename=3Dnp=
m2/glob-7.1.7.tgz;sha512sum=3D3af0fd10dccf2db7a010d9d83f95147c9222ad3838f97=
c0c5866907d04d8d097a7c4dbef20a3f7537fed01048f22efe51f15d84999a95e55077aa008=
74acc12d;subdir=3Dgit/node_modules/glob;striplevel=3D1 \
+    https://registry.npmjs.org/global-dirs/-/global-dirs-3.0.0.tgz;downloa=
dfilename=3Dnpm2/global-dirs-3.0.0.tgz;sha512sum=3Dbfc868d834b94620a37ed8f5=
9c3f4d9a77da3b34ddb9ded146755df6414d3a3a996c84a5c790d0f8ead3932c20774748b7b=
a050af29eb59487a0770fdec0dd88;subdir=3Dgit/node_modules/global-dirs;striple=
vel=3D1 \
+    https://registry.npmjs.org/global-modules/-/global-modules-1.0.0.tgz;d=
ownloadfilename=3Dnpm2/global-modules-1.0.0.tgz;sha512sum=3Db0ace91247f5d46=
a4e16ec346738f39ade01e146708ce706ef9ecf3efadf87170b15bab4c29b20a4eab1a71b71=
162086e03b46f7733a5d155b176a0675ebfb6e;subdir=3Dgit/node_modules/global-mod=
ules;striplevel=3D1 \
+    https://registry.npmjs.org/global-prefix/-/global-prefix-1.0.2.tgz;dow=
nloadfilename=3Dnpm2/global-prefix-1.0.2.tgz;sha1sum=3Ddbf743c6c14992593c65=
5568cb66ed32c0122ebe;subdir=3Dgit/node_modules/global-prefix;striplevel=3D1=
 \
+    https://registry.npmjs.org/globals/-/globals-11.12.0.tgz;downloadfilen=
ame=3Dnpm2/globals-11.12.0.tgz;sha512sum=3D58e069fc410652222c252a7bc1cbffcb=
a30efa557d5289dc5aac6e15f9bc781c3358d8327c177a1b3f8878a43d8c29b28681fdf60d7=
93374fe41a5471638b354;subdir=3Dgit/node_modules/globals;striplevel=3D1 \
+    https://registry.npmjs.org/globule/-/globule-1.3.3.tgz;downloadfilenam=
e=3Dnpm2/globule-1.3.3.tgz;sha512sum=3D99bd5a62d0db2234eee1284c07ce66dd4ce3=
5fd05529ef560b3b277cc49993e2b91a921b04e7b1820e0f3c2b797870c41b9fd9400517d8a=
72dd36cdf88f2ec2a;subdir=3Dgit/node_modules/globule;striplevel=3D1 \
+    https://registry.npmjs.org/got/-/got-11.8.2.tgz;downloadfilename=3Dnpm=
2/got-11.8.2.tgz;sha512sum=3D0f4432c0a8087b7d0e0ecf9f9bcc0c66201c663ca9702a=
1d3cdb8ccf91fd327cbb449f888c9d7405d9865bb38cedf1d73fe3bbafa6706a943f61098c4=
af07451;subdir=3Dgit/node_modules/got;striplevel=3D1 \
+    https://registry.npmjs.org/got/-/got-9.6.0.tgz;downloadfilename=3Dnpm2=
/got-9.6.0.tgz;sha512sum=3D47b796a6d5ee198c708a3b34795fafde8ebe5c7d48a952bc=
74938479c41f4e6927730f4057875cc3f0e1c62f0c765a8fb61c71a59ca2ccccf283c453984=
b06f9;subdir=3Dgit/node_modules/package-json/node_modules/got;striplevel=3D=
1 \
+    https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.8.tgz;downloa=
dfilename=3Dnpm2/graceful-fs-4.2.8.tgz;sha512sum=3Daa422294f51870d849a5ddf7=
9f41815d307530c3e9d784f112c12cd294ebb1256e700a6c6335b957e43c43186293a294dde=
bf2faa900028c13072ca62b46af76;subdir=3Dgit/node_modules/graceful-fs;striple=
vel=3D1 \
+    https://registry.npmjs.org/growl/-/growl-1.10.5.tgz;downloadfilename=
=3Dnpm2/growl-1.10.5.tgz;sha512sum=3Da81af83ae10b9213de9d6ea0a0a5578afe3b51=
2ddc95bdff21bb9617d28d2848a3032f68787c54f488338ef2611e453385a8fbace503efe60=
65aa5232e9e6848;subdir=3Dgit/node_modules/growl;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-chmod/-/grunt-chmod-1.1.1.tgz;downloa=
dfilename=3Dnpm2/grunt-chmod-1.1.1.tgz;sha1sum=3Dd1865c5a84e7ed9aefe509ffbf=
5290f97a257840;subdir=3Dgit/node_modules/grunt-chmod;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-cli/-/grunt-cli-1.4.3.tgz;downloadfil=
ename=3Dnpm2/grunt-cli-1.4.3.tgz;sha512sum=3Df43b71fc0855781e0b633b158828d4=
4247742b0d0c70dda06297661982ad1366b962deefd50f8761955686a5dcfe41a7c6532da8a=
0f14b0a2d8867859a4ac2a1;subdir=3Dgit/node_modules/grunt-cli;striplevel=3D1 =
\
+    https://registry.npmjs.org/grunt-concurrent/-/grunt-concurrent-3.0.0.t=
gz;downloadfilename=3Dnpm2/grunt-concurrent-3.0.0.tgz;sha512sum=3D0205ed8d4=
2444871067865fc9de2f79e65c14c74a3d500b8f00050de7836fef8ee481a430fc80a7151d2=
9573fbd69164211f134077fe7a898ec7a39261281fac;subdir=3Dgit/node_modules/grun=
t-concurrent;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-clean/-/grunt-contrib-clean-2=
.0.0.tgz;downloadfilename=3Dnpm2/grunt-contrib-clean-2.0.0.tgz;sha512sum=3D=
839643dce464ea031ae6e819a2c2c3425ddd64eedc237475e14ef985333e7552d5c5d30d242=
3d59b07fd394b78bf879682928a596a152bd0d97356a6269e2743;subdir=3Dgit/node_mod=
ules/grunt-contrib-clean;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-compress/-/grunt-contrib-comp=
ress-2.0.0.tgz;downloadfilename=3Dnpm2/grunt-contrib-compress-2.0.0.tgz;sha=
512sum=3Daff7401b1e2a1beae604517895bfe14e4b56da1b86306c6448b7fd9ac8773cfb6a=
d3e71d41141ead9277d1429ebd7dc12d0b288702f33b4a75cff2eb1fa68a5d;subdir=3Dgit=
/node_modules/grunt-contrib-compress;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-concat/-/grunt-contrib-concat=
-1.0.1.tgz;downloadfilename=3Dnpm2/grunt-contrib-concat-1.0.1.tgz;sha1sum=
=3D61509863084e871d7e86de48c015259ed97745bd;subdir=3Dgit/node_modules/grunt=
-contrib-concat;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-copy/-/grunt-contrib-copy-1.0=
.0.tgz;downloadfilename=3Dnpm2/grunt-contrib-copy-1.0.0.tgz;sha1sum=3D7060c=
6581e904b8ab0d00f076e0a8f6e3e7c3573;subdir=3Dgit/node_modules/grunt-contrib=
-copy;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-jshint/-/grunt-contrib-jshint=
-3.1.1.tgz;downloadfilename=3Dnpm2/grunt-contrib-jshint-3.1.1.tgz;sha512sum=
=3D130318e8bf7516a4dc3256535680de7aafc464bfbb328172a35af121e6bdb31cafef781e=
56081e137ee371484d6eee612dbc4713cd8218852a8ad1ee476feafa;subdir=3Dgit/node_=
modules/grunt-contrib-jshint;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-uglify/-/grunt-contrib-uglify=
-5.0.1.tgz;downloadfilename=3Dnpm2/grunt-contrib-uglify-5.0.1.tgz;sha512sum=
=3D4ff697678588a40b68b3066a6fa1d138a83bbaaf506cac25fa552e3b02b87a8163ded16f=
f7f6bfa0cc9ddffaaf7ad576f4f6dff0fd5861d6b5803c19a69afad0;subdir=3Dgit/node_=
modules/grunt-contrib-uglify;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-contrib-watch/-/grunt-contrib-watch-1=
.1.0.tgz;downloadfilename=3Dnpm2/grunt-contrib-watch-1.1.0.tgz;sha512sum=3D=
c86c1e37ed035b9c8cfa8a39f1f46efd7211acf727debe2d431fa72fb78c4708e9be4fab418=
e91f28f7804f2b48b65214e0f45376d614be9bcbd1f2ff6f5df7a;subdir=3Dgit/node_mod=
ules/grunt-contrib-watch;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-jsdoc-to-markdown/-/grunt-jsdoc-to-ma=
rkdown-6.0.0.tgz;downloadfilename=3Dnpm2/grunt-jsdoc-to-markdown-6.0.0.tgz;=
sha512sum=3Dbef6a729412ba7a08797832e2d0f6fc097b0a4cbbc162ef3d3d96be0ec0c2eb=
f8606ede71b9951359baee6691663caafd5a53c5a45fdeffac9695b370355b1f2;subdir=3D=
git/node_modules/grunt-jsdoc-to-markdown;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-jsdoc/-/grunt-jsdoc-2.4.1.tgz;downloa=
dfilename=3Dnpm2/grunt-jsdoc-2.4.1.tgz;sha512sum=3D4b4cf1534c037b046eef3faf=
8a3108b4e59efd4b6dc56566bf3d2acf6655700611d86a578ec8ac922d820153746f5f2ddaa=
7952dd9b166425a11608eb0acdc03;subdir=3Dgit/node_modules/grunt-jsdoc;striple=
vel=3D1 \
+    https://registry.npmjs.org/grunt-jsonlint/-/grunt-jsonlint-2.1.3.tgz;d=
ownloadfilename=3Dnpm2/grunt-jsonlint-2.1.3.tgz;sha512sum=3D874e2a0bdebd2c8=
ca1b0968049e27f8439e72a7b2748d64aaa3607adae9c73f590ceb7cc6629d03ddaf5d45854=
e13f0ecc0aba79c317e506ae6222646e3515fd;subdir=3Dgit/node_modules/grunt-json=
lint;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-known-options/-/grunt-known-options-2=
.0.0.tgz;downloadfilename=3Dnpm2/grunt-known-options-2.0.0.tgz;sha512sum=3D=
183edc4f3d08e1201e75ed7ffa901b989446e38cc52cf8a956d74bf68defab1f481326fb6f8=
fd8deceebea87c8dc27214791af609fbc6ee0928a80efe5d40b88;subdir=3Dgit/node_mod=
ules/grunt-known-options;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-legacy-log-utils/-/grunt-legacy-log-u=
tils-2.1.0.tgz;downloadfilename=3Dnpm2/grunt-legacy-log-utils-2.1.0.tgz;sha=
512sum=3D970aae68f5c9b4a424d2b50cd48400a29e67a04a7016a3976ac56879d2de3736a2=
6dffce3d68ca62fbddaa710736653ed13d026917805c86c6a3be3b643f806b;subdir=3Dgit=
/node_modules/grunt-legacy-log-utils;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-legacy-log/-/grunt-legacy-log-3.0.0.t=
gz;downloadfilename=3Dnpm2/grunt-legacy-log-3.0.0.tgz;sha512sum=3D187650cd9=
9a1caad2ede1afb6875b8a941f4c43cf0a7661795d2cf6530a394e786b1c00e5963dfb591b7=
5e2a16f0c6ac1a9f8e05122edfd2c5c75e122e35d170;subdir=3Dgit/node_modules/grun=
t-legacy-log;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-legacy-util/-/grunt-legacy-util-2.0.1=
.tgz;downloadfilename=3Dnpm2/grunt-legacy-util-2.0.1.tgz;sha512sum=3Dd9b422=
0f87f35ea5fcae135d5e4032c0269d7aa88f89acb4a109f2efbc00d85dd617882b3c95c2bc0=
732a1650957ea68fdbd798251a4c6e4a24022b6f7d502db;subdir=3Dgit/node_modules/g=
runt-legacy-util;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-mkdir/-/grunt-mkdir-1.1.0.tgz;downloa=
dfilename=3Dnpm2/grunt-mkdir-1.1.0.tgz;sha512sum=3D151135ece615bde35b549157=
f063c66b96f31f666201d071dead0ac24d8383a97e4f32c669376e7d4c6251651b4b6304445=
69c9e65d9c030ce47965b616d28f9;subdir=3Dgit/node_modules/grunt-mkdir;striple=
vel=3D1 \
+    https://registry.npmjs.org/grunt-npm-command/-/grunt-npm-command-0.1.2=
.tgz;downloadfilename=3Dnpm2/grunt-npm-command-0.1.2.tgz;sha1sum=3D4168f836=
e2cf7b7f0bcc153933bacaf4f0903a58;subdir=3Dgit/node_modules/grunt-npm-comman=
d;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-sass/-/grunt-sass-3.1.0.tgz;downloadf=
ilename=3Dnpm2/grunt-sass-3.1.0.tgz;sha512sum=3Df74b36ec7ec5a020dc03c0bcf91=
d06c02fa7b580f7946e92fe3a9c6af5a6ddb9fd4622539927cebdf6c56b53d7c7835b056ba2=
19030b7d04e3fc9befa93e70e8;subdir=3Dgit/node_modules/grunt-sass;striplevel=
=3D1 \
+    https://registry.npmjs.org/grunt-simple-mocha/-/grunt-simple-mocha-0.4=
.1.tgz;downloadfilename=3Dnpm2/grunt-simple-mocha-0.4.1.tgz;sha1sum=3D57944=
9249eaf0a81878fa72f3edab5145d45fd77;subdir=3Dgit/node_modules/grunt-simple-=
mocha;striplevel=3D1 \
+    https://registry.npmjs.org/grunt-simple-nyc/-/grunt-simple-nyc-3.0.1.t=
gz;downloadfilename=3Dnpm2/grunt-simple-nyc-3.0.1.tgz;sha512sum=3Dfd82d8fa3=
348ea006e54edf1bb4ef3c2f0cdfa8ad30054b9d16d34c9bff69dcbdcd8f14ee2947ea14ed3=
ca21e17bc6ba3b72ae4031ecc82134884faba896a042;subdir=3Dgit/node_modules/grun=
t-simple-nyc;striplevel=3D1 \
+    https://registry.npmjs.org/grunt/-/grunt-1.4.1.tgz;downloadfilename=3D=
npm2/grunt-1.4.1.tgz;sha512sum=3D6572185d3b0056b03bb0cfa36718d076b04e020ec3=
c8c52994e3214dab293111317a2f9f0f4053c1d5979e7d16e525ea85bfd0fe7964cd77254a2=
dc81f9e4f20;subdir=3Dgit/node_modules/grunt;striplevel=3D1 \
+    https://registry.npmjs.org/gzip-size/-/gzip-size-3.0.0.tgz;downloadfil=
ename=3Dnpm2/gzip-size-3.0.0.tgz;sha1sum=3D546188e9bdc337f673772f81660464b3=
89dce520;subdir=3Dgit/node_modules/gzip-size;striplevel=3D1 \
+    https://registry.npmjs.org/handlebars/-/handlebars-4.7.7.tgz;downloadf=
ilename=3Dnpm2/handlebars-4.7.7.tgz;sha512sum=3D6807179b93807c4ffc21791c66f=
09ea4a5375735b5ff7f456f966ea8cb6023f853f17d9882832f058e5d2e1abf7293afc3b2e4=
d672bf505ef568b1bf66755844;subdir=3Dgit/node_modules/handlebars;striplevel=
=3D1 \
+    https://registry.npmjs.org/has-ansi/-/has-ansi-2.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-ansi-2.0.0.tgz;sha1sum=3D34f5049ce1ecdf2b0649af3ef24e45ed354=
16d91;subdir=3Dgit/node_modules/has-ansi;striplevel=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/@babel/highlight/node_modules/has-flag;stri=
plevel=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/args/node_modules/has-flag;striplevel=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/grunt-contrib-uglify/node_modules/has-flag;=
striplevel=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/istanbul-lib-report/node_modules/has-flag;s=
triplevel=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/nodemon/node_modules/has-flag;striplevel=3D=
1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-3.0.0.tgz;sha1sum=3Db5d454dc2199ae225699f3467e5a07f3b95=
5bafd;subdir=3Dgit/node_modules/simple-cli/node_modules/has-flag;striplevel=
=3D1 \
+    https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz;downloadfilen=
ame=3Dnpm2/has-flag-4.0.0.tgz;sha512sum=3D1329094ff4352a34d672da698080207d2=
3b4b4a56e6548e180caf5ee4a93ba6325e807efdc421295e53ba99533a170c54c01d30c2e0d=
3a81bf67153712f94c3d;subdir=3Dgit/node_modules/has-flag;striplevel=3D1 \
+    https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.2.tgz;downloa=
dfilename=3Dnpm2/has-symbols-1.0.2.tgz;sha512sum=3D7215daefdacbfd40b62a55f5=
ee3a37bd11b3d1acda584c79b46a99839a4edcd532109541d7b74caee425cc208e7d4bc4960=
84a726e75f78f81091be2d91bff1b;subdir=3Dgit/node_modules/has-symbols;striple=
vel=3D1 \
+    https://registry.npmjs.org/has-unicode/-/has-unicode-2.0.1.tgz;downloa=
dfilename=3Dnpm2/has-unicode-2.0.1.tgz;sha1sum=3De0e6fe6a28cf51138855e086d1=
691e771de2a8b9;subdir=3Dgit/node_modules/has-unicode;striplevel=3D1 \
+    https://registry.npmjs.org/has-yarn/-/has-yarn-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/has-yarn-2.1.0.tgz;sha512sum=3D52a051aa2e23bbb4fe4ea18d76a00ed0f=
692546b0318950142f93d79458d191635085183cd884b5a833b25011e9a796f55cbff60499c=
db0356f010b6e049d4b3;subdir=3Dgit/node_modules/has-yarn;striplevel=3D1 \
+    https://registry.npmjs.org/has/-/has-1.0.3.tgz;downloadfilename=3Dnpm2=
/has-1.0.3.tgz;sha512sum=3D7f676f3b4554e8e7a3ed1916246ade8636f33008c5a79fd5=
28fa79b53a56215e091c764ad7f0716c546d7ffb220364964ded3d71a0e656d618cd61086c1=
4b8cf;subdir=3Dgit/node_modules/has;striplevel=3D1 \
+    https://registry.npmjs.org/hash-sum/-/hash-sum-2.0.0.tgz;downloadfilen=
ame=3Dnpm2/hash-sum-2.0.0.tgz;sha512sum=3D59d6536c00720fea477e5fe0f504ac048=
230cbc213f84b0f88a0ecd0a357fb348785d0cb14a759bb40501e58ef3bed1023f05ab1b312=
51af3060d0994ef86c96;subdir=3Dgit/node_modules/hash-sum;striplevel=3D1 \
+    https://registry.npmjs.org/hasha/-/hasha-3.0.0.tgz;downloadfilename=3D=
npm2/hasha-3.0.0.tgz;sha1sum=3D52a32fab8569d41ca69a61ff1a214f8eb7c8bd39;sub=
dir=3Dgit/node_modules/hasha;striplevel=3D1 \
+    https://registry.npmjs.org/he/-/he-1.2.0.tgz;downloadfilename=3Dnpm2/h=
e-1.2.0.tgz;sha512sum=3D17fd439d418fa29391662d278be0afac28074391721001d12d2=
029b9858c9ab6d2c28376327ffb93e1a5dfc8099d1ef2c83664e962d7c221a877524e58d0ca=
1b;subdir=3Dgit/node_modules/he;striplevel=3D1 \
+    https://registry.npmjs.org/help-me/-/help-me-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/help-me-3.0.0.tgz;sha512sum=3D871ef78c2961ca4f75d2c89d041ec44659e1=
32516c249201a9254c143c0f37ca36bfd9e6a792a02ead57cf505fd5f08c319ea63eb5f5e7d=
886d152f2fdf3ccb5;subdir=3Dgit/node_modules/help-me;striplevel=3D1 \
+    https://registry.npmjs.org/homedir-polyfill/-/homedir-polyfill-1.0.3.t=
gz;downloadfilename=3Dnpm2/homedir-polyfill-1.0.3.tgz;sha512sum=3D7929a6584=
e5b6532b6368bb8834008df367daecc29ec644aa0a5d2d412d492f3ef88eaace184cdd5d8d0=
22aad7cbd939804b5d2cfcbce898d1c2c34cf6d9c370;subdir=3Dgit/node_modules/home=
dir-polyfill;striplevel=3D1 \
+    https://registry.npmjs.org/hooker/-/hooker-0.2.3.tgz;downloadfilename=
=3Dnpm2/hooker-0.2.3.tgz;sha1sum=3Db834f723cc4a242aa65963459df6d984c5d3d959=
;subdir=3Dgit/node_modules/hooker;striplevel=3D1 \
+    https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-2.8.9.tgz=
;downloadfilename=3Dnpm2/hosted-git-info-2.8.9.tgz;sha512sum=3D9b120301bf4b=
b26e83a0e27bc47fb9f97e32d4b53fe078b9d0bf42e6c22cc0adc9cd42d2e1bc24d45be3741=
82f611e1bcd3e2db944220b5e451367f91db2ef63;subdir=3Dgit/node_modules/hosted-=
git-info;striplevel=3D1 \
+    https://registry.npmjs.org/hpagent/-/hpagent-0.1.2.tgz;downloadfilenam=
e=3Dnpm2/hpagent-0.1.2.tgz;sha512sum=3D78fa855c7b524160055d89a3f89b4e4c7afc=
e2236b208e3f41194000f3c4fb3aa72b2e31268ec87b5638902ec0741f8bc4bc524d3cc1300=
4ac11ccb4abc632bd;subdir=3Dgit/node_modules/hpagent;striplevel=3D1 \
+    https://registry.npmjs.org/html-escaper/-/html-escaper-2.0.2.tgz;downl=
oadfilename=3Dnpm2/html-escaper-2.0.2.tgz;sha512sum=3D1f688cb5dd08e0cb79798=
89aa517480e3a7e5f37a55d0d2d144e094bb605c057af5d73263a9f66c8dad4bc28340fac2c=
f22aa444f05f28781bc228354a694b7e;subdir=3Dgit/node_modules/html-escaper;str=
iplevel=3D1 \
+    https://registry.npmjs.org/htmlparser2/-/htmlparser2-3.8.3.tgz;downloa=
dfilename=3Dnpm2/htmlparser2-3.8.3.tgz;sha1sum=3D996c28b191516a8be86501a7d7=
9757e5c70c1068;subdir=3Dgit/node_modules/jshint/node_modules/htmlparser2;st=
riplevel=3D1 \
+    https://registry.npmjs.org/htmlparser2/-/htmlparser2-6.1.0.tgz;downloa=
dfilename=3Dnpm2/htmlparser2-6.1.0.tgz;sha512sum=3D832c8f93aae0a272c51031a8=
79181035a114bdd27892d4e699487f876b7bb3e33ca0fa483f180d00259afba112479ee45ec=
b70a8f882badd15f0d469730814ec;subdir=3Dgit/node_modules/htmlparser2;striple=
vel=3D1 \
+    https://registry.npmjs.org/http-cache-semantics/-/http-cache-semantics=
-4.1.0.tgz;downloadfilename=3Dnpm2/http-cache-semantics-4.1.0.tgz;sha512sum=
=3D71aacf92571487b44e5912bb0afdbb44fb5d858854b1e95afee7b9fe32b38de815bd70ea=
33620b13d4360469fd259261d60f3b729e7ab2efc58104b37164bc71;subdir=3Dgit/node_=
modules/http-cache-semantics;striplevel=3D1 \
+    https://registry.npmjs.org/http-errors/-/http-errors-1.7.2.tgz;downloa=
dfilename=3Dnpm2/http-errors-1.7.2.tgz;sha512sum=3Db94401b771ff7122157dc87a=
8b512e3cdcbf62c4523940574d57d9fb247b6637b3dea8c1cfa8bdfa2e338cd6a8a9ca05548=
e25409e69960eb74ef19f4520c246;subdir=3Dgit/node_modules/http-errors;striple=
vel=3D1 \
+    https://registry.npmjs.org/http-errors/-/http-errors-1.7.3.tgz;downloa=
dfilename=3Dnpm2/http-errors-1.7.3.tgz;sha512sum=3D6534d7d0c5abb10d99021035=
71e8c0c032f2705b1dec8ee756d9e44f73a5d1aaa875a296fb4093643435b81bf9c21a6d0a7=
73c7bc1de45127146cd249a6fd07f;subdir=3Dgit/node_modules/raw-body/node_modul=
es/http-errors;striplevel=3D1 \
+    https://registry.npmjs.org/http-parser-js/-/http-parser-js-0.5.3.tgz;d=
ownloadfilename=3Dnpm2/http-parser-js-0.5.3.tgz;sha512sum=3Db7b863bde7ffe47=
10aed1593754cd552197cce412ef8b95a134218cdd32ebdb4838a9c414693a7e14870f19c84=
0846bcd3c8954fc5c28f3a3ac6662de0288b66;subdir=3Dgit/node_modules/http-parse=
r-js;striplevel=3D1 \
+    https://registry.npmjs.org/http2-wrapper/-/http2-wrapper-1.0.3.tgz;dow=
nloadfilename=3Dnpm2/http2-wrapper-1.0.3.tgz;sha512sum=3D57edb7b0332bd765a7=
cfb893703789af73ba008c659ef4ff6e66800003ff5dd6b7e42f74a7de7df69d05d5e1d1fcd=
d4a20b592a1654088e3058c105769748cc6;subdir=3Dgit/node_modules/http2-wrapper=
;striplevel=3D1 \
+    https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.0=
.tgz;downloadfilename=3Dnpm2/https-proxy-agent-5.0.0.tgz;sha512sum=3D124626=
e4170a50689dbb1cd2b77129a64a3e3e2356344a5ae324a4f6f4c2eb00ec4095bdac749af94=
846349a11629edbcfa1edd5e69121ae90689a8ee6b0856c;subdir=3Dgit/node_modules/h=
ttps-proxy-agent;striplevel=3D1 \
+    https://registry.npmjs.org/i18next-http-backend/-/i18next-http-backend=
-1.3.1.tgz;downloadfilename=3Dnpm2/i18next-http-backend-1.3.1.tgz;sha512sum=
=3Da3bf67e06041469976d210720be9defd2d54692678886027e7d1eed931191a337458b07b=
d8bed6accdfd0ac8738b2aecb29e8c41f748f308d3a14d90ea4a52bc;subdir=3Dgit/node_=
modules/i18next-http-backend;striplevel=3D1 \
+    https://registry.npmjs.org/i18next/-/i18next-21.3.1.tgz;downloadfilena=
me=3Dnpm2/i18next-21.3.1.tgz;sha512sum=3D54494c9be2e8784ba15625709c3c35811d=
ec9d322d2bd349aa0a24f0f679594f3bd0c54ed71fb92846f32ceffa182d73bb8d9473712e1=
a3de7b0630630dc13d0;subdir=3Dgit/node_modules/i18next;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz;download=
filename=3Dnpm2/iconv-lite-0.4.24.tgz;sha512sum=3Dbf73179d901cbe7cb09135046=
6898801cb657bb4575de79d391df5c3097b565ca85cee108bd6abbd27a73505a77b54dc4708=
422f51f02c8db56c4a9da63f3fac;subdir=3Dgit/node_modules/body-parser/node_mod=
ules/iconv-lite;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz;download=
filename=3Dnpm2/iconv-lite-0.4.24.tgz;sha512sum=3Dbf73179d901cbe7cb09135046=
6898801cb657bb4575de79d391df5c3097b565ca85cee108bd6abbd27a73505a77b54dc4708=
422f51f02c8db56c4a9da63f3fac;subdir=3Dgit/node_modules/grunt/node_modules/i=
conv-lite;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz;download=
filename=3Dnpm2/iconv-lite-0.4.24.tgz;sha512sum=3Dbf73179d901cbe7cb09135046=
6898801cb657bb4575de79d391df5c3097b565ca85cee108bd6abbd27a73505a77b54dc4708=
422f51f02c8db56c4a9da63f3fac;subdir=3Dgit/node_modules/raw-body/node_module=
s/iconv-lite;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz;downloadf=
ilename=3Dnpm2/iconv-lite-0.6.3.tgz;sha512sum=3De1f0a4efdc2c84c773329dab1f4=
eaa5ab244e22a25a8b842507f8e8ae22053ef91074fbde0d9432fcd5ab4eec65f9e6e50ab9e=
a34b711cdb6f13223a0fb59d33;subdir=3Dgit/node_modules/iconv-lite;striplevel=
=3D1 \
+    https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz;downloadfilenam=
e=3Dnpm2/ieee754-1.2.1.tgz;sha512sum=3D75ccaa843bd7d42e3a95765c56a0a92be16d=
31141574830debf0dfe63b36ce8b94b2a1bb23ab05c62b480beeca60adbd29d5ce2c776ef73=
2f8b059e85509ea68;subdir=3Dgit/node_modules/ieee754;striplevel=3D1 \
+    https://registry.npmjs.org/ignore-by-default/-/ignore-by-default-1.0.1=
.tgz;downloadfilename=3Dnpm2/ignore-by-default-1.0.1.tgz;sha1sum=3D48ca6d72=
f6c6a3af00a9ad4ae6876be3889e2b09;subdir=3Dgit/node_modules/ignore-by-defaul=
t;striplevel=3D1 \
+    https://registry.npmjs.org/import-lazy/-/import-lazy-2.1.0.tgz;downloa=
dfilename=3Dnpm2/import-lazy-2.1.0.tgz;sha1sum=3D05698e3d45c88e8d7e9d92cb05=
84e77f096f3e43;subdir=3Dgit/node_modules/import-lazy;striplevel=3D1 \
+    https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz;downloa=
dfilename=3Dnpm2/imurmurhash-0.1.4.tgz;sha1sum=3D9218b9b2b928a238b13dc4fb6b=
6d576f231453ea;subdir=3Dgit/node_modules/imurmurhash;striplevel=3D1 \
+    https://registry.npmjs.org/indent-string/-/indent-string-4.0.0.tgz;dow=
nloadfilename=3Dnpm2/indent-string-4.0.0.tgz;sha512sum=3D11d0c366ee00d8ec88=
2bb2ebff6cc6fb0e6399bba4d435419c4c11110bc1ceca412640846d16bc1b153596085871a=
1890a745689b8c35e5abbefd5f5ff2e71c2;subdir=3Dgit/node_modules/indent-string=
;striplevel=3D1 \
+    https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz;downloadfilen=
ame=3Dnpm2/inflight-1.0.6.tgz;sha1sum=3D49bd6331d7d02d0c09bc910a1075ba8165b=
56df9;subdir=3Dgit/node_modules/inflight;striplevel=3D1 \
+    https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz;downloadfilen=
ame=3Dnpm2/inherits-2.0.3.tgz;sha1sum=3D633c2c83e3da42a502f52466022480f4208=
261de;subdir=3Dgit/node_modules/http-errors/node_modules/inherits;stripleve=
l=3D1 \
+    https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz;downloadfilen=
ame=3Dnpm2/inherits-2.0.4.tgz;sha512sum=3D93fbc6697e3f6256b75b3c8c0af4d0397=
61e207bea38ab67a8176ecd31e9ce9419cc0b2428c859d8af849c189233dcc64a820578ca57=
2b16b8758799210a9ec1;subdir=3Dgit/node_modules/inherits;striplevel=3D1 \
+    https://registry.npmjs.org/ini/-/ini-1.3.8.tgz;downloadfilename=3Dnpm2=
/ini-1.3.8.tgz;sha512sum=3D255ff2ba0576bb35b988c4528990320ed41dfa7c6d5278de=
2edd1a70d770f7c90a2ebbee455c81f34b6c444384ef2bc65606a5859e913570a6107914281=
2b17b;subdir=3Dgit/node_modules/global-prefix/node_modules/ini;striplevel=
=3D1 \
+    https://registry.npmjs.org/ini/-/ini-1.3.8.tgz;downloadfilename=3Dnpm2=
/ini-1.3.8.tgz;sha512sum=3D255ff2ba0576bb35b988c4528990320ed41dfa7c6d5278de=
2edd1a70d770f7c90a2ebbee455c81f34b6c444384ef2bc65606a5859e913570a6107914281=
2b17b;subdir=3Dgit/node_modules/rc/node_modules/ini;striplevel=3D1 \
+    https://registry.npmjs.org/ini/-/ini-2.0.0.tgz;downloadfilename=3Dnpm2=
/ini-2.0.0.tgz;sha512sum=3Decf9c5e283770af645db7003840e7045a60442927cab2812=
91bb535d605e5d65e61154572bed484dc8875b01e1b23bf54e65b432069c22fea1122e695f9=
35074;subdir=3Dgit/node_modules/ini;striplevel=3D1 \
+    https://registry.npmjs.org/interpret/-/interpret-1.1.0.tgz;downloadfil=
ename=3Dnpm2/interpret-1.1.0.tgz;sha1sum=3D7ed1b1410c6a0e0f78cf95d3b8440c63=
f78b8614;subdir=3Dgit/node_modules/interpret;striplevel=3D1 \
+    https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz;downloadfil=
ename=3Dnpm2/ipaddr.js-1.9.1.tgz;sha512sum=3Dd0a23feb4ef1a31493a07ec68cdd45=
7d26cba14d3e6ed4e2723b1049642587f859ca437c2a998c7fbb98c0f5b747e6a467a47fc35=
f199574870585e26143cede;subdir=3Dgit/node_modules/ipaddr.js;striplevel=3D1 =
\
+    https://registry.npmjs.org/is-absolute/-/is-absolute-1.0.0.tgz;downloa=
dfilename=3Dnpm2/is-absolute-1.0.0.tgz;sha512sum=3D74e5a8a9f96f73274045adfa=
d06befd7c0d9fe046e1ca8b6354ff05395f5645cdd61f1f6f67922359b05de6a78389dc7e32=
a3d331f00fee006373a733cddf204;subdir=3Dgit/node_modules/is-absolute;striple=
vel=3D1 \
+    https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz;downloa=
dfilename=3Dnpm2/is-arrayish-0.2.1.tgz;sha1sum=3D77c99840527aa8ecb1a8ba697b=
80645a7a926a9d;subdir=3Dgit/node_modules/is-arrayish;striplevel=3D1 \
+    https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz;d=
ownloadfilename=3Dnpm2/is-binary-path-2.1.0.tgz;sha512sum=3D64c11161eb3aa43=
c9dcae1a276c7bb3ac1f1b5b23b595794128ce047f83baddd31522998365bd9444fcad8c819=
4e35b2ef6e487de94b79570433dee69ad4465f;subdir=3Dgit/node_modules/is-binary-=
path;striplevel=3D1 \
+    https://registry.npmjs.org/is-ci/-/is-ci-2.0.0.tgz;downloadfilename=3D=
npm2/is-ci-2.0.0.tgz;sha512sum=3D61f253eeb929401d2ea5db1d1cb196aef84125f71f=
ccd35ac180cd232417273d0856219fef93bc1013ca49dbf0dab17e2c60ac5f8159f2d72bddb=
d7d2dc66ae3;subdir=3Dgit/node_modules/is-ci;striplevel=3D1 \
+    https://registry.npmjs.org/is-core-module/-/is-core-module-2.8.0.tgz;d=
ownloadfilename=3Dnpm2/is-core-module-2.8.0.tgz;sha512sum=3Dbddd79a87b1aaab=
44beddb47e9036ecb49dd266443ad2f4700cd420224a27cd505bf8c756b408256c8f5f21275=
992871206e93da2d6c3bbf0c90fe7aaf49d847;subdir=3Dgit/node_modules/is-core-mo=
dule;striplevel=3D1 \
+    https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz;downloadf=
ilename=3Dnpm2/is-extglob-2.1.1.tgz;sha1sum=3Da88c02535791f02ed37c76a1b9ea9=
773c833f8c2;subdir=3Dgit/node_modules/is-extglob;striplevel=3D1 \
+    https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code=
-point-2.0.0.tgz;downloadfilename=3Dnpm2/is-fullwidth-code-point-2.0.0.tgz;=
sha1sum=3Da3b30a5c4f199183167aaab93beefae3ddfb654f;subdir=3Dgit/node_module=
s/nyc/node_modules/is-fullwidth-code-point;striplevel=3D1 \
+    https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code=
-point-3.0.0.tgz;downloadfilename=3Dnpm2/is-fullwidth-code-point-3.0.0.tgz;=
sha512sum=3Dcf29a6e7ebbeb02b125b20fda8d69e8d5dc316f84229c94a762cd868952e1c0=
f3744b8dbee74ae1a775d0871afd2193e298ec130096c59e2b851e83a115e9742;subdir=3D=
git/node_modules/is-fullwidth-code-point;striplevel=3D1 \
+    https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz;downloadfilenam=
e=3Dnpm2/is-glob-4.0.3.tgz;sha512sum=3Dc5e9526b21c7dfa66013b6568658bba56df8=
84d6cd97c3a3bf92959a4243e2105d0f7b61f137e4f6f61ab0b33e99758e6611648197f184b=
4a7af046be1e9524a;subdir=3Dgit/node_modules/is-glob;striplevel=3D1 \
+    https://registry.npmjs.org/is-installed-globally/-/is-installed-global=
ly-0.4.0.tgz;downloadfilename=3Dnpm2/is-installed-globally-0.4.0.tgz;sha512=
sum=3D8b01aa3b7276d5a692902ee35a71cffdd89f6b3c12ed215e22ac6feb012d2d4f18e4a=
9731538f2a9c4884f477cb38f9d0e12b2b6c93d3c96760644b9799c1045;subdir=3Dgit/no=
de_modules/is-installed-globally;striplevel=3D1 \
+    https://registry.npmjs.org/is-npm/-/is-npm-5.0.0.tgz;downloadfilename=
=3Dnpm2/is-npm-5.0.0.tgz;sha512sum=3D596feb40b39acd4abe493fdb080541a7fda830=
44562ec47b3ab2b2b74e7674d0e4e031dc0c4d3fed04972139668be541715d770df21bcac1b=
7b59266e517dd04;subdir=3Dgit/node_modules/is-npm;striplevel=3D1 \
+    https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz;downloadfil=
ename=3Dnpm2/is-number-7.0.0.tgz;sha512sum=3De350a27e483a7bc4f2952a5db53a5e=
2d532abd20445734edb47bc4443ef8d7ea6767c00dbf4d34e0c44be3740a3c394af5c1af369=
e8d6566540656c65d8c719e;subdir=3Dgit/node_modules/is-number;striplevel=3D1 =
\
+    https://registry.npmjs.org/is-obj/-/is-obj-2.0.0.tgz;downloadfilename=
=3Dnpm2/is-obj-2.0.0.tgz;sha512sum=3D76ba831b771b733c7110946839770e8ed769d4=
9fe5ca9d66367d316b39d1b3cfa6b8186041cae76eca68c795f97cec341e73276df0f3be710=
c12da83109128f3;subdir=3Dgit/node_modules/is-obj;striplevel=3D1 \
+    https://registry.npmjs.org/is-path-inside/-/is-path-inside-3.0.3.tgz;d=
ownloadfilename=3Dnpm2/is-path-inside-3.0.3.tgz;sha512sum=3D15de200016fec9c=
18098aa2ef1e31fb42ba94a2af9951c6a7f8683fef774703daa7381cbd3b3a309eb8732bf11=
a380a831a782283074fc40813955a34f052f3d;subdir=3Dgit/node_modules/is-path-in=
side;striplevel=3D1 \
+    https://registry.npmjs.org/is-plain-obj/-/is-plain-obj-2.1.0.tgz;downl=
oadfilename=3Dnpm2/is-plain-obj-2.1.0.tgz;sha512sum=3D6169dfc91c312fff92b2b=
5987cea54b73e5bdd80fe9f27e41ef8db71a9f393cce0c8ee00483ebbb95311b7c9396cce25=
2cc0e75dfae24613a97a6c3e35f4f578;subdir=3Dgit/node_modules/is-plain-obj;str=
iplevel=3D1 \
+    https://registry.npmjs.org/is-plain-object/-/is-plain-object-2.0.4.tgz=
;downloadfilename=3Dnpm2/is-plain-object-2.0.4.tgz;sha512sum=3D8793e9817916=
8ad737f0104c61ac1360c5891c564956706ab85139ef11698c1f29245885ea067e6d4f96c88=
ff2a9788547999d2ec81835a3def2e6a8e94bfd3a;subdir=3Dgit/node_modules/is-plai=
n-object;striplevel=3D1 \
+    https://registry.npmjs.org/is-relative/-/is-relative-1.0.0.tgz;downloa=
dfilename=3Dnpm2/is-relative-1.0.0.tgz;sha512sum=3D2b0fd178ad22ab029ebb4308=
4cb16e8f48db3c098488eb08c32217bef6df6ba41f98df69903d4cfbca5d93b465fdd4ca6c7=
df8fd704531b803e2230984b41b18;subdir=3Dgit/node_modules/is-relative;striple=
vel=3D1 \
+    https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz;downloadfil=
ename=3Dnpm2/is-stream-1.1.0.tgz;sha1sum=3D12d4a3dd4e68e0b79ceb8dbc84173ae8=
0d91ca44;subdir=3Dgit/node_modules/is-stream;striplevel=3D1 \
+    https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz;dow=
nloadfilename=3Dnpm2/is-typedarray-1.0.0.tgz;sha1sum=3De479c80858df0c1b11dd=
da6940f96011fcda4a9a;subdir=3Dgit/node_modules/is-typedarray;striplevel=3D1=
 \
+    https://registry.npmjs.org/is-unc-path/-/is-unc-path-1.0.0.tgz;downloa=
dfilename=3Dnpm2/is-unc-path-1.0.0.tgz;sha512sum=3D9ab1a955dd1fb3b5962df56c=
4adbe017a8842676e30c5661f7f7a68510dc1964ddb937cd1ddf421de5301f781822375bc28=
e0e9fa86e9e4cedc0e680c34ca595;subdir=3Dgit/node_modules/is-unc-path;striple=
vel=3D1 \
+    https://registry.npmjs.org/is-unicode-supported/-/is-unicode-supported=
-0.1.0.tgz;downloadfilename=3Dnpm2/is-unicode-supported-0.1.0.tgz;sha512sum=
=3D927c46daae140b7bbcb2d446c8054908e771166bf90d989171d94868041701b49f2726be=
3a1a29368b4b42bb2d061aaeaaee19a6e29b0dcffc4ba9a05e03c53f;subdir=3Dgit/node_=
modules/is-unicode-supported;striplevel=3D1 \
+    https://registry.npmjs.org/is-utf8/-/is-utf8-0.2.1.tgz;downloadfilenam=
e=3Dnpm2/is-utf8-0.2.1.tgz;sha1sum=3D4b0da1442104d1b336340e80797e865cf39f7d=
72;subdir=3Dgit/node_modules/is-utf8;striplevel=3D1 \
+    https://registry.npmjs.org/is-windows/-/is-windows-1.0.2.tgz;downloadf=
ilename=3Dnpm2/is-windows-1.0.2.tgz;sha512sum=3D7972b55089ead9b3e68f25fa7b7=
54723330ba1b73827de22e005a7f87a6adce5392a4ad10bde8e01c4773d127fa46bba9bc4d1=
9c11cff5d917415b13fc239520;subdir=3Dgit/node_modules/is-windows;striplevel=
=3D1 \
+    https://registry.npmjs.org/is-yarn-global/-/is-yarn-global-0.3.0.tgz;d=
ownloadfilename=3Dnpm2/is-yarn-global-0.3.0.tgz;sha512sum=3D56349e6ff9479a4=
a3277caf23d520abce0a7e03d64a0ca98fafab28e351f737c722ad3f87583b1338e2c66b9ea=
412cd276cdf1c8ead44cb4c2f4b5425602e783;subdir=3Dgit/node_modules/is-yarn-gl=
obal;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dgit/node_modules/busboy/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dgit/node_modules/dicer/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dgit/node_modules/jshint/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dgit/node_modules/nise/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/isarray=
;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz;downloadfilenam=
e=3Dnpm2/isarray-1.0.0.tgz;sha1sum=3Dbb935d48582cba168c06834957a54a3e07124f=
11;subdir=3Dgit/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz;downloadfilenam=
e=3Dnpm2/isarray-1.0.0.tgz;sha1sum=3Dbb935d48582cba168c06834957a54a3e07124f=
11;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/readabl=
e-stream/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz;downloadfilename=3D=
npm2/isexe-2.0.0.tgz;sha1sum=3De8fbf374dc556ff8947a10dcb0572d633f2cfa10;sub=
dir=3Dgit/node_modules/isexe;striplevel=3D1 \
+    https://registry.npmjs.org/isobject/-/isobject-3.0.1.tgz;downloadfilen=
ame=3Dnpm2/isobject-3.0.1.tgz;sha1sum=3D4e431e92b11a9731636aa1f9c8d1ccbcfda=
b78df;subdir=3Dgit/node_modules/isobject;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-lib-coverage/-/istanbul-lib-covera=
ge-2.0.5.tgz;downloadfilename=3Dnpm2/istanbul-lib-coverage-2.0.5.tgz;sha512=
sum=3Df1a5f39ee10f089bc69cc4917ede2e743443b5bd55de991090c308e4b23ee87b90cf9=
a10e09d94167d47f36ada037a89b7238b924c15a880814248e71ad9f998;subdir=3Dgit/no=
de_modules/istanbul-lib-coverage;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-lib-hook/-/istanbul-lib-hook-2.0.7=
.tgz;downloadfilename=3Dnpm2/istanbul-lib-hook-2.0.7.tgz;sha512sum=3Dbeb473=
b54f55451143c82f9a9257cba1e5f235d4df81ad84237b9d0c69f8719e9fa525e91cb57d5fa=
087bdfa0c08fb60820f33bc30e60b86fdc5fbb4cfafe594;subdir=3Dgit/node_modules/i=
stanbul-lib-hook;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-lib-instrument/-/istanbul-lib-inst=
rument-3.3.0.tgz;downloadfilename=3Dnpm2/istanbul-lib-instrument-3.3.0.tgz;=
sha512sum=3De679c8378be8e714191dd5e7a3f6035c9d06f88ddd026e178337d25533cb429=
8ffcc0576755e89bb2d3269fd74ff3ac9389787a0dddfada15ef9746ad9b15564;subdir=3D=
git/node_modules/istanbul-lib-instrument;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-lib-report/-/istanbul-lib-report-2=
.0.8.tgz;downloadfilename=3Dnpm2/istanbul-lib-report-2.0.8.tgz;sha512sum=3D=
7c705e1b9ef71088a18406e5c20c6b49e9e9d036f2ead24c151fc7be57ab06cac24c3e5b914=
ba836d9f7815876f59092f36e1c18604f9fb4a0edc364fb6c54b1;subdir=3Dgit/node_mod=
ules/istanbul-lib-report;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-lib-source-maps/-/istanbul-lib-sou=
rce-maps-3.0.6.tgz;downloadfilename=3Dnpm2/istanbul-lib-source-maps-3.0.6.t=
gz;sha512sum=3D478ecacccb43247e97e3f616f574f1fa3acb9d99ec716e15a4d37ed4f562=
4984de8cb54f5afee8a2ff83b9ff184123f255152fb9e42acf54dcb02ea6a286535f;subdir=
=3Dgit/node_modules/istanbul-lib-source-maps;striplevel=3D1 \
+    https://registry.npmjs.org/istanbul-reports/-/istanbul-reports-2.2.7.t=
gz;downloadfilename=3Dnpm2/istanbul-reports-2.2.7.tgz;sha512sum=3Dbaed45fcb=
d68e58e8bccf5525595cd3a80ff297a49b9ef5a78b45dd2c33db8c5df66fce8981d16c556a6=
59be6e7bc900daf5561265bb106f80e67ddfd64a872a;subdir=3Dgit/node_modules/ista=
nbul-reports;striplevel=3D1 \
+    https://registry.npmjs.org/jquery-i18next/-/jquery-i18next-1.2.1.tgz;d=
ownloadfilename=3Dnpm2/jquery-i18next-1.2.1.tgz;sha512sum=3D50d730deb831a0a=
8c6120e30db71449f68773a53c953bacfcec803b970c1664b48cde8956c9a21b3d0aff618fc=
a0ff0a35f05128ea04acbfce57183615a011e2;subdir=3Dgit/node_modules/jquery-i18=
next;striplevel=3D1 \
+    https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz;downloadfil=
ename=3Dnpm2/js-tokens-4.0.0.tgz;sha512sum=3D45d2547e5704ddc5332a232a420b02=
bb4e853eef5474824ed1b7986cf84737893a6a9809b627dca02b53f5b7313a9601b690f6902=
33a49bce0e026aeb16fcf29;subdir=3Dgit/node_modules/js-tokens;striplevel=3D1 =
\
+    https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.1.tgz;downloadfilena=
me=3Dnpm2/js-yaml-3.14.1.tgz;sha512sum=3Da24307ece5d727b62b37d3a4dff497ae7b=
b8897f723a4fb6e67a97e22992da7a6ebd36039a8fd0119a2ac199186880e4de356f04e4ce2=
0480485a2ceca7052f6;subdir=3Dgit/node_modules/js-yaml;striplevel=3D1 \
+    https://registry.npmjs.org/js-yaml/-/js-yaml-4.1.0.tgz;downloadfilenam=
e=3Dnpm2/js-yaml-4.1.0.tgz;sha512sum=3Dc29c59b3d368c596891122462194f20c4698=
a65d0529203e141f5a262c9e98a84cc24c5083ade1e13d4a2605061e94ea3c33517269982ee=
82b46326506d5af44;subdir=3Dgit/node_modules/mocha/node_modules/js-yaml;stri=
plevel=3D1 \
+    https://registry.npmjs.org/js2xmlparser/-/js2xmlparser-4.0.2.tgz;downl=
oadfilename=3Dnpm2/js2xmlparser-4.0.2.tgz;sha512sum=3Dea7e03f202e52dfd67e66=
34b40f45f562633bbd4404db9733c4b66d52b61317d4f8daa34afd608f67c3b6487d1c50304=
452f3b99cb30ae0fabfce62b3d15fa8c;subdir=3Dgit/node_modules/js2xmlparser;str=
iplevel=3D1 \
+    https://registry.npmjs.org/jsdoc-api/-/jsdoc-api-7.1.0.tgz;downloadfil=
ename=3Dnpm2/jsdoc-api-7.1.0.tgz;sha512sum=3Dca322265ae8b14e81dd1dc855bf47e=
dee9e75548616d4d42781862b208c13d11e46abf37ae4803b53311760428b52bedfa91a59a4=
9d9a9fc11e4042e321f7feb;subdir=3Dgit/node_modules/jsdoc-api;striplevel=3D1 =
\
+    https://registry.npmjs.org/jsdoc-parse/-/jsdoc-parse-6.0.1.tgz;downloa=
dfilename=3Dnpm2/jsdoc-parse-6.0.1.tgz;sha512sum=3D8a3dc0cf9cb6769f9a8ccc58=
9c4247ee48ca2b9bfafb26770a0fcab517684f5e69226eaa4e4fd6f2aef641d34b67d8d09bf=
536fe27c43455d74ce7bac48c4678;subdir=3Dgit/node_modules/jsdoc-parse;striple=
vel=3D1 \
+    https://registry.npmjs.org/jsdoc-to-markdown/-/jsdoc-to-markdown-7.1.0=
.tgz;downloadfilename=3Dnpm2/jsdoc-to-markdown-7.1.0.tgz;sha512sum=3D2c9022=
c2b51a3a93ea3a6965aa7555a9f05987a288feb1c77d2c0bec37ab4e98cb4161dfa67773fc9=
50d945e678188db2f868735feee2754ee5e5eb119fab9ae;subdir=3Dgit/node_modules/j=
sdoc-to-markdown;striplevel=3D1 \
+    https://registry.npmjs.org/jsdoc/-/jsdoc-3.6.7.tgz;downloadfilename=3D=
npm2/jsdoc-3.6.7.tgz;sha512sum=3Db312adee1d2fcc277edd8f35132daa8a7ba92fa0e9=
4526497254b4e2e8070cd9915171b3aa270c27a8b06b28520344b40f0c17df4739a33c94b61=
af540a17abb;subdir=3Dgit/node_modules/jsdoc;striplevel=3D1 \
+    https://registry.npmjs.org/jsesc/-/jsesc-2.5.2.tgz;downloadfilename=3D=
npm2/jsesc-2.5.2.tgz;sha512sum=3D398bbb5c4ce39024370b93ecdd0219b107cda6aa09=
c99640f7dc1df5a59dd39342b42e6958e91284ada690be875d047afc2cb695b35d3e5641a6e=
4075c4eb780;subdir=3Dgit/node_modules/jsesc;striplevel=3D1 \
+    https://registry.npmjs.org/jshint/-/jshint-2.13.1.tgz;downloadfilename=
=3Dnpm2/jshint-2.13.1.tgz;sha512sum=3Dbf29b37d1dcecac1793fbef8c7acd8bf46c3e=
04a47e8d591c69ab9e303bd980f51b98e3dc9bd6d78a4880a42f1d91cb1fa67f395554d35b4=
c1b6c46d83bf2dee;subdir=3Dgit/node_modules/jshint;striplevel=3D1 \
+    https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.0.tgz;downloa=
dfilename=3Dnpm2/json-buffer-3.0.0.tgz;sha1sum=3D5b1f397afc75d677bde8bcfc0e=
47e1f9a3d9a898;subdir=3Dgit/node_modules/package-json/node_modules/json-buf=
fer;striplevel=3D1 \
+    https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.1.tgz;downloa=
dfilename=3Dnpm2/json-buffer-3.0.1.tgz;sha512sum=3De1b57905f4769aa7d04c99be=
579b4f3dd7fe669ba1888bd3b8007983c91cad7399a534ff430c15456072c17d68cebea512e=
3dd6c7c70689966f46ea6236b1f49;subdir=3Dgit/node_modules/json-buffer;striple=
vel=3D1 \
+    https://registry.npmjs.org/json-parse-better-errors/-/json-parse-bette=
r-errors-1.0.2.tgz;downloadfilename=3Dnpm2/json-parse-better-errors-1.0.2.t=
gz;sha512sum=3D9abab264a7d7e4484bee1bea715e961b5c988e78deb980f30e185c00052b=
abc3e8f3934140124ff990d44fbe6a650f7c22452806a76413192e90e53b4ecdb0af;subdir=
=3Dgit/node_modules/json-parse-better-errors;striplevel=3D1 \
+    https://registry.npmjs.org/json-parse-even-better-errors/-/json-parse-=
even-better-errors-2.3.1.tgz;downloadfilename=3Dnpm2/json-parse-even-better=
-errors-2.3.1.tgz;sha512sum=3Dc72170ca1ae8fc91287fa1a17b68b3d8d717a23dac968=
36c5abfd7b044432bfa223c27da36197938d7e9fa341d01945043420958dcc7f7321917b962=
f75921db;subdir=3Dgit/node_modules/json-parse-even-better-errors;striplevel=
=3D1 \
+    https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse=
-0.4.1.tgz;downloadfilename=3Dnpm2/json-schema-traverse-0.4.1.tgz;sha512sum=
=3Dc5b6c21f9742614e53f0b704861ba1ec727cf075ee5b7aac237634cce64529f6441dca56=
88753f271ce4eb6f41aec69bfe63221d0b62f7030ffbce3944f7b756;subdir=3Dgit/node_=
modules/@prantlf/jsonlint/node_modules/json-schema-traverse;striplevel=3D1 =
\
+    https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse=
-1.0.0.tgz;downloadfilename=3Dnpm2/json-schema-traverse-1.0.0.tgz;sha512sum=
=3D34cf3f3fd9f75e35e12199f594b86415a0024ce5114178d6855e0103f4673aff31be0aad=
aa9017f483b89914314b1d51968e2dab37aa6f4b0e96bb9a3b2dddba;subdir=3Dgit/node_=
modules/json-schema-traverse;striplevel=3D1 \
+    https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5=
.0.1.tgz;downloadfilename=3Dnpm2/json-stringify-safe-5.0.1.tgz;sha1sum=3D12=
96a2d58fd45f19a0f6ce01d65701e2c735b6eb;subdir=3Dgit/node_modules/json-strin=
gify-safe;striplevel=3D1 \
+    https://registry.npmjs.org/jsonata/-/jsonata-1.8.5.tgz;downloadfilenam=
e=3Dnpm2/jsonata-1.8.5.tgz;sha512sum=3D8a50f24c1920eaa84da0d56bf0f50fcf3e46=
62f44af9110a38ce4c74e1b31f6cba578caf3d131e812bdb64ba5b4ed234400833d3d40cedd=
ac38521d4970a7da4;subdir=3Dgit/node_modules/jsonata;striplevel=3D1 \
+    https://registry.npmjs.org/jsonfile/-/jsonfile-6.1.0.tgz;downloadfilen=
ame=3Dnpm2/jsonfile-6.1.0.tgz;sha512sum=3De5d8277563ab8984a6e5c9d86893616a5=
2cd0ca3aa170c8307faebd44f59b067221af28fb3c476c5818269cb9fdf3e8ad58283cf5f36=
7ddf9f637727de932a5d;subdir=3Dgit/node_modules/jsonfile;striplevel=3D1 \
+    https://registry.npmjs.org/just-extend/-/just-extend-4.2.1.tgz;downloa=
dfilename=3Dnpm2/just-extend-4.2.1.tgz;sha512sum=3D837501efdeaf505218f74548=
bff597dcbd9cf024b631d594c30dc236b626ab36b5160d035117362bf3b862b9e49417506ab=
489ff2f099c960319cfb58ae9908e;subdir=3Dgit/node_modules/just-extend;striple=
vel=3D1 \
+    https://registry.npmjs.org/key-list/-/key-list-0.1.4.tgz;downloadfilen=
ame=3Dnpm2/key-list-0.1.4.tgz;sha512sum=3D0cc18b640984a0a4541cf95cefbd845b4=
8bdd8ffd6635dbfa1661cda94196f931518e4a36261740444176ce2e36e8bb5fbf3ea67e0a2=
bf07f28da5309b297809;subdir=3Dgit/node_modules/key-list;striplevel=3D1 \
+    https://registry.npmjs.org/keyv/-/keyv-3.1.0.tgz;downloadfilename=3Dnp=
m2/keyv-3.1.0.tgz;sha512sum=3Df72909ff8e9237ff4a3ccfec89c87343b3af5f218360a=
19368394a306080960d942bc291cb88dbd1df2c15cfb44edd186274e1abc5f645980283be11=
3f181c54;subdir=3Dgit/node_modules/package-json/node_modules/keyv;stripleve=
l=3D1 \
+    https://registry.npmjs.org/keyv/-/keyv-4.0.4.tgz;downloadfilename=3Dnp=
m2/keyv-4.0.4.tgz;sha512sum=3Dbea3476c073c041b3193eed00582d6d18db5f6b59c0a5=
b2947a5927a81d8286e669ec4a8387f812f5a56ab4d830c255dbefb949f2e6b901973311ce8=
a9cf8622;subdir=3Dgit/node_modules/keyv;striplevel=3D1 \
+    https://registry.npmjs.org/kind-of/-/kind-of-6.0.3.tgz;downloadfilenam=
e=3Dnpm2/kind-of-6.0.3.tgz;sha512sum=3D75c4b5ba5fbdb66783f794fec76f3f7a12e0=
77d98435adcbb2f0d3b739b7bf20443bb44fa6dbc00feb78e165576948d305172ba45785942=
f160abb94478e7a87;subdir=3Dgit/node_modules/kind-of;striplevel=3D1 \
+    https://registry.npmjs.org/klaw/-/klaw-3.0.0.tgz;downloadfilename=3Dnp=
m2/klaw-3.0.0.tgz;sha512sum=3Dd05a39a22afe3bd8e75eee4479f61b54afa61cc05e115=
132d9c99cb51d4ed4d10270290f46b7892ab4ba42dfe3dca0b60b5e3c0dfa3d8b7a4298232c=
76a1abd2;subdir=3Dgit/node_modules/klaw;striplevel=3D1 \
+    https://registry.npmjs.org/latest-version/-/latest-version-5.1.0.tgz;d=
ownloadfilename=3Dnpm2/latest-version-5.1.0.tgz;sha512sum=3Dc1e4feaf4913911=
41d09d60236d90cc165d04cc12cc0aac50649b872440e315861aa120c235513da1323fb58a2=
8088604999b98139ab45704da06520693635c4;subdir=3Dgit/node_modules/latest-ver=
sion;striplevel=3D1 \
+    https://registry.npmjs.org/lazystream/-/lazystream-1.0.1.tgz;downloadf=
ilename=3Dnpm2/lazystream-1.0.1.tgz;sha512sum=3D6fde0688d1d0372e89353aede70=
eb33727df32b3645d96f72939026496f6575c5a1060a4d3ddef919da3937b6969e3f7dff3a2=
5c2f96bcaf40c5479b9dfe676f;subdir=3Dgit/node_modules/lazystream;striplevel=
=3D1 \
+    https://registry.npmjs.org/leven/-/leven-2.1.0.tgz;downloadfilename=3D=
npm2/leven-2.1.0.tgz;sha1sum=3Dc2e7a9f772094dee9d34202ae8acce4687875580;sub=
dir=3Dgit/node_modules/leven;striplevel=3D1 \
+    https://registry.npmjs.org/liftup/-/liftup-3.0.1.tgz;downloadfilename=
=3Dnpm2/liftup-3.0.1.tgz;sha512sum=3Dc911da8900e2cd64b3a1793700f700ef578e23=
f52e84490d37d0e25b64ede389a16335f88e8168099971b12385ed1c9e2e57eacc52d02359e=
016ade080c3e13b;subdir=3Dgit/node_modules/liftup;striplevel=3D1 \
+    https://registry.npmjs.org/lines-and-columns/-/lines-and-columns-1.2.4=
.tgz;downloadfilename=3Dnpm2/lines-and-columns-1.2.4.tgz;sha512sum=3Def2972=
95eb1943f3d5dbd8e110397751f8e8e995fb802a89af917b3caaea73ddefedfcd2ca6b75069=
c0453c9c0517b3cab3cefaa16e384ae50660e8cb7f1e406;subdir=3Dgit/node_modules/l=
ines-and-columns;striplevel=3D1 \
+    https://registry.npmjs.org/linkify-it/-/linkify-it-2.2.0.tgz;downloadf=
ilename=3Dnpm2/linkify-it-2.2.0.tgz;sha512sum=3D1a7025fe49c69fe8b553fc23073=
dda933dacb73f87ac72ecc4cc07406a1f0837cfbe57fe80328de7c52d7e652ab93638fcc5de=
136c7b935f4a4267a8662f7823;subdir=3Dgit/node_modules/linkify-it;striplevel=
=3D1 \
+    https://registry.npmjs.org/livereload-js/-/livereload-js-2.4.0.tgz;dow=
nloadfilename=3Dnpm2/livereload-js-2.4.0.tgz;sha512sum=3D5cf407f19d860cffc7=
c33d8f083ae1da6b61e3215e8f0035399ffcd538b72e02b28437048ec4aca85599a231c6d2f=
6bf76e19df96ca8b18ede5cb0e83b2a9c3f;subdir=3Dgit/node_modules/livereload-js=
;striplevel=3D1 \
+    https://registry.npmjs.org/load-json-file/-/load-json-file-4.0.0.tgz;d=
ownloadfilename=3Dnpm2/load-json-file-4.0.0.tgz;sha1sum=3D2f5f45ab91e332162=
34fd53adab668eb4ec0993b;subdir=3Dgit/node_modules/load-json-file;striplevel=
=3D1 \
+    https://registry.npmjs.org/locate-path/-/locate-path-3.0.0.tgz;downloa=
dfilename=3Dnpm2/locate-path-3.0.0.tgz;sha512sum=3Dec03bbe3cc169c884da80b9a=
b72d995879101d148d7cf548b0f21fc043963b6d8099aa15ad66af94e70c4799f34cb358be9=
dfa5f6db4fe669a46cade7351bae4;subdir=3Dgit/node_modules/nyc/node_modules/lo=
cate-path;striplevel=3D1 \
+    https://registry.npmjs.org/locate-path/-/locate-path-3.0.0.tgz;downloa=
dfilename=3Dnpm2/locate-path-3.0.0.tgz;sha512sum=3Dec03bbe3cc169c884da80b9a=
b72d995879101d148d7cf548b0f21fc043963b6d8099aa15ad66af94e70c4799f34cb358be9=
dfa5f6db4fe669a46cade7351bae4;subdir=3Dgit/node_modules/pkg-dir/node_module=
s/locate-path;striplevel=3D1 \
+    https://registry.npmjs.org/locate-path/-/locate-path-3.0.0.tgz;downloa=
dfilename=3Dnpm2/locate-path-3.0.0.tgz;sha512sum=3Dec03bbe3cc169c884da80b9a=
b72d995879101d148d7cf548b0f21fc043963b6d8099aa15ad66af94e70c4799f34cb358be9=
dfa5f6db4fe669a46cade7351bae4;subdir=3Dgit/node_modules/test-exclude/node_m=
odules/locate-path;striplevel=3D1 \
+    https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz;downloa=
dfilename=3Dnpm2/locate-path-5.0.0.tgz;sha512sum=3Db7b870f6923e5afbb03495f0=
939cd51e9ca122ace0daa4e592524e7f4995c4649b7b7169d9589e65c76e3588da2c3a32ea9=
f6e1a94041961bced6a4c2a536af2;subdir=3Dgit/node_modules/read-pkg-up/node_mo=
dules/locate-path;striplevel=3D1 \
+    https://registry.npmjs.org/locate-path/-/locate-path-6.0.0.tgz;downloa=
dfilename=3Dnpm2/locate-path-6.0.0.tgz;sha512sum=3D88f64ae9e6236f146edee078=
fd667712c10830914ca80a28a65dd1fb3baad148dc026fcc3ba282c1e0e03df3f77a54f3b68=
28fdcab67547c539f63470520d553;subdir=3Dgit/node_modules/locate-path;striple=
vel=3D1 \
+    https://registry.npmjs.org/lodash.camelcase/-/lodash.camelcase-4.3.0.t=
gz;downloadfilename=3Dnpm2/lodash.camelcase-4.3.0.tgz;sha1sum=3Db28aa6288a2=
b9fc651035c7711f65ab6190331a6;subdir=3Dgit/node_modules/lodash.camelcase;st=
riplevel=3D1 \
+    https://registry.npmjs.org/lodash.clonedeep/-/lodash.clonedeep-4.5.0.t=
gz;downloadfilename=3Dnpm2/lodash.clonedeep-4.5.0.tgz;sha1sum=3De23f3f9c4f8=
fbdde872529c1071857a086e5ccef;subdir=3Dgit/node_modules/lodash.clonedeep;st=
riplevel=3D1 \
+    https://registry.npmjs.org/lodash.defaults/-/lodash.defaults-4.2.0.tgz=
;downloadfilename=3Dnpm2/lodash.defaults-4.2.0.tgz;sha1sum=3Dd09178716ffea4=
dde9e5fb7b37f6f0802274580c;subdir=3Dgit/node_modules/lodash.defaults;stripl=
evel=3D1 \
+    https://registry.npmjs.org/lodash.difference/-/lodash.difference-4.5.0=
.tgz;downloadfilename=3Dnpm2/lodash.difference-4.5.0.tgz;sha1sum=3D9ccb4e50=
5d486b91651345772885a2df27fd017c;subdir=3Dgit/node_modules/lodash.differenc=
e;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.flatten/-/lodash.flatten-4.4.0.tgz;d=
ownloadfilename=3Dnpm2/lodash.flatten-4.4.0.tgz;sha1sum=3Df31c22225a9632d2b=
bf8e4addbef240aa765a61f;subdir=3Dgit/node_modules/lodash.flatten;striplevel=
=3D1 \
+    https://registry.npmjs.org/lodash.flattendeep/-/lodash.flattendeep-4.4=
.0.tgz;downloadfilename=3Dnpm2/lodash.flattendeep-4.4.0.tgz;sha1sum=3Dfb030=
917f86a3134e5bc9bec0d69e0013ddfedb2;subdir=3Dgit/node_modules/lodash.flatte=
ndeep;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.get/-/lodash.get-4.4.2.tgz;downloadf=
ilename=3Dnpm2/lodash.get-4.4.2.tgz;sha1sum=3D2d177f652fa31e939b4438d534149=
9dfa3825e99;subdir=3Dgit/node_modules/lodash.get;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.isplainobject/-/lodash.isplainobject=
-4.0.6.tgz;downloadfilename=3Dnpm2/lodash.isplainobject-4.0.6.tgz;sha1sum=
=3D7c526a52d89b45c45cc690b88163be0497f550cb;subdir=3Dgit/node_modules/lodas=
h.isplainobject;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.omit/-/lodash.omit-4.5.0.tgz;downloa=
dfilename=3Dnpm2/lodash.omit-4.5.0.tgz;sha1sum=3D6eb19ae5a1ee1dd9df0b969e66=
ce0b7fa30b5e60;subdir=3Dgit/node_modules/lodash.omit;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.padend/-/lodash.padend-4.6.1.tgz;dow=
nloadfilename=3Dnpm2/lodash.padend-4.6.1.tgz;sha1sum=3D53ccba047d06e158d311=
f45da625f4e49e6f166e;subdir=3Dgit/node_modules/lodash.padend;striplevel=3D1=
 \
+    https://registry.npmjs.org/lodash.pick/-/lodash.pick-4.4.0.tgz;downloa=
dfilename=3Dnpm2/lodash.pick-4.4.0.tgz;sha1sum=3D52f05610fff9ded422611441ed=
1fc123a03001b3;subdir=3Dgit/node_modules/lodash.pick;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.union/-/lodash.union-4.6.0.tgz;downl=
oadfilename=3Dnpm2/lodash.union-4.6.0.tgz;sha1sum=3D48bb5088409f16f18216666=
41c44dd1aaae3cd88;subdir=3Dgit/node_modules/lodash.union;striplevel=3D1 \
+    https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz;downloadfilenam=
e=3Dnpm2/lodash-4.17.21.tgz;sha512sum=3Dbf690311ee7b95e713ba568322e3533f2dd=
1cb880b189e99d4edef13592b81764daec43e2c54c61d5c558dc5cfb35ecb85b65519e74026=
ff17675b6f8f916f4a;subdir=3Dgit/node_modules/lodash;striplevel=3D1 \
+    https://registry.npmjs.org/log-symbols/-/log-symbols-4.1.0.tgz;downloa=
dfilename=3Dnpm2/log-symbols-4.1.0.tgz;sha512sum=3Df173efa4003cbb285fb5ebbc=
a48bd0c69259ed2618769522bd9a46cbab05b01b8a458ffbad019abde75e07c68af99932aba=
ba930554bffd016eaf398cdf4722e;subdir=3Dgit/node_modules/log-symbols;striple=
vel=3D1 \
+    https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/lowercase-keys-1.0.1.tgz;sha512sum=3D1b62e3eb5b570e7=
54514e8bc55976cf92a108ed402ddd82890a7431b69939b5b71e26e743541c1399481c10407=
cb2d15d760342531b889c7d9407fb13f287c54;subdir=3Dgit/node_modules/package-js=
on/node_modules/got/node_modules/lowercase-keys;striplevel=3D1 \
+    https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/lowercase-keys-1.0.1.tgz;sha512sum=3D1b62e3eb5b570e7=
54514e8bc55976cf92a108ed402ddd82890a7431b69939b5b71e26e743541c1399481c10407=
cb2d15d760342531b889c7d9407fb13f287c54;subdir=3Dgit/node_modules/package-js=
on/node_modules/responselike/node_modules/lowercase-keys;striplevel=3D1 \
+    https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/lowercase-keys-2.0.0.tgz;sha512sum=3Db6a357ad2efca0c=
384ef734cc4ae0430b42c428c167fc8caa281fd83bc4f6af453ef4e91e9b91027a0d8d937bb=
42e91a66cba5c5adf4c10edb934a66e1788798;subdir=3Dgit/node_modules/lowercase-=
keys;striplevel=3D1 \
+    https://registry.npmjs.org/lru-cache/-/lru-cache-4.1.5.tgz;downloadfil=
ename=3Dnpm2/lru-cache-4.1.5.tgz;sha512sum=3Db166656c43f63ac1cd917acc979198=
93f8ca93bd0c06783a514e1823fa860d86e07fa61b3f812f9aa2126d70a826244ab3ed5b4a9=
147560431bc9d7b176962e6;subdir=3Dgit/node_modules/lru-cache;striplevel=3D1 =
\
+    https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz;downloadfil=
ename=3Dnpm2/lru-cache-6.0.0.tgz;sha512sum=3D268e9d274e029928eece7c09492de9=
51e5a677f1f47df4e59175e0c198be7aad540a6a90c0287e78bb183980b063df758b615a878=
875044302c78a938466ec88;subdir=3Dgit/node_modules/node-red-node-test-helper=
/node_modules/lru-cache;striplevel=3D1 \
+    https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz;downloadfil=
ename=3Dnpm2/lru-cache-6.0.0.tgz;sha512sum=3D268e9d274e029928eece7c09492de9=
51e5a677f1f47df4e59175e0c198be7aad540a6a90c0287e78bb183980b063df758b615a878=
875044302c78a938466ec88;subdir=3Dgit/node_modules/semver/node_modules/lru-c=
ache;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/caching-transform/node_modul=
es/make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/cp-file/node_modules/make-di=
r;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/find-cache-dir/node_modules/=
make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/istanbul-lib-report/node_mod=
ules/make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/istanbul-lib-source-maps/nod=
e_modules/make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-2.1.0.tgz;sha512sum=3D2d2f57f9d73c28bc5709bf1d9e2efd7cb=
208500e55c99a328d2302c1396e697034a36edc08ad1b857929830fac4d75693f2fe548ee7b=
8a5462c6a934bc39ad44;subdir=3Dgit/node_modules/nyc/node_modules/make-dir;st=
riplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-3.1.0.tgz;sha512sum=3D83715e3f6d0b3708402dbffa0b3e83778=
1769e0cded23cfbb5bceb0f6c0057ea3d15e3477b8acbfb22b699dd09fdf8927f5b1ad400e1=
5ea8b9fa857038cfde1b;subdir=3Dgit/node_modules/make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/make-iterator/-/make-iterator-1.0.1.tgz;dow=
nloadfilename=3Dnpm2/make-iterator-1.0.1.tgz;sha512sum=3Da718ae5e1d22544abb=
54ceca30886ce60c6c7f10aec76511a6d510697a38899649c410334cf38b13606e98ee5d6df=
558abf841245051fdad6614398ec790069b;subdir=3Dgit/node_modules/make-iterator=
;striplevel=3D1 \
+    https://registry.npmjs.org/map-cache/-/map-cache-0.2.2.tgz;downloadfil=
ename=3Dnpm2/map-cache-0.2.2.tgz;sha1sum=3Dc32abd0bd6525d9b051645bb4f26ac5d=
c98a0dbf;subdir=3Dgit/node_modules/map-cache;striplevel=3D1 \
+    https://registry.npmjs.org/markdown-it-anchor/-/markdown-it-anchor-5.3=
.0.tgz;downloadfilename=3Dnpm2/markdown-it-anchor-5.3.0.tgz;sha512sum=3Dfd5=
d4c9cb2ffae02778e4316a3ce1447e2be8c5d5cc4d1b56be2b0a9e5ea4c827e8ed03c696487=
ba2831f254f36ae8888c10dbc05dcd71640ca2d7740e6dfd8c;subdir=3Dgit/node_module=
s/markdown-it-anchor;striplevel=3D1 \
+    https://registry.npmjs.org/markdown-it/-/markdown-it-10.0.0.tgz;downlo=
adfilename=3Dnpm2/markdown-it-10.0.0.tgz;sha512sum=3D61638fd63ed46c3373f93b=
a660fd64a709cfd1a11aef5d5c263ac042bcddd145e56c97dce5a02ad05fcf6478e28a8a830=
b534a82f20c5fea3ef4193bcae33676;subdir=3Dgit/node_modules/markdown-it;strip=
level=3D1 \
+    https://registry.npmjs.org/marked/-/marked-2.1.3.tgz;downloadfilename=
=3Dnpm2/marked-2.1.3.tgz;sha512sum=3Dfd0fbb306cda113aa27ce31660403b1d531a65=
be176dc45f68ecdc4ac1d9122b61f3728696f6921b7deed122aef3d323e61f93f15da133ef0=
ee3941ce574e0c0;subdir=3Dgit/node_modules/dmd/node_modules/marked;stripleve=
l=3D1 \
+    https://registry.npmjs.org/marked/-/marked-2.1.3.tgz;downloadfilename=
=3Dnpm2/marked-2.1.3.tgz;sha512sum=3Dfd0fbb306cda113aa27ce31660403b1d531a65=
be176dc45f68ecdc4ac1d9122b61f3728696f6921b7deed122aef3d323e61f93f15da133ef0=
ee3941ce574e0c0;subdir=3Dgit/node_modules/jsdoc/node_modules/marked;striple=
vel=3D1 \
+    https://registry.npmjs.org/marked/-/marked-3.0.7.tgz;downloadfilename=
=3Dnpm2/marked-3.0.7.tgz;sha512sum=3D72d2aa6e72ee35bb076c8dba71f3323a52a05c=
67e5d68acebf502f5960d7ec09207cc3b0096be6b9873e9952de5a143d5ba85d5950729ceb3=
de9591cb1c2a8d1;subdir=3Dgit/node_modules/marked;striplevel=3D1 \
+    https://registry.npmjs.org/maxmin/-/maxmin-2.1.0.tgz;downloadfilename=
=3Dnpm2/maxmin-2.1.0.tgz;sha1sum=3D4d3b220903d95eee7eb7ac7fa864e72dc09a3166=
;subdir=3Dgit/node_modules/maxmin;striplevel=3D1 \
+    https://registry.npmjs.org/mdurl/-/mdurl-1.0.1.tgz;downloadfilename=3D=
npm2/mdurl-1.0.1.tgz;sha1sum=3Dfe85b2ec75a59037f2adfec100fd6c601761152e;sub=
dir=3Dgit/node_modules/mdurl;striplevel=3D1 \
+    https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz;downloa=
dfilename=3Dnpm2/media-typer-0.3.0.tgz;sha1sum=3D8710d7af0aa626f8fffa1ce001=
68545263255748;subdir=3Dgit/node_modules/type-is/node_modules/media-typer;s=
triplevel=3D1 \
+    https://registry.npmjs.org/media-typer/-/media-typer-1.1.0.tgz;downloa=
dfilename=3Dnpm2/media-typer-1.1.0.tgz;sha512sum=3D6a2b27ac33f818d7b4e9470a=
1675796df30d3c1530e23b0b19a5b059f9c7defd361a706e5d7d8c0959f945bad6a348f7a5c=
cd48a561b96aedf43b370dade572b;subdir=3Dgit/node_modules/media-typer;striple=
vel=3D1 \
+    https://registry.npmjs.org/memorystore/-/memorystore-1.6.6.tgz;downloa=
dfilename=3Dnpm2/memorystore-1.6.6.tgz;sha512sum=3D11b2e5d7183df839678d7919=
2bf78c5285b2859d48c5c58ca52b85caac80fd9e0136e1fb051f84d320b8d166cb659e86f0b=
c478946760cf86a57c0d1f3ef5441;subdir=3Dgit/node_modules/memorystore;striple=
vel=3D1 \
+    https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.1=
.tgz;downloadfilename=3Dnpm2/merge-descriptors-1.0.1.tgz;sha1sum=3Db00aaa55=
6dd8b44568150ec9d1b953f3f90cbb61;subdir=3Dgit/node_modules/merge-descriptor=
s;striplevel=3D1 \
+    https://registry.npmjs.org/merge-source-map/-/merge-source-map-1.1.0.t=
gz;downloadfilename=3Dnpm2/merge-source-map-1.1.0.tgz;sha512sum=3D424729ecf=
db2824b6930f87698241969fde384de83dd9fea5591d2756bd0fb611fe4781100f04ee7b03b=
efe10d9b408fc76fb509efcc60a8b7ca6a9d7eeaa26f;subdir=3Dgit/node_modules/merg=
e-source-map;striplevel=3D1 \
+    https://registry.npmjs.org/methods/-/methods-1.1.2.tgz;downloadfilenam=
e=3Dnpm2/methods-1.1.2.tgz;sha1sum=3D5529a4d67654134edcc5266656835b0f851afc=
ee;subdir=3Dgit/node_modules/methods;striplevel=3D1 \
+    https://registry.npmjs.org/micromatch/-/micromatch-4.0.4.tgz;downloadf=
ilename=3Dnpm2/micromatch-4.0.4.tgz;sha512sum=3Da519b3c3f5d47305c6a43f5a23d=
abfd173b02cdca08c44c9f32d1aa34c1daa9aebcc36b8627c4b733edf41166bf2fa21f15d74=
90684005b35c1d5939c07816c2;subdir=3Dgit/node_modules/micromatch;striplevel=
=3D1 \
+    https://registry.npmjs.org/mime-db/-/mime-db-1.51.0.tgz;downloadfilena=
me=3Dnpm2/mime-db-1.51.0.tgz;sha512sum=3De72f00e7a8e0ed7550c7699bbf596ee3d3=
51e1da24467859613b4bf8a19f69adbbbaae294935e4c10905265e29911332345cff12d6034=
a48a2107c7717b50dea;subdir=3Dgit/node_modules/mime-db;striplevel=3D1 \
+    https://registry.npmjs.org/mime-types/-/mime-types-2.1.34.tgz;download=
filename=3Dnpm2/mime-types-2.1.34.tgz;sha512sum=3De9c3faf765b0188b3d5d774e3=
b8fbe37eeea8eabf4aeac7156f2775473e1fd273d99565c40ff991a190a893bd631046bdad6=
c79093ff627ed8d27a5bdd906ce0;subdir=3Dgit/node_modules/mime-types;stripleve=
l=3D1 \
+    https://registry.npmjs.org/mime/-/mime-1.6.0.tgz;downloadfilename=3Dnp=
m2/mime-1.6.0.tgz;sha512sum=3Dc74567f2ca48fb0b89d4ee92ee09db69083c3f187834d=
1dbeca4883661162a23c4e1128ea65be28e7f8d92662699180febc99cef48f611b793151b2b=
b306907a;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/m=
ime;striplevel=3D1 \
+    https://registry.npmjs.org/mime/-/mime-1.6.0.tgz;downloadfilename=3Dnp=
m2/mime-1.6.0.tgz;sha512sum=3Dc74567f2ca48fb0b89d4ee92ee09db69083c3f187834d=
1dbeca4883661162a23c4e1128ea65be28e7f8d92662699180febc99cef48f611b793151b2b=
b306907a;subdir=3Dgit/node_modules/send/node_modules/mime;striplevel=3D1 \
+    https://registry.npmjs.org/mime/-/mime-2.5.2.tgz;downloadfilename=3Dnp=
m2/mime-2.5.2.tgz;sha512sum=3Db6a921e3b17329e08f0f63d488f07aa646cccec09ab23=
c407c2eb6fd66a9e6aad459c6feb056ac5d40b923781833988133cbff4299f850ad31fa3d22=
1f214f0e;subdir=3Dgit/node_modules/mime;striplevel=3D1 \
+    https://registry.npmjs.org/mimic-response/-/mimic-response-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/mimic-response-1.0.1.tgz;sha512sum=3D8f911cb67907eda=
99f57fab91e09a86a5d60d901c5251ada3ad9b1d09a48aa4c6106123f9494a5d67329438e61=
55aaf03444cea161229a7759e102b4447c6ec5;subdir=3Dgit/node_modules/mimic-resp=
onse;striplevel=3D1 \
+    https://registry.npmjs.org/mimic-response/-/mimic-response-3.1.0.tgz;d=
ownloadfilename=3Dnpm2/mimic-response-3.1.0.tgz;sha512sum=3Dcf4c9623ee050eb=
af0792f199ade048f91dd266932d79f8bd9ee96827dfe88ae5f5b36fa4f77e1345ab6f8c793=
45bd3ae1ce96af837fc2fd03cd04e33731cd19;subdir=3Dgit/node_modules/decompress=
-response/node_modules/mimic-response;striplevel=3D1 \
+    https://registry.npmjs.org/minami/-/minami-1.2.3.tgz;downloadfilename=
=3Dnpm2/minami-1.2.3.tgz;sha1sum=3D99b6dcdfb2f0a54da1c9c8f7aa3a327787aaf9f8=
;subdir=3Dgit/node_modules/minami;striplevel=3D1 \
+    https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz;downloadfil=
ename=3Dnpm2/minimatch-3.0.4.tgz;sha512sum=3Dc891d5404872a8f2d44e0b7d07cdcf=
5eee96debc7832fbc7bd252f4e8a20a70a060ce510fb20eb4741d1a2dfb23827423bbbb8857=
de959fb7a91604172a87450;subdir=3Dgit/node_modules/minimatch;striplevel=3D1 =
\
+    https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz;downloadfilen=
ame=3Dnpm2/minimist-1.2.5.tgz;sha512sum=3D14cf6735462b4410042d9413df179943b=
7e630e060ea758d989293720b0979a2ecb4ffd43835691acaf93a15e185783a7feaad27cba2=
67e3d4c640d67202172f;subdir=3Dgit/node_modules/minimist;striplevel=3D1 \
+    https://registry.npmjs.org/minipass/-/minipass-3.1.5.tgz;downloadfilen=
ame=3Dnpm2/minipass-3.1.5.tgz;sha512sum=3Dfbc373c43f365d0a0d28dae5d5dfc54a2=
f97f30004591fac6d801f22fb9be0dcf4776da99451bbd8211555ab9f57c3cd7f8a92b25153=
0fc54c3b13558470a34f;subdir=3Dgit/node_modules/minipass;striplevel=3D1 \
+    https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz;downloadfilen=
ame=3Dnpm2/minizlib-2.1.2.tgz;sha512sum=3D6c0c6c47c0557e3eb40d65c7137bb7d28=
1f37e5e06ee48644ae3d6faabe977b8c54479bb74bc4e8d493510700227f8712d8f29846274=
621607668ee38a5ed076;subdir=3Dgit/node_modules/minizlib;striplevel=3D1 \
+    https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz;downloadfilename=
=3Dnpm2/mkdirp-0.5.5.tgz;sha512sum=3D34a98094449fea3306ca6d7ef91d116bbc2f85=
5fb0156eb715a48e14fc116a1bde6b480c51c19485578083fd010b4c22bfd8a1e4d60f0755a=
7d54108d7f2fec5;subdir=3Dgit/node_modules/multer/node_modules/mkdirp;stripl=
evel=3D1 \
+    https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz;downloadfilename=
=3Dnpm2/mkdirp-0.5.5.tgz;sha512sum=3D34a98094449fea3306ca6d7ef91d116bbc2f85=
5fb0156eb715a48e14fc116a1bde6b480c51c19485578083fd010b4c22bfd8a1e4d60f0755a=
7d54108d7f2fec5;subdir=3Dgit/node_modules/spawn-wrap/node_modules/mkdirp;st=
riplevel=3D1 \
+    https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz;downloadfilename=
=3Dnpm2/mkdirp-1.0.4.tgz;sha512sum=3Dbd5a95650c9fdd62f1d9285dd2a27dc6ebea80=
0c8a3cb022a884c4b6a5b4a08523ce8dcf78f0dde9f5bd885cf7d1e7fb62ca7fa225aa6e1b3=
3786596d93e86cf;subdir=3Dgit/node_modules/mkdirp;striplevel=3D1 \
+    https://registry.npmjs.org/mkdirp2/-/mkdirp2-1.0.5.tgz;downloadfilenam=
e=3Dnpm2/mkdirp2-1.0.5.tgz;sha512sum=3Dc4e13dc5b202ae8503986d727b68786d9f16=
0627bd10698009a728f0af1cc7a46590926bc4622a8c6ab3b4023e34c85ec5705c7466d2133=
23a3771093debf167;subdir=3Dgit/node_modules/mkdirp2;striplevel=3D1 \
+    https://registry.npmjs.org/mocha/-/mocha-9.1.2.tgz;downloadfilename=3D=
npm2/mocha-9.1.2.tgz;sha512sum=3Db5adcbb49fbadd12013f4dd5063306b52a9b7ba716=
5d17a317d4b233d672962d42299259faf7c24e3de85b6e15ef002984c25da4e14ba0c237863=
2752d66ecd3;subdir=3Dgit/node_modules/mocha;striplevel=3D1 \
+    https://registry.npmjs.org/moment-timezone/-/moment-timezone-0.5.33.tg=
z;downloadfilename=3Dnpm2/moment-timezone-0.5.33.tgz;sha512sum=3D3d3736bdc4=
fc2bd279ffdac310f7b97334882a02e81ac1fc50da40e2a653570d1577f533d7d81e13d69b6=
c839029a01015c9d0defe58117adb49ce41a6c847fb;subdir=3Dgit/node_modules/momen=
t-timezone;striplevel=3D1 \
+    https://registry.npmjs.org/moment/-/moment-2.29.1.tgz;downloadfilename=
=3Dnpm2/moment-2.29.1.tgz;sha512sum=3D9079a8c9b70f57c4aacb9f43c0d0d8dc979fa=
fae252bf6f2fdd6b456215cb80e031f4bd083943a65ee558a6c647d03520be325b3f2b1e77b=
3b4e33f54611440d;subdir=3Dgit/node_modules/moment;striplevel=3D1 \
+    https://registry.npmjs.org/mqtt-packet/-/mqtt-packet-6.10.0.tgz;downlo=
adfilename=3Dnpm2/mqtt-packet-6.10.0.tgz;sha512sum=3D8daf3e9852881dd0754e99=
7abda73eb24b6acb7800f2df4c76ea26d4103be5c23e47d0079d93a2681430a468969da5492=
c319174d850985680a9deed90a48c18;subdir=3Dgit/node_modules/mqtt-packet;strip=
level=3D1 \
+    https://registry.npmjs.org/mqtt/-/mqtt-4.2.8.tgz;downloadfilename=3Dnp=
m2/mqtt-4.2.8.tgz;sha512sum=3D0c9623957383557b520de70df239cdce2e88b57dfeb9f=
1ac12cf4e077615db81ed911ae1ee4a71f0be4cd4bbb21742b36a21ad5abd8fcc370c18063a=
d0a18e48;subdir=3Dgit/node_modules/mqtt;striplevel=3D1 \
+    https://registry.npmjs.org/mri/-/mri-1.1.4.tgz;downloadfilename=3Dnpm2=
/mri-1.1.4.tgz;sha512sum=3Deb2ec88c63e6f00ce5be852bc006b0d6d2e7501b9d692dfb=
e76bdc77c26dae9186427fab5c87badcb1551e6fd8330b6a02e87e2c93c215d94b60f58cd67=
627eb;subdir=3Dgit/node_modules/mri;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.0.0.tgz;downloadfilename=3Dnpm2/m=
s-2.0.0.tgz;sha1sum=3D5608aeadfc00be6c2901df5f9861788de0d597c8;subdir=3Dgit=
/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.1.tgz;downloadfilename=3Dnpm2/m=
s-2.1.1.tgz;sha512sum=3Db60a7e765e5c1a4dbcbad624b41b2b16a03b1ca82b8603ec83a=
67f11f856238825d47c2af01fc6998ff4a1767a9c5f210d57ac4bf1699d8683fe439685842f=
ca;subdir=3Dgit/node_modules/send/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/@babel/traverse/node_modules/ms;striplevel=3D1=
 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/agent-base/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/https-proxy-agent/node_modules/ms;striplevel=
=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/istanbul-lib-source-maps/node_modules/ms;strip=
level=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/memorystore/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/mocha/node_modules/debug/node_modules/ms;strip=
level=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/mqtt-packet/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/mqtt/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/proxy/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dgit/node_modules/superagent/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.3.tgz;downloadfilename=3Dnpm2/m=
s-2.1.3.tgz;sha512sum=3De85973b9b4cb646dc9d9afcd542025784863ceae68c601f2682=
53dc985ef70bb2fa1568726afece715c8ebf5d73fab73ed1f7100eb479d23bfb57b45dd6453=
94;subdir=3Dgit/node_modules/mocha/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.3.tgz;downloadfilename=3Dnpm2/m=
s-2.1.3.tgz;sha512sum=3De85973b9b4cb646dc9d9afcd542025784863ceae68c601f2682=
53dc985ef70bb2fa1568726afece715c8ebf5d73fab73ed1f7100eb479d23bfb57b45dd6453=
94;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/ms;stri=
plevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.3.tgz;downloadfilename=3Dnpm2/m=
s-2.1.3.tgz;sha512sum=3De85973b9b4cb646dc9d9afcd542025784863ceae68c601f2682=
53dc985ef70bb2fa1568726afece715c8ebf5d73fab73ed1f7100eb479d23bfb57b45dd6453=
94;subdir=3Dgit/node_modules/nodemon/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.3.tgz;downloadfilename=3Dnpm2/m=
s-2.1.3.tgz;sha512sum=3De85973b9b4cb646dc9d9afcd542025784863ceae68c601f2682=
53dc985ef70bb2fa1568726afece715c8ebf5d73fab73ed1f7100eb479d23bfb57b45dd6453=
94;subdir=3Dgit/node_modules/tiny-lr/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/multer/-/multer-1.4.3.tgz;downloadfilename=
=3Dnpm2/multer-1.4.3.tgz;sha512sum=3D9e9d182ca9dcb99a13cee7db90ceb010aa7af0=
4856257714e9faba42aad2c247247762e532077552a85424b8fa352ff9b19f1d13c2d80d6b2=
5b25b49ce79d796;subdir=3Dgit/node_modules/multer;striplevel=3D1 \
+    https://registry.npmjs.org/mustache/-/mustache-4.2.0.tgz;downloadfilen=
ame=3Dnpm2/mustache-4.2.0.tgz;sha512sum=3Def58a9a52cb0ab961beffb5563219b901=
8206d4f07deee51cf9e9f1fad2318582bf2e1f0c6cf9a48a7aa9a5b885733349b4901ef1423=
292eaa3df7746f6668a9;subdir=3Dgit/node_modules/mustache;striplevel=3D1 \
+    https://registry.npmjs.org/mute-stream/-/mute-stream-0.0.8.tgz;downloa=
dfilename=3Dnpm2/mute-stream-0.0.8.tgz;sha512sum=3D9e76d658e9285b252c4e32ab=
8600f475ccf6da67644a7a58a9b123226da787086ec654a4a72c09981a3c87466a25d929ef7=
99bf744acb0790de2bb1168101f00;subdir=3Dgit/node_modules/mute-stream;striple=
vel=3D1 \
+    https://registry.npmjs.org/nanoid/-/nanoid-3.1.25.tgz;downloadfilename=
=3Dnpm2/nanoid-3.1.25.tgz;sha512sum=3Daddc2d21769708b14041b9dfa8346723a8da4=
47a7d7d3718063b45284f1e7b3719ecbb8b8e151a40635e3177f51e6468087df608bcfa5f05=
f44edc44392fc0dd;subdir=3Dgit/node_modules/nanoid;striplevel=3D1 \
+    https://registry.npmjs.org/negotiator/-/negotiator-0.6.2.tgz;downloadf=
ilename=3Dnpm2/negotiator-0.6.2.tgz;sha512sum=3D8595dcecad9ef8f81e23578305e=
ff5d00adde1e91b7ebaea1bc129fbc2667f82480f66cd83b36f08f39937e91f179ef8a45408=
ee6ba6d8052a0e27682aa7133b;subdir=3Dgit/node_modules/negotiator;striplevel=
=3D1 \
+    https://registry.npmjs.org/neo-async/-/neo-async-2.6.2.tgz;downloadfil=
ename=3Dnpm2/neo-async-2.6.2.tgz;sha512sum=3D61ddd4112e665824aa47ea8d4fddd2=
dd4a18524a8067d94b83c6bb83dae29ac5a66062bc7154e8038fec17746bb21772577b0018c=
5d5526a4c60ec3e74ba4ebb;subdir=3Dgit/node_modules/neo-async;striplevel=3D1 =
\
+    https://registry.npmjs.org/nested-error-stacks/-/nested-error-stacks-2=
.1.0.tgz;downloadfilename=3Dnpm2/nested-error-stacks-2.1.0.tgz;sha512sum=3D=
00ef35bec20ed64d6c33866b77a1eeeeb7a09893753528808dad7481ce1b5f7174c1dfbdad0=
99cb8741a1d5402608102f221579c4fa66af876dc63adef0060ba;subdir=3Dgit/node_mod=
ules/nested-error-stacks;striplevel=3D1 \
+    https://registry.npmjs.org/nise/-/nise-4.1.0.tgz;downloadfilename=3Dnp=
m2/nise-4.1.0.tgz;sha512sum=3D79030498637ff1aae9d31b2f1a843e075aaf4a447bdc1=
d675920a1ee73ade6778c0adc1c41561019dcd032170db1c92d4ec581e78c67952405cce00f=
243f275c;subdir=3Dgit/node_modules/node-red-node-test-helper/node_modules/n=
ise;striplevel=3D1 \
+    https://registry.npmjs.org/nise/-/nise-5.1.0.tgz;downloadfilename=3Dnp=
m2/nise-5.1.0.tgz;sha512sum=3D5b95a51eefb0be8dcf68a2ec2499203eea762ebb1709c=
9bb016c323599149e7e6bc0f92e3c18b7230939490b4dd26bfe2bae64ee728a8f0350df4c20=
df02c041;subdir=3Dgit/node_modules/nise;striplevel=3D1 \
+    https://registry.npmjs.org/node-addon-api/-/node-addon-api-3.2.1.tgz;d=
ownloadfilename=3Dnpm2/node-addon-api-3.2.1.tgz;sha512sum=3D9a671e8bd260855=
34363276085099e0d7f0aa009b4140898c88714b7f3789e1c808a9075ee99656500ce243d9f=
a2dc40067b7831dcfe74a4ceede7ed2e0e1dd0;subdir=3Dgit/node_modules/node-addon=
-api;striplevel=3D1 \
+    https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.1.tgz;downloadf=
ilename=3Dnpm2/node-fetch-2.6.1.tgz;sha512sum=3D57869883cf63128551c516f67c9=
74083c147bc8edc13261d54087de071f45082bca09c547e48e50d037d45b331f9b1233fbfa0=
80c885469ad2b62d37d8e8a9c7;subdir=3Dgit/node_modules/cross-fetch/node_modul=
es/node-fetch;striplevel=3D1 \
+    https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.6.tgz;downloadf=
ilename=3Dnpm2/node-fetch-2.6.6.tgz;sha512sum=3D67cffabd195350285274880c6b9=
d63c50e25af0fc9cb948e5b5d0e6da038eff44496c00dd9ce4f9fc6d38051969ff89bc335d3=
13cab0af5633c76f2fb1e71710;subdir=3Dgit/node_modules/node-fetch;striplevel=
=3D1 \
+    https://registry.npmjs.org/node-red-admin/-/node-red-admin-2.2.1.tgz;d=
ownloadfilename=3Dnpm2/node-red-admin-2.2.1.tgz;sha512sum=3Dc58a7a9996916c0=
58b47c9cee07455bed8586683c6068b4fbdeb401a1a38017a51256edf5f0dfc5f02b428f49f=
7ef2d28ace9cc5ab2426af676412e9dcf26d9e;subdir=3Dgit/node_modules/node-red-a=
dmin;striplevel=3D1 \
+    https://registry.npmjs.org/node-red-node-test-helper/-/node-red-node-t=
est-helper-0.2.7.tgz;downloadfilename=3Dnpm2/node-red-node-test-helper-0.2.=
7.tgz;sha512sum=3D39a9d243586bb2280756d3232ff72e86d8f1853751057c5ddc800b242=
f5e83458e1d117be5923b4588455aaa8eb2f43ef81c26363f248b54b8f43f1c67265358;sub=
dir=3Dgit/node_modules/node-red-node-test-helper;striplevel=3D1 \
+    https://registry.npmjs.org/nodemon/-/nodemon-2.0.13.tgz;downloadfilena=
me=3Dnpm2/nodemon-2.0.13.tgz;sha512sum=3D50c5cca6c66cbf551752db429fa82ff1e4=
0f867e83478056fadc672f720de481eaac2c1cad3ff25877cbdf952c0a51979274c7efdaf9c=
5bbbee89d73347b92c8;subdir=3Dgit/node_modules/nodemon;striplevel=3D1 \
+    https://registry.npmjs.org/nopt/-/nopt-1.0.10.tgz;downloadfilename=3Dn=
pm2/nopt-1.0.10.tgz;sha1sum=3D6ddd21bd2a31417b92727dd585f8a6f37608ebee;subd=
ir=3Dgit/node_modules/touch/node_modules/nopt;striplevel=3D1 \
+    https://registry.npmjs.org/nopt/-/nopt-3.0.6.tgz;downloadfilename=3Dnp=
m2/nopt-3.0.6.tgz;sha1sum=3Dc6465dbf08abcd4db359317f79ac68a646b28ff9;subdir=
=3Dgit/node_modules/grunt/node_modules/nopt;striplevel=3D1 \
+    https://registry.npmjs.org/nopt/-/nopt-4.0.3.tgz;downloadfilename=3Dnp=
m2/nopt-4.0.3.tgz;sha512sum=3D0af686c15333b523092ce7973eb7b3edfc9f39b759a8d=
50ad5c3c01332c7ad3c9b22e6bda4c76698f479630b5f35fb4838cbf70cf52115ac6c64c353=
40edb42a;subdir=3Dgit/node_modules/grunt-cli/node_modules/nopt;striplevel=
=3D1 \
+    https://registry.npmjs.org/nopt/-/nopt-5.0.0.tgz;downloadfilename=3Dnp=
m2/nopt-5.0.0.tgz;sha512sum=3D4db8faeeb7dfa9c79e2e97115eb4fbbca00df02c1f3de=
20180cec4ea206498a2d5edb10cc291a060b1afd2300252c10269afefbb13f42231289edeae=
99d320b5;subdir=3Dgit/node_modules/nopt;striplevel=3D1 \
+    https://registry.npmjs.org/normalize-package-data/-/normalize-package-=
data-2.5.0.tgz;downloadfilename=3Dnpm2/normalize-package-data-2.5.0.tgz;sha=
512sum=3Dff908c3774f44785d38f80dc19a7b1a3eae8652752156ff400e39344eae3c73086=
d70ad65c4b066d129ebe39482fe643138b19949af9103e185b4caa9a42be78;subdir=3Dgit=
/node_modules/normalize-package-data;striplevel=3D1 \
+    https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz;d=
ownloadfilename=3Dnpm2/normalize-path-3.0.0.tgz;sha512sum=3De9e66ce4bb375ad=
0a2b075a9f52d86532f1daa4a468b80554b3dc66aa884e9ecee6f4e75d844b3b57530501e82=
e8829b4246363e76ff983e166288c24707302c;subdir=3Dgit/node_modules/normalize-=
path;striplevel=3D1 \
+    https://registry.npmjs.org/normalize-url/-/normalize-url-4.5.1.tgz;dow=
nloadfilename=3Dnpm2/normalize-url-4.5.1.tgz;sha512sum=3Df546421511d074dadf=
4e91a0f3ed4834883ddc1eb3134697315164c35585c2f3b84a5672c14e9a2e0e4e7f4029fcf=
81c6d2c382cdc6f3165cc7ae8303025f400;subdir=3Dgit/node_modules/package-json/=
node_modules/normalize-url;striplevel=3D1 \
+    https://registry.npmjs.org/normalize-url/-/normalize-url-6.1.0.tgz;dow=
nloadfilename=3Dnpm2/normalize-url-6.1.0.tgz;sha512sum=3D0e52fe5f03b2dcdc40=
43cc6e0b4a243e02b8ea2b953402b4d5837b46e79806aa85786b018d5f5798203301d82dfba=
ebb6c297990f87d12a28a0f09da3c6d48ec;subdir=3Dgit/node_modules/normalize-url=
;striplevel=3D1 \
+    https://registry.npmjs.org/npmlog/-/npmlog-6.0.0.tgz;downloadfilename=
=3Dnpm2/npmlog-6.0.0.tgz;sha512sum=3Dd37a691511a5b3251a4056c60b60bc41624dfc=
2fcaecfb1fc83f5a41d8552804081f8b1005cf16012a8504fecef94b78776a28e4ba1ea1ba0=
1ddc19d0594a9e9;subdir=3Dgit/node_modules/npmlog;striplevel=3D1 \
+    https://registry.npmjs.org/nth-check/-/nth-check-2.0.1.tgz;downloadfil=
ename=3Dnpm2/nth-check-2.0.1.tgz;sha512sum=3D8add6f13de7317a7534fd941b186f1=
bea8744a8cb848fa307218f45011a3fd5e9c4cf9d75ed40e3d46e167a0a61b3003feb5b6d8b=
40ae84f7aa5c7495e4e00e3;subdir=3Dgit/node_modules/nth-check;striplevel=3D1 =
\
+    https://registry.npmjs.org/number-is-nan/-/number-is-nan-1.0.1.tgz;dow=
nloadfilename=3Dnpm2/number-is-nan-1.0.1.tgz;sha1sum=3D097b602b53422a522c1a=
fb8790318336941a011d;subdir=3Dgit/node_modules/number-is-nan;striplevel=3D1=
 \
+    https://registry.npmjs.org/nyc/-/nyc-14.1.1.tgz;downloadfilename=3Dnpm=
2/nyc-14.1.1.tgz;sha512sum=3D388d2f9ba646527a0666ffed2dd6767ac495cc3c140bcf=
1236cfba26848e315c40fa028c07c4e4ee307081e98bc783b8d25861bd9095c350be3982ce0=
4e3d75b;subdir=3Dgit/node_modules/nyc;striplevel=3D1 \
+    https://registry.npmjs.org/oauth2orize/-/oauth2orize-1.11.0.tgz;downlo=
adfilename=3Dnpm2/oauth2orize-1.11.0.tgz;sha1sum=3D793cef251d45ebdeac32ae40=
a8b6814faab1d483;subdir=3Dgit/node_modules/oauth2orize;striplevel=3D1 \
+    https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz;dow=
nloadfilename=3Dnpm2/object-assign-4.1.1.tgz;sha1sum=3D2109adc7965887cfc05c=
bbd442cac8bfbb360863;subdir=3Dgit/node_modules/object-assign;striplevel=3D1=
 \
+    https://registry.npmjs.org/object-get/-/object-get-2.1.1.tgz;downloadf=
ilename=3Dnpm2/object-get-2.1.1.tgz;sha512sum=3Dee7e08a4b33318670b10c8902ac=
351eef09ef8de44f4b39116bb4d515cb8b0eddd8fd6b71de7590b110bd93ed0b8b85c1cdd4d=
06e06c30e29a3ac01823d208be;subdir=3Dgit/node_modules/object-get;striplevel=
=3D1 \
+    https://registry.npmjs.org/object-inspect/-/object-inspect-1.11.0.tgz;=
downloadfilename=3Dnpm2/object-inspect-1.11.0.tgz;sha512sum=3D8e9ee2912e927=
771b141f6493f21f772371b245e8664f0a581d57e105ca08c52d0e45996fdd4549d377d3d0f=
64d0986834369b5856e9175c827525820ba81ec6;subdir=3Dgit/node_modules/object-i=
nspect;striplevel=3D1 \
+    https://registry.npmjs.org/object-to-spawn-args/-/object-to-spawn-args=
-2.0.1.tgz;downloadfilename=3Dnpm2/object-to-spawn-args-2.0.1.tgz;sha512sum=
=3De85b8a150dfd70e203f81319dd06a985c0bc638730e8b5c12f22203d4f8e848630be225a=
98f027fb89884daa6748142b7a307e34da7e14cb24843f02abe62cdf;subdir=3Dgit/node_=
modules/object-to-spawn-args;striplevel=3D1 \
+    https://registry.npmjs.org/object.defaults/-/object.defaults-1.1.0.tgz=
;downloadfilename=3Dnpm2/object.defaults-1.1.0.tgz;sha1sum=3D3a7f868334b407=
dea06da16d88d5cd29e435fecf;subdir=3Dgit/node_modules/object.defaults;stripl=
evel=3D1 \
+    https://registry.npmjs.org/object.map/-/object.map-1.0.1.tgz;downloadf=
ilename=3Dnpm2/object.map-1.0.1.tgz;sha1sum=3Dcf83e59dc8fcc0ad5f4250e1f78b3=
b81bd801d37;subdir=3Dgit/node_modules/object.map;striplevel=3D1 \
+    https://registry.npmjs.org/object.pick/-/object.pick-1.3.0.tgz;downloa=
dfilename=3Dnpm2/object.pick-1.3.0.tgz;sha1sum=3D87a10ac4c1694bd2e1cbf53591=
a66141fb5dd747;subdir=3Dgit/node_modules/object.pick;striplevel=3D1 \
+    https://registry.npmjs.org/on-finished/-/on-finished-2.3.0.tgz;downloa=
dfilename=3Dnpm2/on-finished-2.3.0.tgz;sha1sum=3D20f1336481b083cd75337992a1=
6971aa2d906947;subdir=3Dgit/node_modules/on-finished;striplevel=3D1 \
+    https://registry.npmjs.org/on-headers/-/on-headers-1.0.2.tgz;downloadf=
ilename=3Dnpm2/on-headers-1.0.2.tgz;sha512sum=3Da59004f8524ba32213cad76a2b4=
539b3e148a6337424fdcecc58bfbbc471f84579fd6f894d61971bcc45cdebc4ec08c17c3a87=
bfff2f2fca90b088479ea464ac;subdir=3Dgit/node_modules/on-headers;striplevel=
=3D1 \
+    https://registry.npmjs.org/once/-/once-1.4.0.tgz;downloadfilename=3Dnp=
m2/once-1.4.0.tgz;sha1sum=3D583b1aa775961d4b113ac17d9c50baef9dd76bd1;subdir=
=3Dgit/node_modules/once;striplevel=3D1 \
+    https://registry.npmjs.org/opted/-/opted-1.0.2.tgz;downloadfilename=3D=
npm2/opted-1.0.2.tgz;sha1sum=3D094e7ad9d0c0fc2bb384b4d8a507e278ead557c9;sub=
dir=3Dgit/node_modules/opted;striplevel=3D1 \
+    https://registry.npmjs.org/os-homedir/-/os-homedir-1.0.2.tgz;downloadf=
ilename=3Dnpm2/os-homedir-1.0.2.tgz;sha1sum=3Dffbc4988336e0e833de0c168c7ef1=
52121aa7fb3;subdir=3Dgit/node_modules/os-homedir;striplevel=3D1 \
+    https://registry.npmjs.org/os-tmpdir/-/os-tmpdir-1.0.2.tgz;downloadfil=
ename=3Dnpm2/os-tmpdir-1.0.2.tgz;sha1sum=3Dbbe67406c79aa85c5cfec766fe573455=
5dfa1274;subdir=3Dgit/node_modules/os-tmpdir;striplevel=3D1 \
+    https://registry.npmjs.org/osenv/-/osenv-0.1.5.tgz;downloadfilename=3D=
npm2/osenv-0.1.5.tgz;sha512sum=3Dd0259c08409d315736470dd4e70f598ea5fa81aeae=
6e4d710d52b1b4140f2bbc22b3fd05dabf53ea4e3274662179c97b614071055c612f9a22b0f=
b0dc403deda;subdir=3Dgit/node_modules/osenv;striplevel=3D1 \
+    https://registry.npmjs.org/p-cancelable/-/p-cancelable-1.1.0.tgz;downl=
oadfilename=3Dnpm2/p-cancelable-1.1.0.tgz;sha512sum=3Db3bdd7c4e678ce9b7579d=
658673be1a856babaf41cd6fc146b42b405db4866040c0098fd21b79b1fe26480a65cf61f81=
d393ca1cb3939786a31b506636b55997;subdir=3Dgit/node_modules/package-json/nod=
e_modules/p-cancelable;striplevel=3D1 \
+    https://registry.npmjs.org/p-cancelable/-/p-cancelable-2.1.1.tgz;downl=
oadfilename=3Dnpm2/p-cancelable-2.1.1.tgz;sha512sum=3D0593abde74501ce9ed523=
4eb1fcf8b879e2c98a1e81f2babf167b557c0d2315ae5e40da66a538ec2e2519ca4438d29e4=
a1e061e1ab7a0701276f923b265df5c2;subdir=3Dgit/node_modules/p-cancelable;str=
iplevel=3D1 \
+    https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz;downloadfilenam=
e=3Dnpm2/p-limit-2.3.0.tgz;sha512sum=3Dffff3c985592271f25c42cf07400014c92f6=
332581d76f9e218ecc0cbd92a8b98091e294f6ac51bd6b92c938e6dc5526a4110cb857dc900=
22a11a546503c5beb;subdir=3Dgit/node_modules/nyc/node_modules/p-limit;stripl=
evel=3D1 \
+    https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz;downloadfilenam=
e=3Dnpm2/p-limit-2.3.0.tgz;sha512sum=3Dffff3c985592271f25c42cf07400014c92f6=
332581d76f9e218ecc0cbd92a8b98091e294f6ac51bd6b92c938e6dc5526a4110cb857dc900=
22a11a546503c5beb;subdir=3Dgit/node_modules/pkg-dir/node_modules/p-limit;st=
riplevel=3D1 \
+    https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz;downloadfilenam=
e=3Dnpm2/p-limit-2.3.0.tgz;sha512sum=3Dffff3c985592271f25c42cf07400014c92f6=
332581d76f9e218ecc0cbd92a8b98091e294f6ac51bd6b92c938e6dc5526a4110cb857dc900=
22a11a546503c5beb;subdir=3Dgit/node_modules/read-pkg-up/node_modules/p-limi=
t;striplevel=3D1 \
+    https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz;downloadfilenam=
e=3Dnpm2/p-limit-2.3.0.tgz;sha512sum=3Dffff3c985592271f25c42cf07400014c92f6=
332581d76f9e218ecc0cbd92a8b98091e294f6ac51bd6b92c938e6dc5526a4110cb857dc900=
22a11a546503c5beb;subdir=3Dgit/node_modules/test-exclude/node_modules/p-lim=
it;striplevel=3D1 \
+    https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz;downloadfilenam=
e=3Dnpm2/p-limit-3.1.0.tgz;sha512sum=3D4d839a9ccdf01b0346b193767154d83c0af0=
e39e319d78f9aa6585d5b12801ce3e714fe897b19587ba1d7af8e9d4534776e1dcdca64c705=
76ec54e5773ab8945;subdir=3Dgit/node_modules/p-limit;striplevel=3D1 \
+    https://registry.npmjs.org/p-locate/-/p-locate-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/p-locate-3.0.0.tgz;sha512sum=3Dc7ed76c3f4e8fb81857e0261044a620dc=
2e8cd12467a063e122effcf4b522e4326c4664dc9b54c49f5a3f5a267f19e4573b74150d24e=
39580fbf61fb230ba549;subdir=3Dgit/node_modules/nyc/node_modules/p-locate;st=
riplevel=3D1 \
+    https://registry.npmjs.org/p-locate/-/p-locate-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/p-locate-3.0.0.tgz;sha512sum=3Dc7ed76c3f4e8fb81857e0261044a620dc=
2e8cd12467a063e122effcf4b522e4326c4664dc9b54c49f5a3f5a267f19e4573b74150d24e=
39580fbf61fb230ba549;subdir=3Dgit/node_modules/pkg-dir/node_modules/p-locat=
e;striplevel=3D1 \
+    https://registry.npmjs.org/p-locate/-/p-locate-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/p-locate-3.0.0.tgz;sha512sum=3Dc7ed76c3f4e8fb81857e0261044a620dc=
2e8cd12467a063e122effcf4b522e4326c4664dc9b54c49f5a3f5a267f19e4573b74150d24e=
39580fbf61fb230ba549;subdir=3Dgit/node_modules/test-exclude/node_modules/p-=
locate;striplevel=3D1 \
+    https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz;downloadfilen=
ame=3Dnpm2/p-locate-4.1.0.tgz;sha512sum=3D47bf5967fd30031286bb7a18325cfc8f2=
fe46e1b0dad2ed2299ecfc441c1809e7e1769ad156d9f2b670eb4187570762442c6f3155ec8=
f84a1129ee98b74a0aec;subdir=3Dgit/node_modules/read-pkg-up/node_modules/p-l=
ocate;striplevel=3D1 \
+    https://registry.npmjs.org/p-locate/-/p-locate-5.0.0.tgz;downloadfilen=
ame=3Dnpm2/p-locate-5.0.0.tgz;sha512sum=3D2da363b51594058fbecc1e6713f37071a=
a0cca548f93e4be647341d53cdd6cc24c9f2e9dca7a401aded7fed97f418ab74c8784ea7c47=
a696e8d8b1b29ab1b93f;subdir=3Dgit/node_modules/p-locate;striplevel=3D1 \
+    https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz;downloadfilename=3D=
npm2/p-try-2.2.0.tgz;sha512sum=3D4789cf0154c053407d0f7e7f1a4dee25fffb5d86d0=
732a2148a76f03121148d821165e1eef5855a069c1350cfd716697c4ed88d742930bede331d=
befa0ac3a75;subdir=3Dgit/node_modules/p-try;striplevel=3D1 \
+    https://registry.npmjs.org/package-hash/-/package-hash-3.0.0.tgz;downl=
oadfilename=3Dnpm2/package-hash-3.0.0.tgz;sha512sum=3D94eb66ba430356fb642fc=
e2b24723b7694d8abed2b962f0ddb0967a94701b835827d585151f3a69d1f52b281c530ba40=
0af115eb4757eeb774ac56980d923e14;subdir=3Dgit/node_modules/package-hash;str=
iplevel=3D1 \
+    https://registry.npmjs.org/package-json/-/package-json-6.5.0.tgz;downl=
oadfilename=3Dnpm2/package-json-6.5.0.tgz;sha512sum=3D9376dd9b69f6e6d932c5c=
8d22b3079c7c91f57194c760b1b3ebd069197301ec2e96dae9c063a82b752a570284a12fc47=
21c4c1d4554cbb0a228d9dbac5ec7931;subdir=3Dgit/node_modules/package-json;str=
iplevel=3D1 \
+    https://registry.npmjs.org/pad-stream/-/pad-stream-2.0.0.tgz;downloadf=
ilename=3Dnpm2/pad-stream-2.0.0.tgz;sha1sum=3D3bebf34cda49597212a669f2fe417=
d646a7cba56;subdir=3Dgit/node_modules/pad-stream;striplevel=3D1 \
+    https://registry.npmjs.org/parse-filepath/-/parse-filepath-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/parse-filepath-1.0.2.tgz;sha1sum=3Da632127f53aaf3d15=
876f5872f3ffac763d6c891;subdir=3Dgit/node_modules/parse-filepath;striplevel=
=3D1 \
+    https://registry.npmjs.org/parse-json/-/parse-json-4.0.0.tgz;downloadf=
ilename=3Dnpm2/parse-json-4.0.0.tgz;sha1sum=3Dbe35f5425be1f7f6c747184f98a78=
8cb99477ee0;subdir=3Dgit/node_modules/load-json-file/node_modules/parse-jso=
n;striplevel=3D1 \
+    https://registry.npmjs.org/parse-json/-/parse-json-5.2.0.tgz;downloadf=
ilename=3Dnpm2/parse-json-5.2.0.tgz;sha512sum=3D6b208abe6fe98421b13a4611482=
33cda20f072df3f1289d2120092c56c43eef7ba8c7820b059787d955004f44d810a0a8ae57f=
a1d845ac6cd05d9c1b89f0bc46;subdir=3Dgit/node_modules/parse-json;striplevel=
=3D1 \
+    https://registry.npmjs.org/parse-passwd/-/parse-passwd-1.0.0.tgz;downl=
oadfilename=3Dnpm2/parse-passwd-1.0.0.tgz;sha1sum=3D6d5b934a456993b23d37f40=
a382d6f1666a8e5c6;subdir=3Dgit/node_modules/parse-passwd;striplevel=3D1 \
+    https://registry.npmjs.org/parse5-htmlparser2-tree-adapter/-/parse5-ht=
mlparser2-tree-adapter-6.0.1.tgz;downloadfilename=3Dnpm2/parse5-htmlparser2=
-tree-adapter-6.0.1.tgz;sha512sum=3Da8fb96bdb2e0bc31a294a73906889c468be54f8=
32d613e897c9c8138c0ec2a8893f868ae3f9ab2acf0a747d1dc3c40882499998798d19ddc8d=
4e19e185bfef94;subdir=3Dgit/node_modules/parse5-htmlparser2-tree-adapter;st=
riplevel=3D1 \
+    https://registry.npmjs.org/parse5/-/parse5-6.0.1.tgz;downloadfilename=
=3Dnpm2/parse5-6.0.1.tgz;sha512sum=3D39f9ff0931734464d3c70a4d12cf4f3fdde05d=
2847713ab6e799f345848a7bc024569658eded5fa664df3b2a08be33f91c6ed9d9933b552f4=
f3e14065b6a4ea7;subdir=3Dgit/node_modules/parse5;striplevel=3D1 \
+    https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz;downloadfilen=
ame=3Dnpm2/parseurl-1.3.3.tgz;sha512sum=3D0a2c9e3b1153fc96723799b4cfd3df5f0=
e1208127a4b2833d43a65d30aa39610c418604fd469ec51510bd29eb78681b57dc8f77c7ca7=
5e2f4d60ee2758e2fea9;subdir=3Dgit/node_modules/parseurl;striplevel=3D1 \
+    https://registry.npmjs.org/passport-http-bearer/-/passport-http-bearer=
-1.0.1.tgz;downloadfilename=3Dnpm2/passport-http-bearer-1.0.1.tgz;sha1sum=
=3D147469ea3669e2a84c6167ef99dbb77e1f0098a8;subdir=3Dgit/node_modules/passp=
ort-http-bearer;striplevel=3D1 \
+    https://registry.npmjs.org/passport-oauth2-client-password/-/passport-=
oauth2-client-password-0.1.2.tgz;downloadfilename=3Dnpm2/passport-oauth2-cl=
ient-password-0.1.2.tgz;sha1sum=3D4f378b678b92d16dbbd233a6c706520093e561ba;=
subdir=3Dgit/node_modules/passport-oauth2-client-password;striplevel=3D1 \
+    https://registry.npmjs.org/passport-strategy/-/passport-strategy-1.0.0=
.tgz;downloadfilename=3Dnpm2/passport-strategy-1.0.0.tgz;sha1sum=3Db5539aa8=
fc225a3d1ad179476ddf236b440f52e4;subdir=3Dgit/node_modules/passport-strateg=
y;striplevel=3D1 \
+    https://registry.npmjs.org/passport/-/passport-0.5.0.tgz;downloadfilen=
ame=3Dnpm2/passport-0.5.0.tgz;sha512sum=3D967fae7b961a3434be7deb3a3b93c2cd7=
292b1e639bbc318857f47e42a38b3e1df608e68aaf9c72a838e44b60350f87ef2d1efaf1ba0=
1761857140354351aa7e;subdir=3Dgit/node_modules/passport;striplevel=3D1 \
+    https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz;downloa=
dfilename=3Dnpm2/path-exists-3.0.0.tgz;sha1sum=3Dce0ebeaa5f78cb18925ea7d810=
d7b59b010fd515;subdir=3Dgit/node_modules/nyc/node_modules/path-exists;strip=
level=3D1 \
+    https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz;downloa=
dfilename=3Dnpm2/path-exists-3.0.0.tgz;sha1sum=3Dce0ebeaa5f78cb18925ea7d810=
d7b59b010fd515;subdir=3Dgit/node_modules/pkg-dir/node_modules/path-exists;s=
triplevel=3D1 \
+    https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz;downloa=
dfilename=3Dnpm2/path-exists-3.0.0.tgz;sha1sum=3Dce0ebeaa5f78cb18925ea7d810=
d7b59b010fd515;subdir=3Dgit/node_modules/test-exclude/node_modules/path-exi=
sts;striplevel=3D1 \
+    https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz;downloa=
dfilename=3Dnpm2/path-exists-4.0.0.tgz;sha512sum=3D6a4f50cb943b8d86f65b071e=
cb9169be0d8aa0073f64884b48b392066466ca03ec1b091556dd1f65ad2aaed333fa6ead253=
0077d943c167981e0c1b82d6cbbff;subdir=3Dgit/node_modules/path-exists;striple=
vel=3D1 \
+    https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.t=
gz;downloadfilename=3Dnpm2/path-is-absolute-1.0.1.tgz;sha1sum=3D174b9268735=
534ffbc7ace6bf53a5a9e1b5c5f5f;subdir=3Dgit/node_modules/path-is-absolute;st=
riplevel=3D1 \
+    https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz;downloadfilen=
ame=3Dnpm2/path-key-3.1.1.tgz;sha512sum=3Da2399e374a9dfb2d23b3312da18e3caf4=
3deab97703049089423aee90e5fe3595f92cc17b8ab58ae18284e92e7c887079b6e1486ac7e=
e53aa6d889d2c0b844e9;subdir=3Dgit/node_modules/path-key;striplevel=3D1 \
+    https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz;downloadf=
ilename=3Dnpm2/path-parse-1.0.7.tgz;sha512sum=3D2c32733d510410f47ecb8f33f77=
03411dd325dbf29001c865a8fe4e5861d620a58dbfd84b0eb24b09aeaee5387c6bcab54e9f5=
7a31baa00a7c6a1bce2100fcb3;subdir=3Dgit/node_modules/path-parse;striplevel=
=3D1 \
+    https://registry.npmjs.org/path-root-regex/-/path-root-regex-0.1.2.tgz=
;downloadfilename=3Dnpm2/path-root-regex-0.1.2.tgz;sha1sum=3Dbfccdc8df5b12d=
c52c8b43ec38d18d72c04ba96d;subdir=3Dgit/node_modules/path-root-regex;stripl=
evel=3D1 \
+    https://registry.npmjs.org/path-root/-/path-root-0.1.1.tgz;downloadfil=
ename=3Dnpm2/path-root-0.1.1.tgz;sha1sum=3D9a4a6814cac1c0cd73360a95f32083c8=
ea4745b7;subdir=3Dgit/node_modules/path-root;striplevel=3D1 \
+    https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz;d=
ownloadfilename=3Dnpm2/path-to-regexp-0.1.7.tgz;sha1sum=3Ddf604178005f522f1=
5eb4490e7247a1bfaa67f8c;subdir=3Dgit/node_modules/path-to-regexp;striplevel=
=3D1 \
+    https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-1.8.0.tgz;d=
ownloadfilename=3Dnpm2/path-to-regexp-1.8.0.tgz;sha512sum=3D9f8dc9461954294=
02589b10984f7a2af59dc5080f5e909c48cda70ccd74edcb9b8cb0ac1a41679a0b0f423a6eb=
f5ebebd58f494eac11b4087b24ba0ecc041d54;subdir=3Dgit/node_modules/nise/node_=
modules/path-to-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-1.8.0.tgz;d=
ownloadfilename=3Dnpm2/path-to-regexp-1.8.0.tgz;sha512sum=3D9f8dc9461954294=
02589b10984f7a2af59dc5080f5e909c48cda70ccd74edcb9b8cb0ac1a41679a0b0f423a6eb=
f5ebebd58f494eac11b4087b24ba0ecc041d54;subdir=3Dgit/node_modules/node-red-n=
ode-test-helper/node_modules/path-to-regexp;striplevel=3D1 \
+    https://registry.npmjs.org/path-type/-/path-type-3.0.0.tgz;downloadfil=
ename=3Dnpm2/path-type-3.0.0.tgz;sha512sum=3D4f6654b1d6451e0037bb87b93df3db=
8ddec70c3a713e741be633744ab0ec8cd4ae5571c9aadc139d6a86d01d6366b82627fee58f5=
1265480725add60c46916be;subdir=3Dgit/node_modules/path-type;striplevel=3D1 =
\
+    https://registry.npmjs.org/pause/-/pause-0.0.1.tgz;downloadfilename=3D=
npm2/pause-0.0.1.tgz;sha1sum=3D1d408b3fdb76923b9543d96fb4c9dfd535d9cb5d;sub=
dir=3Dgit/node_modules/pause;striplevel=3D1 \
+    https://registry.npmjs.org/picomatch/-/picomatch-2.3.0.tgz;downloadfil=
ename=3Dnpm2/picomatch-2.3.0.tgz;sha512sum=3D958d50fcf889182db33afff3dfdd56=
3930fe674d9b0a0b057efc685d77fa87b92ff68f969ac9b362aac0c18eb7b0d80ec44e3111d=
ab45b25275df29e06b4af63;subdir=3Dgit/node_modules/picomatch;striplevel=3D1 =
\
+    https://registry.npmjs.org/pify/-/pify-3.0.0.tgz;downloadfilename=3Dnp=
m2/pify-3.0.0.tgz;sha1sum=3De5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176;subdir=
=3Dgit/node_modules/load-json-file/node_modules/pify;striplevel=3D1 \
+    https://registry.npmjs.org/pify/-/pify-3.0.0.tgz;downloadfilename=3Dnp=
m2/pify-3.0.0.tgz;sha1sum=3De5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176;subdir=
=3Dgit/node_modules/path-type/node_modules/pify;striplevel=3D1 \
+    https://registry.npmjs.org/pify/-/pify-4.0.1.tgz;downloadfilename=3Dnp=
m2/pify-4.0.1.tgz;sha512sum=3Db81f3490115bfed7ddebc6d595e1bd4f9186b063e326b=
2c05294793d922b8419c86914d0463a9d252b082a438fe8e00815b8fb18eadcb9d739a4d8d9=
fa0795da;subdir=3Dgit/node_modules/pify;striplevel=3D1 \
+    https://registry.npmjs.org/pkg-dir/-/pkg-dir-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/pkg-dir-3.0.0.tgz;sha512sum=3Dfc4e7b018928790db9aa4c4c8f93c1395805=
f0a8aefe1edc612df4679f91ed66a208205f2eae7c648fdd49e68429bf565495799ffd37430=
acddc8796205965bf;subdir=3Dgit/node_modules/pkg-dir;striplevel=3D1 \
+    https://registry.npmjs.org/prepend-http/-/prepend-http-2.0.0.tgz;downl=
oadfilename=3Dnpm2/prepend-http-2.0.0.tgz;sha1sum=3De92434bfa5ea8c19f41cdfd=
401d741a3c819d897;subdir=3Dgit/node_modules/prepend-http;striplevel=3D1 \
+    https://registry.npmjs.org/pretty-bytes/-/pretty-bytes-3.0.1.tgz;downl=
oadfilename=3Dnpm2/pretty-bytes-3.0.1.tgz;sha1sum=3D27d0008d778063a0b4811bb=
35c79f1bd5d5fbccf;subdir=3Dgit/node_modules/maxmin/node_modules/pretty-byte=
s;striplevel=3D1 \
+    https://registry.npmjs.org/pretty-bytes/-/pretty-bytes-5.6.0.tgz;downl=
oadfilename=3Dnpm2/pretty-bytes-5.6.0.tgz;sha512sum=3D145c34dfd4e6ac1a852bc=
99affb38bdec0f3fd5cad76d26bd38e3f41426d1f4c0af656fd8cbabdb49c88c54c2d4091f0=
6abd81aad880e220964b0a3d24b93316;subdir=3Dgit/node_modules/pretty-bytes;str=
iplevel=3D1 \
+    https://registry.npmjs.org/printj/-/printj-1.1.2.tgz;downloadfilename=
=3Dnpm2/printj-1.1.2.tgz;sha512sum=3Dcc0d929a82dac59c80ad04ce3e3e4b5de711f9=
16a07cf494e4ac35a8ffa391678d96babe789672636a12ebc494d59ffbfe6c97338968f7bd7=
a95a3850154ad09;subdir=3Dgit/node_modules/printj;striplevel=3D1 \
+    https://registry.npmjs.org/process-nextick-args/-/process-nextick-args=
-2.0.1.tgz;downloadfilename=3Dnpm2/process-nextick-args-2.0.1.tgz;sha512sum=
=3Dde8b943a9421b60adb39ad7b27bfaec4e4e92136166863fbfc0868477f80fbfd5ef6c92b=
cde9468bf757cc4632bdbc6e6c417a5a7db2a6c7132a22891459f56a;subdir=3Dgit/node_=
modules/process-nextick-args;striplevel=3D1 \
+    https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz;downloadf=
ilename=3Dnpm2/proxy-addr-2.0.7.tgz;sha512sum=3D96542c30b4940d43d3e388ddad4=
fcedfbaa59e27e2b433fe670ae699972848ac8b2afb59c69c95d27dbf6c3fcde2d040019fe0=
24475953b28cadaa0ad7e5d802;subdir=3Dgit/node_modules/proxy-addr;striplevel=
=3D1 \
+    https://registry.npmjs.org/proxy/-/proxy-1.0.2.tgz;downloadfilename=3D=
npm2/proxy-1.0.2.tgz;sha512sum=3D28d69cdae7964698db521efb38014f66e35d7c4a8d=
ca79bd0c3e311d3d7809c706a56f30299c0490dd328e56fb5fd1bd67d179e4dd10fb5cfe59f=
80087061dcd;subdir=3Dgit/node_modules/proxy;striplevel=3D1 \
+    https://registry.npmjs.org/pseudomap/-/pseudomap-1.0.2.tgz;downloadfil=
ename=3Dnpm2/pseudomap-1.0.2.tgz;sha1sum=3Df052a28da70e618917ef0a8ac34c1ae5=
a68286b3;subdir=3Dgit/node_modules/pseudomap;striplevel=3D1 \
+    https://registry.npmjs.org/psl/-/psl-1.8.0.tgz;downloadfilename=3Dnpm2=
/psl-1.8.0.tgz;sha512sum=3D44874ecf2a1abcafa1035f0e186583a944ec08b86d03b21c=
67fe8d0ace1f14968704369bfa90c3983201c96151409ab609deebd4ea10c4118a39acedabe=
86321;subdir=3Dgit/node_modules/psl;striplevel=3D1 \
+    https://registry.npmjs.org/pstree.remy/-/pstree.remy-1.1.8.tgz;downloa=
dfilename=3Dnpm2/pstree.remy-1.1.8.tgz;sha512sum=3Defb0d9c31426c4a9eedda479=
e3653e5fc172a4dcdb7c9f82e57403937b968d6c67eb5e75688306b615984574ea4f5139a09=
be0fa58da6b63898be55fbc2390f3;subdir=3Dgit/node_modules/pstree.remy;striple=
vel=3D1 \
+    https://registry.npmjs.org/pump/-/pump-2.0.1.tgz;downloadfilename=3Dnp=
m2/pump-2.0.1.tgz;sha512sum=3Daee3cc35190ddcc1cfd5c58973d396afe4ffc433f48e1=
5d808b7c9701b97e788617c806769098050c7c3706e0333950c581c816c963af504a9866de3=
b4328890;subdir=3Dgit/node_modules/pumpify/node_modules/pump;striplevel=3D1=
 \
+    https://registry.npmjs.org/pump/-/pump-3.0.0.tgz;downloadfilename=3Dnp=
m2/pump-3.0.0.tgz;sha512sum=3D2f0672fa9dd216cd4fcad77f8d872de30a6fe3d1e2602=
a9df5195ce5955d93457ef18cefea34790659374d198f2f57edebd4f13f420c64627e58f154=
d81161c3;subdir=3Dgit/node_modules/pump;striplevel=3D1 \
+    https://registry.npmjs.org/pumpify/-/pumpify-1.5.1.tgz;downloadfilenam=
e=3Dnpm2/pumpify-1.5.1.tgz;sha512sum=3Da02959237ec7bee50927148a2ab0b5edb67d=
0aed1962110018fb0f532f4a94c526bfd74a5f6a3bed1526abb7f75e32316f0c86c18cdbcd0=
d4bd8ab3cb08ada75;subdir=3Dgit/node_modules/pumpify;striplevel=3D1 \
+    https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz;downloadfilen=
ame=3Dnpm2/punycode-2.1.1.tgz;sha512sum=3D5d1b118dd7fe8f99a5fb2ffa18a1cf65b=
ac5ffca766206b424fb5da93218d977b9a2124f0fdb1a0c924b3efa7df8d481a6b56f7af757=
6726e78f672ff0e11dd0;subdir=3Dgit/node_modules/punycode;striplevel=3D1 \
+    https://registry.npmjs.org/pupa/-/pupa-2.1.1.tgz;downloadfilename=3Dnp=
m2/pupa-2.1.1.tgz;sha512sum=3D9758cd02ca4805216a6d3fb2fb9168b288cda55a45f78=
9e523ec03529a8ff5e9f03937c7c7d7f4821e6707deaf97eeb24e9b09b32a5e36bc1fccfaca=
b87078d4;subdir=3Dgit/node_modules/pupa;striplevel=3D1 \
+    https://registry.npmjs.org/qs/-/qs-6.10.1.tgz;downloadfilename=3Dnpm2/=
qs-6.10.1.tgz;sha512sum=3D339dbc1e987ac2c49538189852719ff8affbc3484db21b3f7=
6e1ac3573d408b1f95c0aa312d88f1b034e34b574b411fc36819bd26bc3e49b9b9d44ebba32=
834e;subdir=3Dgit/node_modules/superagent/node_modules/qs;striplevel=3D1 \
+    https://registry.npmjs.org/qs/-/qs-6.7.0.tgz;downloadfilename=3Dnpm2/q=
s-6.7.0.tgz;sha512sum=3D54274144d1535f57f213b35be85628511a3f48f7bad9009a032=
cc9bd48f045a22c73e35e3c112788796fc459a65f9ebe1d9a61206b55d177828ab06da43ad3=
c9;subdir=3Dgit/node_modules/qs;striplevel=3D1 \
+    https://registry.npmjs.org/quick-lru/-/quick-lru-5.1.1.tgz;downloadfil=
ename=3Dnpm2/quick-lru-5.1.1.tgz;sha512sum=3D5aec802d18d63c31adb7fc3326269d=
3b901763ef2167cd215697ba3328af82b691116ef9d57dd26e146f1b778b28e60dfbc544bea=
2dc7f7c1d9ede386784b848;subdir=3Dgit/node_modules/quick-lru;striplevel=3D1 =
\
+    https://registry.npmjs.org/random-bytes/-/random-bytes-1.0.0.tgz;downl=
oadfilename=3Dnpm2/random-bytes-1.0.0.tgz;sha1sum=3D4f68a1dc0ae58bd3fb95848=
c30324db75d64360b;subdir=3Dgit/node_modules/random-bytes;striplevel=3D1 \
+    https://registry.npmjs.org/randombytes/-/randombytes-2.1.0.tgz;downloa=
dfilename=3Dnpm2/randombytes-2.1.0.tgz;sha512sum=3Dbd897788e5fee022945aec46=
8bd5248627ba7eca97a92f4513665a89ce2d3450f637641069738c15bb8a2b84260c70b424e=
e81d59a78d49d0ba53d2847af1a99;subdir=3Dgit/node_modules/randombytes;striple=
vel=3D1 \
+    https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz;downl=
oadfilename=3Dnpm2/range-parser-1.2.1.tgz;sha512sum=3D1eb82cc7ea2baa8ca09e6=
8456ca68713a736f7a27e1d30105e8c4417a80dba944e9a6189468cb37c6ddc700bdea8206b=
c2bff6cb143905577f1939796a03b04a;subdir=3Dgit/node_modules/range-parser;str=
iplevel=3D1 \
+    https://registry.npmjs.org/raw-body/-/raw-body-1.1.7.tgz;downloadfilen=
ame=3Dnpm2/raw-body-1.1.7.tgz;sha1sum=3D1d027c2bfa116acc6623bca8f00016572a8=
7d425;subdir=3Dgit/node_modules/body/node_modules/raw-body;striplevel=3D1 \
+    https://registry.npmjs.org/raw-body/-/raw-body-2.4.0.tgz;downloadfilen=
ame=3Dnpm2/raw-body-2.4.0.tgz;sha512sum=3De0ecfc0d423076fa1ae6a3097a5c62a73=
8bf889222e343b9706575c0d629e61bd93fc64dd13fa388d90bd107a95ecf84b10f5727c8a9=
103a221fbd3249424fdd;subdir=3Dgit/node_modules/body-parser/node_modules/raw=
-body;striplevel=3D1 \
+    https://registry.npmjs.org/raw-body/-/raw-body-2.4.1.tgz;downloadfilen=
ame=3Dnpm2/raw-body-2.4.1.tgz;sha512sum=3Df56988285ea692f03448b980d8a9e6f7e=
aa3f3d7be8f5cea8329fc69719defe9c076e3e8aa023d94ee7b48064d9ff072ce8e4fec9857=
4f283d3f36896c7ef76c;subdir=3Dgit/node_modules/raw-body;striplevel=3D1 \
+    https://registry.npmjs.org/rc/-/rc-1.2.8.tgz;downloadfilename=3Dnpm2/r=
c-1.2.8.tgz;sha512sum=3Dcb76c682a2a3dd005dc4b6cb9289a5a2192fb00f20740894425=
4812670617e7f813f18386dceb677c4dc056d79c1abc37e07b10a071c72485c66fcb0c9060f=
3b;subdir=3Dgit/node_modules/rc;striplevel=3D1 \
+    https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-4.0.0.tgz;downloa=
dfilename=3Dnpm2/read-pkg-up-4.0.0.tgz;sha512sum=3De9eb50487ee7246b0ad116c6=
ff64de0f36456bcb218d0d6e9be4b0410e5cc0acb476149774e9dc1216f508fa6f406e21ec5=
c8e57a101e98955d3226f65034090;subdir=3Dgit/node_modules/test-exclude/node_m=
odules/read-pkg-up;striplevel=3D1 \
+    https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-7.0.1.tgz;downloa=
dfilename=3Dnpm2/read-pkg-up-7.0.1.tgz;sha512sum=3Dccad1307b5dde89a422e694b=
9ae7eaca4184fbf4e539e3c3eaa28294d5bb8470ca161fc9effee0096191ee3a044045b56ca=
ab76b7c9465239b3a858b150e2886;subdir=3Dgit/node_modules/read-pkg-up;striple=
vel=3D1 \
+    https://registry.npmjs.org/read-pkg/-/read-pkg-3.0.0.tgz;downloadfilen=
ame=3Dnpm2/read-pkg-3.0.0.tgz;sha1sum=3D9cbc686978fee65d16c00e2b19c237fcf6e=
38389;subdir=3Dgit/node_modules/test-exclude/node_modules/read-pkg;striplev=
el=3D1 \
+    https://registry.npmjs.org/read-pkg/-/read-pkg-5.2.0.tgz;downloadfilen=
ame=3Dnpm2/read-pkg-5.2.0.tgz;sha512sum=3D520ebd98d3a97ef28301cd90f03469323=
8f376dae7bfd1dc48c5fee15b19c43d5a67a673ac813bae5cd706d593ca150b48c2a0d3be80=
5ba591e626690f42623a;subdir=3Dgit/node_modules/read-pkg;striplevel=3D1 \
+    https://registry.npmjs.org/read/-/read-1.0.7.tgz;downloadfilename=3Dnp=
m2/read-1.0.7.tgz;sha1sum=3Db3da19bd052431a97671d44a42634adf710b40c4;subdir=
=3Dgit/node_modules/read;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tg=
z;downloadfilename=3Dnpm2/readable-stream-1.1.14.tgz;sha1sum=3D7cf4c54ef648=
e3813084c636dd2079e166c081d9;subdir=3Dgit/node_modules/busboy/node_modules/=
readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tg=
z;downloadfilename=3Dnpm2/readable-stream-1.1.14.tgz;sha1sum=3D7cf4c54ef648=
e3813084c636dd2079e166c081d9;subdir=3Dgit/node_modules/dicer/node_modules/r=
eadable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tg=
z;downloadfilename=3Dnpm2/readable-stream-1.1.14.tgz;sha1sum=3D7cf4c54ef648=
e3813084c636dd2079e166c081d9;subdir=3Dgit/node_modules/jshint/node_modules/=
readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/archive=
r-utils/node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/lazystr=
eam/node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/multer/=
node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/node-re=
d-node-test-helper/node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/pumpify=
/node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dgit/node_modules/through=
2/node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.0.tgz=
;downloadfilename=3Dnpm2/readable-stream-3.6.0.tgz;sha512sum=3D055887cbb2ca=
793cf8a0d9e470b27e95548beafa6215e5fafddde8487f33096ed4c4fda89dc864faf4c6075=
e37c6e1631d2ddd7938242a85d7ca65eaca688874;subdir=3Dgit/node_modules/readabl=
e-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readdir-glob/-/readdir-glob-1.1.1.tgz;downl=
oadfilename=3Dnpm2/readdir-glob-1.1.1.tgz;sha512sum=3Df75fe4d44cd9c03c7a1db=
11147ecee73281115f88f976ce421866dbf7263afa327ed290a71572df1a54efac49188631c=
e9f2dfef676edddf76fee63add83dd10;subdir=3Dgit/node_modules/readdir-glob;str=
iplevel=3D1 \
+    https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz;downloadfilen=
ame=3Dnpm2/readdirp-3.6.0.tgz;sha512sum=3D84e4b4f3da27f1176ea9d6e1bd0e59dfb=
0341128ecab3eaa9d171f7ec314df8f7916e4dda929beedb849dbd26f20eb010c41276a7e43=
3eef6ddd3a3d55194ccc;subdir=3Dgit/node_modules/readdirp;striplevel=3D1 \
+    https://registry.npmjs.org/rechoir/-/rechoir-0.7.1.tgz;downloadfilenam=
e=3Dnpm2/rechoir-0.7.1.tgz;sha512sum=3Dfe78e667cb35c15791ea98d367ed270a7bfc=
4a964d44c4f60f544b3894044a56050c1bf0a5303829626967eb01278faf86320b45c2bb248=
15d182771100022b6;subdir=3Dgit/node_modules/rechoir;striplevel=3D1 \
+    https://registry.npmjs.org/reduce-extract/-/reduce-extract-1.0.0.tgz;d=
ownloadfilename=3Dnpm2/reduce-extract-1.0.0.tgz;sha1sum=3D67f2385beda65061b=
5f5f4312662e8b080ca1525;subdir=3Dgit/node_modules/reduce-extract;striplevel=
=3D1 \
+    https://registry.npmjs.org/reduce-flatten/-/reduce-flatten-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/reduce-flatten-1.0.1.tgz;sha1sum=3D258c78efd153ddf93=
cb561237f61184f3696e327;subdir=3Dgit/node_modules/wordwrapjs/node_modules/r=
educe-flatten;striplevel=3D1 \
+    https://registry.npmjs.org/reduce-flatten/-/reduce-flatten-3.0.1.tgz;d=
ownloadfilename=3Dnpm2/reduce-flatten-3.0.1.tgz;sha512sum=3D6d8a3ef7b066514=
3b3834f57c1f93000bb783d01f53392f4c3329eac1b7a58b9b716175de3798c4bcf47893d41=
f69248aa4a3fea55b1dce9d5e09f5fd8aaa9e5;subdir=3Dgit/node_modules/reduce-fla=
tten;striplevel=3D1 \
+    https://registry.npmjs.org/reduce-unique/-/reduce-unique-2.0.1.tgz;dow=
nloadfilename=3Dnpm2/reduce-unique-2.0.1.tgz;sha512sum=3Dc788c7ffc2f57b2646=
47bf39598f9e3edc8c361c9c9753765ce2f18426f36456aa1780178cbcea4b16b6507809d99=
551fc71f23cebe5d4bef14675bcc9ee4c74;subdir=3Dgit/node_modules/reduce-unique=
;striplevel=3D1 \
+    https://registry.npmjs.org/reduce-without/-/reduce-without-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/reduce-without-1.0.1.tgz;sha1sum=3D68ad0ead11855c9a3=
7d4e8256c15bbf87972fc8c;subdir=3Dgit/node_modules/reduce-without;striplevel=
=3D1 \
+    https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0=
.13.9.tgz;downloadfilename=3Dnpm2/regenerator-runtime-0.13.9.tgz;sha512sum=
=3Da77553f9c38483116c45103d5f896423513e936fc2b672ad53881cc7268252b7a294bfef=
a88e82759df0c55531dd439483e82750e41071123b066488eb9e8c60;subdir=3Dgit/node_=
modules/regenerator-runtime;striplevel=3D1 \
+    https://registry.npmjs.org/registry-auth-token/-/registry-auth-token-4=
.2.1.tgz;downloadfilename=3Dnpm2/registry-auth-token-4.2.1.tgz;sha512sum=3D=
ea09126f853a696241e1217666f2dbefac8206372fb9f5c1aafbc4c751db98a3e4badb308d6=
d71355458d3e75a96321845ba2037b3b47ad61295b89a110c8ccb;subdir=3Dgit/node_mod=
ules/registry-auth-token;striplevel=3D1 \
+    https://registry.npmjs.org/registry-url/-/registry-url-5.1.0.tgz;downl=
oadfilename=3Dnpm2/registry-url-5.1.0.tgz;sha512sum=3Df1a7185d74c8d00910bfa=
4403a3137bce6885d9913f70a382ce15b04a6101049e730d0692aa754ac8e92e0d4f428f228=
fd656f279b44fd7e4b17f4d051fd1e93;subdir=3Dgit/node_modules/registry-url;str=
iplevel=3D1 \
+    https://registry.npmjs.org/reinterval/-/reinterval-1.1.0.tgz;downloadf=
ilename=3Dnpm2/reinterval-1.1.0.tgz;sha1sum=3D3361ecfa3ca6c18283380dd0bb954=
6f390f5ece7;subdir=3Dgit/node_modules/reinterval;striplevel=3D1 \
+    https://registry.npmjs.org/release-zalgo/-/release-zalgo-1.0.0.tgz;dow=
nloadfilename=3Dnpm2/release-zalgo-1.0.0.tgz;sha1sum=3D09700b7e507432973933=
0e535c5a90fb67851730;subdir=3Dgit/node_modules/release-zalgo;striplevel=3D1=
 \
+    https://registry.npmjs.org/require-directory/-/require-directory-2.1.1=
.tgz;downloadfilename=3Dnpm2/require-directory-2.1.1.tgz;sha1sum=3D8c64ad5f=
d30dab1c976e2344ffe7f792a6a6df42;subdir=3Dgit/node_modules/require-director=
y;striplevel=3D1 \
+    https://registry.npmjs.org/require-from-string/-/require-from-string-2=
.0.2.tgz;downloadfilename=3Dnpm2/require-from-string-2.0.2.tgz;sha512sum=3D=
5dfd2759ee91b1ece214cbbe029f5b8a251b9a996ae92f7fa7eef0ed85cffc904786b5030d4=
8706bebc0372b9bbaa7d9593bde53ffc36151ac0c6ed128bfef13;subdir=3Dgit/node_mod=
ules/require-from-string;striplevel=3D1 \
+    https://registry.npmjs.org/require-main-filename/-/require-main-filena=
me-2.0.0.tgz;downloadfilename=3Dnpm2/require-main-filename-2.0.0.tgz;sha512=
sum=3D34a37990c0f294aba577160b4947eb6e8e53bb387885dfb613c34f3d7d36999b67d55=
b911104e861efd9765272f89dee0a97da886174e5eec1f16d225db4079a;subdir=3Dgit/no=
de_modules/require-main-filename;striplevel=3D1 \
+    https://registry.npmjs.org/requizzle/-/requizzle-0.2.3.tgz;downloadfil=
ename=3Dnpm2/requizzle-0.2.3.tgz;sha512sum=3D61a9e8c898f290fc461e28b47d93f4=
b943c45e9bea7c10f1595eece862808a23ac8aa857eaf1cdc96dd0cdd9aaa7f8aafc4c5b85a=
19b56b8c1e2bb8455233819;subdir=3Dgit/node_modules/requizzle;striplevel=3D1 =
\
+    https://registry.npmjs.org/resolve-alpn/-/resolve-alpn-1.2.1.tgz;downl=
oadfilename=3Dnpm2/resolve-alpn-1.2.1.tgz;sha512sum=3Dd1ad45e25ef7fd915939a=
9099d0dc5be4276fa0493416cffaf6284e4e7436344f13e6e61e0692a91659f338ed3ec7b1b=
9ceb5c255105e1ea42572eaeed0dcafa;subdir=3Dgit/node_modules/resolve-alpn;str=
iplevel=3D1 \
+    https://registry.npmjs.org/resolve-dir/-/resolve-dir-1.0.1.tgz;downloa=
dfilename=3Dnpm2/resolve-dir-1.0.1.tgz;sha1sum=3D79a40644c362be82f26effe739=
c9bb5382046f43;subdir=3Dgit/node_modules/resolve-dir;striplevel=3D1 \
+    https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz;downl=
oadfilename=3Dnpm2/resolve-from-4.0.0.tgz;sha512sum=3Da5bfcc6265ecb40932b11=
171f2988d235b4614d408140def904dc6ab812e035745ea01e9ffebe066ab021896a9bf2f0d=
dd0fb8a3b170beab8f25c9d9ed1632e2;subdir=3Dgit/node_modules/resolve-from;str=
iplevel=3D1 \
+    https://registry.npmjs.org/resolve/-/resolve-1.20.0.tgz;downloadfilena=
me=3Dnpm2/resolve-1.20.0.tgz;sha512sum=3Dc043413ede324b3838c9b1505b64d3d733=
10b9c3caf791d287f9ead82153655386baddbea50bd2b20b5d6b8776e98ad872bd3aef08db9=
b3386f1bc833c15fadc;subdir=3Dgit/node_modules/resolve;striplevel=3D1 \
+    https://registry.npmjs.org/responselike/-/responselike-1.0.2.tgz;downl=
oadfilename=3Dnpm2/responselike-1.0.2.tgz;sha1sum=3D918720ef3b631c5642be068=
f15ade5a46f4ba1e7;subdir=3Dgit/node_modules/package-json/node_modules/respo=
nselike;striplevel=3D1 \
+    https://registry.npmjs.org/responselike/-/responselike-2.0.0.tgz;downl=
oadfilename=3Dnpm2/responselike-2.0.0.tgz;sha512sum=3Dc47e3cbb715307d56c670=
ed1fafbe068a78b2b34fa8cea206d08447bf8dec309d98333dc9f25ae8b602fe89a6861917f=
f75bae782fa5aa15aa794470e7faa10b;subdir=3Dgit/node_modules/responselike;str=
iplevel=3D1 \
+    https://registry.npmjs.org/retry/-/retry-0.6.1.tgz;downloadfilename=3D=
npm2/retry-0.6.1.tgz;sha1sum=3Dfdc90eed943fde11b893554b8cc63d0e899ba918;sub=
dir=3Dgit/node_modules/retry;striplevel=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-2.7.1.tgz;downloadfilename=
=3Dnpm2/rimraf-2.7.1.tgz;sha512sum=3Db968db68a20add3d4e495a6dcd7ecd97a3ef43=
7a801ad284b5546346e6b38df2f7071e5e238d3d5594aa80d0fee143679b32d574f8fd16a14=
934fa81645bdee3;subdir=3Dgit/node_modules/grunt-contrib-clean/node_modules/=
rimraf;striplevel=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-2.7.1.tgz;downloadfilename=
=3Dnpm2/rimraf-2.7.1.tgz;sha512sum=3Db968db68a20add3d4e495a6dcd7ecd97a3ef43=
7a801ad284b5546346e6b38df2f7071e5e238d3d5594aa80d0fee143679b32d574f8fd16a14=
934fa81645bdee3;subdir=3Dgit/node_modules/istanbul-lib-source-maps/node_mod=
ules/rimraf;striplevel=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-2.7.1.tgz;downloadfilename=
=3Dnpm2/rimraf-2.7.1.tgz;sha512sum=3Db968db68a20add3d4e495a6dcd7ecd97a3ef43=
7a801ad284b5546346e6b38df2f7071e5e238d3d5594aa80d0fee143679b32d574f8fd16a14=
934fa81645bdee3;subdir=3Dgit/node_modules/nyc/node_modules/rimraf;stripleve=
l=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-2.7.1.tgz;downloadfilename=
=3Dnpm2/rimraf-2.7.1.tgz;sha512sum=3Db968db68a20add3d4e495a6dcd7ecd97a3ef43=
7a801ad284b5546346e6b38df2f7071e5e238d3d5594aa80d0fee143679b32d574f8fd16a14=
934fa81645bdee3;subdir=3Dgit/node_modules/spawn-wrap/node_modules/rimraf;st=
riplevel=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz;downloadfilename=
=3Dnpm2/rimraf-3.0.2.tgz;sha512sum=3D25990931990018514f3f662a5d95cf6cc94c06=
0b31cc4f082ece253085ffda8d0bf54070f4efd8de8eb0170fe2f582daa5c5095b0a9b8b791=
dc483dd0bad9320;subdir=3Dgit/node_modules/rimraf;striplevel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.1.2.tgz;sha512sum=3D19dd94641243917958ec66c9=
c5fb04f3f9ef2a45045351b7f1cd6c88de903fa6bd3d3f4c98707c1a7a6c71298c252a05f0b=
388aedf2e77fc0fb688f2b381bafa;subdir=3Dgit/node_modules/safe-buffer;striple=
vel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.2.1.tgz;sha512sum=3Dae9dd2a34eca71d9a629b1af=
81a37141226bedb1954959394bd12ad45fa9a5b468ef4f9879a0f1930e4377c34f37e183e9b=
8e7626d95b8fb825e6a6e62f9825d;subdir=3Dgit/node_modules/express-session/nod=
e_modules/safe-buffer;striplevel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.2.1.tgz;sha512sum=3Dae9dd2a34eca71d9a629b1af=
81a37141226bedb1954959394bd12ad45fa9a5b468ef4f9879a0f1930e4377c34f37e183e9b=
8e7626d95b8fb825e6a6e62f9825d;subdir=3Dgit/node_modules/string_decoder/node=
_modules/safe-buffer;striplevel=3D1 \
+    https://registry.npmjs.org/safe-json-parse/-/safe-json-parse-1.0.1.tgz=
;downloadfilename=3Dnpm2/safe-json-parse-1.0.1.tgz;sha1sum=3D3e76723e38dfdd=
a13c9b1d29a1e07ffee4b30b57;subdir=3Dgit/node_modules/safe-json-parse;stripl=
evel=3D1 \
+    https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz;downl=
oadfilename=3Dnpm2/safer-buffer-2.1.2.tgz;sha512sum=3D619a372bcd920fb462ca2=
d04d4440fa232f3ee4a5ea6749023d2323db1c78355d75debdbe5d248eeda72376003c46710=
6c71bbbdcc911e4d1c6f0a9c42b894b6;subdir=3Dgit/node_modules/safer-buffer;str=
iplevel=3D1 \
+    https://registry.npmjs.org/sass/-/sass-1.43.2.tgz;downloadfilename=3Dn=
pm2/sass-1.43.2.tgz;sha512sum=3D0e7718863977c0168f30c251d24214687dec179dfaa=
d5ace72aa951a64d91d0451ce3ecb425c8657b31bf1a08a17220b32be55b0f1f0458b722a99=
ca62599049;subdir=3Dgit/node_modules/sass;striplevel=3D1 \
+    https://registry.npmjs.org/sax/-/sax-1.2.4.tgz;downloadfilename=3Dnpm2=
/sax-1.2.4.tgz;sha512sum=3D36a543bfd4e900d523166d0df2e3391b12f7e9480a8bdfda=
b59c3ec7b6059d0f1c9301462ab978c57e325adadecb75099b99cfd6451b9d880ba29a96352=
4615b;subdir=3Dgit/node_modules/sax;striplevel=3D1 \
+    https://registry.npmjs.org/semver-diff/-/semver-diff-3.1.1.tgz;downloa=
dfilename=3Dnpm2/semver-diff-3.1.1.tgz;sha512sum=3D197d08c7f089707c81f1ce32=
9291c6200bcbc8ec0ea1bb4cffc77e4d090077cd7f6c48e03c7adf6dae355697acafb8d7fed=
f1487e477117f5e012e5b7be8d062;subdir=3Dgit/node_modules/semver-diff;striple=
vel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/caching-transform/node_modules/se=
mver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/cp-file/node_modules/semver;strip=
level=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/find-cache-dir/node_modules/semve=
r;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/istanbul-lib-report/node_modules/=
semver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/istanbul-lib-source-maps/node_mod=
ules/semver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/nodemon/node_modules/semver;strip=
level=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/normalize-package-data/node_modul=
es/semver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-5.7.1.tgz;downloadfilename=
=3Dnpm2/semver-5.7.1.tgz;sha512sum=3Db1ab9a0dffcf65d560acb4cd60746da576b589=
188a71a79b88a435049769425587da50af7b141d5f9e6c9cf1722bb433a6e76a6c2234a9715=
f39ab0777234319;subdir=3Dgit/node_modules/nyc/node_modules/semver;stripleve=
l=3D1 \
+    https://registry.npmjs.org/semver/-/semver-6.3.0.tgz;downloadfilename=
=3Dnpm2/semver-6.3.0.tgz;sha512sum=3D6f7f5305a4d27d5eb206b6a953cf69e5f29e90=
4da6fcdc270e870e56bb90152d7fbde320773b8f72738cdf833a0b0c56f231ff97111ae6b06=
80de530bb91c74f;subdir=3Dgit/node_modules/istanbul-lib-instrument/node_modu=
les/semver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-6.3.0.tgz;downloadfilename=
=3Dnpm2/semver-6.3.0.tgz;sha512sum=3D6f7f5305a4d27d5eb206b6a953cf69e5f29e90=
4da6fcdc270e870e56bb90152d7fbde320773b8f72738cdf833a0b0c56f231ff97111ae6b06=
80de530bb91c74f;subdir=3Dgit/node_modules/make-dir/node_modules/semver;stri=
plevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-6.3.0.tgz;downloadfilename=
=3Dnpm2/semver-6.3.0.tgz;sha512sum=3D6f7f5305a4d27d5eb206b6a953cf69e5f29e90=
4da6fcdc270e870e56bb90152d7fbde320773b8f72738cdf833a0b0c56f231ff97111ae6b06=
80de530bb91c74f;subdir=3Dgit/node_modules/package-json/node_modules/semver;=
striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-6.3.0.tgz;downloadfilename=
=3Dnpm2/semver-6.3.0.tgz;sha512sum=3D6f7f5305a4d27d5eb206b6a953cf69e5f29e90=
4da6fcdc270e870e56bb90152d7fbde320773b8f72738cdf833a0b0c56f231ff97111ae6b06=
80de530bb91c74f;subdir=3Dgit/node_modules/semver-diff/node_modules/semver;s=
triplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-7.3.4.tgz;downloadfilename=
=3Dnpm2/semver-7.3.4.tgz;sha512sum=3Db427dbd962e3a8502d5e7e0a11dc4885a96746=
da0a14dee70308f407765709b425a15dadab97836dc4e64faf09243de7449ab6e3f5e0c6d40=
a148a5076dbe657;subdir=3Dgit/node_modules/node-red-node-test-helper/node_mo=
dules/semver;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-7.3.5.tgz;downloadfilename=
=3Dnpm2/semver-7.3.5.tgz;sha512sum=3D3e878625887c1cae014cefdaf537fa646def7a=
8fc0ed956c62b480e89f27cbd9dbdc1d55ae992e37ecfd384e707c4e69e87e0b721619b1e82=
24206c90fde1915;subdir=3Dgit/node_modules/semver;striplevel=3D1 \
+    https://registry.npmjs.org/send/-/send-0.17.1.tgz;downloadfilename=3Dn=
pm2/send-0.17.1.tgz;sha512sum=3D06c54ab2219c40c1704fc531ca9a1b50acafee2ac23=
511e4d53d06ebcd2f93cf327fa2c107219c649393242ad33f6c5537ac88f978cf25c36e1375=
787d3f6c02;subdir=3Dgit/node_modules/send;striplevel=3D1 \
+    https://registry.npmjs.org/serialize-javascript/-/serialize-javascript=
-6.0.0.tgz;downloadfilename=3Dnpm2/serialize-javascript-6.0.0.tgz;sha512sum=
=3D42bdd3a2cbe0b85b7c78f5aab2f45facac905c8896fa719b629cbc5cadb83501c4f3771a=
c56b7e988ca64d3d7d0c615b35634b7c4c2cae44a637ae2555607d6a;subdir=3Dgit/node_=
modules/serialize-javascript;striplevel=3D1 \
+    https://registry.npmjs.org/serve-static/-/serve-static-1.14.1.tgz;down=
loadfilename=3Dnpm2/serve-static-1.14.1.tgz;sha512sum=3D24caef530139e1e9826=
1695323e846ac6bf923c744c26728ff4d04be4cc822c47b32aac7a276c3f693b630e7c59e91=
67b65ede72966cfb7996f976d066ef500a;subdir=3Dgit/node_modules/serve-static;s=
triplevel=3D1 \
+    https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz;downl=
oadfilename=3Dnpm2/set-blocking-2.0.0.tgz;sha1sum=3D045f9782d011ae9a6803ddd=
382b24392b3d890f7;subdir=3Dgit/node_modules/set-blocking;striplevel=3D1 \
+    https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/setprototypeof-1.1.1.tgz;sha512sum=3D26f74059f6d7788=
19a67d7082e9dfc1e7b594854a8de65a0eb119c249b1df9de1a44c3aa6ae6a0d42eb77497c3=
c3b39a318c046c730ec4467596a55160fd8e03;subdir=3Dgit/node_modules/setprototy=
peof;striplevel=3D1 \
+    https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz=
;downloadfilename=3Dnpm2/shebang-command-2.0.0.tgz;sha512sum=3D907c6bdb3669=
62d766acdd6a0e3aeb5ff675ad1d641bc0f1fa09292b51b87979af5ecc26704d614d6056614=
ce5ada630d7fc99a7a62e0d8efb62dbdb3747660c;subdir=3Dgit/node_modules/shebang=
-command;striplevel=3D1 \
+    https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz;dow=
nloadfilename=3Dnpm2/shebang-regex-3.0.0.tgz;sha512sum=3Defef9d161b5cc77df9=
dee05aabc0c347836ec417ad0730bb6503a19934089c711de9b4ab5dd884cb30af1b4ed9e38=
51874b4a1594c97b7933fca1cfc7a471bd4;subdir=3Dgit/node_modules/shebang-regex=
;striplevel=3D1 \
+    https://registry.npmjs.org/shelljs/-/shelljs-0.3.0.tgz;downloadfilenam=
e=3Dnpm2/shelljs-0.3.0.tgz;sha1sum=3D3596e6307a781544f591f37da618360f31db57=
b1;subdir=3Dgit/node_modules/jshint/node_modules/shelljs;striplevel=3D1 \
+    https://registry.npmjs.org/shelljs/-/shelljs-0.5.3.tgz;downloadfilenam=
e=3Dnpm2/shelljs-0.5.3.tgz;sha1sum=3Dc54982b996c76ef0c1e6b59fbdc5825f5b7131=
13;subdir=3Dgit/node_modules/shelljs;striplevel=3D1 \
+    https://registry.npmjs.org/should-equal/-/should-equal-2.0.0.tgz;downl=
oadfilename=3Dnpm2/should-equal-2.0.0.tgz;sha512sum=3D64fdfa4ccacaf5eb84b96=
41806283d5b9e563c2eeea37eeacc01266e31f3e207f2b97ac452017c714bd054efb0f9ddce=
31f3ef491409db69529bc310278dcb4c;subdir=3Dgit/node_modules/should-equal;str=
iplevel=3D1 \
+    https://registry.npmjs.org/should-format/-/should-format-3.0.3.tgz;dow=
nloadfilename=3Dnpm2/should-format-3.0.3.tgz;sha1sum=3D9bfc8f74fa39205c53d3=
8c34d717303e277124f1;subdir=3Dgit/node_modules/should-format;striplevel=3D1=
 \
+    https://registry.npmjs.org/should-sinon/-/should-sinon-0.0.6.tgz;downl=
oadfilename=3Dnpm2/should-sinon-0.0.6.tgz;sha512sum=3D49c04e1f9b96e5054568e=
36652721700d491eb3e41f082b312604fdc7139b0f3820ee67cf284cc7547672a809541d2dc=
088ad1ae144b3d2e584feec7e346b4e2;subdir=3Dgit/node_modules/should-sinon;str=
iplevel=3D1 \
+    https://registry.npmjs.org/should-type-adaptors/-/should-type-adaptors=
-1.1.0.tgz;downloadfilename=3Dnpm2/should-type-adaptors-1.1.0.tgz;sha512sum=
=3D240e217682e737e91e6c4a7656cf1e05ef60eeecb4cdb468f9131c53412c372f91fa4d38=
f4a8be379b53e496a0b2dda0ec40236be7ae16ea171426bcbc89257c;subdir=3Dgit/node_=
modules/should-type-adaptors;striplevel=3D1 \
+    https://registry.npmjs.org/should-type/-/should-type-1.4.0.tgz;downloa=
dfilename=3Dnpm2/should-type-1.4.0.tgz;sha1sum=3D0756d8ce846dfd09843a694771=
9dfa0d4cff5cf3;subdir=3Dgit/node_modules/should-type;striplevel=3D1 \
+    https://registry.npmjs.org/should-util/-/should-util-1.0.1.tgz;downloa=
dfilename=3Dnpm2/should-util-1.0.1.tgz;sha512sum=3Da1717cb5fc71e5c0e4f2bda4=
62a964509cd9a4306a558fc82365a1bd4d27f58dd762f01846679a7f53efbc8bd380f9efe0a=
27e112e4cd0fc83ab9269f98832da;subdir=3Dgit/node_modules/should-util;striple=
vel=3D1 \
+    https://registry.npmjs.org/should/-/should-13.2.3.tgz;downloadfilename=
=3Dnpm2/should-13.2.3.tgz;sha512sum=3D8202deb0bb6edb1a7e67123ecac25398d8e1d=
94d13b02fab43fa5f103f5b5196780ca79f3f6ec3fbb6095554ef2ac9a32e9222f6301aee2b=
700c69030e6b7519;subdir=3Dgit/node_modules/should;striplevel=3D1 \
+    https://registry.npmjs.org/side-channel/-/side-channel-1.0.4.tgz;downl=
oadfilename=3Dnpm2/side-channel-1.0.4.tgz;sha512sum=3Dab95cfcada85108287906=
762308ad8d749af2d1be7421e36ffe1a8065156ddbd8b5cb136c71269645766f78c1ed016a8=
5774702721aa839c12edea714efd19bf;subdir=3Dgit/node_modules/side-channel;str=
iplevel=3D1 \
+    https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.6.tgz;downloa=
dfilename=3Dnpm2/signal-exit-3.0.6.tgz;sha512sum=3Db03978a8c1698a3706c36d94=
e70eb72a60f771925f06e16554d6d530a8deda47a828c2fb5f653359b7385eb9846c3c20d0d=
5c9737cafe3fa31edbf8959be7b91;subdir=3Dgit/node_modules/signal-exit;striple=
vel=3D1 \
+    https://registry.npmjs.org/simple-cli/-/simple-cli-5.0.5.tgz;downloadf=
ilename=3Dnpm2/simple-cli-5.0.5.tgz;sha512sum=3D12bd8586c21ac8bfec92dc60e9f=
38274d4090535e195ffdfb30345b1d9a4b3cf31b07cd0fc85c6c3162049229e5c1ab8caa9fc=
dff883e1283cca36a0c32b1483;subdir=3Dgit/node_modules/simple-cli;striplevel=
=3D1 \
+    https://registry.npmjs.org/sinon/-/sinon-11.1.2.tgz;downloadfilename=
=3Dnpm2/sinon-11.1.2.tgz;sha512sum=3De7ddb7ec70a19ace2483bfec5e1891714cdd4a=
42aec9d0de4e26a64ff8deb14547b210602fc5c09a1805a3419f2ba46bb8c0ccfe24528a3d4=
4c9b98ca20f5c27;subdir=3Dgit/node_modules/sinon;striplevel=3D1 \
+    https://registry.npmjs.org/sinon/-/sinon-9.2.4.tgz;downloadfilename=3D=
npm2/sinon-9.2.4.tgz;sha512sum=3Dce58dc50b650b09c55adadbca8800bea8c3567db69=
6adb640931094784413f74c6734d0572db6c3f9a4adbce0d6ace568cc654e58cf2de4008a77=
0772917f962;subdir=3Dgit/node_modules/node-red-node-test-helper/node_module=
s/sinon;striplevel=3D1 \
+    https://registry.npmjs.org/sort-array/-/sort-array-4.1.4.tgz;downloadf=
ilename=3Dnpm2/sort-array-4.1.4.tgz;sha512sum=3D19514de98d6c1caad669260e253=
93dd3ddd99eb04c73db0fde7ba100d538e12e31837ac4e96e59e56c9a9ae4fc5693016ecb27=
7adc797da282b9ad0b1265274b;subdir=3Dgit/node_modules/sort-array;striplevel=
=3D1 \
+    https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz;downloadf=
ilename=3Dnpm2/source-map-0.5.7.tgz;sha1sum=3D8a039d2d1021d22d1ea14c80d8ea4=
68ba2ef3fcc;subdir=3Dgit/node_modules/source-map;striplevel=3D1 \
+    https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz;downloadf=
ilename=3Dnpm2/source-map-0.6.1.tgz;sha512sum=3D52381aa6e99695b3219018334fb=
624739617513e3a17488abbc4865ead1b7303f9773fe1d0f963e9e9c9aa3cf565bab697959a=
a989eb55bc16396332177178ee;subdir=3Dgit/node_modules/handlebars/node_module=
s/source-map;striplevel=3D1 \
+    https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz;downloadf=
ilename=3Dnpm2/source-map-0.6.1.tgz;sha512sum=3D52381aa6e99695b3219018334fb=
624739617513e3a17488abbc4865ead1b7303f9773fe1d0f963e9e9c9aa3cf565bab697959a=
a989eb55bc16396332177178ee;subdir=3Dgit/node_modules/istanbul-lib-source-ma=
ps/node_modules/source-map;striplevel=3D1 \
+    https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz;downloadf=
ilename=3Dnpm2/source-map-0.6.1.tgz;sha512sum=3D52381aa6e99695b3219018334fb=
624739617513e3a17488abbc4865ead1b7303f9773fe1d0f963e9e9c9aa3cf565bab697959a=
a989eb55bc16396332177178ee;subdir=3Dgit/node_modules/merge-source-map/node_=
modules/source-map;striplevel=3D1 \
+    https://registry.npmjs.org/spawn-wrap/-/spawn-wrap-1.4.3.tgz;downloadf=
ilename=3Dnpm2/spawn-wrap-1.4.3.tgz;sha512sum=3D22007c99dd105bffad5aa71abee=
16029847fa8846f26444b3c90c56a85ed2cb51a55c0832b4f877854e49901e3ddea6b71885c=
fa03a5d1a100d70eea66561ecf;subdir=3Dgit/node_modules/spawn-wrap;striplevel=
=3D1 \
+    https://registry.npmjs.org/spdx-correct/-/spdx-correct-3.1.1.tgz;downl=
oadfilename=3Dnpm2/spdx-correct-3.1.1.tgz;sha512sum=3D70e61c516c210ae1c25e2=
e3d4611510b22442b788f8f5662cfd0e9562577b5b64ec170f8f50cc837732938b24dc61daa=
c2ada524965a28c570f6a362e234c2d3;subdir=3Dgit/node_modules/spdx-correct;str=
iplevel=3D1 \
+    https://registry.npmjs.org/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz=
;downloadfilename=3Dnpm2/spdx-exceptions-2.3.0.tgz;sha512sum=3Dfed4eb60e0bb=
3cf2359d4020c77e21529a97bb2246f834c72539c850b1b8ac3ca08b8c6efed7e09aad5ed5c=
211c11cf0660a3834bc928beae270b919930e22e4;subdir=3Dgit/node_modules/spdx-ex=
ceptions;striplevel=3D1 \
+    https://registry.npmjs.org/spdx-expression-parse/-/spdx-expression-par=
se-3.0.1.tgz;downloadfilename=3Dnpm2/spdx-expression-parse-3.0.1.tgz;sha512=
sum=3D71ba87ba7b105a724d13a2a155232c31e1f91ff2fd129ca66f3a93437b8bc0d08b675=
438f35a166a87ea1fb9cee95d3bc655f063a3e141d43621e756c7f64ae1;subdir=3Dgit/no=
de_modules/spdx-expression-parse;striplevel=3D1 \
+    https://registry.npmjs.org/spdx-license-ids/-/spdx-license-ids-3.0.11.=
tgz;downloadfilename=3Dnpm2/spdx-license-ids-3.0.11.tgz;sha512sum=3D0ad9760=
6b1623345f7300358823dc29328318519abf668bac617a36dd3bdeb49c5e840c90294d8a67d=
014270ca96734150b2a208dd67df0f440641caf195a0fa;subdir=3Dgit/node_modules/sp=
dx-license-ids;striplevel=3D1 \
+    https://registry.npmjs.org/split2/-/split2-2.2.0.tgz;downloadfilename=
=3Dnpm2/split2-2.2.0.tgz;sha512sum=3D4406f6d931b7f4b848df531bade06022e2a220=
a855b1ac1f4e0106a8a1d32bceda1beba5fcf07c4aaa22dc8ee455d4568827eb2b12b7ba8e3=
f61492936f84f6f;subdir=3Dgit/node_modules/pad-stream/node_modules/split2;st=
riplevel=3D1 \
+    https://registry.npmjs.org/split2/-/split2-3.2.2.tgz;downloadfilename=
=3Dnpm2/split2-3.2.2.tgz;sha512sum=3Df4d4e18e98199e27d3909a734d9ec4b9ef394b=
8f50c29361653aba19127039b6fa8e72c534607b426ef75791dec1344e3f2c43d02dbdc6a99=
a23af1b42d57e86;subdir=3Dgit/node_modules/split2;striplevel=3D1 \
+    https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz;downloadf=
ilename=3Dnpm2/sprintf-js-1.0.3.tgz;sha1sum=3D04e6926f662895354f3dd01520363=
3b857297e2c;subdir=3Dgit/node_modules/sprintf-js;striplevel=3D1 \
+    https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz;downloadfilen=
ame=3Dnpm2/statuses-1.5.0.tgz;sha1sum=3D161c7dac177659fd9811f43771fa9938147=
8628c;subdir=3Dgit/node_modules/statuses;striplevel=3D1 \
+    https://registry.npmjs.org/stoppable/-/stoppable-1.1.0.tgz;downloadfil=
ename=3Dnpm2/stoppable-1.1.0.tgz;sha512sum=3D2970d867d76cce3e9bcef9c431162f=
c607931d4ef840114be785cab4fde7c8cb89f3508562d0016776c0ccbd8474551a13024e04e=
804372163dd1ee84f30f2cb;subdir=3Dgit/node_modules/stoppable;striplevel=3D1 =
\
+    https://registry.npmjs.org/stream-buffers/-/stream-buffers-3.0.2.tgz;d=
ownloadfilename=3Dnpm2/stream-buffers-3.0.2.tgz;sha512sum=3D0d08b587c544040=
fe55116d2c05b441e74936fdb36fe9c0b11a16e3615f0cb50f1dd26b494eb984f6c8d52be3f=
8f67ecf2808030036dad9e4eacf66dc95b3731;subdir=3Dgit/node_modules/stream-buf=
fers;striplevel=3D1 \
+    https://registry.npmjs.org/stream-connect/-/stream-connect-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/stream-connect-1.0.2.tgz;sha1sum=3D18bc81f2edb35b8b5=
d9a8009200a985314428a97;subdir=3Dgit/node_modules/stream-connect;striplevel=
=3D1 \
+    https://registry.npmjs.org/stream-shift/-/stream-shift-1.0.1.tgz;downl=
oadfilename=3Dnpm2/stream-shift-1.0.1.tgz;sha512sum=3D0228aca05a90d2f6c6719=
8103d8d5c74fd88efa82569503f45ab984781b8b613458244eaafdd325d3a382d85fad0997e=
b0894f3471dd192c28d3502f6ca51255;subdir=3Dgit/node_modules/stream-shift;str=
iplevel=3D1 \
+    https://registry.npmjs.org/stream-via/-/stream-via-1.0.4.tgz;downloadf=
ilename=3Dnpm2/stream-via-1.0.4.tgz;sha512sum=3D0c1a74952bd7e46f4a1910d3911=
fd1f9adbd1fe5a4db122d385f8ca592cb34359b115f6d18f9ea2cfc471188e68b3f311ad247=
448aa623e8428e6373aa80389d;subdir=3Dgit/node_modules/stream-via;striplevel=
=3D1 \
+    https://registry.npmjs.org/streamsearch/-/streamsearch-0.1.2.tgz;downl=
oadfilename=3Dnpm2/streamsearch-0.1.2.tgz;sha1sum=3D808b9d0e56fc273d809ba57=
338e929919a1a9f1a;subdir=3Dgit/node_modules/streamsearch;striplevel=3D1 \
+    https://registry.npmjs.org/string-template/-/string-template-0.2.1.tgz=
;downloadfilename=3Dnpm2/string-template-0.2.1.tgz;sha1sum=3D42932e598a352d=
01fc22ec3367d9d84eec6c9add;subdir=3Dgit/node_modules/string-template;stripl=
evel=3D1 \
+    https://registry.npmjs.org/string-width/-/string-width-3.1.0.tgz;downl=
oadfilename=3Dnpm2/string-width-3.1.0.tgz;sha512sum=3Dbda7dcbfa2a3559292833=
d3aa0cfc7e860c1ac0b73f2f76141a9068c522f36b1c0eb2dc7085d422272f2f902eaf1d4c9=
3d0d5bf8a0d4a8315cb647515b8e1ed7;subdir=3Dgit/node_modules/nyc/node_modules=
/string-width;striplevel=3D1 \
+    https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz;downl=
oadfilename=3Dnpm2/string-width-4.2.3.tgz;sha512sum=3Dc0ac90450a63274b08a7a=
d84ad265d1ac8cc256b1aa79a1136284786ee86ec954effd8c807a5327af2feb57b8eaab9e0=
f23fdcc4a4d6c96530bd24eb8a2673fe;subdir=3Dgit/node_modules/string-width;str=
iplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dgit/node_modules/body/node_modules/str=
ing_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dgit/node_modules/busboy/node_modules/s=
tring_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dgit/node_modules/dicer/node_modules/st=
ring_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dgit/node_modules/jshint/node_modules/s=
tring_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/archiver-u=
tils/node_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/lazystream=
/node_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/multer/nod=
e_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/node-red-n=
ode-test-helper/node_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/pumpify/no=
de_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dgit/node_modules/through2/n=
ode_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.3.0.tgz;sha512sum=3D864457f14d568c9=
15df0bb03276c90ff0596c5aa2912c0015355df90cf00fa3d3ef392401a9a6dd7a72bd56860=
e8a21b6f8a2453a32a97a04e8febaea7fc0a78;subdir=3Dgit/node_modules/string_dec=
oder;striplevel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-3.0.1.tgz;sha1sum=3D6a385fb8853d952d5ff05d0e8aaf9=
4278dc63dcf;subdir=3Dgit/node_modules/grunt-contrib-concat/node_modules/str=
ip-ansi;striplevel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-3.0.1.tgz;sha1sum=3D6a385fb8853d952d5ff05d0e8aaf9=
4278dc63dcf;subdir=3Dgit/node_modules/grunt-contrib-copy/node_modules/strip=
-ansi;striplevel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-3.0.1.tgz;sha1sum=3D6a385fb8853d952d5ff05d0e8aaf9=
4278dc63dcf;subdir=3Dgit/node_modules/maxmin/node_modules/strip-ansi;stripl=
evel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-5.2.0.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-5.2.0.tgz;sha512sum=3D0ee46cd6029b06ab0c288665adf=
7f096e83c30791c9e98ece553e62f53c087e980df45340d3a2d7c3674776514b17a4f98f98c=
309e96efbdcc680dc9fa56e258;subdir=3Dgit/node_modules/nyc/node_modules/strip=
-ansi;striplevel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-6.0.1.tgz;sha512sum=3D637f153d21dcaa416b0a916743d=
bee4979aabaebf9a1738aa46793e9a1abaf7a3719cf409556ba2417d448e0a76f1186645fbf=
d28a08ecaacfb944b3b54754e4;subdir=3Dgit/node_modules/strip-ansi;striplevel=
=3D1 \
+    https://registry.npmjs.org/strip-bom/-/strip-bom-3.0.0.tgz;downloadfil=
ename=3Dnpm2/strip-bom-3.0.0.tgz;sha1sum=3D2334c18e9c759f7bdd56fdef7e9ae3d5=
88e68ed3;subdir=3Dgit/node_modules/strip-bom;striplevel=3D1 \
+    https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-1=
.0.4.tgz;downloadfilename=3Dnpm2/strip-json-comments-1.0.4.tgz;sha1sum=3D1e=
15fbcac97d3ee99bf2d73b4c656b082bbafb91;subdir=3Dgit/node_modules/jshint/nod=
e_modules/strip-json-comments;striplevel=3D1 \
+    https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-2=
.0.1.tgz;downloadfilename=3Dnpm2/strip-json-comments-2.0.1.tgz;sha1sum=3D3c=
531942e908c2697c0ec344858c286c7ca0a60a;subdir=3Dgit/node_modules/rc/node_mo=
dules/strip-json-comments;striplevel=3D1 \
+    https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3=
.1.1.tgz;downloadfilename=3Dnpm2/strip-json-comments-3.1.1.tgz;sha512sum=3D=
e9f3dcf91e22870a8fe8dfda22fd9fd60307f25395b56407a2a0b8c8aea8483555a1cba602c=
7c2aa39179ea89832198cc12fe61072e9ed57a196ddea97a9448a;subdir=3Dgit/node_mod=
ules/strip-json-comments;striplevel=3D1 \
+    https://registry.npmjs.org/superagent/-/superagent-3.8.3.tgz;downloadf=
ilename=3Dnpm2/superagent-3.8.3.tgz;sha512sum=3D18b42d2cc0a81082b8783bfa386=
b643a848cb770fea2ad32dddb3132e62e0ef68d52fb93f1e141b8b99f4748986331c2d5ef21=
a730ba66cc5bb8fe8321a94c14;subdir=3Dgit/node_modules/node-red-node-test-hel=
per/node_modules/superagent;striplevel=3D1 \
+    https://registry.npmjs.org/superagent/-/superagent-6.1.0.tgz;downloadf=
ilename=3Dnpm2/superagent-6.1.0.tgz;sha512sum=3D3940c712cb22ae6a65a3717ed47=
58a52b523be742e03e9d923a8bf24905d5dbe5eabd232110c0fc8fa6a343f924acc5fe93ca0=
a41124523212551378fd53a97a;subdir=3Dgit/node_modules/superagent;striplevel=
=3D1 \
+    https://registry.npmjs.org/supertest/-/supertest-4.0.2.tgz;downloadfil=
ename=3Dnpm2/supertest-4.0.2.tgz;sha512sum=3Dd4101bbeb399b06037613096a9b9a1=
d782f4604ab41062025ff9c19df91f5499fb4abc50575237a4c6234b31bdcbfed953657d756=
ab2aa4d8f3b0c656f4f5db9;subdir=3Dgit/node_modules/node-red-node-test-helper=
/node_modules/supertest;striplevel=3D1 \
+    https://registry.npmjs.org/supertest/-/supertest-6.1.6.tgz;downloadfil=
ename=3Dnpm2/supertest-6.1.6.tgz;sha512sum=3Dd21002606349f0e1d183c091213799=
39d6e3babecd2ee36cd26063561769c62ee13fab774086ceccb38de514d4999732d88f6b8ae=
208dfe3ebd82ef2cedac822;subdir=3Dgit/node_modules/supertest;striplevel=3D1 =
\
+    https://registry.npmjs.org/supports-color/-/supports-color-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-2.0.0.tgz;sha1sum=3D535d045ce6b6363fa=
40117084629995e9df324c7;subdir=3Dgit/node_modules/grunt-contrib-concat/node=
_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-2.0.0.tgz;sha1sum=3D535d045ce6b6363fa=
40117084629995e9df324c7;subdir=3Dgit/node_modules/grunt-contrib-copy/node_m=
odules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-2.0.0.tgz;sha1sum=3D535d045ce6b6363fa=
40117084629995e9df324c7;subdir=3Dgit/node_modules/maxmin/node_modules/suppo=
rts-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-5.5.0.tgz;sha512sum=3D423563c1d5c8b78=
d3c308880a825f8a142ac814d84a801b3b363e9926e1a4186e39be644584716e127c5353af8=
b8c35999ad1ecb87f99602eb901d1a5f440ca3;subdir=3Dgit/node_modules/@babel/hig=
hlight/node_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-5.5.0.tgz;sha512sum=3D423563c1d5c8b78=
d3c308880a825f8a142ac814d84a801b3b363e9926e1a4186e39be644584716e127c5353af8=
b8c35999ad1ecb87f99602eb901d1a5f440ca3;subdir=3Dgit/node_modules/args/node_=
modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-5.5.0.tgz;sha512sum=3D423563c1d5c8b78=
d3c308880a825f8a142ac814d84a801b3b363e9926e1a4186e39be644584716e127c5353af8=
b8c35999ad1ecb87f99602eb901d1a5f440ca3;subdir=3Dgit/node_modules/grunt-cont=
rib-uglify/node_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-5.5.0.tgz;sha512sum=3D423563c1d5c8b78=
d3c308880a825f8a142ac814d84a801b3b363e9926e1a4186e39be644584716e127c5353af8=
b8c35999ad1ecb87f99602eb901d1a5f440ca3;subdir=3Dgit/node_modules/nodemon/no=
de_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-5.5.0.tgz;sha512sum=3D423563c1d5c8b78=
d3c308880a825f8a142ac814d84a801b3b363e9926e1a4186e39be644584716e127c5353af8=
b8c35999ad1ecb87f99602eb901d1a5f440ca3;subdir=3Dgit/node_modules/simple-cli=
/node_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-6.1.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-6.1.0.tgz;sha512sum=3Da9ed637e6d4c83b=
36afcd4a1e97136e203d744e115b161f10b52c8c7ffd73650fd8b0ed86501a364d8d837bc46=
6841ba88a740f04b4d156e91d208e7557a7ec1;subdir=3Dgit/node_modules/istanbul-l=
ib-report/node_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz;d=
ownloadfilename=3Dnpm2/supports-color-7.2.0.tgz;sha512sum=3Daa9080bd197db2d=
b8e1ef78ab27ec79dc251befe74d6a21a70acd094effe2f0c5cf7ed2adb02f2bf80dfbedf34=
fc33e7da9a8e06c25d0e2a205c647df8ebf047;subdir=3Dgit/node_modules/supports-c=
olor;striplevel=3D1 \
+    https://registry.npmjs.org/supports-color/-/supports-color-8.1.1.tgz;d=
ownloadfilename=3Dnpm2/supports-color-8.1.1.tgz;sha512sum=3D3295043763a876d=
533c6f29097bd9c505ed14391221ec1af4ac546d226bd73945b5862f6088e02ec4a4f4bc513=
048a659e5cd988db95e7ac3e16e371cb7b72d9;subdir=3Dgit/node_modules/mocha/node=
_modules/supports-color;striplevel=3D1 \
+    https://registry.npmjs.org/table-layout/-/table-layout-0.4.5.tgz;downl=
oadfilename=3Dnpm2/table-layout-0.4.5.tgz;sha512sum=3Dcd3bdfd2672082b19e4de=
ff68c9e840a42470103c8604c03a2ab22a818c8db89af46641b2272b98eadf77f2ca9682071=
5f4f213247e674eaa3ea1693df712a5b;subdir=3Dgit/node_modules/table-layout;str=
iplevel=3D1 \
+    https://registry.npmjs.org/taffydb/-/taffydb-2.6.2.tgz;downloadfilenam=
e=3Dnpm2/taffydb-2.6.2.tgz;sha1sum=3D7cbcb64b5a141b6a2efc2c5d2c67b4e150b2a2=
68;subdir=3Dgit/node_modules/taffydb;striplevel=3D1 \
+    https://registry.npmjs.org/tar-stream/-/tar-stream-2.2.0.tgz;downloadf=
ilename=3Dnpm2/tar-stream-2.2.0.tgz;sha512sum=3Dba37aa6dc780060c0c6711099e4=
d870d8d83967519fbda0471bd4acd355f6078a8d1413a746ef59fad1df03d88e2a36f95e5ab=
ad7a668e9b7bbd9785d4b9cc65;subdir=3Dgit/node_modules/tar-stream;striplevel=
=3D1 \
+    https://registry.npmjs.org/tar/-/tar-6.1.11.tgz;downloadfilename=3Dnpm=
2/tar-6.1.11.tgz;sha512sum=3D6a7fca650cd052464292ea0003ae2133dd97d14adbe95a=
51840165943cf3e3853699c0f9b1c993df305ce15815a64ba0179f34f83427f1e0054b2a10b=
74b739c;subdir=3Dgit/node_modules/tar;striplevel=3D1 \
+    https://registry.npmjs.org/temp-path/-/temp-path-1.0.0.tgz;downloadfil=
ename=3Dnpm2/temp-path-1.0.0.tgz;sha1sum=3D24b1543973ab442896d9ad367dd9cbdb=
fafe918b;subdir=3Dgit/node_modules/temp-path;striplevel=3D1 \
+    https://registry.npmjs.org/test-exclude/-/test-exclude-5.2.3.tgz;downl=
oadfilename=3Dnpm2/test-exclude-5.2.3.tgz;sha512sum=3D33ea31b6c78214edc40ed=
01a187ee289e8f70819335ea14c6f3a9800009dccaba2e1e640fa9ab7b591300a1bce74d7da=
ef1c72f017db9a025222be37702ffeda;subdir=3Dgit/node_modules/test-exclude;str=
iplevel=3D1 \
+    https://registry.npmjs.org/test-value/-/test-value-1.1.0.tgz;downloadf=
ilename=3Dnpm2/test-value-1.1.0.tgz;sha1sum=3Da09136f72ec043d27c893707c2b15=
9bfad7de93f;subdir=3Dgit/node_modules/reduce-extract/node_modules/test-valu=
e;striplevel=3D1 \
+    https://registry.npmjs.org/test-value/-/test-value-2.1.0.tgz;downloadf=
ilename=3Dnpm2/test-value-2.1.0.tgz;sha1sum=3D11da6ff670f3471a73b625ca4f3fd=
cf7bb748291;subdir=3Dgit/node_modules/reduce-without/node_modules/test-valu=
e;striplevel=3D1 \
+    https://registry.npmjs.org/test-value/-/test-value-3.0.0.tgz;downloadf=
ilename=3Dnpm2/test-value-3.0.0.tgz;sha512sum=3Db1500274059c664494f71ec03a6=
268e53a84f86c8d2649c7687b0cad1e999e18d595537d631e858c7aec299dc18c8a4f093ebc=
cd87ac3d691a92b36ea707ce4d;subdir=3Dgit/node_modules/test-value;striplevel=
=3D1 \
+    https://registry.npmjs.org/through2/-/through2-2.0.5.tgz;downloadfilen=
ame=3Dnpm2/through2-2.0.5.tgz;sha512sum=3Dfe6ad1a1df31aa903e20748bc86090dac=
f123c78820c47902527a9d63a8b61e1140a53851b642c87ee0553a1bd55eaa9667196fd2bbc=
2d019ce182a78b9ad849;subdir=3Dgit/node_modules/through2;striplevel=3D1 \
+    https://registry.npmjs.org/tiny-lr/-/tiny-lr-1.1.1.tgz;downloadfilenam=
e=3Dnpm2/tiny-lr-1.1.1.tgz;sha512sum=3De38ca1037b6c691a0c3a3410fb9bf999576a=
79ffa41fa4337bd8d3a6ab55b9f8188d8b74f33c99030370c15063de2d6b24c9d1e76231396=
d0b2b4bc1ce0024b8;subdir=3Dgit/node_modules/tiny-lr;striplevel=3D1 \
+    https://registry.npmjs.org/to-fast-properties/-/to-fast-properties-2.0=
.0.tgz;downloadfilename=3Dnpm2/to-fast-properties-2.0.0.tgz;sha1sum=3Ddc5e6=
98cbd079265bc73e0377681a4e4e83f616e;subdir=3Dgit/node_modules/to-fast-prope=
rties;striplevel=3D1 \
+    https://registry.npmjs.org/to-readable-stream/-/to-readable-stream-1.0=
.0.tgz;downloadfilename=3Dnpm2/to-readable-stream-1.0.0.tgz;sha512sum=3D22a=
db95c1b7acc3e67a4f8652d55c614ddff832476fea38370a34dc9331de2f6e6dfd1d468e880=
3383ccab478c542fd3931cfe66376c739e60f72cb3f98ab4d1;subdir=3Dgit/node_module=
s/to-readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz;d=
ownloadfilename=3Dnpm2/to-regex-range-5.0.1.tgz;sha512sum=3Deb93fb8b3e97e72=
12bd5cc1c82f4316db230ed493780ecb974876d678ac3bde2ea86b7493fe2e2fc7c7ab722b4=
3446fed860b29de08c2621aaac00c248d93cb1;subdir=3Dgit/node_modules/to-regex-r=
ange;striplevel=3D1 \
+    https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.0.tgz;downl=
oadfilename=3Dnpm2/toidentifier-1.0.0.tgz;sha512sum=3Dc9a387fcf93f544841596=
4e5848faa5f10c55e57a30c67108a9325cb175af67b61ba56b12d950d714a85c68929d2f718=
9efb5e2659f914d40346bc63dd871b57;subdir=3Dgit/node_modules/toidentifier;str=
iplevel=3D1 \
+    https://registry.npmjs.org/touch/-/touch-3.1.0.tgz;downloadfilename=3D=
npm2/touch-3.1.0.tgz;sha512sum=3D581c7c532e532ed39246d22af8cd37fec283ad708b=
1f1c0372ab923f6738dcb7b4dfff6c7ab8d0048ced8d1cfa16425ecfd0ff8657b20174c118b=
c30654c3d94;subdir=3Dgit/node_modules/touch;striplevel=3D1 \
+    https://registry.npmjs.org/tough-cookie/-/tough-cookie-4.0.0.tgz;downl=
oadfilename=3Dnpm2/tough-cookie-4.0.0.tgz;sha512sum=3Db4776d12940232b73560b=
acc6aa5d7723e80c61622ff1822b7a999bb5f840d6527faa8547fcc0c428148cbd357baadb7=
cc0c2d701d2dfcc8c0086475f297116e;subdir=3Dgit/node_modules/tough-cookie;str=
iplevel=3D1 \
+    https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz;downloadfilename=3Dnp=
m2/tr46-0.0.3.tgz;sha1sum=3D8184fd347dac9cdc185992f3a6622e14b9d9ab6a;subdir=
=3Dgit/node_modules/tr46;striplevel=3D1 \
+    https://registry.npmjs.org/tslib/-/tslib-2.3.1.tgz;downloadfilename=3D=
npm2/tslib-2.3.1.tgz;sha512sum=3Defb11bc8f3e9333f8544546e00595632d9a051619e=
f54386d99db936a0b08888d184e7f988a1aecd27b93f6c3595aabe164472e29f8f0ae564252=
1a4cd310a57;subdir=3Dgit/node_modules/tslib;striplevel=3D1 \
+    https://registry.npmjs.org/type-detect/-/type-detect-4.0.8.tgz;downloa=
dfilename=3Dnpm2/type-detect-4.0.8.tgz;sha512sum=3Dd1faff9881f57653bec7b4e5=
70ccbe6c80ea28fb30ffbd2d5727875bbf3b828423866a9a65ed74bb02ee8ee6caf6af4b83a=
162868d4a50a0d8cf467b93b839fe;subdir=3Dgit/node_modules/type-detect;striple=
vel=3D1 \
+    https://registry.npmjs.org/type-fest/-/type-fest-0.20.2.tgz;downloadfi=
lename=3Dnpm2/type-fest-0.20.2.tgz;sha512sum=3D35ef9e138af4fe25a7a40c43f39d=
b3dc0f8dd01b7944dfff36327045dd95147126af2c317f9bec66587847a962c65e81fb0cfff=
1dfa669348090dd452242372d;subdir=3Dgit/node_modules/boxen/node_modules/type=
-fest;striplevel=3D1 \
+    https://registry.npmjs.org/type-fest/-/type-fest-0.6.0.tgz;downloadfil=
ename=3Dnpm2/type-fest-0.6.0.tgz;sha512sum=3Dabe301f27611d4a0cbae0af81b9c9e=
99fb69302eff40ba959dd06610476ace6363e5d70538ee0ea3caa5c1913750b4f7f998a6d45=
f0aab87019e290d86508c96;subdir=3Dgit/node_modules/read-pkg/node_modules/typ=
e-fest;striplevel=3D1 \
+    https://registry.npmjs.org/type-fest/-/type-fest-0.8.1.tgz;downloadfil=
ename=3Dnpm2/type-fest-0.8.1.tgz;sha512sum=3De1d6f3233aaf8ed822339af0d64e6b=
107b4100d2a676e7611b20446a3374d5f13285a00886ca0a372eb2efe20df7721fa45b7063d=
8aa8bb903fb1c0a850b0d24;subdir=3Dgit/node_modules/type-fest;striplevel=3D1 =
\
+    https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz;downloadfilena=
me=3Dnpm2/type-is-1.6.18.tgz;sha512sum=3D4e444aafdb144f1107f0c75fb8248fed58=
b3272cd134c8e3d89d9da3626bdcaca6e7df0955d124b2eccf4029e514f5b8932f50fa203e9=
9af411a6d3a5d0072f2;subdir=3Dgit/node_modules/type-is;striplevel=3D1 \
+    https://registry.npmjs.org/typedarray-to-buffer/-/typedarray-to-buffer=
-3.1.5.tgz;downloadfilename=3Dnpm2/typedarray-to-buffer-3.1.5.tgz;sha512sum=
=3Dcddbbc5cc3440dea4a291f9760e5c054fb56ba2d25cb436da2152c730f9499a1e20164fc=
86b575aebfff1fa57ed03bc9dce435f52f7bf4cd2568b7d7f2b9bcd9;subdir=3Dgit/node_=
modules/typedarray-to-buffer;striplevel=3D1 \
+    https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz;downloadf=
ilename=3Dnpm2/typedarray-0.0.6.tgz;sha1sum=3D867ac74e3864187b1d3d47d996a78=
ec5c8830777;subdir=3Dgit/node_modules/typedarray;striplevel=3D1 \
+    https://registry.npmjs.org/typical/-/typical-2.6.1.tgz;downloadfilenam=
e=3Dnpm2/typical-2.6.1.tgz;sha1sum=3D5c080e5d661cbbe38259d2e70a3c7253e87388=
1d;subdir=3Dgit/node_modules/typical;striplevel=3D1 \
+    https://registry.npmjs.org/typical/-/typical-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/typical-4.0.0.tgz;sha512sum=3D5401f822f43b04315882531dec13d10df2e0=
c59657e0ee1315c44303a10de57edeacd249abe31c204a7c9e9f5a56dc6b089eaac78193615=
7ce58d8dcab066047;subdir=3Dgit/node_modules/command-line-args/node_modules/=
typical;striplevel=3D1 \
+    https://registry.npmjs.org/typical/-/typical-6.0.1.tgz;downloadfilenam=
e=3Dnpm2/typical-6.0.1.tgz;sha512sum=3Dfa0dcd129edf24b7bd0cf6b54c0ac79bd400=
03b61c8999969df02a11a16b062850edea4ebfd8bdf6b8ed81be88cf4c21dd6b900e3b024c3=
7e04681a798737cd4;subdir=3Dgit/node_modules/sort-array/node_modules/typical=
;striplevel=3D1 \
+    https://registry.npmjs.org/uc.micro/-/uc.micro-1.0.6.tgz;downloadfilen=
ame=3Dnpm2/uc.micro-1.0.6.tgz;sha512sum=3Df18ef9a6f4d890b256da15901d7c68a91=
815eea6fd07ef6f144b6274c2feee4a075056a99d524067a70ab3e423cf9030dda6561cc0ba=
bb4c0913702dfa7486c0;subdir=3Dgit/node_modules/uc.micro;striplevel=3D1 \
+    https://registry.npmjs.org/uglify-js/-/uglify-js-3.14.2.tgz;downloadfi=
lename=3Dnpm2/uglify-js-3.14.2.tgz;sha512sum=3Daed3cc96670ee1a81351fcf5d026=
e027593a500a173368166f71a830f3d907ffbf01c91ff25356935d4ae2b622d83d1aa60a054=
4bb5039985bfbf886349ab6e8;subdir=3Dgit/node_modules/uglify-js;striplevel=3D=
1 \
+    https://registry.npmjs.org/uid-safe/-/uid-safe-2.1.5.tgz;downloadfilen=
ame=3Dnpm2/uid-safe-2.1.5.tgz;sha512sum=3D28f1e6e152f97435cacf4d54b8477cf03=
7fe2b3ca76a88522fd7c1874f7a29603148a6500c8dae06b56ab6f44ce2bc2b22b4512ac74b=
34c2ff96769a552462a0;subdir=3Dgit/node_modules/uid-safe;striplevel=3D1 \
+    https://registry.npmjs.org/uid2/-/uid2-0.0.4.tgz;downloadfilename=3Dnp=
m2/uid2-0.0.4.tgz;sha512sum=3D21ebd3bacd126c6c10cd8877f9f46c00c4d554f3a8215=
b9fcda7177073e676595ed63529abb0512fe9b0ddd81e2da9ef199770c1b5a1455e97adc14d=
7419a358;subdir=3Dgit/node_modules/uid2;striplevel=3D1 \
+    https://registry.npmjs.org/unc-path-regex/-/unc-path-regex-0.1.2.tgz;d=
ownloadfilename=3Dnpm2/unc-path-regex-0.1.2.tgz;sha1sum=3De73dd3d7b0d7c5ed8=
6fbac6b0ae7d8c6a69d50fa;subdir=3Dgit/node_modules/unc-path-regex;striplevel=
=3D1 \
+    https://registry.npmjs.org/undefsafe/-/undefsafe-2.0.5.tgz;downloadfil=
ename=3Dnpm2/undefsafe-2.0.5.tgz;sha512sum=3D5b138d0abb2c04cf1348f46a379126=
b2356bb2fe00f17d7627802b06289acafdc3cb21b7665220eb2cacbae498759b15cf74ca713=
8367ddfff52377808757588;subdir=3Dgit/node_modules/undefsafe;striplevel=3D1 =
\
+    https://registry.npmjs.org/underscore.string/-/underscore.string-3.3.5=
.tgz;downloadfilename=3Dnpm2/underscore.string-3.3.5.tgz;sha512sum=3D83e769=
9a09fe5c19de2e65d7a3eb06956e71404b7812b912de681e3761856eb7a661e3014892abf56=
7f6289a654156a23d8fdfec537a6ada2c598366f68beb62;subdir=3Dgit/node_modules/u=
nderscore.string;striplevel=3D1 \
+    https://registry.npmjs.org/underscore/-/underscore-1.13.1.tgz;download=
filename=3Dnpm2/underscore-1.13.1.tgz;sha512sum=3D8734a8015b4917edd9b62157d=
1581f14f1c40d19bb63f40f8c6c8da384d57670d375fb77b6bf211240f6e5ad630be4e34ee1=
3bb641c62a48700a0b3d760041da;subdir=3Dgit/node_modules/underscore;stripleve=
l=3D1 \
+    https://registry.npmjs.org/unique-string/-/unique-string-2.0.0.tgz;dow=
nloadfilename=3Dnpm2/unique-string-2.0.0.tgz;sha512sum=3Db8d69e8ab10fbe9656=
4a0cf0b0f1ad536cd5493ae7ffc2f9abf21ec59987d1e1fa480ef70a6000e54e06c0e453c50=
019b3de530172cda9e2e83cf34ee6065f5a;subdir=3Dgit/node_modules/unique-string=
;striplevel=3D1 \
+    https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz;downl=
oadfilename=3Dnpm2/universalify-0.1.2.tgz;sha512sum=3Dac125e2390970259b2d69=
57eeb5ed607d27add4e9771acc71c5d9fd9d6c98b1e17ce9505d114b765b8f414620e080bda=
e4ffddfc604e61a002435c3ed1acd492;subdir=3Dgit/node_modules/tough-cookie/nod=
e_modules/universalify;striplevel=3D1 \
+    https://registry.npmjs.org/universalify/-/universalify-2.0.0.tgz;downl=
oadfilename=3Dnpm2/universalify-2.0.0.tgz;sha512sum=3D84066c2aaed8cb5d59bb5=
0c4d0ecd68f0ee79cb6662596130d96721051d9754855f05907e4c09fa14d5731ac57a2fa72=
5b99eae6c70faaad190cff59ca5d38a1;subdir=3Dgit/node_modules/universalify;str=
iplevel=3D1 \
+    https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz;downloadfilename=
=3Dnpm2/unpipe-1.0.0.tgz;sha1sum=3Db2bf4ee8514aae6165b4817829d21b2ef49904ec=
;subdir=3Dgit/node_modules/unpipe;striplevel=3D1 \
+    https://registry.npmjs.org/update-notifier/-/update-notifier-5.1.0.tgz=
;downloadfilename=3Dnpm2/update-notifier-5.1.0.tgz;sha512sum=3D22d9c80876de=
321f46a94cb7d6114fac3d6472e677ae9c4365b7f82940dabd7c12d1b5b99bb48b6c3429197=
dd462bd3bd9c6eb17984552cdebe6d52c3f08df1f;subdir=3Dgit/node_modules/update-=
notifier;striplevel=3D1 \
+    https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz;downloadfilename=
=3Dnpm2/uri-js-4.4.1.tgz;sha512sum=3Deeb294cb2df7435c9cf7ca50d430262edc17d7=
4f45ed321f5a55b561da3c5a5d628b549e1e279e8741c77cf78bd9f3172bacf4b3c79c2acf5=
fac2b8b26f9dd06;subdir=3Dgit/node_modules/uri-js;striplevel=3D1 \
+    https://registry.npmjs.org/uri-path/-/uri-path-1.0.0.tgz;downloadfilen=
ame=3Dnpm2/uri-path-1.0.0.tgz;sha1sum=3D9747f018358933c31de0fccfd82d138e672=
62e32;subdir=3Dgit/node_modules/uri-path;striplevel=3D1 \
+    https://registry.npmjs.org/url-parse-lax/-/url-parse-lax-3.0.0.tgz;dow=
nloadfilename=3Dnpm2/url-parse-lax-3.0.0.tgz;sha1sum=3D16b5cafc07dbe3676c1b=
1999177823d6503acb0c;subdir=3Dgit/node_modules/url-parse-lax;striplevel=3D1=
 \
+    https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/util-deprecate-1.0.2.tgz;sha1sum=3D450d4dc9fa70de732=
762fbd2d4a28981419a0ccf;subdir=3Dgit/node_modules/util-deprecate;striplevel=
=3D1 \
+    https://registry.npmjs.org/utils-merge/-/utils-merge-1.0.1.tgz;downloa=
dfilename=3Dnpm2/utils-merge-1.0.1.tgz;sha1sum=3D9f95710f50a267947b2ccc1247=
41c1028427e713;subdir=3Dgit/node_modules/utils-merge;striplevel=3D1 \
+    https://registry.npmjs.org/uuid/-/uuid-3.4.0.tgz;downloadfilename=3Dnp=
m2/uuid-3.4.0.tgz;sha512sum=3D1e3483470ea0644e4932081cb4705c8d56a4d3cf8a115=
8522220f31674fd4bd69e826a7ce52fdb45e0554dbe104c5691369b49f64b9868d8676cd10e=
91b29bfc;subdir=3Dgit/node_modules/nyc/node_modules/uuid;striplevel=3D1 \
+    https://registry.npmjs.org/uuid/-/uuid-8.3.2.tgz;downloadfilename=3Dnp=
m2/uuid-8.3.2.tgz;sha512sum=3Df8d62cd9078c5b2f865853849bdc679fa1c20e9d25ed0=
043ee697cccb52627ef77439345d0da1c12b9f09139175453625f7fdfa42e9a7d2f0385bfe0=
cfb47b7a;subdir=3Dgit/node_modules/uuid;striplevel=3D1 \
+    https://registry.npmjs.org/v8flags/-/v8flags-3.2.0.tgz;downloadfilenam=
e=3Dnpm2/v8flags-3.2.0.tgz;sha512sum=3D987f1eb6282a31f88659d797a5a6aa19fb3a=
067772a71bac1c772fdaa487c999061339c277fa805c25964737a8c2d2f9e35e3b724b45382=
e0fe72fa497c77c26;subdir=3Dgit/node_modules/v8flags;striplevel=3D1 \
+    https://registry.npmjs.org/validate-npm-package-license/-/validate-npm=
-package-license-3.0.4.tgz;downloadfilename=3Dnpm2/validate-npm-package-lic=
ense-3.0.4.tgz;sha512sum=3D0e92a6d948bfc4deff1d0282b69671a11581859f59d24aad=
ca01bc5c280d43c6650e7c6e4265a18f9eba8fc7cde02bb7fc999b86c0e8edf70026ae2cf61=
dbb13;subdir=3Dgit/node_modules/validate-npm-package-license;striplevel=3D1=
 \
+    https://registry.npmjs.org/vary/-/vary-1.1.2.tgz;downloadfilename=3Dnp=
m2/vary-1.1.2.tgz;sha1sum=3D2299f02c6ded30d4a5961b0b9f74524a18f634fc;subdir=
=3Dgit/node_modules/vary;striplevel=3D1 \
+    https://registry.npmjs.org/walk-back/-/walk-back-2.0.1.tgz;downloadfil=
ename=3Dnpm2/walk-back-2.0.1.tgz;sha1sum=3D554e2a9d874fac47a8cb006bf44c2f0c=
4998a0a4;subdir=3Dgit/node_modules/config-master/node_modules/walk-back;str=
iplevel=3D1 \
+    https://registry.npmjs.org/walk-back/-/walk-back-5.1.0.tgz;downloadfil=
ename=3Dnpm2/walk-back-5.1.0.tgz;sha512sum=3D521c69b39c9971535b2c40276fec5a=
10431d8135e5f6a0100f32987a31b6019eea3f0450f35968cd8f440836e32cf3569bb62c3b5=
20ae6bb0fd4aa10cd701c18;subdir=3Dgit/node_modules/walk-back;striplevel=3D1 =
\
+    https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0=
.1.tgz;downloadfilename=3Dnpm2/webidl-conversions-3.0.1.tgz;sha1sum=3D24534=
275e2a7bc6be7bc86611cc16ae0a5654871;subdir=3Dgit/node_modules/webidl-conver=
sions;striplevel=3D1 \
+    https://registry.npmjs.org/websocket-driver/-/websocket-driver-0.7.4.t=
gz;downloadfilename=3Dnpm2/websocket-driver-0.7.4.tgz;sha512sum=3D6f5eca783=
210563bdbd2cb2e4831767185d28368b3b65889e01f5676cb81e89f79daa08f2a69d5ab80f2=
5b99a8b489971c30b57014ffd547b3ac956c2b0e738e;subdir=3Dgit/node_modules/webs=
ocket-driver;striplevel=3D1 \
+    https://registry.npmjs.org/websocket-extensions/-/websocket-extensions=
-0.1.4.tgz;downloadfilename=3Dnpm2/websocket-extensions-0.1.4.tgz;sha512sum=
=3D3aa79d3c818e7ec0e5a37d5437061b08531268ef66f46ff47da2078f9fdd6450cc16a3d3=
731e94c2ac8ecb708e11a10e83ff55b0622976a9fad96e4a868292a6;subdir=3Dgit/node_=
modules/websocket-extensions;striplevel=3D1 \
+    https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz;downloadf=
ilename=3Dnpm2/whatwg-url-5.0.0.tgz;sha1sum=3D966454e8765462e37644d3626f674=
2ce8b70965d;subdir=3Dgit/node_modules/whatwg-url;striplevel=3D1 \
+    https://registry.npmjs.org/which-module/-/which-module-2.0.0.tgz;downl=
oadfilename=3Dnpm2/which-module-2.0.0.tgz;sha1sum=3Dd9ef07dce77b9902b8a3a8f=
a4b31c3e3f7e6e87a;subdir=3Dgit/node_modules/which-module;striplevel=3D1 \
+    https://registry.npmjs.org/which/-/which-1.3.1.tgz;downloadfilename=3D=
npm2/which-1.3.1.tgz;sha512sum=3D1f125d616ab53132106c9de7c3472ab2c1e84cd536=
ebb2a5ac3b866755989710d2b54b4a52139a266875d76fd36661f1c547ee26a3d748e9bbb43=
c9ab3439221;subdir=3Dgit/node_modules/foreground-child/node_modules/which;s=
triplevel=3D1 \
+    https://registry.npmjs.org/which/-/which-1.3.1.tgz;downloadfilename=3D=
npm2/which-1.3.1.tgz;sha512sum=3D1f125d616ab53132106c9de7c3472ab2c1e84cd536=
ebb2a5ac3b866755989710d2b54b4a52139a266875d76fd36661f1c547ee26a3d748e9bbb43=
c9ab3439221;subdir=3Dgit/node_modules/global-prefix/node_modules/which;stri=
plevel=3D1 \
+    https://registry.npmjs.org/which/-/which-1.3.1.tgz;downloadfilename=3D=
npm2/which-1.3.1.tgz;sha512sum=3D1f125d616ab53132106c9de7c3472ab2c1e84cd536=
ebb2a5ac3b866755989710d2b54b4a52139a266875d76fd36661f1c547ee26a3d748e9bbb43=
c9ab3439221;subdir=3Dgit/node_modules/spawn-wrap/node_modules/which;striple=
vel=3D1 \
+    https://registry.npmjs.org/which/-/which-2.0.2.tgz;downloadfilename=3D=
npm2/which-2.0.2.tgz;sha512sum=3D04b2374e5d535b73ef97bd25df2ab763ae22f9ac29=
c17aac181616924a8cb676d782b303fb28fbae15b492e103c7325a6171a3116e6881aa4a34c=
10a34c8e26c;subdir=3Dgit/node_modules/which;striplevel=3D1 \
+    https://registry.npmjs.org/wide-align/-/wide-align-1.1.5.tgz;downloadf=
ilename=3Dnpm2/wide-align-1.1.5.tgz;sha512sum=3D78330e45868f359e2c408bae60f=
0c7750bdfe20c8217dac4115ff23f119fc0f911a1dc048223145174f1fdd7b1f8c7b4c31c79=
dd2f8d8141da3fbcb73069439a;subdir=3Dgit/node_modules/wide-align;striplevel=
=3D1 \
+    https://registry.npmjs.org/widest-line/-/widest-line-3.1.0.tgz;downloa=
dfilename=3Dnpm2/widest-line-3.1.0.tgz;sha512sum=3D36c9a85da96c5950cc1aea71=
679474f246bd7e56638e22ef1d501660e2ad88a33cba3b595abf5c45f7da93eb92138f3e39b=
f0e6da957a70c9e522c830fa40582;subdir=3Dgit/node_modules/widest-line;striple=
vel=3D1 \
+    https://registry.npmjs.org/wordwrap/-/wordwrap-1.0.0.tgz;downloadfilen=
ame=3Dnpm2/wordwrap-1.0.0.tgz;sha1sum=3D27584810891456a4171c8d0226441ade90c=
bcaeb;subdir=3Dgit/node_modules/wordwrap;striplevel=3D1 \
+    https://registry.npmjs.org/wordwrapjs/-/wordwrapjs-3.0.0.tgz;downloadf=
ilename=3Dnpm2/wordwrapjs-3.0.0.tgz;sha512sum=3D98ef17b6ac8fbf29150acaf08f9=
3253955af4a709d4fe0be4156e6e9b96b69d47b244c4085b919ee167d03ef4d52dc334aaae5=
528f5aebbc2cd048882ebbd1a7;subdir=3Dgit/node_modules/wordwrapjs;striplevel=
=3D1 \
+    https://registry.npmjs.org/workerpool/-/workerpool-6.1.5.tgz;downloadf=
ilename=3Dnpm2/workerpool-6.1.5.tgz;sha512sum=3D5dd2a408ad19a9ceb0de24f12dc=
922b89f35b620ffa39ac113f9be9d7a51081fbf4aae03aa47d767fc748d6d360c6d6d1ac7d4=
1976d32726433fe7aeebb85a4b;subdir=3Dgit/node_modules/workerpool;striplevel=
=3D1 \
+    https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-5.1.0.tgz;downloadfil=
ename=3Dnpm2/wrap-ansi-5.1.0.tgz;sha512sum=3D402d7f88dff6fd13d52798d82bc046=
b6d8f9cfcdcb9922a6bdbbeb5cf3422d94846f7d8a2950c90e5fcc3add8dd35a94d87fc5933=
11af4f2ada3506a0e3b5ded;subdir=3Dgit/node_modules/nyc/node_modules/wrap-ans=
i;striplevel=3D1 \
+    https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz;downloadfil=
ename=3Dnpm2/wrap-ansi-7.0.0.tgz;sha512sum=3D6151888f691a98b493c70e8db198e8=
0717d2c2c9f4c9c75eb26738a7e436d5ce733ee675a65f8d7f155dc4fb5d1ef98d54e43a5d2=
606e0052dcadfc58bb0f5e9;subdir=3Dgit/node_modules/wrap-ansi;striplevel=3D1 =
\
+    https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz;downloadfilename=
=3Dnpm2/wrappy-1.0.2.tgz;sha1sum=3Db5243d8f3ec1aa35f1364605bc0d1036e30ab69f=
;subdir=3Dgit/node_modules/wrappy;striplevel=3D1 \
+    https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-2.4.3=
.tgz;downloadfilename=3Dnpm2/write-file-atomic-2.4.3.tgz;sha512sum=3D19a113=
1f9c30b17f86727ce13e029c2a327a3360aadff899a755b263f5f5092aab5be8d534cf58ec3=
f040b6b0ce191bf57cc199529e226708a58f981600b9c45;subdir=3Dgit/node_modules/w=
rite-file-atomic;striplevel=3D1 \
+    https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-3.0.3=
.tgz;downloadfilename=3Dnpm2/write-file-atomic-3.0.3.tgz;sha512sum=3D02f1dc=
c99e499d27eade2a12ca3ac1907f725b89bb03293cffd332fc30fda2729ebbff787f0acca1c=
7a63b64002450259e70cdf990d2f998c0479b9ad7f3d5fd;subdir=3Dgit/node_modules/c=
onfigstore/node_modules/write-file-atomic;striplevel=3D1 \
+    https://registry.npmjs.org/ws/-/ws-7.5.1.tgz;downloadfilename=3Dnpm2/w=
s-7.5.1.tgz;sha512sum=3Dd9ce9f68e507fe786840de9a6f0325a05ec8ca5d194b613d1c6=
b6c88bad69f4cce38c5a586d0e675ffee8a10edea39ee0b182dc0604dcba3a7b28cb6b363b6=
3b;subdir=3Dgit/node_modules/ws;striplevel=3D1 \
+    https://registry.npmjs.org/xdg-basedir/-/xdg-basedir-4.0.0.tgz;downloa=
dfilename=3Dnpm2/xdg-basedir-4.0.0.tgz;sha512sum=3D3d23611090de8d9615ee1e74=
06884bd3d12bf5568879faf62cc01fdce126a429233a2df8798c906005d44e3110b5925329c=
17413650a4e1fa8b032ec80d8a6f5;subdir=3Dgit/node_modules/xdg-basedir;striple=
vel=3D1 \
+    https://registry.npmjs.org/xml2js/-/xml2js-0.4.23.tgz;downloadfilename=
=3Dnpm2/xml2js-0.4.23.tgz;sha512sum=3Dc923e2323334fa92c37ed1e05d8e01cb4bacc=
08dd23ca2c3c3f8b75176e73bc33fa76f33a9ec425283e6405ad80feff5073846252b368b51=
1158a240b622ebba;subdir=3Dgit/node_modules/xml2js;striplevel=3D1 \
+    https://registry.npmjs.org/xmlbuilder/-/xmlbuilder-11.0.1.tgz;download=
filename=3Dnpm2/xmlbuilder-11.0.1.tgz;sha512sum=3D7c396c23f905131ee02ef6de7=
1cd3fa212c6e747ee810a7caf21f3313b96f6f49ad462745d858a9e1b14c7ba227b71bdf3ea=
f9e9a4d0214078921b78d91dc9bc;subdir=3Dgit/node_modules/xmlbuilder;stripleve=
l=3D1 \
+    https://registry.npmjs.org/xmlcreate/-/xmlcreate-2.0.4.tgz;downloadfil=
ename=3Dnpm2/xmlcreate-2.0.4.tgz;sha512sum=3D9eab8e79b1b8b2780f9863c80934b9=
127c6a84a6c29b3e4ec7986cb332364fa539a9dac98b305cfb48a56121234d2cd4d3265c9af=
a69ced5deff9025e5f53076;subdir=3Dgit/node_modules/xmlcreate;striplevel=3D1 =
\
+    https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz;downloadfilename=3D=
npm2/xtend-4.0.2.tgz;sha512sum=3D2ca614d620172575200179fd5118e2bbe316872517=
1ecbdfa7b99cb989bd75250a2b4fc28edad4c050310fcdbf98259bb4bb068c521a774c08b28=
778ceb4c011;subdir=3Dgit/node_modules/xtend;striplevel=3D1 \
+    https://registry.npmjs.org/y18n/-/y18n-4.0.3.tgz;downloadfilename=3Dnp=
m2/y18n-4.0.3.tgz;sha512sum=3D24a86a4cec12aea340d4d639952ced2751ab06252874b=
326219b8b88368c449fa2b4577e001544f170633af2162fead2a8d0c2ef82c24859a56ff538=
519e2125;subdir=3Dgit/node_modules/nyc/node_modules/y18n;striplevel=3D1 \
+    https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz;downloadfilename=3Dnp=
m2/y18n-5.0.8.tgz;sha512sum=3Dd297c5cde81e0d62472480264cb44fd83c078dd179b3b=
8e8f6dbb3b5d43102120d09dbd2fb79c620da8f774d00a61a8947fd0b8403544baffeed209b=
f7c60e7c;subdir=3Dgit/node_modules/y18n;striplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-2.1.2.tgz;downloadfilenam=
e=3Dnpm2/yallist-2.1.2.tgz;sha1sum=3D1c11f9218f076089a47dd512f93c6699a6a81d=
52;subdir=3Dgit/node_modules/yallist;striplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dgit/node_modules/minipass/node_modules/yallist;s=
triplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dgit/node_modules/minizlib/node_modules/yallist;s=
triplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dgit/node_modules/node-red-node-test-helper/node_=
modules/yallist;striplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dgit/node_modules/semver/node_modules/yallist;str=
iplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dgit/node_modules/tar/node_modules/yallist;stripl=
evel=3D1 \
+    https://registry.npmjs.org/yargs-parser/-/yargs-parser-13.1.2.tgz;down=
loadfilename=3Dnpm2/yargs-parser-13.1.2.tgz;sha512sum=3Dde56ec3517ff8fe0384=
2e4997c3440ec74527d6af33b4623a9325de648c0ab7ed97a9d421206989ab1fd4371b03e20=
7d707c9dd58d54c208068491a8c62a5bce;subdir=3Dgit/node_modules/nyc/node_modul=
es/yargs-parser;striplevel=3D1 \
+    https://registry.npmjs.org/yargs-parser/-/yargs-parser-20.2.4.tgz;down=
loadfilename=3Dnpm2/yargs-parser-20.2.4.tgz;sha512sum=3D58e92980d84f4e513bd=
e1e1514016c3a7a262556a8bcef15a8b0f3cb9b1a0a1441150141a0c622ae8c325be43d1c1e=
07145e19ed5653886de24b3249036f7244;subdir=3Dgit/node_modules/yargs-parser;s=
triplevel=3D1 \
+    https://registry.npmjs.org/yargs-unparser/-/yargs-unparser-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/yargs-unparser-2.0.0.tgz;sha512sum=3Dee9453200f50735=
71a6746d9e9161119b1c9b61256b9a91ff969872b4ad578b90daeb1a17e869b04d76e7ba91d=
20d23aaf889fee872af5a0ff9fbc7028e77338;subdir=3Dgit/node_modules/yargs-unpa=
rser;striplevel=3D1 \
+    https://registry.npmjs.org/yargs/-/yargs-13.3.2.tgz;downloadfilename=
=3Dnpm2/yargs-13.3.2.tgz;sha512sum=3D017dd9c3988faee37989eeb119120382a913f9=
986746564c2cc1c0b3cb60ee746bbb2d8d6fe8b9a3d6f082102882d334f2ad5da6bd8b5684b=
c2924cc62959753;subdir=3Dgit/node_modules/nyc/node_modules/yargs;striplevel=
=3D1 \
+    https://registry.npmjs.org/yargs/-/yargs-16.2.0.tgz;downloadfilename=
=3Dnpm2/yargs-16.2.0.tgz;sha512sum=3D0f59afbed0c6d0be5fb7f8c65a42e91b5fa6d1=
e43139f681bd33442eb6968f6db049550c5b1654bd880961c2a1ea3186224245847e0864f42=
14784caa5cf2607;subdir=3Dgit/node_modules/yargs;striplevel=3D1 \
+    https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz;downloa=
dfilename=3Dnpm2/yocto-queue-0.1.0.tgz;sha512sum=3Dad592cbec9cd09d27fa2119c=
eb180fc3237c7a1782c6c88b33c9b1b84fedfe6395a897b03ee3b59a22e94c74224604ca08b=
7b12f831e00555a82db3b1e6359d9;subdir=3Dgit/node_modules/yocto-queue;striple=
vel=3D1 \
+    https://registry.npmjs.org/zip-stream/-/zip-stream-4.1.0.tgz;downloadf=
ilename=3Dnpm2/zip-stream-4.1.0.tgz;sha512sum=3Dcec873c105bb806ee18e906581e=
40ff51bb23c6371bc977347c494337421c429cb8d637613b8f774ebe9783710a044df1f1d2e=
ad14bb12d9954e8aa5ed8a54e0;subdir=3Dgit/node_modules/zip-stream;striplevel=
=3D1 \
+    "
+
+# Modify these as desired
+PV =3D "2.1.3+git${SRCPV}"
+SRCREV_FORMAT =3D "main"
+SRCREV_main =3D "9439cd0e3d57ad103cef28618783f0d609441dbc"
+
+S =3D "${WORKDIR}/git"
+
+inherit npm_test
+
+LICENSE:${PN} =3D "BSD-3-Clause Apache-2.0 MIT"
+LICENSE:${PN}-babel-code-frame =3D "MIT"
+LICENSE:${PN}-babel-generator =3D "MIT"
+LICENSE:${PN}-babel-helper-function-name =3D "MIT"
+LICENSE:${PN}-babel-helper-get-function-arity =3D "MIT"
+LICENSE:${PN}-babel-helper-hoist-variables =3D "MIT"
+LICENSE:${PN}-babel-helper-split-export-declaration =3D "MIT"
+LICENSE:${PN}-babel-helper-validator-identifier =3D "MIT"
+LICENSE:${PN}-babel-highlight-ansi-styles =3D "MIT"
+LICENSE:${PN}-babel-highlight-chalk =3D "MIT"
+LICENSE:${PN}-babel-highlight-color-convert =3D "MIT"
+LICENSE:${PN}-babel-highlight-color-name =3D "MIT"
+LICENSE:${PN}-babel-highlight-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-babel-highlight-has-flag =3D "MIT"
+LICENSE:${PN}-babel-highlight-supports-color =3D "MIT"
+LICENSE:${PN}-babel-highlight =3D "MIT"
+LICENSE:${PN}-babel-parser =3D "MIT"
+LICENSE:${PN}-babel-runtime =3D "MIT"
+LICENSE:${PN}-babel-template =3D "MIT"
+LICENSE:${PN}-babel-traverse-debug =3D "MIT"
+LICENSE:${PN}-babel-traverse-ms =3D "MIT"
+LICENSE:${PN}-babel-traverse =3D "MIT"
+LICENSE:${PN}-babel-types =3D "MIT"
+LICENSE:${PN}-mapbox-node-pre-gyp =3D "BSD-3-Clause"
+LICENSE:${PN}-prantlf-jsonlint-ajv =3D "MIT"
+LICENSE:${PN}-prantlf-jsonlint-fast-deep-equal =3D "MIT"
+LICENSE:${PN}-prantlf-jsonlint-json-schema-traverse =3D "MIT"
+LICENSE:${PN}-prantlf-jsonlint =3D "MIT"
+LICENSE:${PN}-sindresorhus-is =3D "MIT"
+LICENSE:${PN}-sinonjs-commons =3D "BSD-3-Clause"
+LICENSE:${PN}-sinonjs-fake-timers =3D "BSD-3-Clause"
+LICENSE:${PN}-sinonjs-samsam =3D "BSD-3-Clause"
+LICENSE:${PN}-sinonjs-text-encoding =3D "Apache-2.0 & Unlicense"
+LICENSE:${PN}-szmarczak-http-timer =3D "MIT"
+LICENSE:${PN}-types-cacheable-request =3D "MIT"
+LICENSE:${PN}-types-http-cache-semantics =3D "MIT"
+LICENSE:${PN}-types-keyv =3D "MIT"
+LICENSE:${PN}-types-node =3D "MIT"
+LICENSE:${PN}-types-normalize-package-data =3D "MIT"
+LICENSE:${PN}-types-responselike =3D "MIT"
+LICENSE:${PN}-ungap-promise-all-settled =3D "ISC"
+LICENSE:${PN}-abbrev =3D "ISC | MIT"
+LICENSE:${PN}-accepts =3D "MIT"
+LICENSE:${PN}-acorn =3D "MIT"
+LICENSE:${PN}-acorn-walk =3D "MIT"
+LICENSE:${PN}-adm-zip =3D "MIT"
+LICENSE:${PN}-agent-base-debug =3D "MIT"
+LICENSE:${PN}-agent-base-ms =3D "MIT"
+LICENSE:${PN}-agent-base =3D "MIT"
+LICENSE:${PN}-ajv =3D "MIT"
+LICENSE:${PN}-ansi-align =3D "ISC"
+LICENSE:${PN}-ansi-colors =3D "MIT"
+LICENSE:${PN}-ansi-escape-sequences-array-back =3D "MIT"
+LICENSE:${PN}-ansi-escape-sequences =3D "MIT"
+LICENSE:${PN}-ansi-regex =3D "MIT"
+LICENSE:${PN}-ansi-styles =3D "MIT"
+LICENSE:${PN}-anymatch =3D "ISC"
+LICENSE:${PN}-append-field =3D "MIT"
+LICENSE:${PN}-append-transform =3D "MIT"
+LICENSE:${PN}-aproba =3D "ISC"
+LICENSE:${PN}-archiver-async =3D "MIT"
+LICENSE:${PN}-archiver =3D "MIT"
+LICENSE:${PN}-archiver-utils-readable-stream =3D "MIT"
+LICENSE:${PN}-archiver-utils-stringdecoder =3D " MIT"
+LICENSE:${PN}-archiver-utils =3D "MIT"
+LICENSE:${PN}-archy =3D "MIT"
+LICENSE:${PN}-are-we-there-yet =3D "ISC"
+LICENSE:${PN}-argparse =3D "MIT"
+LICENSE:${PN}-args-ansi-styles =3D "MIT"
+LICENSE:${PN}-args-chalk =3D "MIT"
+LICENSE:${PN}-args-color-convert =3D "MIT"
+LICENSE:${PN}-args-color-name =3D "MIT"
+LICENSE:${PN}-args-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-args-has-flag =3D "MIT"
+LICENSE:${PN}-args-supports-color =3D "MIT"
+LICENSE:${PN}-args =3D "MIT"
+LICENSE:${PN}-array-back =3D "MIT"
+LICENSE:${PN}-array-each =3D "MIT"
+LICENSE:${PN}-array-flatten =3D "MIT"
+LICENSE:${PN}-array-slice =3D "MIT"
+LICENSE:${PN}-arrify =3D "MIT"
+LICENSE:${PN}-async =3D "MIT"
+LICENSE:${PN}-async-mutex =3D "MIT"
+LICENSE:${PN}-asynckit =3D "MIT"
+LICENSE:${PN}-axios =3D "MIT"
+LICENSE:${PN}-balanced-match =3D "MIT"
+LICENSE:${PN}-base64-js =3D "MIT"
+LICENSE:${PN}-basic-auth =3D "MIT"
+LICENSE:${PN}-basic-auth-parser =3D "MIT"
+LICENSE:${PN}-bcrypt =3D "MIT"
+LICENSE:${PN}-bcryptjs =3D "BSD-3-Clause & MIT"
+LICENSE:${PN}-binary-extensions =3D "MIT"
+LICENSE:${PN}-bl =3D "MIT"
+LICENSE:${PN}-bluebird =3D "MIT"
+LICENSE:${PN}-body-bytes =3D "MIT"
+LICENSE:${PN}-body-raw-body =3D "Unknown"
+LICENSE:${PN}-body-stringdecoder =3D "MIT"
+LICENSE:${PN}-body =3D "MIT"
+LICENSE:${PN}-body-parser-iconv-lite =3D "MIT"
+LICENSE:${PN}-body-parser-raw-body =3D "MIT"
+LICENSE:${PN}-body-parser =3D "MIT"
+LICENSE:${PN}-boolbase =3D "Unknown"
+LICENSE:${PN}-boxen-camelcase =3D "MIT"
+LICENSE:${PN}-boxen-type-fest =3D "MIT"
+LICENSE:${PN}-boxen =3D "MIT"
+LICENSE:${PN}-brace-expansion =3D "MIT"
+LICENSE:${PN}-braces =3D "MIT"
+LICENSE:${PN}-browser-stdout =3D "ISC"
+LICENSE:${PN}-buffer =3D "MIT"
+LICENSE:${PN}-buffer-crc32 =3D "MIT"
+LICENSE:${PN}-buffer-from =3D "MIT"
+LICENSE:${PN}-busboy-isarray =3D "MIT"
+LICENSE:${PN}-busboy-readable-stream =3D "MIT"
+LICENSE:${PN}-busboy-stringdecoder =3D "MIT"
+LICENSE:${PN}-busboy =3D "MIT"
+LICENSE:${PN}-bytes =3D "MIT"
+LICENSE:${PN}-cache-point-array-back =3D "MIT"
+LICENSE:${PN}-cache-point =3D "MIT"
+LICENSE:${PN}-cacheable-lookup =3D "MIT"
+LICENSE:${PN}-cacheable-request =3D "MIT"
+LICENSE:${PN}-caching-transform-make-dir =3D "MIT"
+LICENSE:${PN}-caching-transform-semver =3D "ISC"
+LICENSE:${PN}-caching-transform =3D "MIT"
+LICENSE:${PN}-call-bind =3D "MIT"
+LICENSE:${PN}-camelcase =3D "MIT"
+LICENSE:${PN}-catharsis =3D "MIT"
+LICENSE:${PN}-chalk =3D "MIT"
+LICENSE:${PN}-cheerio =3D "MIT"
+LICENSE:${PN}-cheerio-select =3D "BSD-2-Clause"
+LICENSE:${PN}-chokidar =3D "MIT"
+LICENSE:${PN}-chownr =3D "ISC"
+LICENSE:${PN}-ci-info =3D "MIT"
+LICENSE:${PN}-cli =3D "Unknown"
+LICENSE:${PN}-cli-boxes =3D "MIT"
+LICENSE:${PN}-cli-table-colors =3D "MIT"
+LICENSE:${PN}-cli-table =3D "MIT"
+LICENSE:${PN}-cliui =3D "ISC"
+LICENSE:${PN}-clone =3D "MIT"
+LICENSE:${PN}-clone-response =3D "MIT"
+LICENSE:${PN}-collect-all =3D "MIT"
+LICENSE:${PN}-color-convert =3D "MIT"
+LICENSE:${PN}-color-name =3D "MIT"
+LICENSE:${PN}-color-support =3D "ISC"
+LICENSE:${PN}-colors =3D "MIT"
+LICENSE:${PN}-combined-stream =3D "MIT"
+LICENSE:${PN}-command-line-args-array-back =3D "MIT"
+LICENSE:${PN}-command-line-args-typical =3D "MIT"
+LICENSE:${PN}-command-line-args =3D "MIT"
+LICENSE:${PN}-command-line-tool-array-back =3D "MIT"
+LICENSE:${PN}-command-line-tool =3D "MIT"
+LICENSE:${PN}-command-line-usage-array-back =3D "MIT"
+LICENSE:${PN}-command-line-usage =3D "MIT"
+LICENSE:${PN}-commander =3D "MIT"
+LICENSE:${PN}-commist =3D "MIT"
+LICENSE:${PN}-common-sequence =3D "MIT"
+LICENSE:${PN}-commondir =3D "MIT"
+LICENSE:${PN}-component-emitter =3D "MIT"
+LICENSE:${PN}-compress-commons =3D "MIT"
+LICENSE:${PN}-concat-map =3D "MIT"
+LICENSE:${PN}-concat-stream =3D "MIT"
+LICENSE:${PN}-config-master-walk-back =3D "MIT"
+LICENSE:${PN}-config-master =3D "MIT"
+LICENSE:${PN}-configstore-write-file-atomic =3D "ISC"
+LICENSE:${PN}-configstore =3D "BSD-2-Clause"
+LICENSE:${PN}-console-browserify =3D "MIT"
+LICENSE:${PN}-console-control-strings =3D "ISC"
+LICENSE:${PN}-content-disposition =3D "MIT"
+LICENSE:${PN}-content-type =3D "MIT"
+LICENSE:${PN}-continuable-cache =3D "MIT"
+LICENSE:${PN}-convert-source-map =3D "MIT"
+LICENSE:${PN}-cookie =3D "MIT"
+LICENSE:${PN}-cookie-parser-cookie =3D "MIT"
+LICENSE:${PN}-cookie-parser =3D "MIT"
+LICENSE:${PN}-cookie-signature =3D "MIT"
+LICENSE:${PN}-cookiejar =3D "MIT"
+LICENSE:${PN}-core-util-is =3D "MIT"
+LICENSE:${PN}-cors =3D "MIT"
+LICENSE:${PN}-cp-file-make-dir =3D "MIT"
+LICENSE:${PN}-cp-file-semver =3D "ISC"
+LICENSE:${PN}-cp-file =3D "MIT"
+LICENSE:${PN}-crc-32 =3D "Apache-2.0"
+LICENSE:${PN}-crc32-stream =3D "MIT"
+LICENSE:${PN}-cronosjs =3D "ISC"
+LICENSE:${PN}-cross-fetch-node-fetch =3D "MIT"
+LICENSE:${PN}-cross-fetch =3D "MIT"
+LICENSE:${PN}-cross-spawn =3D "MIT"
+LICENSE:${PN}-crypto-random-string =3D "MIT"
+LICENSE:${PN}-css-select =3D "BSD-2-Clause"
+LICENSE:${PN}-css-what =3D "BSD-2-Clause"
+LICENSE:${PN}-date-now =3D "MIT"
+LICENSE:${PN}-dateformat =3D "MIT"
+LICENSE:${PN}-debug =3D "MIT"
+LICENSE:${PN}-decamelize =3D "MIT"
+LICENSE:${PN}-decompress-response-mimic-response =3D "MIT"
+LICENSE:${PN}-decompress-response =3D "MIT"
+LICENSE:${PN}-deep-extend =3D "MIT"
+LICENSE:${PN}-default-require-extensions =3D "MIT"
+LICENSE:${PN}-defer-to-connect =3D "MIT"
+LICENSE:${PN}-delayed-stream =3D "MIT"
+LICENSE:${PN}-delegates =3D "MIT"
+LICENSE:${PN}-denque =3D "Apache-2.0"
+LICENSE:${PN}-depd =3D "MIT"
+LICENSE:${PN}-destroy =3D "MIT"
+LICENSE:${PN}-detect-file =3D "MIT"
+LICENSE:${PN}-detect-libc =3D "Apache-2.0"
+LICENSE:${PN}-dicer-isarray =3D "MIT"
+LICENSE:${PN}-dicer-readable-stream =3D "MIT"
+LICENSE:${PN}-dicer-stringdecoder =3D "MIT"
+LICENSE:${PN}-dicer =3D "MIT"
+LICENSE:${PN}-diff =3D "BSD-3-Clause"
+LICENSE:${PN}-dmd-array-back =3D "MIT"
+LICENSE:${PN}-dmd-marked =3D "MIT & BSD-3-Clause"
+LICENSE:${PN}-dmd =3D "MIT"
+LICENSE:${PN}-dom-serializer =3D "MIT"
+LICENSE:${PN}-domelementtype =3D "BSD-2-Clause"
+LICENSE:${PN}-domhandler =3D "BSD-2-Clause"
+LICENSE:${PN}-dompurify =3D "Apache-2.0 | MPL-2.0"
+LICENSE:${PN}-domutils =3D "BSD-2-Clause"
+LICENSE:${PN}-dot-prop =3D "MIT"
+LICENSE:${PN}-duplexer =3D "MIT"
+LICENSE:${PN}-duplexer3 =3D "BSD-3-Clause"
+LICENSE:${PN}-duplexify =3D "MIT"
+LICENSE:${PN}-ee-first =3D "MIT"
+LICENSE:${PN}-emoji-regex =3D "MIT"
+LICENSE:${PN}-encodeurl =3D "MIT"
+LICENSE:${PN}-end-of-stream =3D "MIT"
+LICENSE:${PN}-enquirer =3D "MIT"
+LICENSE:${PN}-entities =3D "BSD-2-Clause"
+LICENSE:${PN}-error =3D "Unknown"
+LICENSE:${PN}-error-ex =3D "MIT"
+LICENSE:${PN}-es6-error =3D "MIT"
+LICENSE:${PN}-escalade =3D "MIT"
+LICENSE:${PN}-escape-goat =3D "MIT"
+LICENSE:${PN}-escape-html =3D "MIT"
+LICENSE:${PN}-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-esprima =3D "BSD-2-Clause"
+LICENSE:${PN}-etag =3D "MIT"
+LICENSE:${PN}-eventemitter2 =3D "Unknown"
+LICENSE:${PN}-exit =3D "MIT"
+LICENSE:${PN}-exit-on-epipe =3D "Apache-2.0"
+LICENSE:${PN}-expand-tilde =3D "MIT"
+LICENSE:${PN}-express-cookie =3D "MIT"
+LICENSE:${PN}-express =3D "MIT"
+LICENSE:${PN}-express-session-depd =3D "MIT"
+LICENSE:${PN}-express-session-safe-buffer =3D "MIT"
+LICENSE:${PN}-express-session =3D "MIT"
+LICENSE:${PN}-extend =3D "MIT"
+LICENSE:${PN}-fast-deep-equal =3D "MIT"
+LICENSE:${PN}-fast-json-stable-stringify =3D "MIT"
+LICENSE:${PN}-fast-safe-stringify =3D "MIT"
+LICENSE:${PN}-faye-websocket =3D "Unknown"
+LICENSE:${PN}-figures-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-figures =3D "MIT"
+LICENSE:${PN}-file-set-array-back =3D "MIT"
+LICENSE:${PN}-file-set =3D "MIT"
+LICENSE:${PN}-file-sync-cmp =3D "MIT"
+LICENSE:${PN}-fill-range =3D "MIT"
+LICENSE:${PN}-finalhandler =3D "MIT"
+LICENSE:${PN}-find-cache-dir-make-dir =3D "MIT"
+LICENSE:${PN}-find-cache-dir-semver =3D "ISC"
+LICENSE:${PN}-find-cache-dir =3D "MIT"
+LICENSE:${PN}-find-replace-array-back =3D "MIT"
+LICENSE:${PN}-find-replace =3D "MIT"
+LICENSE:${PN}-find-up =3D "MIT"
+LICENSE:${PN}-findup-sync-glob =3D "ISC"
+LICENSE:${PN}-findup-sync =3D "MIT"
+LICENSE:${PN}-fined =3D "MIT"
+LICENSE:${PN}-flagged-respawn =3D "MIT"
+LICENSE:${PN}-flat =3D "BSD-3-Clause"
+LICENSE:${PN}-follow-redirects =3D "MIT"
+LICENSE:${PN}-for-in =3D "MIT"
+LICENSE:${PN}-for-own =3D "MIT"
+LICENSE:${PN}-foreground-child-cross-spawn =3D "MIT"
+LICENSE:${PN}-foreground-child-which =3D "ISC"
+LICENSE:${PN}-foreground-child =3D "ISC"
+LICENSE:${PN}-form-data =3D "MIT"
+LICENSE:${PN}-formidable =3D "MIT"
+LICENSE:${PN}-forwarded =3D "MIT"
+LICENSE:${PN}-fresh =3D "MIT"
+LICENSE:${PN}-fs-constants =3D "MIT"
+LICENSE:${PN}-fs-extra =3D "MIT"
+LICENSE:${PN}-fs-minipass =3D "ISC"
+LICENSE:${PN}-fs-then-native =3D "MIT"
+LICENSE:${PN}-fsnotify =3D "MIT"
+LICENSE:${PN}-fsrealpath =3D "ISC & MIT"
+LICENSE:${PN}-function-bind =3D "MIT"
+LICENSE:${PN}-gauge =3D "ISC"
+LICENSE:${PN}-gaze =3D "MIT"
+LICENSE:${PN}-get-caller-file =3D "ISC"
+LICENSE:${PN}-get-intrinsic =3D "MIT"
+LICENSE:${PN}-get-stream =3D "MIT"
+LICENSE:${PN}-getobject =3D "Unknown"
+LICENSE:${PN}-glob =3D "ISC & CC-BY-SA-4.0"
+LICENSE:${PN}-glob-parent =3D "ISC"
+LICENSE:${PN}-global-dirs =3D "MIT"
+LICENSE:${PN}-global-modules =3D "MIT"
+LICENSE:${PN}-global-prefix-ini =3D "ISC"
+LICENSE:${PN}-global-prefix-which =3D "ISC"
+LICENSE:${PN}-global-prefix =3D "MIT"
+LICENSE:${PN}-globals =3D "MIT"
+LICENSE:${PN}-globule =3D "MIT"
+LICENSE:${PN}-got =3D "MIT"
+LICENSE:${PN}-graceful-fs =3D "ISC"
+LICENSE:${PN}-growl =3D "Unknown"
+LICENSE:${PN}-grunt-iconv-lite =3D "MIT"
+LICENSE:${PN}-grunt-nopt =3D "ISC"
+LICENSE:${PN}-grunt =3D "MIT"
+LICENSE:${PN}-grunt-chmod =3D "MIT"
+LICENSE:${PN}-grunt-cli-nopt =3D "ISC"
+LICENSE:${PN}-grunt-cli =3D "Unknown"
+LICENSE:${PN}-grunt-concurrent-async =3D "MIT"
+LICENSE:${PN}-grunt-concurrent =3D "MIT"
+LICENSE:${PN}-grunt-contrib-clean-async =3D "MIT"
+LICENSE:${PN}-grunt-contrib-clean-rimraf =3D "ISC"
+LICENSE:${PN}-grunt-contrib-clean =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-compress =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-concat-ansi-regex =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat-ansi-styles =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat-chalk =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat-strip-ansi =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat-supports-color =3D "MIT"
+LICENSE:${PN}-grunt-contrib-concat =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-copy-ansi-regex =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy-ansi-styles =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy-chalk =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy-strip-ansi =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy-supports-color =3D "MIT"
+LICENSE:${PN}-grunt-contrib-copy =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-jshint =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-uglify-ansi-styles =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-chalk =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-color-convert =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-color-name =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-has-flag =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify-supports-color =3D "MIT"
+LICENSE:${PN}-grunt-contrib-uglify =3D "Unknown"
+LICENSE:${PN}-grunt-contrib-watch-async =3D "MIT"
+LICENSE:${PN}-grunt-contrib-watch =3D "Unknown"
+LICENSE:${PN}-grunt-jsdoc =3D "MIT"
+LICENSE:${PN}-grunt-jsdoc-to-markdown =3D "MIT"
+LICENSE:${PN}-grunt-jsonlint =3D "MIT"
+LICENSE:${PN}-grunt-known-options =3D "MIT"
+LICENSE:${PN}-grunt-legacy-log =3D "MIT"
+LICENSE:${PN}-grunt-legacy-log-utils =3D "Unknown"
+LICENSE:${PN}-grunt-legacy-util-async =3D "MIT"
+LICENSE:${PN}-grunt-legacy-util =3D "MIT"
+LICENSE:${PN}-grunt-mkdir =3D "MIT"
+LICENSE:${PN}-grunt-npm-command =3D "MIT"
+LICENSE:${PN}-grunt-sass =3D "MIT"
+LICENSE:${PN}-grunt-simple-mocha =3D "MIT"
+LICENSE:${PN}-grunt-simple-nyc =3D "MIT"
+LICENSE:${PN}-gzip-size =3D "MIT"
+LICENSE:${PN}-handlebars-source-map =3D "BSD-3-Clause"
+LICENSE:${PN}-handlebars =3D "MIT"
+LICENSE:${PN}-has =3D "MIT"
+LICENSE:${PN}-has-ansi-ansi-regex =3D "MIT"
+LICENSE:${PN}-has-ansi =3D "MIT"
+LICENSE:${PN}-has-flag =3D "MIT"
+LICENSE:${PN}-has-symbols =3D "MIT"
+LICENSE:${PN}-has-unicode =3D "ISC"
+LICENSE:${PN}-has-yarn =3D "MIT"
+LICENSE:${PN}-hash-sum =3D "MIT"
+LICENSE:${PN}-hasha =3D "MIT"
+LICENSE:${PN}-he =3D "MIT"
+LICENSE:${PN}-help-me =3D "MIT"
+LICENSE:${PN}-homedir-polyfill =3D "MIT"
+LICENSE:${PN}-hooker =3D "MIT"
+LICENSE:${PN}-hosted-git-info =3D "ISC"
+LICENSE:${PN}-hpagent =3D "MIT"
+LICENSE:${PN}-html-escaper =3D "MIT"
+LICENSE:${PN}-htmlparser2 =3D "MIT"
+LICENSE:${PN}-http-cache-semantics =3D "BSD-2-Clause"
+LICENSE:${PN}-http-errors-inherits =3D "ISC"
+LICENSE:${PN}-http-errors =3D "MIT"
+LICENSE:${PN}-http-parser-js =3D "MIT"
+LICENSE:${PN}-http2-wrapper =3D "MIT"
+LICENSE:${PN}-https-proxy-agent-debug =3D "MIT"
+LICENSE:${PN}-https-proxy-agent-ms =3D "MIT"
+LICENSE:${PN}-https-proxy-agent =3D "MIT"
+LICENSE:${PN}-i18next =3D "MIT"
+LICENSE:${PN}-i18next-http-backend =3D "Unknown"
+LICENSE:${PN}-iconv-lite =3D "MIT"
+LICENSE:${PN}-ieee754 =3D "BSD-3-Clause"
+LICENSE:${PN}-ignore-by-default =3D "ISC"
+LICENSE:${PN}-import-lazy =3D "MIT"
+LICENSE:${PN}-imurmurhash =3D "Unknown"
+LICENSE:${PN}-indent-string =3D "MIT"
+LICENSE:${PN}-inflight =3D "ISC"
+LICENSE:${PN}-inherits =3D "ISC"
+LICENSE:${PN}-ini =3D "ISC"
+LICENSE:${PN}-interpret =3D "MIT"
+LICENSE:${PN}-ipaddrjs =3D "MIT"
+LICENSE:${PN}-is-absolute =3D "MIT"
+LICENSE:${PN}-is-arrayish =3D "MIT"
+LICENSE:${PN}-is-binary-path =3D "MIT"
+LICENSE:${PN}-is-ci =3D "MIT"
+LICENSE:${PN}-is-core-module =3D "MIT"
+LICENSE:${PN}-is-extglob =3D "MIT"
+LICENSE:${PN}-is-fullwidth-code-point =3D "MIT"
+LICENSE:${PN}-is-glob =3D "MIT"
+LICENSE:${PN}-is-installed-globally =3D "MIT"
+LICENSE:${PN}-is-npm =3D "MIT"
+LICENSE:${PN}-is-number =3D "MIT"
+LICENSE:${PN}-is-obj =3D "MIT"
+LICENSE:${PN}-is-path-inside =3D "MIT"
+LICENSE:${PN}-is-plain-obj =3D "MIT"
+LICENSE:${PN}-is-plain-object =3D "MIT"
+LICENSE:${PN}-is-relative =3D "MIT"
+LICENSE:${PN}-is-stream =3D "MIT"
+LICENSE:${PN}-is-typedarray =3D "MIT"
+LICENSE:${PN}-is-unc-path =3D "MIT"
+LICENSE:${PN}-is-unicode-supported =3D "MIT"
+LICENSE:${PN}-is-utf8 =3D "MIT"
+LICENSE:${PN}-is-windows =3D "MIT"
+LICENSE:${PN}-is-yarn-global =3D "MIT"
+LICENSE:${PN}-isarray =3D "MIT"
+LICENSE:${PN}-isexe =3D "ISC"
+LICENSE:${PN}-isobject =3D "MIT"
+LICENSE:${PN}-istanbul-lib-coverage =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-lib-hook =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-lib-instrument-semver =3D "ISC"
+LICENSE:${PN}-istanbul-lib-instrument =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-lib-report-has-flag =3D "MIT"
+LICENSE:${PN}-istanbul-lib-report-make-dir =3D "MIT"
+LICENSE:${PN}-istanbul-lib-report-semver =3D "ISC"
+LICENSE:${PN}-istanbul-lib-report-supports-color =3D "MIT"
+LICENSE:${PN}-istanbul-lib-report =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-lib-source-maps-debug =3D "MIT"
+LICENSE:${PN}-istanbul-lib-source-maps-make-dir =3D "MIT"
+LICENSE:${PN}-istanbul-lib-source-maps-ms =3D "MIT"
+LICENSE:${PN}-istanbul-lib-source-maps-rimraf =3D "ISC"
+LICENSE:${PN}-istanbul-lib-source-maps-semver =3D "ISC"
+LICENSE:${PN}-istanbul-lib-source-maps-source-map =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-lib-source-maps =3D "BSD-3-Clause"
+LICENSE:${PN}-istanbul-reports =3D "BSD-3-Clause"
+LICENSE:${PN}-jquery-i18next =3D "MIT"
+LICENSE:${PN}-js-tokens =3D "MIT"
+LICENSE:${PN}-js-yaml =3D "MIT"
+LICENSE:${PN}-js2xmlparser =3D "Apache-2.0"
+LICENSE:${PN}-jsdoc-marked =3D "MIT & BSD-3-Clause"
+LICENSE:${PN}-jsdoc =3D "Apache-2.0 Apache-2.0 & MIT"
+LICENSE:${PN}-jsdoc-api =3D "MIT"
+LICENSE:${PN}-jsdoc-nr-template =3D "Apache-2.0"
+LICENSE:${PN}-jsdoc-parse =3D "MIT"
+LICENSE:${PN}-jsdoc-to-markdown =3D "MIT"
+LICENSE:${PN}-jsesc =3D "MIT"
+LICENSE:${PN}-jshint-dom-serializer-domelementtype =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-dom-serializer-entities =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-dom-serializer =3D "MIT"
+LICENSE:${PN}-jshint-domelementtype =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-domhandler =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-domutils =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-entities =3D "BSD-2-Clause"
+LICENSE:${PN}-jshint-htmlparser2 =3D "MIT"
+LICENSE:${PN}-jshint-isarray =3D "MIT"
+LICENSE:${PN}-jshint-readable-stream =3D "MIT"
+LICENSE:${PN}-jshint-shelljs =3D "BSD-3-Clause"
+LICENSE:${PN}-jshint-stringdecoder =3D "MIT"
+LICENSE:${PN}-jshint-strip-json-comments =3D "MIT"
+LICENSE:${PN}-jshint =3D "MIT"
+LICENSE:${PN}-json-buffer =3D "MIT"
+LICENSE:${PN}-json-parse-better-errors =3D "MIT"
+LICENSE:${PN}-json-parse-even-better-errors =3D "MIT"
+LICENSE:${PN}-json-schema-traverse =3D "MIT"
+LICENSE:${PN}-json-stringify-safe =3D "ISC"
+LICENSE:${PN}-jsonata =3D "MIT"
+LICENSE:${PN}-jsonfile =3D "MIT"
+LICENSE:${PN}-just-extend =3D "MIT"
+LICENSE:${PN}-key-list =3D "MIT"
+LICENSE:${PN}-keyv =3D "MIT"
+LICENSE:${PN}-kind-of =3D "MIT"
+LICENSE:${PN}-klaw =3D "MIT"
+LICENSE:${PN}-latest-version =3D "MIT"
+LICENSE:${PN}-lazystream-readable-stream =3D "MIT"
+LICENSE:${PN}-lazystream-stringdecoder =3D " MIT"
+LICENSE:${PN}-lazystream =3D "MIT"
+LICENSE:${PN}-leven =3D "MIT"
+LICENSE:${PN}-liftup-findup-sync =3D "MIT"
+LICENSE:${PN}-liftup =3D "MIT"
+LICENSE:${PN}-lines-and-columns =3D "MIT"
+LICENSE:${PN}-linkify-it =3D "MIT"
+LICENSE:${PN}-livereload-js =3D "MIT"
+LICENSE:${PN}-load-json-file-parse-json =3D "MIT"
+LICENSE:${PN}-load-json-file-pify =3D "MIT"
+LICENSE:${PN}-load-json-file =3D "MIT"
+LICENSE:${PN}-locate-path =3D "MIT"
+LICENSE:${PN}-lodash =3D "CC0-1.0 & MIT"
+LICENSE:${PN}-lodashcamelcase =3D "MIT"
+LICENSE:${PN}-lodashclonedeep =3D "MIT"
+LICENSE:${PN}-lodashdefaults =3D "MIT"
+LICENSE:${PN}-lodashdifference =3D "MIT"
+LICENSE:${PN}-lodashflatten =3D "MIT"
+LICENSE:${PN}-lodashflattendeep =3D "MIT"
+LICENSE:${PN}-lodashget =3D "MIT"
+LICENSE:${PN}-lodashisplainobject =3D "MIT"
+LICENSE:${PN}-lodashomit =3D "MIT"
+LICENSE:${PN}-lodashpadend =3D "MIT"
+LICENSE:${PN}-lodashpick =3D "MIT"
+LICENSE:${PN}-lodashunion =3D "MIT"
+LICENSE:${PN}-log-symbols =3D "MIT"
+LICENSE:${PN}-lowercase-keys =3D "MIT"
+LICENSE:${PN}-lru-cache =3D "ISC"
+LICENSE:${PN}-make-dir-semver =3D "ISC"
+LICENSE:${PN}-make-dir =3D "MIT"
+LICENSE:${PN}-make-iterator =3D "MIT"
+LICENSE:${PN}-map-cache =3D "MIT"
+LICENSE:${PN}-markdown-it-entities =3D "BSD-2-Clause"
+LICENSE:${PN}-markdown-it =3D "MIT"
+LICENSE:${PN}-markdown-it-anchor =3D "Unlicense"
+LICENSE:${PN}-marked =3D "MIT & BSD-3-Clause"
+LICENSE:${PN}-maxmin-ansi-regex =3D "MIT"
+LICENSE:${PN}-maxmin-ansi-styles =3D "MIT"
+LICENSE:${PN}-maxmin-chalk =3D "MIT"
+LICENSE:${PN}-maxmin-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-maxmin-pretty-bytes =3D "MIT"
+LICENSE:${PN}-maxmin-strip-ansi =3D "MIT"
+LICENSE:${PN}-maxmin-supports-color =3D "MIT"
+LICENSE:${PN}-maxmin =3D "MIT"
+LICENSE:${PN}-mdurl =3D "MIT"
+LICENSE:${PN}-media-typer =3D "MIT"
+LICENSE:${PN}-memorystore-debug =3D "MIT"
+LICENSE:${PN}-memorystore-ms =3D "MIT"
+LICENSE:${PN}-memorystore =3D "MIT"
+LICENSE:${PN}-merge-descriptors =3D "MIT"
+LICENSE:${PN}-merge-source-map-source-map =3D "BSD-3-Clause"
+LICENSE:${PN}-merge-source-map =3D "MIT"
+LICENSE:${PN}-methods =3D "MIT"
+LICENSE:${PN}-micromatch =3D "MIT"
+LICENSE:${PN}-mime =3D "MIT"
+LICENSE:${PN}-mime-db =3D "MIT"
+LICENSE:${PN}-mime-types =3D "MIT"
+LICENSE:${PN}-mimic-response =3D "MIT"
+LICENSE:${PN}-minami =3D "Apache-2.0"
+LICENSE:${PN}-minimatch =3D "ISC"
+LICENSE:${PN}-minimist =3D "MIT"
+LICENSE:${PN}-minipass-yallist =3D "ISC"
+LICENSE:${PN}-minipass =3D "ISC"
+LICENSE:${PN}-minizlib-yallist =3D "ISC"
+LICENSE:${PN}-minizlib =3D "MIT"
+LICENSE:${PN}-mkdirp =3D "MIT"
+LICENSE:${PN}-mkdirp2 =3D "MIT"
+LICENSE:${PN}-mocha-argparse =3D "Python-2.0"
+LICENSE:${PN}-mocha-debug-ms =3D "MIT"
+LICENSE:${PN}-mocha-debug =3D "MIT"
+LICENSE:${PN}-mocha-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-mocha-js-yaml =3D "MIT"
+LICENSE:${PN}-mocha-ms =3D "MIT"
+LICENSE:${PN}-mocha-supports-color =3D "MIT"
+LICENSE:${PN}-mocha =3D "MIT"
+LICENSE:${PN}-moment =3D "MIT"
+LICENSE:${PN}-moment-timezone =3D "MIT"
+LICENSE:${PN}-mqtt-debug =3D "MIT"
+LICENSE:${PN}-mqtt-ms =3D "MIT"
+LICENSE:${PN}-mqtt =3D "MIT"
+LICENSE:${PN}-mqtt-packet-debug =3D "MIT"
+LICENSE:${PN}-mqtt-packet-ms =3D "MIT"
+LICENSE:${PN}-mqtt-packet =3D "MIT"
+LICENSE:${PN}-mri =3D "MIT"
+LICENSE:${PN}-ms =3D "MIT"
+LICENSE:${PN}-multer-concat-stream =3D "MIT"
+LICENSE:${PN}-multer-mkdirp =3D "MIT"
+LICENSE:${PN}-multer-readable-stream =3D "MIT"
+LICENSE:${PN}-multer-stringdecoder =3D " MIT"
+LICENSE:${PN}-multer =3D "MIT"
+LICENSE:${PN}-mustache =3D "MIT"
+LICENSE:${PN}-mute-stream =3D "ISC"
+LICENSE:${PN}-nanoid =3D "MIT"
+LICENSE:${PN}-negotiator =3D "MIT"
+LICENSE:${PN}-neo-async =3D "MIT"
+LICENSE:${PN}-nested-error-stacks =3D "MIT"
+LICENSE:${PN}-nise-isarray =3D "MIT"
+LICENSE:${PN}-nise-path-to-regexp =3D "MIT"
+LICENSE:${PN}-nise =3D "BSD-3-Clause"
+LICENSE:${PN}-node-addon-api =3D "MIT"
+LICENSE:${PN}-node-fetch =3D "MIT"
+LICENSE:${PN}-node-red-admin =3D "Apache-2.0"
+LICENSE:${PN}-node-red-node-test-helper-sinonjs-fake-timers =3D "BSD-3-Cla=
use"
+LICENSE:${PN}-node-red-node-test-helper-sinonjs-samsam =3D "BSD-3-Clause"
+LICENSE:${PN}-node-red-node-test-helper-debug =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-diff =3D "BSD-3-Clause"
+LICENSE:${PN}-node-red-node-test-helper-form-data =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-isarray =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-lru-cache =3D "ISC"
+LICENSE:${PN}-node-red-node-test-helper-mime =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-ms =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-nise =3D "BSD-3-Clause"
+LICENSE:${PN}-node-red-node-test-helper-path-to-regexp =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-readable-stream-isarray =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-readable-stream =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-semver =3D "ISC"
+LICENSE:${PN}-node-red-node-test-helper-sinon =3D "BSD-3-Clause"
+LICENSE:${PN}-node-red-node-test-helper-stringdecoder =3D " MIT"
+LICENSE:${PN}-node-red-node-test-helper-superagent =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-supertest =3D "MIT"
+LICENSE:${PN}-node-red-node-test-helper-yallist =3D "ISC"
+LICENSE:${PN}-node-red-node-test-helper =3D "Apache-2.0"
+LICENSE:${PN}-nodemon-debug =3D "MIT"
+LICENSE:${PN}-nodemon-has-flag =3D "MIT"
+LICENSE:${PN}-nodemon-ms =3D "MIT"
+LICENSE:${PN}-nodemon-semver =3D "ISC"
+LICENSE:${PN}-nodemon-supports-color =3D "MIT"
+LICENSE:${PN}-nodemon =3D "MIT"
+LICENSE:${PN}-nopt =3D "ISC"
+LICENSE:${PN}-normalize-package-data-semver =3D "ISC"
+LICENSE:${PN}-normalize-package-data =3D "BSD-2-Clause"
+LICENSE:${PN}-normalize-path =3D "MIT"
+LICENSE:${PN}-normalize-url =3D "MIT"
+LICENSE:${PN}-npmlog =3D "ISC"
+LICENSE:${PN}-nth-check =3D "BSD-2-Clause"
+LICENSE:${PN}-number-is-nan =3D "MIT"
+LICENSE:${PN}-nyc-ansi-regex =3D "MIT"
+LICENSE:${PN}-nyc-ansi-styles =3D "MIT"
+LICENSE:${PN}-nyc-cliui =3D "ISC"
+LICENSE:${PN}-nyc-color-convert =3D "MIT"
+LICENSE:${PN}-nyc-color-name =3D "MIT"
+LICENSE:${PN}-nyc-decamelize =3D "MIT"
+LICENSE:${PN}-nyc-emoji-regex =3D "MIT"
+LICENSE:${PN}-nyc-find-up =3D "MIT"
+LICENSE:${PN}-nyc-is-fullwidth-code-point =3D "MIT"
+LICENSE:${PN}-nyc-locate-path =3D "MIT"
+LICENSE:${PN}-nyc-make-dir =3D "MIT"
+LICENSE:${PN}-nyc-p-limit =3D "MIT"
+LICENSE:${PN}-nyc-p-locate =3D "MIT"
+LICENSE:${PN}-nyc-path-exists =3D "MIT"
+LICENSE:${PN}-nyc-rimraf =3D "ISC"
+LICENSE:${PN}-nyc-semver =3D "ISC"
+LICENSE:${PN}-nyc-string-width =3D "MIT"
+LICENSE:${PN}-nyc-strip-ansi =3D "MIT"
+LICENSE:${PN}-nyc-uuid =3D "MIT"
+LICENSE:${PN}-nyc-wrap-ansi =3D "MIT"
+LICENSE:${PN}-nyc-y18n =3D "ISC"
+LICENSE:${PN}-nyc-yargs =3D "MIT"
+LICENSE:${PN}-nyc-yargs-parser =3D "ISC"
+LICENSE:${PN}-nyc =3D "ISC"
+LICENSE:${PN}-oauth2orize =3D "MIT"
+LICENSE:${PN}-object-assign =3D "MIT"
+LICENSE:${PN}-object-get =3D "MIT"
+LICENSE:${PN}-object-inspect =3D "MIT"
+LICENSE:${PN}-object-to-spawn-args =3D "MIT"
+LICENSE:${PN}-objectdefaults =3D "MIT"
+LICENSE:${PN}-objectmap =3D "MIT"
+LICENSE:${PN}-objectpick =3D "MIT"
+LICENSE:${PN}-on-finished =3D "MIT"
+LICENSE:${PN}-on-headers =3D "MIT"
+LICENSE:${PN}-once =3D "ISC"
+LICENSE:${PN}-opted =3D "Unknown"
+LICENSE:${PN}-os-homedir =3D "MIT"
+LICENSE:${PN}-os-tmpdir =3D "MIT"
+LICENSE:${PN}-osenv =3D "ISC"
+LICENSE:${PN}-p-cancelable =3D "MIT"
+LICENSE:${PN}-p-limit =3D "MIT"
+LICENSE:${PN}-p-locate =3D "MIT"
+LICENSE:${PN}-p-try =3D "MIT"
+LICENSE:${PN}-package-hash =3D "ISC"
+LICENSE:${PN}-package-json-sindresorhus-is =3D "MIT"
+LICENSE:${PN}-package-json-szmarczak-http-timer =3D "MIT"
+LICENSE:${PN}-package-json-cacheable-request =3D "MIT"
+LICENSE:${PN}-package-json-decompress-response =3D "MIT"
+LICENSE:${PN}-package-json-defer-to-connect =3D "MIT"
+LICENSE:${PN}-package-json-got-get-stream =3D "MIT"
+LICENSE:${PN}-package-json-got-lowercase-keys =3D "MIT"
+LICENSE:${PN}-package-json-got =3D "MIT"
+LICENSE:${PN}-package-json-json-buffer =3D "MIT"
+LICENSE:${PN}-package-json-keyv =3D "MIT"
+LICENSE:${PN}-package-json-normalize-url =3D "MIT"
+LICENSE:${PN}-package-json-p-cancelable =3D "MIT"
+LICENSE:${PN}-package-json-responselike-lowercase-keys =3D "MIT"
+LICENSE:${PN}-package-json-responselike =3D "MIT"
+LICENSE:${PN}-package-json-semver =3D "ISC"
+LICENSE:${PN}-package-json =3D "MIT"
+LICENSE:${PN}-pad-stream-split2 =3D "ISC"
+LICENSE:${PN}-pad-stream =3D "MIT"
+LICENSE:${PN}-parse-filepath =3D "MIT"
+LICENSE:${PN}-parse-json =3D "MIT"
+LICENSE:${PN}-parse-passwd =3D "MIT"
+LICENSE:${PN}-parse5 =3D "MIT"
+LICENSE:${PN}-parse5-htmlparser2-tree-adapter =3D "MIT"
+LICENSE:${PN}-parseurl =3D "MIT"
+LICENSE:${PN}-passport =3D "MIT"
+LICENSE:${PN}-passport-http-bearer =3D "MIT"
+LICENSE:${PN}-passport-oauth2-client-password =3D "MIT"
+LICENSE:${PN}-passport-strategy =3D "MIT"
+LICENSE:${PN}-path-exists =3D "MIT"
+LICENSE:${PN}-path-is-absolute =3D "MIT"
+LICENSE:${PN}-path-key =3D "MIT"
+LICENSE:${PN}-path-parse =3D "MIT"
+LICENSE:${PN}-path-root =3D "MIT"
+LICENSE:${PN}-path-root-regex =3D "MIT"
+LICENSE:${PN}-path-to-regexp =3D "MIT"
+LICENSE:${PN}-path-type-pify =3D "MIT"
+LICENSE:${PN}-path-type =3D "MIT"
+LICENSE:${PN}-pause =3D "MIT"
+LICENSE:${PN}-picomatch =3D "MIT"
+LICENSE:${PN}-pify =3D "MIT"
+LICENSE:${PN}-pkg-dir-find-up =3D "MIT"
+LICENSE:${PN}-pkg-dir-locate-path =3D "MIT"
+LICENSE:${PN}-pkg-dir-p-limit =3D "MIT"
+LICENSE:${PN}-pkg-dir-p-locate =3D "MIT"
+LICENSE:${PN}-pkg-dir-path-exists =3D "MIT"
+LICENSE:${PN}-pkg-dir =3D "MIT"
+LICENSE:${PN}-prepend-http =3D "MIT"
+LICENSE:${PN}-pretty-bytes =3D "MIT"
+LICENSE:${PN}-printj =3D "Apache-2.0"
+LICENSE:${PN}-process-nextick-args =3D "MIT"
+LICENSE:${PN}-proxy-debug =3D "MIT"
+LICENSE:${PN}-proxy-ms =3D "MIT"
+LICENSE:${PN}-proxy =3D "Unknown"
+LICENSE:${PN}-proxy-addr =3D "MIT"
+LICENSE:${PN}-pseudomap =3D "ISC"
+LICENSE:${PN}-psl =3D "MIT"
+LICENSE:${PN}-pstreeremy =3D "MIT"
+LICENSE:${PN}-pump =3D "MIT"
+LICENSE:${PN}-pumpify-duplexify =3D "MIT"
+LICENSE:${PN}-pumpify-pump =3D "MIT"
+LICENSE:${PN}-pumpify-readable-stream =3D "MIT"
+LICENSE:${PN}-pumpify-stringdecoder =3D " MIT"
+LICENSE:${PN}-pumpify =3D "MIT"
+LICENSE:${PN}-punycode =3D "MIT"
+LICENSE:${PN}-pupa =3D "MIT"
+LICENSE:${PN}-qs =3D "BSD-3-Clause"
+LICENSE:${PN}-quick-lru =3D "MIT"
+LICENSE:${PN}-random-bytes =3D "MIT"
+LICENSE:${PN}-randombytes =3D "MIT"
+LICENSE:${PN}-range-parser =3D "MIT"
+LICENSE:${PN}-raw-body-http-errors =3D "MIT"
+LICENSE:${PN}-raw-body-iconv-lite =3D "MIT"
+LICENSE:${PN}-raw-body =3D "MIT"
+LICENSE:${PN}-rc-ini =3D "ISC"
+LICENSE:${PN}-rc-strip-json-comments =3D "MIT"
+LICENSE:${PN}-rc =3D "Apache-2.0 MIT BSD-2-Clause"
+LICENSE:${PN}-read =3D "ISC"
+LICENSE:${PN}-read-pkg-type-fest =3D "MIT"
+LICENSE:${PN}-read-pkg =3D "MIT"
+LICENSE:${PN}-read-pkg-up-find-up =3D "MIT"
+LICENSE:${PN}-read-pkg-up-locate-path =3D "MIT"
+LICENSE:${PN}-read-pkg-up-p-limit =3D "MIT"
+LICENSE:${PN}-read-pkg-up-p-locate =3D "MIT"
+LICENSE:${PN}-read-pkg-up =3D "MIT"
+LICENSE:${PN}-readable-stream =3D "MIT"
+LICENSE:${PN}-readdir-glob =3D "Apache-2.0"
+LICENSE:${PN}-readdirp =3D "MIT"
+LICENSE:${PN}-rechoir =3D "MIT"
+LICENSE:${PN}-reduce-extract-array-back =3D "MIT"
+LICENSE:${PN}-reduce-extract-test-value =3D "MIT"
+LICENSE:${PN}-reduce-extract =3D "MIT"
+LICENSE:${PN}-reduce-flatten =3D "MIT"
+LICENSE:${PN}-reduce-unique =3D "MIT"
+LICENSE:${PN}-reduce-without-array-back =3D "MIT"
+LICENSE:${PN}-reduce-without-test-value =3D "MIT"
+LICENSE:${PN}-reduce-without =3D "MIT"
+LICENSE:${PN}-regenerator-runtime =3D "MIT"
+LICENSE:${PN}-registry-auth-token =3D "MIT"
+LICENSE:${PN}-registry-url =3D "MIT"
+LICENSE:${PN}-reinterval =3D "MIT"
+LICENSE:${PN}-release-zalgo =3D "ISC"
+LICENSE:${PN}-require-directory =3D "MIT"
+LICENSE:${PN}-require-from-string =3D "MIT"
+LICENSE:${PN}-require-main-filename =3D "ISC"
+LICENSE:${PN}-requizzle =3D "MIT"
+LICENSE:${PN}-resolve =3D "MIT"
+LICENSE:${PN}-resolve-alpn =3D "MIT"
+LICENSE:${PN}-resolve-dir =3D "MIT"
+LICENSE:${PN}-resolve-from =3D "MIT"
+LICENSE:${PN}-responselike =3D "MIT"
+LICENSE:${PN}-retry =3D "MIT"
+LICENSE:${PN}-rimraf =3D "ISC"
+LICENSE:${PN}-safe-buffer =3D "MIT"
+LICENSE:${PN}-safe-json-parse =3D "MIT"
+LICENSE:${PN}-safer-buffer =3D "MIT"
+LICENSE:${PN}-sass =3D "MIT"
+LICENSE:${PN}-sax =3D "ISC & MIT"
+LICENSE:${PN}-semver-lru-cache =3D "ISC"
+LICENSE:${PN}-semver-yallist =3D "ISC"
+LICENSE:${PN}-semver =3D "ISC"
+LICENSE:${PN}-semver-diff-semver =3D "ISC"
+LICENSE:${PN}-semver-diff =3D "MIT"
+LICENSE:${PN}-send-mime =3D "MIT"
+LICENSE:${PN}-send-ms =3D "MIT"
+LICENSE:${PN}-send =3D "MIT"
+LICENSE:${PN}-serialize-javascript =3D "BSD-3-Clause"
+LICENSE:${PN}-serve-static =3D "MIT"
+LICENSE:${PN}-set-blocking =3D "ISC"
+LICENSE:${PN}-setprototypeof =3D "ISC"
+LICENSE:${PN}-shebang-command =3D "MIT"
+LICENSE:${PN}-shebang-regex =3D "MIT"
+LICENSE:${PN}-shelljs =3D "BSD-3-Clause"
+LICENSE:${PN}-should =3D "MIT"
+LICENSE:${PN}-should-equal =3D "MIT"
+LICENSE:${PN}-should-format =3D "MIT"
+LICENSE:${PN}-should-sinon =3D "MIT"
+LICENSE:${PN}-should-type =3D "MIT"
+LICENSE:${PN}-should-type-adaptors =3D "MIT"
+LICENSE:${PN}-should-util =3D "MIT"
+LICENSE:${PN}-side-channel =3D "MIT"
+LICENSE:${PN}-signal-exit =3D "ISC"
+LICENSE:${PN}-simple-cli-ansi-styles =3D "MIT"
+LICENSE:${PN}-simple-cli-async =3D "MIT"
+LICENSE:${PN}-simple-cli-chalk =3D "MIT"
+LICENSE:${PN}-simple-cli-color-convert =3D "MIT"
+LICENSE:${PN}-simple-cli-color-name =3D "MIT"
+LICENSE:${PN}-simple-cli-escape-string-regexp =3D "MIT"
+LICENSE:${PN}-simple-cli-has-flag =3D "MIT"
+LICENSE:${PN}-simple-cli-supports-color =3D "MIT"
+LICENSE:${PN}-simple-cli =3D "Unknown"
+LICENSE:${PN}-sinon =3D "BSD-3-Clause"
+LICENSE:${PN}-sort-array-array-back =3D "MIT"
+LICENSE:${PN}-sort-array-typical =3D "MIT"
+LICENSE:${PN}-sort-array =3D "MIT"
+LICENSE:${PN}-source-map =3D "BSD-3-Clause"
+LICENSE:${PN}-spawn-wrap-mkdirp =3D "MIT"
+LICENSE:${PN}-spawn-wrap-rimraf =3D "ISC"
+LICENSE:${PN}-spawn-wrap-which =3D "ISC"
+LICENSE:${PN}-spawn-wrap =3D "ISC"
+LICENSE:${PN}-spdx-correct =3D "Apache-2.0"
+LICENSE:${PN}-spdx-exceptions =3D "Unknown"
+LICENSE:${PN}-spdx-expression-parse =3D "MIT"
+LICENSE:${PN}-spdx-license-ids =3D "Unknown"
+LICENSE:${PN}-split2 =3D "ISC"
+LICENSE:${PN}-sprintf-js =3D "BSD-3-Clause"
+LICENSE:${PN}-statuses =3D "MIT"
+LICENSE:${PN}-stoppable =3D "MIT"
+LICENSE:${PN}-stream-buffers =3D "Unlicense"
+LICENSE:${PN}-stream-connect-array-back =3D "MIT"
+LICENSE:${PN}-stream-connect =3D "MIT"
+LICENSE:${PN}-stream-shift =3D "MIT"
+LICENSE:${PN}-stream-via =3D "MIT"
+LICENSE:${PN}-streamsearch =3D "MIT"
+LICENSE:${PN}-stringdecoder-safe-buffer =3D "MIT"
+LICENSE:${PN}-stringdecoder =3D " MIT"
+LICENSE:${PN}-string-template =3D "MIT"
+LICENSE:${PN}-string-width =3D "MIT"
+LICENSE:${PN}-strip-ansi =3D "MIT"
+LICENSE:${PN}-strip-bom =3D "MIT"
+LICENSE:${PN}-strip-json-comments =3D "MIT"
+LICENSE:${PN}-superagent-debug =3D "MIT"
+LICENSE:${PN}-superagent-form-data =3D "MIT"
+LICENSE:${PN}-superagent-ms =3D "MIT"
+LICENSE:${PN}-superagent-qs =3D "BSD-3-Clause"
+LICENSE:${PN}-superagent =3D "MIT"
+LICENSE:${PN}-supertest =3D "MIT"
+LICENSE:${PN}-supports-color =3D "MIT"
+LICENSE:${PN}-table-layout-array-back =3D "MIT"
+LICENSE:${PN}-table-layout =3D "MIT"
+LICENSE:${PN}-taffydb =3D "Unknown"
+LICENSE:${PN}-tar-yallist =3D "ISC"
+LICENSE:${PN}-tar =3D "ISC"
+LICENSE:${PN}-tar-stream =3D "MIT"
+LICENSE:${PN}-temp-path =3D "MIT"
+LICENSE:${PN}-test-exclude-find-up =3D "MIT"
+LICENSE:${PN}-test-exclude-locate-path =3D "MIT"
+LICENSE:${PN}-test-exclude-p-limit =3D "MIT"
+LICENSE:${PN}-test-exclude-p-locate =3D "MIT"
+LICENSE:${PN}-test-exclude-path-exists =3D "MIT"
+LICENSE:${PN}-test-exclude-read-pkg =3D "MIT"
+LICENSE:${PN}-test-exclude-read-pkg-up =3D "MIT"
+LICENSE:${PN}-test-exclude =3D "ISC"
+LICENSE:${PN}-test-value-array-back =3D "MIT"
+LICENSE:${PN}-test-value =3D "MIT"
+LICENSE:${PN}-through2-readable-stream =3D "MIT"
+LICENSE:${PN}-through2-stringdecoder =3D " MIT"
+LICENSE:${PN}-through2 =3D "MIT"
+LICENSE:${PN}-tiny-lr-debug =3D "MIT"
+LICENSE:${PN}-tiny-lr-ms =3D "MIT"
+LICENSE:${PN}-tiny-lr =3D "MIT"
+LICENSE:${PN}-to-fast-properties =3D "MIT"
+LICENSE:${PN}-to-readable-stream =3D "MIT"
+LICENSE:${PN}-to-regex-range =3D "MIT"
+LICENSE:${PN}-toidentifier =3D "MIT"
+LICENSE:${PN}-touch-nopt =3D "MIT"
+LICENSE:${PN}-touch =3D "ISC"
+LICENSE:${PN}-tough-cookie-universalify =3D "MIT"
+LICENSE:${PN}-tough-cookie =3D "BSD-3-Clause & MPL-2.0"
+LICENSE:${PN}-tr46 =3D "Unknown"
+LICENSE:${PN}-tslib =3D "BSD-0-Clause"
+LICENSE:${PN}-type-detect =3D "MIT"
+LICENSE:${PN}-type-fest =3D "MIT"
+LICENSE:${PN}-type-is-media-typer =3D "MIT"
+LICENSE:${PN}-type-is =3D "MIT"
+LICENSE:${PN}-typedarray =3D "MIT"
+LICENSE:${PN}-typedarray-to-buffer =3D "MIT"
+LICENSE:${PN}-typical =3D "MIT"
+LICENSE:${PN}-ucmicro =3D "MIT"
+LICENSE:${PN}-uglify-js =3D "BSD-2-Clause"
+LICENSE:${PN}-uid-safe =3D "MIT"
+LICENSE:${PN}-uid2 =3D "MIT"
+LICENSE:${PN}-unc-path-regex =3D "MIT"
+LICENSE:${PN}-undefsafe =3D "MIT"
+LICENSE:${PN}-underscore =3D "MIT"
+LICENSE:${PN}-underscorestring =3D "Unknown"
+LICENSE:${PN}-unique-string =3D "MIT"
+LICENSE:${PN}-universalify =3D "MIT"
+LICENSE:${PN}-unpipe =3D "MIT"
+LICENSE:${PN}-update-notifier =3D "BSD-2-Clause"
+LICENSE:${PN}-uri-js =3D "BSD-2-Clause"
+LICENSE:${PN}-uri-path =3D "WTFPL MIT"
+LICENSE:${PN}-url-parse-lax =3D "MIT"
+LICENSE:${PN}-util-deprecate =3D "MIT"
+LICENSE:${PN}-utils-merge =3D "MIT"
+LICENSE:${PN}-uuid =3D "MIT"
+LICENSE:${PN}-v8flags =3D "MIT"
+LICENSE:${PN}-validate-npm-package-license =3D "Apache-2.0"
+LICENSE:${PN}-vary =3D "MIT"
+LICENSE:${PN}-walk-back =3D "MIT"
+LICENSE:${PN}-webidl-conversions =3D "BSD-2-Clause"
+LICENSE:${PN}-websocket-driver =3D "Apache-2.0"
+LICENSE:${PN}-websocket-extensions =3D "Apache-2.0"
+LICENSE:${PN}-whatwg-url =3D "MIT"
+LICENSE:${PN}-which =3D "ISC"
+LICENSE:${PN}-which-module =3D "ISC"
+LICENSE:${PN}-wide-align =3D "ISC"
+LICENSE:${PN}-widest-line =3D "MIT"
+LICENSE:${PN}-wordwrap =3D "MIT"
+LICENSE:${PN}-wordwrapjs-reduce-flatten =3D "MIT"
+LICENSE:${PN}-wordwrapjs =3D "MIT"
+LICENSE:${PN}-workerpool =3D "Apache-2.0"
+LICENSE:${PN}-wrap-ansi =3D "MIT"
+LICENSE:${PN}-wrappy =3D "ISC"
+LICENSE:${PN}-write-file-atomic =3D "ISC"
+LICENSE:${PN}-ws =3D "MIT"
+LICENSE:${PN}-xdg-basedir =3D "MIT"
+LICENSE:${PN}-xml2js =3D "MIT"
+LICENSE:${PN}-xmlbuilder =3D "MIT"
+LICENSE:${PN}-xmlcreate =3D "Apache-2.0"
+LICENSE:${PN}-xtend =3D "MIT"
+LICENSE:${PN}-y18n =3D "ISC"
+LICENSE:${PN}-yallist =3D "ISC"
+LICENSE:${PN}-yargs =3D "MIT"
+LICENSE:${PN}-yargs-parser =3D "ISC"
+LICENSE:${PN}-yargs-unparser-camelcase =3D "MIT"
+LICENSE:${PN}-yargs-unparser =3D "MIT"
+LICENSE:${PN}-yocto-queue =3D "MIT"
+LICENSE:${PN}-zip-stream =3D "MIT"
+
+
+NPM_INSTALL_DEV =3D "1"
--=20
2.20.1



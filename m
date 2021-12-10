Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EC4C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:09:57 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web10.8412.1639148994716833547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=dDFK872B;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.58,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D959k7gwbTX29X33+FMIqk3zpW7aZyfyIUQ/LsAxFK9D7XiJpygPkzkqzEsUXuiH6AEMJ4XhrYfkNrv1IQrlCaoxcU449qrres0weG4EtEKtXHnOiOcOfHMAv/GyFx0PuF9nOo8jKMOG0tz2BAwB4h8O7VzQWihyZa01rHueXG1o2JwwjRBY9lmqnB/ZLstsUHK672W316ULkrtPyaitROXyfeLUim2DYh7Z5x0gLl8I8pFxRQZuk4HPeXh8VbkyU6Z/sqZg+Q1b8orDB1ltrvQOyDtufDSsaJ93mG99fDdweTx61llhxgO6gBbghdg9PZfE315tkzzoqU4jnBOZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lcke6kRiOl/On8xFvvgxmzVhT+DCdxUnVjk+SwFRHOA=;
 b=IU0b07/voG6J8ZA6GzszW4txB1lIIMM7FCyRmUJVgOZhGEKRGH1IP8uU/tJi3LqTBvB9eVttkR3nJsgDglBtsVnGwV/n45WaARIwvnIKls92YUhumugok8pE2QnH+g/P0um/CT8iHE6xryXA9N8g3jYIEj4BI6zDcEPlgq6LZo86lWFAcwNcxKrEJveXHLrTLQjijz2ZyD3XMVjBBN1BgSflMWIfvgI3iEP8MqjJjWJPCgr9lQmRpd+Qqr1yQz5FoVjM+uDDDbJ/+eqecOVc87g8pwwiu53NixnThrVf/cph+PKkvl5Wt11C4doVBpRAErBUk9s6OY/HwEUzIN9VqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lcke6kRiOl/On8xFvvgxmzVhT+DCdxUnVjk+SwFRHOA=;
 b=dDFK872B/3HOYsBDwoDZx7DUAOjrXUDV/WHkevFaGJvCnXF2jLfkudojyqkXcrYLJ8oOusIxi2sYYCq+3LP+pj27KpLrJU/G1P+jQqYZE3F9zpQFV4LyDywTnLxPYGvB6Bn+bc/Mm+Fztn1r0b8E5oWZ9ID3h+8p9nHLPmgKX+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5249.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 15:09:52 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 15:09:51 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/3] mesa: PROVIDES virtual/libgles3
Date: Fri, 10 Dec 2021 16:09:29 +0100
Message-ID: <20211210150930.326134-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
References: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0239.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::35) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0239.eurprd06.prod.outlook.com (2603:10a6:20b:45e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25 via Frontend
 Transport; Fri, 10 Dec 2021 15:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f9970b-887f-4700-770c-08d9bbef1d93
X-MS-TrafficTypeDiagnostic: AM0PR04MB5249:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5249FA9AD4C63890310C2E76C2719@AM0PR04MB5249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTq9F1EEM211jdCAB3TgyRF7PMHSXDuN8Z1NENPR3PYA3KsoJeJvZMj2IyP9jKODFBX0RddHk7GRwmWM0+BhgCekfjQqaO5q4uqIswxnE7dTTxrTT2kVLg+32AbZMnw8E0AQIICWEo+blY46X7eZREXo+6qC5oLaW9mqGoe/0sFpFAFClwagcmjiMykBjbgHM0gRVx7NpHUXqUHM0mgCCPMbStIeJw+Bz3wN4+Hhi/TTuTYXqw+7/xeNYFiuyd3RpMRRfRhnDI8tVtmJWgoVTSD5Ms6TmJRZhOQqEJ3kPh5qfcE6HgDRxXQIbNNbWlxYPXa/oY1HeFFtUfp0Qj1MtCzAoM87R41zSzw2dCn+Ts2s0/KoYXtXAzyBTqfYHIHp1hQFYVigD8ZnS1+6Nl14Ok0FTvQMszsY1I6o5ekOJo49nbp7MYqf7iDFiijoF57lYPtH7/xyMEwh5X+MkvMuHfGnubjNztKmRWm56Svb+ILGDdWvX3FYH+fPDl1oZWyl815k77og7qw1y+rDdV7NGiaIciId53T/XspHouX5QV7ZUq3l2ax8HJlDLpR1wjOgCVMkEMjvwRBJnFP0lAvPDmejmORukZ7eLbrDtHZZbXGvwo1sN8xQ5AZXptczOw0h5HW/tooS6Zh4bZYhmao5ctstZ0TeRP7KrWJT1Xtc4VQNl+4rNIwOYZgnvNXqPJuIUVstr1o/0VPus1i1tixDsg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(956004)(38100700002)(38350700002)(5660300002)(2616005)(36756003)(52116002)(44832011)(6506007)(186003)(26005)(1076003)(6666004)(66946007)(66476007)(86362001)(8936002)(6916009)(2906002)(4326008)(6512007)(508600001)(6486002)(8676002)(316002)(54906003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Q08GsF7ocvUc9kThYUj8t6WMTKhUBGfC1EQsQOpD6c2HdgDbgINEsJsGXGE?=
 =?us-ascii?Q?oODzAiCG0sHBKZAVL8/C32n9Yngl2EdO0IyQvNp4Xo6Jjocug+3GF4CPhay7?=
 =?us-ascii?Q?rV2WLLDoBXGzwiIJBA8myhTZQe5+wTomxEYQHgvnL67ibv3I+s/6TcNe1Pwc?=
 =?us-ascii?Q?aKQ5iV/ufZj6yuK9jAputUEinGv9mVQvsxSVSvpOAZafLAZh9SORBjbgAhOM?=
 =?us-ascii?Q?FqUsNMkXUUdM6m8jAGbm0bcHGr9kEX+cYjVWLelqpbgG+LS/EmQ1UfZBcrMz?=
 =?us-ascii?Q?lDyPapgrgSboEs/FzedGJrsKhPOdNfw+p883QYy1YhRSH7EYRkB/rdnFZyuS?=
 =?us-ascii?Q?zsW99YmY64IFcto2U9++jeHaudH9V1aYj9rv3zzISOEIwWD8OHGFnTiVrW27?=
 =?us-ascii?Q?Vpu77WEsh795zYadZDy2qz4HK8bjkdsPSG3jygsaUF5PUoWk5P653hDSQXm3?=
 =?us-ascii?Q?wSOzugouDwb1ptOqJ6o1Ba5uaUrojEtmmkNHRACMoNAWgYkKGjK8ajX7f4jl?=
 =?us-ascii?Q?s57YVwqJUMceXlGCKHjt37poUtz7HvPAai0Xxq3r36v/GJ3TH9MM9JYwCpXW?=
 =?us-ascii?Q?egf+LauYAa7s2GbjGF2jsEApt/OXOBKExikHV9r0l1OD7EKJ6robLAJ+xrg4?=
 =?us-ascii?Q?8sT/Nsn/zGLnO29MXk+Fe1y20wBMzKUq0NjP3nEPjW4JswVHTQJYzb5xcB0f?=
 =?us-ascii?Q?h3g+gXx+67oyNlBtJMsyDcnbn5pXU9A0CPmOO+XMJABPRgXkvfVWlezgCNC3?=
 =?us-ascii?Q?tK1v4vdHaqElX+9JKOcOWFTSMxvGIK9Md9PHdKKTjBDhusIBXkf1Genq5p0S?=
 =?us-ascii?Q?SH2jtMkhFJd2BjlNdS7T3J1Dym5pKa/hAz3n2IqLbfh7p1CObh3gnKRjWJ5P?=
 =?us-ascii?Q?WtM/d60vTQyT5deKTAUkVZ7a9RDHwUIHs4DcGBrhYyt9wkwMidvA8Avs8sj6?=
 =?us-ascii?Q?yjzIKG/aZBFv5iCU4tRVMH0+JbgszPLweUoiPb3EIi+LDTyqpof4VljdeLPL?=
 =?us-ascii?Q?rVDz0oiX5wOgCX9D6pkFdae9bCOEYxoVIitGVmrLehAQ5+BOb9pSwTi7rpSk?=
 =?us-ascii?Q?fWKamVcm5xW0r2o1bkjOTfQj+Um0PRa8pdmoNWmY9RN/pZaZtqba5qOJYxtF?=
 =?us-ascii?Q?tfqVsZ5pdfAq1h4bWTciQEO5WlG9M2edRGF6Sa2ge3r1LtZjG5+7zNtqgFF0?=
 =?us-ascii?Q?VfBv427JJZtCV5uofaV+asCldS3reN7FzHqe4nWjBp4XeYemSK24ebKx2hul?=
 =?us-ascii?Q?c04cXDZGBJ70pIuBW5vV9RrKlwQzyFUXlHZeKttTHXd4KHjkgRBjcSjJI0EX?=
 =?us-ascii?Q?QTI0/jk3xZOq+/kBpxalFMWa3CSUkQkITdY0Pf8/RXe7VKu/xhX5WZKNrORi?=
 =?us-ascii?Q?fm8srtWQELnI2cP/IXLpmgG/RJAQRE3hwKXYxMY7uLrTa1/GrHI5ZuGbo80L?=
 =?us-ascii?Q?H8nT4T4e1JPZDuoPVR2t2CkZ7qhrOhZbRDdXUP9luQeOGi9tVyNet0q9cv1g?=
 =?us-ascii?Q?EdFbWIFqtx+GPfJYmicNIT0Q5Rh54wj/ZwkxbVxahsy2OlMGWPFvq7qjCdyt?=
 =?us-ascii?Q?pSA1klEy84PehwMj7vxlF5hHoCRwwSCR9MPumxYjItVQ8BmtCah9LPWTiglO?=
 =?us-ascii?Q?bqdzIxTYAfG5nzNon8bfH4zkdrCDkZlTCQ+fCC5FXHrNmNUiyzE9CAR03kHP?=
 =?us-ascii?Q?ILlYCRJQMSGiynCfRlkX3Akr1h+wZirO27XUNhStNGXsxUNxPHhu78N+VjRl?=
 =?us-ascii?Q?FDcmEHI5ow=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0f9970b-887f-4700-770c-08d9bbef1d93
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:09:51.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 seG8GJgHnQ+cxaDgUne6AjHeNcd2OhN7Gd3+ZGvHEwmaGWJDJMTQSd9REnftfrImq0S8KVgu1nw/MCcSvKI7eL14fhwU2OTzNyeYDiUzwbyonTNQnRvpCYIrD5Q6jtIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159542

It's assumed that not all OpenGL ES implementation are compliant with
the 3.x specification. Therefore an additional virtual providers is
created to explicit compatibility with OpenGL ES 3 specification.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 meta/conf/machine/include/qemu.inc             | 1 +
 meta/conf/machine/qemux86-64.conf              | 1 +
 meta/conf/machine/qemux86.conf                 | 1 +
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index ea88bd4876..6defdca12d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/libgl-native ?=3D "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?=3D "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-utils-nat=
ive"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include=
/qemu.inc
index 642c322abc..0d71bcbbad 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,6 +3,7 @@ PREFERRED_PROVIDER_virtual/egl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 XSERVER ?=3D "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver=
-swrast xserver-xorg-extension-glx', '', d)} \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-=
64.conf
index 978334d5bb..901353499c 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -6,6 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.con=
f
index ad7f6e0ee4..1e072e1ae2 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -6,6 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
+PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
=20
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?=3D "core2-32"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index c894c2dab5..6d6fc607f9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -39,7 +39,7 @@ DEPENDS =3D "expat makedepend-native flex-native bison-na=
tive libxml2-native zlib
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d=
)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtua=
l/libgles2', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtua=
l/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)}=
 \
     virtual/mesa \
--=20
2.33.1



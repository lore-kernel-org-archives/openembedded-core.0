Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B348C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:52:46 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web10.32904.1701179563652080413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=zamWwM6r;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncM0BACZaIFsHXSAbtyiojbgoqldBxT+tvCWb80JprMicPIFuLrtQBfF0ebQArIF3T5PjK4TtqxvskrNrsEVL/q5HCLAZNGt9HT+sYl8LX6fjRgGEbj7gulRwJyWk3q489P9TCHPzwQtkbNyKx/Jkdz6EKxIJfoGhjrTKt5+zSYjlUt08AdWvPmJDQ/lNx1HdHJLgw8X1pltL1S8EUBfBOwr84SQV0qs5/Sc8YUTS976FeVxQueVWTimEQ0alg7CeJyIEovUblS54BYRjm43JloaZYPbyFnPgHiDkd1PQuKhWzoLRY1R/tIcSA8PYJIRe9USL/L8WrfEBPiXMvUjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEBht/K3c2lnZchh/O45AwVRCK2pEjFlvWObnmEJq7o=;
 b=CEKQUaC2+5pSgLvth4ZGIQy0o0VhoTlzfIGp+c0i4MSBxD1Xsoy17z4xVA64Z3q9cKu7Lx3/c4AjGrIdM00lgAcY4CiJIBzl4kzgYaGRMfdL3xLub7yVPeckQxfo3hZQvBWkpbxIabp9JZbCxJXwb/mocOzVh0hTDZkj0bwri9HQ1ZhAMc7GiVfUaoysimifXGgfgDpeQm0zusc7aMakBAqtXEe+LkT3c4AbZdQFYREqnDzhSDCxiBrrioDKlE2NloJ/ss3I7YI1ms78XdF2YwS75sEK3um3h4QfTX6UimXZGI2rbloukbiVI2cb/dvy7JM5MKKuJ+/yq1TFfpJR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEBht/K3c2lnZchh/O45AwVRCK2pEjFlvWObnmEJq7o=;
 b=zamWwM6rNQjF1VzVWx6CssX+8r0jce8gQ0d3zSTv9n6f64mqBaoiWWI6hi1aUbLg/j9hgTzDu36asMGBkfLyQ3/d8rnQKCuWPszW1m5JP86o0d0v2lA9UJK+VOsaRQ88bIrUhIlLV4rPJ5whTn3osa2XLZ7NqX3fdVjC6flDaE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 13:52:40 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:52:40 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v3 2/2] selftest: wic: add test for zerorize option of empty plugin
Date: Tue, 28 Nov 2023 14:52:32 +0100
Message-ID: <1be229689f4c8a3227efe23b3d8cb9b80ac646d5.1701176186.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1701176186.git.lukas.funke@weidmueller.com>
References: <cover.1701176186.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PA4PR08MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 364bb57e-842d-4ff8-881b-08dbf019497b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KrGj7lREyVWveIak0IZpztNI11sXBQIyt8B6xmJri3QXepVOihC7q347+yTutrcQCGj12YR/+n2mcexN3JwZY5G6pVZQvlAzxInEM+veWfQ5hJaeXBcE1gW7LSXK59zgWntGHYQAUrrit/mxYIUr7TVfmgpkMJXHVZq9x27Q6GmPetneBzX8+W3NONNzITfTsEkuXozmAQHkxMPCYsjQKHWaUS7Sehh+RqnJ8yY3+drfYVrfsNyB202YbgwqDwEoTXsBBPwIht/iolxV6zn9a1a8pTfEmrtChG4INmhCcDwSajbLpXXLE+7OSjusekfJkcJwDk+G/eYDVCy/mHfqo+lHR7mP02KPezipubKP7/jbl+L8WgYFq38Cmm4VaxVrwAGmLhM4TJmMaMHbtpM6rNYgjnHj8qRYwHFUPp07kv4TStGY2J8zPe/u/Ja4neQlqFP72ZePH0m5QLL77C+BiCDZSzW0NfCSi5vqIoZN1i58UzTamSzgtwgBgPQHko2/nNKigFSeBcJpIV2ywNbB7yh805jvsnj8n30bWSZhlD8PutGE2CuX6dTrAFIg+hjOu4HA18kTeW05C0ctWTUiAhylpItosECtV4JP2twO4OJnJZIMFb9TYOeevXHq0Cw3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(52116002)(107886003)(6512007)(6506007)(478600001)(6486002)(2616005)(6666004)(2906002)(5660300002)(41300700001)(66946007)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(66556008)(54906003)(38100700002)(38350700005)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zaClfz4oMjn/6jnoomjjEgkSuSskfeSxnQfxjxz9LPO3m/83A+rsSTA0YHPD?=
 =?us-ascii?Q?7L/s0NGln1sJgf8TElxO44Xt3hbM0yrAuVvlJjb7QITtp92qlQMmWH3BqqYN?=
 =?us-ascii?Q?2I/V0tRLfA6HeHV7mYxRrrFxBN0FxloNcZlE5zsd6ia6cvf93pLH5qmBEGQn?=
 =?us-ascii?Q?V70DfoJsWszHr3eWhMRbOaH9NIUOgnl76k9J6i4FHD47K1CatKo0zrODlypT?=
 =?us-ascii?Q?ioJClNyn2USLxkMJoRiv1EL3eyMzY7rIOhZDvN99EXh8AdrqFzPVLPVq36fU?=
 =?us-ascii?Q?mgWw+7zfqN+ITGqcyHX4z/DG1vhS63rL6ub3HVzG6APRcpC8vxp4tpCk79e4?=
 =?us-ascii?Q?YPKdMoYvI+O6KahyaqQ9VXqwUEg0mq5gtPXUeHKIqvvhCSEdLeiCuoynHihJ?=
 =?us-ascii?Q?UMZbKj1BWj2pBaDLFXM4kNJdgoow7OtwOPIafMK/B4ALXnYCE26h64OmtRUw?=
 =?us-ascii?Q?ixywYxWqd39fp4V2jCOHgFZiYUusb64Jtm/Aqx3t5a57a31AtyihhRc7IuJD?=
 =?us-ascii?Q?BPBy2gQga8fOQmrRy37v2/xw2VD8+yysbdFg7ka275OhiHpfV9HD3ODHkpGi?=
 =?us-ascii?Q?m6NhFgGg5sLnOPd33nkysTxlmNhCE1cS6s0DoQ5T9tC8Iz5doe6wJl8Q/hd/?=
 =?us-ascii?Q?VM0C34uPVUscCefuDtfxn2jKTcHldHyIBgsw/hzJHQJGGxLUvksa/7l0GAWr?=
 =?us-ascii?Q?g1iPWp610jxhZgL8KMy9a1JZYJ8fpc1MZW2QxKtFkbh1iY2+MCaoPexoO3C6?=
 =?us-ascii?Q?F3wXcNjbLbDcijab9yGERLOij0joEfV09KxBYOpDTrUyERt4Y5DzpI64QWkE?=
 =?us-ascii?Q?Jy1K/ZDenx5tFAlwtgtaTC/fyiPfw/29S8K20eYj+95bthrOWfCnEBqCEViS?=
 =?us-ascii?Q?jWmPZ2fEa7y51HFzkOCQSqWd15UIc0AYqKZk6PTSN1LyhgTO5dywvuPzFI9k?=
 =?us-ascii?Q?Q1RdOX1sZgwb4LOwJ4rSW3e4RmSy/9VqJR3x+Frah4YUz4vK5d87WGzP5UtU?=
 =?us-ascii?Q?182XXm4kIMwpgj6ZokxxnZd0p3iD9grBFBjNYIxAiHiVbaTkqZ0GdDK21eL2?=
 =?us-ascii?Q?XJ9eXDdRZRdGZUf8mfQKrKmdCgnlf2GxvieXxrGYAyix7Ezq8VoMEDYfAC/i?=
 =?us-ascii?Q?lp+zz/gVas8A6u3YPhhDF3TfYzBHoVA0JOFexLJd3DI1XvtXfI7VwMljsOWm?=
 =?us-ascii?Q?YEAY/77gz7IwkSL+3GsYXcN0kacCZamjp+v1E1YkwXKck5Nsv8bpbK8lbpWs?=
 =?us-ascii?Q?MzqepsgS0sGSfz4Zn/lXVVOniIFFAG7OzMW6jINQHbKWrJRlopmGhSnlapzU?=
 =?us-ascii?Q?xFtp6WeWk7GIvd0neMwN/2X+GZfiPkJbmE1x84Woktog/4IjG0yDPcp6tnpa?=
 =?us-ascii?Q?dOV1FGpT6xjGNakIPf5ka7VKYFEyInpL+os7vzo4HE/2nw0qV0ArJXeXbDeI?=
 =?us-ascii?Q?gc74ABlhmuthi+HgL6YfhCsEPqAvRSIfzSUgA8owOIYw9TyphCL/wq47KzVz?=
 =?us-ascii?Q?RMxXS9rn+byYiNuIex936XIpHAyGqNuJmBRaclhohlx6BawzrFTE42gU6h+r?=
 =?us-ascii?Q?Izg/8ovCsVTuSz1/XAKr+MjOgwU53b7DLJzXDnnd+RZhZIPlUo6LUe6kxOUo?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364bb57e-842d-4ff8-881b-08dbf019497b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:52:40.1511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Yw3n0QF5OvDGcTnbX0vAgiDINjQvS1waRGvphxkZ4KAmdIuy4WIR51h5eQ8u5IsVV/GfN13ga5XkLXfVegtIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191370

From: Lukas Funke <lukas.funke@weidmueller.com>

Add test for empty plugin which tests whether the plugin creates
partitions with actual data which is 'zero'.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index b4866bcb32..9672f3fae4 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1391,6 +1391,42 @@ class Wic2(WicTestCase):
         result =3D runCmd("%s/usr/sbin/sfdisk --part-label %s 3" % (sysroo=
t, image_path))
         self.assertEqual('ext-space', result.output)
=20
+    def test_empty_zeroize_plugin(self):
+        img =3D 'core-image-minimal'
+        expected_size =3D [ 1024*1024,    # 1M
+                          512*1024,     # 512K
+                          2*1024*1024]  # 2M
+        # Check combination of sourceparams
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(
+                ['part empty --source empty --sourceparams=3D"fill" --ondi=
sk sda --fixed-size 1M\n',
+                 'part empty --source empty --sourceparams=3D"size=3D512K"=
 --ondisk sda --size 1M --align 1024\n',
+                 'part empty --source empty --sourceparams=3D"size=3D2048k=
,bs=3D512K" --ondisk sda --size 4M --align 1024\n'
+                 ])
+            wks.flush()
+            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
+            runCmd(cmd)
+            wksname =3D os.path.splitext(os.path.basename(wks.name))[0]
+            wicout =3D glob(os.path.join(self.resultdir, "%s-*direct" % wk=
sname))
+            # Skip the complete image and just look at the single partitio=
ns
+            for idx, value in enumerate(wicout[1:]):
+                self.logger.info(wicout[idx])
+                # Check if partitions are actually zeroized
+                with open(wicout[idx], mode=3D"rb") as fd:
+                    ba =3D bytearray(fd.read())
+                    for b in ba:
+                        self.assertEqual(b, 0)
+                self.assertEqual(expected_size[idx], os.path.getsize(wicou=
t[idx]))
+
+        # Check inconsistancy check between "fill" and "--size" parameter
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.writelines(['part empty --source empty --sourceparams=3D"f=
ill" --ondisk sda --size 1M\n'])
+            wks.flush()
+            cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
+            result =3D runCmd(cmd, ignore_status=3DTrue)
+            self.assertIn("Source parameter 'fill' only works with the '--=
fixed-size' option, exiting.", result.output)
+            self.assertNotEqual(0, result.status)
+
 class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
--=20
2.30.2



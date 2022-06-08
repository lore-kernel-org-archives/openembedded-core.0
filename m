Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB9EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:43:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.3750.1654674180324105402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk
 header.s=selector1 header.b=H0LzvfpP;
 spf=pass (domain: prevas.dk, ip: 40.107.22.98,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOJauNYI/mCiciIl0Im5K3jd8nIJMNw9Ovh7OZeaGI4X5Xm3rPDWAJ+HqcfDWBSnbqZvyG4PabBGp75JNJGFnAs3rH+69xJrX3cs38THfDVrKwBDRGKPJp2mVzt3WnCwR7BZOjsUeGeAB+N6E36agFB7SC/2fwUwGFK6ewud0FT0/JYf2CpMTG5Y+hafq0AJ4kLW+JauW9UnpEZe3AWSjUCVLlZiKnBcIwKdzl0Sxat9RKA259/qd6Swscv0AV67fnIPm91NMFqWnuLcbCdRuzr1oLBh/H++CpGz9bBmRwqQTVgB+izR8ywdG/dkw2T0rEdFeqN896JWnrOcwnbPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR5O1p7OMg8SlmnQ3gnc80AhbfHCvSO8bvKbQTLRGTw=;
 b=Y+aYGEO7u1tPW+AVASrwl1POvrE16N6x7kqbSf1fwC5rupgX61tmMYPhmhc9ermqx+SQOhoUxxEdv2W4y0c0DX4vJkBtLLlZhYi7Elf9rRJGD0TQDj7JAQnbIwygJI3m4FBQElrXaGS3G47g/sGXOSIa2drDn9wC7/usjPhq5Ylko4GEGxy8v4jPzTDl2acpJSa9hI5wCu5K1Nrdszf1N8ydZ6OiJ+AHKGVEnLPHHUoI80JAD4Vd1jRJCxGAGZQ9wbF+TtEvcy50gn0K+EV7Q5qs/6nYGh+lkCIivJXM3fIApisR3l2zvTtu5GJ/burDPTVJhU60EQjKvv9C1lByyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR5O1p7OMg8SlmnQ3gnc80AhbfHCvSO8bvKbQTLRGTw=;
 b=H0LzvfpPVVIWGRy9Q0j3JVQS5pJJ0jG8SogaQQlw9e7JAcQmWjj0PM700mbpggvx8Xsq+M71zRDzIy6m+dCUu82zgaqmqYzO+bwtTnWTuV6+nCt9ZlakHH7S9mW+W7j+PcSKZWlmq3u1PXc57DPqh5SChhLTBtpjlwT9iq9OEdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM0PR10MB2081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 07:42:56 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 07:42:56 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] vim: put xxd in its own package
Date: Wed,  8 Jun 2022 09:42:45 +0200
Message-ID: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::25) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c194aa8-380b-4044-c40f-08da4922806f
X-MS-TrafficTypeDiagnostic: AM0PR10MB2081:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB208120CD9899454D1560421293A49@AM0PR10MB2081.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bfohD9PkIBIi81rVykGJJc8Xd57uaf56ULRlZgJKtWak2i508w6RdaU1gid98ZRh/R0JE2VnGnUyShH4HqF6HofM6HkP4UCjUBiWs37wvjAsGWoklz24aAs6SZ1P9lqLXNnOH2gfuUN2oFS2LuNrMjOWSLtt9LLmfb36LH2mWKKhjlFZdkdLQcTYBmXklKlJMYML9yl+ReuHwh0lE1YfOCKMVXw/2Bjo/ibbHNseRbw5Ug+Na05eMZq9aUm9fE63yCqcF8Kr+rhR9E+Y8yPIdWfMfV0J/KTFyivX9yIn6uYA3ItBqkFxWXJky+7A3BG5A4rCAVCsNt7OY+VsjX6+KtNXwhio93LeGGNh7noAn92uPuiAzchUVQqqvxBoNUfLMYU25MaQnEvnS90w32q/ccKAqx2vXHxViZM9XfJzlN3a8q8mFEp3XgVsQdZ2+brFinC0mFecEFtYntIgCWCBYpti8AzkAFtIjEtlE42pPZp0NC4YnzGxSRPOZjcxZIiWiubeIWKkKEEnAhe+l35/tBxy6ipoShemGnwNHhrvMnhu6qMWTGb+a3Wl+GraJLmtEhQ+BsXFnO5Wjef/qS70UHjCVTrhrQpkNaue5qNArRLmQtbsZZBEUfF8ZfCu+qseDxHFHDlLcVx9LuEZTuvECanRy0lw4xD7LVh0YjRX0xDvicz1Bilq2d5566QiDW8smM0BSIgCIIxRE8XUhX6zIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66556008)(5660300002)(36756003)(2906002)(44832011)(186003)(316002)(26005)(107886003)(8976002)(8936002)(1076003)(83380400001)(6916009)(6512007)(54906003)(8676002)(38100700002)(38350700002)(2616005)(66476007)(66946007)(6506007)(6486002)(52116002)(86362001)(4326008)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QmjfEPzg5KljNANQLSrFpxJLT/Soy2IUEm/E0D/auYGo/iRiqA7Uj15a4akq?=
 =?us-ascii?Q?KE6jqWjeS2KkWjy1H59n65DEe9I+UuBJpTpcct1qcrSy+sOQk1RTtNwaJXbM?=
 =?us-ascii?Q?AYTJJjFcDSzjwDbDyV0izjL2coj5cIWXroakc4t+DQlGZSRAsP6ePhrnT9Vw?=
 =?us-ascii?Q?/V+R2jbdLcatnZH3EWeZlLNWuwM3YqlL1q6GNvJNg+US5+Ldxjp3FWoVXVXD?=
 =?us-ascii?Q?bn285MWD5TRCKBGoTmMMCxWOemBjy3ndMPDa8JG1j1/MLhLJwee0nEmRAXEq?=
 =?us-ascii?Q?vO+pEx1RAGS05SbmVLw1N3n7QjwQhPeE+YcvKNxnrh/CNzO8v6l+z8WZSgAZ?=
 =?us-ascii?Q?YY7b6iKuFhZ7GDNf3a6dvrgVmwb/p5AWlGnvpB50GzgvcEy77hEe+BHxRHOP?=
 =?us-ascii?Q?/wGk/Q4lmr3fYe+MOnSysaEkfB3UBhOT9VckUMkw/m3SaD5GXG4CPgkBGHzN?=
 =?us-ascii?Q?rakPQ20I9tJ8Z9SfQw0ka/tkd+BUhwP8aCX2+nM9FrEVQ+crn1KGJG9g1rxA?=
 =?us-ascii?Q?D3RZ/72rT71aWBQTJWHRaWgc3mjQk70LkWx4uYpKyX2sFjqIBaQtyWVyUzwU?=
 =?us-ascii?Q?VZGHgEaDspFuzOJIdH2fTaJ2nbAu4AwsheA3uP5KeuNJWFwrlZzfwMLLybXH?=
 =?us-ascii?Q?YZv9BIYR00x6xFQ7HnvmvX/IvC8tNhg3cWh6R5Ebt05UIiubp0UQvTMXCbJB?=
 =?us-ascii?Q?9OV1EL/JXK15nvcJHjsB0WULZxQnQuMNTID1MOe3qiA4SiA0hkcBQ0Ckg8gx?=
 =?us-ascii?Q?2A4G0Vin9cD8YaqSDOAaxJ/cfsDEtukdPzelpsVRFkVeTSVHxivzIqWgfbYB?=
 =?us-ascii?Q?dXQwbE9N7zEvgdn2WkHtMOPtHW2HxLzLF5QBJStbf1NArdb/dNPPOpxJq2nE?=
 =?us-ascii?Q?YVs/kphxl/CB+vNObIL9PYquQMtsBpeDnTAQGv+rEh0q0Q7U8gKS9Q0apDSh?=
 =?us-ascii?Q?+ER2VECry4gQoF58xBBCUO+r4q+EbGxf2Vi+DT0yZfappu/lACTCx9K5Pl9F?=
 =?us-ascii?Q?zXiKcdyxaeE+lHrmwbgcY0/SUdO2AW/GA0Pw0L/RNK+qi60X2o5NchdNr51Z?=
 =?us-ascii?Q?FGT5A/DE5aXlqHg1dX8vagV+tyAEWuTcsqwJMJ4JJ2RVjU4WHN+SuEbg/W5n?=
 =?us-ascii?Q?Z0YAeREcoPrM5ldakFep2/OnSJYeBNoPTZzJuQ+8Roax6Pg7mx3tYgn7EHDx?=
 =?us-ascii?Q?SU9TExRtf9FlNzQeNdx+xL+sf2PqTB8YpQZmQlPqT9z2iuJ9aDJekaUNdIfu?=
 =?us-ascii?Q?Y8z/RFTR/T+xoyh1DX6ESNrYuX+x6xYz8teGxiaVJMZrNk44BNVi/08LNHD7?=
 =?us-ascii?Q?fQQtBiUDe3c7zq1KSP7GYs02uDhgEquJVedkaP29oeL07M6r+yUVagyIwS9i?=
 =?us-ascii?Q?+WS1xcRJrc1c112FIKiXfZ4jkJ+0JSfQQfqP7hxqzhUr5+zToRxl+V9bNyJT?=
 =?us-ascii?Q?djHXolc9lz1P6CK70jqI2rN/QXi3tgqPrNeCY9XrsYWFhouiJqrO5QV06SoE?=
 =?us-ascii?Q?QkJ8IiGOM1fRw9vT+PRos+ZBwxq1iL/WBNsi3zlia+/4sCsjb1lzD4p96wFm?=
 =?us-ascii?Q?k4yaIXHSF+3YpuoCkdhX8aWjOo7i3yGQIuMG8OxFpRkK/yjgGUCmmJ3vmtiH?=
 =?us-ascii?Q?4EfV9fKKwrw4I7TB2x6UuatNSi380O3SIcHxv800RQSNdorlHTvAl6fNF0SS?=
 =?us-ascii?Q?jFxrYun3C+OYctfUWZGtO9LPCc7h56nYU+yNpkeGXeJlu212Qlupcybf6BCK?=
 =?us-ascii?Q?eMWjEGtI9TwTVUsH0tT9kx/fjpmxmSc=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c194aa8-380b-4044-c40f-08da4922806f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 07:42:56.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +e6m7jZzlato/tPYvEaa1qICKOni/lrjvkwkpOMCcOg0Hba3tjLvTEIvMG3fQE/ZwA0sLgTJEN3CMF4TQacciP7Gw1TmDCafzvdfyVbpRWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166693

The xxd tool can be quite handy by itself, and doesn't have anything
to do with vim per se. Make it possible to include the rather tiny xxd
in a rootfs without pulling in the several MB vim binary and
associated data.

For backwards compatibility, add an RDEPENDS from the main package to
the new vim-xxd package.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-support/vim/vim_8.2.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim=
/vim_8.2.bb
index f358e61132b..fee9f055e9a 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -2,14 +2,18 @@ require vim.inc
=20
 PROVIDES =3D "xxd"
=20
-RDEPENDS:${PN} =3D "ncurses-terminfo-base"
+RDEPENDS:${PN} =3D "ncurses-terminfo-base ${PN}-xxd"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS:${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${P=
N}-common"
=20
 PACKAGECONFIG:class-native =3D ""
 BBCLASSEXTEND =3D "native nativesdk"
=20
-ALTERNATIVE:${PN}:append =3D " xxd"
+PACKAGES =3D+ "${PN}-xxd"
+FILES:${PN}-xxd =3D "${bindir}/xxd"
+RPROVIDES:${PN}-xxd =3D "xxd"
+
+ALTERNATIVE:${PN}-xxd =3D "xxd"
 ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
 ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
=20
--=20
2.31.1



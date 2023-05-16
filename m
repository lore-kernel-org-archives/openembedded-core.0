Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F7DC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 20:43:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.33441.1684269779717986597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 13:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=j63KBc/O;
 spf=pass (domain: nxp.com, ip: 40.107.22.82, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe1xeSsazBGTZM8NUYI5pm+md1m9M1YcSNIVqFgSaAwrYOboRIP9v0gDvLnX6cTh4Zp9twgCbowi9z1DlHP9VuGq/OFSJzTb0EasUjkWHcL5NvK4plYkv01tV4Ct9wEOhoIdWw34oLJKyCQXgUAWxLbdzAJQ8ZlKb7wFM9Q6+DvAprAvh4YbrMeYKDqgBOBgDKsC/M6/pcgVktVzrVeLxkVsYo3fST7Bf9LvUGvq8HplDOnDEJC/AyiriCNjiorShU4OJvdyO6A64qnNNeJVAsI8N12D6shM4KNjA/EcrFhP72iYCVwO+DP0pFj15rTJMrHhSj0ynkRH06g9IePyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7glj8g6AGTmrojAedF+XsxNv4oTksUWDAxK/9IdEWZE=;
 b=hcnEGYCL3eyQi5Dk6DV0aY+xTpmk6ZnA7oRANK5rxPH8njM5WQQ8H4ncAa5KXPINDYEBeq9yE6w0zsLgwBezAb+g8l+a0bx0f/1YrYW7MIXJumrEcJ9BMNG99sHYa4sXDVKNf5g7eCkdhAvXrraP+T7tqg1w5EdC56m797veWhfabYed1iX7FWE91s24u6voK6ydvnTUmP9Q82M6OdmfY8PX7nXB+RPpfdsJaQnjq54R7LqpEmBgpOjLXbYZfG7yzGn3xXaueWMM+f5P0VvGJ0A6y7198Xrs3NvJ9BZbMHSmL73rNHopuUaN3CukhKVcjcfGQ06RM8iv8ihjtayT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7glj8g6AGTmrojAedF+XsxNv4oTksUWDAxK/9IdEWZE=;
 b=j63KBc/OulvANT1rXOas3+ZvgYTHl1W2ot9ClZlpdePhmvRVCfrv4n1exH4EMaJaabNViTwU78tqCvS+gSJLXlvm8MR2XvD9HBTkvCOW5p2+oWxC01tajM/3Q12swVjkpbJTEbsPxupFHptHgmNfD/+uHkliWAGAEtZN8SkC/dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AM0PR04MB7057.eurprd04.prod.outlook.com (2603:10a6:208:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 20:42:56 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::2e72:249b:5051:e62c]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::2e72:249b:5051:e62c%5]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 20:42:56 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] piglit: Add missing glslang dependencies
Date: Tue, 16 May 2023 15:42:00 -0500
Message-ID: <20230516204200.3287960-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AM0PR04MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 463f656c-7895-436a-5ca0-08db564e209e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tbe8XV9FJxpKDHbC2AUMDmRGYf4h9E3kpBIzd5oHXoYy3FfyurYFSYQveLz9fIj4huGFkqXD3/u1e5UjugzwXVuq8Xw9rwfzycQAlFPQfH6FcIXaWkLFFrlCpLLp+5uIGwflZysU2d6ujz9PQsMZs8sqRoGTtH+cg3sTuI0IqKI5SuetoMg0NZReCgmbnpPaJxD5fDNSZlDAv8IXpYjpqKuTvALYvrBsz/Ifzw/h85WOEmnLZi/mp+axgDPhRS1f1DwmSiHzAHZNq4VU5jq08+hWgVqgcNq8PnRa+zIu3NtpXazSbMDau/u1A20oq7EmwdC7aU1mmxUdZHNjTi2s3IW6AGn5juMxCN0pXbuZXe7/j/v4F/12vIzSSo5jW4eAQs2sPbfL/6X0MlbxQswmybrWYfkUE1aOwi4kJtffxQqQodQ7fenWu7/EfFD7xfbr0Uo0HSxtHOGxgQPGteCIoCa+eCAjyTRb3qzCEpt7ePLrc2Ys/zYxo0JZkfvkM1j93VzSZ7sxEYbkVpWqFhe9doOrBkCK1GjNsJwhf3xKKf/AyQbkEspN+sUKAZNSPmI/Ij817gJI2AhjW8lInU3tFFhmQ07D0Kq1QnkiYcp7+2/gDLG+vDWAOY7UC8Ug0ZiX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(44832011)(5660300002)(8676002)(2616005)(8936002)(83380400001)(2906002)(186003)(36756003)(38350700002)(38100700002)(86362001)(26005)(6506007)(1076003)(6512007)(6666004)(66476007)(478600001)(6916009)(66946007)(66556008)(4326008)(316002)(52116002)(6486002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6SgL/qTSUIkLObITLJharzJ9s4y9wmrTHmQkxkQsPi8mvDLCpAf4m3CoYKLw?=
 =?us-ascii?Q?Ax01HtHO40UUQzWFKUBS/SfrXhccL1dbGocTT+KcL3Qn2IcSwQGrEwYnI/5H?=
 =?us-ascii?Q?a3OIwZsoE1HyqzIrzy8hQyuult9EfzWxGNWRqHcN57a4viZ1/NCarlhoghjP?=
 =?us-ascii?Q?Aig9JGK6oR7LSvPYij+7D07IT/X03E8Y2PxcBXU2cSCbfMOa1f32m7+zlKjZ?=
 =?us-ascii?Q?IJRDPtc2WqmaS6H9HxgNROnofFa4Mgl9swVBvzobVcgMCvl5/gz8flBmXaDl?=
 =?us-ascii?Q?WaT/lICM1IpsnQl17naYUf4piXhuRs6FERzMbBJhuAbUi3p3wm8LNEOSvcpW?=
 =?us-ascii?Q?T6jSIWix/9fxup3dEyAK5JiGrG1IqWbXFDzX91J94F8icTznTqgvUNGNjR8o?=
 =?us-ascii?Q?/5O5dBeayQXUY7SJFuvpL89IktssLI+G1slXcnJA0NNUDras/JLLwl7tHLyC?=
 =?us-ascii?Q?JHEy6SmfNyus1fKmKHafZLxOeRlks2xVSfw1tkuO8R4UdI/idU6dwdBgkxe2?=
 =?us-ascii?Q?n//6I8gHcrUODGyaE9B3Ue5ABiXnaJDNsnktvAJGMgs78OyKqvNdZcNxXGa+?=
 =?us-ascii?Q?uVunctGwWiO5YFr1bUseWKO3WVT+MwmWwPXSiOYd4bFqNr85cHW42uEQJxFM?=
 =?us-ascii?Q?+Z2RQiBO0nCWQswMdBfgcWEpf5WonEggV4TG1bMtfdO/eC7ToJuWZHyKtAhp?=
 =?us-ascii?Q?EK7QvTA35mwPCQkE+S8p1WX/t2Y25vyVj1wNqxvSlLo3TjXdjv27jhBjS5yF?=
 =?us-ascii?Q?MW0ALwu+8YLfUs2oZn2HxH0IElob2R0le0hktACEOLilIGB1ix8NLUZEEBuM?=
 =?us-ascii?Q?Di28E/JojXiOHKw98PauVQuacimBPxjCtkQM/3e+cKWpguy4L8epCx/O+kS1?=
 =?us-ascii?Q?s4xLWwNuiEV/T4ocAO6PyQzLvcX+tfYYWN9fO2X8YHV1D/HKCqw038Rxp/v8?=
 =?us-ascii?Q?393B1YPdfP5MyocaCdJKgME1E/fENkUnZx4oFa9Sf6Yt/jf3ByyyBujMaUyD?=
 =?us-ascii?Q?Z0JGcMVMM0bpHXkiGb7qcndQEuoLdkRhg4KpeEmVH+DtYF/bWS/TCiXj/pyY?=
 =?us-ascii?Q?5v2CwF4LYt5PdvkkUx95QxQOLXB+6lRjWicnR7xDKkZxcQk/W56N8s8XlNQ1?=
 =?us-ascii?Q?PPYgD6OE5utbuID9CE4Uq+qnm3ofMvR3KNREfQesNz8Yizg3mfkg8h9W4teO?=
 =?us-ascii?Q?8Qstqn1D1xOn/jWwqng37Gye58hs8qxQVX2oW2uZDDMXyzN13IvRldQoRA2v?=
 =?us-ascii?Q?KMn2V2adz5rCsY9XNS8kyBKcYm7ArGe7SSyVUltZ06o7B/rW871qF7HyFEDY?=
 =?us-ascii?Q?usEXacem0i8gs37mJ5PHhh84Vv1gi89yn8OfPGEZzosN9ptfs2RiOCbXH6kl?=
 =?us-ascii?Q?tOluApM5fw/JiHS5sZ20SpmPnzj5PMylvSp5oshg2Yijc7Z6vzzxL8ioGm4H?=
 =?us-ascii?Q?he6OZDRui+ifhBKBJ/uzoCn9XjT2Xy4ddlniz6usZDiGCNEOq1V/jcAfG8+f?=
 =?us-ascii?Q?8A5lUAktgMLf2EuOeWi3eIm7x5hJ4HuBIUXPEuG7Utk7gr4KmK2NqjJaKMp3?=
 =?us-ascii?Q?pMjRtFJ1HNYdcSdjiIQe92WU7KMbwQNfduE3FFs7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463f656c-7895-436a-5ca0-08db564e209e
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 20:42:56.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzJeFBEo+NYLLEJGvi6NmbfPPdE4DBm90nzu6bYNmORAMhtf9FFbkE6486xyHEGi+eZg75K8MNYwDhFchUtC9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 20:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181423

The vulkan configuration requires glslangValidator for build and
runtime.

Fixes configure error:
```
| CMake Error at CMakeLists.txt:191 (message):
|   glslangValidator required by vulkan tests not found
```

Fixes runtime error:
```
name: vulkan@shaders@fs-large-local-array
    result: fail
    returncode: 1
    out:
    err: glslangValidator: No such file or directory
glslangValidator failed
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-grap=
hics/piglit/piglit_git.bb
index 116d2f5d81..6264483bf6 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGL=
IT_USE_GLUT=3D0,freeglut,"
 PACKAGECONFIG[glx] =3D "-DPIGLIT_BUILD_GLX_TESTS=3DON,-DPIGLIT_BUILD_GLX_T=
ESTS=3DOFF"
 PACKAGECONFIG[opencl] =3D "-DPIGLIT_BUILD_CL_TESTS=3DON,-DPIGLIT_BUILD_CL_=
TESTS=3DOFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] =3D "-DPIGLIT_BUILD_GL_TESTS=3DON,-DPIGLIT_BUILD_GL_TES=
TS=3DOFF,${X11_DEPS}, ${X11_RDEPS}"
-PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_VK_=
TESTS=3DOFF,vulkan-loader"
+PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_VK_=
TESTS=3DOFF,glslang-native vulkan-loader,glslang"
=20
 export PIGLIT_BUILD_DIR =3D "../../../../git"
=20
--=20
2.25.1



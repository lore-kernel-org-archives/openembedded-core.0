Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A3CC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 22:04:47 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.63])
 by mx.groups.io with SMTP id smtpd.web10.24840.1661205876718064666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 15:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=az8jjfCm;
 spf=pass (domain: nxp.com, ip: 40.107.1.63, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpB0CKEjMrvRYIGR7EmGJjnb4TcCdy83/z+xRKupZxcIRMPZFn4x1rjx2KTD1aXRobgxKb8GgjXpJmSxIy2AB6BH48cIynik43mJqXotDzTtwrCgcnRt3E2kVQKDZgKbyfG3Fl8NhaITRCVHh7Z/asgCVWE4Q9aba86GkU0ovvOIpa1YSM2qkX0PBZRy0SIm8i3dlsPn1TcPGmoxIibAMdOMrANX1+NKhrg4Zsv47A0dhl4vrwbrJPRH7SRDwdfuT/1FZhpI2HkhrM5aOBw/eD1t8XGdOk9PWjfmVvbYQx0zOKMM6dGwTvBl/AiGVgAKbi4v5YIUxG7EuusB3bGPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB28+8wIvfrlWe/Da016EqUzG+awDJwKtMttCJGmiOA=;
 b=e/wIyc1UGGnX98sZCnoR/1aZsNoSXJrsEY9nUMvJUx/9v4ZHFND4NoPWHREksGlBb5TRKGvVix689JGyg+hWFrn0JDM5frrEtP9WdUWS14cl3RgYWJ5OEeU97uIB6iW0OkNkndjhTnb/GFmYs4GG4ObVR209RbLd+XARh9mnfp+S2adNflGHYoBB6mZTYIYmDrWGE2tpttowUNWQgh64AhgyBcHYq+YXl7N91bINfhQmVnhomyhLkeDqv8stpZIsxBpQbEhevhpp9yg84TgKvDmSp+icpQAR1AcbSM9ZmTWVRWzwqVHJ6/Wn6S7uI+TV0mFcA9UQ2fMq6EmkzisrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB28+8wIvfrlWe/Da016EqUzG+awDJwKtMttCJGmiOA=;
 b=az8jjfCmTNGXiFCOrt0kMsSJjL8MithMF9Q3cT1Chi328Nx78AMaTL+2gE4dMPt4ccjcIZZg5F1dgwupOxh+V/oQlTyy7XaoMDgfj8tcPZ01bs8Ag+bshAzDNPFjG3/m0BqKjEEZhwP9PcHE4Fdt6/MPROKPfcR4jfToSByIWGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by AM0PR04MB4753.eurprd04.prod.outlook.com (2603:10a6:208:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Mon, 22 Aug
 2022 22:04:32 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::4448:6a36:9b29:c6d4]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::4448:6a36:9b29:c6d4%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 22:04:32 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] piglit: Add PACKAGECONFIG for glx and opencl
Date: Mon, 22 Aug 2022 17:04:14 -0500
Message-ID: <20220822220414.4164108-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 302dc00f-82a0-46de-e6e7-08da848a4ace
X-MS-TrafficTypeDiagnostic: AM0PR04MB4753:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k2E17reZkhtid2kaKKhMxA6i2b4gal026i7JyEpp9Hmem8CTxIE6f9IZvNmNbncSlIY4gjfqic7vix8r60YRSjBuRwgEJ9dgP7eYS+MUh+u+f8BiTEXWs/trWic2XkPJE38L2wFGaGe/tUj74Ci8cLpRPXtkAsMIn8pHrwo6cgU+vuSrgz8Ab0WdFSrhlSGcK8RZpWyln8aNBvkhhHtq/mhuQcHo6XfGm+jq99T+5BqgmW4l/f0ep6H+6WcUaqYoHxS1k08jyOMpBYhqESGn9T2fkxhgKFDf9WdNTtywy7VwJrBbJoh+RxFT3Olt8Rz7D7+dsS3lwsCdXLTPs38u0RtglauScjGLMYAQYJtPno4bRhInX/EGGc/kYn2TXvZ+a2V1jTwTNBOzqudYWObie6MSJkLCfkPxBw1bcj1QlTpOotjoTikK+4DelrQDPge794MCOkfG6y/CXIWrF+iKFv1aWoqv41kOJqQF2xnQTcs1v9BRya2tFby0MqlYxwqs3GKjQip6jwj7OMVK3Fios07fVI15sI9uBSMLDWcTslkhFLjFHbM2s0yQ6yE+OHaJla4SMKqpK86q14QS+rMuw8/aAKFVJWdjnZbYUKFTynBWOsWLRVN97ZfCycVawILTKAwz8/6QQ5K+FqRf0jX4o2BJ+CKwjErKJLQ2ep0lWkYzM18Um5WWOziy2YhiW/5uBvxprt5w2V4XXJdZgFk8OA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(316002)(6916009)(8676002)(26005)(66946007)(66476007)(66556008)(4326008)(5660300002)(6512007)(8936002)(83380400001)(36756003)(1076003)(86362001)(44832011)(41300700001)(38350700002)(186003)(38100700002)(6506007)(2616005)(478600001)(2906002)(52116002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FjAxv8G9Guedx1T/Nu48rUrPAc6TkcCEiEJObglRbUVQkNsicfC+4meHN7li?=
 =?us-ascii?Q?J9GlSx9EDPV9EN1fCdmC3kQKQ+91n7Wx/8vtWMZvo8dRsGzMfiAEjp+fcuXy?=
 =?us-ascii?Q?3TX35Zp8h4/w/zPc0Oy98c1pc5cwyv4ps8i6sTpjizKzhXwylE4KGNLeC6K1?=
 =?us-ascii?Q?SA3+cqf4kN3tvkBjieVa7huJJDUjsg6KbPiIL2glgvoLcQOVMfXqY9IqWpfN?=
 =?us-ascii?Q?eUeGpMDsxsEUcEwFszSvBB8vvN2TpYMiTFElkwen5qf6z+lc3mXP+E/9y7Mt?=
 =?us-ascii?Q?CcSS4dyZ2ZfBhaJo39q1ckxet7nEbWWf/lpQNoJowLfqKlDkH54KfgohnJIh?=
 =?us-ascii?Q?oLPClD1RUHOhXI81gbi/lcaL3vz5MzB7pTEgUMGvYSAPPPjbrK/rvMcVXo4W?=
 =?us-ascii?Q?VXb+uFVfgYpqAFH0wBS6N1YCtfOU8P3RUULigp/YNcvAVYr9QSsUaygu/6WL?=
 =?us-ascii?Q?7G0zfsrjRNYaF1/1n3DRnH5GUm+r7Cg/f1N0UHOL24rx9tE0WJescHagaCEg?=
 =?us-ascii?Q?teCe8e3I6tKxAIdvUcJz6Zzzn2kPUqI3oFV7wZXOeN9bXlUwt2nOyvUyGpJ1?=
 =?us-ascii?Q?9zDkUWvCjPIsNol4OJkCUHV4Cf5GNii5zlWMAejzxSyZEMG+9uMEZOmrKZ9G?=
 =?us-ascii?Q?lNMmqea9GmPfoFRa4fH/wRYWr6fKLi9RN2JASktGyWBqhDZ/04Mu6I0wOWrv?=
 =?us-ascii?Q?ysP4G74fW2U22DmzB2DIggJm3tgtMIhIr4xzfqFys+b85vuy+cBURbT8D3Lo?=
 =?us-ascii?Q?/ZVjG51Ea3TyIm+YRhZ+VXMMsldt1cWqn+QfJDz8YcaMPrGfFCdvSuB0TTqK?=
 =?us-ascii?Q?/UlQFCPpdu2zGU01kN0d5yqvh6N6JuYhAcyDgV+0BAzYlwQ3wx++dp3lapRQ?=
 =?us-ascii?Q?GEgtbhPBFsZyC9A45ssm1u4eOku3WZUfPGulsWMK6zdeXSVDwrDffXxG6HOK?=
 =?us-ascii?Q?1/63kVDBeGF5xmPc2j8qj5PtzePrfonaa8Z4qS3R0Y6MjUygs3n+ivu3U35s?=
 =?us-ascii?Q?Z6//XCfuHg7oOyIdf9Fp5qEyK0MOZGYLs3jwBIvYdVu+iARWZR5lP23noi8c?=
 =?us-ascii?Q?G55ZRdR1tVCeee8oSb+DXtqDfrJwWd4cfiL3BNag2q6EPRyULBFRGlYeEX5d?=
 =?us-ascii?Q?Wx6TsWlcOoHZllvEF4FfzNqy/8YEUX7iYP4BakXJNabEQRDSBB/nWF3n9aQW?=
 =?us-ascii?Q?l2zJXjODjCuch6j1TriBCB5K3Cc0eaICRVYcFW6v+s2yD8t/z2n3q/naG4II?=
 =?us-ascii?Q?XdcZQKGf/fbRLNCRofe5orw1wGJ0IG9C0UKdbzb/ABUFQQA+UKvpvECwBrX/?=
 =?us-ascii?Q?tuGz13NtW/2YtdJ14ZNRJGwnQVoZybD6H0HrN9CRF7bWMeDVPj04RrOMz83c?=
 =?us-ascii?Q?B2wwm2FAU3RQMj/sjydmNscO4ugzHvFnPTD6yU7ERDcGRJMdkIwit0HjjXmz?=
 =?us-ascii?Q?EfJkdVWXAtWuRtQqQ2e7PedYvNj7/X4I7ECwDVmJv3c9KqVzmjXWpZvqxlJ1?=
 =?us-ascii?Q?tmDzNxdrPW2GM63ccn47yFeK2n5Gj0DawZo1tEo195104js14TAXpW/qvYH4?=
 =?us-ascii?Q?cjOwuGcUZPQEfF+YiR+Qs6k9mhgFPgUJQQ7W1mnh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 302dc00f-82a0-46de-e6e7-08da848a4ace
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 22:04:32.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZI56PABH0vhVBFGEiMEv7ALhhJP8/SsYLAl+SN6Xv79J7HL05LaoLUC8boonbNGUzf7EJIrECWuUCKrZBkH9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 22:04:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169687

- Allow GLX tests to be disabled for systems that don't support it.

- Allow OpenCL tests to be enabled.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 ...roper-WAYLAND_INCLUDE_DIRS-variable.patch} |  0
 ...-shader.c-do-not-hardcode-build-pat.patch} |  0
 ...ists.txt-add-missing-endian.h-check.patch} |  0
 ...n-t-enable-GLX-if-tests-are-disabled.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++---
 5 files changed, 39 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/piglit/piglit/{0001-cmake-use-proper-WAYLAND_=
INCLUDE_DIRS-variable.patch =3D> 0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS=
-variable.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0002-tests-util-piglit-shader.=
c-do-not-hardcode-build-pat.patch =3D> 0003-tests-util-piglit-shader.c-do-n=
ot-hardcode-build-pat.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0001-CMakeLists.txt-add-missin=
g-endian.h-check.patch =3D> 0004-CMakeLists.txt-add-missing-endian.h-check.=
patch} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-en=
able-GLX-if-tests-are-disabled.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYL=
AND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-=
cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLA=
ND_INCLUDE_DIRS-variable.patch
rename to meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND=
_INCLUDE_DIRS-variable.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-sha=
der.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit=
/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shad=
er.c-do-not-hardcode-build-pat.patch
rename to meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader=
.c-do-not-hardcode-build-pat.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-mi=
ssing-endian.h-check.patch b/meta/recipes-graphics/piglit/piglit/0004-CMake=
Lists.txt-add-missing-endian.h-check.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-mis=
sing-endian.h-check.patch
rename to meta/recipes-graphics/piglit/piglit/0004-CMakeLists.txt-add-missi=
ng-endian.h-check.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GL=
X-if-tests-are-disabled.patch b/meta/recipes-graphics/piglit/piglit/0005-cm=
ake-Don-t-enable-GLX-if-tests-are-disabled.patch
new file mode 100644
index 0000000000..ef6fda0f4e
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-te=
sts-are-disabled.patch
@@ -0,0 +1,32 @@
+From 13ff43fe760ac343b33d8e8c84b89886aac07116 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Fri, 3 Jun 2022 10:44:29 -0500
+Subject: [PATCH] cmake: Don't enable GLX if tests are disabled
+
+Allow building for systems that don't support GLX.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/m=
erge_requests/720]
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+---
+ CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e1aeb5ddf..85e171aba 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,7 @@ if(PIGLIT_BUILD_CL_TESTS)
+ endif(PIGLIT_BUILD_CL_TESTS)
+=20
+ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+-	if(X11_FOUND AND OPENGL_gl_LIBRARY)
+-		# Assume the system has GLX. In the future, systems may exist
+-		# with libGL and libX11 but no GLX, but that world hasn't
+-		# arrived yet.
++	if(X11_FOUND AND OPENGL_gl_LIBRARY AND PIGLIT_BUILD_GLX_TESTS)
+ 		set(PIGLIT_HAS_GLX True)
+ 		add_definitions(-DPIGLIT_HAS_GLX)
+ 	endif()
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-grap=
hics/piglit/piglit_git.bb
index 7c1bc89c22..29360a246b 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2beded7103a3d=
8a442a2a0391d607b0"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhttps=
;branch=3Dmain \
            file://0001-cmake-install-bash-completions-in-the-right-place.p=
atch \
-           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patc=
h \
-           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pa=
t.patch \
-           file://0001-CMakeLists.txt-add-missing-endian.h-check.patch \
-           "
+           file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patc=
h \
+           file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pa=
t.patch \
+           file://0004-CMakeLists.txt-add-missing-endian.h-check.patch \
+           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SRCREV =3D "6403e90dc7da02d486906cddab8d02c2552a8d46"
@@ -36,8 +36,10 @@ REQUIRED_DISTRO_FEATURES +=3D "opengl"
 export TEMP =3D "${B}/temp/"
 do_compile[dirs] =3D+ "${B}/temp/"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 g=
lx', '', d)}"
 PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0,f=
reeglut,"
+PACKAGECONFIG[glx] =3D "-DPIGLIT_BUILD_GLX_TESTS=3DON,-DPIGLIT_BUILD_GLX_T=
ESTS=3DOFF"
+PACKAGECONFIG[opencl] =3D "-DPIGLIT_BUILD_CL_TESTS=3DON,-DPIGLIT_BUILD_CL_=
TESTS=3DOFF,opencl-icd-loader"
 PACKAGECONFIG[x11] =3D "-DPIGLIT_BUILD_GL_TESTS=3DON,-DPIGLIT_BUILD_GL_TES=
TS=3DOFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_VK_=
TESTS=3DOFF,vulkan-loader"
=20
--=20
2.25.1



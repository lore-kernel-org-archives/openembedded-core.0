Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB57C7EE23
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 01:45:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2790.1684979098061834861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 18:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u2wudBry;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34P1iqi7064844;
	Wed, 24 May 2023 20:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684979092;
	bh=XRgym5OpLGt9BhyhxI3s+pgYyNDd/I0L30k7Z7zv5DQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u2wudBry1vpkXiza6OBGw8USTGT9Gs80Hb93L5zVu0OcucWfdSU5elBIMG0GKdfTs
	 M/phqH7dcebYg620GMlCWlH6b3cgK0KmFGJXWe5bIxs4MmeqDp404kBchAz8PW6GWw
	 M3+28aYXXAUcxSPT1kBadKNhfQVnXyX2ZgcYo4zk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34P1iqJV121275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 20:44:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 20:44:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 20:44:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34P1ipg3030323;
	Wed, 24 May 2023 20:44:51 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>,
        Tom Hochstein
	<tom.hochstein@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 3/3] piglit: Add missing glslang dependencies
Date: Wed, 24 May 2023 20:44:48 -0500
Message-ID: <20230525014448.486619-4-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525014448.486619-1-rs@ti.com>
References: <20230525014448.486619-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181698

From: Tom Hochstein <tom.hochstein@nxp.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a3c9c5e2e09..78a5d6248a4 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
 PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
-PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
+PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
 
 export PIGLIT_BUILD_DIR = "../../../../git"
 
-- 
2.40.1



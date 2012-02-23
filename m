Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WHw-0006DO-UD
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:40 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so474013eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.28.16 as permitted sender) client-ip=10.14.28.16; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.28.16 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.28.16])
	by 10.14.28.16 with SMTP id f16mr482362eea.121.1329993862046 (num_hops
	= 1); Thu, 23 Feb 2012 02:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=usZ4Y2uOmTdH8skNroqUAwm6eGRTDl1zFDp+QlQUahE=;
	b=WuSEe5ft/81WVZjDRSrc6YcrA+n8H4R1HZkXnuWruQ0CgSgoR521/cuy8HA9dZT2wh
	rKfpB2du901JulBmEGrJ2MSdAH0UBU3MmnPLTHDX0s73anHDaKTMyVd87hDgsYJgx9cM
	vgd2DQP1Bautnj8k2l6F6cJf2HWQeoQr0oeKk=
Received: by 10.14.28.16 with SMTP id f16mr383385eea.121.1329993861967;
	Thu, 23 Feb 2012 02:44:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm3949690eeh.9.2012.02.23.02.44.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:44:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:41 +0100
Message-Id: <ea3ea919fb3a756f384a56066aaa3aaad6d046e4.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] bitbake.conf: introduce SDK_NAME_PREFIX and NATIVESDK_* variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 10:52:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 869b409..4f8d11c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -360,9 +360,20 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
+##################################################################
+# SDK variables, 
+# SDK_NAME/NATIVESDK_NAME and SDKPATH/NATIVESDKPATH need to be 
+# consistent, so if you want to overwrite it, then overwrite both
+##################################################################
+
+SDK_NAME_PREFIX = "oecore"
+SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
 SDKPATH = "/usr/local/${SDK_NAME}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+# for cross-canadian recipe to find nativesdk stuff, there is SDK_ARCH instead of TARGET_ARCH in SDK_NAME
+NATIVESDK_SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${SDK_ARCH}"
+NATIVESDK_SDKPATH = "/usr/local/${NATIVESDK_SDK_NAME}"
+NATIVESDK_SDKPATHNATIVE = "${NATIVESDK_SDKPATH}/sysroots/${SDK_SYS}"
 
 ##################################################################
 # Kernel info.
-- 
1.7.8.4




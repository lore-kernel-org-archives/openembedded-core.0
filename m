Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLJ-0002ZW-FQ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:17 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1340601wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JgF2hCDBmbiEpJNuoOtmY7Pwx3uxDN0sNLKU55LPqAc=;
	b=biTafr2T6osdOTvF9n80mXQeYnuv9qLZrH5WEhiqicWGusZrYoDKtYliNprzknjd5S
	Cdjx+ZxQQqmmJZjk1zYEJiF09xw8E0GOp8RRh6sCKQlsQmieHYfGp/j80uV5FROVp3I3
	eeHXWpSu+ZWycICl934BtR6c4+r4JIby29M/juOlbnE3dQlKn64D1bh8OD4vN7DF2K8P
	+BJp2DGWJBqsDI2G8TjOef4sFCAFpHpLdJl+IC8DFmdZMyFQUuYRQ8J6Im4PMulMOaNs
	USXGMHeW/k0pE0YBygtsgzro1N+2I9giNrdE0UlO6NMlPM6Gj++n+7avJmikq4JLVjxg
	JRWQ==
Received: by 10.180.80.104 with SMTP id q8mr12472052wix.14.1332365785628;
	Wed, 21 Mar 2012 14:36:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm12363375wix.10.2012.03.21.14.36.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:36:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:06 +0100
Message-Id: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/13] bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:17 -0000

* also use weak assignment for SDK_NAME_PREFIX as suggested by khem
* TUNE_PKGARCH is not 100% right too, because such SDK image usually has few
  machine specific packages included (e.g. base-files, securetty, opkg configs)
  but those are not important for SDK users so it's better to have one SDK for
  whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would work the
  same.
  You can see diff between crespo and om-gta04 SDK here:
  http://build.shr-project.org/shr-core/sdk/oecore-i686-armv7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07982d7..20a8d3e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -365,8 +365,8 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 # SDK variables, 
 ##################################################################
 
-SDK_NAME_PREFIX = "oecore"
-SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME_PREFIX ?= "oecore"
+SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
 SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.8.5




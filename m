Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S85AM-0004VS-Ql
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 08:32:06 +0100
Received: by wibhj13 with SMTP id hj13so7249680wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yCFhaSs8wl9G+5rdQHJGui7gAVnLWuiE4M2XIM78UEY=;
	b=OpEGk8G74QCeTgTuBt4Rgm0gjxVtemagEvCRGqayrHlH1uoyTFGOfGBl5IVne1Jc24
	sJGgnp20aNx+eJdlLsXXVSQpiH/yZB2Ai5rRSfyDcuhgxBXwESjQeY2VR4UvPOYix4wj
	hKBUAnVZniaBMJ8EjSnTX4ZSaQE3gyDvaIqBO8XfuGZWUcaCb5ZNWo0EyCJt+ipbkyqb
	O3d0mSzuT9MscSCxV0M27TzDsWpGdXQ0L+lGOliLtrHtlpSgeYu4eNlkFJcBObnzgG2v
	OlLDzJMW86Szyuw/StqEKoz0/HvMQw1ehMZzWhQFME/Cmb1jvLy4mBWVQDwl+mHPbA0W
	R40Q==
Received: by 10.180.19.37 with SMTP id b5mr13022736wie.9.1331796200830;
	Thu, 15 Mar 2012 00:23:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm2952491wib.1.2012.03.15.00.23.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 00:23:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:23:12 +0100
Message-Id: <1331796192-26217-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <CAEsOVNfvxQuWAQCymP4xg4VLSXh4KPTSirLLtrzg_hHh=fuCfQ@mail.gmail.com>
References: <CAEsOVNfvxQuWAQCymP4xg4VLSXh4KPTSirLLtrzg_hHh=fuCfQ@mail.gmail.com>
Subject: [PATCHv2] bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Thu, 15 Mar 2012 07:32:06 -0000

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
index 216da75..01fc52a 100644
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




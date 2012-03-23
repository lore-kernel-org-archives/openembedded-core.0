Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9C-0006uJ-09
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:39:50 +0100
Received: by wibhj13 with SMTP id hj13so2359897wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=y+HvhhBmkRwuP3dn2U/didHmB3q1vCfzKliFcaqaBqM=;
	b=MSVk2Yf+tpv6o/SX6J/YqrZjpKb6r1Pg0axk7PshE42fDFmdwHxgCDMw5gj0NrlQO+
	Mygt5c6bEMe7SLYzw1W6Drr3qrVCZ/CmTq1PIOkiSI4CcjtIDpAMr4JU0XA7HKvvkSQT
	mW431+vpOnKT1364O8QoiAxaGzPHWGMwhqR/Kf+EsRN+7iXOGVvaqbP1zFMSaOHMUatU
	DTh/bmHAvWFdO/FjkDEl9YvceACO47h2TFvpkosl27Rl+kZao/g53leB7ynVaRWcZlOf
	3Ri53zwJyoa2sstadlhedq2V7gR1V/RcWgl03GlXogmb03UWU0ZHgPUaCKjISEiqRX18
	jw9g==
Received: by 10.216.135.106 with SMTP id t84mr8088790wei.74.1332541853538;
	Fri, 23 Mar 2012 15:30:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm17528578wib.0.2012.03.23.15.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:30:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:40 +0100
Message-Id: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 01/10] bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Fri, 23 Mar 2012 22:39:50 -0000

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
index 824ef04..3df0660 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -366,8 +366,8 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
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




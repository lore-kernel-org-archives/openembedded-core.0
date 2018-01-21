Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F3E8662134
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 09:46:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0L9ktS6029674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 21 Jan 2018 09:46:56 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1edCDH-0000H4-Do; Sun, 21 Jan 2018 09:46:55 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 09:46:54 +0000
Message-Id: <1516528014-1010-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] populate_sdk_ext: Set cleandirs correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jan 2018 09:46:57 -0000

The current conflicting use of SDKDEPLOYDIR causes a race between do_populate_sdk
and do_populate_sdk_ext potentially causing the SDK to either go missing or the
build to fail.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4f7100d..d7a0884 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -718,7 +718,7 @@ SDKEXTDEPLOYDIR = "${WORKDIR}/deploy-${PN}-populate-sdk-ext"
 
 SSTATETASKS += "do_populate_sdk_ext"
 SSTATE_SKIP_CREATION_task-populate-sdk-ext = '1'
-do_populate_sdk_ext[cleandirs] = "${SDKDEPLOYDIR}"
+do_populate_sdk_ext[cleandirs] = "${SDKEXTDEPLOYDIR}"
 do_populate_sdk_ext[sstate-inputdirs] = "${SDKEXTDEPLOYDIR}"
 do_populate_sdk_ext[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk_ext[stamp-extra-info] = "${MACHINE}"
-- 
2.7.4



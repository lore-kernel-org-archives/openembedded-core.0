Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJ52v-0005qW-T4
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 18:10:10 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 02 Oct 2012 08:57:09 -0700
Received: by wibhj13 with SMTP id hj13so894148wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 08:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=eOkdmzSFym9p8TTldQQ58pfEmSsmaGDcCEMJWI6rph4=;
	b=FJlBkdRtZiysIvbALMnXRdcyCqJoMcVWhOwxbfpinNv4lweA1O04/uUnc3Lm6Zdqc3
	8nOzNzFCCMRnOIuISz5k8Ag9VyJYlvxx4IBEuhySJu0dLKNakfDp4LEFtquoi+kA80s9
	pe7dqqHLYz89qanO7JnK2Xwb6UzCMHsHvK/shcUICnWWys4X4lW4WtbQ3WFPWo3RQE21
	HonkJTu/nkUhsQuuympuZUbhOwzNM4u3oQe1hGjOPeYBINFKfpawwhkaTM7AOgqJDvB0
	SlcNKqVm5UG89Boou2I7sQp4JzQn3uWsCLYKD1MLUkvi6DXSPuNuAP8oeubFk7h3Mj5I
	zF/w==
Received: by 10.216.217.194 with SMTP id i44mr480836wep.60.1349193427374;
	Tue, 02 Oct 2012 08:57:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ga2sm3057663wib.2.2012.10.02.08.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 08:57:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 16:56:05 +0100
Message-Id: <1349193366-6632-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlX9Na1G+NVa+/RzhSBewDWs58CGj6gbTOPq5UwGrGDSZ7NGCd8PP5fyvoZTxM5/oVog9on
Subject: [PATCH] Revert "initrd: Spawn an emergency shell when something goes wrong"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 16:10:10 -0000

This had nowhere near enough testing...

This reverts commit ffb6928f5783e5202d9849c3a185e29be1d41c63.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 2639308..5682fd1 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -2,17 +2,6 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-emergency_shell()
-{
-    echo "Bug in initramfs /init detected. Dropping to a shell. Good luck!"
-    echo
-    sh
-}
-trap "emergency_shell" 0 2
-
-# exit immediately if a command fails
-set -e
-
 ROOT_MOUNT="/rootfs/"
 ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
-- 
1.7.10




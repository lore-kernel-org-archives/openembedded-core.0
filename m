Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZPco-0003ef-NB
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:45:56 +0200
Received: by wyb34 with SMTP id 34so752411wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 08:41:41 -0700 (PDT)
Received: by 10.227.96.140 with SMTP id h12mr870385wbn.95.1308757301703;
	Wed, 22 Jun 2011 08:41:41 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm535635wbb.49.2011.06.22.08.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 08:41:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 17:41:34 +0200
Message-Id: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: dvhart@linux.intel.com, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] kernel.bbclass: restore kernel-abiversion file
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
X-List-Received-Date: Wed, 22 Jun 2011 15:45:57 -0000

This fixes external module recipes that need $KERNEL_VERSION. It got removed by

    commit a9d41062e24a6b99661b3a5256f369b557433607
    Author: Darren Hart <dvhart@linux.intel.com>
    Date:   Tue Mar 8 17:09:10 2011 -0800

        kernel/bbclass: rework kernel and module classes to allow for building out-of-tree modules

seemingly as an oversight.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1bb69f5..8f9f108 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -123,6 +123,12 @@ kernel_do_install() {
 	install -d $kerneldir
 
 	#
+	# Store the kernel version in sysroots for module-base.bbclass
+	#
+
+	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+
+	#
 	# Copy the entire source tree. In case an external build directory is
 	# used, copy the build directory over first, then copy over the source
 	# dir. This ensures the original Makefiles are used and not the
-- 
1.6.6.1




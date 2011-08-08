Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QqUWR-0003TL-Ei
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 20:25:57 +0200
Received: by gwb11 with SMTP id 11so1800288gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wrbIlLSqHaA7RoUjAGYawMGyEaNqiHOWzI9EXhqeLfM=;
	b=wWpvs/z+GlDNkjW/6BMiV4Kw+e8zW9/lIgTtShNw9sIwm6qUe2JERtgTwy/Vgwm1Yy
	N+HXqR0r6ENHLy2ktjaL3gBAmWGim+f9kM6eBziYiQs2iAmN/aEhSZvQdyfD8IaZT27W
	Qe16HaDSARqDNit8H0wbpSLsTJPUqZSBPhxYc=
Received: by 10.150.169.1 with SMTP id r1mr5807520ybe.216.1312827686492;
	Mon, 08 Aug 2011 11:21:26 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n9sm1792069ybk.24.2011.08.08.11.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Aug 2011 11:21:25 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 13:14:34 -0500
Message-Id: <1312827274-32740-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH] linux 3.0: Add patch from OE to set dto to max value to fix MMC timeouts
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
X-List-Received-Date: Mon, 08 Aug 2011 18:25:57 -0000

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.0/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

diff --git a/recipes-kernel/linux/linux-3.0/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes-kernel/linux/linux-3.0/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
new file mode 100644
index 0000000..8cd314c
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -0,0 +1,33 @@
+From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
+
+This fixes MMC errors due to timeouts on certain SD Cards following suggestions
+to set dto to 14 by Jason Kridner and Steven Kipisz
+
+Details of the issue:
+http://talk.maemo.org/showthread.php?p=1000707#post1000707
+
+This fix was originally proposed by Sukumar Ghoral of TI.
+---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index 9646a75..7443647 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -1049,6 +1049,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 			dto = 14;
+ 	}
+ 
++	/* Set dto to max value of 14 to avoid SD Card timeouts */
++	dto = 14;
++
+ 	reg &= ~DTO_MASK;
+ 	reg |= dto << DTO_SHIFT;
+ 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index f17ebcf..edb8df7 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 SRCREV_pn-${PN} = "94ed5b4788a7cdbe68bc7cb8516972cbebdc8274"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "j"
+MACHINE_KERNEL_PR_append = "k"
 
 FILESPATHPKG_prepend = "linux-3.0:"
 
@@ -195,6 +195,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-3.0.y.git
             file://beagle/0003-HACK-OMAP3-beagle-switch-to-GPTIMER1.patch \
             file://beagle/0004-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
             file://beagle/0005-omap3-Add-basic-support-for-720MHz-part.patch \
+            file://beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
             \
-- 
1.7.0.4




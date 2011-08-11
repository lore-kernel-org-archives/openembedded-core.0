Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QrMPd-0007Qe-08
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 05:58:29 +0200
Received: by gwb11 with SMTP id 11so1107321gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 20:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DI3uXpI4MulQ8+qPwG7A3Wzh39mMkCDevcK8JRAVs74=;
	b=UWJXcsoTwbIqLfPM/rFdSmaeaBukN+fFt6xc65YaqlgszsXwA2LAnkDMXDr0dbPiLX
	50ZTxyb3LlqQ6iaHBI25W5FvZ7+xhzkmFY+8Hhg0WcwuYPWraOrCU5g2Jg+oyoKScaSc
	Kz3gcR+hJ0W92BkRt+zMqzjgz1e7XbV79PS4c=
Received: by 10.150.47.37 with SMTP id u37mr104979ybu.342.1313034837312;
	Wed, 10 Aug 2011 20:53:57 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c6sm398743yhm.44.2011.08.10.20.53.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 20:53:56 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2011 22:46:46 -0500
Message-Id: <1313034407-6961-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: mporter@ti.com, k-kooi@ti.com, s-kipisz2@ti.com, jdk@ti.com
Subject: [meta-ti PATCH 1/2] linux-3.0: rtc-twl: Updated Sakoman patches with newer versions
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
X-List-Received-Date: Thu, 11 Aug 2011 03:58:29 -0000

This fixes all IRQ kernel panics that were showing up on my BeagleBoard-xM

* Refreshed patch that switched to using threaded IRQ (0009-rtc-twl-Switch-to-using-threaded-irq.patch)
* Added patch to fix registration vs init order (0010-fix-registration-vs-init-order.patch)
* Modified batter recharge patch to be applyable with the other changes (0014-rtc-twl-add-support-for-backup-battery-recharge.patch)

Summary of patches added/updated:

[PATCH 1/2] rtc: twl: Use threaded IRQ, remove IRQ enable in interrupt handler
[PATCH 2/2] rtc: twl: Fix registration vs. init order

Relevant Threads:
 http://www.spinics.net/lists/linux-omap/msg54794.html
 http://www.mail-archive.com/linux-omap@vger.kernel.org/msg53176.html

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 ...0009-rtc-twl-Switch-to-using-threaded-irq.patch |   62 ++++++++--
 .../0010-fix-registration-vs-init-order.patch      |  128 ++++++++++++++++++++
 ...l-add-support-for-backup-battery-recharge.patch |   55 ---------
 ...l-add-support-for-backup-battery-recharge.patch |   55 +++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    5 +-
 5 files changed, 235 insertions(+), 70 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.0/sakoman/0010-fix-registration-vs-init-order.patch
 delete mode 100644 recipes-kernel/linux/linux-3.0/sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch
 create mode 100644 recipes-kernel/linux/linux-3.0/sakoman/0014-rtc-twl-add-support-for-backup-battery-recharge.patch

diff --git a/recipes-kernel/linux/linux-3.0/sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch b/recipes-kernel/linux/linux-3.0/sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch
index 59e1f37..750bec8 100644
--- a/recipes-kernel/linux/linux-3.0/sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch
+++ b/recipes-kernel/linux/linux-3.0/sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch
@@ -1,25 +1,61 @@
-From 61f6890ed80c09e40841221d238410a8d9ebace6 Mon Sep 17 00:00:00 2001
-From: Ilkka Koskinen <ilkka.koskinen@nokia.com>
-Date: Wed, 16 Mar 2011 16:07:14 +0000
-Subject: [PATCH 09/13] rtc-twl: Switch to using threaded irq
+From patchwork Wed Jul 27 07:07:20 2011
+Subject: [1/2] rtc: twl: Use threaded IRQ,
+ remove IRQ enable in interrupt handler
+Date: Wed, 27 Jul 2011 07:07:20 -0000
+From: Todd Poynor <toddpoynor@google.com>
+X-Patchwork-Id: 1010862
+Message-Id: <1311750441-5559-1-git-send-email-toddpoynor@google.com>
+To: Alessandro Zummo <a.zummo@towertech.it>
+Cc: rtc-linux@googlegroups.com, linux-omap@vger.kernel.org,
+ linux-kernel@vger.kernel.org, Todd Poynor <toddpoynor@google.com>
+
+IRQs disabled on entry to twl_rtc_interrupt is not a consequence
+of LOCKDEP; both twl6030 and twl4030 explicitly disable IRQs
+before calling the module IRQ handlers.
+
+The ISR should not be enabling IRQs; use a threaded IRQ handler
+instead.
+
+Also fixes warnings:
+
+  WARNING: at kernel/irq/handle.c:130 handle_irq_event_percpu+nnn
+  irq nnn handler twl_rtc_interrupt+nnn enabled interrupts
+
+Signed-off-by: Todd Poynor <toddpoynor@google.com>
 
 ---
- drivers/rtc/rtc-twl.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+drivers/rtc/rtc-twl.c |   14 +++-----------
+ 1 files changed, 3 insertions(+), 11 deletions(-)
 
 diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
-index f9a2799..f3e5045 100644
+index 9a81f77..ece41b9 100644
 --- a/drivers/rtc/rtc-twl.c
 +++ b/drivers/rtc/rtc-twl.c
-@@ -462,7 +462,7 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
+@@ -362,14 +362,6 @@ static irqreturn_t twl_rtc_interrupt(int irq, void *rtc)
+ 	int res;
+ 	u8 rd_reg;
+ 
+-#ifdef CONFIG_LOCKDEP
+-	/* WORKAROUND for lockdep forcing IRQF_DISABLED on us, which
+-	 * we don't want and can't tolerate.  Although it might be
+-	 * friendlier not to borrow this thread context...
+-	 */
+-	local_irq_enable();
+-#endif
+-
+ 	res = twl_rtc_read_u8(&rd_reg, REG_RTC_STATUS_REG);
+ 	if (res)
+ 		goto out;
+@@ -462,9 +454,9 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
  	if (ret < 0)
  		goto out1;
  
 -	ret = request_irq(irq, twl_rtc_interrupt,
+-				IRQF_TRIGGER_RISING,
+-				dev_name(&rtc->dev), rtc);
 +	ret = request_threaded_irq(irq, NULL, twl_rtc_interrupt,
- 				IRQF_TRIGGER_RISING,
- 				dev_name(&rtc->dev), rtc);
++				   IRQF_TRIGGER_RISING,
++				   dev_name(&rtc->dev), rtc);
  	if (ret < 0) {
--- 
-1.6.6.1
-
+ 		dev_err(&pdev->dev, "IRQ is not free.\n");
+ 		goto out1;
diff --git a/recipes-kernel/linux/linux-3.0/sakoman/0010-fix-registration-vs-init-order.patch b/recipes-kernel/linux/linux-3.0/sakoman/0010-fix-registration-vs-init-order.patch
new file mode 100644
index 0000000..16aab35
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/sakoman/0010-fix-registration-vs-init-order.patch
@@ -0,0 +1,128 @@
+From patchwork Wed Jul 27 07:07:21 2011
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [2/2] rtc: twl: Fix registration vs. init order
+Date: Wed, 27 Jul 2011 07:07:21 -0000
+From: Todd Poynor <toddpoynor@google.com>
+X-Patchwork-Id: 1010892
+Message-Id: <1311750441-5559-2-git-send-email-toddpoynor@google.com>
+To: Alessandro Zummo <a.zummo@towertech.it>
+Cc: rtc-linux@googlegroups.com, linux-omap@vger.kernel.org,
+ linux-kernel@vger.kernel.org, Todd Poynor <toddpoynor@google.com>
+
+Only register as an RTC device after the hardware has been
+successfully initialized.  The RTC class driver will call
+back to this driver to read a pending alarm, and other
+drivers watching for new devices on the RTC class may
+read the RTC time upon registration.  Such access might
+occur while the RTC is stopped, prior to clearing
+pending alarms, etc.
+
+The new ordering also avoids leaving the platform
+device drvdata set to an unregistered struct rtc_device *
+on probe errors.
+
+Signed-off-by: Todd Poynor <toddpoynor@google.com>
+
+---
+drivers/rtc/rtc-twl.c |   52 ++++++++++++++++++++++--------------------------
+ 1 files changed, 24 insertions(+), 28 deletions(-)
+
+diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
+index ece41b9..20687d5 100644
+--- a/drivers/rtc/rtc-twl.c
++++ b/drivers/rtc/rtc-twl.c
+@@ -420,24 +420,12 @@ static struct rtc_class_ops twl_rtc_ops = {
+ static int __devinit twl_rtc_probe(struct platform_device *pdev)
+ {
+ 	struct rtc_device *rtc;
+-	int ret = 0;
++	int ret = -EINVAL;
+ 	int irq = platform_get_irq(pdev, 0);
+ 	u8 rd_reg;
+ 
+ 	if (irq <= 0)
+-		return -EINVAL;
+-
+-	rtc = rtc_device_register(pdev->name,
+-				  &pdev->dev, &twl_rtc_ops, THIS_MODULE);
+-	if (IS_ERR(rtc)) {
+-		ret = PTR_ERR(rtc);
+-		dev_err(&pdev->dev, "can't register RTC device, err %ld\n",
+-			PTR_ERR(rtc));
+-		goto out0;
+-
+-	}
+-
+-	platform_set_drvdata(pdev, rtc);
++		goto out1;
+ 
+ 	ret = twl_rtc_read_u8(&rd_reg, REG_RTC_STATUS_REG);
+ 	if (ret < 0)
+@@ -454,14 +442,6 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
+ 	if (ret < 0)
+ 		goto out1;
+ 
+-	ret = request_threaded_irq(irq, NULL, twl_rtc_interrupt,
+-				   IRQF_TRIGGER_RISING,
+-				   dev_name(&rtc->dev), rtc);
+-	if (ret < 0) {
+-		dev_err(&pdev->dev, "IRQ is not free.\n");
+-		goto out1;
+-	}
+-
+ 	if (twl_class_is_6030()) {
+ 		twl6030_interrupt_unmask(TWL6030_RTC_INT_MASK,
+ 			REG_INT_MSK_LINE_A);
+@@ -472,28 +452,44 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
+ 	/* Check RTC module status, Enable if it is off */
+ 	ret = twl_rtc_read_u8(&rd_reg, REG_RTC_CTRL_REG);
+ 	if (ret < 0)
+-		goto out2;
++		goto out1;
+ 
+ 	if (!(rd_reg & BIT_RTC_CTRL_REG_STOP_RTC_M)) {
+ 		dev_info(&pdev->dev, "Enabling TWL-RTC.\n");
+ 		rd_reg = BIT_RTC_CTRL_REG_STOP_RTC_M;
+ 		ret = twl_rtc_write_u8(rd_reg, REG_RTC_CTRL_REG);
+ 		if (ret < 0)
+-			goto out2;
++			goto out1;
+ 	}
+ 
+ 	/* init cached IRQ enable bits */
+ 	ret = twl_rtc_read_u8(&rtc_irq_bits, REG_RTC_INTERRUPTS_REG);
+ 	if (ret < 0)
++		goto out1;
++
++	rtc = rtc_device_register(pdev->name,
++				  &pdev->dev, &twl_rtc_ops, THIS_MODULE);
++	if (IS_ERR(rtc)) {
++		ret = PTR_ERR(rtc);
++		dev_err(&pdev->dev, "can't register RTC device, err %ld\n",
++			PTR_ERR(rtc));
++		goto out1;
++	}
++
++	ret = request_threaded_irq(irq, NULL, twl_rtc_interrupt,
++				   IRQF_TRIGGER_RISING,
++				   dev_name(&rtc->dev), rtc);
++	if (ret < 0) {
++		dev_err(&pdev->dev, "IRQ is not free.\n");
+ 		goto out2;
++	}
+ 
+-	return ret;
++	platform_set_drvdata(pdev, rtc);
++	return 0;
+ 
+ out2:
+-	free_irq(irq, rtc);
+-out1:
+ 	rtc_device_unregister(rtc);
+-out0:
++out1:
+ 	return ret;
+ }
+ 
diff --git a/recipes-kernel/linux/linux-3.0/sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch b/recipes-kernel/linux/linux-3.0/sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch
deleted file mode 100644
index 7afbf33..0000000
--- a/recipes-kernel/linux/linux-3.0/sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 4573fb9d0d830ba76ff4fcf43353989e597f289f Mon Sep 17 00:00:00 2001
-From: Steve Sakoman <steve@sakoman.com>
-Date: Thu, 4 Feb 2010 12:26:22 -0800
-Subject: [PATCH 10/13] rtc-twl: add support for backup battery recharge
-
----
- drivers/rtc/rtc-twl.c |   25 +++++++++++++++++++++++++
- 1 files changed, 25 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
-index f3e5045..1fe1bc9 100644
---- a/drivers/rtc/rtc-twl.c
-+++ b/drivers/rtc/rtc-twl.c
-@@ -30,6 +30,23 @@
- 
- #include <linux/i2c/twl.h>
- 
-+/*
-+ * PM_RECEIVER block register offsets (use TWL4030_MODULE_PM_RECEIVER)
-+ */
-+#define REG_BB_CFG	0x12
-+
-+/* PM_RECEIVER  BB_CFG bitfields */
-+#define BIT_PM_RECEIVER_BB_CFG_BBCHEN           0x10
-+#define BIT_PM_RECEIVER_BB_CFG_BBSEL            0x0C
-+#define BIT_PM_RECEIVER_BB_CFG_BBSEL_2V5        0x00
-+#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3V0        0x04
-+#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3V1        0x08
-+#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3v2        0x0c
-+#define BIT_PM_RECEIVER_BB_CFG_BBISEL           0x03
-+#define BIT_PM_RECEIVER_BB_CFG_BBISEL_25UA      0x00
-+#define BIT_PM_RECEIVER_BB_CFG_BBISEL_150UA     0x01
-+#define BIT_PM_RECEIVER_BB_CFG_BBISEL_500UA     0x02
-+#define BIT_PM_RECEIVER_BB_CFG_BBISEL_1MA       0x03
- 
- /*
-  * RTC block register offsets (use TWL_MODULE_RTC)
-@@ -495,6 +512,14 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
- 	if (ret < 0)
- 		goto out2;
- 
-+	/* enable backup battery charging */
-+	/* use a conservative 25uA @ 3.1V */
-+	ret = twl_i2c_write_u8(TWL4030_MODULE_PM_RECEIVER,
-+		BIT_PM_RECEIVER_BB_CFG_BBCHEN |
-+		BIT_PM_RECEIVER_BB_CFG_BBSEL_3V1 |
-+		BIT_PM_RECEIVER_BB_CFG_BBISEL_25UA,
-+		REG_BB_CFG);
-+
- 	return ret;
- 
- out2:
--- 
-1.6.6.1
-
diff --git a/recipes-kernel/linux/linux-3.0/sakoman/0014-rtc-twl-add-support-for-backup-battery-recharge.patch b/recipes-kernel/linux/linux-3.0/sakoman/0014-rtc-twl-add-support-for-backup-battery-recharge.patch
new file mode 100644
index 0000000..270d0af
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/sakoman/0014-rtc-twl-add-support-for-backup-battery-recharge.patch
@@ -0,0 +1,55 @@
+From 4573fb9d0d830ba76ff4fcf43353989e597f289f Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Thu, 4 Feb 2010 12:26:22 -0800
+Subject: [PATCH 10/13] rtc-twl: add support for backup battery recharge
+
+---
+ drivers/rtc/rtc-twl.c |   25 +++++++++++++++++++++++++
+ 1 files changed, 25 insertions(+), 0 deletions(-)
+
+
+diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
+index a64494e..552446b 100644
+--- a/drivers/rtc/rtc-twl.c
++++ b/drivers/rtc/rtc-twl.c
+@@ -30,7 +30,24 @@
+ 
+ #include <linux/i2c/twl.h>
+ 
+-
++/*
++ * PM_RECEIVER block register offsets (use TWL4030_MODULE_PM_RECEIVER)
++ */
++#define REG_BB_CFG	0x12
++
++/* PM_RECEIVER  BB_CFG bitfields */
++#define BIT_PM_RECEIVER_BB_CFG_BBCHEN           0x10
++#define BIT_PM_RECEIVER_BB_CFG_BBSEL            0x0C
++#define BIT_PM_RECEIVER_BB_CFG_BBSEL_2V5        0x00
++#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3V0        0x04
++#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3V1        0x08
++#define BIT_PM_RECEIVER_BB_CFG_BBSEL_3v2        0x0c
++#define BIT_PM_RECEIVER_BB_CFG_BBISEL           0x03
++#define BIT_PM_RECEIVER_BB_CFG_BBISEL_25UA      0x00
++#define BIT_PM_RECEIVER_BB_CFG_BBISEL_150UA     0x01
++#define BIT_PM_RECEIVER_BB_CFG_BBISEL_500UA     0x02
++#define BIT_PM_RECEIVER_BB_CFG_BBISEL_1MA       0x03
++ 
+ /*
+  * RTC block register offsets (use TWL_MODULE_RTC)
+  */
+@@ -484,6 +501,14 @@ static int __devinit twl_rtc_probe(struct platform_device *pdev)
+ 		goto out2;
+ 	}
+ 
++	/* enable backup battery charging */
++	/* use a conservative 25uA @ 3.1V */
++	ret = twl_i2c_write_u8(TWL4030_MODULE_PM_RECEIVER,
++		BIT_PM_RECEIVER_BB_CFG_BBCHEN |
++		BIT_PM_RECEIVER_BB_CFG_BBSEL_3V1 |
++		BIT_PM_RECEIVER_BB_CFG_BBISEL_25UA,
++		REG_BB_CFG);
++
+ 	platform_set_drvdata(pdev, rtc);
+ 	return 0;
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index edb8df7..718b6af 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 SRCREV_pn-${PN} = "94ed5b4788a7cdbe68bc7cb8516972cbebdc8274"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "k"
+MACHINE_KERNEL_PR_append = "m"
 
 FILESPATHPKG_prepend = "linux-3.0:"
 
@@ -208,10 +208,11 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-3.0.y.git
             file://sakoman/0007-drivers-input-touchscreen-ads7846-return-ENODEV-if-d.patch \
             file://sakoman/0008-Revert-omap2_mcspi-Flush-posted-writes.patch \
             file://sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch \
-            file://sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch \
+            file://sakoman/0010-fix-registration-vs-init-order.patch \
             file://sakoman/0011-soc-codecs-Enable-audio-capture-by-default-for-twl40.patch \
             file://sakoman/0012-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch \
             file://sakoman/0013-omap-mmc-twl4030-move-clock-input-selection-prior-to.patch \
+            file://sakoman/0014-rtc-twl-add-support-for-backup-battery-recharge.patch \
             \
             file://sgx/0001-ARM-L2-Add-and-export-outer_clean_all.patch \
             file://defconfig"
-- 
1.7.0.4




Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E21D723BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:06:55 +0000 (UTC)
Received: from [216.82.249.147] by server-13.bemta-12.messagelabs.com id
	A2/7B-12053-0F628055; Tue, 17 Mar 2015 13:06:56 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-29.messagelabs.com!1426597613!32224849!2
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3427 invoked from network); 17 Mar 2015 13:06:56 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-6.tower-29.messagelabs.com with AES128-SHA encrypted SMTP;
	17 Mar 2015 13:06:56 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 17 Mar 2015 14:06:53 +0100
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.224.2; Tue, 17 Mar 2015 14:06:53 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2015 14:06:50 +0100
Message-ID: <1426597610-1582-2-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1426597610-1582-1-git-send-email-javier.viguera@digi.com>
References: <1426597610-1582-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: [PATCH] udev: remove 'modprobe' local rule
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
X-List-Received-Date: Tue, 17 Mar 2015 13:06:56 -0000
Content-Type: text/plain

Since udev version 176 (udev commit 06316d9) udev switched modprobe
explicit rules by the builtin kmod support.

The rule using the builtin kmod support is in
'/lib/udev/rules.d/80-drivers.rules':

DRIVER!="?*", ENV{MODALIAS}=="?*", IMPORT{builtin}="kmod load $env{MODALIAS}"

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-core/udev/udev/local.rules | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
index 9d4da493f782..d502cdd6ba18 100644
--- a/meta/recipes-core/udev/udev/local.rules
+++ b/meta/recipes-core/udev/udev/local.rules
@@ -13,9 +13,6 @@
 # %% the '%' char itself
 #
 
-# Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
-
 # Create a symlink to any touchscreen input device
 # Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
 # has an EV_ABS value (-a) which is used for touchscreen type devices.


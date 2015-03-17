Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.16])
	by mail.openembedded.org (Postfix) with ESMTP id DDA926AC33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:06:55 +0000 (UTC)
Received: from [216.82.249.147] by server-16.bemta-12.messagelabs.com id
	F0/A7-29523-0F628055; Tue, 17 Mar 2015 13:06:56 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-29.messagelabs.com!1426597613!32224849!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3359 invoked from network); 17 Mar 2015 13:06:55 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-6.tower-29.messagelabs.com with AES128-SHA encrypted SMTP;
	17 Mar 2015 13:06:55 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 17 Mar 2015 14:06:52 +0100
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.224.2; Tue, 17 Mar 2015 14:06:53 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2015 14:06:49 +0100
Message-ID: <1426597610-1582-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: udev error messages on boot
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


Hi all,

This patch fixes an error message that appears sometimes on boot. It seems mostly cosmetic, but annoying nevertheless. It happens probably due to a race condition between two udev rules trying to do the same (the builtin support to load modules in '/lib/udev/rules.d/80-drivers.rules' and the explicit modprobe call in '/etc/udev/rules.d/local.rules').

udevd[135]: '/sbin/modprobe of:NhwmonT<NULL>Cdlg,da9063-hwmon' [286] terminated by signal 61 (Real-time signal 27)
udevd[121]: '/sbin/modprobe of:Nsound-hdmiT<NULL>Cfsl,imx6q-audio-hdmiCfsl,imx-audio-hdmi' [330] terminated by signal 52 (Real-time signal 18)
udevd[124]: '/sbin/modprobe of:NhwmonT<NULL>Cdlg,da9063-hwmon' [298] terminated by signal 61 (Real-time signal 27)
udevd[125]: '/sbin/modprobe of:NgpioT<NULL>Cdlg,da9063-gpio' [330] terminated by signal 114 (Unknown signal 114)
udevd[127]: '/sbin/modprobe of:Ni2cT<NULL>Cfsl,imx6q-i2cCfsl,imx21-i2c' [289] terminated by signal 49 (Real-time signal 15)
udevd[127]: '/sbin/modprobe of:NhwmonT<NULL>Cdlg,da9063-hwmon' [298] terminated by signal 61 (Real-time signal 27)
udevd[124]: '/sbin/modprobe of:NrtcT<NULL>Cdlg,da9063-rtc' [273] terminated by signal 95 (Unknown signal 95)
udevd[126]: '/sbin/modprobe of:NgpioT<NULL>Cdlg,da9063-gpio' [296] terminated by signal 114 (Unknown signal 114)
udevd[125]: '/sbin/modprobe of:NrtcT<NULL>Cdlg,da9063-rtc' [293] terminated by signal 95 (Unknown signal 95)
udevd[126]: '/sbin/modprobe of:NserialT<NULL>Cfsl,imx6q-uartCfsl,imx21-uart' [324] terminated by signal 83 (Unknown signal 83)
udevd[124]: '/sbin/modprobe of:NserialT<NULL>Cfsl,imx6q-uartCfsl,imx21-uart' [329] terminated by signal 83 (Unknown signal 83)
udevd[138]: '/sbin/modprobe of:NserialT<NULL>Cfsl,imx6q-uartCfsl,imx21-uart' [301] terminated by signal 83 (Unknown signal 83)
udevd[127]: '/sbin/modprobe of:Ni2cT<NULL>Cfsl,imx6q-i2cCfsl,imx21-i2c' [305] terminated by signal 53 (Real-time signal 19)
udevd[133]: '/sbin/modprobe of:NledsT<NULL>Cdlg,da9063-leds' [287] terminated by signal 114 (Unknown signal 114)

In this test the error appeared 14 times on a series of 100 loops.

The builtin kmod support was added in udev at version 176, so all openembedded-core maintained revisions (Daisy, Dizzy, master) would benefit from this patch (as they use udev-182).

-
Regards,

Javier Viguera



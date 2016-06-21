Return-Path: <Alex.Gonzalez@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.209])
	by mail.openembedded.org (Postfix) with ESMTP id A33606FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:40:41 +0000 (UTC)
Received: from [216.82.241.132] by server-17.bemta-8.messagelabs.com id
	54/38-24177-55E59675; Tue, 21 Jun 2016 15:33:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsXi5LtOQDc0LjP
	cYNo+IYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPu/TbWgsVsFUue3WVtYJzJ2sXIxSEksJpR
	on93MwuEs4ZRYu6lJWwQzhZGic8H1wNlODnYBHQkpuw/DGRzcIgI6Elc/ScKEhYWiJTY8noCI
	4jNIqAq8fnzfTYQm1fATeL41rtgtoSAnMTl6Q+g4oISJ2c+ARvJLCAhcfDFC2YQW0hAWWLLig
	uMEPUKEmsPnGeCsE0kLl7dDTXHUOL7rG8sELa0xN6+hcwTGAVmIRk7C8nYBYxMqxg1ilOLylK
	LdI2M9JKKMtMzSnITM3N0DQ0s9HJTi4sT01NzEpOK9ZLzczcxAgOxnoGBcQfj7vPuhxglOZiU
	RHmZlTPChfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwrojJDBcSLEpNT61Iy8wBxgRMWoKDR0mE9
	xVImre4IDG3ODMdInWKUZdjwY/ba5mEWPLy81KlxHkXghQJgBRllObBjYDF5yVGWSlhXkYGBg
	YhnoLUotzMElT5V4ziHIxKwrwfQKbwZOaVwG16BXQEE9ARy/rTQY4oSURISTUwTjZ1l7/dfe0
	Xz+sPYaysk85OYeZap/jNp6XfSOaOXxrvhRcLLa7oaQa3a/+szxHL7ju56MvEWU/+971YsFI4
	zXfigYi3fz8ztzw4/kbtRezksJlCKrXf7Q4wFVmEzjvl+ERB8O873pdn7FbHHH8lc/X1Ws5X9
	Sd3srC8/RGWf01vzqzGmMNB55VYijMSDbWYi4oTARYmi1rKAgAA
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-5.tower-45.messagelabs.com!1466523218!30052112!2
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 8.46; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15310 invoked from network); 21 Jun 2016 15:33:41 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-5.tower-45.messagelabs.com with SMTP;
	21 Jun 2016 15:33:41 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 21 Jun 2016 10:33:36 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 21 Jun 2016 10:33:36 -0500
Received: from log-linux-hp-agonzal.digi.com (10.101.2.214) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.279.2; Tue, 21 Jun 2016 17:33:34 +0200
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2016 17:32:38 +0200
Message-ID: <1466523159-12619-1-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.214]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [RFC PATCH] Do not override defconfig targets on multiple u-boot builds
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
X-List-Received-Date: Tue, 21 Jun 2016 15:40:41 -0000
Content-Type: text/plain

This is just an RFC and is only build tested.

When using the multiple u-boot build feature, several directories are created,
one per machine being built. These directories have the same name as its
corresponding defconfig, for example machine_defconfig.

The result is that when a "make machine_defconfig" is performed, it results in:

make[1]: `machine_defconfig' is up to date.

Instead of creating a new .config based on the defconfig as the make
target is intended to do.

This is a RFC as it is my impression that this behaviour is not desired,
but it does not currently break anything.

Alex Gonzalez (1):
  u-boot.inc: Do not override defconfig targets on multiple u-boot
    builds.

 meta/recipes-bsp/u-boot/u-boot.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)



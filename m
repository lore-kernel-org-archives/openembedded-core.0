Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E74AB737FE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 18:13:35 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so27576700igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vsT8ae042swQcTeYsSFxlP1UqIy2mr+/8MGw1+F8Df4=;
	b=Z6hqs0HvmZlvNnQtlo2RvKaaOItRi5pQhbpd9r2T8GmI7F2ayCmYIL2xkVElJRocqH
	hOgMlqHJ7y9uDLjWfzvL9cqOlxcEQe0p9noR4qvkuAhJ3RMrVQtI+VOoEdn921tREiEU
	rx6I+4wF3ZiUmohUQhcVn7R4trQ3BBz+qYR7Gjss5/d/x9mKxm8y+Tq5hHhz8iVUeFtp
	R0vwgrWBTkwDUDcupDt8hM6GfYmG4r/vlUZ8Bfl+rncQlegcuxsBx0NdJbYliqzzYTe0
	a7jeCcKKXKkNiqT+fFijWUroAzdYT2gm5nsjEbFiEnB0vqMIIe4VbB2X+NOQkMZ53kmL
	Ej5A==
X-Received: by 10.50.137.37 with SMTP id qf5mr24972275igb.1.1428344016548;
	Mon, 06 Apr 2015 11:13:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id l197sm3142852iol.1.2015.04.06.11.13.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 11:13:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 11:13:21 -0700
Message-Id: <1428344001-32479-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428344001-32479-1-git-send-email-armccurdy@gmail.com>
References: <1428344001-32479-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] libpcap.inc: consolidate inherit and PACKAGECONFIG lines
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
X-List-Received-Date: Mon, 06 Apr 2015 18:13:38 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 6f2c985..9b059d7 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,25 +10,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-inherit bluetooth pkgconfig
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
-PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
-PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
-PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
-
 INC_PR = "r5"
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz"
 
 BINCONFIG = "${bindir}/pcap-config"
 
-inherit autotools binconfig-disabled
+inherit autotools binconfig-disabled pkgconfig bluetooth
 
 EXTRA_OECONF = "--with-pcap=linux"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
 
 CPPFLAGS_prepend = "-I${S} "
 CFLAGS_prepend = "-I${S} "
-- 
1.9.1


